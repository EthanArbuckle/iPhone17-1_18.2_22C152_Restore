@interface IMPerformSelectorProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (IMPerformSelectorProxy)initWithTarget:(id)a3;
- (NSMutableDictionary)signatures;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)target;
- (id)weakTarget;
- (void)forwardInvocation:(id)a3;
- (void)performSelector:(SEL)a3 withObject:(id)a4 afterDelay:(double)a5;
- (void)performSelector:(SEL)a3 withObject:(id)a4 afterDelay:(double)a5 inModes:(id)a6;
- (void)setSignatures:(id)a3;
- (void)setWeakTarget:(id)a3;
- (void)teardown;
@end

@implementation IMPerformSelectorProxy

- (IMPerformSelectorProxy)initWithTarget:(id)a3
{
  objc_storeWeak(&self->_weakTarget, a3);
  v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  signatures = self->_signatures;
  self->_signatures = v4;

  return self;
}

- (void)performSelector:(SEL)a3 withObject:(id)a4 afterDelay:(double)a5
{
  id v8 = a4;
  id v9 = +[NSArray arrayWithObject:NSDefaultRunLoopMode];
  [(IMPerformSelectorProxy *)self performSelector:a3 withObject:v8 afterDelay:v9 inModes:a5];
}

- (void)performSelector:(SEL)a3 withObject:(id)a4 afterDelay:(double)a5 inModes:(id)a6
{
  id v11 = a6;
  id v12 = a4;
  id v16 = +[NSString stringWithUTF8String:sel_getName(a3)];
  v13 = -[NSMutableDictionary objectForKey:](self->_signatures, "objectForKey:");

  if (!v13)
  {
    v14 = [(IMPerformSelectorProxy *)self target];
    v15 = [v14 methodSignatureForSelector:a3];

    [(NSMutableDictionary *)self->_signatures setObject:v15 forKey:v16];
  }
  ((void (*)(IMPerformSelectorProxy *, SEL, SEL, id, id, double))+[NSObject instanceMethodForSelector:a2])(self, a2, a3, v12, v11, a5);
}

- (void)teardown
{
  objc_storeWeak(&self->_weakTarget, 0);

  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector())
  {
    char v5 = 1;
  }
  else
  {
    v6 = [(IMPerformSelectorProxy *)self target];
    if (v6)
    {
      char v5 = objc_opt_respondsToSelector();
    }
    else
    {
      v7 = +[NSString stringWithUTF8String:sel_getName(a3)];
      id v8 = [(NSMutableDictionary *)self->_signatures objectForKey:v7];
      char v5 = v8 != 0;
    }
  }
  return v5 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = +[NSString stringWithUTF8String:sel_getName(a3)];
  char v5 = [(NSMutableDictionary *)self->_signatures objectForKey:v4];

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 methodSignature];
  int v5 = strcmp((const char *)[v4 methodReturnType], "@");

  if (!v5)
  {
    uint64_t v6 = 0;
    [v3 setReturnValue:&v6];
  }
}

- (id)target
{
  id v2 = objc_loadWeakRetained(&self->_weakTarget);

  return v2;
}

- (id)weakTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakTarget);

  return WeakRetained;
}

- (void)setWeakTarget:(id)a3
{
}

- (NSMutableDictionary)signatures
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSignatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);

  objc_destroyWeak(&self->_weakTarget);
}

@end