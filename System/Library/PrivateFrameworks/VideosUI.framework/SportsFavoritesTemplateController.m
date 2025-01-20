@interface SportsFavoritesTemplateController
- (_TtC8VideosUI33SportsFavoritesTemplateController)initWithCoder:(id)a3;
- (uint64_t)onAuthenticationDidChange:;
- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4;
- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLoad;
@end

@implementation SportsFavoritesTemplateController

- (_TtC8VideosUI33SportsFavoritesTemplateController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E348E02C();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E348E0F0();
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E348E268(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E348E6C0(v4);
}

- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4
{
  uint64_t v7 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_13();
  sub_1E3876448();
  id v11 = a3;
  v12 = self;
  sub_1E348EC54();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v7);
}

- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5
{
  uint64_t v8 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3876448();
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  sub_1E348EFCC(v14, (uint64_t)v15, v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI33SportsFavoritesTemplateController_templateUpdateObserver);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (uint64_t)onAuthenticationDidChange:
{
  OUTLINED_FUNCTION_128();
  uint64_t v2 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_14();
  sub_1E3875BE8();
  id v6 = v0;
  sub_1E348FD08();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
}

@end