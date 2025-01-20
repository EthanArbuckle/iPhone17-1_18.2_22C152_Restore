@interface SBModalWidgetIntroductionHomeScreenPreview
- (SBModalWidgetIntroductionHomeScreenPreview)initWithPreview:(id)a3 withSnapshot:(id)a4;
- (UIImage)snapshot;
- (UIView)liveView;
- (void)setLiveView:(id)a3;
- (void)setSnapshot:(id)a3;
@end

@implementation SBModalWidgetIntroductionHomeScreenPreview

- (SBModalWidgetIntroductionHomeScreenPreview)initWithPreview:(id)a3 withSnapshot:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBModalWidgetIntroductionHomeScreenPreview;
  v9 = [(SBModalWidgetIntroductionHomeScreenPreview *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_liveView, a3);
    objc_storeStrong((id *)&v10->_snapshot, a4);
  }

  return v10;
}

- (UIView)liveView
{
  return self->_liveView;
}

- (void)setLiveView:(id)a3
{
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_liveView, 0);
}

@end