@interface _TUIRenderModelVideo
- (BOOL)allowFullScreen;
- (BOOL)autoPlay;
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (BOOL)loop;
- (BOOL)muted;
- (BOOL)showPlaybackControls;
- (CGSize)size;
- (NSString)bottomTriggerName;
- (NSString)description;
- (NSString)gravity;
- (NSString)leftTriggerName;
- (NSString)rightTriggerName;
- (NSString)topTriggerName;
- (NSString)videoId;
- (NSURL)url;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIElementActionTriggerHandler)actionHandler;
- (TUIIdentifier)identifier;
- (TUIImageResource)posterFrameResource;
- (_TUIRenderModelVideo)initWithUrl:(id)a3 posterFrameResource:(id)a4 videoId:(id)a5 loop:(BOOL)a6 muted:(BOOL)a7 allowFullScreen:(BOOL)a8 autoPlay:(BOOL)a9 showPlaybackControls:(BOOL)a10 gravity:(id)a11 cornerRadius:(double)a12 topTriggerName:(id)a13 bottomTriggerName:(id)a14 leftTriggerName:(id)a15 rightTriggerName:(id)a16 actionHandler:(id)a17;
- (double)cornerRadius;
- (unint64_t)kind;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation _TUIRenderModelVideo

- (_TUIRenderModelVideo)initWithUrl:(id)a3 posterFrameResource:(id)a4 videoId:(id)a5 loop:(BOOL)a6 muted:(BOOL)a7 allowFullScreen:(BOOL)a8 autoPlay:(BOOL)a9 showPlaybackControls:(BOOL)a10 gravity:(id)a11 cornerRadius:(double)a12 topTriggerName:(id)a13 bottomTriggerName:(id)a14 leftTriggerName:(id)a15 rightTriggerName:(id)a16 actionHandler:(id)a17
{
  id v37 = a3;
  id obj = a4;
  id v22 = a4;
  id v32 = a5;
  id v23 = a5;
  id v24 = a11;
  id v38 = a13;
  id v25 = a14;
  id v26 = a15;
  id v27 = a16;
  id v36 = a17;
  v39.receiver = self;
  v39.super_class = (Class)_TUIRenderModelVideo;
  v28 = [(_TUIRenderModelVideo *)&v39 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_url, a3);
    objc_storeStrong((id *)&v29->_posterFrameResource, obj);
    objc_storeStrong((id *)&v29->_videoId, v32);
    v29->_loop = a6;
    v29->_muted = a7;
    v29->_allowFullScreen = a8;
    v29->_autoPlay = a9;
    v29->_showPlaybackControls = a10;
    objc_storeStrong((id *)&v29->_gravity, a11);
    v29->_cornerRadius = a12;
    objc_storeStrong((id *)&v29->_topTriggerName, a13);
    objc_storeStrong((id *)&v29->_bottomTriggerName, a14);
    objc_storeStrong((id *)&v29->_leftTriggerName, a15);
    objc_storeStrong((id *)&v29->_rightTriggerName, a16);
    objc_storeStrong((id *)&v29->_actionHandler, a17);
  }

  return v29;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  posterFrameResource = self->_posterFrameResource;
  id v7 = a3;
  v6 = [(TUIImageResource *)posterFrameResource resource];
  [v7 collectResource:v6];

  [v7 collectImageResource:self->_posterFrameResource];
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  v5 = [(_TUIRenderModelVideo *)self url];
  v6 = [v4 url];
  if ([v5 isEqual:v6])
  {
    id v7 = [(_TUIRenderModelVideo *)self videoId];
    v8 = [v4 videoId];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(_TUIRenderModelVideo *)self posterFrameResource];
      v10 = [v4 posterFrameResource];
      if (v9 == v10
        && (unsigned int v11 = -[_TUIRenderModelVideo loop](self, "loop"), v11 == [v4 loop])
        && (unsigned int v12 = -[_TUIRenderModelVideo muted](self, "muted"), v12 == [v4 muted])
        && (unsigned int v13 = [(_TUIRenderModelVideo *)self allowFullScreen],
            v13 == [v4 allowFullScreen])
        && (unsigned int v14 = -[_TUIRenderModelVideo autoPlay](self, "autoPlay"), v14 == [v4 autoPlay])
        && (unsigned int v15 = [(_TUIRenderModelVideo *)self showPlaybackControls],
            v15 == [v4 showPlaybackControls]))
      {
        v18 = [(_TUIRenderModelVideo *)self gravity];
        v19 = [v4 gravity];
        if (v18 == v19
          && ([(_TUIRenderModelVideo *)self cornerRadius],
              double v21 = v20,
              [v4 cornerRadius],
              v21 == v22))
        {
          id v24 = [(_TUIRenderModelVideo *)self actionHandler];
          id v23 = [v4 actionHandler];
          BOOL v16 = v24 == v23;
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<TUIRenderModelVideo url: %@, posterFrameResource: %@, videoId: %@, loop: %i, muted: %i, allowsFullscreen: %i, showPlaybackControls: %i, autoPlay: %i, gravity: %@, cornerRadius: %f>", self->_url, self->_posterFrameResource, self->_videoId, self->_loop, self->_muted, self->_allowFullScreen, self->_showPlaybackControls, self->_autoPlay, self->_gravity, *(void *)&self->_cornerRadius];
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)kind
{
  return self->_kind;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (NSURL)url
{
  return self->_url;
}

- (TUIImageResource)posterFrameResource
{
  return self->_posterFrameResource;
}

- (NSString)videoId
{
  return self->_videoId;
}

- (NSString)topTriggerName
{
  return self->_topTriggerName;
}

- (NSString)bottomTriggerName
{
  return self->_bottomTriggerName;
}

- (NSString)leftTriggerName
{
  return self->_leftTriggerName;
}

- (NSString)rightTriggerName
{
  return self->_rightTriggerName;
}

- (BOOL)loop
{
  return self->_loop;
}

- (BOOL)muted
{
  return self->_muted;
}

- (BOOL)allowFullScreen
{
  return self->_allowFullScreen;
}

- (BOOL)autoPlay
{
  return self->_autoPlay;
}

- (BOOL)showPlaybackControls
{
  return self->_showPlaybackControls;
}

- (NSString)gravity
{
  return self->_gravity;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_rightTriggerName, 0);
  objc_storeStrong((id *)&self->_leftTriggerName, 0);
  objc_storeStrong((id *)&self->_bottomTriggerName, 0);
  objc_storeStrong((id *)&self->_topTriggerName, 0);
  objc_storeStrong((id *)&self->_videoId, 0);
  objc_storeStrong((id *)&self->_posterFrameResource, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_animationGroups, 0);
}

@end