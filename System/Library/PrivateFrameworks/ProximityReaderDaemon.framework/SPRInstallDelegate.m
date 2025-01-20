@interface SPRInstallDelegate
- (void)onFailureWithError:(id)a3;
- (void)onSuccessWithInstallData:(id)a3;
- (void)onUpdateWithEvent:(int64_t)a3 progress:(int64_t)a4;
@end

@implementation SPRInstallDelegate

- (void)onSuccessWithInstallData:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_25AB7650C(v3);

  swift_release();
}

- (void)onFailureWithError:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_25AB76928(v3);
  swift_release();
}

- (void)onUpdateWithEvent:(int64_t)a3 progress:(int64_t)a4
{
  if (a3 == 3)
  {
    v6 = *(void (**)(int64_t))self->installProgress;
    swift_retain();
    v6(a4);
    swift_release();
  }
}

@end