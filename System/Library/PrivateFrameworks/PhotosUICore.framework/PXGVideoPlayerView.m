@interface PXGVideoPlayerView
- (CGRect)clippingRect;
- (NSCopying)userData;
- (PXGVideoPlayerView)init;
- (PXVideoSession)videoSession;
- (PXVideoSessionUIView)videoSessionView;
- (void)becomeReusable;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
- (void)setVideoSession:(id)a3;
@end

@implementation PXGVideoPlayerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSessionView, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (PXVideoSessionUIView)videoSessionView
{
  return self->_videoSessionView;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSCopying)userData
{
  return self->_userData;
}

- (void)setVideoSession:(id)a3
{
  v9 = (PXVideoSession *)a3;
  v5 = self->_videoSession;
  v6 = v9;
  if (v5 != v9)
  {
    v7 = v5;
    char v8 = [(PXVideoSession *)v5 isEqual:v9];

    if (v8) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_videoSession, a3);
    v6 = [(PXGVideoPlayerView *)self videoSessionView];
    [v6 setVideoSession:v9];
  }

LABEL_5:
}

- (void)setUserData:(id)a3
{
  v16 = (NSCopying *)a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [(NSCopying *)v16 px_descriptionForAssertionMessage];
      [v12 handleFailureInMethod:a2, self, @"PXGVideoPlayerView.m", 43, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"userData", v14, v15 object file lineNumber description];
    }
  }

  v6 = self->_userData;
  v7 = v16;
  if (v6 != v16)
  {
    char v8 = v6;
    char v9 = [(NSCopying *)v6 isEqual:v16];

    if (v9) {
      goto LABEL_8;
    }
    objc_storeStrong((id *)&self->_userData, a3);
    v10 = [(NSCopying *)v16 videoSession];
    [(PXGVideoPlayerView *)self setVideoSession:v10];

    uint64_t v11 = [(NSCopying *)v16 toneMapToStandardDynamicRange];
    v7 = [(PXGVideoPlayerView *)self videoSessionView];
    [v7 setToneMapToStandardDynamicRange:v11];
  }

LABEL_8:
}

- (void)becomeReusable
{
}

- (PXGVideoPlayerView)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXGVideoPlayerView;
  v2 = [(PXGVideoPlayerView *)&v8 init];
  if (v2)
  {
    v3 = [PXVideoSessionUIView alloc];
    [(PXGVideoPlayerView *)v2 bounds];
    uint64_t v4 = -[PXVideoSessionUIView initWithFrame:](v3, "initWithFrame:");
    videoSessionView = v2->_videoSessionView;
    v2->_videoSessionView = (PXVideoSessionUIView *)v4;

    [(PXVideoSessionUIView *)v2->_videoSessionView setAutoresizingMask:18];
    [(PXGVideoPlayerView *)v2 addSubview:v2->_videoSessionView];
    [(PXGVideoPlayerView *)v2 setUserInteractionEnabled:0];
    v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(PXGVideoPlayerView *)v2 setBackgroundColor:v6];
  }
  return v2;
}

@end