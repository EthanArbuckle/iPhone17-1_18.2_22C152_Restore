@interface TUDTMFSoundPlayer
- (BOOL)attemptToPlayKey:(unsigned __int8)a3;
- (TUDTMFSoundPlayer)init;
- (id)playSystemSoundHandler;
- (void)attemptToPlaySoundType:(int64_t)a3;
- (void)setPlaySystemSoundHandler:(id)a3;
@end

@implementation TUDTMFSoundPlayer

- (TUDTMFSoundPlayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUDTMFSoundPlayer;
  v2 = [(TUDTMFSoundPlayer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    id playSystemSoundHandler = v2->_playSystemSoundHandler;
    v2->_id playSystemSoundHandler = &__block_literal_global_6;
  }
  return v3;
}

uint64_t __25__TUDTMFSoundPlayer_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Calling AudioServicesPlaySystemSoundWithOptions() with system sound ID %d", (uint8_t *)v5, 8u);
  }

  if (_block_invoke__pred_AudioServicesPlaySystemSoundWithOptionsAudioToolbox != -1) {
    dispatch_once(&_block_invoke__pred_AudioServicesPlaySystemSoundWithOptionsAudioToolbox, &__block_literal_global_4);
  }
  return _block_invoke__AudioServicesPlaySystemSoundWithOptions(a2, 0, 0);
}

uint64_t (*__25__TUDTMFSoundPlayer_init__block_invoke_1())(void, void, void)
{
  result = (uint64_t (*)(void, void, void))CUTWeakLinkSymbol();
  _block_invoke__AudioServicesPlaySystemSoundWithOptions = result;
  return result;
}

- (BOOL)attemptToPlayKey:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case '#':
      uint64_t v4 = 11;
      goto LABEL_17;
    case '*':
      uint64_t v4 = 10;
      goto LABEL_17;
    case '0':
      uint64_t v4 = 0;
      goto LABEL_17;
    case '1':
      BOOL v6 = 1;
      [(TUDTMFSoundPlayer *)self attemptToPlaySoundType:1];
      return v6;
    case '2':
      uint64_t v4 = 2;
      goto LABEL_17;
    case '3':
      uint64_t v4 = 3;
      goto LABEL_17;
    case '4':
      uint64_t v4 = 4;
      goto LABEL_17;
    case '5':
      uint64_t v4 = 5;
      goto LABEL_17;
    case '6':
      uint64_t v4 = 6;
      goto LABEL_17;
    case '7':
      uint64_t v4 = 7;
      goto LABEL_17;
    case '8':
      uint64_t v4 = 8;
      goto LABEL_17;
    case '9':
      uint64_t v4 = 9;
LABEL_17:
      [(TUDTMFSoundPlayer *)self attemptToPlaySoundType:v4];
      BOOL v6 = 1;
      break;
    default:
      v5 = TUDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 67109120;
        v8[1] = v3;
        _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Requested to play DTMF tone for unknown key: %d", (uint8_t *)v8, 8u);
      }

      BOOL v6 = 0;
      break;
  }
  return v6;
}

- (void)attemptToPlaySoundType:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = a3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to play DTMF sound type %ld", (uint8_t *)&v7, 0xCu);
  }

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      BOOL v6 = [(TUDTMFSoundPlayer *)self playSystemSoundHandler];
      v6[2]();

      break;
    default:
      return;
  }
}

- (id)playSystemSoundHandler
{
  return self->_playSystemSoundHandler;
}

- (void)setPlaySystemSoundHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end