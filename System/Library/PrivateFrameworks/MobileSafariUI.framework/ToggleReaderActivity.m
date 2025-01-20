@interface ToggleReaderActivity
- (BOOL)_isDisabled;
- (BOOL)_isEnabled;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (int64_t)actionType;
- (void)performActivityWithTabDocument:(id)a3;
@end

@implementation ToggleReaderActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  v2 = [(TabDocumentActivity *)self tabDocument];
  if ([v2 isShowingReader]) {
    v3 = @"doc.plaintext.fill";
  }
  else {
    v3 = @"doc.plaintext";
  }
  v4 = v3;

  return v4;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F3B0F0];
}

- (int64_t)actionType
{
  return 5;
}

- (BOOL)_isEnabled
{
  return ![(ToggleReaderActivity *)self _isDisabled];
}

- (BOOL)_isDisabled
{
  v2 = [(TabDocumentActivity *)self tabDocument];
  char v3 = [v2 isReaderAvailable] ^ 1;

  return v3;
}

- (void)performActivityWithTabDocument:(id)a3
{
  v4 = [a3 browserController];
  [v4 toggleShowingReaderForUserAction];

  [(_SFActivity *)self activityDidFinish:1];
}

@end