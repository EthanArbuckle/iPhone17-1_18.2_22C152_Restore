@interface DebugJournalCodableViewController
- (_TtC7NewsAds33DebugJournalCodableViewController)initWithCoder:(id)a3;
- (_TtC7NewsAds33DebugJournalCodableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation DebugJournalCodableViewController

- (_TtC7NewsAds33DebugJournalCodableViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsAds33DebugJournalCodableViewController_textView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1DD8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC7NewsAds33DebugJournalCodableViewController *)sub_1BFA180C8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF977194();
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugJournalCodableViewController *)&v14 viewDidLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC7NewsAds33DebugJournalCodableViewController_textView];
  id v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC7NewsAds33DebugJournalCodableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsAds33DebugJournalCodableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsAds33DebugJournalCodableViewController_codable);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsAds33DebugJournalCodableViewController_textView);
}

@end