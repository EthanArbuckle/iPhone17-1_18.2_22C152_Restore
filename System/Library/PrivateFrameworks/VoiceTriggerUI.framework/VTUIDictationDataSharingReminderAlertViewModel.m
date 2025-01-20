@interface VTUIDictationDataSharingReminderAlertViewModel
- (NSString)confirmationButtonTitle;
- (NSString)message;
- (NSString)title;
- (void)setConfirmationButtonTitle:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VTUIDictationDataSharingReminderAlertViewModel

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)confirmationButtonTitle
{
  return self->_confirmationButtonTitle;
}

- (void)setConfirmationButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end