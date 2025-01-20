@interface TTRITreeViewContextMenuItemIdentifier
- (BOOL)isEqual:(id)a3;
- (_TtC9Reminders37TTRITreeViewContextMenuItemIdentifier)init;
- (int64_t)hash;
@end

@implementation TTRITreeViewContextMenuItemIdentifier

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_100585378((uint64_t)v8);

  sub_10003D3BC((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = AnyHashable.hashValue.getter();

  return v3;
}

- (_TtC9Reminders37TTRITreeViewContextMenuItemIdentifier)init
{
  result = (_TtC9Reminders37TTRITreeViewContextMenuItemIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100055AE8((uint64_t)self + OBJC_IVAR____TtC9Reminders37TTRITreeViewContextMenuItemIdentifier_itemID);
  int64_t v3 = (char *)self + OBJC_IVAR____TtC9Reminders37TTRITreeViewContextMenuItemIdentifier_userInfo;

  sub_10003D3BC((uint64_t)v3);
}

@end