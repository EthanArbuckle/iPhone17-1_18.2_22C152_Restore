@interface FCGroupCancelHandler
+ (id)groupCancelHandlerWithCancelHandlers:(id)a3;
- (FCGroupCancelHandler)initWithCancelHandlers:(id)a3;
- (NSArray)cancelHandlers;
- (void)cancel;
- (void)setCancelHandlers:(id)a3;
@end

@implementation FCGroupCancelHandler

+ (id)groupCancelHandlerWithCancelHandlers:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCancelHandlers:v4];

  return v5;
}

- (FCGroupCancelHandler)initWithCancelHandlers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCGroupCancelHandler;
  v5 = [(FCGroupCancelHandler *)&v9 init];
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
  id v2 = [(FCGroupCancelHandler *)self cancelHandlers];
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