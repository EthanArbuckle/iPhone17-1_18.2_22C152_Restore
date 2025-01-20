@interface PLResult
+ (id)failureWithError:(id)a3;
+ (id)successWithResult:(id)a3;
- (BOOL)isFailure;
- (BOOL)isSuccess;
- (NSError)error;
- (PLResult)resultWithError:(id *)a3;
- (id)description;
- (id)initForSubclasses;
- (id)result;
- (id)resultByWrappingUnderlyingErrorWithDomain:(id)a3 code:(int64_t)a4 debugDescription:(id)a5;
@end

@implementation PLResult

+ (id)successWithResult:(id)a3
{
  id v3 = a3;
  v4 = [[PLResultSuccess alloc] initWithResult:v3];

  return v4;
}

- (id)initForSubclasses
{
  v3.receiver = self;
  v3.super_class = (Class)PLResult;
  return [(PLResult *)&v3 init];
}

- (id)description
{
  v2 = self;
  PFMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PLResult)resultWithError:(id *)a3
{
  id v3 = self;
  PFMethodNotImplementedException();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (BOOL)isFailure
{
  v2 = self;
  PFMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)isSuccess
{
  v2 = self;
  PFMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSError)error
{
  v2 = self;
  PFMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)result
{
  v2 = self;
  PFMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)resultByWrappingUnderlyingErrorWithDomain:(id)a3 code:(int64_t)a4 debugDescription:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(PLResult *)self isSuccess])
  {
    v10 = self;
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28228]];
    v12 = [(PLResult *)self error];
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28A50]];

    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:v8 code:a4 userInfo:v11];
    v10 = [(id)objc_opt_class() failureWithError:v13];
  }
  return v10;
}

+ (id)failureWithError:(id)a3
{
  id v3 = a3;
  id v4 = [[PLResultFailure alloc] initWithError:v3];

  return v4;
}

@end