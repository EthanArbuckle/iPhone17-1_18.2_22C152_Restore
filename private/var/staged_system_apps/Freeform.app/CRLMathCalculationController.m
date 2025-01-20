@interface CRLMathCalculationController
+ (NSString)mathHintsModeChangedNotificationName;
+ (NSString)mathHintsSuspensionStatusChangedNotificationName;
- (BOOL)isSolvingSuspended;
- (NSDictionary)expressionStrokeGroups;
- (NSDictionary)pkExpressions;
- (OS_dispatch_queue)expressionStrokeGroupsQueue;
- (OS_dispatch_queue)pkExpressionsQueue;
- (_TtC8Freeform28CRLMathCalculationController)init;
- (id)getPKExpressionFor:(id)a3;
- (id)getStrokeGroupFor:(id)a3;
- (id)resultForExpressionWithUUID:(id)a3 locale:(id)a4;
- (int64_t)pkMathRecognitionViewControllerSolvingStyle;
- (uint64_t)mathHintsMode;
- (void)dealloc;
- (void)insertPKExpressionWithPkExpression:(id)a3;
- (void)removePKExpressionWithPkExpressionId:(id)a3;
- (void)removeStrokeGroupWithPkExpressionId:(id)a3;
- (void)resumeSolving;
- (void)setExpressionStrokeGroups:(id)a3;
- (void)setMathHintsMode:(int64_t)a3;
- (void)setPkExpressions:(id)a3;
- (void)suspendSolving;
- (void)updateCalculateDocument;
- (void)updateSingleDrawingSortIndexForFor:(id)a3 to:(double)a4;
- (void)updateStrokeGroupFor:(id)a3 strokeGroupId:(id)a4;
@end

@implementation CRLMathCalculationController

- (NSDictionary)pkExpressions
{
  return (NSDictionary *)sub_100951D8C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_pkExpressions, (unint64_t *)&unk_101684348);
}

- (void)setPkExpressions:(id)a3
{
}

- (OS_dispatch_queue)pkExpressionsQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_pkExpressionsQueue));
}

- (NSDictionary)expressionStrokeGroups
{
  return (NSDictionary *)sub_100951D8C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_expressionStrokeGroups, (unint64_t *)&qword_101684330);
}

- (void)setExpressionStrokeGroups:(id)a3
{
}

- (OS_dispatch_queue)expressionStrokeGroupsQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_expressionStrokeGroupsQueue));
}

+ (NSString)mathHintsModeChangedNotificationName
{
  return (NSString *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F568, (void **)&static CRLMathCalculationController.mathHintsModeChangedNotificationName);
}

+ (NSString)mathHintsSuspensionStatusChangedNotificationName
{
  return (NSString *)sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F570, (void **)&static CRLMathCalculationController.mathHintsSuspensionStatusChangedNotificationName);
}

- (_TtC8Freeform28CRLMathCalculationController)init
{
  return (_TtC8Freeform28CRLMathCalculationController *)sub_100952110();
}

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_mathHintsUserDefaultsObserver);
  v4 = self;
  if (v3)
  {
    id v5 = v3;
    dispatch thunk of NSKeyValueObservation.invalidate()();
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLMathCalculationController();
  [(CRLMathCalculationController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_pkExpressionsQueue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_expressionStrokeGroupsQueue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_mathHintsUserDefaultsObserver);
}

- (void)updateSingleDrawingSortIndexForFor:(id)a3 to:(double)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = self;
  sub_100952EA8((unint64_t)v10, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)updateCalculateDocument
{
  v2 = self;
  sub_1009532A4();
}

- (id)resultForExpressionWithUUID:(id)a3 locale:(id)a4
{
  uint64_t v5 = type metadata accessor for Locale();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = self;
  CRLMathCalculationController.resultForExpressionWithUUID(_:locale:)((uint64_t)v14, (uint64_t)v9);
  uint64_t v17 = v16;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  if (v17)
  {
    NSString v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v18 = 0;
  }

  return v18;
}

- (void)setMathHintsMode:(int64_t)a3
{
}

- (int64_t)pkMathRecognitionViewControllerSolvingStyle
{
  v2 = self;
  unint64_t v3 = -[CRLMathCalculationController mathHintsMode]_0();
  if (v3 >= 3)
  {
    int64_t result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
    __break(1u);
  }
  else
  {
    int64_t v4 = 2 - v3;

    return v4;
  }
  return result;
}

- (BOOL)isSolvingSuspended
{
  return *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLMathCalculationController_suspendCount) > 0;
}

- (void)suspendSolving
{
  v2 = self;
  sub_100954634(1);
}

- (void)resumeSolving
{
  v2 = self;
  sub_100954634(0);
}

- (void)insertPKExpressionWithPkExpression:(id)a3
{
  id v5 = a3;
  int64_t v4 = self;
  sub_100954818(v5);
}

- (void)removePKExpressionWithPkExpressionId:(id)a3
{
}

- (id)getPKExpressionFor:(id)a3
{
  return sub_1009551B4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_100954C78);
}

- (id)getStrokeGroupFor:(id)a3
{
  return sub_1009551B4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_100954EC0);
}

- (void)updateStrokeGroupFor:(id)a3 strokeGroupId:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  uint64_t v12 = self;
  sub_1009552BC((uint64_t)v10, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)removeStrokeGroupWithPkExpressionId:(id)a3
{
}

- (uint64_t)mathHintsMode
{
  uint64_t v7 = &type metadata for CRLPencilAndPaperFeatureFlags;
  unint64_t v8 = sub_1005C5D40();
  v6[0] = 0;
  char v0 = isFeatureEnabled(_:)();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v6);
  if ((v0 & 1) == 0) {
    return 0;
  }
  uint64_t v7 = &type metadata for CRLFeatureFlags;
  unint64_t v8 = sub_1005396A8();
  v6[0] = 15;
  char v1 = isFeatureEnabled(_:)();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v6);
  if ((v1 & 1) == 0) {
    return 0;
  }
  if (qword_10166F928 != -1) {
    swift_once();
  }
  v2 = (unsigned char *)(qword_101692F10
               + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed);
  swift_beginAccess();
  uint64_t result = 0;
  if (*v2 == 1)
  {
    id v4 = [self standardUserDefaults];
    id v5 = [v4 integerForKey:@"CRLMathRecognitionMode"];

    if (v5 == (id)2) {
      return 2;
    }
    else {
      return v5 == (id)1;
    }
  }
  return result;
}

@end