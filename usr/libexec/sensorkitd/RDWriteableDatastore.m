@interface RDWriteableDatastore
- (void)dealloc;
@end

@implementation RDWriteableDatastore

- (void)dealloc
{
  self->_context = 0;
  v3.receiver = self;
  v3.super_class = (Class)RDWriteableDatastore;
  [(RDWriteableDatastore *)&v3 dealloc];
}

@end