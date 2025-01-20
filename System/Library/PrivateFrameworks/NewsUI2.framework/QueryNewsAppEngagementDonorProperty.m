@interface QueryNewsAppEngagementDonorProperty
- (void)locationDetectionManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
@end

@implementation QueryNewsAppEngagementDonorProperty

- (void)locationDetectionManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if (a4 >= 5) {
    char v4 = 0;
  }
  else {
    char v4 = a4;
  }
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI235QueryNewsAppEngagementDonorProperty_locationSharingStatus) = v4;
}

@end