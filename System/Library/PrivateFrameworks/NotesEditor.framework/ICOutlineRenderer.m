@interface ICOutlineRenderer
- (BOOL)selectionVisibilityRequiresEditing;
- (ICOutlineController)outlineController;
- (ICOutlineRenderer)init;
- (ICOutlineRenderer)initWithTextView:(id)a3;
- (int64_t)collapsibleSectionAffordanceExposures;
- (int64_t)collapsibleSectionAffordanceUsages;
- (void)accessibilityButtonShapesDidChange;
- (void)accessibilityStatusDidChange;
- (void)dealloc;
- (void)resetCollapsibleSectionsAffordanceExposures;
- (void)resetCollapsibleSectionsAffordanceUsageData;
- (void)resetCollapsibleSectionsAffordanceUsages;
- (void)setSelectionVisibilityRequiresEditing:(BOOL)a3;
- (void)textViewLayoutDidChangeWithNotification:(id)a3;
@end

@implementation ICOutlineRenderer

- (ICOutlineController)outlineController
{
  v2 = self;
  id v3 = OutlineRenderer.outlineController.getter();

  return (ICOutlineController *)v3;
}

- (BOOL)selectionVisibilityRequiresEditing
{
  v2 = (BOOL *)self + OBJC_IVAR___ICOutlineRenderer_selectionVisibilityRequiresEditing;
  swift_beginAccess();
  return *v2;
}

- (void)setSelectionVisibilityRequiresEditing:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___ICOutlineRenderer_selectionVisibilityRequiresEditing;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (ICOutlineRenderer)initWithTextView:(id)a3
{
  return (ICOutlineRenderer *)OutlineRenderer.init(textView:)(a3);
}

- (void)dealloc
{
  v2 = self;
  OutlineRenderer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)collapsibleSectionAffordanceExposures
{
  v2 = (char *)self + OBJC_IVAR___ICOutlineRenderer_affordanceShownUUIDs;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16);
}

- (void)resetCollapsibleSectionsAffordanceExposures
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICOutlineRenderer_affordanceShownUUIDs);
  swift_beginAccess();
  void *v2 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRelease();
}

- (int64_t)collapsibleSectionAffordanceUsages
{
  v2 = self;
  id v3 = OutlineRenderer.collapsibleSectionAffordanceUsages.getter();

  return (int64_t)v3;
}

- (void)resetCollapsibleSectionsAffordanceUsages
{
  v2 = self;
  OutlineRenderer.resetCollapsibleSectionsAffordanceUsages()();
}

- (void)resetCollapsibleSectionsAffordanceUsageData
{
  id v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICOutlineRenderer_affordanceShownUUIDs);
  swift_beginAccess();
  *id v3 = MEMORY[0x263F8EE88];
  v4 = self;
  swift_bridgeObjectRelease();
  OutlineRenderer.resetCollapsibleSectionsAffordanceUsages()();
}

- (void)textViewLayoutDidChangeWithNotification:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  v8 = self;
  sub_20C096478();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)accessibilityStatusDidChange
{
  v2 = self;
  sub_20C096478();
}

- (void)accessibilityButtonShapesDidChange
{
  id v1 = a1;
  sub_20C14F3E8();
  sub_20C096478();
}

- (ICOutlineRenderer)init
{
  result = (ICOutlineRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end