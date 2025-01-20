@interface SFSiriDeviceSetupGreetingDetails
- (NSArray)dialogAWordTimings;
- (NSArray)dialogBPhraseTimings;
- (NSArray)dialogCPhraseTimings;
- (NSArray)introWordTimings;
- (NSString)dialogAText;
- (void)setDialogAText:(id)a3;
- (void)setDialogAWordTimings:(id)a3;
- (void)setDialogBPhraseTimings:(id)a3;
- (void)setDialogCPhraseTimings:(id)a3;
- (void)setIntroWordTimings:(id)a3;
@end

@implementation SFSiriDeviceSetupGreetingDetails

- (NSArray)introWordTimings
{
  return self->_introWordTimings;
}

- (void)setIntroWordTimings:(id)a3
{
}

- (NSString)dialogAText
{
  return self->_dialogAText;
}

- (void)setDialogAText:(id)a3
{
}

- (NSArray)dialogAWordTimings
{
  return self->_dialogAWordTimings;
}

- (void)setDialogAWordTimings:(id)a3
{
}

- (NSArray)dialogBPhraseTimings
{
  return self->_dialogBPhraseTimings;
}

- (void)setDialogBPhraseTimings:(id)a3
{
}

- (NSArray)dialogCPhraseTimings
{
  return self->_dialogCPhraseTimings;
}

- (void)setDialogCPhraseTimings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogCPhraseTimings, 0);
  objc_storeStrong((id *)&self->_dialogBPhraseTimings, 0);
  objc_storeStrong((id *)&self->_dialogAWordTimings, 0);
  objc_storeStrong((id *)&self->_dialogAText, 0);

  objc_storeStrong((id *)&self->_introWordTimings, 0);
}

@end