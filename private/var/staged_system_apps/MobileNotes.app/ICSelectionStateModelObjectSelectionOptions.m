@interface ICSelectionStateModelObjectSelectionOptions
- (BOOL)animated;
- (BOOL)dismissOverlayContent;
- (BOOL)ensurePresented;
- (BOOL)isEqual:(id)a3;
- (BOOL)showInkPicker;
- (BOOL)showLatestUpdatesIfAvailable;
- (BOOL)startEditing;
- (ICSelectionStateModelObjectSelectionOptions)init;
- (ICTextViewScrollState)scrollState;
- (id)copyWithZone:(void *)a3;
@end

@implementation ICSelectionStateModelObjectSelectionOptions

- (ICTextViewScrollState)scrollState
{
  return (ICTextViewScrollState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_scrollState));
}

- (BOOL)startEditing
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_startEditing);
}

- (BOOL)showInkPicker
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_showInkPicker);
}

- (BOOL)dismissOverlayContent
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_dismissOverlayContent);
}

- (BOOL)showLatestUpdatesIfAvailable
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_showLatestUpdatesIfAvailable);
}

- (BOOL)animated
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_animated);
}

- (BOOL)ensurePresented
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelObjectSelectionOptions_ensurePresented);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_100196DB4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))sub_100196490);
}

- (BOOL)isEqual:(id)a3
{
  return sub_100196E34(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))type metadata accessor for ICSelectionStateModel.ObjectSelectionOptions);
}

- (ICSelectionStateModelObjectSelectionOptions)init
{
  result = (ICSelectionStateModelObjectSelectionOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end