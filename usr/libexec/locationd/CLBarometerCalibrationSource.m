@interface CLBarometerCalibrationSource
- (CLBarometerCalibrationSource)initWithUniverse:(id)a3 delegate:(id)a4;
- (void)dealloc;
@end

@implementation CLBarometerCalibrationSource

- (CLBarometerCalibrationSource)initWithUniverse:(id)a3 delegate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CLBarometerCalibrationSource;
  v7 = [(CLBarometerCalibrationSource *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_universe = (CLIntersiloUniverse *)a3;
    v7->_delegate = (CLBarometerCalibrationSourceClient *)a4;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v8 file:@"CLBarometerCalibrationSource.mm" lineNumber:22 description:@"Expected delegate to conform to CLBarometerCalibrationSourceClient"];
    }
  }
  return v8;
}

- (void)dealloc
{
  self->_universe = 0;
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CLBarometerCalibrationSource;
  [(CLBarometerCalibrationSource *)&v2 dealloc];
}

@end