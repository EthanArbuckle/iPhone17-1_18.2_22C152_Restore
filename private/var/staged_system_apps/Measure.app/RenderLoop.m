@interface RenderLoop
- (id)renderer:(id)a3 nodeForAnchor:(id)a4;
- (void)renderer:(id)a3 didAddNode:(id)a4 forAnchor:(id)a5;
- (void)renderer:(id)a3 didRemoveNode:(id)a4 forAnchor:(id)a5;
- (void)renderer:(id)a3 didUpdateNode:(id)a4 forAnchor:(id)a5;
- (void)renderer:(id)a3 updateAtTime:(double)a4;
@end

@implementation RenderLoop

- (void)renderer:(id)a3 updateAtTime:(double)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  sub_1001957D8((uint64_t)a3, a4);
  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didAddNode:(id)a4 forAnchor:(id)a5
{
}

- (id)renderer:(id)a3 nodeForAnchor:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  self;
  uint64_t v10 = swift_dynamicCastObjCClass();
  if (v10)
  {
    v11 = (void *)v10;
    id v12 = objc_allocWithZone((Class)SCNNode);
    id v13 = a4;
    swift_unknownObjectRetain();
    v14 = self;
    id v15 = [v12 init];
    strcpy((char *)v23, "arkit_plane_");
    BYTE5(v23[1]) = 0;
    HIWORD(v23[1]) = -5120;
    id v16 = [v11 identifier:v23[0] v23[1]];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v17 = UUID.uuidString.getter();
    v19 = v18;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v20._countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v15 setName:v21];
    swift_unknownObjectRelease();
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)renderer:(id)a3 didUpdateNode:(id)a4 forAnchor:(id)a5
{
}

- (void)renderer:(id)a3 didRemoveNode:(id)a4 forAnchor:(id)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = self;
  sub_100196D84(v9);
  swift_unknownObjectRelease();
}

@end