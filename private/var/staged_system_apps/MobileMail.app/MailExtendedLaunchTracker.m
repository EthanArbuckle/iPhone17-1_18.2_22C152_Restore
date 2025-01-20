@interface MailExtendedLaunchTracker
+ (OS_os_log)log;
- (MailExtendedLaunchTracker)initWithDelegate:(id)a3;
- (MailExtendedLaunchTrackerDelegate)delegate;
- (NSMutableDictionary)observedScenes;
- (id)_sceneID:(id)a3;
- (id)_viewControllerID:(id)a3;
- (void)didFinishLoadViewController:(id)a3 scene:(id)a4;
- (void)observeScene:(id)a3;
- (void)observeViewController:(id)a3 scene:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setObservedScenes:(id)a3;
@end

@implementation MailExtendedLaunchTracker

- (id)_viewControllerID:(id)a3
{
  v3 = +[NSValue valueWithNonretainedObject:a3];

  return v3;
}

- (MailExtendedLaunchTracker)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MailExtendedLaunchTracker;
  v5 = [(MailExtendedLaunchTracker *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = objc_opt_new();
    observedScenes = v6->_observedScenes;
    v6->_observedScenes = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (void)observeScene:(id)a3
{
  id v6 = [(MailExtendedLaunchTracker *)self _sceneID:a3];
  id v4 = objc_opt_new();
  v5 = [(MailExtendedLaunchTracker *)self observedScenes];
  [v5 setObject:v4 forKeyedSubscript:v6];
}

- (void)observeViewController:(id)a3 scene:(id)a4
{
  id v11 = a3;
  id v6 = [(MailExtendedLaunchTracker *)self _sceneID:a4];
  uint64_t v7 = [(MailExtendedLaunchTracker *)self observedScenes];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    v9 = [(MailExtendedLaunchTracker *)self _viewControllerID:v11];
    objc_super v10 = [v7 objectForKeyedSubscript:v6];
    [v10 addObject:v9];
  }
}

- (void)didFinishLoadViewController:(id)a3 scene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MailExtendedLaunchTracker log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v18 = 138544130;
    id v19 = v10;
    __int16 v20 = 2048;
    id v21 = v6;
    __int16 v22 = 2114;
    v23 = v12;
    __int16 v24 = 2048;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didFinishLoadViewController:<%{public}@: %p> scene: <%{public}@: %p>", (uint8_t *)&v18, 0x2Au);
  }
  v13 = [(MailExtendedLaunchTracker *)self _sceneID:v7];
  v14 = [(MailExtendedLaunchTracker *)self _viewControllerID:v6];
  v15 = [(MailExtendedLaunchTracker *)self observedScenes];
  v16 = [v15 objectForKeyedSubscript:v13];
  if ([v16 containsObject:v14])
  {
    [v16 removeObject:v14];
    if (v16 && ![v16 count]) {
      [v15 removeObjectForKey:v13];
    }
    if (![v15 count])
    {
      v17 = [(MailExtendedLaunchTracker *)self delegate];
      [v17 didFinishLoadAllScenes:self];
    }
  }
}

- (id)_sceneID:(id)a3
{
  v3 = [a3 session];
  id v4 = [v3 persistentIdentifier];

  return v4;
}

- (NSMutableDictionary)observedScenes
{
  return self->_observedScenes;
}

- (MailExtendedLaunchTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MailExtendedLaunchTrackerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedScenes, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009908;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699680 != -1) {
    dispatch_once(&qword_100699680, block);
  }
  v2 = (void *)qword_100699678;

  return (OS_os_log *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (void)setObservedScenes:(id)a3
{
}

@end