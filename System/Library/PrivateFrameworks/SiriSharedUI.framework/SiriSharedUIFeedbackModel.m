@interface SiriSharedUIFeedbackModel
- (NSData)imageRepresentationOfSnippet;
- (NSString)siriDialog;
- (NSString)subFeature;
- (NSString)userInput;
- (int64_t)feedbackDomain;
- (void)setFeedbackDomain:(int64_t)a3;
- (void)setImageRepresentationOfSnippet:(id)a3;
- (void)setSiriDialog:(id)a3;
- (void)setSubFeature:(id)a3;
- (void)setUserInput:(id)a3;
@end

@implementation SiriSharedUIFeedbackModel

- (NSData)imageRepresentationOfSnippet
{
  return self->_imageRepresentationOfSnippet;
}

- (void)setImageRepresentationOfSnippet:(id)a3
{
}

- (int64_t)feedbackDomain
{
  return self->_feedbackDomain;
}

- (void)setFeedbackDomain:(int64_t)a3
{
  self->_feedbackDomain = a3;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (void)setUserInput:(id)a3
{
}

- (NSString)siriDialog
{
  return self->_siriDialog;
}

- (void)setSiriDialog:(id)a3
{
}

- (NSString)subFeature
{
  return self->_subFeature;
}

- (void)setSubFeature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subFeature, 0);
  objc_storeStrong((id *)&self->_siriDialog, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_imageRepresentationOfSnippet, 0);
}

@end