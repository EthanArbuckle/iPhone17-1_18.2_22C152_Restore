@interface _PASKVOHandlerTask
- (NSObject)object;
- (NSString)keyPath;
- (id)afterBlock;
- (id)beforeAndAfterBlock;
- (void)setAfterBlock:(id)a3;
- (void)setBeforeAndAfterBlock:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation _PASKVOHandlerTask

- (void).cxx_destruct
{
  objc_storeStrong(&self->_beforeAndAfterBlock, 0);
  objc_storeStrong(&self->_afterBlock, 0);
  objc_destroyWeak((id *)&self->_object);

  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (void)setBeforeAndAfterBlock:(id)a3
{
}

- (id)beforeAndAfterBlock
{
  return self->_beforeAndAfterBlock;
}

- (void)setAfterBlock:(id)a3
{
}

- (id)afterBlock
{
  return self->_afterBlock;
}

- (void)setObject:(id)a3
{
}

- (NSObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  return WeakRetained;
}

- (void)setKeyPath:(id)a3
{
}

- (NSString)keyPath
{
  return self->_keyPath;
}

@end