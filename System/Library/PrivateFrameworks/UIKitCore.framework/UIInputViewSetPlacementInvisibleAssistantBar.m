@interface UIInputViewSetPlacementInvisibleAssistantBar
+ (id)placementWithPlacement:(id)a3;
- (BOOL)isCompactAssistantView;
- (BOOL)isFloatingAssistantView;
- (id)applicatorInfoForOwner:(id)a3;
@end

@implementation UIInputViewSetPlacementInvisibleAssistantBar

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
        v12 = "+[UIInputViewSetPlacementInvisibleAssistantBar placementWithPlacement:]";
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "%s: Should not be called with an invisible placement", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &placementWithPlacement____s_category_403) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315138;
        v12 = "+[UIInputViewSetPlacementInvisibleAssistantBar placementWithPlacement:]";
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

- (id)applicatorInfoForOwner:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = [(UIInputViewSetPlacement *)self->super.super._actualPlacement applicatorInfoForOwner:a3];
  v6 = [v4 dictionaryWithDictionary:v5];

  [v6 removeObjectsForKeys:&unk_1ED3F07C0];
  v14[0] = @"AlphaForAssistantBar";
  v7 = NSNumber;
  [(UIInputViewSetPlacementInvisible *)self alpha];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v15[0] = v8;
  v14[1] = @"TransformForAssistantBar";
  v9 = (void *)MEMORY[0x1E4F29238];
  [(UIInputViewSetPlacementInvisible *)self transform];
  v10 = [v9 valueWithCGAffineTransform:v13];
  v15[1] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v6 addEntriesFromDictionary:v11];

  return v6;
}

- (BOOL)isFloatingAssistantView
{
  return [(UIInputViewSetPlacement *)self->super.super._actualPlacement isFloatingAssistantView];
}

- (BOOL)isCompactAssistantView
{
  return [(UIInputViewSetPlacement *)self->super.super._actualPlacement isCompactAssistantView];
}

@end