@interface SXImageComponent
+ (id)typeString;
- (BOOL)shouldBeExposedToAssistiveTechnology;
- (NSAttributedString)captionWithLocalizedRoleForSpeaking;
- (unint64_t)traits;
@end

@implementation SXImageComponent

+ (id)typeString
{
  return @"image";
}

- (BOOL)shouldBeExposedToAssistiveTechnology
{
  v2 = [(SXImageComponent *)self captionWithLocalizedRoleForSpeaking];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (NSAttributedString)captionWithLocalizedRoleForSpeaking
{
  BOOL v3 = [(SXComponent *)self classification];
  v4 = [v3 accessibilityContextualLabel];

  if ([v4 length])
  {
    v5 = [(SXImageComponent *)self caption];
    if ([v5 length])
    {
      v6 = [(SXImageComponent *)self caption];
      v7 = [v6 sxaxAttributedStringWithLowPitchPrefix:v4];

LABEL_11:
      goto LABEL_12;
    }
    uint64_t v12 = [v4 sxaxLowPitchAttributedString];
LABEL_10:
    v7 = (void *)v12;
    goto LABEL_11;
  }
  v8 = [(SXImageComponent *)self accessibilityCaption];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v11 = [(SXImageComponent *)self accessibilityCaption];
LABEL_9:
    v5 = (void *)v11;
    uint64_t v12 = [v10 initWithString:v11];
    goto LABEL_10;
  }
  v13 = [(SXImageComponent *)self caption];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    id v10 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v11 = [(SXImageComponent *)self caption];
    goto LABEL_9;
  }
  v7 = 0;
LABEL_12:

  return (NSAttributedString *)v7;
}

- (unint64_t)traits
{
  return 8;
}

@end