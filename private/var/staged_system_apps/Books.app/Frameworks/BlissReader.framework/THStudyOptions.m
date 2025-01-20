@interface THStudyOptions
- (BOOL)shouldShowAllAnnotationStyles;
- (BOOL)shouldShowAnnotationStyle:(int)a3;
- (BOOL)showAnnotations;
- (BOOL)showVocabulary;
- (BOOL)shuffle;
- (THStudyOptions)initWithUserDefaults:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)hideAllAnnotationStyles;
- (void)hideAnnotationStyle:(int)a3;
- (void)p_registerDefaults;
- (void)p_setShouldShowAllAnnotationStyles:(BOOL)a3;
- (void)p_setShouldShowAnnotationStyle:(int)a3 to:(BOOL)a4;
- (void)removeObserver:(id)a3;
- (void)setShowAnnotations:(BOOL)a3;
- (void)setShowVocabulary:(BOOL)a3;
- (void)setShuffle:(BOOL)a3;
- (void)showAll;
- (void)showAllAnnotationStyles;
- (void)showAnnotationStyle:(int)a3;
@end

@implementation THStudyOptions

- (THStudyOptions)initWithUserDefaults:(id)a3
{
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:] file:+[NSString stringWithUTF8String:] lineNumber:62 description:@"invalid nil value for '%s'", "userDefaults"];
  }
  v8.receiver = self;
  v8.super_class = (Class)THStudyOptions;
  v5 = [(THStudyOptions *)&v8 init];
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      v5->_userDefaults = (THBookUserDefaults *)a3;
      v6->_observers = (TSUMutablePointerSet *)objc_alloc_init((Class)TSUMutablePointerSet);
      [(THStudyOptions *)v6 p_registerDefaults];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THStudyOptions;
  [(THStudyOptions *)&v3 dealloc];
}

- (BOOL)shuffle
{
  return [(THBookUserDefaults *)self->_userDefaults BOOLForKey:@"THStudyOptionsShouldShuffle"];
}

- (void)setShuffle:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSUMutablePointerSet *)self->_observers makeObjectsPerformSelector:"studyOptionsWillChangeShuffle:" withObject:self];
  [(THBookUserDefaults *)self->_userDefaults setBool:v3 forKey:@"THStudyOptionsShouldShuffle"];
  observers = self->_observers;

  [(TSUMutablePointerSet *)observers makeObjectsPerformSelector:"studyOptionsDidChangeShuffle:" withObject:self];
}

- (BOOL)showAnnotations
{
  return [(THBookUserDefaults *)self->_userDefaults BOOLForKey:@"THStudyOptionsShouldShowAnnotations"];
}

- (void)setShowAnnotations:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSUMutablePointerSet *)self->_observers makeObjectsPerformSelector:"studyOptionsWillChangeFilterOptions:" withObject:self];
  [(THBookUserDefaults *)self->_userDefaults setBool:v3 forKey:@"THStudyOptionsShouldShowAnnotations"];
  observers = self->_observers;

  [(TSUMutablePointerSet *)observers makeObjectsPerformSelector:"studyOptionsDidChangeFilterOptions:" withObject:self];
}

- (BOOL)showVocabulary
{
  return [(THBookUserDefaults *)self->_userDefaults BOOLForKey:@"THStudyOptionsShouldShowVocabulary"];
}

- (void)setShowVocabulary:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSUMutablePointerSet *)self->_observers makeObjectsPerformSelector:"studyOptionsWillChangeFilterOptions:" withObject:self];
  [(THBookUserDefaults *)self->_userDefaults setBool:v3 forKey:@"THStudyOptionsShouldShowVocabulary"];
  observers = self->_observers;

  [(TSUMutablePointerSet *)observers makeObjectsPerformSelector:"studyOptionsDidChangeFilterOptions:" withObject:self];
}

- (BOOL)shouldShowAnnotationStyle:(int)a3
{
  uint64_t v3 = 0;
  while (kHighlightInfos[v3] != a3)
  {
    v3 += 4;
    if (v3 == 24) {
      return 0;
    }
  }
  return [(THBookUserDefaults *)self->_userDefaults BOOLForKey:*(void *)&kHighlightInfos[v3 + 2]];
}

- (void)showAnnotationStyle:(int)a3
{
}

- (void)hideAnnotationStyle:(int)a3
{
}

- (BOOL)shouldShowAllAnnotationStyles
{
  BOOL v3 = [(THBookUserDefaults *)self->_userDefaults BOOLForKey:off_56DBD0];
  if (v3)
  {
    unint64_t v4 = 0;
    v5 = &off_56DBE0;
    do
    {
      unint64_t v6 = v4;
      if (v4 == 5) {
        break;
      }
      v7 = *v5;
      v5 += 2;
      unsigned __int8 v8 = [(THBookUserDefaults *)self->_userDefaults BOOLForKey:v7];
      unint64_t v4 = v6 + 1;
    }
    while ((v8 & 1) != 0);
    LOBYTE(v3) = v6 > 4;
  }
  return v3;
}

- (void)showAllAnnotationStyles
{
}

- (void)hideAllAnnotationStyles
{
}

- (void)showAll
{
  [(TSUMutablePointerSet *)self->_observers makeObjectsPerformSelector:"studyOptionsWillChangeFilterOptions:" withObject:self];
  [(THBookUserDefaults *)self->_userDefaults setBool:1 forKey:@"THStudyOptionsShouldShowAnnotations"];
  [(THBookUserDefaults *)self->_userDefaults setBool:1 forKey:@"THStudyOptionsShouldShowVocabulary"];
  uint64_t v3 = &dword_8;
  do
  {
    [(THBookUserDefaults *)self->_userDefaults setBool:1 forKey:*(void *)((char *)kHighlightInfos + v3)];
    v3 += 16;
  }
  while (v3 != 104);
  observers = self->_observers;

  [(TSUMutablePointerSet *)observers makeObjectsPerformSelector:"studyOptionsDidChangeFilterOptions:" withObject:self];
}

- (void)addObserver:(id)a3
{
  if (!self->_observers)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THStudyOptions addObserver:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptions.mm"] lineNumber:200 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "_observers"];
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THStudyOptions addObserver:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptions.mm") lineNumber:201 description:@"invalid nil value for '%s'", "observer"];
    return;
  }
  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:
  observers = self->_observers;

  [(TSUMutablePointerSet *)observers addObject:a3];
}

- (void)removeObserver:(id)a3
{
  if (!self->_observers)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THStudyOptions removeObserver:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptions.mm"] lineNumber:211 description:@"invalid nil value for '%s'", "_observers"];
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THStudyOptions removeObserver:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptions.mm"] lineNumber:212 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"observer"];
    return;
  }
  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:
  observers = self->_observers;

  [(TSUMutablePointerSet *)observers removeObject:a3];
}

- (void)p_setShouldShowAnnotationStyle:(int)a3 to:(BOOL)a4
{
  BOOL v4 = a4;
  [(TSUMutablePointerSet *)self->_observers makeObjectsPerformSelector:"studyOptionsWillChangeFilterOptions:" withObject:self];
  uint64_t v7 = 0;
  while (kHighlightInfos[v7] != a3)
  {
    v7 += 4;
    if (v7 == 24) {
      goto LABEL_6;
    }
  }
  [(THBookUserDefaults *)self->_userDefaults setBool:v4 forKey:*(void *)&kHighlightInfos[v7 + 2]];
LABEL_6:
  observers = self->_observers;

  [(TSUMutablePointerSet *)observers makeObjectsPerformSelector:"studyOptionsDidChangeFilterOptions:" withObject:self];
}

- (void)p_setShouldShowAllAnnotationStyles:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSUMutablePointerSet *)self->_observers makeObjectsPerformSelector:"studyOptionsWillChangeFilterOptions:" withObject:self];
  uint64_t v5 = &dword_8;
  do
  {
    [(THBookUserDefaults *)self->_userDefaults setBool:v3 forKey:*(void *)((char *)kHighlightInfos + v5)];
    v5 += 16;
  }
  while (v5 != 104);
  observers = self->_observers;

  [(TSUMutablePointerSet *)observers makeObjectsPerformSelector:"studyOptionsDidChangeFilterOptions:" withObject:self];
}

- (void)p_registerDefaults
{
  BOOL v3 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), @"THStudyOptionsShouldShuffle", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"THStudyOptionsShouldShowAnnotations", +[NSNumber numberWithBool:1], @"THStudyOptionsShouldShowVocabulary", 0);
  uint64_t v4 = &dword_8;
  do
  {
    [(NSMutableDictionary *)v3 setObject:+[NSNumber numberWithBool:1] forKey:*(void *)((char *)kHighlightInfos + v4)];
    v4 += 16;
  }
  while (v4 != 104);
  uint64_t v5 = +[NSUserDefaults standardUserDefaults];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(NSMutableDictionary *)v3 allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v12 = [(NSUserDefaults *)v5 objectForKey:v11];
        if (v12) {
          [(NSMutableDictionary *)v3 setObject:v12 forKey:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [(THBookUserDefaults *)self->_userDefaults registerDefaults:v3];
}

@end