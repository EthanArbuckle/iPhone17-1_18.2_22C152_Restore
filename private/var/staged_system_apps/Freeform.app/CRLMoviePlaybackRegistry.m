@interface CRLMoviePlaybackRegistry
+ (id)sharedMoviePlaybackRegistry;
- (CRLMoviePlaybackRegistry)init;
- (void)objectDidEndMoviePlayback:(id)a3;
- (void)objectWillBeginMoviePlayback:(id)a3;
@end

@implementation CRLMoviePlaybackRegistry

+ (id)sharedMoviePlaybackRegistry
{
  if (qword_1016A9210 != -1) {
    dispatch_once(&qword_1016A9210, &stru_1014DF280);
  }
  v2 = (void *)qword_1016A9208;

  return v2;
}

- (CRLMoviePlaybackRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRLMoviePlaybackRegistry;
  v2 = [(CRLMoviePlaybackRegistry *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    playingObjectPointerSet = v2->_playingObjectPointerSet;
    v2->_playingObjectPointerSet = v3;

    savedAudioCategory = v2->_savedAudioCategory;
    v2->_savedAudioCategory = (NSString *)&stru_101538650;

    savedAudioMode = v2->_savedAudioMode;
    v2->_savedAudioMode = (NSString *)&stru_101538650;

    v2->_savedAudioCategoryOptions = 0;
  }
  return v2;
}

- (void)objectWillBeginMoviePlayback:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DF2A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101086558();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DF2C0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectWillBeginMoviePlayback:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 58, 0, "invalid nil value for '%{public}s'", "object");
  }
  if ([(NSMutableSet *)self->_playingObjectPointerSet containsObject:v4])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DF2E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010864D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DF300);
    }
    objc_super v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectWillBeginMoviePlayback:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:59 isFatal:0 description:"The object shouldn't already be playing a movie when -objectWillBeginMoviePlayback is called."];
  }
  [(NSMutableSet *)self->_playingObjectPointerSet addObject:v4];
  if ([(NSMutableSet *)self->_playingObjectPointerSet count] == (id)1)
  {
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014DF320);
    }
    v11 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning AVAudioSession category AVAudioSessionCategoryPlayback", buf, 2u);
    }
    v12 = +[AVAudioSession sharedInstance];
    v13 = [v12 category];
    savedAudioCategory = self->_savedAudioCategory;
    self->_savedAudioCategory = v13;

    v15 = [v12 mode];
    savedAudioMode = self->_savedAudioMode;
    self->_savedAudioMode = v15;

    self->_savedAudioCategoryOptions = (unint64_t)[v12 categoryOptions];
    id v24 = 0;
    unsigned __int8 v17 = [v12 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeDefault options:0 error:&v24];
    id v18 = v24;
    if ((v17 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DF340);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101086438();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DF360);
      }
      v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v19);
      }
      v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectWillBeginMoviePlayback:]");
      v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"];
      +[CRLAssertionHandler handleFailureInFunction:v20, v21, 78, 0, "Unable to set audio session category before starting playback (%@)", v18 file lineNumber isFatal description];
    }
  }
  CFStringRef v26 = @"CRLMoviePlaybackRegistryPlaybackObjectStatusKey";
  id v27 = v4;
  v22 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v23 = +[NSNotificationCenter defaultCenter];
  [v23 postNotificationName:@"CRLMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification" object:self userInfo:v22];
}

- (void)objectDidEndMoviePlayback:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DF380);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108682C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DF3A0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectDidEndMoviePlayback:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 88, 0, "invalid nil value for '%{public}s'", "object");
  }
  if (([(NSMutableSet *)self->_playingObjectPointerSet containsObject:v4] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DF3C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010867A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DF3E0);
    }
    objc_super v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectDidEndMoviePlayback:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:89 isFatal:0 description:"The object should be playing a movie when -objectDidEndMoviePlayback is called."];
  }
  [(NSMutableSet *)self->_playingObjectPointerSet removeObject:v4];
  if (![(NSMutableSet *)self->_playingObjectPointerSet count])
  {
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014DF400);
    }
    v11 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ending AVAudioSession category AVAudioSessionCategoryPlayback", buf, 2u);
    }
    if ([(NSString *)self->_savedAudioCategory isEqualToString:&stru_101538650])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DF420);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108671C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DF440);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectDidEndMoviePlayback:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"];
      +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:95 isFatal:0 description:"Should have a category to use to reset the audio session."];
    }
    if ([(NSString *)self->_savedAudioMode isEqualToString:&stru_101538650])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DF460);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101086694();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DF480);
      }
      v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v15);
      }
      v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectDidEndMoviePlayback:]");
      unsigned __int8 v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"];
      +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:96 isFatal:0 description:"Should have a mode to use to reset the audio session."];
    }
    id v18 = +[AVAudioSession sharedInstance];
    savedAudioCategory = self->_savedAudioCategory;
    savedAudioMode = self->_savedAudioMode;
    unint64_t savedAudioCategoryOptions = self->_savedAudioCategoryOptions;
    id v29 = 0;
    unsigned __int8 v22 = [v18 setCategory:savedAudioCategory mode:savedAudioMode options:savedAudioCategoryOptions error:&v29];
    id v23 = v29;

    if ((v22 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DF4A0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010865FC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DF4C0);
      }
      id v24 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v24);
      }
      v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectDidEndMoviePlayback:]");
      CFStringRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"];
      +[CRLAssertionHandler handleFailureInFunction:v25, v26, 100, 0, "Unable to set audio session category after ending playback (%@)", v23 file lineNumber isFatal description];
    }
  }
  CFStringRef v31 = @"CRLMoviePlaybackRegistryPlaybackObjectStatusKey";
  id v32 = v4;
  id v27 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  v28 = +[NSNotificationCenter defaultCenter];
  [v28 postNotificationName:@"CRLMoviePlaybackRegistryObjectDidEndMoviePlaybackNotification" object:self userInfo:v27];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAudioMode, 0);
  objc_storeStrong((id *)&self->_savedAudioCategory, 0);

  objc_storeStrong((id *)&self->_playingObjectPointerSet, 0);
}

@end