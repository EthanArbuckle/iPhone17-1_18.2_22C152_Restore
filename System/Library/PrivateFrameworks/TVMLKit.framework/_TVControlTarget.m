@interface _TVControlTarget
+ (void)addTargetInControl:(id)a3 withViewElement:(id)a4;
- (_TVControlTarget)initWithViewElement:(id)a3;
- (void)_action:(id)a3;
@end

@implementation _TVControlTarget

+ (void)addTargetInControl:(id)a3 withViewElement:(id)a4
{
  id object = a3;
  id v6 = a4;
  v7 = objc_getAssociatedObject(object, "AssociatedTarget");
  if (v7) {
    [object removeTarget:v7 action:sel__action_ forControlEvents:64];
  }
  v8 = (void *)[objc_alloc((Class)a1) initWithViewElement:v6];

  [object addTarget:v8 action:sel__action_ forControlEvents:64];
  objc_setAssociatedObject(object, "AssociatedTarget", v8, (void *)0x301);
}

- (_TVControlTarget)initWithViewElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVControlTarget;
  id v6 = [(_TVControlTarget *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_element, a3);
  }

  return v7;
}

- (void)_action:(id)a3
{
}

- (void).cxx_destruct
{
}

@end