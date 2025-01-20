@interface PhotosPersonOrSocialGroupTitleModel
- (_TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel)init;
- (void)photoLibraryDidChange:(id)a3;
@end

@implementation PhotosPersonOrSocialGroupTitleModel

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A9D6EC58();
}

- (_TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel)init
{
  result = (_TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel_backingObject));
  v3 = (char *)self
     + OBJC_IVAR____TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel___observationRegistrar;
  uint64_t v4 = sub_1AB230BAC();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end