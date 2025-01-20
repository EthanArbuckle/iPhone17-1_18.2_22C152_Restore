@interface VTUIDictationDataSharingOptInAlertViewModel
- (NSString)learnMoreButtonTitle;
- (NSString)message;
- (NSString)optInButtonTitle;
- (NSString)optOutButtonTitle;
- (NSString)title;
- (void)setLearnMoreButtonTitle:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOptInButtonTitle:(id)a3;
- (void)setOptOutButtonTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VTUIDictationDataSharingOptInAlertViewModel

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

- (NSString)optInButtonTitle
{
  return self->_optInButtonTitle;
}

- (void)setOptInButtonTitle:(id)a3
{
}

- (NSString)learnMoreButtonTitle
{
  return self->_learnMoreButtonTitle;
}

- (void)setLearnMoreButtonTitle:(id)a3
{
}

- (NSString)optOutButtonTitle
{
  return self->_optOutButtonTitle;
}

- (void)setOptOutButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optOutButtonTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreButtonTitle, 0);
  objc_storeStrong((id *)&self->_optInButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end