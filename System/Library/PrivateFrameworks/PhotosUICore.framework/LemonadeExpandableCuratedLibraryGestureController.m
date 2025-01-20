@interface LemonadeExpandableCuratedLibraryGestureController
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController)init;
- (void)dealloc;
- (void)handlePanWithGesture:(id)a3;
@end

@implementation LemonadeExpandableCuratedLibraryGestureController

- (_TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController)init
{
  return (_TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController *)sub_1A9CE8428();
}

- (void)dealloc
{
  v2 = self;
  sub_1A9EFCAE8();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore49LemonadeExpandableCuratedLibraryGestureController_panGestureRecognizer);
}

- (void)handlePanWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A9EFD090(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  v11[0] = 0;
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  LOBYTE(a4) = objc_msgSend(v7, sel_px_isPanGestureRecognizerOfScrollView_, v11);
  id v9 = v11[0];

  return (char)a4;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1A9EFD3FC(v4);

  return self & 1;
}

@end