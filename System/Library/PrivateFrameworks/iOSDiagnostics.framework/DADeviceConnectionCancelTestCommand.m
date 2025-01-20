@interface DADeviceConnectionCancelTestCommand
- (NSNumber)testID;
- (int64_t)commandType;
- (void)setTestID:(id)a3;
@end

@implementation DADeviceConnectionCancelTestCommand

- (int64_t)commandType
{
  return 1;
}

- (NSNumber)testID
{
  return self->_testID;
}

- (void)setTestID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end