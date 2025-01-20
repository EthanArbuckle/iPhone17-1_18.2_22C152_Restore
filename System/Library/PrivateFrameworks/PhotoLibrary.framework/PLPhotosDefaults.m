@interface PLPhotosDefaults
+ (id)sharedInstance;
+ (int)randomTransition;
- (BOOL)shouldPlayMusic;
- (BOOL)summarizeMomentSections;
- (PLPhotosDefaults)init;
- (id)musicCollection;
- (int)transition;
- (int)transitionForAnimationMovingForward:(BOOL)a3;
- (void)_reloadPhotoDefaultValuesAndNotify:(BOOL)a3;
- (void)dealloc;
- (void)reloadPhotoDefaultValues;
- (void)setMusicCollection:(id)a3;
- (void)setShouldPlayMusic:(BOOL)a3;
- (void)setTransition:(int)a3;
@end

@implementation PLPhotosDefaults

- (void)reloadPhotoDefaultValues
{
}

+ (id)sharedInstance
{
  id result = (id)__Defaults;
  if (!__Defaults)
  {
    id result = objc_alloc_init(PLPhotosDefaults);
    __Defaults = (uint64_t)result;
  }
  return result;
}

- (PLPhotosDefaults)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLPhotosDefaults;
  v2 = [(PLPhotosDefaults *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PLPhotosDefaults *)v2 _reloadPhotoDefaultValuesAndNotify:0];
    v3->_musicCollection = 0;
  }
  return v3;
}

- (void)_reloadPhotoDefaultValuesAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (id)CFPreferencesCopyAppValue(@"SummarizeSections", @"com.apple.mobileslideshow");
  if (!v5) {
    objc_super v5 = (void *)[NSNumber numberWithBool:1];
  }
  self->_summarizeMomentSections = [v5 BOOLValue];
  if (v3)
  {
    v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"PLPhotosDefaultsDidChangeNotification" object:self];
  }
}

- (id)musicCollection
{
  return self->_musicCollection;
}

- (void)setMusicCollection:(id)a3
{
  musicCollection = self->_musicCollection;
  if (musicCollection != a3)
  {

    self->_musicCollection = (MPMediaItemCollection *)a3;
  }
}

- (void)setShouldPlayMusic:(BOOL)a3
{
  self->_shouldPlayMusic = a3;
}

- (BOOL)shouldPlayMusic
{
  return self->_shouldPlayMusic;
}

- (void)setTransition:(int)a3
{
  self->_transition = a3;
}

- (int)transition
{
  return self->_transition;
}

- (int)transitionForAnimationMovingForward:(BOOL)a3
{
  int result = self->_transition;
  if (result == -1) {
    int result = [(id)objc_opt_class() randomTransition];
  }
  if (result == 1) {
    int v5 = 2;
  }
  else {
    int v5 = result;
  }
  if (result == 7) {
    int v6 = 3;
  }
  else {
    int v6 = v5;
  }
  if (!a3) {
    return v6;
  }
  return result;
}

- (BOOL)summarizeMomentSections
{
  return self->_summarizeMomentSections;
}

- (void)dealloc
{
  if ((PLPhotosDefaults *)__Defaults == self) {
    __Defaults = 0;
  }

  v3.receiver = self;
  v3.super_class = (Class)PLPhotosDefaults;
  [(PLPhotosDefaults *)&v3 dealloc];
}

+ (int)randomTransition
{
  if (!randomTransition_transitionsArray)
  {
    v2 = (void *)randomTransition_settingsArray;
    if (!randomTransition_settingsArray)
    {
      uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "pathForResource:ofType:", @"Photos", @"plist");
      v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v3];
      randomTransition_settingsArray = (uint64_t)(id)[v4 valueForKey:@"items"];

      v2 = (void *)randomTransition_settingsArray;
    }
    uint64_t v5 = [v2 count];
    randomTransition_transitionsArray = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v5 < 1)
    {
LABEL_8:
      v8 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      while (1)
      {
        v7 = (void *)[(id)randomTransition_settingsArray objectAtIndex:v6];
        if (objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"key"), "isEqualToString:", @"Transition"))break; {
        if (v5 == ++v6)
        }
          goto LABEL_8;
      }
      v8 = (void *)[v7 valueForKeyPath:@"validValues"];
    }
    uint64_t v9 = [v8 count];
    if (v9 >= 1)
    {
      uint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
      {
        v12 = (void *)[v8 objectAtIndex:i];
        if ((int)[v12 intValue] >= 1) {
          [(id)randomTransition_transitionsArray addObject:v12];
        }
      }
    }
  }
  v13 = objc_msgSend((id)randomTransition_transitionsArray, "objectAtIndex:", random() % (unint64_t)objc_msgSend((id)randomTransition_transitionsArray, "count"));
  return [v13 intValue];
}

@end