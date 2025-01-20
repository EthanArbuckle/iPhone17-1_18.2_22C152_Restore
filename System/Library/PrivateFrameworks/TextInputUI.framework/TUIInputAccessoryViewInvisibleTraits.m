@interface TUIInputAccessoryViewInvisibleTraits
- (id)inputAccessoryViewBackdropColor;
- (id)inputAccessoryViewBackdropEffects;
@end

@implementation TUIInputAccessoryViewInvisibleTraits

- (id)inputAccessoryViewBackdropColor
{
  return (id)[MEMORY[0x1E4FB1618] clearColor];
}

- (id)inputAccessoryViewBackdropEffects
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end