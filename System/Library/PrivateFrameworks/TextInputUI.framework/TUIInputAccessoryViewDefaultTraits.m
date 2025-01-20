@interface TUIInputAccessoryViewDefaultTraits
- (id)inputAccessoryViewBackdropEffects;
@end

@implementation TUIInputAccessoryViewDefaultTraits

- (id)inputAccessoryViewBackdropEffects
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end