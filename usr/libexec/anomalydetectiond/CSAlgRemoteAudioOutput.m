@interface CSAlgRemoteAudioOutput
- (CLKappaFeaturesAlgRemoteAudioOutput)c_struct;
- (CSAlgRemoteAudioOutput)initWithTimestamp:(unint64_t)a3 maxRMS:(float)a4 companionAOPTriggerTs:(unint64_t)a5 allCrashesMaxEnergy:(float)a6 allCrashesMaxChaos:(float)a7 allCrashesMaxSaturation:(float)a8 allCrashesEnergyMet:(BOOL)a9 allCrashesChaosMet:(BOOL)a10 allCrashesSaturationMet:(BOOL)a11 allCrashesChaosOrSaturationMet:(BOOL)a12 allCrashesEnergyAndChaosOrSaturationMet:(BOOL)a13 allCrashesPassThru:(BOOL)a14 rolloverCrashesMaxEnergy:(float)a15 rolloverCrashesMaxChaos:(float)a16 rolloverCrashesMaxSaturation:(float)a17 rolloverCrashesEnergyMet:(BOOL)a18 rolloverCrashesChaosMet:(BOOL)a19 rolloverCrashesSaturationMet:(BOOL)a20 rolloverCrashesChaosOrSaturationMet:(BOOL)a21 rolloverCrashesEnergyAndChaosOrSaturationMet:(BOOL)a22 rolloverCrashesPassThru:(BOOL)a23;
- (id).cxx_construct;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation CSAlgRemoteAudioOutput

- (CSAlgRemoteAudioOutput)initWithTimestamp:(unint64_t)a3 maxRMS:(float)a4 companionAOPTriggerTs:(unint64_t)a5 allCrashesMaxEnergy:(float)a6 allCrashesMaxChaos:(float)a7 allCrashesMaxSaturation:(float)a8 allCrashesEnergyMet:(BOOL)a9 allCrashesChaosMet:(BOOL)a10 allCrashesSaturationMet:(BOOL)a11 allCrashesChaosOrSaturationMet:(BOOL)a12 allCrashesEnergyAndChaosOrSaturationMet:(BOOL)a13 allCrashesPassThru:(BOOL)a14 rolloverCrashesMaxEnergy:(float)a15 rolloverCrashesMaxChaos:(float)a16 rolloverCrashesMaxSaturation:(float)a17 rolloverCrashesEnergyMet:(BOOL)a18 rolloverCrashesChaosMet:(BOOL)a19 rolloverCrashesSaturationMet:(BOOL)a20 rolloverCrashesChaosOrSaturationMet:(BOOL)a21 rolloverCrashesEnergyAndChaosOrSaturationMet:(BOOL)a22 rolloverCrashesPassThru:(BOOL)a23
{
  v36.receiver = self;
  v36.super_class = (Class)CSAlgRemoteAudioOutput;
  result = [(CSAlgRemoteAudioOutput *)&v36 init];
  if (result)
  {
    result->_c_struct.timestamp = a3;
    result->_c_struct.maxRMS = a4;
    result->_c_struct.allCrashes.maxEnergy = a6;
    result->_c_struct.allCrashes.maxChaos = a7;
    result->_c_struct.allCrashes.maxSaturation = a8;
    result->_c_struct.allCrashes.energyMet = a9;
    result->_c_struct.allCrashes.chaosMet = a10;
    result->_c_struct.allCrashes.saturationMet = a11;
    result->_c_struct.allCrashes.chaosOrSaturationMet = a12;
    result->_c_struct.allCrashes.energyAndChaosOrSaturationMet = a13;
    result->_c_struct.allCrashes.passThru = a14;
    result->_c_struct.rolloverCrashes.maxEnergy = a15;
    result->_c_struct.rolloverCrashes.maxChaos = a16;
    result->_c_struct.rolloverCrashes.maxSaturation = a17;
    result->_c_struct.rolloverCrashes.energyMet = a18;
    result->_c_struct.rolloverCrashes.chaosMet = a19;
    result->_c_struct.rolloverCrashes.saturationMet = a20;
    result->_c_struct.rolloverCrashes.chaosOrSaturationMet = a21;
    result->_c_struct.rolloverCrashes.energyAndChaosOrSaturationMet = a22;
    result->_c_struct.rolloverCrashes.passThru = a23;
  }
  return result;
}

- (unint64_t)timestamp
{
  return self->_c_struct.timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_c_struct.timestamp = a3;
}

- (CLKappaFeaturesAlgRemoteAudioOutput)c_struct
{
  return &self->_c_struct;
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((_WORD *)self + 28) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *(void *)((char *)self + 30) = 0;
  return self;
}

@end