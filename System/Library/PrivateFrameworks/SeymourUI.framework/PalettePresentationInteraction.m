@interface PalettePresentationInteraction
- (UIView)view;
- (_TtC9SeymourUI30PalettePresentationInteraction)init;
- (void)didMoveToView:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation PalettePresentationInteraction

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_view));
}

- (void)setView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_view);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_view) = (Class)a3;
  id v3 = a3;
}

- (_TtC9SeymourUI30PalettePresentationInteraction)init
{
  return (_TtC9SeymourUI30PalettePresentationInteraction *)sub_239C93188();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_delegate);

  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_panGestureRecognizer));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_tapGestureRecognizer);
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_239C93408(a3);
}

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_239C93568(a3);
}

@end