@interface MapsAppAnimationSuppressor
+ (id)acquireAnimationSuppressionTokenForReason:(id)a3;
+ (id)sharedInstance;
- (MapsAppAnimationSuppressor)init;
- (id)_acquireAnimationSuppressionTokenForReason:(id)a3;
- (void)_refreshAnimationSuppression;
- (void)decrementForToken:(id)a3;
- (void)incrementForToken:(id)a3;
@end

@implementation MapsAppAnimationSuppressor

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BC0618;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_101610A10 != -1) {
    dispatch_once(&qword_101610A10, block);
  }
  v2 = (void *)qword_101610A08;

  return v2;
}

- (MapsAppAnimationSuppressor)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapsAppAnimationSuppressor;
  v2 = [(MapsAppAnimationSuppressor *)&v6 init];
  if (v2)
  {
    v3 = [[MapsTokenStorage alloc] initWithDelegate:v2 tokenGroupName:@"MapsAppAnimationSuppression" callbackQueue:&_dispatch_main_q];
    tokens = v2->_tokens;
    v2->_tokens = v3;
  }
  return v2;
}

+ (id)acquireAnimationSuppressionTokenForReason:(id)a3
{
  id v4 = a3;
  v5 = [a1 sharedInstance];
  objc_super v6 = [v5 _acquireAnimationSuppressionTokenForReason:v4];

  return v6;
}

- (id)_acquireAnimationSuppressionTokenForReason:(id)a3
{
  return [(MapsTokenStorage *)self->_tokens tokenWithReason:a3];
}

- (void)_refreshAnimationSuppression
{
  unint64_t v3 = [(MapsTokenStorage *)self->_tokens count];
  id v4 = sub_100BC08C4();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      objc_super v6 = [(MapsTokenStorage *)self->_tokens allTokenReasons];
      int v11 = 134218242;
      unint64_t v12 = v3;
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Suppressing animations for %lu reasons: %@", (uint8_t *)&v11, 0x16u);
    }
    +[UIView setAnimationsEnabled:0];
    if (!self->_suppressionTimer)
    {
      v7 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:1 repeating:&stru_10131A910 block:10.0];
      suppressionTimer = self->_suppressionTimer;
      self->_suppressionTimer = v7;
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unsuppressing animations", (uint8_t *)&v11, 2u);
    }

    v9 = self->_suppressionTimer;
    if (v9)
    {
      [(GCDTimer *)v9 invalidate];
      v10 = self->_suppressionTimer;
      self->_suppressionTimer = 0;

      +[UIView setAnimationsEnabled:1];
    }
  }
}

- (void)incrementForToken:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100BC08C4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_super v6 = [v4 reason];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Adding token for reason: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(MapsAppAnimationSuppressor *)self _refreshAnimationSuppression];
}

- (void)decrementForToken:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100BC08C4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_super v6 = [v4 reason];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Removing token for reason: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(MapsAppAnimationSuppressor *)self _refreshAnimationSuppression];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);

  objc_storeStrong((id *)&self->_suppressionTimer, 0);
}

@end