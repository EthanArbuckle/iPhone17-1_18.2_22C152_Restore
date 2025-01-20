@interface PosterEditor
- (BOOL)editorShouldBeginFinalization:(id)a3;
- (BOOL)looksShareBaseAppearanceForEditor:(id)a3;
- (_TtC20PhotosPosterProvider12PosterEditor)init;
- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5;
- (id)gradientHomeScreenColorPickerConfigurationForEditor:(id)a3;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)leadingMenuElementsForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)solidColorHomeScreenColorPickerConfigurationForEditor:(id)a3;
- (id)trailingMenuElementsForEditor:(id)a3;
- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 depthEffectDisallowedDidChange:(BOOL)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidDelayFinalizationForBackgroundTask:(id)a3;
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
}

- (BOOL)editorShouldBeginFinalization:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100006A10(v4);

  return self & 1;
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100006AC0(v4);
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100006C84(v4);

  sub_10000BAE8(0, &qword_10003D430);
  v6.super.isa = sub_100028D40().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1000072F4(v8, v9, a5);
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000074B8(v4);

  NSString v6 = sub_100028CB0();
  swift_bridgeObjectRelease();
  return v6;
}

- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_100007590(v7, v8);
  double v11 = v10;

  return v11;
}

- (id)leadingMenuElementsForEditor:(id)a3
{
  return sub_1000077AC(self, (uint64_t)a2, a3, sub_1000076BC);
}

- (id)trailingMenuElementsForEditor:(id)a3
{
  return sub_1000077AC(self, (uint64_t)a2, a3, sub_10000773C);
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  double v10 = self;
  sub_100007850(v8, a4, v9);

  swift_unknownObjectRelease();
}

- (id)solidColorHomeScreenColorPickerConfigurationForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100007BD8(v4);

  return v6;
}

- (id)gradientHomeScreenColorPickerConfigurationForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100007C90(v4);

  return v6;
}

- (BOOL)looksShareBaseAppearanceForEditor:(id)a3
{
  return 1;
}

- (void)editor:(id)a3 depthEffectDisallowedDidChange:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100007D68(v6, a4);
}

- (void)editorDidDelayFinalizationForBackgroundTask:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007EF4(v4);
}

- (_TtC20PhotosPosterProvider12PosterEditor)init
{
  return (_TtC20PhotosPosterProvider12PosterEditor *)sub_100008FE4(&OBJC_IVAR____TtC20PhotosPosterProvider12PosterEditor_controller, &OBJC_IVAR____TtC20PhotosPosterProvider12PosterEditor_editingEnvironment, (uint64_t)&OBJC_IVAR____TtC20PhotosPosterProvider12PosterEditor_signpostID, type metadata accessor for PosterEditor);
}

- (void).cxx_destruct
{
}

@end