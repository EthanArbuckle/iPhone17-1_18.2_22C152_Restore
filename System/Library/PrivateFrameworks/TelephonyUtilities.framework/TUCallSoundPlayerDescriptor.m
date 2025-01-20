@interface TUCallSoundPlayerDescriptor
- (BOOL)audioPlayingWarmupNeeded;
- (NSNumber)sound;
- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 call:(id)a4;
- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 provider:(id)a4 video:(BOOL)a5 region:(int64_t)a6;
- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 provider:(id)a4 video:(BOOL)a5 region:(int64_t)a6 audioPlayingWarmupNeeded:(BOOL)a7;
- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 sound:(id)a4 iterations:(unint64_t)a5 pauseDuration:(double)a6 audioPlayingWarmupNeeded:(BOOL)a7;
- (double)pauseDuration;
- (id)description;
- (int64_t)soundType;
- (unint64_t)iterations;
- (void)setAudioPlayingWarmupNeeded:(BOOL)a3;
- (void)setIterations:(unint64_t)a3;
- (void)setPauseDuration:(double)a3;
- (void)setSound:(id)a3;
- (void)setSoundType:(int64_t)a3;
@end

@implementation TUCallSoundPlayerDescriptor

- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 sound:(id)a4 iterations:(unint64_t)a5 pauseDuration:(double)a6 audioPlayingWarmupNeeded:(BOOL)a7
{
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TUCallSoundPlayerDescriptor;
  v14 = [(TUCallSoundPlayerDescriptor *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_soundType = a3;
    objc_storeStrong((id *)&v14->_sound, a4);
    v15->_iterations = a5;
    v15->_pauseDuration = a6;
    v15->_audioPlayingWarmupNeeded = a7;
  }

  return v15;
}

- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 call:(id)a4
{
  id v6 = a4;
  v7 = [v6 provider];
  uint64_t v8 = [v6 isVideo];
  uint64_t v9 = [v6 soundRegion];

  v10 = [(TUCallSoundPlayerDescriptor *)self initWithSoundType:a3 provider:v7 video:v8 region:v9 audioPlayingWarmupNeeded:0];
  return v10;
}

- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 provider:(id)a4 video:(BOOL)a5 region:(int64_t)a6
{
  return [(TUCallSoundPlayerDescriptor *)self initWithSoundType:a3 provider:a4 video:a5 region:a6 audioPlayingWarmupNeeded:0];
}

- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 provider:(id)a4 video:(BOOL)a5 region:(int64_t)a6 audioPlayingWarmupNeeded:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a4;
  id v13 = v12;
  double v14 = 0.0;
  v15 = &unk_1EED24408;
  uint64_t v16 = 1;
  switch(a3)
  {
    case 1:
      uint64_t v16 = -1;
      if (([v12 isFaceTimeProvider] & 1) == 0)
      {
        v15 = &unk_1EED242E8;
        switch(a6)
        {
          case 0:
          case 1:
            goto LABEL_30;
          case 2:
            v15 = &unk_1EED24300;
            goto LABEL_30;
          case 3:
            v15 = &unk_1EED24318;
            goto LABEL_30;
          case 4:
            v15 = &unk_1EED24330;
            goto LABEL_30;
          case 5:
            v15 = &unk_1EED24348;
            goto LABEL_30;
          default:
            goto LABEL_34;
        }
      }
      v15 = &unk_1EED242D0;
      goto LABEL_30;
    case 2:
      if ([v12 isFaceTimeProvider]) {
        goto LABEL_9;
      }
      goto LABEL_34;
    case 3:
      if (([v12 isTelephonyProvider] & 1) == 0) {
        goto LABEL_34;
      }
      v15 = &unk_1EED24378;
      uint64_t v16 = 3;
      goto LABEL_30;
    case 4:
      if ([v12 isFaceTimeProvider]) {
        v15 = &unk_1EED24390;
      }
      else {
        v15 = &unk_1EED243A8;
      }
      double v14 = 3.0;
      goto LABEL_19;
    case 5:
      if (![v12 isFaceTimeProvider] || !a5) {
        goto LABEL_34;
      }
      double v14 = 3.0;
      v15 = &unk_1EED243C0;
LABEL_19:
      uint64_t v16 = 2;
      goto LABEL_30;
    case 6:
    case 7:
      if ([v12 isFaceTimeProvider]) {
        v15 = &unk_1EED243D8;
      }
      else {
        v15 = &unk_1EED243F0;
      }
      goto LABEL_29;
    case 8:
      goto LABEL_30;
    case 9:
      v15 = &unk_1EED24420;
      goto LABEL_29;
    case 10:
      v15 = &unk_1EED24438;
      goto LABEL_29;
    case 11:
      v15 = &unk_1EED24450;
      goto LABEL_29;
    case 12:
      v15 = &unk_1EED24468;
      goto LABEL_29;
    case 13:
    case 16:
    case 17:
      v15 = &unk_1EED24480;
      goto LABEL_29;
    case 15:
LABEL_9:
      v15 = &unk_1EED24360;
      goto LABEL_29;
    case 18:
      v15 = &unk_1EED24498;
      goto LABEL_29;
    case 19:
      v15 = &unk_1EED244B0;
      goto LABEL_29;
    case 20:
      v15 = &unk_1EED244C8;
      goto LABEL_29;
    case 21:
      v15 = &unk_1EED244E0;
      goto LABEL_29;
    case 22:
      v15 = &unk_1EED244F8;
LABEL_29:
      uint64_t v16 = 1;
LABEL_30:
      objc_super v17 = [(TUCallSoundPlayerDescriptor *)self initWithSoundType:a3 sound:v15 iterations:v16 pauseDuration:v7 audioPlayingWarmupNeeded:v14];
      break;
    default:
LABEL_34:

      objc_super v17 = 0;
      break;
  }

  return v17;
}

- (id)description
{
  if ([(TUCallSoundPlayerDescriptor *)self iterations] == -1)
  {
    v3 = @"Infinite";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[TUCallSoundPlayerDescriptor iterations](self, "iterations"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  int64_t v6 = [(TUCallSoundPlayerDescriptor *)self soundType];
  BOOL v7 = [(TUCallSoundPlayerDescriptor *)self sound];
  [(TUCallSoundPlayerDescriptor *)self pauseDuration];
  uint64_t v9 = [v4 stringWithFormat:@"<%@ %p soundType=%lu sound=%@ iterations=%@ pauseDuration=%f>", v5, self, v6, v7, v3, v8];

  return v9;
}

- (int64_t)soundType
{
  return self->_soundType;
}

- (void)setSoundType:(int64_t)a3
{
  self->_soundType = a3;
}

- (BOOL)audioPlayingWarmupNeeded
{
  return self->_audioPlayingWarmupNeeded;
}

- (void)setAudioPlayingWarmupNeeded:(BOOL)a3
{
  self->_audioPlayingWarmupNeeded = a3;
}

- (NSNumber)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
}

- (double)pauseDuration
{
  return self->_pauseDuration;
}

- (void)setPauseDuration:(double)a3
{
  self->_pauseDuration = a3;
}

- (void).cxx_destruct
{
}

@end