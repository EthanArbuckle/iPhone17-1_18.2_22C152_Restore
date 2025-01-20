@interface DOCItemCollectionCellSpringLoadedInteractionBehavior
- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4;
- (_TtC5Files52DOCItemCollectionCellSpringLoadedInteractionBehavior)init;
- (void)interactionDidFinish:(id)a3;
@end

@implementation DOCItemCollectionCellSpringLoadedInteractionBehavior

- (void).cxx_destruct
{
}

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  char v8 = sub_1002D3CA0((uint64_t)a4);

  swift_unknownObjectRelease();
  return v8 & 1;
}

- (void)interactionDidFinish:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = (id)Strong;
    id v6 = a3;
    v7 = self;
    [v8 setHighlighted:0];
  }
}

- (_TtC5Files52DOCItemCollectionCellSpringLoadedInteractionBehavior)init
{
  result = (_TtC5Files52DOCItemCollectionCellSpringLoadedInteractionBehavior *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end