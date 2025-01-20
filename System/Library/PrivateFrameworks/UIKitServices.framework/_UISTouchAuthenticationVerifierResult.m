@interface _UISTouchAuthenticationVerifierResult
- (BOOL)passesSecurityAnalysis;
- (NSString)failureReasons;
- (_UISTouchAuthenticationVerifierResult)initWithPassesSecurityAnalysis:(BOOL)a3 failureReasons:(id)a4;
@end

@implementation _UISTouchAuthenticationVerifierResult

- (_UISTouchAuthenticationVerifierResult)initWithPassesSecurityAnalysis:(BOOL)a3 failureReasons:(id)a4
{
  BOOL v5 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UISTouchAuthenticationVerifierResult;
  v9 = [(_UISTouchAuthenticationVerifierResult *)&v12 init];
  if (v9)
  {
    if (v8 && v5)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:v9 file:@"_UISTouchAuthenticationVerifierResult.m" lineNumber:16 description:@"An event that passes security analysis can not have failure reasons"];
    }
    v9->_passesSecurityAnalysis = v5;
    objc_storeStrong((id *)&v9->_failureReasons, a4);
  }

  return v9;
}

- (BOOL)passesSecurityAnalysis
{
  return self->_passesSecurityAnalysis;
}

- (NSString)failureReasons
{
  return self->_failureReasons;
}

- (void).cxx_destruct
{
}

@end