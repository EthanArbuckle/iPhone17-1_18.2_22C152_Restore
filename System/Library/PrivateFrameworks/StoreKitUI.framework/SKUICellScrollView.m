@interface SKUICellScrollView
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SKUICellScrollView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUICellScrollView touchesBegan:withEvent:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  id v17 = v7;
  id v18 = v8;
  v19 = self;
  v20 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v20, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(SKUICellScrollView *, SEL, id, id))Implementation)(v19, a2, v17, v18);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUICellScrollView touchesCancelled:withEvent:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  id v17 = v7;
  id v18 = v8;
  v19 = self;
  v20 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v20, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(SKUICellScrollView *, SEL, id, id))Implementation)(v19, a2, v17, v18);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUICellScrollView touchesEnded:withEvent:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  id v17 = v7;
  id v18 = v8;
  v19 = self;
  v20 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v20, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(SKUICellScrollView *, SEL, id, id))Implementation)(v19, a2, v17, v18);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUICellScrollView touchesMoved:withEvent:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  id v17 = v7;
  id v18 = v8;
  v19 = self;
  v20 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v20, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(SKUICellScrollView *, SEL, id, id))Implementation)(v19, a2, v17, v18);
}

- (void)touchesBegan:(uint64_t)a3 withEvent:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)touchesCancelled:(uint64_t)a3 withEvent:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)touchesEnded:(uint64_t)a3 withEvent:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)touchesMoved:(uint64_t)a3 withEvent:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end