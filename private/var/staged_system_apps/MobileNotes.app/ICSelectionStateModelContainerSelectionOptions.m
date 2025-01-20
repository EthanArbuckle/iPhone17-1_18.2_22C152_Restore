@interface ICSelectionStateModelContainerSelectionOptions
- (BOOL)animated;
- (BOOL)deferUntilDataLoaded;
- (BOOL)ensurePresented;
- (BOOL)forceApply;
- (BOOL)isEqual:(id)a3;
- (BOOL)usingRootViewController;
- (ICNoteBrowseViewController)noteBrowseViewController;
- (ICSelectionStateModelContainerSelectionOptions)init;
- (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks)completionBlocks;
- (NSNumber)dismissOverlayContent;
- (NSNumber)ensureSelectedNote;
- (NSNumber)keepEditorShowing;
- (id)copyWithZone:(void *)a3;
- (void)setNoteBrowseViewController:(id)a3;
@end

@implementation ICSelectionStateModelContainerSelectionOptions

- (BOOL)forceApply
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_forceApply);
}

- (ICNoteBrowseViewController)noteBrowseViewController
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ICNoteBrowseViewController *)Strong;
}

- (void)setNoteBrowseViewController:(id)a3
{
}

- (BOOL)usingRootViewController
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_usingRootViewController);
}

- (BOOL)ensurePresented
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_ensurePresented);
}

- (NSNumber)ensureSelectedNote
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_ensureSelectedNote));
}

- (BOOL)deferUntilDataLoaded
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_deferUntilDataLoaded);
}

- (NSNumber)dismissOverlayContent
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_dismissOverlayContent));
}

- (NSNumber)keepEditorShowing
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_keepEditorShowing));
}

- (BOOL)animated
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_animated);
}

- (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks)completionBlocks
{
  return (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks *)*(id *)((char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_completionBlocks);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_100196DB4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))sub_100196B7C);
}

- (BOOL)isEqual:(id)a3
{
  return sub_100196E34(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))type metadata accessor for ICSelectionStateModel.ContainerSelectionOptions);
}

- (ICSelectionStateModelContainerSelectionOptions)init
{
  result = (ICSelectionStateModelContainerSelectionOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_ensureSelectedNote));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_dismissOverlayContent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_keepEditorShowing));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptions_completionBlocks);
}

@end