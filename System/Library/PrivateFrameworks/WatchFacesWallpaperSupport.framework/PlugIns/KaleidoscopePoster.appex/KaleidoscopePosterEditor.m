@interface KaleidoscopePosterEditor
- (_TtC18KaleidoscopePoster24KaleidoscopePosterEditor)init;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)trailingMenuElementsForEditor:(id)a3;
- (int64_t)activeAppearanceMenuSelectionForEditor:(id)a3;
- (void)editor:(id)a3 appearanceMenuDidChangeSelectedStyle:(int64_t)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation KaleidoscopePosterEditor

- (_TtC18KaleidoscopePoster24KaleidoscopePosterEditor)init
{
  sub_10000E764();
  return result;
}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  swift_unknownObjectWeakAssign();
  id v6 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  v7 = (objc_class *)objc_msgSend(objc_msgSend(v6, "environment"), "deviceOrientation");
  swift_unknownObjectRelease();
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_lastOrientation) = v7;

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10000ED08(v8, a4, v9);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10000FDF4(v8, a4, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_100012E48((uint64_t)v7, (char *)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100014300();
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100014428();

  sub_100014F80(0, &qword_10003BF00);
  v6.super.isa = sub_100029140().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000108A0(v4);

  NSString v6 = sub_100029070();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_100014FBC(v7, v8);
}

- (int64_t)activeAppearanceMenuSelectionForEditor:(id)a3
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_currentlySelectedAppearanceStyle);
}

- (void)editor:(id)a3 appearanceMenuDidChangeSelectedStyle:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100011528(v6, a4);
}

- (id)trailingMenuElementsForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  unint64_t v6 = sub_1000116C8(v4);

  if (v6)
  {
    sub_100014F80(0, (unint64_t *)&unk_10003BF40);
    v7.super.isa = sub_100029140().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_100014E64((uint64_t)self + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_posterData, &qword_10003C040);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_contentView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end