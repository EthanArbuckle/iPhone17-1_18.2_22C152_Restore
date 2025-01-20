@interface MFKeyboardAvoidance
+ (id)sharedController;
- (CGRect)_frameInViewUsingForView:(id)a3 keyboardInfo:(id)a4;
- (CGRect)_keyboardOverlapForView:(id)a3 usingKeyboardInfo:(id)a4;
- (double)_keyboardVerticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4;
- (id)_init;
- (void)_adjustAvoidable:(id)a3 forAutomaticKeyboardInfo:(id)a4 animated:(BOOL)a5;
- (void)_adjustAvoidablesForKeyboardInfo:(id)a3;
- (void)_keyboardDidChangeFrame:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_registerForKeyboardNotifications;
- (void)_unregisterForKeyboardNotifications;
- (void)dealloc;
- (void)registerKeyboardAvoidable:(id)a3;
- (void)unregisterKeyboardAvoidable:(id)a3;
@end

@implementation MFKeyboardAvoidance

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019BCD8;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699AD0 != -1) {
    dispatch_once(&qword_100699AD0, block);
  }
  v2 = (void *)qword_100699AC8;

  return v2;
}

- (void)dealloc
{
  [(MFKeyboardAvoidance *)self _unregisterForKeyboardNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MFKeyboardAvoidance;
  [(MFKeyboardAvoidance *)&v3 dealloc];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MFKeyboardAvoidance;
  return [(MFKeyboardAvoidance *)&v3 init];
}

- (void)registerKeyboardAvoidable:(id)a3
{
  id v4 = a3;
  if (!self->_keyboardAvoidables)
  {
    v5 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:1];
    keyboardAvoidables = self->_keyboardAvoidables;
    self->_keyboardAvoidables = v5;
  }
  v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = 2048;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#keyboard registering keyboard avoidable <%{public}@:%p>", buf, 0x16u);
  }

  [(NSHashTable *)self->_keyboardAvoidables addObject:v4];
  v8 = [(NSHashTable *)self->_keyboardAvoidables allObjects];
  if ([v8 count] == (id)1)
  {
    BOOL v9 = !self->_registeredForNotifications;

    if (v9) {
      [(MFKeyboardAvoidance *)self _registerForKeyboardNotifications];
    }
  }
  else
  {
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10019C074;
  v15[3] = &unk_100604618;
  v15[4] = self;
  id v10 = v4;
  id v16 = v10;
  v11 = objc_retainBlock(v15);
  v12 = [v10 transitionCoordinatorForKeyboardAvoidance:self];
  if (v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10019C088;
    v13[3] = &unk_100606330;
    v14 = v11;
    [v12 animateAlongsideTransition:0 completion:v13];
  }
  else
  {
    ((void (*)(void *))v11[2])(v11);
  }
}

- (void)unregisterKeyboardAvoidable:(id)a3
{
  id v4 = a3;
  v5 = [v4 transitionCoordinatorForKeyboardAvoidance:self];
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = objc_opt_class();
    __int16 v16 = 2048;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#keyboard unregistering keyboard avoidable <%{public}@:%p>", buf, 0x16u);
  }

  [(NSHashTable *)self->_keyboardAvoidables removeObject:v4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10019C2D4;
  v13[3] = &unk_1006047A0;
  void v13[4] = self;
  v7 = objc_retainBlock(v13);
  v8 = v7;
  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10019C388;
    v11[3] = &unk_100606330;
    v12 = v7;
    [v5 animateAlongsideTransition:0 completion:v11];
    BOOL v9 = v12;
  }
  else
  {
    BOOL v9 = +[EFScheduler mainThreadScheduler];
    id v10 = [v9 afterDelay:v8 performBlock:1.0];
  }
}

- (double)_keyboardVerticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4
{
  id v6 = a3;
  [(MFKeyboardAvoidance *)self _frameInViewUsingForView:v6 keyboardInfo:a4];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double v11 = 0.0;
  if (!CGRectIsEmpty(v14))
  {
    [v6 bounds];
    double MaxY = CGRectGetMaxY(v15);
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    double v11 = fmax(MaxY - CGRectGetMinY(v16), 0.0);
  }

  return v11;
}

- (CGRect)_keyboardOverlapForView:(id)a3 usingKeyboardInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MFKeyboardAvoidance *)self _frameInViewUsingForView:v6 keyboardInfo:v7];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  if (CGRectIsEmpty(v20))
  {
    CGFloat v12 = CGRectNull.origin.x;
    CGFloat v13 = CGRectNull.origin.y;
    CGFloat v14 = CGRectNull.size.width;
    CGFloat v15 = CGRectNull.size.height;
  }
  else
  {
    [v6 bounds];
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    CGRect v22 = CGRectIntersection(v21, v24);
    CGFloat v12 = v22.origin.x;
    CGFloat v13 = v22.origin.y;
    CGFloat v14 = v22.size.width;
    CGFloat v15 = v22.size.height;
  }

  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)_frameInViewUsingForView:(id)a3 keyboardInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
    [v8 CGRectValue];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v5;
    }
    else
    {
      id v17 = [v5 window];
    }
    CGRect v22 = v17;
    [v17 convertRect:0 fromWindow:v10, v12, v14, v16];
    [v5 convertRect:0 fromView:];
    CGFloat x = v23;
    CGFloat y = v24;
    CGFloat width = v25;
    CGFloat height = v26;
    v27 = MFLogGeneral();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v38.origin.CGFloat x = v10;
      v38.origin.CGFloat y = v12;
      v38.size.CGFloat width = v14;
      v38.size.CGFloat height = v16;
      v28 = NSStringFromCGRect(v38);
      v39.origin.CGFloat x = x;
      v39.origin.CGFloat y = y;
      v39.size.CGFloat width = width;
      v39.size.CGFloat height = height;
      v29 = NSStringFromCGRect(v39);
      int v34 = 138543618;
      v35 = v28;
      __int16 v36 = 2114;
      v37 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "#keyboard _keyboardOverlap calculation - frameInScreen:%{public}@ frameInView:%{public}@", (uint8_t *)&v34, 0x16u);
    }
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v30 = x;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (void)_adjustAvoidable:(id)a3 forAutomaticKeyboardInfo:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  double v10 = [v8 viewForKeyboardAvoidance:self];
  [(MFKeyboardAvoidance *)self _keyboardVerticalOverlapForView:v10 usingKeyboardInfo:v9];
  uint64_t v12 = v11;
  [(MFKeyboardAvoidance *)self _keyboardOverlapForView:v10 usingKeyboardInfo:v9];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10019C9B0;
  v28[3] = &unk_10060B870;
  id v21 = v8;
  uint64_t v31 = v12;
  uint64_t v32 = v14;
  uint64_t v33 = v16;
  uint64_t v34 = v18;
  uint64_t v35 = v20;
  id v29 = v21;
  double v30 = self;
  CGRect v22 = objc_retainBlock(v28);
  double v23 = [v9 objectForKeyedSubscript:UIKeyboardAnimationDurationUserInfoKey];
  [v23 doubleValue];
  double v25 = v24;

  if (v5 && v25 > 0.0)
  {
    double v26 = [v9 objectForKeyedSubscript:UIKeyboardAnimationCurveUserInfoKey];
    uint64_t v27 = (void)[v26 integerValue] << 16;

    +[UIView animateWithDuration:v27 delay:v22 options:0 animations:v25 completion:0.0];
  }
  else
  {
    ((void (*)(void *))v22[2])(v22);
  }
}

- (void)_adjustAvoidablesForKeyboardInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#keyboard adjust avoidables for keyboard info: %{public}@", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_keyboardAvoidables;
  id v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        if (v10) {
          -[MFKeyboardAvoidance _adjustAvoidable:forAutomaticKeyboardInfo:animated:](self, "_adjustAvoidable:forAutomaticKeyboardInfo:animated:", v10, v4, 1, (void)v13);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (NSDictionary *)[v4 copy];
  currentKeyboardInfo = self->_currentKeyboardInfo;
  self->_currentKeyboardInfo = v11;
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = a3;
  BOOL v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 userInfo];
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#keyboard keyboard will hide: %{public}@", buf, 0xCu);
  }
  id v7 = [v4 userInfo];
  NSRunLoopMode v9 = NSRunLoopCommonModes;
  uint64_t v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [(MFKeyboardAvoidance *)self performSelector:"_adjustAvoidablesForKeyboardInfo:" withObject:v7 afterDelay:v8 inModes:0.0];
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = a3;
  BOOL v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 userInfo];
    int v8 = 138543362;
    NSRunLoopMode v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#keyboard keyboard will show: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [v4 userInfo];
  [(MFKeyboardAvoidance *)self _adjustAvoidablesForKeyboardInfo:v7];

  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_adjustAvoidablesForKeyboardInfo:" object:0];
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  id v4 = a3;
  BOOL v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 userInfo];
    int v8 = 138543362;
    NSRunLoopMode v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#keyboard keyboard did change frame: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [v4 userInfo];
  [(MFKeyboardAvoidance *)self _adjustAvoidablesForKeyboardInfo:v7];

  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_adjustAvoidablesForKeyboardInfo:" object:0];
}

- (void)_registerForKeyboardNotifications
{
  objc_super v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#keyboard registering for keyboard notifications", v5, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];
  [v4 addObserver:self selector:"_keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
  [v4 addObserver:self selector:"_keyboardDidChangeFrame:" name:UIKeyboardDidChangeFrameNotification object:0];
  self->_registeredForNotifications = 1;
}

- (void)_unregisterForKeyboardNotifications
{
  objc_super v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#keyboard unregistering for keyboard notifications", v6, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIKeyboardWillShowNotification object:0];
  [v4 removeObserver:self name:UIKeyboardWillHideNotification object:0];
  [v4 removeObserver:self name:UIKeyboardDidChangeFrameNotification object:0];
  currentKeyboardInfo = self->_currentKeyboardInfo;
  self->_currentKeyboardInfo = 0;

  self->_registeredForNotifications = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentKeyboardInfo, 0);

  objc_storeStrong((id *)&self->_keyboardAvoidables, 0);
}

@end