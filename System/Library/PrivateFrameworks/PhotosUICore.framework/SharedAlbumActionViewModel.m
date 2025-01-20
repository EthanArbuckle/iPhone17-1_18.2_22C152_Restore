@interface SharedAlbumActionViewModel
- (_TtC12PhotosUICore26SharedAlbumActionViewModel)init;
- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4;
- (void)photoRecipientViewControllerDidCancel:(id)a3;
@end

@implementation SharedAlbumActionViewModel

- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4
{
  sub_1A9B21070(0, &qword_1E98221A0);
  unint64_t v6 = sub_1AB23AADC();
  id v7 = a3;
  v8 = self;
  sub_1A9D4744C((uint64_t)v7, v6);
}

- (void)photoRecipientViewControllerDidCancel:(id)a3
{
}

- (_TtC12PhotosUICore26SharedAlbumActionViewModel)init
{
  result = (_TtC12PhotosUICore26SharedAlbumActionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore26SharedAlbumActionViewModel__extensionContext));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12PhotosUICore26SharedAlbumActionViewModel__updateCallback));
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12PhotosUICore26SharedAlbumActionViewModel__doneCallback));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore26SharedAlbumActionViewModel__publishProgressController));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore26SharedAlbumActionViewModel___observationRegistrar;
  uint64_t v4 = sub_1AB230BAC();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end