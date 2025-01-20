@interface UIHoverHighlightEffect
+ (UIHoverHighlightEffect)effect;
+ (id)_effectWithTintColor:(id)a3;
- (UIHoverHighlightEffect)init;
@end

@implementation UIHoverHighlightEffect

- (UIHoverHighlightEffect)init
{
  return (UIHoverHighlightEffect *)sub_185A32C90((char *)self, (uint64_t)a2, &OBJC_IVAR___UIHoverHighlightEffect_tintColor, (objc_class **)off_1E52D3A68);
}

+ (UIHoverHighlightEffect)effect
{
  return (UIHoverHighlightEffect *)sub_1858B5A80((uint64_t)a1, (uint64_t)a2, &qword_1E8FB0B38, (void **)&qword_1E8FD5A90);
}

+ (id)_effectWithTintColor:(id)a3
{
  return sub_185A32D54((uint64_t)a1, (uint64_t)a2, a3, (Class *)off_1E52D3A68, &OBJC_IVAR___UIHoverHighlightEffect_tintColor);
}

- (void).cxx_destruct
{
}

@end