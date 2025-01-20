@interface MRDMusicHandoffSession
- (MRDMusicHandoffSession)initWithSource:(id)a3 destination:(id)a4;
- (MRPlayerPath)destinationPlayerPath;
- (MRPlayerPath)sourcePlayerPath;
- (NSString)identifier;
- (OS_dispatch_queue)notificationQueue;
- (id)description;
- (int64_t)state;
- (os_unfair_lock_s)lock;
- (void)handleEvent:(id)a3;
- (void)invalidate;
- (void)setState:(int64_t)a3;
- (void)start;
@end

@implementation MRDMusicHandoffSession

- (MRDMusicHandoffSession)initWithSource:(id)a3 destination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MRDMusicHandoffSession;
  v9 = [(MRDMusicHandoffSession *)&v19 init];
  if (v9)
  {
    uint64_t v10 = MSVNanoIDCreateTaggedPointer();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_sourcePlayerPath, a3);
    objc_storeStrong((id *)&v9->_destinationPlayerPath, a4);
    v9->_state = 0;
    v9->_lock._os_unfair_lock_opaque = 0;
    id v12 = +[NSString stringWithFormat:@"com.apple.MediaRemote.MRDMusicHandoffSession-%@", v9->_identifier];
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = MRMusicHandoffSessionGetQueue();
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2(v13, v14, v15);
    notificationQueue = v9->_notificationQueue;
    v9->_notificationQueue = (OS_dispatch_queue *)v16;
  }
  return v9;
}

- (id)description
{
  v2 = [(MRDMusicHandoffSession *)self identifier];
  v3 = +[NSString stringWithFormat:@"<MRDMusicHandoffSession - identifier: %@>", v2];

  return v3;
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_state = 1;
  os_unfair_lock_unlock(p_lock);
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052E7C;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)notificationQueue, block);
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  self->_int64_t state = 2;
  os_unfair_lock_unlock(p_lock);
  if (state != 2)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100052F8C;
    block[3] = &unk_100415CC8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)notificationQueue, block);
  }
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  if (v5 == (id)1)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_int64_t state = 2;
    os_unfair_lock_unlock(&self->_lock);
    notificationQueue = self->_notificationQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000532DC;
    v11[3] = &unk_1004158D8;
    v11[4] = self;
    id v7 = &v12;
    id v12 = v4;
    id v8 = v11;
  }
  else if (v5 == (id)2)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_int64_t state = 2;
    os_unfair_lock_unlock(&self->_lock);
    notificationQueue = self->_notificationQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005321C;
    v13[3] = &unk_1004158D8;
    v13[4] = self;
    id v7 = &v14;
    id v14 = v4;
    id v8 = v13;
  }
  else
  {
    notificationQueue = self->_notificationQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005339C;
    v9[3] = &unk_1004158D8;
    v9[4] = self;
    id v7 = &v10;
    id v10 = v4;
    id v8 = v9;
  }
  dispatch_async((dispatch_queue_t)notificationQueue, v8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRPlayerPath)sourcePlayerPath
{
  return self->_sourcePlayerPath;
}

- (MRPlayerPath)destinationPlayerPath
{
  return self->_destinationPlayerPath;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_destinationPlayerPath, 0);
  objc_storeStrong((id *)&self->_sourcePlayerPath, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end