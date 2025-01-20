@interface TUIVideoBox
- (BOOL)allowFullScreen;
- (BOOL)autoPlay;
- (BOOL)loop;
- (BOOL)muted;
- (BOOL)showPlaybackControls;
- (Class)layoutClass;
- (NSString)bottomTriggerName;
- (NSString)gravity;
- (NSString)leftTriggerName;
- (NSString)posterFrameUrlString;
- (NSString)rightTriggerName;
- (NSString)topTriggerName;
- (NSString)urlString;
- (NSString)videoId;
- (NSURL)baseUrl;
- (TUIElementActionTriggerHandler)actionHandler;
- (double)cornerRadius;
- (void)setActionHandler:(id)a3;
- (void)setAllowFullScreen:(BOOL)a3;
- (void)setAutoPlay:(BOOL)a3;
- (void)setBaseUrl:(id)a3;
- (void)setBottomTriggerName:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setGravity:(id)a3;
- (void)setLeftTriggerName:(id)a3;
- (void)setLoop:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPosterFrameUrlString:(id)a3;
- (void)setRightTriggerName:(id)a3;
- (void)setShowPlaybackControls:(BOOL)a3;
- (void)setTopTriggerName:(id)a3;
- (void)setUrlString:(id)a3;
- (void)setVideoId:(id)a3;
@end

@implementation TUIVideoBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (NSString)posterFrameUrlString
{
  return self->_posterFrameUrlString;
}

- (void)setPosterFrameUrlString:(id)a3
{
}

- (NSURL)baseUrl
{
  return self->_baseUrl;
}

- (void)setBaseUrl:(id)a3
{
}

- (NSString)videoId
{
  return self->_videoId;
}

- (void)setVideoId:(id)a3
{
}

- (NSString)gravity
{
  return self->_gravity;
}

- (void)setGravity:(id)a3
{
  self->_gravity = (NSString *)a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)loop
{
  return self->_loop;
}

- (void)setLoop:(BOOL)a3
{
  self->_loop = a3;
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (BOOL)allowFullScreen
{
  return self->_allowFullScreen;
}

- (void)setAllowFullScreen:(BOOL)a3
{
  self->_allowFullScreen = a3;
}

- (BOOL)autoPlay
{
  return self->_autoPlay;
}

- (void)setAutoPlay:(BOOL)a3
{
  self->_autoPlay = a3;
}

- (BOOL)showPlaybackControls
{
  return self->_showPlaybackControls;
}

- (void)setShowPlaybackControls:(BOOL)a3
{
  self->_showPlaybackControls = a3;
}

- (NSString)topTriggerName
{
  return self->_topTriggerName;
}

- (void)setTopTriggerName:(id)a3
{
}

- (NSString)bottomTriggerName
{
  return self->_bottomTriggerName;
}

- (void)setBottomTriggerName:(id)a3
{
}

- (NSString)leftTriggerName
{
  return self->_leftTriggerName;
}

- (void)setLeftTriggerName:(id)a3
{
}

- (NSString)rightTriggerName
{
  return self->_rightTriggerName;
}

- (void)setRightTriggerName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightTriggerName, 0);
  objc_storeStrong((id *)&self->_leftTriggerName, 0);
  objc_storeStrong((id *)&self->_bottomTriggerName, 0);
  objc_storeStrong((id *)&self->_topTriggerName, 0);
  objc_storeStrong((id *)&self->_videoId, 0);
  objc_storeStrong((id *)&self->_baseUrl, 0);
  objc_storeStrong((id *)&self->_posterFrameUrlString, 0);
  objc_storeStrong((id *)&self->_urlString, 0);

  objc_storeStrong((id *)&self->_actionHandler, 0);
}

@end