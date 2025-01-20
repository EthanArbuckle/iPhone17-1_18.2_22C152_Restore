@interface GPMessagesViewController
- (BOOL)imagePickerViewControllerWantsToStartCreation:(id)a3 isTransitionSupported:(BOOL)a4;
- (BOOL)prefersStatusBarHidden;
- (_TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController)initWithCoder:(id)a3;
- (_TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (void)_didRemoveAssetArchiveWithIdentifier:(id)a3;
- (void)dealloc;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)imageEditionViewControllerDidCancel:(id)a3 requiresShowingGrid:(BOOL)a4;
- (void)imageEditionViewControllerDidFinishEditing:(id)a3 error:(id)a4;
- (void)imagePickerViewControllerDidCancel:(id)a3;
- (void)imagePickerViewControllerDidSelectAssets:(id)a3;
- (void)imagePickerViewControllerWillStartCreation:(id)a3;
- (void)imagePickerWillSelectNewlyCreatedAsset:(id)a3;
- (void)viewDidLoad;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willPresentEditingViewWithAssetURL:(id)a3 sandboxExtension:(id)a4 recipeData:(id)a5 completion:(id)a6;
@end

@implementation GPMessagesViewController

- (void)dealloc
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = qword_10001D548 - 1;
  if (__OFSUB__(qword_10001D548, 1))
  {
    __break(1u);
  }
  else
  {
    v5 = (objc_class *)ObjectType;
    --qword_10001D548;
    if (v4)
    {
      v6 = self;
    }
    else
    {
      qword_10001D540 = 0;
      v7 = self;
      swift_release();
    }
    v8.receiver = self;
    v8.super_class = v5;
    [(GPMessagesViewController *)&v8 dealloc];
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController____lazy_storage___appleConnectTokenProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpEditController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_landscapeTrapController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_currentController));
  sub_100013A04((uint64_t)self + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleView, (uint64_t *)&unk_10001D7D0);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100013A04((uint64_t)self+ OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleViewBeforeLandscapeTrap, (uint64_t *)&unk_10001D7D0);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100004DD0();
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  uint64_t v5 = sub_1000040F4(&qword_10001D3F8);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v9 = self;
  sub_100006A54(v8);
  uint64_t v10 = sub_100013F80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_100013F60();
  id v11 = v8;
  v12 = v9;
  uint64_t v13 = sub_100013F50();
  v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v12;
  v14[5] = v11;
  sub_1000046E4((uint64_t)v7, (uint64_t)&unk_10001D940, (uint64_t)v14);

  swift_release();
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  if (!a3)
  {
    v3 = *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController);
    if (v3) {
      [v3 closeComposingViewIfNeeded];
    }
  }
}

- (void)_didRemoveAssetArchiveWithIdentifier:(id)a3
{
  sub_100013EA0();
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController);
  if (v4)
  {
    uint64_t v5 = self;
    id v6 = v4;
    id v7 = (id)sub_100013E80();
    [v6 delegate:v5 didUnstageAssetWithIdentifier:v7];

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (_TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100013EA0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController *)sub_1000091BC(v5, v7, a4);
}

- (_TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController)initWithCoder:(id)a3
{
  return (_TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController *)sub_1000093C4(a3);
}

- (_TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController *)sub_100009560(a3);
}

- (void)imagePickerWillSelectNewlyCreatedAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  if ([(GPMessagesViewController *)v5 presentationStyle] == (id)1) {
    [(GPMessagesViewController *)v5 requestPresentationStyle:0];
  }
}

- (void)imagePickerViewControllerDidSelectAssets:(id)a3
{
  uint64_t v5 = sub_1000040F4(&qword_10001D3F8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100013F80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_100013F60();
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = v9;
  uint64_t v12 = sub_100013F50();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v10;
  v13[5] = v11;
  sub_1000046E4((uint64_t)v7, (uint64_t)&unk_10001D920, (uint64_t)v13);

  swift_release();
}

- (BOOL)imagePickerViewControllerWantsToStartCreation:(id)a3 isTransitionSupported:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_10000AB64(a4, v7);

  return 0;
}

- (void)imagePickerViewControllerWillStartCreation:(id)a3
{
  uint64_t v4 = qword_10001D2E8;
  id v10 = a3;
  uint64_t v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100013E30();
  sub_100013060(v6, (uint64_t)qword_10001D508);
  uint64_t v7 = sub_100013E20();
  os_log_type_t v8 = sub_100013FB0();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Entering edition in the picker view when we should be presenting edit sheet separately", v9, 2u);
    swift_slowDealloc();
  }
}

- (void)imagePickerViewControllerDidCancel:(id)a3
{
  uint64_t v5 = sub_1000040F4(&qword_10001D3F8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100013F80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100013F60();
  id v10 = a3;
  id v11 = self;
  swift_retain();
  uint64_t v12 = sub_100013F50();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v9;
  swift_release();
  sub_100004890((uint64_t)v7, (uint64_t)&unk_10001D898, (uint64_t)v13);

  swift_release();
}

- (void)willPresentEditingViewWithAssetURL:(id)a3 sandboxExtension:(id)a4 recipeData:(id)a5 completion:(id)a6
{
  id v10 = _Block_copy(a6);
  uint64_t v11 = sub_1000040F4(&qword_10001D888);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_100013C10();
    uint64_t v14 = sub_100013C20();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_100013C20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  if (a4)
  {
    uint64_t v16 = sub_100013EA0();
    a4 = v17;
  }
  else
  {
    uint64_t v16 = 0;
  }
  v18 = self;
  if (a5)
  {
    id v19 = a5;
    a5 = (id)sub_100013C50();
    unint64_t v21 = v20;
  }
  else
  {
    unint64_t v21 = 0xF000000000000000;
  }
  _Block_copy(v10);
  sub_10001289C((uint64_t)v13, v16, (uint64_t)a4, (uint64_t)a5, v21, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);
  sub_100011888((uint64_t)a5, v21);

  swift_bridgeObjectRelease();
  sub_100013A04((uint64_t)v13, &qword_10001D888);
}

- (void)imageEditionViewControllerDidFinishEditing:(id)a3 error:(id)a4
{
  uint64_t v7 = sub_1000040F4(&qword_10001D3F8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100013F80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_100013F60();
  id v11 = a3;
  uint64_t v12 = self;
  id v13 = v11;
  uint64_t v14 = v12;
  id v15 = a4;
  uint64_t v16 = sub_100013F50();
  v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v13;
  v17[5] = v14;
  sub_1000046E4((uint64_t)v9, (uint64_t)&unk_10001D848, (uint64_t)v17);

  swift_release();
}

- (void)imageEditionViewControllerDidCancel:(id)a3 requiresShowingGrid:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_100012D0C(a4);
}

@end