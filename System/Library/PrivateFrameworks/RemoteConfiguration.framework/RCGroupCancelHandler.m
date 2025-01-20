@interface RCGroupCancelHandler
+ (id)groupCancelHandlerWithCancelHandlers:(id)a3;
- (NSArray)cancelHandlers;
- (RCGroupCancelHandler)initWithCancelHandlers:(id)a3;
- (void)cancel;
- (void)setCancelHandlers:(id)a3;
@end

@implementation RCGroupCancelHandler

+ (id)groupCancelHandlerWithCancelHandlers:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCancelHandlers:v4];

  return v5;
}

- (RCGroupCancelHandler)initWithCancelHandlers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCGroupCancelHandler;
  v5 = [(RCGroupCancelHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    cancelHandlers = v5->_cancelHandlers;
    v5->_cancelHandlers = (NSArray *)v6;
  }
  return v5;
}

- (void)cancel
{
  id v2 = [(RCGroupCancelHandler *)self cancelHandlers];
  [v2 makeObjectsPerformSelector:sel_cancel];
}

- (NSArray)cancelHandlers
{
  return self->_cancelHandlers;
}

- (void)setCancelHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end