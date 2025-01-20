@interface _UICarPlaySession
+ (id)sharedInstance;
- (os_unfair_lock_s)currentSession;
- (void)enqueuePendingSessionAccessWithTimeout:(double)a3 completion:;
- (void)getCurrentSessionWithTimeout:(double)a3 completion:;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
@end

@implementation _UICarPlaySession

+ (id)sharedInstance
{
  self;
  if (qword_1EB262E98 != -1) {
    dispatch_once(&qword_1EB262E98, &__block_literal_global_484);
  }
  v0 = (void *)_MergedGlobals_1220;
  return v0;
}

- (os_unfair_lock_s)currentSession
{
  if (a1)
  {
    v2 = a1;
    v3 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    if (!LOBYTE(v2[6]._os_unfair_lock_opaque))
    {
      [*(id *)&v2[4]._os_unfair_lock_opaque waitForSessionInitialization];
      LOBYTE(v2[6]._os_unfair_lock_opaque) = 1;
    }
    os_unfair_lock_unlock(v3);
    a1 = [*(id *)&v2[4]._os_unfair_lock_opaque currentSession];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)getCurrentSessionWithTimeout:(double)a3 completion:
{
  v6 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v5 = [*(id *)(a1 + 16) currentSession];
    if (v5)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      v6[2](v6, v5);
    }
    else
    {
      -[_UICarPlaySession enqueuePendingSessionAccessWithTimeout:completion:](a1, v6, a3);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
  }
}

- (void)enqueuePendingSessionAccessWithTimeout:(double)a3 completion:
{
  id v5 = a2;
  if (a1)
  {
    v6 = [[_UICarPlaySessionAccessRequest alloc] initWithTimeout:v5 completion:a3];
    objc_initWeak(&location, v6);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71___UICarPlaySession_enqueuePendingSessionAccessWithTimeout_completion___block_invoke;
    v7[3] = &unk_1E52D9960;
    objc_copyWeak(&v8, &location);
    v7[4] = a1;
    [(_UICarPlaySessionAccessRequest *)v6 setTimeoutHandler:v7];
    [*(id *)(a1 + 32) addObject:v6];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39___UICarPlaySession_sessionDidConnect___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)sessionDidDisconnect:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___UICarPlaySession_sessionDidDisconnect___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSessionAccessRequests, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
}

@end