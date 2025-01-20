@interface BEFootnotePresenter
- (BEFootnotePresenter)init;
- (BOOL)footnoteViewController:(id)a3 handleInternalLoadRequest:(id)a4;
- (void)footnoteViewController:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5;
- (void)footnoteViewController:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4;
- (void)footnoteViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5;
- (void)footnoteViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5;
- (void)footnoteViewDidDisappear:(id)a3;
- (void)footnoteViewDidFinishLoad:(id)a3;
@end

@implementation BEFootnotePresenter

- (BEFootnotePresenter)init
{
  result = (BEFootnotePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_CFEA4((uint64_t)self + OBJC_IVAR___BEFootnotePresenter_router);
  v3 = (char *)self + OBJC_IVAR___BEFootnotePresenter_bookEntity;

  sub_39FCC((uint64_t)v3);
}

- (void)footnoteViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_2FB440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_2FB400();
  _Block_copy(v12);
  id v13 = a3;
  v14 = self;
  sub_D0960((uint64_t)v11, (uint64_t)v14, (void (**)(void, void))v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)footnoteViewController:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  uint64_t v8 = sub_2FB440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2FB400();
  id v12 = a3;
  id v13 = self;
  sub_D0A94((uint64_t)v11, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BOOL)footnoteViewController:(id)a3 handleInternalLoadRequest:(id)a4
{
  uint64_t v6 = sub_2FB440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2FB400();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_D0B64((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)footnoteViewController:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  uint64_t v6 = sub_2FB440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2FB400();
  id v10 = a3;
  v11 = self;
  sub_2FB3F0(v12);
  uint64_t v14 = v13;
  [(BEFootnotePresenter *)v11 footnoteViewController:v10 handleInternalLoadRequest:v13];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)footnoteViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  uint64_t v8 = (uint64_t (*)(uint64_t))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = (uint64_t (*)(uint64_t))sub_79A40;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  sub_D0D1C(v11, v8, v9);
  sub_81A88((uint64_t)v8);
}

- (void)footnoteViewDidFinishLoad:(id)a3
{
  id v4 = a3;
  v5 = self;
  FootnotePresenter.footnoteViewDidFinishLoad(_:)((uint64_t)v4);
}

- (void)footnoteViewDidDisappear:(id)a3
{
  id v4 = a3;
  v5 = self;
  FootnotePresenter.footnoteViewDidDisappear(_:)((UIViewController)v4);
}

@end