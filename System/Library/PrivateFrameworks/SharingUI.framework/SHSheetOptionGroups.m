@interface SHSheetOptionGroups
+ (BOOL)supportsBSXPCSecureCoding;
- (_TtC9SharingUI19SHSheetOptionGroups)init;
- (_TtC9SharingUI19SHSheetOptionGroups)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation SHSheetOptionGroups

- (void)encodeWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21DBA52FC(a3);

  swift_unknownObjectRelease();
}

- (_TtC9SharingUI19SHSheetOptionGroups)initWithBSXPCCoder:(id)a3
{
  return (_TtC9SharingUI19SHSheetOptionGroups *)SHSheetOptionGroups.init(bsxpcCoder:)(a3);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return sub_21DBAC768() & 1;
}

- (_TtC9SharingUI19SHSheetOptionGroups)init
{
  return (_TtC9SharingUI19SHSheetOptionGroups *)SHSheetOptionGroups.init()();
}

- (void).cxx_destruct
{
}

@end