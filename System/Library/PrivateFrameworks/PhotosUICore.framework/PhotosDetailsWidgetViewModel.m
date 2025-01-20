@interface PhotosDetailsWidgetViewModel
- (_TtC12PhotosUICore28PhotosDetailsWidgetViewModel)init;
- (void)photoLibraryDidChange:(id)a3;
- (void)preferredContentSizeDidChangeWithNotification:(id)a3;
@end

@implementation PhotosDetailsWidgetViewModel

- (void)preferredContentSizeDidChangeWithNotification:(id)a3
{
  v4 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x150);
  id v5 = a3;
  v6 = self;
  v4();
}

- (void)photoLibraryDidChange:(id)a3
{
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x88);
  id v5 = a3;
  v12 = self;
  v6 = (void *)v4();
  sub_1A9B21070(0, (unint64_t *)&qword_1E981C730);
  v13 = (_TtC12PhotosUICore28PhotosDetailsWidgetViewModel *)sub_1AB23B7EC();

  if (v13)
  {
    id v7 = [(PhotosDetailsWidgetViewModel *)v13 objectAfterChanges];
    if (v7)
    {
      id v8 = v7;
      v9 = (void **)((char *)&v12->super.isa + OBJC_IVAR____TtC12PhotosUICore28PhotosDetailsWidgetViewModel_asset);
      swift_beginAccess();
      v10 = *v9;
      *v9 = v8;

      return;
    }

    v11 = v13;
  }
  else
  {

    v11 = v12;
  }
}

- (_TtC12PhotosUICore28PhotosDetailsWidgetViewModel)init
{
  result = (_TtC12PhotosUICore28PhotosDetailsWidgetViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore28PhotosDetailsWidgetViewModel_maxContentSizeCategory));

  sub_1A9D6D380((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore28PhotosDetailsWidgetViewModel_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore28PhotosDetailsWidgetViewModel__spec;
  sub_1AA3E174C(0, &qword_1E981BAF0, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore28PhotosDetailsWidgetViewModel_context);
}

@end