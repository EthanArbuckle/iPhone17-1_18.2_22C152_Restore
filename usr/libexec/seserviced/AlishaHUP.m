@interface AlishaHUP
- (_TtC10seserviced9AlishaHUP)init;
- (void)pairingSession:(id)a3 completedWithResult:(unint64_t)a4;
- (void)pairingSession:(id)a3 requestedPairingWithDeviceAddress:(id)a4 forIntent:(unint64_t)a5 c192:(id)a6 r192:(id)a7 c256:(id)a8 r256:(id)a9;
@end

@implementation AlishaHUP

- (_TtC10seserviced9AlishaHUP)init
{
  return (_TtC10seserviced9AlishaHUP *)sub_10012B460();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC10seserviced9AlishaHUP_logger;
  uint64_t v3 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

- (void)pairingSession:(id)a3 requestedPairingWithDeviceAddress:(id)a4 forIntent:(unint64_t)a5 c192:(id)a6 r192:(id)a7 c256:(id)a8 r256:(id)a9
{
  id v39 = a3;
  id v14 = a4;
  v38 = self;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v35 = v20;
  uint64_t v36 = v19;

  if (v15)
  {
    uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v33 = v22;
    uint64_t v34 = v21;

    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v33 = 0xF000000000000000;
    uint64_t v34 = 0;
    if (v16)
    {
LABEL_3:
      uint64_t v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v31 = v24;
      uint64_t v32 = v23;

      if (v17) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v25 = 0;
      unint64_t v27 = 0xF000000000000000;
      if (v18) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  unint64_t v31 = 0xF000000000000000;
  uint64_t v32 = 0;
  if (!v17) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v25 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v27 = v26;

  if (v18)
  {
LABEL_5:
    uint64_t v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v30 = v29;

    goto LABEL_10;
  }
LABEL_9:
  uint64_t v28 = 0;
  unint64_t v30 = 0xF000000000000000;
LABEL_10:
  sub_10012F9D0(v39, v36, v35, (void *)a5, v34, v33, v32, v31, v25, v27, v28, v30);
  sub_100075868(v28, v30);
  sub_100075868(v25, v27);
  sub_100075868(v32, v31);
  sub_100075868(v34, v33);
  sub_10006D144(v36, v35);
}

- (void)pairingSession:(id)a3 completedWithResult:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_100130F34(v6, a4);
}

@end