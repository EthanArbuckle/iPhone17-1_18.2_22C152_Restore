@interface UpsellOfferTemplateViewController
- (_TtC8VideosUI33UpsellOfferTemplateViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI33UpsellOfferTemplateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
@end

@implementation UpsellOfferTemplateViewController

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E30B9FC0();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E30BA9DC();
}

- (_TtC8VideosUI33UpsellOfferTemplateViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8VideosUI33UpsellOfferTemplateViewController *)sub_1E30BAB94(v5, v7, a4);
}

- (_TtC8VideosUI33UpsellOfferTemplateViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI33UpsellOfferTemplateViewController *)sub_1E30BACB0(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33UpsellOfferTemplateViewController_upsellView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33UpsellOfferTemplateViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33UpsellOfferTemplateViewController_transactionView));
  swift_release();
}

@end