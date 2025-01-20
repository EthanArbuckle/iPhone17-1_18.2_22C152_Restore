@interface SKUIWeakReference
- (NSObject)object;
- (void)setObject:(id)a3;
@end

@implementation SKUIWeakReference

- (NSObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end