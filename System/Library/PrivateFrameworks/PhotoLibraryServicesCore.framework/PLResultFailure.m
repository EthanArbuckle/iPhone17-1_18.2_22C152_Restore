@interface PLResultFailure
- (BOOL)isFailure;
- (BOOL)isSuccess;
- (PLResultFailure)initWithError:(id)a3;
- (id)description;
- (id)error;
- (id)result;
- (id)resultWithError:(id *)a3;
@end

@implementation PLResultFailure

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p> failure: %@", v5, self, self->_error];

  return v6;
}

- (id)resultWithError:(id *)a3
{
  if (a3) {
    *a3 = self->_error;
  }
  return 0;
}

- (id)error
{
  return self->_error;
}

- (id)result
{
  return 0;
}

- (BOOL)isFailure
{
  return 1;
}

- (BOOL)isSuccess
{
  return 0;
}

- (PLResultFailure)initWithError:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLResult.m", 148, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PLResultFailure;
  v6 = [(PLResult *)&v12 initForSubclasses];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    error = v6->_error;
    v6->_error = (NSError *)v7;

    v9 = v6;
  }

  return v6;
}

@end