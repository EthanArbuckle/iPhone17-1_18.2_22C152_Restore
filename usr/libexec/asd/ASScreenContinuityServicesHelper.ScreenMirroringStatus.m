@interface ASScreenContinuityServicesHelper.ScreenMirroringStatus
- (NSDate)sessionStart;
- (_TtCC3asd32ASScreenContinuityServicesHelper21ScreenMirroringStatus)init;
- (_TtCC3asd32ASScreenContinuityServicesHelper21ScreenMirroringStatus)initWithStatus:(int64_t)a3 sessionStart:(id)a4;
- (int64_t)status;
@end

@implementation ASScreenContinuityServicesHelper.ScreenMirroringStatus

- (int64_t)status
{
  return ASScreenContinuityServicesHelper.ScreenMirroringStatus.status.getter();
}

- (NSDate)sessionStart
{
  v2 = ASScreenContinuityServicesHelper.ScreenMirroringStatus.sessionStart.getter();

  return (NSDate *)v2;
}

- (_TtCC3asd32ASScreenContinuityServicesHelper21ScreenMirroringStatus)initWithStatus:(int64_t)a3 sessionStart:(id)a4
{
  id v6 = a4;
  return (_TtCC3asd32ASScreenContinuityServicesHelper21ScreenMirroringStatus *)ASScreenContinuityServicesHelper.ScreenMirroringStatus.init(status:sessionStart:)(a3, (uint64_t)a4);
}

- (_TtCC3asd32ASScreenContinuityServicesHelper21ScreenMirroringStatus)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC3asd32ASScreenContinuityServicesHelper21ScreenMirroringStatus_sessionStart));
}

@end