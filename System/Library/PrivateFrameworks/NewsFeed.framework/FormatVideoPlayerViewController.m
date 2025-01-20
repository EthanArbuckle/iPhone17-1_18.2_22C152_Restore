@interface FormatVideoPlayerViewController
- (_TtC8NewsFeed31FormatVideoPlayerViewController)init;
- (_TtC8NewsFeed31FormatVideoPlayerViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed31FormatVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FormatVideoPlayerViewController

- (_TtC8NewsFeed31FormatVideoPlayerViewController)init
{
  return (_TtC8NewsFeed31FormatVideoPlayerViewController *)sub_1C0DF3C70();
}

- (_TtC8NewsFeed31FormatVideoPlayerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0DF51F4();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = MEMORY[0x1C18C9C60]((char *)self + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_delegate);
  v5 = self;
  if (v4)
  {
    sub_1C0D9151C();
    swift_unknownObjectRelease();
  }
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(FormatVideoPlayerViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_onReuse));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_posterFrame));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_placeholderView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_videoContainerView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0DF3FC0();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  uint64_t v4 = (char *)v5.receiver;
  [(FormatVideoPlayerViewController *)&v5 viewWillDisappear:v3];
  if (MEMORY[0x1C18C9C60](&v4[OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_delegate]))
  {
    sub_1C0D91C6C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = (char *)v12.receiver;
  -[FormatVideoPlayerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  uint64_t v8 = MEMORY[0x1C18C9C60](&v7[OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_delegate]);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = objc_msgSend(self, sel_currentDevice, v12.receiver, v12.super_class);
    id v11 = objc_msgSend(v10, sel_userInterfaceIdiom);

    if (v11 == (id)5) {
      *(unsigned char *)(v9 + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_isViewTransitionInProcess) = 1;
    }
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1C0DF445C();
}

- (_TtC8NewsFeed31FormatVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed31FormatVideoPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end