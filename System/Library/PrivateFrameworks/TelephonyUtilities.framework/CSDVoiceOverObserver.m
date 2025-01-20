@interface CSDVoiceOverObserver
- (BOOL)isBrailleScreenInputEnabled;
- (BOOL)isEnabled;
- (BOOL)shouldRouteToSpeakerWithProximity;
- (CSDVoiceOverObserver)initWithQueue:(id)a3;
- (NSMapTable)delegateToQueue;
- (OS_dispatch_queue)queue;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)handleAXSVoiceOverTouchEnabledNotification:(id)a3;
- (void)performAsynchronousBlock:(id)a3;
- (void)performSynchronousBlock:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)updateEnabled;
@end

@implementation CSDVoiceOverObserver

- (CSDVoiceOverObserver)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDVoiceOverObserver;
  v6 = [(CSDVoiceOverObserver *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    dispatch_queue_set_specific((dispatch_queue_t)v7->_queue, v7, v7, 0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001C3BB4;
    v9[3] = &unk_100504EC0;
    v10 = v7;
    [(CSDVoiceOverObserver *)v10 performAsynchronousBlock:v9];
  }
  return v7;
}

- (void)dealloc
{
  dispatch_queue_set_specific((dispatch_queue_t)self->_queue, self, 0, 0);
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:kAXSVoiceOverTouchEnabledNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)CSDVoiceOverObserver;
  [(CSDVoiceOverObserver *)&v4 dealloc];
}

- (BOOL)isEnabled
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C3D70;
  v4[3] = &unk_100505008;
  v4[4] = self;
  v4[5] = &v5;
  [(CSDVoiceOverObserver *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CSDVoiceOverObserver *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = [(CSDVoiceOverObserver *)self delegateToQueue];
    id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v9);
          if (objc_opt_respondsToSelector())
          {
            [(CSDVoiceOverObserver *)self delegateToQueue];
            v12 = BOOL v11 = v3;
            v13 = [v12 objectForKey:v10];

            BOOL v3 = v11;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1001C3F5C;
            block[3] = &unk_1005050D0;
            block[4] = v10;
            block[5] = self;
            BOOL v16 = v11;
            dispatch_async(v13, block);
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)isBrailleScreenInputEnabled
{
  BOOL v2 = [(CSDVoiceOverObserver *)self isEnabled];
  if (v2) {
    LOBYTE(v2) = _AXSBrailleScreenInputEnabled() != 0;
  }
  return v2;
}

- (BOOL)shouldRouteToSpeakerWithProximity
{
  return _AXSVoiceOverTouchShouldRouteToSpeakerWithProximity() != 0;
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(self) == self)
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    id v7 = [(CSDVoiceOverObserver *)self queue];
    dispatch_sync(v7, v5);
  }
}

- (void)performAsynchronousBlock:(id)a3
{
  if (dispatch_get_specific(self) == self)
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    id v7 = [(CSDVoiceOverObserver *)self queue];
    dispatch_async(v7, v5);
  }
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001C4198;
  v9[3] = &unk_100504FE0;
  void v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(CSDVoiceOverObserver *)self performAsynchronousBlock:v9];
}

- (void)removeDelegate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C4280;
  v4[3] = &unk_100504F10;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CSDVoiceOverObserver *)v5 performSynchronousBlock:v4];
}

- (void)handleAXSVoiceOverTouchEnabledNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001C43EC;
  v6[3] = &unk_100504EC0;
  v6[4] = self;
  [(CSDVoiceOverObserver *)self performAsynchronousBlock:v6];
}

- (void)updateEnabled
{
  id v3 = [(CSDVoiceOverObserver *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = _AXSVoiceOverTouchEnabled() != 0;

  [(CSDVoiceOverObserver *)self setEnabled:v4];
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_delegateToQueue, 0);
}

@end