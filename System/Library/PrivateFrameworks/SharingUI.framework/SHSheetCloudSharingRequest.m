@interface SHSheetCloudSharingRequest
+ (BOOL)supportsBSXPCSecureCoding;
- (_TtC9SharingUI26SHSheetCloudSharingRequest)init;
- (_TtC9SharingUI26SHSheetCloudSharingRequest)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation SHSheetCloudSharingRequest

- (void)encodeWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21DBA5C38(a3);

  swift_unknownObjectRelease();
}

- (_TtC9SharingUI26SHSheetCloudSharingRequest)initWithBSXPCCoder:(id)a3
{
  return (_TtC9SharingUI26SHSheetCloudSharingRequest *)SHSheetCloudSharingRequest.init(bsxpcCoder:)(a3);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return sub_21DBAC768() & 1;
}

- (_TtC9SharingUI26SHSheetCloudSharingRequest)init
{
  return (_TtC9SharingUI26SHSheetCloudSharingRequest *)SHSheetCloudSharingRequest.init()();
}

- (void).cxx_destruct
{
}

@end