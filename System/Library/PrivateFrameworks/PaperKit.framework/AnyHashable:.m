@interface AnyHashable:
- (uint64_t)Any;
@end

@implementation AnyHashable:

- (uint64_t)Any
{
  v6 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v7 = _Block_copy(aBlock);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v7 = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSItemProviderWriting?, @unowned NSError?) -> ();
    if (!ObjCClassMetadata) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = 0;
  if (ObjCClassMetadata) {
LABEL_3:
  }
    ObjCClassMetadata = swift_getObjCClassMetadata();
LABEL_4:
  if (a4) {
    a4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  v6(v7, v8, ObjCClassMetadata, a4);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed [NSAttributedStringKey : Any], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?((uint64_t)v7);
  return swift_release();
}

@end