@interface PUPickerNavigationBarPalette
- (PUPickerNavigationBarPalette)initWithContentView:(id)a3;
- (PUPickerNavigationBarPalette)initWithTopView:(id)a3 bottomView:(id)a4;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sizeTraitsDidChange;
@end

@implementation PUPickerNavigationBarPalette

- (PUPickerNavigationBarPalette)initWithTopView:(id)a3 bottomView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  return (PUPickerNavigationBarPalette *)sub_1AEAA636C(a3, a4);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AEAA6704();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_1AEF96DE0();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_1AEF97980();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1AEAA7AA4(&qword_1E9A98398, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v15 = sub_1AEF96CA0();

LABEL_8:
  sub_1AEAA6784(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AEA1B314((uint64_t)v18);
}

- (void)sizeTraitsDidChange
{
  v2 = self;
  sub_1AEAA6E00();
}

- (PUPickerNavigationBarPalette)initWithContentView:(id)a3
{
  id v3 = a3;
  sub_1AEAA70A8();
}

@end