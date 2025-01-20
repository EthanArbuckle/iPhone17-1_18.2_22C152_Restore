@interface MapsHomeQuickActionMenuPresenter
- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4;
- (_TtC4Maps32MapsHomeQuickActionMenuPresenter)initWithCollectionView:(id)a3;
- (_TtC4Maps32MapsHomeQuickActionMenuPresenter)initWithView:(id)a3;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
@end

@implementation MapsHomeQuickActionMenuPresenter

- (_TtC4Maps32MapsHomeQuickActionMenuPresenter)initWithCollectionView:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Maps32MapsHomeQuickActionMenuPresenter_collectionView) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MapsHomeQuickActionMenuPresenter();
  return [(QuickActionMenuPresenter *)&v5 initWithView:a3];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  id v10 = _s4Maps0A28HomeQuickActionMenuPresenterC07contextE11Interaction_13configuration37highlightPreviewForItemWithIdentifierSo010UITargetedK0CSgSo09UIContexteH0C_So0qE13ConfigurationCSo9NSCopying_ptF_0();

  swift_unknownObjectRelease();

  return v10;
}

- (BOOL)shouldBeginOrbGestureAtLocation:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = self;
  LOBYTE(self) = MapsHomeQuickActionMenuPresenter.shouldBeginOrbGesture(atLocation:in:)(v7, x, y);

  return self & 1;
}

- (_TtC4Maps32MapsHomeQuickActionMenuPresenter)initWithView:(id)a3
{
  id v3 = a3;
  result = (_TtC4Maps32MapsHomeQuickActionMenuPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps32MapsHomeQuickActionMenuPresenter_collectionView));
}

@end