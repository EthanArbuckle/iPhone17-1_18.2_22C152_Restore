@interface SUUINavigationStackEnsureConsistencyRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)operationDidComplete;
- (SUUINavigationStackEnsureConsistencyRequest)initWithNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4;
- (int64_t)navigationControllerOperation;
- (unint64_t)hash;
@end

@implementation SUUINavigationStackEnsureConsistencyRequest

- (SUUINavigationStackEnsureConsistencyRequest)initWithNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUUINavigationStackEnsureConsistencyRequest;
  result = [(SUUINavigationStackEnsureConsistencyRequest *)&v7 init];
  if (result)
  {
    result->_navigationControllerOperation = a3;
    result->_operationDidComplete = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_operationDidComplete | (unint64_t)(10 * self->_navigationControllerOperation);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUUINavigationStackEnsureConsistencyRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_navigationControllerOperation == v4->_navigationControllerOperation
      && self->_operationDidComplete == v4->_operationDidComplete;
  }

  return v5;
}

- (int64_t)navigationControllerOperation
{
  return self->_navigationControllerOperation;
}

- (BOOL)operationDidComplete
{
  return self->_operationDidComplete;
}

@end