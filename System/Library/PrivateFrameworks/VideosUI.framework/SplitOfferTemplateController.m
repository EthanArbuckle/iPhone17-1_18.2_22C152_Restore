@interface SplitOfferTemplateController
- (_TtC8VideosUI28SplitOfferTemplateController)initWithCoder:(id)a3;
- (_TtC8VideosUI28SplitOfferTemplateController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation SplitOfferTemplateController

- (_TtC8VideosUI28SplitOfferTemplateController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8VideosUI28SplitOfferTemplateController *)sub_1E36BE028(v5, v7, a4);
}

- (_TtC8VideosUI28SplitOfferTemplateController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI28SplitOfferTemplateController *)sub_1E36BE120(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28SplitOfferTemplateController____lazy_storage___leftView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28SplitOfferTemplateController____lazy_storage___rightView));
  sub_1E35D95C0(*(void **)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8VideosUI28SplitOfferTemplateController_leftTemplate));
  sub_1E35D95C0(*(void **)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8VideosUI28SplitOfferTemplateController_rightTemplate));
  swift_release();
}

@end