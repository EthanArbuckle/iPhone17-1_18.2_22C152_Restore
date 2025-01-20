@interface ULWeakProxy
- (Class)class;
- (ULWeakProxy)initWithObject:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)object;
- (void)setClass:(Class)a3;
- (void)setObject:(id)a3;
@end

@implementation ULWeakProxy

- (ULWeakProxy)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULWeakProxy;
  v5 = [(ULWeakProxy *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(ULWeakProxy *)v5 setObject:v4];
    [(ULWeakProxy *)v6 setClass:objc_opt_class()];
  }

  return v6;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = objc_opt_class();

  return (id)[v4 instanceMethodSignatureForSelector:a3];
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (Class)class
{
  return self->_class;
}

- (void)setClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_class, 0);

  objc_destroyWeak(&self->_object);
}

@end