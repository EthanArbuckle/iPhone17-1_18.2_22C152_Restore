@interface PDApplyManagerUpdateApplicationsRequest
- (BOOL)fromPush;
- (PDApplyManagerUpdateApplicationsRequest)initWithFromPush:(BOOL)a3 completion:(id)a4;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setFromPush:(BOOL)a3;
@end

@implementation PDApplyManagerUpdateApplicationsRequest

- (PDApplyManagerUpdateApplicationsRequest)initWithFromPush:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDApplyManagerUpdateApplicationsRequest;
  v7 = [(PDApplyManagerUpdateApplicationsRequest *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_fromPush = a3;
    id v9 = objc_retainBlock(v6);
    id completion = v8->_completion;
    v8->_id completion = v9;
  }
  return v8;
}

- (BOOL)fromPush
{
  return self->_fromPush;
}

- (void)setFromPush:(BOOL)a3
{
  self->_fromPush = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end