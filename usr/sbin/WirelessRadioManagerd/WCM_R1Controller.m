@interface WCM_R1Controller
- (BOOL)mRCU15GHzInUse;
- (BOOL)mRCU1PowerOn;
- (BOOL)powerState;
- (WCM_R1Controller)init;
- (int)mRCU1ChannelNum;
- (unsigned)mRCU1CurrentMode;
- (unsigned)mRCU1CycleLength;
- (unsigned)mRCU1FrameFormat;
- (unsigned)mRCU1NbBandMask;
- (unsigned)mRCU1NumberOfCycles;
- (unsigned)mRCU1OnDuration;
- (unsigned)mRCU1UseCaseNum;
- (void)dealloc;
- (void)handlePowerState:(BOOL)a3;
- (void)setMRCU15GHzInUse:(BOOL)a3;
- (void)setMRCU1ChannelNum:(int)a3;
- (void)setMRCU1CurrentMode:(unsigned int)a3;
- (void)setMRCU1CycleLength:(unsigned int)a3;
- (void)setMRCU1FrameFormat:(unsigned int)a3;
- (void)setMRCU1NbBandMask:(unsigned int)a3;
- (void)setMRCU1NumberOfCycles:(unsigned int)a3;
- (void)setMRCU1OnDuration:(unsigned int)a3;
- (void)setMRCU1PowerOn:(BOOL)a3;
- (void)setMRCU1UseCaseNum:(unsigned int)a3;
@end

@implementation WCM_R1Controller

- (unsigned)mRCU1UseCaseNum
{
  return self->_mRCU1FrameFormat;
}

- (BOOL)mRCU1PowerOn
{
  return *((unsigned char *)&self->super.mProcessId + 5);
}

- (unsigned)mRCU1OnDuration
{
  return self->_mRCU1ChannelNum;
}

- (unsigned)mRCU1NbBandMask
{
  return self->_mRCU1CurrentMode;
}

- (unsigned)mRCU1CurrentMode
{
  return self->_mRCU1UseCaseNum;
}

- (int)mRCU1ChannelNum
{
  return *(_DWORD *)&self->_powerState;
}

- (BOOL)mRCU15GHzInUse
{
  return *((unsigned char *)&self->super.mProcessId + 6);
}

- (WCM_R1Controller)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_R1Controller;
  v2 = [(WCM_Controller *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *((unsigned char *)&v2->super.mProcessId + 4) = 0;
    *((unsigned char *)&v2->super.mProcessId + 5) = 0;
    *(_DWORD *)&v2->_powerState = -1;
    v2->_mRCU1ChannelNum = 0;
    v2->_mRCU1OnDuration = 0;
    v2->_mRCU1CycleLength = 0;
    v2->_mRCU1NumberOfCycles = 0;
    v2->_mRCU1FrameFormat = 0;
    *((unsigned char *)&v2->super.mProcessId + 6) = 0;
    v2->_mRCU1UseCaseNum = 0;
  }
  +[WCM_Logging logLevel:2 message:@"RCU1Controller Init"];
  return v3;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:2 message:@"RCU1Controller Dealloc"];
  v3.receiver = self;
  v3.super_class = (Class)WCM_R1Controller;
  [(WCM_Controller *)&v3 dealloc];
}

- (void)handlePowerState:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 4) = a3;
}

- (BOOL)powerState
{
  return *((unsigned char *)&self->super.mProcessId + 4);
}

- (void)setMRCU1PowerOn:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 5) = a3;
}

- (void)setMRCU1ChannelNum:(int)a3
{
  *(_DWORD *)&self->_powerState = a3;
}

- (void)setMRCU1OnDuration:(unsigned int)a3
{
  self->_mRCU1ChannelNum = a3;
}

- (unsigned)mRCU1CycleLength
{
  return self->_mRCU1OnDuration;
}

- (void)setMRCU1CycleLength:(unsigned int)a3
{
  self->_mRCU1OnDuration = a3;
}

- (unsigned)mRCU1NumberOfCycles
{
  return self->_mRCU1CycleLength;
}

- (void)setMRCU1NumberOfCycles:(unsigned int)a3
{
  self->_mRCU1CycleLength = a3;
}

- (unsigned)mRCU1FrameFormat
{
  return self->_mRCU1NumberOfCycles;
}

- (void)setMRCU1FrameFormat:(unsigned int)a3
{
  self->_mRCU1NumberOfCycles = a3;
}

- (void)setMRCU1UseCaseNum:(unsigned int)a3
{
  self->_mRCU1FrameFormat = a3;
}

- (void)setMRCU1CurrentMode:(unsigned int)a3
{
  self->_mRCU1UseCaseNum = a3;
}

- (void)setMRCU1NbBandMask:(unsigned int)a3
{
  self->_mRCU1CurrentMode = a3;
}

- (void)setMRCU15GHzInUse:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 6) = a3;
}

@end