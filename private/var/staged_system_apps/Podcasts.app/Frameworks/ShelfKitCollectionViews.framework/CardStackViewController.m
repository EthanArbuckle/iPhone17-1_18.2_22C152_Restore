@interface CardStackViewController
- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)popWithCard:(id)a3;
- (void)viewDidLoad;
@end

@implementation CardStackViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2A834C();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  unint64_t v3 = sub_2A8828();

  return v3;
}

- (void)popWithCard:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2A8928(v4);
}

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_3843C0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController *)sub_2A99E8(v5, v7, a4);
}

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController_cardStackView) = 0;
  *(void *)&self->cardStackView[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController_maximumNumberOfCards) = (Class)(&dword_0 + 3);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CardStackViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController_cardStackView));
  unint64_t v3 = (char *)self
     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B323CardStackViewController_delegate;

  sub_154940((uint64_t)v3);
}

@end