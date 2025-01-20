@interface AccountCollectionViewDelegate
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate)init;
- (double)collectionView:(id)a3 heightForFooterViewInTableLayout:(id)a4;
- (double)collectionView:(id)a3 heightForHeaderViewInTableLayout:(id)a4;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForFooterInSection:(int64_t)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation AccountCollectionViewDelegate

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v10 = a3;
  v11 = self;
  char v12 = sub_381160();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v10 = a3;
  v11 = self;
  sub_381100();
  Class isa = sub_37B0D0().super.isa;
  [v10 deselectItemAtIndexPath:isa animated:1];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_37B160();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_3843C0();
  uint64_t v15 = v14;
  sub_37B0E0();
  id v16 = a3;
  id v17 = a4;
  v18 = self;
  sub_276A40(v17, v13, v15, (uint64_t)v12);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_37B160();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v12 = a3;
  uint64_t v13 = (char *)a4;
  uint64_t v14 = self;
  sub_274538(v12, v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate)init
{
  result = (_TtC23ShelfKitCollectionViews29AccountCollectionViewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectWeakDestroy();
}

- (double)collectionView:(id)a3 heightForHeaderViewInTableLayout:(id)a4
{
  uint64_t v6 = qword_470428;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  if (v6 != -1) {
    swift_once();
  }
  double v10 = *(double *)&xmmword_49F048;
  if (byte_49F058 == 1)
  {
    double v11 = *((double *)&xmmword_49F048 + 1);
    double v12 = *(double *)&xmmword_49F048;
    sub_2A7A4();
    char v13 = sub_384BB0();

    if (v13) {
      return v12;
    }
    else {
      return v11;
    }
  }
  else
  {

    return v10;
  }
}

- (double)collectionView:(id)a3 heightForFooterViewInTableLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_27755C(v6);
  double v10 = v9;

  return v10;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = self;
  double v11 = sub_27765C(v8, a5);

  return v11;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForFooterInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = self;
  double v11 = sub_277140(v8, a5);

  return v11;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_37B160();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_2778EC(v12);
  double v16 = v15;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

- (void)textFieldDidBeginEditing:(id)a3
{
}

- (void)textFieldDidEndEditing:(id)a3
{
}

@end