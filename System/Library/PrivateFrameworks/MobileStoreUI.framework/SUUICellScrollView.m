@interface SUUICellScrollView
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SUUICellScrollView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(SUUICellScrollView *, SEL, id, id))Implementation)(v8, a2, v12, v7);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(SUUICellScrollView *, SEL, id, id))Implementation)(v8, a2, v12, v7);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(SUUICellScrollView *, SEL, id, id))Implementation)(v8, a2, v12, v7);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  IMP Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(SUUICellScrollView *, SEL, id, id))Implementation)(v8, a2, v12, v7);
}

@end