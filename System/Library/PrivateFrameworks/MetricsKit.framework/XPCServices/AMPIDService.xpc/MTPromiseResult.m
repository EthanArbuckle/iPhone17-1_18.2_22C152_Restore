@interface MTPromiseResult
- (MTPromiseResult)initWithResult:(id)a3 error:(id)a4;
- (NSError)error;
- (id)result;
@end

@implementation MTPromiseResult

- (MTPromiseResult)initWithResult:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTPromiseResult;
  v9 = [(MTPromiseResult *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_result, a3);
    v11 = (NSError *)[v8 copy];
    error = v10->_error;
    v10->_error = v11;
  }
  return v10;
}

- (NSError)error
{
  return self->_error;
}

- (id)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end