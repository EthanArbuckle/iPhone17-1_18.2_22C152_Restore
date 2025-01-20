@interface UIHoverLiftEffect
+ (UIHoverLiftEffect)effect;
+ (id)_effectWithTintColor:(id)a3;
- (UIHoverLiftEffect)init;
@end

@implementation UIHoverLiftEffect

- (UIHoverLiftEffect)init
{
  return (UIHoverLiftEffect *)sub_185A32C90((char *)self, (uint64_t)a2, &OBJC_IVAR___UIHoverLiftEffect_tintColor, (objc_class **)off_1E52D3A70);
}

+ (UIHoverLiftEffect)effect
{
  return (UIHoverLiftEffect *)sub_1858B5A80((uint64_t)a1, (uint64_t)a2, &qword_1E8FB0B40, (void **)&qword_1E8FD5A98);
}

+ (id)_effectWithTintColor:(id)a3
{
  return sub_185A32D54((uint64_t)a1, (uint64_t)a2, a3, (Class *)off_1E52D3A70, &OBJC_IVAR___UIHoverLiftEffect_tintColor);
}

- (void).cxx_destruct
{
}

@end