@interface CRLiOSKeyboardMonitor
+ (BOOL)isKeyboardFrameChanging:(id)a3;
+ (BOOL)isLocalKeyboardForNotification:(id)a3;
+ (BOOL)isNullInputView:(id)a3;
+ (BOOL)keyboardIsAnimating;
+ (BOOL)keyboardIsAnimatingInOrDocking;
+ (BOOL)keyboardIsAnimatingOutOrUndocking;
+ (BOOL)keyboardIsVisibleAndDocked;
+ (BOOL)keyboardIsVisibleAndUndocked;
+ (BOOL)undockedKeyboardWillHide;
+ (BOOL)undockedKeyboardWillShow;
+ (CGRect)p_localKeyboardFrameFromReportedFrame:(CGRect)a3 screenBounds:(CGRect)a4 inputView:(id)a5;
+ (id)sharedKeyboardMonitor;
+ (void)addKeyboardObserver:(id)a3;
+ (void)addModalKeyboardObserver:(id)a3;
+ (void)afterKeyboardAnimationPerformBlock:(id)a3;
+ (void)removeKeyboardObserver:(id)a3;
+ (void)removeModalKeyboardObserver:(id)a3;
- (BOOL)isLocalKeyboard;
- (BOOL)keyboardIsAnimating;
- (BOOL)keyboardIsAnimatingInOrDocking;
- (BOOL)keyboardIsAnimatingOutOrUndocking;
- (BOOL)keyboardIsVisibleAndDocked;
- (BOOL)keyboardIsVisibleAndUndocked;
- (BOOL)p_isFrameCorrespondingToRotatedKeyboard:(CGRect)a3;
- (BOOL)p_isFrameCorrespondingToUndockedKeyboard:(CGRect)a3;
- (BOOL)p_isNotificationCorrespondingToUndockedKeyboardWillHide:(id)a3;
- (BOOL)p_isNotificationCorrespondingToUndockedKeyboardWillShow:(id)a3;
- (BOOL)undockedKeyboardWillHide;
- (BOOL)undockedKeyboardWillShow;
- (CGRect)keyboardFrame;
- (CRLiOSKeyboardMonitor)init;
- (NSHashTable)modalKeyboardObservers;
- (NSMutableArray)completionBlocks;
- (NSPointerArray)keyboardObservers;
- (NSTimer)keyboardIsAnimatingInTimer;
- (double)keyboardAnimationDuration;
- (double)onScreenHeight;
- (double)onScreenHeightInWindow:(id)a3;
- (double)p_verticalSpacingFromWindow:(id)a3 toWindow:(id)a4;
- (id)p_observersToNotify;
- (void)addKeyboardObserver:(id)a3;
- (void)addModalKeyboardObserver:(id)a3;
- (void)afterKeyboardAnimationPerformBlock:(id)a3;
- (void)p_clearKeyboardIsAnimatingInTimer;
- (void)p_enumerateObserversUsingBlock:(id)a3;
- (void)p_installKeyboardNotifications;
- (void)p_keyboardDidChangeFrame:(id)a3;
- (void)p_keyboardDidHideOrUndock:(id)a3;
- (void)p_keyboardDidShowOrDock:(id)a3;
- (void)p_keyboardWillChangeFrame:(id)a3;
- (void)p_keyboardWillHideOrUndock:(id)a3;
- (void)p_keyboardWillShowOrDock:(id)a3;
- (void)p_performAnimationCompletionBlocksWithVisible:(BOOL)a3;
- (void)p_scheduleKeyboardIsAnimatingInTimer;
- (void)p_updateKeyboardInfoFromNotification:(id)a3;
- (void)removeKeyboardObserver:(id)a3;
- (void)removeModalKeyboardObserver:(id)a3;
- (void)setKeyboardIsAnimatingInOrDocking:(BOOL)a3;
- (void)setKeyboardIsAnimatingInTimer:(id)a3;
@end

@implementation CRLiOSKeyboardMonitor

- (CRLiOSKeyboardMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)CRLiOSKeyboardMonitor;
  v2 = [(CRLiOSKeyboardMonitor *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_keyboardIsVisibleAndDocked = 0;
    v2->_isLocalKeyboard = 1;
    uint64_t v4 = +[NSPointerArray weakObjectsPointerArray];
    keyboardObservers = v3->_keyboardObservers;
    v3->_keyboardObservers = (NSPointerArray *)v4;

    uint64_t v6 = +[NSHashTable weakObjectsHashTable];
    modalKeyboardObservers = v3->_modalKeyboardObservers;
    v3->_modalKeyboardObservers = (NSHashTable *)v6;

    uint64_t v8 = +[NSMutableArray array];
    completionBlocks = v3->_completionBlocks;
    v3->_completionBlocks = (NSMutableArray *)v8;

    [(CRLiOSKeyboardMonitor *)v3 p_installKeyboardNotifications];
  }
  return v3;
}

- (BOOL)keyboardIsVisibleAndDocked
{
  return self->_keyboardIsVisibleAndDocked && self->_onScreenHeight > 0.0;
}

- (BOOL)keyboardIsVisibleAndUndocked
{
  return -[CRLiOSKeyboardMonitor p_isFrameCorrespondingToUndockedKeyboard:](self, "p_isFrameCorrespondingToUndockedKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
}

- (BOOL)keyboardIsAnimating
{
  return self->_keyboardIsAnimatingInOrDocking || self->_keyboardIsAnimatingOutOrUndocking;
}

- (void)p_enumerateObserversUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(CRLiOSKeyboardMonitor *)self p_observersToNotify];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002EC4C4;
  v7[3] = &unk_1014EBA28;
  id v8 = v4;
  id v6 = v4;
  [v5 crl_enumerateNonNullPointersUsingBlock:v7];
}

- (id)p_observersToNotify
{
  v3 = [(CRLiOSKeyboardMonitor *)self modalKeyboardObservers];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = +[NSHashTable weakObjectsHashTable];
    id v6 = +[NSPointerArray weakObjectsPointerArray];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v7 = [(CRLiOSKeyboardMonitor *)self modalKeyboardObservers];
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v13 = [v12 keyboardObserversWindow];
          [v5 addObject:v13];
          [v6 addPointer:v12];
        }
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = [(CRLiOSKeyboardMonitor *)self keyboardObservers];
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
          v20 = [v19 keyboardObserversWindow];
          unsigned __int8 v21 = [v5 containsObject:v20];

          if ((v21 & 1) == 0) {
            [v6 addPointer:v19];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }
  }
  else
  {
    v5 = [(CRLiOSKeyboardMonitor *)self keyboardObservers];
    id v6 = [v5 copy];
  }

  return v6;
}

- (void)p_keyboardWillShowOrDock:(id)a3
{
  id v4 = a3;
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBA48);
  }
  v5 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CRLiOSKeyboardMonitor p_keyboardWillShowOrDock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  [(CRLiOSKeyboardMonitor *)self p_updateKeyboardInfoFromNotification:v4];
  double width = self->_keyboardFrame.size.width;
  if (width == 0.0
    || fabs(width) < 0.00999999978
    || (double height = self->_keyboardFrame.size.height, height == 0.0)
    || fabs(height) < 0.00999999978
    || (double onScreenHeight = self->_onScreenHeight, onScreenHeight == 0.0)
    || fabs(onScreenHeight) < 0.00999999978)
  {
    self->_weAreFakingAHideEvent = 1;
    if (self->_keyboardIsVisibleAndDocked) {
      [(CRLiOSKeyboardMonitor *)self p_keyboardWillHideOrUndock:v4];
    }
    else {
      self->_suppressDidHide = 1;
    }
  }
  else
  {
    if (self->_keyboardIsAnimatingOutOrUndocking)
    {
      self->_keyboardIsAnimatingOutOrUndocking = 0;
      [(CRLiOSKeyboardMonitor *)self p_enumerateObserversUsingBlock:&stru_1014EBA88];
    }
    self->_keyboardIsVisibleAndDocked = 1;
    self->_keyboardIsAnimatingInOrDocking = 1;
    [(CRLiOSKeyboardMonitor *)self p_scheduleKeyboardIsAnimatingInTimer];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002EC9CC;
    v9[3] = &unk_1014EBAB0;
    id v10 = v4;
    [(CRLiOSKeyboardMonitor *)self p_enumerateObserversUsingBlock:v9];
  }
}

- (void)p_keyboardDidShowOrDock:(id)a3
{
  id v4 = a3;
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBAD0);
  }
  v5 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[CRLiOSKeyboardMonitor p_keyboardDidShowOrDock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (self->_weAreFakingAHideEvent)
  {
    if (!self->_suppressDidHide) {
      [(CRLiOSKeyboardMonitor *)self p_keyboardDidHideOrUndock:v4];
    }
    *(_WORD *)&self->_weAreFakingAHideEvent = 256;
    self->_suppressDidHide = 0;
  }
  else if (self->_keyboardIsAnimatingInOrDocking)
  {
    [(CRLiOSKeyboardMonitor *)self p_updateKeyboardInfoFromNotification:v4];
    self->_keyboardIsAnimatingInOrDocking = 0;
    [(CRLiOSKeyboardMonitor *)self p_clearKeyboardIsAnimatingInTimer];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002ECC14;
    v6[3] = &unk_1014EBAB0;
    id v7 = v4;
    [(CRLiOSKeyboardMonitor *)self p_enumerateObserversUsingBlock:v6];
    [(CRLiOSKeyboardMonitor *)self p_performAnimationCompletionBlocksWithVisible:1];
  }
}

- (void)p_keyboardWillHideOrUndock:(id)a3
{
  id v4 = a3;
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBAF0);
  }
  v5 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[CRLiOSKeyboardMonitor p_keyboardWillHideOrUndock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  self->_suppressDidHide = 0;
  [(CRLiOSKeyboardMonitor *)self p_updateKeyboardInfoFromNotification:v4];
  if (self->_keyboardIsAnimatingInOrDocking)
  {
    self->_keyboardIsAnimatingInOrDocking = 0;
    [(CRLiOSKeyboardMonitor *)self p_clearKeyboardIsAnimatingInTimer];
    [(CRLiOSKeyboardMonitor *)self p_enumerateObserversUsingBlock:&stru_1014EBB10];
  }
  if (self->_keyboardIsVisibleAndDocked || !self->_lastHideWasFake)
  {
    self->_keyboardIsVisibleAndDocked = 0;
    self->_keyboardIsAnimatingOutOrUndocking = 1;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002ECEA8;
    v6[3] = &unk_1014EBAB0;
    id v7 = v4;
    [(CRLiOSKeyboardMonitor *)self p_enumerateObserversUsingBlock:v6];
  }
}

- (void)p_keyboardDidHideOrUndock:(id)a3
{
  id v4 = a3;
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBB30);
  }
  v5 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[CRLiOSKeyboardMonitor p_keyboardDidHideOrUndock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (self->_keyboardIsAnimatingOutOrUndocking)
  {
    [(CRLiOSKeyboardMonitor *)self p_updateKeyboardInfoFromNotification:v4];
    self->_keyboardIsAnimatingOutOrUndocking = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002ED0C0;
    v6[3] = &unk_1014EBAB0;
    id v7 = v4;
    [(CRLiOSKeyboardMonitor *)self p_enumerateObserversUsingBlock:v6];
    [(CRLiOSKeyboardMonitor *)self p_performAnimationCompletionBlocksWithVisible:0];
    self->_lastHideWasFake = 0;
  }
}

- (void)p_clearKeyboardIsAnimatingInTimer
{
  v3 = [(CRLiOSKeyboardMonitor *)self keyboardIsAnimatingInTimer];
  [v3 invalidate];

  [(CRLiOSKeyboardMonitor *)self setKeyboardIsAnimatingInTimer:0];
}

- (void)p_scheduleKeyboardIsAnimatingInTimer
{
  v3 = [(CRLiOSKeyboardMonitor *)self keyboardIsAnimatingInTimer];
  [v3 invalidate];

  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_1002ED270;
  id v8 = &unk_1014EA850;
  objc_copyWeak(&v9, &location);
  id v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v5 block:2.5];
  -[CRLiOSKeyboardMonitor setKeyboardIsAnimatingInTimer:](self, "setKeyboardIsAnimatingInTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)addKeyboardObserver:(id)a3
{
  id v7 = a3;
  id v4 = [(CRLiOSKeyboardMonitor *)self keyboardObservers];
  id v5 = [v4 crl_indexOfPointer:v7];

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [(CRLiOSKeyboardMonitor *)self keyboardObservers];
    [v6 addPointer:v7];
  }
}

- (void)removeKeyboardObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSKeyboardMonitor *)self keyboardObservers];
  id v6 = [v5 crl_indexOfPointer:v4];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(CRLiOSKeyboardMonitor *)self keyboardObservers];
    [v7 removePointerAtIndex:v6];
  }
  id v8 = [(CRLiOSKeyboardMonitor *)self keyboardObservers];
  [v8 compact];
}

- (void)addModalKeyboardObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSKeyboardMonitor *)self modalKeyboardObservers];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if (v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBB90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109B364();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBBB0);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSKeyboardMonitor addModalKeyboardObserver:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSKeyboardMonitor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:306 isFatal:0 description:"addModalKeyboardObserver attempt to add the same model observer."];
  }
  else
  {
    id v10 = [(CRLiOSKeyboardMonitor *)self modalKeyboardObservers];
    [v10 addObject:v4];
  }
}

- (void)removeModalKeyboardObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSKeyboardMonitor *)self modalKeyboardObservers];
  [v5 removeObject:v4];
}

- (void)afterKeyboardAnimationPerformBlock:(id)a3
{
  id v4 = a3;
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBBD0);
  }
  id v5 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[CRLiOSKeyboardMonitor afterKeyboardAnimationPerformBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }
  completionBlocks = self->_completionBlocks;
  id v7 = [v4 copy];
  id v8 = objc_retainBlock(v7);
  [(NSMutableArray *)completionBlocks addObject:v8];
}

+ (id)sharedKeyboardMonitor
{
  if (qword_1016A95F8 != -1) {
    dispatch_once(&qword_1016A95F8, &stru_1014EBBF0);
  }
  v2 = (void *)qword_1016A95F0;

  return v2;
}

+ (void)addKeyboardObserver:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedKeyboardMonitor];
  [v5 addKeyboardObserver:v4];
}

+ (void)removeKeyboardObserver:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedKeyboardMonitor];
  [v5 removeKeyboardObserver:v4];
}

+ (void)addModalKeyboardObserver:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedKeyboardMonitor];
  [v5 addModalKeyboardObserver:v4];
}

+ (void)removeModalKeyboardObserver:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedKeyboardMonitor];
  [v5 removeModalKeyboardObserver:v4];
}

+ (BOOL)isKeyboardFrameChanging:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 userInfo];
  unsigned __int8 v6 = [v5 objectForKey:UIKeyboardFrameBeginUserInfoKey];
  id v7 = sub_1002469D0(v4, v6);

  uint64_t v8 = objc_opt_class();
  int v9 = [v3 userInfo];

  id v10 = [v9 objectForKey:UIKeyboardFrameEndUserInfoKey];
  objc_super v11 = sub_1002469D0(v8, v10);

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBC10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109B48C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBC30);
    }
    long long v25 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v25);
    }
    long long v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSKeyboardMonitor isKeyboardFrameChanging:]");
    long long v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSKeyboardMonitor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 350, 0, "invalid nil value for '%{public}s'", "frameBeginValue");

    if (v11) {
      goto LABEL_23;
    }
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_14:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBC50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109B3F8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBC70);
    }
    long long v28 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v28);
    }
    long long v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSKeyboardMonitor isKeyboardFrameChanging:]");
    long long v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSKeyboardMonitor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 351, 0, "invalid nil value for '%{public}s'", "frameEndValue");

    goto LABEL_23;
  }
  [v7 CGRectValue];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  [v11 CGRectValue];
  v33.origin.x = v20;
  v33.origin.y = v21;
  v33.size.double width = v22;
  v33.size.double height = v23;
  v32.origin.x = v13;
  v32.origin.y = v15;
  v32.size.double width = v17;
  v32.size.double height = v19;
  if (CGRectEqualToRect(v32, v33))
  {
LABEL_23:
    BOOL v24 = 0;
    goto LABEL_24;
  }
  BOOL v24 = 1;
LABEL_24:

  return v24;
}

+ (BOOL)keyboardIsVisibleAndDocked
{
  v2 = [a1 sharedKeyboardMonitor];
  unsigned __int8 v3 = [v2 keyboardIsVisibleAndDocked];

  return v3;
}

+ (BOOL)keyboardIsVisibleAndUndocked
{
  v2 = [a1 sharedKeyboardMonitor];
  unsigned __int8 v3 = [v2 keyboardIsVisibleAndUndocked];

  return v3;
}

+ (BOOL)undockedKeyboardWillShow
{
  v2 = [a1 sharedKeyboardMonitor];
  unsigned __int8 v3 = [v2 undockedKeyboardWillShow];

  return v3;
}

+ (BOOL)undockedKeyboardWillHide
{
  v2 = [a1 sharedKeyboardMonitor];
  unsigned __int8 v3 = [v2 undockedKeyboardWillHide];

  return v3;
}

+ (BOOL)keyboardIsAnimating
{
  v2 = [a1 sharedKeyboardMonitor];
  unsigned __int8 v3 = [v2 keyboardIsAnimating];

  return v3;
}

+ (BOOL)keyboardIsAnimatingInOrDocking
{
  v2 = [a1 sharedKeyboardMonitor];
  unsigned __int8 v3 = [v2 keyboardIsAnimatingInOrDocking];

  return v3;
}

+ (BOOL)keyboardIsAnimatingOutOrUndocking
{
  v2 = [a1 sharedKeyboardMonitor];
  unsigned __int8 v3 = [v2 keyboardIsAnimatingOutOrUndocking];

  return v3;
}

+ (void)afterKeyboardAnimationPerformBlock:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedKeyboardMonitor];
  [v5 afterKeyboardAnimationPerformBlock:v4];
}

+ (BOOL)isLocalKeyboardForNotification:(id)a3
{
  unsigned __int8 v3 = [a3 userInfo];
  id v4 = [v3 objectForKey:UIKeyboardIsLocalUserInfoKey];
  id v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = [v4 BOOLValue];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBC90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109B520();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBCB0);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSKeyboardMonitor isLocalKeyboardForNotification:]");
    int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSKeyboardMonitor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 399, 0, "invalid nil value for '%{public}s'", "localUserKeyValue");

    unsigned __int8 v6 = 1;
  }

  return v6;
}

+ (BOOL)isNullInputView:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBCD0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109B5B4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EBCF0);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSKeyboardMonitor isNullInputView:]");
    int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSKeyboardMonitor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 404, 0, "invalid nil value for '%{public}s'", "inputView");

    goto LABEL_14;
  }
  if (![v3 translatesAutoresizingMaskIntoConstraints]
    || ([v4 autoresizingMask] & 0x10) != 0)
  {
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }
  [v4 frame];
  BOOL v6 = v5 <= 0.0;
LABEL_15:

  return v6;
}

+ (CGRect)p_localKeyboardFrameFromReportedFrame:(CGRect)a3 screenBounds:(CGRect)a4 inputView:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v9 = a3.size.height;
  CGFloat v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v14 = a5;
  if (v14)
  {
    if ([a1 isNullInputView:v14])
    {
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v21);
      v24.origin.CGFloat x = 0.0;
      v24.size.CGFloat height = 0.0;
      v22.origin.CGFloat x = v12;
      v22.origin.CGFloat y = v11;
      v22.size.CGFloat width = v10;
      v22.size.CGFloat height = v9;
      v24.origin.CGFloat y = MaxY;
      v24.size.CGFloat width = width;
      if (!CGRectEqualToRect(v22, v24))
      {
        if (qword_101719BA0 != -1) {
          dispatch_once(&qword_101719BA0, &stru_1014EBD10);
        }
        double v16 = off_10166B5D0;
        if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_ERROR)) {
          sub_10109B648(v16, v12, v11, v10, v9, 0.0, MaxY, width, 0.0);
        }
        CGFloat v9 = 0.0;
        CGFloat v10 = width;
        CGFloat v11 = MaxY;
        CGFloat v12 = 0.0;
      }
    }
  }

  double v17 = v12;
  double v18 = v11;
  double v19 = v10;
  double v20 = v9;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)p_installKeyboardNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"p_keyboardWillShowOrDock:" name:UIKeyboardWillShowNotification object:0];
  [v3 addObserver:self selector:"p_keyboardDidShowOrDock:" name:UIKeyboardDidShowNotification object:0];
  [v3 addObserver:self selector:"p_keyboardWillHideOrUndock:" name:UIKeyboardWillHideNotification object:0];
  [v3 addObserver:self selector:"p_keyboardDidHideOrUndock:" name:UIKeyboardDidHideNotification object:0];
  [v3 addObserver:self selector:"p_keyboardWillChangeFrame:" name:UIKeyboardWillChangeFrameNotification object:0];
  [v3 addObserver:self selector:"p_keyboardDidChangeFrame:" name:UIKeyboardDidChangeFrameNotification object:0];
}

- (void)p_updateKeyboardInfoFromNotification:(id)a3
{
  id v4 = a3;
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBD30);
  }
  double v5 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 136315138;
    v39 = "-[CRLiOSKeyboardMonitor p_updateKeyboardInfoFromNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v38, 0xCu);
  }
  BOOL v6 = [v4 userInfo];
  self->_isLocalKeyboard = +[CRLiOSKeyboardMonitor isLocalKeyboardForNotification:v4];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 objectForKey:UIKeyboardFrameEndUserInfoKey];
  CGFloat v9 = sub_1002469D0(v7, v8);

  if (v9)
  {
    CGFloat v10 = +[UIApplication sharedApplication];
    CGFloat v11 = [v10 keyWindow];

    [v9 CGRectValue];
    double v16 = v12;
    double v17 = v13;
    double v18 = v14;
    double v19 = v15;
    if (self->_isLocalKeyboard)
    {
      double v20 = +[UIScreen mainScreen];
      [v20 bounds];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;

      long long v29 = [v11 firstResponder];
      long long v30 = [v29 inputView];
      +[CRLiOSKeyboardMonitor p_localKeyboardFrameFromReportedFrame:screenBounds:inputView:](CRLiOSKeyboardMonitor, "p_localKeyboardFrameFromReportedFrame:screenBounds:inputView:", v30, v16, v17, v18, v19, v22, v24, v26, v28);
      self->_keyboardFrame.origin.CGFloat x = v31;
      self->_keyboardFrame.origin.CGFloat y = v32;
      self->_keyboardFrame.size.CGFloat width = v33;
      self->_keyboardFrame.size.CGFloat height = v34;
    }
    else
    {
      self->_keyboardFrame.origin.CGFloat x = v12;
      self->_keyboardFrame.origin.CGFloat y = v13;
      self->_keyboardFrame.size.CGFloat width = v14;
      self->_keyboardFrame.size.CGFloat height = v15;
    }
    [(CRLiOSKeyboardMonitor *)self onScreenHeightInWindow:v11];
    self->_double onScreenHeight = v35;
  }
  v36 = [v6 objectForKey:UIKeyboardAnimationDurationUserInfoKey];
  [v36 doubleValue];
  self->_keyboardAnimationDuration = v37;
}

- (void)p_performAnimationCompletionBlocksWithVisible:(BOOL)a3
{
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBD50);
  }
  double v5 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v20 = "-[CRLiOSKeyboardMonitor p_performAnimationCompletionBlocksWithVisible:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v6 = self->_completionBlocks;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1002EEE50;
        v12[3] = &unk_1014CE130;
        v12[4] = v11;
        BOOL v13 = a3;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
}

- (BOOL)p_isFrameCorrespondingToUndockedKeyboard:(CGRect)a3
{
  if (!+[UIDevice crl_padUI])return 0; {
  id v4 = +[UIApplication sharedApplication];
  }
  double v5 = [v4 keyWindow];

  BOOL v6 = [v5 subviews];
  id v7 = [v6 firstObject];

  [v7 convertRect:0 fromView:self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v5 frame];
  [v7 convertRect:0 fromView:0];
  double MaxY = CGRectGetMaxY(v24);
  if (-[CRLiOSKeyboardMonitor p_isFrameCorrespondingToRotatedKeyboard:](self, "p_isFrameCorrespondingToRotatedKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height))
  {
    long long v17 = [v5 coordinateSpace];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;

    double MaxY = v19 - (v21 - MaxY);
  }
  v25.origin.CGFloat x = v9;
  v25.origin.CGFloat y = v11;
  v25.size.CGFloat width = v13;
  v25.size.CGFloat height = v15;
  BOOL v22 = CGRectGetMaxY(v25) < MaxY + -1.0;

  return v22;
}

- (BOOL)p_isFrameCorrespondingToRotatedKeyboard:(CGRect)a3
{
  double Width = CGRectGetWidth(a3);
  id v4 = +[UIScreen mainScreen];
  [v4 bounds];
  BOOL v5 = Width == CGRectGetHeight(v7);

  return v5;
}

- (double)onScreenHeightInWindow:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (CGRectGetHeight(self->_keyboardFrame) > 0.0
    && !-[CRLiOSKeyboardMonitor p_isFrameCorrespondingToUndockedKeyboard:](self, "p_isFrameCorrespondingToUndockedKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height))
  {
    if (-[CRLiOSKeyboardMonitor p_isFrameCorrespondingToRotatedKeyboard:](self, "p_isFrameCorrespondingToRotatedKeyboard:", self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height))
    {
      BOOL v6 = +[UIScreen mainScreen];
      [v6 bounds];
      double Width = CGRectGetWidth(v12);

      [(CRLiOSKeyboardMonitor *)self p_verticalSpacingFromWindow:v4 toWindow:0];
      double Height = Width - v8;
    }
    else
    {
      [v4 bounds];
      double Height = CGRectGetHeight(v13);
    }
    double MinY = CGRectGetMinY(self->_keyboardFrame);
    if (Height < MinY) {
      double MinY = Height;
    }
    double v5 = Height - MinY;
  }

  return v5;
}

- (double)p_verticalSpacingFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  double v9 = 0.0;
  if (v7 != v6 && self->_onScreenHeight != 0.0)
  {
    if (v7)
    {
      [v7 frame];
      double Height = CGRectGetHeight(v13);
    }
    else
    {
      CGFloat v11 = +[UIScreen mainScreen];
      [v11 bounds];
      double Height = CGRectGetHeight(v14);
    }
    [v6 frame];
    double v9 = fmax((Height - CGRectGetHeight(v15)) * 0.5, 0.0);
  }

  return v9;
}

- (BOOL)p_isNotificationCorrespondingToUndockedKeyboardWillShow:(id)a3
{
  id v4 = a3;
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBD70);
  }
  double v5 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    double v19 = "-[CRLiOSKeyboardMonitor p_isNotificationCorrespondingToUndockedKeyboardWillShow:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v6 = objc_opt_class();
  id v7 = [v4 userInfo];
  double v8 = [v7 objectForKey:UIKeyboardFrameBeginUserInfoKey];
  double v9 = sub_1002469D0(v6, v8);

  uint64_t v10 = objc_opt_class();
  CGFloat v11 = [v4 userInfo];
  CGRect v12 = [v11 objectForKey:UIKeyboardFrameEndUserInfoKey];
  CGRect v13 = sub_1002469D0(v10, v12);

  BOOL v14 = 0;
  if (v9)
  {
    if (v13)
    {
      [v9 CGRectValue];
      double Height = CGRectGetHeight(v20);
      [v13 CGRectValue];
      double v16 = CGRectGetHeight(v21);
      BOOL v14 = 0;
      if (Height > 0.0 && v16 > 0.0)
      {
        if (Height == v16 || vabdd_f64(Height, v16) < 0.00999999978)
        {
          [v13 CGRectValue];
          BOOL v14 = -[CRLiOSKeyboardMonitor p_isFrameCorrespondingToUndockedKeyboard:](self, "p_isFrameCorrespondingToUndockedKeyboard:");
        }
        else
        {
          BOOL v14 = 0;
        }
      }
    }
  }

  return v14;
}

- (BOOL)p_isNotificationCorrespondingToUndockedKeyboardWillHide:(id)a3
{
  id v3 = a3;
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBD90);
  }
  id v4 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    int v18 = "-[CRLiOSKeyboardMonitor p_isNotificationCorrespondingToUndockedKeyboardWillHide:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v3 userInfo];
  id v7 = [v6 objectForKey:UIKeyboardFrameBeginUserInfoKey];
  double v8 = sub_1002469D0(v5, v7);

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v3 userInfo];
  CGFloat v11 = [v10 objectForKey:UIKeyboardFrameEndUserInfoKey];
  CGRect v12 = sub_1002469D0(v9, v11);

  BOOL v13 = 0;
  if (v8 && v12)
  {
    [v8 CGRectValue];
    double Height = CGRectGetHeight(v19);
    [v12 CGRectValue];
    double v15 = CGRectGetHeight(v20);
    BOOL v13 = (Height == 0.0 || vabdd_f64(0.0, Height) < 0.00999999978)
       && (vabdd_f64(0.0, v15) < 0.00999999978 || v15 == 0.0);
  }

  return v13;
}

- (void)p_keyboardWillChangeFrame:(id)a3
{
  id v4 = a3;
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBDB0);
  }
  uint64_t v5 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[CRLiOSKeyboardMonitor p_keyboardWillChangeFrame:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (!self->_keyboardIsAnimatingInOrDocking && !self->_keyboardIsAnimatingOutOrUndocking)
  {
    [(CRLiOSKeyboardMonitor *)self p_updateKeyboardInfoFromNotification:v4];
    self->_undockedKeyboardWillShow = [(CRLiOSKeyboardMonitor *)self p_isNotificationCorrespondingToUndockedKeyboardWillShow:v4];
    self->_undockedKeyboardWillHide = [(CRLiOSKeyboardMonitor *)self p_isNotificationCorrespondingToUndockedKeyboardWillHide:v4];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002EF83C;
    v6[3] = &unk_1014EBAB0;
    id v7 = v4;
    [(CRLiOSKeyboardMonitor *)self p_enumerateObserversUsingBlock:v6];
  }
}

- (void)p_keyboardDidChangeFrame:(id)a3
{
  id v4 = a3;
  if (qword_101719BA0 != -1) {
    dispatch_once(&qword_101719BA0, &stru_1014EBDD0);
  }
  uint64_t v5 = off_10166B5D0;
  if (os_log_type_enabled((os_log_t)off_10166B5D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[CRLiOSKeyboardMonitor p_keyboardDidChangeFrame:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  if (!self->_keyboardIsAnimatingInOrDocking && !self->_keyboardIsAnimatingOutOrUndocking)
  {
    [(CRLiOSKeyboardMonitor *)self p_updateKeyboardInfoFromNotification:v4];
    *(_WORD *)&self->_undockedKeyboardWillShow = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002EFA74;
    v7[3] = &unk_1014EBAB0;
    id v8 = v4;
    [(CRLiOSKeyboardMonitor *)self p_enumerateObserversUsingBlock:v7];
    BOOL v6 = self->_keyboardFrame.size.height > 0.0 || self->_keyboardFrame.size.width > 0.0;
    [(CRLiOSKeyboardMonitor *)self p_performAnimationCompletionBlocksWithVisible:v6];
  }
}

- (BOOL)keyboardIsAnimatingInOrDocking
{
  return self->_keyboardIsAnimatingInOrDocking;
}

- (void)setKeyboardIsAnimatingInOrDocking:(BOOL)a3
{
  self->_keyboardIsAnimatingInOrDocking = a3;
}

- (BOOL)keyboardIsAnimatingOutOrUndocking
{
  return self->_keyboardIsAnimatingOutOrUndocking;
}

- (BOOL)undockedKeyboardWillShow
{
  return self->_undockedKeyboardWillShow;
}

- (BOOL)undockedKeyboardWillHide
{
  return self->_undockedKeyboardWillHide;
}

- (BOOL)isLocalKeyboard
{
  return self->_isLocalKeyboard;
}

- (double)onScreenHeight
{
  return self->_onScreenHeight;
}

- (CGRect)keyboardFrame
{
  objc_copyStruct(v6, &self->_keyboardFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (double)keyboardAnimationDuration
{
  return self->_keyboardAnimationDuration;
}

- (NSPointerArray)keyboardObservers
{
  return self->_keyboardObservers;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (NSTimer)keyboardIsAnimatingInTimer
{
  return self->_keyboardIsAnimatingInTimer;
}

- (void)setKeyboardIsAnimatingInTimer:(id)a3
{
}

- (NSHashTable)modalKeyboardObservers
{
  return self->_modalKeyboardObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalKeyboardObservers, 0);
  objc_storeStrong((id *)&self->_keyboardIsAnimatingInTimer, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);

  objc_storeStrong((id *)&self->_keyboardObservers, 0);
}

@end