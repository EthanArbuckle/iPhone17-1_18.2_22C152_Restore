@interface SpatialAudioDataFuzzer
+ (id)sharedInstance;
- (SpatialAudioDataFuzzer)init;
- (id)createNoiseSoundProfileFromData:(id)a3;
@end

@implementation SpatialAudioDataFuzzer

+ (id)sharedInstance
{
  if (qword_100008B30 != -1) {
    dispatch_once(&qword_100008B30, &stru_1000041C0);
  }
  v2 = (void *)qword_100008B28;
  return v2;
}

- (SpatialAudioDataFuzzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SpatialAudioDataFuzzer;
  v2 = [(SpatialAudioDataFuzzer *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)createNoiseSoundProfileFromData:(id)a3
{
  v5 = (IR::IRData *)a3;
  if (v5)
  {
    if (!self->_dataFuzzerStructRef) {
      operator new();
    }
    NoisySoundProfilePack = (void *)IR::IRData::createNoisySoundProfilePack(v5, v4);
    if (self->_dataFuzzerStructRef) {
      operator delete();
    }
    self->_dataFuzzerStructRef = 0;
  }
  else
  {
    NoisySoundProfilePack = 0;
  }

  return NoisySoundProfilePack;
}

@end