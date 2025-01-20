@interface AmbientPhotoFramePlayergroundViewController.AmbientPlaygroundRenderer
- (UIView)backgroundView;
- (UIView)floatingView;
- (UIView)foregroundView;
- (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960025AmbientPlaygroundRenderer)init;
- (id)px_extendRenderSessionForReason:(id)a3;
- (void)px_noteContentSignificantlyChanged;
- (void)px_updatePreferences:(id)a3;
@end

@implementation AmbientPhotoFramePlayergroundViewController.AmbientPlaygroundRenderer

- (UIView)backgroundView
{
  v2 = self;
  v3 = (void *)sub_1AEB8CBF4();

  return (UIView *)v3;
}

- (UIView)foregroundView
{
  v2 = self;
  v3 = (void *)sub_1AEB8CC44();

  return (UIView *)v3;
}

- (UIView)floatingView
{
  v2 = self;
  v3 = (void *)sub_1AEB8CC94();

  return (UIView *)v3;
}

- (void)px_noteContentSignificantlyChanged
{
}

- (id)px_extendRenderSessionForReason:(id)a3
{
  sub_1AEF96DE0();
  v4 = self;
  id v5 = sub_1AEB8CD18();

  swift_bridgeObjectRelease();
  return v5;
}

- (void)px_updatePreferences:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_1AEB8CDC4((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
}

- (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960025AmbientPlaygroundRenderer)init
{
}

- (void).cxx_destruct
{
}

@end