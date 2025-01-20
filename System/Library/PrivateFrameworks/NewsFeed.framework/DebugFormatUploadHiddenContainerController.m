@interface DebugFormatUploadHiddenContainerController
- (_TtC8NewsFeed42DebugFormatUploadHiddenContainerController)initWithCoder:(id)a3;
- (_TtC8NewsFeed42DebugFormatUploadHiddenContainerController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doDismiss;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatUploadHiddenContainerController

- (_TtC8NewsFeed42DebugFormatUploadHiddenContainerController)initWithCoder:(id)a3
{
  result = (_TtC8NewsFeed42DebugFormatUploadHiddenContainerController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C11E3080();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(DebugFormatUploadHiddenContainerController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8NewsFeed42DebugFormatUploadHiddenContainerController_rootViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)doDismiss
{
}

- (_TtC8NewsFeed42DebugFormatUploadHiddenContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed42DebugFormatUploadHiddenContainerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed42DebugFormatUploadHiddenContainerController_rootViewController));
}

@end