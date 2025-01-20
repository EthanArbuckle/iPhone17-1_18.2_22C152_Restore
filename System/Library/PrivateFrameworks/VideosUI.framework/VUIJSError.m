@interface VUIJSError
- (NSError)wrappedError;
- (VUIJSError)initWithError:(id)a3 appContext:(id)a4;
- (id)code;
- (id)description;
- (id)domain;
- (id)failureReason;
- (id)recoverySuggestion;
- (id)underlyingError;
- (id)userInfo;
@end

@implementation VUIJSError

- (VUIJSError)initWithError:(id)a3 appContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(VUIJSObject *)self initWithAppContext:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wrappedError, a3);
    v11 = [(NSError *)v10->_wrappedError userInfo];
    v12 = [v11 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v12)
    {
      v13 = [[VUIJSError alloc] initWithError:v12 appContext:v8];
      jsUnderlyingError = v10->_jsUnderlyingError;
      v10->_jsUnderlyingError = v13;

      v15 = [v8 jsContext];
      v16 = [v15 virtualMachine];
      [v16 addManagedReference:v10->_jsUnderlyingError withOwner:v10];
    }
  }

  return v10;
}

- (id)code
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  v3 = [(VUIJSError *)self wrappedError];
  v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "code"));

  return v4;
}

- (id)domain
{
  v2 = [(VUIJSError *)self wrappedError];
  v3 = [v2 domain];

  return v3;
}

- (id)description
{
  v2 = [(VUIJSError *)self wrappedError];
  v3 = [v2 localizedDescription];

  return v3;
}

- (id)failureReason
{
  v2 = [(VUIJSError *)self wrappedError];
  v3 = [v2 localizedFailureReason];

  return v3;
}

- (id)recoverySuggestion
{
  v2 = [(VUIJSError *)self wrappedError];
  v3 = [v2 localizedRecoverySuggestion];

  return v3;
}

- (id)userInfo
{
  v2 = [(VUIJSError *)self wrappedError];
  v3 = [v2 userInfo];

  return v3;
}

- (id)underlyingError
{
  return self->_jsUnderlyingError;
}

- (NSError)wrappedError
{
  return self->_wrappedError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedError, 0);
  objc_storeStrong((id *)&self->_jsUnderlyingError, 0);
}

@end