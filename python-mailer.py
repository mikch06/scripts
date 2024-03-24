import smtplib, ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import conf.config as c


message = MIMEMultipart("alternative")
message["Subject"] = c.subject
message["From"] = c.sender_email
message["To"] = c.receiver_email

# Create the plain-text and HTML version of your message
text = """\

Hello World!

"""

# Turn these into plain/html MIMEText objects
part1 = MIMEText(text, "plain")
##part2 = MIMEText(html, "html")

# Add HTML/plain-text parts to MIMEMultipart message
# The email client will try to render the last part first
message.attach(part1)
##message.attach(part2)

# Create secure connection with server and send email
context = ssl.create_default_context()
with smtplib.SMTP_SSL("mail.cyon.ch", 465, context=context) as server:
    server.login(c.smtp_user, c.smtp_password)
    server.sendmail(
        c.sender_email, c.receiver_email, message.as_string()
    )
