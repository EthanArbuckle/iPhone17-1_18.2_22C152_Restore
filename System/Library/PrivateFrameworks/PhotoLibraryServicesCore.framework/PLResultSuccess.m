@interface PLResultSuccess
- (BOOL)isFailure;
- (BOOL)isSuccess;
- (PLResultSuccess)initWithResult:(id)a3;
- (id)description;
- (id)error;
- (id)result;
- (id)resultWithError:(id *)a3;
@end

@implementation PLResultSuccess

- (BOOL)isFailure
{
  return 0;
}

- (BOOL)isSuccess
{
  return 1;
}

- (PLResultSuccess)initWithResult:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLResult.m", 95, @"Invalid parameter not satisfying: %@", @"result != nil" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PLResultSuccess;
  v7 = [(PLResult *)&v12 initForSubclasses];
  v8 = (PLResultSuccess *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    v9 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p> success: %@", v5, self, self->_result];

  return v6;
}

- (id)resultWithError:(id *)a3
{
  return self->_result;
}

- (id)error
{
  return 0;
}

- (id)result
{
  return self->_result;
}

@end