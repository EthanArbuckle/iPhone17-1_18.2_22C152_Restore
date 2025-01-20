@interface JasperDepthProvider
- (BOOL)isSameDevice:(H16ISPDevice *)a3;
- (BOOL)isValid;
- (BOOL)savePeridotCalib:(const void *)a3;
- (JasperDepthProvider)initWithDevice:(H16ISPDevice *)a3 andChannel:(unsigned int)a4 andRemote:(H16ISPServicesRemote *)a5;
- (int)gmoFlowBitmask;
- (unint64_t)onlineConfig:(id)a3;
- (void)setGmoFlowBitmask:(int)a3;
- (void)setJasperFrameRateMax:(float)a3;
- (void)setJasperFrameRateMin:(float)a3;
@end

@implementation JasperDepthProvider

- (JasperDepthProvider)initWithDevice:(H16ISPDevice *)a3 andChannel:(unsigned int)a4 andRemote:(H16ISPServicesRemote *)a5
{
  v14.receiver = self;
  v14.super_class = (Class)JasperDepthProvider;
  result = [(JasperDepthProvider *)&v14 init];
  result->_wakupDone = 1;
  result->_channel = a4;
  result->_pDevice = a3;
  result->_pRemote = a5;
  __asm { FMOV            V0.2S, #30.0 }
  *(void *)&result->_minFrameRate = _D0;
  result->_frameRateChanged = 0;
  result->_gmoFlowBitmask = 0;
  return result;
}

- (void)setJasperFrameRateMin:(float)a3
{
  self->_minFrameRate = a3;
}

- (void)setJasperFrameRateMax:(float)a3
{
  self->_maxFrameRate = a3;
}

- (BOOL)isSameDevice:(H16ISPDevice *)a3
{
  return a3 && self->_pDevice == a3;
}

- (BOOL)savePeridotCalib:(const void *)a3
{
  return H16ISP::savePeridotCalib((H16ISP *)self->_pDevice, (H16ISPDevice *)self->_pRemote, (H16ISPServicesRemote *)LOWORD(self->_channel), (uint64_t)a3, v3);
}

- (unint64_t)onlineConfig:(id)a3
{
  id v4 = a3;
  if ([v4 length] == (id)960)
  {
    unint64_t v5 = sub_1000043D8((uint64_t)self->_pDevice, self->_channel, [v4 bytes]);
  }
  else
  {
    NSLog(@"Bad Peridot online config received from PeridotDepth: Wrong size (got %zu, expected %zu)", [v4 length], 960);
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isValid
{
  return self->_wakupDone;
}

- (int)gmoFlowBitmask
{
  return self->_gmoFlowBitmask;
}

- (void)setGmoFlowBitmask:(int)a3
{
  self->_gmoFlowBitmask = a3;
}

@end