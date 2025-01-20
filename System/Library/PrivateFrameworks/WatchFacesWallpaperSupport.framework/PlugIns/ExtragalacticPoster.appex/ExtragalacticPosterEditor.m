@interface ExtragalacticPosterEditor
- (BOOL)editor:(id)a3 shouldAllowUserToSelectTimeFontConfiguration:(id)a4;
- (BOOL)editorShouldAllowUserToAdjustTimeColor:(id)a3;
- (_TtC19ExtragalacticPoster25ExtragalacticPosterEditor)init;
- (id)additionalTimeFontConfigurationsForEditor:(id)a3;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)timeColorPickerConfigurationForEditor:(id)a3;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation ExtragalacticPosterEditor

- (_TtC19ExtragalacticPoster25ExtragalacticPosterEditor)init
{
  return (_TtC19ExtragalacticPoster25ExtragalacticPosterEditor *)sub_100009728();
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10000987C((uint64_t)v8, a4, v9);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  id v9 = self;
  sub_10000A410(v7, a5);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_10000A774(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000AB10();
}

- (BOOL)editor:(id)a3 shouldAllowUserToSelectTimeFontConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10000AE94();
  char v10 = v9;

  return v10 & 1;
}

- (id)additionalTimeFontConfigurationsForEditor:(id)a3
{
  uint64_t v4 = qword_100026C88;
  id v5 = a3;
  id v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();

  sub_10000B9B8(0, &qword_100027598);
  v7.super.isa = sub_100018A80().super.isa;
  swift_bridgeObjectRelease();
  return v7.super.isa;
}

- (BOOL)editorShouldAllowUserToAdjustTimeColor:(id)a3
{
  return 1;
}

- (id)timeColorPickerConfigurationForEditor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_10000B0C0(v4);

  return v6;
}

- (id)looksForEditor:(id)a3
{
  sub_10000B3B8();
  sub_10000B9B8(0, (unint64_t *)&qword_100027588);
  v3.super.isa = sub_100018A80().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10000B6B4(v4);

  NSString v6 = sub_1000189E0();
  swift_bridgeObjectRelease();
  return v6;
}

- (void).cxx_destruct
{
}

@end