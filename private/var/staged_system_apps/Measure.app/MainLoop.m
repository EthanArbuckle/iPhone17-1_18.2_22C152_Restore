@interface MainLoop
- (BOOL)sessionShouldAttemptRelocalization:(id)a3;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
- (void)session:(id)a3 didAddAnchors:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didRemoveAnchors:(id)a4;
- (void)session:(id)a3 didUpdateAnchors:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
@end

@implementation MainLoop

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_100102B48((unint64_t)v8);
}

- (void)sessionWasInterrupted:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100102DB0();
}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100102FA8();
}

- (BOOL)sessionShouldAttemptRelocalization:(id)a3
{
  uint64_t v3 = *(void *)((char *)self + qword_1004CAFC0);
  if (*(unsigned char *)(v3 + 24) != 1) {
    return byte_1004F8518;
  }
  BOOL result = 0;
  *(unsigned char *)(v3 + 24) = 0;
  return result;
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100100FAC(v6);
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10010177C(v6, v7);
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  sub_10001C99C(0, &qword_1004CB290);
  id v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  v9._rawValue = v6;
  sub_1001030C0(v7, v9);

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  sub_10001C99C(0, &qword_1004CB290);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  MeasureCore.shared.unsafeMutableAddressor();
  swift_retain();
  MeasureCore.didRemove(anchors:)((Swift::OpaquePointer)v6);
  swift_release();
  type metadata accessor for WorldAnchor();
  static WorldAnchor.didRemove(anchors:)();

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  sub_10001C99C(0, &qword_1004CB290);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_1001032B0(v6);

  swift_bridgeObjectRelease();
}

@end