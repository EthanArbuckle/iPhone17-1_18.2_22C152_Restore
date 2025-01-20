@interface PKExtractedUIFlowItem
- (PKExtractedUIFlowItem)init;
- (id)viewControllerWithCompletion:(id)a3;
- (void)preflightWithCompletion:(id)a3;
@end

@implementation PKExtractedUIFlowItem

- (void)preflightWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  ExtractedUIFlowItem.preflight(completion:)((uint64_t)sub_19F5C125C, v5);

  swift_release();
}

- (id)viewControllerWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  v7 = (void *)ExtractedUIFlowItem.viewController(completion:)((uint64_t)sub_19F5789D8, v5);

  swift_release();

  return v7;
}

- (PKExtractedUIFlowItem)init
{
  result = (PKExtractedUIFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PKExtractedUIFlowItem_completion);

  sub_19F48BB68(v3);
}

@end