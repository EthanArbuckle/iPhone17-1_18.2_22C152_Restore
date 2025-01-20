@interface JSLoadingViewController
- (_TtC16MusicApplication23JSLoadingViewController)initWithCoder:(id)a3;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JSLoadingViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_28EDC4();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_28EF60();
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_290DC4();
}

- (_TtC16MusicApplication23JSLoadingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC16MusicApplication23JSLoadingViewController *)sub_290EB0((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23JSLoadingViewController_loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23JSLoadingViewController_errorMessageView));
  swift_release();
  swift_release();

  swift_release();
}

@end