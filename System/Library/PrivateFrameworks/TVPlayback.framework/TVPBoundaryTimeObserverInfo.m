@interface TVPBoundaryTimeObserverInfo
- (NSArray)times;
- (id)handler;
- (id)tokenFromAVPlayer;
- (void)setHandler:(id)a3;
- (void)setTimes:(id)a3;
- (void)setTokenFromAVPlayer:(id)a3;
@end

@implementation TVPBoundaryTimeObserverInfo

- (NSArray)times
{
  return self->_times;
}

- (void)setTimes:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (id)tokenFromAVPlayer
{
  return self->_tokenFromAVPlayer;
}

- (void)setTokenFromAVPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tokenFromAVPlayer, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_times, 0);
}

@end