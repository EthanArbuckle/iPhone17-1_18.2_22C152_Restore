@interface PKEventDetailsListViewItem
- (PKEventDetailsListViewItem)init;
- (PKEventDetailsListViewItem)initWithTitle:(id)a3 detail:(id)a4 layoutStyle:(int64_t)a5 axID:(id)a6;
@end

@implementation PKEventDetailsListViewItem

- (PKEventDetailsListViewItem)initWithTitle:(id)a3 detail:(id)a4 layoutStyle:(int64_t)a5 axID:(id)a6
{
  uint64_t v8 = sub_1A03B4988();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1A03B4988();
  uint64_t v13 = v12;
  uint64_t v14 = sub_1A03B4988();
  uint64_t v16 = v15;
  v17 = self;
  sub_1A03AF148();
  v18 = (uint64_t *)((char *)v17 + OBJC_IVAR___PKEventDetailsListViewItem_title);
  uint64_t *v18 = v8;
  v18[1] = v10;
  v19 = (uint64_t *)((char *)v17 + OBJC_IVAR___PKEventDetailsListViewItem_detail);
  uint64_t *v19 = v11;
  v19[1] = v13;
  *(Class *)((char *)&v17->super.isa + OBJC_IVAR___PKEventDetailsListViewItem_layoutStyle) = (Class)a5;
  v20 = (uint64_t *)((char *)v17 + OBJC_IVAR___PKEventDetailsListViewItem_axID);
  uint64_t *v20 = v14;
  v20[1] = v16;

  v22.receiver = v17;
  v22.super_class = (Class)type metadata accessor for EventDetailsListViewItem(0);
  return [(PKEventDetailsListViewItem *)&v22 init];
}

- (PKEventDetailsListViewItem)init
{
  result = (PKEventDetailsListViewItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___PKEventDetailsListViewItem_uniqueIdentifier;
  uint64_t v4 = sub_1A03AF158();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end