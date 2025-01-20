@interface CLBackgroundInertialOdometryClientSession
- (CLBackgroundInertialOdometryClientSession)initWithClient:(id)a3 withIdentifier:(id)a4 usingReferenceFrame:(unint64_t)a5 atMachContinuousTime:(double)a6;
- (CLBackgroundInertialOdometryServiceClientProtocol)client;
- (NSString)identifier;
- (void)dealloc;
- (void)setClient:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CLBackgroundInertialOdometryClientSession

- (CLBackgroundInertialOdometryClientSession)initWithClient:(id)a3 withIdentifier:(id)a4 usingReferenceFrame:(unint64_t)a5 atMachContinuousTime:(double)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CLBackgroundInertialOdometryClientSession;
  v10 = [(CLBackgroundInertialOdometryClientSession *)&v12 init];
  if (v10)
  {
    v10->_client = (CLBackgroundInertialOdometryServiceClientProtocol *)a3;
    v10->_identifier = (NSString *)[a4 copy];
    v10->_referenceFrame = a5;
    v10->_sessionStartTime = a6;
  }
  return v10;
}

- (void)dealloc
{
  self->_client = 0;
  self->_identifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBackgroundInertialOdometryClientSession;
  [(CLBackgroundInertialOdometryClientSession *)&v3 dealloc];
}

- (CLBackgroundInertialOdometryServiceClientProtocol)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

@end