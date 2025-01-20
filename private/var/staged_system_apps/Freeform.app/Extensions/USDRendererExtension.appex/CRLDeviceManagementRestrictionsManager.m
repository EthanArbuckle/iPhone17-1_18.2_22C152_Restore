@interface CRLDeviceManagementRestrictionsManager
+ (NSString)deviceManagementRestrictionsChangedNotificationName;
+ (_TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager)sharedManager;
- (BOOL)isDefinitionLookupAllowed;
- (BOOL)isKeyboardMathSolvingAllowed;
- (BOOL)isMathPaperSolvingAllowed;
- (_TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager)init;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)registerObserver;
- (void)setIsDefinitionLookupAllowed:(BOOL)a3;
- (void)setIsKeyboardMathSolvingAllowed:(BOOL)a3;
- (void)setIsMathPaperSolvingAllowed:(BOOL)a3;
@end

@implementation CRLDeviceManagementRestrictionsManager

+ (NSString)deviceManagementRestrictionsChangedNotificationName
{
  return (NSString *)sub_1000552C8((uint64_t)a1, (uint64_t)a2, &qword_100093128, (void **)&static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName);
}

- (BOOL)isMathPaperSolvingAllowed
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsMathPaperSolvingAllowed:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isKeyboardMathSolvingAllowed
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsKeyboardMathSolvingAllowed:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isDefinitionLookupAllowed
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsDefinitionLookupAllowed:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)dealloc
{
  v2 = self;
  id v3 = sub_1000550B4();
  if (v3)
  {
    v4 = v3;
    [v3 unregisterObserver:v2];
  }
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  [(CRLDeviceManagementRestrictionsManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_100055904(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager____lazy_storage___connection));
}

+ (_TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager)sharedManager
{
  return (_TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager *)sub_1000552C8((uint64_t)a1, (uint64_t)a2, &qword_100093130, (void **)&qword_1000952F0);
}

- (void)registerObserver
{
  v2 = self;
  CRLDeviceManagementRestrictionsManager.registerObserver()();
}

- (_TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed) = 1;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed) = 1;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed) = 1;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager____lazy_storage___connection) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  return [(CRLDeviceManagementRestrictionsManager *)&v3 init];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (a4) {
    sub_10005E6B0();
  }
  id v6 = a3;
  v7 = self;
  _s20USDRendererExtension38CRLDeviceManagementRestrictionsManagerC63profileConnectionDidReceiveEffectiveSettingsChangedNotification_8userInfoySo09MCProfileH0CSg_SDys11AnyHashableVypGSgtF_0(a3);

  swift_bridgeObjectRelease();
}

@end