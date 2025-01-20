@interface PopOverManager
- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3;
- (_TtC9SnippetUI14PopOverManager)init;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
@end

@implementation PopOverManager

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)prepareForPopoverPresentation:(id)a3
{
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22C23F5D0();

  return 1;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
}

- (_TtC9SnippetUI14PopOverManager)init
{
  return (_TtC9SnippetUI14PopOverManager *)sub_22C23F6BC();
}

- (void).cxx_destruct
{
  sub_22C230CBC((uint64_t)self + OBJC_IVAR____TtC9SnippetUI14PopOverManager_layout, (uint64_t *)&unk_2684A8220);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADF4260);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_62();
  v2();

  swift_unknownObjectWeakDestroy();
}

@end