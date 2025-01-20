@interface STKSystemSound
- (id)initForSystemSoundID:(unsigned int)a3 duration:(double)a4;
- (void)_reallyPlaySound;
- (void)_reallyStopSound;
@end

@implementation STKSystemSound

- (id)initForSystemSoundID:(unsigned int)a3 duration:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)STKSystemSound;
  id result = [(STKBaseSound *)&v6 initWithDuration:a4];
  if (result) {
    *((_DWORD *)result + 7) = a3;
  }
  return result;
}

- (void)_reallyPlaySound
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(STKBaseSound *)self playsOnce];
  v4 = STKCommonLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = *(_DWORD *)(&self->super._isPlaying + 3);
      int v9 = 134218240;
      v10 = self;
      __int16 v11 = 1024;
      int v12 = v6;
      _os_log_impl(&dword_221DC0000, v4, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Playing %d sound once.", (uint8_t *)&v9, 0x12u);
    }

    AudioServicesPlaySystemSound(*(_DWORD *)(&self->super._isPlaying + 3));
  }
  else
  {
    if (v5)
    {
      int v7 = *(_DWORD *)(&self->super._isPlaying + 3);
      [(STKBaseSound *)self duration];
      int v9 = 134218496;
      v10 = self;
      __int16 v11 = 1024;
      int v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_impl(&dword_221DC0000, v4, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Playing %d sound until we tell it to stop (in %f seconds)", (uint8_t *)&v9, 0x1Cu);
    }

    AudioServicesStartSystemSound();
  }
}

- (void)_reallyStopSound
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = STKCommonLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    BOOL v5 = self;
    _os_log_impl(&dword_221DC0000, v3, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Actually stopping system sound explicitly.", (uint8_t *)&v4, 0xCu);
  }

  AudioServicesStopSystemSound();
}

@end