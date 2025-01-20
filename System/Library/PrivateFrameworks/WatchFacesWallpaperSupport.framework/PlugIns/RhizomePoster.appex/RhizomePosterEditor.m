@interface RhizomePosterEditor
- (BOOL)editor:(id)a3 shouldAllowUserToSelectTimeFontConfiguration:(id)a4;
- (BOOL)editorShouldAllowUserToAdjustTimeColor:(id)a3;
- (_TtC13RhizomePoster19RhizomePosterEditor)init;
- (id)additionalTimeFontConfigurationsForEditor:(id)a3;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)timeColorPickerConfigurationForEditor:(id)a3;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation RhizomePosterEditor

- (_TtC13RhizomePoster19RhizomePosterEditor)init
{
  return (_TtC13RhizomePoster19RhizomePosterEditor *)sub_10002D7B4();
}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_100030858(v5);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10002D9D8(v8, a4, v9);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  swift_unknownObjectWeakAssign();
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10003A530();

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_10003142C(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100031660();
}

- (BOOL)editor:(id)a3 shouldAllowUserToSelectTimeFontConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_100031868(v7);

  return v9 & 1;
}

- (id)additionalTimeFontConfigurationsForEditor:(id)a3
{
  return 0;
}

- (BOOL)editorShouldAllowUserToAdjustTimeColor:(id)a3
{
  return 1;
}

- (id)timeColorPickerConfigurationForEditor:(id)a3
{
  id v3 = sub_100031A84();
  return v3;
}

- (id)looksForEditor:(id)a3
{
  uint64_t v4 = qword_10004AD00;
  id v5 = a3;
  id v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();

  sub_10002255C(0, &qword_10004B540);
  v7.super.isa = sub_10003A780().super.isa;
  swift_bridgeObjectRelease();
  return v7.super.isa;
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100031B6C(v4);

  NSString v6 = sub_10003A6E0();
  swift_bridgeObjectRelease();
  return v6;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end