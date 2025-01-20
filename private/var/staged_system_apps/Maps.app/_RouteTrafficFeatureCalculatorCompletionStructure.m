@interface _RouteTrafficFeatureCalculatorCompletionStructure
- (OS_dispatch_queue)completionQueue;
- (_RouteTrafficFeatureCalculatorCompletionStructure)initWithQueue:(id)a3 handler:(id)a4;
- (id)completionHandler;
@end

@implementation _RouteTrafficFeatureCalculatorCompletionStructure

- (_RouteTrafficFeatureCalculatorCompletionStructure)initWithQueue:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_RouteTrafficFeatureCalculatorCompletionStructure;
  v9 = [(_RouteTrafficFeatureCalculatorCompletionStructure *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_completionQueue, a3);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;
  }
  return v10;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_completionQueue, 0);
}

@end