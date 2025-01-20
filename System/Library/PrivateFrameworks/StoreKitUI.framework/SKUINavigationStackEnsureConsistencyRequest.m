@interface SKUINavigationStackEnsureConsistencyRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)operationDidComplete;
- (SKUINavigationStackEnsureConsistencyRequest)initWithNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4;
- (int64_t)navigationControllerOperation;
- (unint64_t)hash;
@end

@implementation SKUINavigationStackEnsureConsistencyRequest

- (SKUINavigationStackEnsureConsistencyRequest)initWithNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUINavigationStackEnsureConsistencyRequest initWithNavigationControllerOperation:operationDidComplete:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUINavigationStackEnsureConsistencyRequest;
  result = [(SKUINavigationStackEnsureConsistencyRequest *)&v8 init];
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
  v4 = (SKUINavigationStackEnsureConsistencyRequest *)a3;
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

- (void)initWithNavigationControllerOperation:operationDidComplete:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUINavigationStackEnsureConsistencyRequest initWithNavigationControllerOperation:operationDidComplete:]";
}

@end