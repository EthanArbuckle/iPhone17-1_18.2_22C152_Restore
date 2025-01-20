@interface IPPSessionDelegate
- (IPPSessionDelegate)initWithClientID:(int)a3;
- (id)getLogCategory;
- (id)getLogLeader;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didCreateTask:(id)a4;
@end

@implementation IPPSessionDelegate

- (IPPSessionDelegate)initWithClientID:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IPPSessionDelegate;
  result = [(IPPSessionDelegate *)&v5 init];
  if (result) {
    result->_clientID = a3;
  }
  return result;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v4 = a4;
  objc_super v5 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 userInfo];
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "IPPSession invalidated: %{public}@ - %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  id v4 = a4;
  objc_super v5 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IPPSession didCreateTask: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)getLogLeader
{
  if (self->_clientID) {
    +[NSString stringWithFormat:@"%@<%p> { client %d }", objc_opt_class(), self, self->_clientID];
  }
  else {
  v2 = +[NSString stringWithFormat:@"GlobalSession<%p>", self, v4, v5];
  }

  return v2;
}

- (id)getLogCategory
{
  return PKLogCategoryNetwork[0];
}

@end