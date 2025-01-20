@interface LivePostPlayTemplateViewController
- (NSString)description;
- (_TtC8VideosUI34LivePostPlayTemplateViewController)initWithCoder:(id)a3;
- (void)vuiCollectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5;
- (void)vui_viewDidLoad;
@end

@implementation LivePostPlayTemplateViewController

- (NSString)description
{
  v2 = self;
  sub_1E31FCAC8();

  v3 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E31FCE28();
}

- (void)vuiCollectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1E31FCF70((uint64_t)v8, (uint64_t)a4, a5);

  swift_unknownObjectRelease();
}

- (_TtC8VideosUI34LivePostPlayTemplateViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI34LivePostPlayTemplateViewController *)sub_1E31FEBD4(a3);
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI34LivePostPlayTemplateViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34LivePostPlayTemplateViewController_countdownProgressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34LivePostPlayTemplateViewController_countdownProgressViewCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34LivePostPlayTemplateViewController_countdownProgressViewColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34LivePostPlayTemplateViewController_countdownProgressViewImage));
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI34LivePostPlayTemplateViewController_logger;
  uint64_t v4 = sub_1E3877538();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end