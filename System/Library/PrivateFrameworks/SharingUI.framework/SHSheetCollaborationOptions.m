@interface SHSheetCollaborationOptions
+ (BOOL)supportsBSXPCSecureCoding;
- (_TtC9SharingUI27SHSheetCollaborationOptions)init;
- (_TtC9SharingUI27SHSheetCollaborationOptions)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation SHSheetCollaborationOptions

- (void)encodeWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21DBA4B58(a3);

  swift_unknownObjectRelease();
}

- (_TtC9SharingUI27SHSheetCollaborationOptions)initWithBSXPCCoder:(id)a3
{
  return (_TtC9SharingUI27SHSheetCollaborationOptions *)SHSheetCollaborationOptions.init(bsxpcCoder:)(a3);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return sub_21DBAC768() & 1;
}

- (_TtC9SharingUI27SHSheetCollaborationOptions)init
{
  return (_TtC9SharingUI27SHSheetCollaborationOptions *)SHSheetCollaborationOptions.init()();
}

- (void).cxx_destruct
{
  sub_21DB74628((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SharingUI27SHSheetCollaborationOptions_shareOptionsData));
}

@end