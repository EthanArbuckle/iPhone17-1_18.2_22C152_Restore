@interface PKDiscoveryDriver
- (NSDictionary)attributes;
- (NSSet)lastResults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)sync;
- (OS_os_activity)relatedActivity;
- (PKDiscoveryDriver)initWithAttributes:(id)a3 flags:(unint64_t)a4 host:(id)a5 report:(id)a6;
- (PKDiscoveryLSWatcher)lsWatcher;
- (PKHost)host;
- (id)mcNotificationToken;
- (id)report;
- (int)annotationNotifyToken;
- (unint64_t)flags;
- (void)_performWithPreviousResults:(id)a3 forceNotify:(BOOL)a4 uninstalledProxies:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)installWatchers;
- (void)performWithPreviousResults:(id)a3 forceNotify:(BOOL)a4;
- (void)removeWatchers;
- (void)setAnnotationNotifyToken:(int)a3;
- (void)setAttributes:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setHost:(id)a3;
- (void)setLastResults:(id)a3;
- (void)setLsWatcher:(id)a3;
- (void)setMcNotificationToken:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelatedActivity:(id)a3;
- (void)setReport:(id)a3;
- (void)setSync:(id)a3;
@end

@implementation PKDiscoveryDriver

- (void)setSync:(id)a3
{
}

- (void)setReport:(id)a3
{
}

- (void)setRelatedActivity:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void)setHost:(id)a3
{
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void)setAttributes:(id)a3
{
}

- (void)performWithPreviousResults:(id)a3 forceNotify:(BOOL)a4
{
  id v6 = a3;
  v7 = [(PKDiscoveryDriver *)self relatedActivity];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38B3E04;
  block[3] = &unk_1E6059058;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  os_activity_apply(v7, block);
}

- (OS_os_activity)relatedActivity
{
  return (OS_os_activity *)objc_getProperty(self, a2, 40, 1);
}

- (PKDiscoveryDriver)initWithAttributes:(id)a3 flags:(unint64_t)a4 host:(id)a5 report:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  os_activity_t v13 = _os_activity_create(&dword_1B38B0000, "continuous-discovery", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_1B38B789C;
  v33 = sub_1B38B786C;
  id v34 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38B2838;
  block[3] = &unk_1E6058FE0;
  v22 = self;
  id v23 = v10;
  v27 = &v29;
  unint64_t v28 = a4;
  os_activity_t v24 = v13;
  id v25 = v11;
  id v26 = v12;
  id v14 = v11;
  v15 = v13;
  id v16 = v12;
  id v17 = v10;
  v18 = self;
  os_activity_apply(v15, block);
  v19 = (PKDiscoveryDriver *)(id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v19;
}

- (void)installWatchers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = self;
    _os_log_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> installing watchers for continuous discovery", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v4 = [[PKDiscoveryLSWatcher alloc] initWithDriver:self];
  [(PKDiscoveryDriver *)self setLsWatcher:v4];

  int out_token = 0;
  v5 = [(PKDiscoveryDriver *)self queue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1B38BFC44;
  handler[3] = &unk_1E6059120;
  objc_copyWeak(&v17, (id *)buf);
  sub_1B38B3CAC(&out_token, v5, handler);

  [(PKDiscoveryDriver *)self setAnnotationNotifyToken:out_token];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B38BFD48;
  v14[3] = &unk_1E6059148;
  objc_copyWeak(&v15, (id *)buf);
  id v6 = (void *)MEMORY[0x1B3EBB710](v14);
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = [MEMORY[0x1E4F28F08] mainQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B38BFE4C;
  v11[3] = &unk_1E6059170;
  objc_copyWeak(&v13, (id *)buf);
  id v9 = v6;
  id v12 = v9;
  id v10 = [v7 addObserverForName:@"com.apple.managedconfiguration.effectivesettingschanged" object:0 queue:v8 usingBlock:v11];
  [(PKDiscoveryDriver *)self setMcNotificationToken:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (id)report
{
  return objc_getProperty(self, a2, 32, 1);
}

- (PKHost)host
{
  return (PKHost *)objc_getProperty(self, a2, 88, 1);
}

- (OS_dispatch_queue)sync
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMcNotificationToken:(id)a3
{
}

- (void)setLsWatcher:(id)a3
{
}

- (void)setLastResults:(id)a3
{
}

- (void)setAnnotationNotifyToken:(int)a3
{
  self->_annotationNotifyToken = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (int)annotationNotifyToken
{
  return self->_annotationNotifyToken;
}

- (void)dealloc
{
  v3 = [(PKDiscoveryDriver *)self relatedActivity];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38BF458;
  block[3] = &unk_1E6058CF0;
  void block[4] = self;
  os_activity_apply(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)PKDiscoveryDriver;
  [(PKDiscoveryDriver *)&v4 dealloc];
}

- (void)_performWithPreviousResults:(id)a3 forceNotify:(BOOL)a4 uninstalledProxies:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PKDiscoveryDriver *)self report];

  if (v10)
  {
    id v11 = [(PKDiscoveryDriver *)self relatedActivity];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B38BF5FC;
    v12[3] = &unk_1E60590D0;
    id v13 = v9;
    BOOL v16 = a4;
    id v14 = v8;
    id v15 = self;
    os_activity_apply(v11, v12);
  }
}

- (void)cancel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v14 = self;
    _os_log_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> explicit cancellation for discovery", buf, 0xCu);
  }

  objc_super v4 = [(PKDiscoveryDriver *)self report];
  v5 = dispatch_get_current_queue();
  id v6 = [(PKDiscoveryDriver *)self sync];

  if (v5 == v6)
  {
    [(PKDiscoveryDriver *)self removeWatchers];
  }
  else
  {
    v7 = [(PKDiscoveryDriver *)self sync];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B38BFBA0;
    block[3] = &unk_1E6058CF0;
    void block[4] = self;
    dispatch_sync(v7, block);
  }
  id v8 = [(PKDiscoveryDriver *)self queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B38BFBA8;
  v10[3] = &unk_1E60590F8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)removeWatchers
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = self;
    _os_log_impl(&dword_1B38B0000, v3, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> removing watchers for continous discovery", (uint8_t *)&v7, 0xCu);
  }

  if ([(PKDiscoveryDriver *)self annotationNotifyToken])
  {
    objc_super v4 = [(PKDiscoveryDriver *)self lsWatcher];
    [v4 stopUpdates];

    sub_1B38C2AA0([(PKDiscoveryDriver *)self annotationNotifyToken]);
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v6 = [(PKDiscoveryDriver *)self mcNotificationToken];
    [v5 removeObserver:v6];

    [(PKDiscoveryDriver *)self setAnnotationNotifyToken:0];
    [(PKDiscoveryDriver *)self setReport:0];
  }
}

- (NSSet)lastResults
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (id)mcNotificationToken
{
  return objc_getProperty(self, a2, 56, 1);
}

- (PKDiscoveryLSWatcher)lsWatcher
{
  return (PKDiscoveryLSWatcher *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lsWatcher, 0);
  objc_storeStrong(&self->_mcNotificationToken, 0);
  objc_storeStrong((id *)&self->_lastResults, 0);
  objc_storeStrong((id *)&self->_relatedActivity, 0);
  objc_storeStrong(&self->_report, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end