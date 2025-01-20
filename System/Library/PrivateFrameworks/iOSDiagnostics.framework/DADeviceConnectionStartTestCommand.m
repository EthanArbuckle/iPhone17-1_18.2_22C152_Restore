@interface DADeviceConnectionStartTestCommand
- (DKDiagnosticParameters)parameters;
- (NSNumber)testID;
- (id)completion;
- (int64_t)commandType;
- (void)setCompletion:(id)a3;
- (void)setParameters:(id)a3;
- (void)setTestID:(id)a3;
@end

@implementation DADeviceConnectionStartTestCommand

- (int64_t)commandType
{
  return 0;
}

- (NSNumber)testID
{
  return self->_testID;
}

- (void)setTestID:(id)a3
{
}

- (DKDiagnosticParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
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
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_testID, 0);
}

@end