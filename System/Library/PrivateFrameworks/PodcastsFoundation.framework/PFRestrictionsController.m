@interface PFRestrictionsController
+ (BOOL)isExplicitContentAllowed;
+ (PFRestrictionsController)shared;
- (PFRestrictionsController)init;
- (void)reload;
- (void)startListening;
- (void)stopListening;
@end

@implementation PFRestrictionsController

+ (PFRestrictionsController)shared
{
  if (qword_1EB7712B0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB7712A0;
  return (PFRestrictionsController *)v2;
}

+ (BOOL)isExplicitContentAllowed
{
  if (qword_1EB7712B0 != -1) {
    swift_once();
  }
  v2 = *(os_unfair_lock_s **)(qword_1EB7712A0 + OBJC_IVAR___PFRestrictionsController__state);
  v3 = v2 + 4;
  v4 = v2 + 6;
  os_unfair_lock_lock(v2 + 6);
  sub_1ACA30C84(v3, &v6);
  os_unfair_lock_unlock(v4);
  return v6 == 0;
}

- (PFRestrictionsController)init
{
  return (PFRestrictionsController *)sub_1ACC69234();
}

- (void)startListening
{
  v2 = self;
  RestrictionsController.startListening()();
}

- (void)stopListening
{
  v2 = self;
  RestrictionsController.stopListening()();
}

- (void)reload
{
  v2 = self;
  RestrictionsController.reload()();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFRestrictionsController_observation);
}

@end