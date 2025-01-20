@interface UIInputViewSetPlacementInvisible
+ (BOOL)supportsSecureCoding;
+ (id)placementWithPlacement:(id)a3;
- (BOOL)inputViewWillAppear;
- (BOOL)isInteractive;
- (BOOL)isUndocked;
- (BOOL)isVisible;
- (BOOL)showsInputOrAssistantViews;
- (BOOL)showsInputViews;
- (BOOL)showsKeyboard;
- (CGAffineTransform)transform;
- (double)alpha;
- (id)applicatorInfoForOwner:(id)a3;
@end

@implementation UIInputViewSetPlacementInvisible

+ (id)placementWithPlacement:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isVisible] & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "+[UIInputViewSetPlacementInvisible placementWithPlacement:]";
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "%s: Should not be called with an invisible placement", buf, 0xCu);
      }
    }
    else
    {
      v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &placementWithPlacement____s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "+[UIInputViewSetPlacementInvisible placementWithPlacement:]";
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "%s: Should not be called with an invisible placement", buf, 0xCu);
      }
    }
  }
  if ([v4 isVisible])
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___UIInputViewSetPlacementInvisible;
    objc_msgSendSuper2(&v10, sel_placementWithPlacement_, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isUndocked
{
  return 0;
}

- (BOOL)isVisible
{
  return 0;
}

- (BOOL)showsInputViews
{
  return 0;
}

- (BOOL)showsKeyboard
{
  return 0;
}

- (BOOL)showsInputOrAssistantViews
{
  return 0;
}

- (BOOL)isInteractive
{
  return 0;
}

- (BOOL)inputViewWillAppear
{
  return 0;
}

- (double)alpha
{
  return 0.0;
}

- (CGAffineTransform)transform
{
  result = (CGAffineTransform *)_AXSReduceMotionReduceSlideTransitionsEnabled();
  if (result)
  {
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  }
  else if ([(UIInputViewSetPlacement *)self->super._actualPlacement isFloating])
  {
    v9.receiver = self;
    v9.super_class = (Class)UIInputViewSetPlacementInvisible;
    [(CGAffineTransform *)&v9 transform];
    return CGAffineTransformScale(retstr, &v10, 0.5, 0.5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInputViewSetPlacementInvisible;
    return (CGAffineTransform *)[(CGAffineTransform *)&v8 transform];
  }
  return result;
}

- (id)applicatorInfoForOwner:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = [(UIInputViewSetPlacement *)self->super._actualPlacement applicatorInfoForOwner:a3];
  uint64_t v6 = [v4 dictionaryWithDictionary:v5];

  v14[0] = @"Alpha";
  long long v7 = NSNumber;
  [(UIInputViewSetPlacementInvisible *)self alpha];
  objc_super v8 = objc_msgSend(v7, "numberWithDouble:");
  v15[0] = v8;
  v14[1] = @"Transform";
  objc_super v9 = (void *)MEMORY[0x1E4F29238];
  [(UIInputViewSetPlacementInvisible *)self transform];
  CGAffineTransform v10 = [v9 valueWithCGAffineTransform:v13];
  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v6 addEntriesFromDictionary:v11];

  return v6;
}

@end