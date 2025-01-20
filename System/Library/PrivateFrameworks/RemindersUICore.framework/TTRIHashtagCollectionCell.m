@interface TTRIHashtagCollectionCell
+ (Class)containerViewClass;
- (BOOL)_accessibilityScrollingEnabled;
- (_TtC15RemindersUICore25TTRIHashtagCollectionCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore25TTRIHashtagCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRIHashtagCollectionCell

+ (Class)containerViewClass
{
  type metadata accessor for TTRIMarginTransferringContainerBoxView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15RemindersUICore25TTRIHashtagCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1B996E9F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC15RemindersUICore25TTRIHashtagCollectionCell *)sub_1B9833864(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore25TTRIHashtagCollectionCell)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore25TTRIHashtagCollectionCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC15RemindersUICore25TTRIHashtagCollectionCell *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (BOOL)_accessibilityScrollingEnabled
{
  return 0;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore25TTRIHashtagCollectionCell_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore25TTRIHashtagCollectionCell_collectionView);
}

@end