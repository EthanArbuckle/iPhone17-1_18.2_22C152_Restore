@interface CSDAnalyticsReporter
+ (void)sendDualSIMRingtoneStateEvent:(BOOL)a3;
+ (void)sendManualLaunchAttemptEventWithActivitySession:(id)a3;
+ (void)sendManualLaunchNeededEventWithActivitySession:(id)a3;
+ (void)sendSessionServerTerminatedEventWithActivitySession:(id)a3 code:(unsigned int)a4;
- (CSDAnalyticsReporter)init;
- (void)reportingController:(id)a3 pickedRoute:(id)a4 updatedByAnyTriggerForCall:(id)a5;
- (void)reportingController:(id)a3 recordingEndedForSession:(id)a4;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
@end

@implementation CSDAnalyticsReporter

- (void)reportingController:(id)a3 recordingEndedForSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1003945E8((uint64_t)v8, v7);
}

+ (void)sendManualLaunchNeededEventWithActivitySession:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_1003948AC(v4);
}

+ (void)sendManualLaunchAttemptEventWithActivitySession:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_10039491C(v4);
}

+ (void)sendSessionServerTerminatedEventWithActivitySession:(id)a3 code:(unsigned int)a4
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  sub_100394B80(v6, a4);
}

+ (void)sendDualSIMRingtoneStateEvent:(BOOL)a3
{
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_100395378(v7, v8);
}

- (void)reportingController:(id)a3 pickedRoute:(id)a4 updatedByAnyTriggerForCall:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100395E1C((int)v11, v9, v10);
}

- (CSDAnalyticsReporter)init
{
  return (CSDAnalyticsReporter *)sub_100398B9C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end