@interface SBUISound
+ (id)soundWithFeedbackEventType:(int64_t)a3;
- (BOOL)isPlaying;
- (BOOL)playInEvironments:(int64_t)a3 completion:(id)a4;
- (NSDictionary)vibrationPattern;
- (NSString)songPath;
- (SBUISound)initWithFeedbackEventType:(int64_t)a3;
- (SBUISound)initWithSystemSoundID:(unsigned int)a3 behavior:(unint64_t)a4 vibrationPattern:(id)a5;
- (SBUISound)initWithSystemSoundPath:(id)a3 behavior:(unint64_t)a4 vibrationPattern:(id)a5;
- (SBUISound)initWithToneAlert:(id)a3;
- (SBUISound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 toneIdentifier:(id)a5 vibrationIdentifier:(id)a6;
- (SBUISound)initWithToneAlertConfiguration:(id)a3;
- (TLAlert)toneAlert;
- (id)_completionBlock;
- (id)description;
- (int64_t)eventType;
- (int64_t)soundType;
- (unint64_t)soundBehavior;
- (unsigned)_resolvedSystemSoundID;
- (unsigned)systemSoundID;
- (void)_setCompletionBlock:(id)a3;
- (void)_setResolvedSoundID:(unsigned int)a3;
- (void)setEventType:(int64_t)a3;
- (void)setSongPath:(id)a3;
- (void)setSoundBehavior:(unint64_t)a3;
- (void)setSoundType:(int64_t)a3;
- (void)setSystemSoundID:(unsigned int)a3;
- (void)setToneAlert:(id)a3;
- (void)setVibrationPattern:(id)a3;
- (void)stop;
@end

@implementation SBUISound

- (SBUISound)initWithSystemSoundID:(unsigned int)a3 behavior:(unint64_t)a4 vibrationPattern:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)SBUISound;
  v9 = [(SBUISound *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(SBUISound *)v9 setSoundType:0];
    [(SBUISound *)v10 setSystemSoundID:v6];
    [(SBUISound *)v10 setSoundBehavior:a4];
    [(SBUISound *)v10 setVibrationPattern:v8];
  }

  return v10;
}

- (SBUISound)initWithSystemSoundPath:(id)a3 behavior:(unint64_t)a4 vibrationPattern:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBUISound;
  v10 = [(SBUISound *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(SBUISound *)v10 setSoundType:0];
    [(SBUISound *)v11 setSongPath:v8];
    [(SBUISound *)v11 setSoundBehavior:a4];
    [(SBUISound *)v11 setVibrationPattern:v9];
  }

  return v11;
}

- (SBUISound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 toneIdentifier:(id)a5 vibrationIdentifier:(id)a6
{
  v10 = (objc_class *)MEMORY[0x263F7FC70];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = (void *)[[v10 alloc] initWithType:a3];
  [v14 setTopic:v13];

  [v14 setToneIdentifier:v12];
  [v14 setVibrationIdentifier:v11];

  v15 = [(SBUISound *)self initWithToneAlertConfiguration:v14];
  return v15;
}

- (SBUISound)initWithToneAlertConfiguration:(id)a3
{
  v4 = [MEMORY[0x263F7FC68] alertWithConfiguration:a3];
  v5 = [(SBUISound *)self initWithToneAlert:v4];

  return v5;
}

- (SBUISound)initWithToneAlert:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUISound;
  v5 = [(SBUISound *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(SBUISound *)v5 setSoundType:3];
    [(SBUISound *)v6 setToneAlert:v4];
  }

  return v6;
}

- (SBUISound)initWithFeedbackEventType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBUISound;
  id v4 = [(SBUISound *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(SBUISound *)v4 setSoundType:5];
    [(SBUISound *)v5 setEventType:a3];
  }
  return v5;
}

+ (id)soundWithFeedbackEventType:(int64_t)a3
{
  v3 = [[SBUISound alloc] initWithFeedbackEventType:a3];

  return v3;
}

- (BOOL)isPlaying
{
  v3 = [NSClassFromString(&cfstr_Sbsoundcontrol.isa) sharedInstance];
  LOBYTE(self) = [v3 isPlaying:self];

  return (char)self;
}

- (BOOL)playInEvironments:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = [NSClassFromString(&cfstr_Sbsoundcontrol.isa) sharedInstance];
  LOBYTE(a3) = [v7 playSound:self environments:a3 completion:v6];

  return a3;
}

- (void)stop
{
  id v3 = [NSClassFromString(&cfstr_Sbsoundcontrol.isa) sharedInstance];
  [v3 stopSound:self];
}

- (id)_completionBlock
{
  v2 = (void *)[self->_completionBlock copy];

  return v2;
}

- (void)_setCompletionBlock:(id)a3
{
  if (self->_completionBlock != a3)
  {
    id v4 = (void *)[a3 copy];
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = v4;
    MEMORY[0x270F9A758](v4, completionBlock);
  }
}

- (id)description
{
  switch([(SBUISound *)self soundType])
  {
    case 0:
      id v3 = NSString;
      if (self->_completionBlock) {
        id v4 = @"YES";
      }
      else {
        id v4 = @"NO";
      }
      uint64_t v5 = [(SBUISound *)self systemSoundID];
      id v6 = [(SBUISound *)self songPath];
      unint64_t v7 = [(SBUISound *)self soundBehavior];
      objc_super v8 = [(SBUISound *)self vibrationPattern];
      id v9 = [v3 stringWithFormat:@"\n   hasCompletionBlock: %@\n   SoundID: %lu\n   Path: %@\n Behavior: %lu\n   Vibration Pattern: %@", v4, v5, v6, v7, v8];

      v10 = @"SystemSound";
      break;
    case 1:
      id v9 = 0;
      v10 = @"Ringtone (deprecated)";
      break;
    case 2:
      id v9 = 0;
      v10 = @"AVItem (deprecated)";
      break;
    case 3:
      id v11 = NSString;
      if (self->_completionBlock) {
        id v12 = @"YES";
      }
      else {
        id v12 = @"NO";
      }
      id v13 = [(SBUISound *)self toneAlert];
      id v9 = [v11 stringWithFormat:@"\n   hasCompletionBlock: %@\n    Tone Alert: %@\n", v12, v13];

      v10 = @"ToneAlert";
      break;
    case 4:
      id v9 = 0;
      v10 = @"Song (deprecated)";
      break;
    case 5:
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"\n   eventType: %ld", self->_eventType);
      v10 = @"Feedback";
      break;
    default:
      v10 = 0;
      id v9 = 0;
      break;
  }
  v17.receiver = self;
  v17.super_class = (Class)SBUISound;
  v14 = [(SBUISound *)&v17 description];
  v15 = [v14 stringByAppendingFormat:@"\n{  SoundType: %@%@\n}", v10, v9];

  return v15;
}

- (int64_t)soundType
{
  return self->_soundType;
}

- (void)setSoundType:(int64_t)a3
{
  self->_soundType = a3;
}

- (unsigned)systemSoundID
{
  return self->_systemSoundID;
}

- (void)setSystemSoundID:(unsigned int)a3
{
  self->_systemSoundID = a3;
}

- (unsigned)_resolvedSystemSoundID
{
  return self->_resolvedSystemSoundID;
}

- (void)_setResolvedSoundID:(unsigned int)a3
{
  self->_resolvedSystemSoundID = a3;
}

- (unint64_t)soundBehavior
{
  return self->_soundBehavior;
}

- (void)setSoundBehavior:(unint64_t)a3
{
  self->_soundBehavior = a3;
}

- (NSDictionary)vibrationPattern
{
  return self->_vibrationPattern;
}

- (void)setVibrationPattern:(id)a3
{
}

- (TLAlert)toneAlert
{
  return self->_toneAlert;
}

- (void)setToneAlert:(id)a3
{
}

- (NSString)songPath
{
  return self->_songPath;
}

- (void)setSongPath:(id)a3
{
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songPath, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_toneAlert, 0);

  objc_storeStrong((id *)&self->_vibrationPattern, 0);
}

@end