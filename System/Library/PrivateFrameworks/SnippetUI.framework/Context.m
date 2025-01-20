@interface Context
- (VRXInteractionDelegate)interactionDelegate;
- (_TtC9SnippetUI7Context)init;
- (double)snippetWidth;
- (int64_t)backgroundMaterial;
- (int64_t)currentIdiom;
- (void)setBackgroundMaterial:(int64_t)a3;
- (void)setCurrentIdiom:(int64_t)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setSnippetWidth:(double)a3;
@end

@implementation Context

- (int64_t)currentIdiom
{
  return sub_22C3A60CC();
}

- (void)setCurrentIdiom:(int64_t)a3
{
  v4 = self;
  sub_22C3A6154(a3);
}

- (double)snippetWidth
{
  v2 = self;
  double v3 = sub_22C3A6604();

  return v3;
}

- (void)setSnippetWidth:(double)a3
{
  double v3 = self;
  sub_22C3A66BC();
}

- (VRXInteractionDelegate)interactionDelegate
{
  v2 = (void *)sub_22C3A6900();

  return (VRXInteractionDelegate *)v2;
}

- (void)setInteractionDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_22C3A6998();
}

- (int64_t)backgroundMaterial
{
  v2 = self;
  int64_t v3 = sub_22C3A6C84();

  return v3;
}

- (void)setBackgroundMaterial:(int64_t)a3
{
  int64_t v3 = self;
  sub_22C3A6D38();
}

- (_TtC9SnippetUI7Context)init
{
}

- (void).cxx_destruct
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADF4260);
  OUTLINED_FUNCTION_1_7();
  uint64_t v3 = OUTLINED_FUNCTION_18_12();
  v4(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ADF41F8);
  OUTLINED_FUNCTION_1_7();
  uint64_t v5 = OUTLINED_FUNCTION_18_12();
  v6(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ADF41E0);
  OUTLINED_FUNCTION_1_7();
  uint64_t v7 = OUTLINED_FUNCTION_18_12();
  v8(v7);
  v9 = (char *)self + OBJC_IVAR____TtC9SnippetUI7Context__isInAmbient;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADF4230);
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v12 = (char *)self + OBJC_IVAR____TtC9SnippetUI7Context__scaleFactor;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ADF4250);
  OUTLINED_FUNCTION_1_7();
  (*(void (**)(char *))(v13 + 8))(v12);
  uint64_t v14 = OUTLINED_FUNCTION_22_10(OBJC_IVAR____TtC9SnippetUI7Context__isVibrant);
  ((void (*)(uint64_t))v11)(v14);
  uint64_t v15 = OUTLINED_FUNCTION_22_10(OBJC_IVAR____TtC9SnippetUI7Context__isSmartDialog);
  ((void (*)(uint64_t))v11)(v15);
  uint64_t v16 = OUTLINED_FUNCTION_22_10(OBJC_IVAR____TtC9SnippetUI7Context__isPresentedWithSmartDialogText);
  ((void (*)(uint64_t))v11)(v16);
  uint64_t v17 = OUTLINED_FUNCTION_22_10(OBJC_IVAR____TtC9SnippetUI7Context__preferFullScreen);
  ((void (*)(uint64_t))v11)(v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADF41B0);
  OUTLINED_FUNCTION_1_7();
  uint64_t v18 = OUTLINED_FUNCTION_18_12();
  v19(v18);
  sub_22C3ADB5C((uint64_t)self + OBJC_IVAR____TtC9SnippetUI7Context_interactionDelegate);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADF4278);
  OUTLINED_FUNCTION_1_7();
  uint64_t v20 = OUTLINED_FUNCTION_18_12();
  v21(v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ADF4218);
  OUTLINED_FUNCTION_1_7();
  uint64_t v22 = OUTLINED_FUNCTION_18_12();
  v23(v22);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end