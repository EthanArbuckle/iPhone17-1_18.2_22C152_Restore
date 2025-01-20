@interface MBSCacheEnumerator
+ (id)enumeratorWithStmt:(id)a3 block:(id)a4;
- (MBSCacheEnumerator)initWithStmt:(id)a3 block:(id)a4;
- (id)nextObject;
- (void)close;
- (void)dealloc;
@end

@implementation MBSCacheEnumerator

+ (id)enumeratorWithStmt:(id)a3 block:(id)a4
{
  v4 = [[MBSCacheEnumerator alloc] initWithStmt:a3 block:a4];
  return v4;
}

- (MBSCacheEnumerator)initWithStmt:(id)a3 block:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MBSCacheEnumerator;
  v6 = [(MBSCacheEnumerator *)&v8 init];
  if (v6)
  {
    v6->_stmt = (MBSCacheStmt *)a3;
    v6->_block = [a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  [(MBSCacheEnumerator *)self close];
  v3.receiver = self;
  v3.super_class = (Class)MBSCacheEnumerator;
  [(MBSCacheEnumerator *)&v3 dealloc];
}

- (id)nextObject
{
  if (self->_closed) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBSCacheEnumerator.m" lineNumber:36 description:@"Cache enumerator is closed"];
  }
  objc_super v3 = (void *)(*((uint64_t (**)(void))self->_block + 2))();
  if (!v3) {
    [(MBSCacheEnumerator *)self close];
  }
  return v3;
}

- (void)close
{
  if (!self->_closed)
  {
    [(MBSCacheStmt *)self->_stmt reset];

    self->_stmt = 0;
    self->_block = 0;
    self->_closed = 1;
  }
}

@end