@interface _UITargetedProxy
+ (id)proxyWithTarget:(id)a3;
- (id)_target;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_setTarget:(id)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation _UITargetedProxy

+ (id)proxyWithTarget:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"target must not be nil"];
  }
  id v5 = objc_alloc((Class)a1);
  [v5 _setTarget:v4];

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  Superclass = (objc_class *)objc_opt_class();
  do
  {
    InstanceMethod = class_getInstanceMethod(Superclass, a3);
    if (InstanceMethod)
    {
      v7 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:method_getTypeEncoding(InstanceMethod)];
      goto LABEL_8;
    }
    Superclass = class_getSuperclass(Superclass);
  }
  while (Superclass);
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(id)objc_opt_class() instanceMethodSignatureForSelector:a3],
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = [self->__target methodSignatureForSelector:a3];
  }
LABEL_8:
  return v7;
}

- (void)forwardInvocation:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; target: %@>", v5, self, self->__target];

  return v6;
}

- (id)_target
{
  return self->__target;
}

- (void)_setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end