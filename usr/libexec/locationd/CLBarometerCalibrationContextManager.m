@interface CLBarometerCalibrationContextManager
- (CLBarometerCalibrationContextManager)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (CLBarometerCalibrationTrack)fTrack;
- (void)dealloc;
- (void)setFTrack:(id)a3;
@end

@implementation CLBarometerCalibrationContextManager

- (CLBarometerCalibrationContextManager)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CLBarometerCalibrationContextManager;
  v11 = [(CLBarometerCalibrationContextManager *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_universe = (CLIntersiloUniverse *)a3;
    v11->_delegate = (CLBarometerCalibrationContextClient *)a4;
    v11->fDataBuffers = a5;
    v11->_sourceAggregator = (CLBarometerCalibrationSourceAggregator *)a6;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v12 file:@"CLBarometerCalibrationContextManager.mm" lineNumber:137 description:@"Expected delegate to conform to CLBarometerCalibrationContextClient"];
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v12 file:@"CLBarometerCalibrationContextManager.mm" lineNumber:138 description:@"Expected delegate to conform to CLBarometerCalibrationContextClient"];
    }
  }
  return v12;
}

- (void)dealloc
{
  self->_sourceAggregator = 0;
  self->_universe = 0;
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CLBarometerCalibrationContextManager;
  [(CLBarometerCalibrationContextManager *)&v2 dealloc];
}

- (CLBarometerCalibrationTrack)fTrack
{
  return self->_fTrack;
}

- (void)setFTrack:(id)a3
{
}

@end