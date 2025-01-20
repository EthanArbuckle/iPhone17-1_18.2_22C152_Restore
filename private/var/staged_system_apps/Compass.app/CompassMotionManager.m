@interface CompassMotionManager
- (BOOL)configuredForTesting;
- (CMDeviceMotion)deviceMotion;
- (CompassMotionManager)init;
- (double)deviceMotionUpdateInterval;
- (id)testMotion;
- (void)generateTestDeviceMotionArray;
- (void)setConfiguredForTesting:(BOOL)a3;
- (void)setDeviceMotionUpdateInterval:(double)a3;
- (void)startDeviceMotionUpdatesUsingReferenceFrame:(unint64_t)a3;
- (void)stopDeviceMotionUpdates;
@end

@implementation CompassMotionManager

- (CompassMotionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CompassMotionManager;
  v2 = [(CompassMotionManager *)&v6 init];
  if (v2)
  {
    v3 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    CMManager = v2->_CMManager;
    v2->_CMManager = v3;
  }
  return v2;
}

- (CMDeviceMotion)deviceMotion
{
  if ([(CompassMotionManager *)self configuredForTesting]) {
    [(CompassMotionManager *)self testMotion];
  }
  else {
  v3 = [(CMMotionManager *)self->_CMManager deviceMotion];
  }

  return (CMDeviceMotion *)v3;
}

- (BOOL)configuredForTesting
{
  return self->_configuredForTesting;
}

- (void)startDeviceMotionUpdatesUsingReferenceFrame:(unint64_t)a3
{
}

- (void)setDeviceMotionUpdateInterval:(double)a3
{
}

- (void)setConfiguredForTesting:(BOOL)a3
{
  BOOL configuredForTesting = self->_configuredForTesting;
  if (configuredForTesting != a3)
  {
    self->_BOOL configuredForTesting = a3;
    BOOL configuredForTesting = a3;
  }
  if (configuredForTesting)
  {
    if (!self->_testMotionArray) {
      [(CompassMotionManager *)self generateTestDeviceMotionArray];
    }
    self->_testMotionIndex = 0;
    self->_testFullRotations = 0;
  }
}

- (void)generateTestDeviceMotionArray
{
  int v3 = 360;
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:360];
  double v4 = 0.0;
  do
  {
    v5 = objc_alloc_init(CompassTestDeviceMotion);
    [(CompassTestDeviceMotion *)v5 setHeading:v4];
    [v8 addObject:v5];

    double v4 = v4 + 1.0;
    --v3;
  }
  while (v3);
  objc_super v6 = (NSArray *)[v8 copy];
  testMotionArray = self->_testMotionArray;
  self->_testMotionArray = v6;
}

- (id)testMotion
{
  testMotionIndex = (char *)self->_testMotionIndex;
  if (testMotionIndex >= (char *)[(NSArray *)self->_testMotionArray count] - 1)
  {
    unint64_t v4 = 0;
    unint64_t v5 = self->_testFullRotations + 1;
    self->_testMotionIndex = 0;
    self->_unint64_t testFullRotations = v5;
  }
  else
  {
    unint64_t v4 = self->_testMotionIndex;
  }
  objc_super v6 = [(NSArray *)self->_testMotionArray objectAtIndex:v4];
  unint64_t testFullRotations = self->_testFullRotations;
  ++self->_testMotionIndex;
  if (testFullRotations)
  {
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"CompassFinishedRotationTestNotification" object:self];
  }

  return v6;
}

- (double)deviceMotionUpdateInterval
{
  [(CMMotionManager *)self->_CMManager deviceMotionUpdateInterval];
  return result;
}

- (void)stopDeviceMotionUpdates
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testMotionArray, 0);

  objc_storeStrong((id *)&self->_CMManager, 0);
}

@end