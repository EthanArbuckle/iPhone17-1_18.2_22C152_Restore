@interface SUUIWeakReference
- (NSObject)object;
- (void)setObject:(id)a3;
@end

@implementation SUUIWeakReference

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