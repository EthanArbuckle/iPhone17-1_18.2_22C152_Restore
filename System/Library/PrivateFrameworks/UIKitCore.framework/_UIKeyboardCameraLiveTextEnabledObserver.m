@interface _UIKeyboardCameraLiveTextEnabledObserver
+ (_UIKeyboardCameraLiveTextEnabledObserver)sharedInstance;
- (BOOL)isLiveTextEnabled;
- (_UIKeyboardCameraLiveTextEnabledObserver)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _UIKeyboardCameraLiveTextEnabledObserver

+ (_UIKeyboardCameraLiveTextEnabledObserver)sharedInstance
{
  if (qword_1EB25BF68 != -1) {
    dispatch_once(&qword_1EB25BF68, &__block_literal_global_596);
  }
  v2 = (void *)qword_1EB25BF60;
  return (_UIKeyboardCameraLiveTextEnabledObserver *)v2;
}

- (_UIKeyboardCameraLiveTextEnabledObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardCameraLiveTextEnabledObserver;
  v2 = [(_UIKeyboardCameraLiveTextEnabledObserver *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 addObserver:v2 forKeyPath:@"AppleLiveTextEnabled" options:1 context:_liveTextEnabledObserverContext];
  }
  return v2;
}

- (BOOL)isLiveTextEnabled
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_isLiveTextEnabledIsValid)
  {
    char isLiveTextEnabled = v2->_isLiveTextEnabled;
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    objc_super v5 = [v4 objectForKey:@"AppleLiveTextEnabled" inDomain:*MEMORY[0x1E4F283E0]];

    if (v5)
    {
      char isLiveTextEnabled = [v5 BOOLValue];
    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        v6 = [&unk_1ED3F16F0 arrayByAddingObjectsFromArray:&unk_1ED3F1708];
      }
      else
      {
        v6 = &unk_1ED3F16F0;
      }
      v7 = (void *)MEMORY[0x1E4F1CA20];
      v8 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
      v12[0] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      v10 = [v7 matchedLanguagesFromAvailableLanguages:v6 forPreferredLanguages:v9];

      char isLiveTextEnabled = [v10 count] != 0;
    }

    v2->_char isLiveTextEnabled = isLiveTextEnabled;
    v2->_isLiveTextEnabledIsValid = 1;
  }
  objc_sync_exit(v2);

  return isLiveTextEnabled;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"AppleLiveTextEnabled" context:_liveTextEnabledObserverContext];

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyboardCameraLiveTextEnabledObserver;
  [(_UIKeyboardCameraLiveTextEnabledObserver *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_liveTextEnabledObserverContext == a6)
  {
    obj = self;
    objc_sync_enter(obj);
    obj->_isLiveTextEnabledIsValid = 0;
    objc_sync_exit(obj);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIKeyboardCameraLiveTextEnabledObserver;
    -[_UIKeyboardCameraLiveTextEnabledObserver observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

@end