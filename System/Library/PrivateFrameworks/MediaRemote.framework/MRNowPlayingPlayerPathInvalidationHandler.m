@interface MRNowPlayingPlayerPathInvalidationHandler
- (BOOL)invalidateImmediatlyIfInvalid;
- (MRNowPlayingPlayerPathInvalidationHandler)initWithPlayerPath:(id)a3 invalidateImmediatlyIfInvalid:(BOOL)a4 queue:(id)a5 invalidationCallback:(id)a6;
- (MRPlayerPath)playerPath;
- (OS_dispatch_queue)queue;
- (id)callback;
- (id)description;
@end

@implementation MRNowPlayingPlayerPathInvalidationHandler

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MRNowPlayingPlayerPathInvalidationHandler)initWithPlayerPath:(id)a3 invalidateImmediatlyIfInvalid:(BOOL)a4 queue:(id)a5 invalidationCallback:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MRNowPlayingPlayerPathInvalidationHandler;
  v13 = [(MRNowPlayingPlayerPathInvalidationHandler *)&v20 init];
  if (v13)
  {
    if (v10) {
      v14 = (MRPlayerPath *)[v10 copy];
    }
    else {
      v14 = objc_alloc_init(MRPlayerPath);
    }
    playerPath = v13->_playerPath;
    v13->_playerPath = v14;

    if (!v11)
    {
      id v11 = (id)MEMORY[0x1E4F14428];
      id v16 = MEMORY[0x1E4F14428];
    }
    v13->_invalidateImmediatlyIfInvalid = a4;
    objc_storeStrong((id *)&v13->_queue, v11);
    uint64_t v17 = [v12 copy];
    id callback = v13->_callback;
    v13->_id callback = (id)v17;
  }
  return v13;
}

- (id)description
{
  return [(MRPlayerPath *)self->_playerPath description];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)callback
{
  return self->_callback;
}

- (BOOL)invalidateImmediatlyIfInvalid
{
  return self->_invalidateImmediatlyIfInvalid;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_playerPath, 0);
}

@end