@interface UIInputViewSetPlacementInvisibleForFloatingTransition
+ (id)placementWithPlacement:(id)a3;
+ (id)placementWithPlacement:(id)a3 forFloatingAssistantViewTransition:(BOOL)a4;
- (BOOL)isFloatingAssistantView;
- (BOOL)isHiddenForFloatingTransition;
- (BOOL)showsEditItems;
- (id)assistantView;
@end

@implementation UIInputViewSetPlacementInvisibleForFloatingTransition

+ (id)placementWithPlacement:(id)a3
{
  return (id)[a1 placementWithPlacement:a3 forFloatingAssistantViewTransition:0];
}

+ (id)placementWithPlacement:(id)a3 forFloatingAssistantViewTransition:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (([v7 isVisible] & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v13 = 136315138;
        v14 = "+[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:forFloatingAssistantViewTransition:]";
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "%s: Should not be called with an invisible placement", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &placementWithPlacement_forFloatingAssistantViewTransition____s_category)+ 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315138;
        v14 = "+[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:forFloatingAssistantViewTransition:]";
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "%s: Should not be called with an invisible placement", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  id v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)v8 + 5, a3);
    v9[48] = a4;
  }

  return v9;
}

- (BOOL)isHiddenForFloatingTransition
{
  return 1;
}

- (BOOL)showsEditItems
{
  if (self->_isFloatingAssistantView) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewSetPlacementInvisibleForFloatingTransition;
  return [(UIInputViewSetPlacementWrapper *)&v3 showsEditItems];
}

- (id)assistantView
{
  return [(UIInputViewSetPlacement *)self->super.super._actualPlacement assistantView];
}

- (BOOL)isFloatingAssistantView
{
  return self->_isFloatingAssistantView;
}

@end