@interface VUINowPlayingMonitorBoundaryTimeObserverInfo
- (BOOL)notifiedOfEntry;
- (NSUUID)token;
- (double)time;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setNotifiedOfEntry:(BOOL)a3;
- (void)setTime:(double)a3;
- (void)setToken:(id)a3;
@end

@implementation VUINowPlayingMonitorBoundaryTimeObserverInfo

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (BOOL)notifiedOfEntry
{
  return self->_notifiedOfEntry;
}

- (void)setNotifiedOfEntry:(BOOL)a3
{
  self->_notifiedOfEntry = a3;
}

- (NSUUID)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end