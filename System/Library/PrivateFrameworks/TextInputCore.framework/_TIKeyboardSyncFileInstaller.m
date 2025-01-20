@interface _TIKeyboardSyncFileInstaller
- (BOOL)valid;
- (_TIKeyboardSyncFileInstaller)initWithEntry:(id)a3;
- (void)dealloc;
- (void)execute;
- (void)invalidate;
@end

@implementation _TIKeyboardSyncFileInstaller

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(_TIKeyboardSyncFileInstaller *)self execute];
  v3.receiver = self;
  v3.super_class = (Class)_TIKeyboardSyncFileInstaller;
  [(_TIKeyboardSyncFileInstaller *)&v3 dealloc];
}

- (BOOL)valid
{
  return self->_entry != 0;
}

- (void)invalidate
{
  self->_entry = 0;
  MEMORY[0x1F41817F8]();
}

- (void)execute
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_entry)
  {
    +[TILanguageModelLoaderManager dropResourcesExcludingInputModes:MEMORY[0x1E4F1CBF0]];
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel)
    {
      objc_super v3 = TIOSLogFacility();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v6 = [NSString stringWithFormat:@"%s Restoring %@", "-[_TIKeyboardSyncFileInstaller execute]", self->_entry];
        *(_DWORD *)buf = 138412290;
        v8 = v6;
        _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    entry = self->_entry;
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:TI_KB_USER_DIRECTORY() isDirectory:1];
    [(_KSFileEntry *)entry restoreToPath:v5];

    [(_TIKeyboardSyncFileInstaller *)self invalidate];
  }
}

- (_TIKeyboardSyncFileInstaller)initWithEntry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TIKeyboardSyncFileInstaller;
  v6 = [(_TIKeyboardSyncFileInstaller *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entry, a3);
  }

  return v7;
}

@end