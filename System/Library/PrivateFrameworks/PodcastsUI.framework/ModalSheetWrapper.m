@interface ModalSheetWrapper
- (_TtC10PodcastsUI17ModalSheetWrapper)initWithCoder:(id)a3;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ModalSheetWrapper

- (void)loadView
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_minWidth);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_height);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_maxSize);
  v6 = (objc_class *)type metadata accessor for SheetView();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____TtC10PodcastsUI9SheetView_sizeRestrictions];
  *(void *)v8 = v3;
  *((void *)v8 + 1) = v4;
  *((void *)v8 + 2) = v5;
  *((void *)v8 + 3) = v4;
  v11.receiver = v7;
  v11.super_class = v6;
  v9 = self;
  v10 = -[ModalSheetWrapper initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  -[ModalSheetWrapper setView:](v9, sel_setView_, v10, v11.receiver, v11.super_class);
}

- (_TtC10PodcastsUI17ModalSheetWrapper)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_minWidth) = (Class)0x407C200000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_maxSize) = (Class)0x4085E00000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper____lazy_storage___separatorView) = 0;
  id v4 = a3;

  result = (_TtC10PodcastsUI17ModalSheetWrapper *)sub_1E3E7DF80();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E3D7C308();
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ModalSheetWrapper();
  [(ModalSheetWrapper *)&v2 viewWillLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ModalSheetWrapper();
  id v4 = v7.receiver;
  [(ModalSheetWrapper *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 1, 0);

    id v4 = v6;
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_contentViewController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper____lazy_storage___separatorView);
}

@end