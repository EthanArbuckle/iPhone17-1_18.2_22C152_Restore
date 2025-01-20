@interface BRCSubscriber
- (NSArray)keys;
- (id)callback;
- (id)object;
- (void)setCallback:(id)a3;
- (void)setKeys:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation BRCSubscriber

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (NSArray)keys
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeys:(id)a3
{
}

- (id)callback
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_keys, 0);

  objc_destroyWeak(&self->_object);
}

@end