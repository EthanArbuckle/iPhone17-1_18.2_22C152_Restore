@interface EngagementBubbleTipViewController
- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithCoder:(id)a3;
- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithRequest:(id)a3;
- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation EngagementBubbleTipViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(AMSUIBaseMessageViewController *)&v6 viewDidLoad];
  sub_1BF905BE0();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BF93E670;
  uint64_t v4 = sub_1BF93D140();
  uint64_t v5 = MEMORY[0x1E4FB1138];
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  sub_1BF93D420();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1BF9052BC(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(EngagementBubbleTipViewController *)&v5 viewIsAppearing:v3];
  sub_1BF905014();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1BF9054F8(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithRequest:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v6 = (char *)self + OBJC_IVAR____TtC14NewsEngagement33EngagementBubbleTipViewController_bubbleTipSizing;
  *(void *)objc_super v6 = 0;
  v6[8] = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(AMSUIBubbleTipViewController *)&v8 initWithRequest:a3];
}

- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  v10 = (char *)self + OBJC_IVAR____TtC14NewsEngagement33EngagementBubbleTipViewController_bubbleTipSizing;
  *(void *)v10 = 0;
  v10[8] = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return [(AMSUIBubbleTipViewController *)&v12 initWithRequest:a3 bag:a4 account:a5];
}

- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1BF93D220();
    objc_super v8 = (char *)self + OBJC_IVAR____TtC14NewsEngagement33EngagementBubbleTipViewController_bubbleTipSizing;
    *(void *)objc_super v8 = 0;
    v8[8] = 1;
    id v9 = a4;
    a3 = (id)sub_1BF93D210();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (char *)self + OBJC_IVAR____TtC14NewsEngagement33EngagementBubbleTipViewController_bubbleTipSizing;
    *(void *)v10 = 0;
    v10[8] = 1;
    id v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  objc_super v12 = [(EngagementBubbleTipViewController *)&v14 initWithNibName:a3 bundle:a4];

  return v12;
}

- (_TtC14NewsEngagement33EngagementBubbleTipViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v6 = (char *)self + OBJC_IVAR____TtC14NewsEngagement33EngagementBubbleTipViewController_bubbleTipSizing;
  *(void *)objc_super v6 = 0;
  v6[8] = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(EngagementBubbleTipViewController *)&v8 initWithCoder:a3];
}

@end