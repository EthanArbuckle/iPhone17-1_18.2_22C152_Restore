@interface SpeakerCC
- (SpeakerCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
@end

@implementation SpeakerCC

- (SpeakerCC)initWithParams:(__CFDictionary *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SpeakerCC;
  v4 = [(ComponentControl *)&v11 initWithCC:12 :0];
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, @"%d Speaker ", 12);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    sub_100008280(a3, @"speakerGainFloor", kCFNumberFloatType, &v5->_currentSpeakerGain);
    float currentSpeakerGain = v5->_currentSpeakerGain;
    if (currentSpeakerGain < 0.0 || currentSpeakerGain > 1.0)
    {
      v8 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005C084(v8, currentSpeakerGain);
      }
      v5->_float currentSpeakerGain = 1.0;
    }
    else if (byte_1000AA7A0)
    {
      v9 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v13 = currentSpeakerGain;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Got SpeakerCC gain floor value: %f", buf, 0xCu);
      }
    }
    [(ComponentControl *)v5 updatePowerParameters:a3];
    if (sub_100037D8C(a3, @"expectsCPMSSupport", 0)) {
      [(ComponentControl *)v5 setCPMSMitigationState:1];
    }
  }
  return v5;
}

- (void)defaultAction
{
  unsigned int currentLoadingIndex = self->super.currentLoadingIndex;
  if (currentLoadingIndex != self->super.maxLoadingIndex)
  {
    if (currentLoadingIndex < 0x64)
    {
      float v5 = self->_currentSpeakerGain + (double)currentLoadingIndex / 100.0 * (1.0 - self->_currentSpeakerGain);
      *((float *)&self->super.currentPower + 1) = v5;
      double v4 = v5;
    }
    else
    {
      *(&self->super.currentPower + 1) = 1065353216;
      double v4 = 1.0;
    }
    if (byte_1000AA7A0)
    {
      v6 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        double v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> SpeakerCC: setting gain %.4f", (uint8_t *)&v10, 0xCu);
      }
    }
    v7 = +[AVAudioSession sharedInstance];
    LODWORD(v8) = *(&self->super.currentPower + 1);
    if (([(AVAudioSession *)v7 setSpeakerThermalGain:0 error:v8] & 1) == 0)
    {
      v9 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005C104(v9);
      }
    }
    self->super.maxLoadingIndex = self->super.currentLoadingIndex;
  }
}

- (void)refreshTGraphTelemetry
{
  [+[AVAudioSession sharedInstance] speakerThermalGain];
  float v4 = v3;
  if (v3 < 0.0 || v3 > 1.0)
  {
    *(_DWORD *)&self->super.allowLIOverride = 0;
    v6 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005C148(v6, v4);
    }
  }
  else
  {
    self->_targetSpeakerGain = v3;
    *(_DWORD *)&self->super.allowLIOverride = (int)((float)((float)(v3 - self->_currentSpeakerGain) * 100.0)
                                                  / (1.0 - self->_currentSpeakerGain));
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)SpeakerCC;
  return [(ComponentControl *)&v3 numberOfFields] + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)SpeakerCC;
  if ([(ComponentControl *)&v10 numberOfFields] <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)SpeakerCC;
    unsigned int v6 = [(ComponentControl *)&v8 numberOfFields];
    if (v3 - v6 == 1) {
      v7 = @"SpeakerCC current gain";
    }
    else {
      v7 = 0;
    }
    if (v3 == v6) {
      return @"SpeakerCC target gain";
    }
    else {
      return v7;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SpeakerCC;
    return [(ComponentControl *)&v9 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)SpeakerCC;
  if ([(ComponentControl *)&v11 numberOfFields] > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)SpeakerCC;
    return [(ComponentControl *)&v10 copyFieldCurrentValueForIndex:v3];
  }
  v9.receiver = self;
  v9.super_class = (Class)SpeakerCC;
  int v6 = v3 - [(ComponentControl *)&v9 numberOfFields];
  if (v6 == 1)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 144;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%f", *(float *)((char *)&self->super.super.super.isa + v8));
  }
  if (!v6)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 140;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%f", *(float *)((char *)&self->super.super.super.isa + v8));
  }
  return 0;
}

@end