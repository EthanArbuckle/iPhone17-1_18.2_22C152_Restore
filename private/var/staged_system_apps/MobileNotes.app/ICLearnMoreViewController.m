@interface ICLearnMoreViewController
+ (void)showHelpWithPresentingViewController:(id)a3;
- (ICLearnMoreViewController)initWithCoder:(id)a3;
- (ICLearnMoreViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)headerLabels;
- (NSArray)textViews;
- (UIScrollView)scrollView;
- (void)didTapDoneButton:(id)a3;
- (void)setHeaderLabels:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setTextViews:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICLearnMoreViewController

- (UIScrollView)scrollView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIScrollView *)Strong;
}

- (void)setScrollView:(id)a3
{
}

- (NSArray)headerLabels
{
  return (NSArray *)sub_1004AA6A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICLearnMoreViewController_headerLabels, &qword_1006A9360);
}

- (void)setHeaderLabels:(id)a3
{
}

- (NSArray)textViews
{
  return (NSArray *)sub_1004AA6A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICLearnMoreViewController_textViews, (unint64_t *)&qword_10069CA90);
}

- (void)setTextViews:(id)a3
{
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LearnMoreViewController();
  v2 = v4.receiver;
  id v3 = [(ICLearnMoreViewController *)&v4 viewDidLoad];
  (*(void (**)(id))((swift_isaMask & *v2) + 0xD8))(v3);
  sub_1004A9ABC();
  sub_1004AA2C4();
  sub_1004AA0CC();
  sub_1004A9EB8();
}

+ (void)showHelpWithPresentingViewController:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_1004A9954(v4);
}

- (void)didTapDoneButton:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    v5 = self;
  }
  -[ICLearnMoreViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v6, v7);

  sub_100015BE0((uint64_t)&v6);
}

- (ICLearnMoreViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (ICLearnMoreViewController *)sub_1004AADF8(v5, v7, a4);
}

- (ICLearnMoreViewController)initWithCoder:(id)a3
{
  return (ICLearnMoreViewController *)sub_1004AAFB8(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICLearnMoreViewController_textViewFont);
}

@end