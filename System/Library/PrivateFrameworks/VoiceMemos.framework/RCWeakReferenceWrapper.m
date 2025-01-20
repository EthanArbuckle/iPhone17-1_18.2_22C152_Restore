@interface RCWeakReferenceWrapper
+ (id)withReference:(id)a3;
- (id)weakReference;
- (void)setWeakReference:(id)a3;
@end

@implementation RCWeakReferenceWrapper

- (void).cxx_destruct
{
}

+ (id)withReference:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(RCWeakReferenceWrapper);
  [(RCWeakReferenceWrapper *)v4 setWeakReference:v3];

  return v4;
}

- (void)setWeakReference:(id)a3
{
}

- (id)weakReference
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakReference);
  return WeakRetained;
}

@end