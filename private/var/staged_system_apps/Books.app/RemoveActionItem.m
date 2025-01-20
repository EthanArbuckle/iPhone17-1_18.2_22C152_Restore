@interface RemoveActionItem
- (_TtC5Books16RemoveActionItem)init;
@end

@implementation RemoveActionItem

- (_TtC5Books16RemoveActionItem)init
{
  result = (_TtC5Books16RemoveActionItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books16RemoveActionItem_context);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books16RemoveActionItem_data);

  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books16RemoveActionItem_figaroProvider);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books16RemoveActionItem_libraryOperationProvider);
  v3 = (char *)self + OBJC_IVAR____TtC5Books16RemoveActionItem_type;
  uint64_t v4 = sub_1007F3110();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end