@interface PosterEditor
- (_TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor)init;
- (id)looksForEditor:(id)a3;
- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation PosterEditor

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
}

- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_10000D2A4((uint64_t)&unk_10001FDF0, (uint64_t)v7);
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100009F60(v4);
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000A190();

  sub_10000CED4(0, &qword_10001FDE0);
  v6.super.isa = sub_1000117B0().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10000A260(v8, a4, v9);

  swift_unknownObjectRelease();
}

- (_TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor)init
{
  return (_TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor *)sub_10000B014(&OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor_controller, &OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor_editingEnvironment, (uint64_t)&OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD412PosterEditor_signpostID, type metadata accessor for PosterEditor);
}

- (void).cxx_destruct
{
}

@end