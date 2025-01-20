@interface DOCHierarchyController
- (BOOL)effectiveRootLocationIsHidingParentLocations;
- (BOOL)hasPendingLocationChange;
- (BOOL)isFetchingLocations;
- (BOOL)isLoadingDisabled;
- (BOOL)isResetBeingPerformed;
- (BOOL)shouldForceChangeInPreparationQueue;
- (DOCConcreteLocation)effectiveRootLocation;
- (DOCConcreteLocation)lastLocation;
- (DOCConcreteLocation)locationForDeterminingCurrentEffectiveTab;
- (NSArray)effectiveLocations;
- (NSArray)locations;
- (_TtC5Files16DOCPickerContext)pickerContext;
- (_TtC5Files22DOCHierarchyController)init;
- (_TtC5Files22DOCHierarchyController)initWithConfiguration:(id)a3 sourceObserver:(id)a4 minParentLocations:(unint64_t)a5;
- (_TtP5Files30DOCHierarchyControllerDelegate_)delegate;
- (unint64_t)defaultTab;
- (unint64_t)effectiveTabSwitcherTab;
- (void)dealloc;
- (void)invalidateAllAssertions;
- (void)invalidateLocations;
- (void)loadAllParentsHiddenByEffectiveRootLocation:(id)a3;
- (void)performWhileForcingChangeInPreparationQueue:(id)a3;
- (void)performWhilePreventingLoading:(id)a3;
- (void)receiveInvalidateLocationsNotification;
- (void)removeTrailingLocationCount:(int64_t)a3 animated:(BOOL)a4;
- (void)reset;
- (void)resetFromRootWith:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)resetWith:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)resetWith:(id)a3 effectiveRootLocation:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)resetWithDefaultLocationWithAnimated:(BOOL)a3;
- (void)restoreLastBrowsedStateForTab:(unint64_t)a3;
- (void)revealLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDefaultTab:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsResetBeingPerformed:(BOOL)a3;
- (void)setLocations:(id)a3;
- (void)setPickerContext:(id)a3;
- (void)setShouldForceChangeInPreparationQueue:(BOOL)a3;
- (void)tagsDidChangeWithNotification:(id)a3;
@end

@implementation DOCHierarchyController

- (DOCConcreteLocation)lastLocation
{
  v2 = self;
  v3 = (void *)sub_10002C630();

  return (DOCConcreteLocation *)v3;
}

- (void)invalidateAllAssertions
{
  v2 = self;
  sub_1000562C0();
  dispatch thunk of DOCAssertionCollection.invalidateAll()();

  swift_release();
}

- (void)setDefaultTab:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_defaultTab) = (Class)a3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC5Files22DOCHierarchyController)initWithConfiguration:(id)a3 sourceObserver:(id)a4 minParentLocations:(unint64_t)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = self;
  id v10 = a3;
  id v11 = a4;
  id v12 = [v9 defaultManager];
  id v13 = [self sharedStore];
  id v14 = objc_allocWithZone(ObjectType);
  v15 = DOCHierarchyController.init(configuration:sourceObserver:minParentLocations:itemManager:userInterfaceStateStore:)(v10, v11, a5, v12, v13);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC5Files22DOCHierarchyController *)v15;
}

- (void)resetWithDefaultLocationWithAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_10006B658(v3);
}

- (NSArray)locations
{
  swift_beginAccess();
  sub_10009E6C4(0, (unint64_t *)&unk_1007085C0);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (DOCConcreteLocation)effectiveRootLocation
{
  NSArray v2 = self;
  BOOL v3 = (void *)sub_1000BB4AC();

  return (DOCConcreteLocation *)v3;
}

- (unint64_t)effectiveTabSwitcherTab
{
  NSArray v2 = self;
  BOOL v3 = (_TtC5Files22DOCHierarchyController *)sub_1002242A8();
  if (v3)
  {
    v4 = v3;
    unint64_t v5 = [(DOCHierarchyController *)v3 effectiveTabSwitcherTab];

    NSArray v2 = v4;
  }
  else
  {
    unint64_t v5 = *(unint64_t *)((char *)&v2->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_defaultTab);
  }

  return v5;
}

- (_TtP5Files30DOCHierarchyControllerDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP5Files30DOCHierarchyControllerDelegate_ *)Strong;
}

- (void)setLocations:(id)a3
{
  sub_10009E6C4(0, (unint64_t *)&unk_1007085C0);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v5 = self;
  DOCHierarchyController.locations.setter(v4);
}

- (NSArray)effectiveLocations
{
  NSArray v2 = self;
  sub_100225C60();

  sub_10009E6C4(0, (unint64_t *)&unk_1007085C0);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (unint64_t)defaultTab
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_defaultTab);
}

- (BOOL)hasPendingLocationChange
{
  uint64_t v3 = sub_1000CBE70((uint64_t *)&unk_10070B640);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_localOperation;
  swift_beginAccess();
  sub_1000CBC00((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_10070B640);
  uint64_t v7 = type metadata accessor for DOCHierarchyController.FetchingOperationToken(0);
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_1000CBBA4((uint64_t)v5, (uint64_t *)&unk_10070B640);
  return (char)v6;
}

- (DOCConcreteLocation)locationForDeterminingCurrentEffectiveTab
{
  NSArray v2 = self;
  uint64_t v3 = (void *)sub_1002242A8();

  return (DOCConcreteLocation *)v3;
}

- (BOOL)effectiveRootLocationIsHidingParentLocations
{
  NSArray v2 = self;
  char v3 = sub_100223B44();

  return v3 & 1;
}

- (void)loadAllParentsHiddenByEffectiveRootLocation:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100223CF8((uint64_t)sub_100180CF4, v5);

  swift_release();
}

- (BOOL)isResetBeingPerformed
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_isResetBeingPerformed);
}

- (void)setIsResetBeingPerformed:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_isResetBeingPerformed) = a3;
}

- (BOOL)isFetchingLocations
{
  NSArray v2 = self;
  char v3 = sub_100223924();

  return v3 & 1;
}

- (BOOL)isLoadingDisabled
{
  NSArray v2 = self;
  char v3 = sub_100226924();

  return v3 & 1;
}

- (void)performWhilePreventingLoading:(id)a3
{
  uint64_t v4 = (void (**)(void))_Block_copy(a3);
  type metadata accessor for DOCAssertion();
  swift_allocObject();
  uint64_t v5 = self;
  DOCAssertion.init(traceInfo:)();
  sub_1000562C0();
  dispatch thunk of DOCAssertionCollection.add(_:autoInvalidationTimeout:)();
  swift_release();
  v4[2](v4);
  dispatch thunk of DOCAssertion.invalidate()();
  swift_release();
  _Block_release(v4);
}

- (BOOL)shouldForceChangeInPreparationQueue
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_shouldForceChangeInPreparationQueue);
}

- (void)setShouldForceChangeInPreparationQueue:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_shouldForceChangeInPreparationQueue) = a3;
}

- (void)performWhileForcingChangeInPreparationQueue:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = OBJC_IVAR____TtC5Files22DOCHierarchyController_shouldForceChangeInPreparationQueue;
  char v6 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_shouldForceChangeInPreparationQueue);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_shouldForceChangeInPreparationQueue) = 1;
  uint64_t v7 = (void (*)(void *))v4[2];
  v8 = self;
  v7(v4);
  *((unsigned char *)&self->super.isa + v5) = v6;
  _Block_release(v4);
}

- (_TtC5Files16DOCPickerContext)pickerContext
{
  return (_TtC5Files16DOCPickerContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC5Files22DOCHierarchyController_pickerContext));
}

- (void)setPickerContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_pickerContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_pickerContext) = (Class)a3;
  id v3 = a3;
}

- (void)dealloc
{
  NSArray v2 = self;
  DOCHierarchyController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000CBBA4((uint64_t)self + OBJC_IVAR____TtC5Files22DOCHierarchyController__currentUpdateExpectation, (uint64_t *)&unk_10070B6C0);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files22DOCHierarchyController_effectiveRootLocationCandidate));
  sub_1000CBBA4((uint64_t)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_loadingDisabledOperation, (uint64_t *)&unk_10070B640);
  sub_1000CBBA4((uint64_t)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_localOperation, (uint64_t *)&unk_10070B640);
  sub_1000A7258(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Files22DOCHierarchyController_delayedLoadingBlock));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files22DOCHierarchyController_locationChangePreparationQueue));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files22DOCHierarchyController_lastVisitedLocationSavingQueue));
  swift_bridgeObjectRelease();

  swift_release();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_activeOrInflightAppend);
  id v4 = *(void **)&self->delegate[OBJC_IVAR____TtC5Files22DOCHierarchyController_activeOrInflightAppend];

  sub_100180FC8(v3, v4);
}

- (void)resetWith:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = (void (*)(void))sub_10023FB64;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = self;
  sub_1000BCD84(v10, a3, v5, 1, 0, v8, v9);
  sub_1000A7258((uint64_t)v8);
}

- (void)resetWith:(id)a3 effectiveRootLocation:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = (void (*)(void))_Block_copy(a6);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    id v10 = (void (*)(void))sub_10023FB64;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_1000BCD84(v12, a4, v6, 1, 0, v10, v11);
  sub_1000A7258((uint64_t)v10);
}

- (void)resetFromRootWith:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = (void (*)(void))sub_10023FB64;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  uint64_t v11 = self;
  sub_100228200(v10, a4, v8, v9);
  sub_1000A7258((uint64_t)v8);
}

- (void)revealLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = v8;
    v8 = (void (*)(void))sub_100110374;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  uint64_t v11 = self;
  sub_1002288CC(v10, v5, v8, v9);
  sub_1000A7258((uint64_t)v8);
}

- (void)reset
{
  NSArray v2 = self;
  sub_100229C68();
}

- (void)removeTrailingLocationCount:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v5 = self;
  sub_10023C8FC(a3);
}

- (_TtC5Files22DOCHierarchyController)init
{
  result = (_TtC5Files22DOCHierarchyController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)receiveInvalidateLocationsNotification
{
  id v3 = self;
  id v4 = self;
  [v3 cancelPreviousPerformRequestsWithTarget:v4 selector:"invalidateLocations" object:0];
  [(DOCHierarchyController *)v4 performSelector:"invalidateLocations" withObject:0 afterDelay:0.2];
}

- (void)invalidateLocations
{
  NSArray v2 = self;
  sub_10023486C();
}

- (void)restoreLastBrowsedStateForTab:(unint64_t)a3
{
  id v4 = self;
  DOCHierarchyController.restoreLastBrowsedState(forTab:)((void *)a3);
}

- (void)tagsDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_10023F058();
}

@end