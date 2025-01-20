@interface PROPlugInFirewall
+ (id)methodSignatureForSelector:(SEL)a3;
- (PROPlugInFirewall)initWithProtectedObject:(id)a3 protocol:(id)a4 secondaryProtocol:(id)a5 errorHandler:(id)a6;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)protectedObject;
- (void)dealloc;
- (void)doesNotRecognizeSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation PROPlugInFirewall

- (PROPlugInFirewall)initWithProtectedObject:(id)a3 protocol:(id)a4 secondaryProtocol:(id)a5 errorHandler:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PROPlugInFirewall;
  result = [(PROPlugInFirewall *)&v11 init];
  if (result)
  {
    result->errorHandler = (PROPlugInFirewallErrorHandler *)a6;
    result->protectedObject = a3;
    result->protocol = (Protocol *)a4;
    result->secondaryProtocol = (Protocol *)a5;
  }
  return result;
}

- (void)dealloc
{
  self->errorHandler = 0;
  self->protectedObject = 0;
  v2.receiver = self;
  v2.super_class = (Class)PROPlugInFirewall;
  [(PROPlugInFirewall *)&v2 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<[*%@ (%s)*]>", self->protectedObject, protocol_getName(self->protocol)];
}

- (id)protectedObject
{
  return self->protectedObject;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PROPlugInFirewall;
  id result = -[PROPlugInFirewall methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!result
    && (!(unint64_t)protocol_getMethodDescription(self->protocol, a3, 1, 1).name
     && !(unint64_t)protocol_getMethodDescription(self->secondaryProtocol, a3, 1, 1).name
     || (id result = (id)[self->protectedObject methodSignatureForSelector:a3]) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)PROPlugInFirewall;
    return [(PROPlugInFirewall *)&v6 methodSignatureForSelector:sel_deadMethod];
  }
  return result;
}

- (void)forwardInvocation:(id)a3
{
  v5 = (const char *)[a3 selector];
  if (((unint64_t)protocol_getMethodDescription(self->protocol, v5, 1, 1).name
     || (unint64_t)protocol_getMethodDescription(self->secondaryProtocol, v5, 1, 1).name)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id protectedObject = self->protectedObject;
    [a3 invokeWithTarget:protectedObject];
  }
  else
  {
    [(PROPlugInFirewall *)self doesNotRecognizeSelector:v5];
  }
}

+ (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PROPlugInFirewall;
  id result = objc_msgSendSuper2(&v7, sel_methodSignatureForSelector_);
  if (!result)
  {
    [a1 doesNotRecognizeSelector:a3];
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___PROPlugInFirewall;
    return objc_msgSendSuper2(&v6, sel_methodSignatureForSelector_, sel_deadMethod);
  }
  return result;
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
}

@end