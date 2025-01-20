@interface ICDeviceManagementRestrictionsManager
+ (ICDeviceManagementRestrictionsManager)sharedManager;
- (BOOL)isKeyboardMathSolvingAllowed;
- (BOOL)isMathPaperSolvingAllowed;
- (ICDeviceManagementRestrictionsManager)init;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)registerObserver;
- (void)setIsKeyboardMathSolvingAllowed:(BOOL)a3;
- (void)setIsMathPaperSolvingAllowed:(BOOL)a3;
- (void)updateRestrictions;
@end

@implementation ICDeviceManagementRestrictionsManager

- (void)dealloc
{
  v2 = self;
  id v3 = sub_1C3CE0C8C();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_unregisterObserver_, v2);
  }
  v5.receiver = v2;
  v5.super_class = (Class)ICDeviceManagementRestrictionsManager;
  [(ICDeviceManagementRestrictionsManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_1C3CE1608(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR___ICDeviceManagementRestrictionsManager____lazy_storage___connection));
}

+ (ICDeviceManagementRestrictionsManager)sharedManager
{
  if (qword_1EB6FC518 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB6FC6A0;
  return (ICDeviceManagementRestrictionsManager *)v2;
}

- (void)registerObserver
{
  v4 = self;
  id v2 = sub_1C3CE0C8C();
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, sel_registerObserver_, v4);
  }
  [(ICDeviceManagementRestrictionsManager *)v4 updateRestrictions];
}

- (void)updateRestrictions
{
  id v2 = self;
  ICDeviceManagementRestrictionsManager.updateRestrictions()();
}

- (BOOL)isMathPaperSolvingAllowed
{
  id v2 = (BOOL *)self + OBJC_IVAR___ICDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsMathPaperSolvingAllowed:(BOOL)a3
{
}

- (BOOL)isKeyboardMathSolvingAllowed
{
  id v2 = (BOOL *)self + OBJC_IVAR___ICDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsKeyboardMathSolvingAllowed:(BOOL)a3
{
}

- (ICDeviceManagementRestrictionsManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICDeviceManagementRestrictionsManager____lazy_storage___connection) = (Class)1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed) = 1;
  v3.receiver = self;
  v3.super_class = (Class)ICDeviceManagementRestrictionsManager;
  return [(ICDeviceManagementRestrictionsManager *)&v3 init];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (a4) {
    sub_1C3DB9A98();
  }
  id v6 = a3;
  v7 = self;
  [(ICDeviceManagementRestrictionsManager *)v7 updateRestrictions];

  swift_bridgeObjectRelease();
}

@end