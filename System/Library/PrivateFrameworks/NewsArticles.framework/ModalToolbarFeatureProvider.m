@interface ModalToolbarFeatureProvider
- (void)didTap;
@end

@implementation ModalToolbarFeatureProvider

- (void)didTap
{
  uint64_t v3 = type metadata accessor for ArticleViewerFeatureAction();
  MEMORY[0x1F4188790](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))&self->actionHandler[6];
  if (v6)
  {
    swift_storeEnumTagMultiPayload();
    swift_retain();
    sub_1BF4DE0F4((uint64_t)v6);
    v6(v5);
    sub_1BF4C35A0((uint64_t)v6);
    sub_1BF54DE18((uint64_t)v5);
    swift_release();
  }
}

@end