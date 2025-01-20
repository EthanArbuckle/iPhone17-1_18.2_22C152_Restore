@interface DefaultOneUpBadgeContentProvider
- (_TtC15PhotosUIPrivate32DefaultOneUpBadgeContentProvider)init;
- (id)undoManagerForActionPerformer:(id)a3;
@end

@implementation DefaultOneUpBadgeContentProvider

- (_TtC15PhotosUIPrivate32DefaultOneUpBadgeContentProvider)init
{
}

- (void).cxx_destruct
{
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate32DefaultOneUpBadgeContentProvider_delegate);
  swift_unknownObjectRelease();
}

- (id)undoManagerForActionPerformer:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1AEB1FDE8();

  return v6;
}

@end