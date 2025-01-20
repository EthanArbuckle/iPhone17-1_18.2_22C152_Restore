@interface AccountMessageViewController
- (_TtC8VideosUI28AccountMessageViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI28AccountMessageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)vui_loadView;
@end

@implementation AccountMessageViewController

- (void)vui_loadView
{
  v2 = self;
  sub_1E31F6420();
}

- (_TtC8VideosUI28AccountMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E387C928();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8VideosUI28AccountMessageViewController *)sub_1E31F65F0(v5, v7, a4);
}

- (_TtC8VideosUI28AccountMessageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC8VideosUI28AccountMessageViewController *)sub_1E31F6744();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28AccountMessageViewController_containerView));
}

@end