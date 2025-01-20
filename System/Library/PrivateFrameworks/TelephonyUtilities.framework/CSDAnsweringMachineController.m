@interface CSDAnsweringMachineController
- (BOOL)hasCustomGreetingFor:(id)a3;
- (BOOL)isAvailable;
- (CSDAnsweringMachineController)init;
- (CSDAnsweringMachineController)initWith:(id)a3 speechAssetManager:(id)a4;
- (NSURL)defaultGreeting;
- (id)customGreetingFor:(id)a3;
- (int64_t)liveVoicemailUnavailableReason;
- (void)answeringMachine:(id)a3 didFinishAnnouncement:(BOOL)a4 error:(id)a5;
- (void)answeringMachine:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)captionsClient:(id)a3 didDetectGibberish:(BOOL)a4;
- (void)captionsClient:(id)a3 didDisableCaptions:(BOOL)a4 error:(id)a5;
- (void)captionsClient:(id)a3 didEnableCaptions:(BOOL)a4 error:(id)a5;
- (void)captionsClient:(id)a3 didStartCaptioningWithReason:(unsigned __int8)a4;
- (void)captionsClient:(id)a3 didStopCaptioningWithReason:(unsigned __int8)a4;
- (void)captionsClient:(id)a3 didUpdateCaptions:(id)a4 source:(int)a5;
- (void)captionsServerDidDie:(id)a3;
- (void)deleteCustomGreetingFor:(id)a3;
- (void)saveCustomGreeting:(id)a3 for:(id)a4;
- (void)serverDidDisconnectForAnsweringMachine:(id)a3;
@end

@implementation CSDAnsweringMachineController

- (BOOL)isAvailable
{
  v2 = self;
  char v3 = sub_10026217C();

  return v3 & 1;
}

- (int64_t)liveVoicemailUnavailableReason
{
  v2 = self;
  int64_t v3 = sub_1002621E0();

  return v3;
}

- (CSDAnsweringMachineController)initWith:(id)a3 speechAssetManager:(id)a4
{
  return (CSDAnsweringMachineController *)sub_100263D08(a3, a4);
}

- (void)saveCustomGreeting:(id)a3 for:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = self;
  sub_100264828();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)deleteCustomGreetingFor:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1002649F0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)customGreetingFor:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1001F081C(&qword_1005878F0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = self;
  sub_100264B04();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v14 = 0;
  if (sub_1001F758C((uint64_t)v10, 1, v12) != 1)
  {
    URL._bridgeToObjectiveC()(v13);
    uint64_t v14 = v15;
    (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v10, v12);
  }

  return v14;
}

- (NSURL)defaultGreeting
{
  uint64_t v3 = sub_1001F081C(&qword_1005878F0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  sub_100264DDC();

  uint64_t v7 = type metadata accessor for URL();
  uint64_t v9 = 0;
  if (sub_1001F758C((uint64_t)v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v8);
    uint64_t v9 = v10;
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }

  return (NSURL *)v9;
}

- (BOOL)hasCustomGreetingFor:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  char v5 = sub_100264E08();

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (CSDAnsweringMachineController)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();

  swift_release();
}

- (void)answeringMachine:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = a5;
  sub_100264F9C();
}

- (void)answeringMachine:(id)a3 didFinishAnnouncement:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = a5;
  sub_100268724();
}

- (void)serverDidDisconnectForAnsweringMachine:(id)a3
{
  id v4 = a3;
  char v5 = self;
  sub_100268FF4();
}

- (void)captionsClient:(id)a3 didEnableCaptions:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = a5;
  sub_1002692EC();
}

- (void)captionsClient:(id)a3 didDisableCaptions:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = a5;
  sub_1002692EC();
}

- (void)captionsClient:(id)a3 didStartCaptioningWithReason:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100269914();
}

- (void)captionsClient:(id)a3 didStopCaptioningWithReason:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100269914();
}

- (void)captionsClient:(id)a3 didDetectGibberish:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100269DD4();
}

- (void)captionsClient:(id)a3 didUpdateCaptions:(id)a4 source:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_10026A0CC();
}

- (void)captionsServerDidDie:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10026A85C();
}

@end