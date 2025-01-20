@interface _TVProxyWeakContainer
+ (id)weakContainerWithObject:(id)a3;
- (id)object;
- (void)setObject:(id)a3;
@end

@implementation _TVProxyWeakContainer

+ (id)weakContainerWithObject:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_TVProxyWeakContainer);
  [(_TVProxyWeakContainer *)v4 setObject:v3];

  return v4;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end