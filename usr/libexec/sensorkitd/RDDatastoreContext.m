@interface RDDatastoreContext
- (void)dealloc;
@end

@implementation RDDatastoreContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RDDatastoreContext;
  [(RDDatastoreContext *)&v3 dealloc];
}

@end