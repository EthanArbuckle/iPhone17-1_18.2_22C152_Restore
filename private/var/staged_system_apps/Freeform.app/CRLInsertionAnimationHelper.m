@interface CRLInsertionAnimationHelper
+ (void)addChangeShapeAnimationsWithAnimateOutInfos:(id)a3 animateInInfos:(id)a4 interactiveCanvasController:(id)a5 completionHandler:(id)a6;
+ (void)addCommitDuplicateAnimationsWithCommittedBoardItem:(id)a3 committedConnectionLineLayout:(id)a4 interactiveCanvasController:(id)a5;
+ (void)addGhostDuplicatePreviewAnimationsWithGhostGroupItem:(id)a3 invisibleAnchorItem:(id)a4 ghostDuplicatedItem:(id)a5 ghostConnectionLineLayout:(id)a6 interactiveCanvasController:(id)a7;
+ (void)addInsertionAnimationsToInfo:(id)a3 connectionLineLayout:(id)a4 onInteractiveCanvasController:(id)a5;
+ (void)addInsertionAnimationsToInfo:(id)a3 onInteractiveCanvasController:(id)a4;
+ (void)addInsertionAnimationsToInfos:(id)a3 onInteractiveCanvasController:(id)a4;
- (_TtC8Freeform27CRLInsertionAnimationHelper)init;
@end

@implementation CRLInsertionAnimationHelper

+ (void)addInsertionAnimationsToInfo:(id)a3 onInteractiveCanvasController:(id)a4
{
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  id v6 = a4;
  sub_100858934((uint64_t)a3, v6);
  swift_unknownObjectRelease();
}

+ (void)addInsertionAnimationsToInfo:(id)a3 connectionLineLayout:(id)a4 onInteractiveCanvasController:(id)a5
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v9 = a4;
  id v10 = a5;
  sub_10085FDAC((uint64_t)a3, v9, v10, ObjCClassMetadata);
  swift_unknownObjectRelease();
}

+ (void)addInsertionAnimationsToInfos:(id)a3 onInteractiveCanvasController:(id)a4
{
  sub_1005057FC(&qword_101673060);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  id v7 = a4;
  id v8 = [v7 canvas];
  id v9 = (void *)swift_allocObject();
  v9[2] = v5;
  v9[3] = v7;
  v9[4] = 0;
  v9[5] = ObjCClassMetadata;
  v12[4] = sub_100861320;
  v12[5] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = *(void *)"";
  v12[2] = sub_100679958;
  v12[3] = &unk_101517430;
  id v10 = _Block_copy(v12);
  id v11 = v7;
  swift_bridgeObjectRetain();
  swift_release();
  [v8 afterLayoutIncludingLayers:1 performBlock:v10];
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

+ (void)addChangeShapeAnimationsWithAnimateOutInfos:(id)a3 animateInInfos:(id)a4 interactiveCanvasController:(id)a5 completionHandler:(id)a6
{
  id v7 = _Block_copy(a6);
  sub_1005057FC(&qword_101673060);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v7;
  id v11 = a5;
  id v12 = [v11 canvas];
  v13 = (void *)swift_allocObject();
  v13[2] = v8;
  v13[3] = v11;
  v13[4] = v9;
  v13[5] = sub_1005E2108;
  v13[6] = v10;
  v16[4] = sub_1008612C0;
  v16[5] = v13;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = *(void *)"";
  v16[2] = sub_100679958;
  v16[3] = &unk_1015173E0;
  v14 = _Block_copy(v16);
  id v15 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v12 afterLayoutIncludingLayers:1 performBlock:v14];
  _Block_release(v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)addGhostDuplicatePreviewAnimationsWithGhostGroupItem:(id)a3 invisibleAnchorItem:(id)a4 ghostDuplicatedItem:(id)a5 ghostConnectionLineLayout:(id)a6 interactiveCanvasController:(id)a7
{
  swift_getObjCClassMetadata();
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  sub_10085C8C4(v12, v13, v14, v15, v16);
}

+ (void)addCommitDuplicateAnimationsWithCommittedBoardItem:(id)a3 committedConnectionLineLayout:(id)a4 interactiveCanvasController:(id)a5
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 canvas];
  id v13 = (void *)swift_allocObject();
  v13[2] = v10;
  v13[3] = v11;
  v13[4] = v9;
  v13[5] = ObjCClassMetadata;
  v18[4] = sub_10086122C;
  v18[5] = v13;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = *(void *)"";
  v18[2] = sub_100679958;
  v18[3] = &unk_101517368;
  id v14 = _Block_copy(v18);
  id v15 = v9;
  id v16 = v10;
  id v17 = v11;
  swift_release();
  [v12 afterLayoutIncludingLayers:1 performBlock:v14];
  _Block_release(v14);
}

- (_TtC8Freeform27CRLInsertionAnimationHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLInsertionAnimationHelper();
  return [(CRLInsertionAnimationHelper *)&v3 init];
}

@end