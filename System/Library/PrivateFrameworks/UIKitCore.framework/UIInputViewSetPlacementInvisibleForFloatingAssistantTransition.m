@interface UIInputViewSetPlacementInvisibleForFloatingAssistantTransition
+ (id)placementWithPlacement:(id)a3;
- (BOOL)isCompactAssistantView;
- (BOOL)isFloatingAssistantView;
- (CGAffineTransform)transform;
- (double)alpha;
- (id)subPlacements;
@end

@implementation UIInputViewSetPlacementInvisibleForFloatingAssistantTransition

+ (id)placementWithPlacement:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 isVisible] & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v11 = 136315138;
        v12 = "+[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:]";
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "%s: Should not be called with an invisible placement", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &placementWithPlacement____s_category_395) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315138;
        v12 = "+[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:]";
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%s: Should not be called with an invisible placement", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  v6 = (id *)objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 5, a3);
  }

  return v7;
}

- (BOOL)isFloatingAssistantView
{
  return [(UIInputViewSetPlacement *)self->super.super._actualPlacement isFloatingAssistantView];
}

- (BOOL)isCompactAssistantView
{
  return [(UIInputViewSetPlacement *)self->super.super._actualPlacement isCompactAssistantView];
}

- (id)subPlacements
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [(UIInputViewSetPlacement *)self->super.super._actualPlacement subPlacements];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
    if (!cachedSecondaryPlacement)
    {
      v6 = [(UIInputViewSetPlacement *)self->super.super._actualPlacement subPlacements];
      v7 = [v6 firstObject];
      v8 = +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:v7];
      v9 = self->_cachedSecondaryPlacement;
      self->_cachedSecondaryPlacement = v8;

      cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
    }
    v12[0] = cachedSecondaryPlacement;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (double)alpha
{
  return 0.0;
}

- (CGAffineTransform)transform
{
  if (!_AXSReduceMotionReduceSlideTransitionsEnabled()
    && ([(UIInputViewSetPlacement *)self->super.super._actualPlacement isFloatingAssistantView]|| [(UIInputViewSetPlacement *)self->super.super._actualPlacement accessoryViewWillAppear]))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIInputViewSetPlacementInvisibleForFloatingAssistantTransition;
    [(CGAffineTransform *)&v7 transform];
    return CGAffineTransformScale(retstr, &v8, 0.92, 0.92);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIInputViewSetPlacementInvisibleForFloatingAssistantTransition;
    return (CGAffineTransform *)[(CGAffineTransform *)&v6 transform];
  }
}

- (void).cxx_destruct
{
}

@end