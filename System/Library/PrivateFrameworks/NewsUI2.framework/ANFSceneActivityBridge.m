@interface ANFSceneActivityBridge
- (void)performOnSceneDidDisconnect:(id)a3;
@end

@implementation ANFSceneActivityBridge

- (void)performOnSceneDidDisconnect:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1DEABEEC8;
  *(void *)(v6 + 24) = v5;
  sceneDidDisconnectObserverBlocks = self->sceneDidDisconnectObserverBlocks;
  swift_beginAccess();
  v8 = *(void **)self->sceneDidDisconnectObserverBlocks;
  swift_retain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)self->sceneDidDisconnectObserverBlocks = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1DEE1741C(0, v8[2] + 1, 1, v8);
    *(void *)sceneDidDisconnectObserverBlocks = v8;
  }
  unint64_t v11 = v8[2];
  unint64_t v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    v8 = sub_1DEE1741C((void *)(v10 > 1), v11 + 1, 1, v8);
    *(void *)sceneDidDisconnectObserverBlocks = v8;
  }
  v8[2] = v11 + 1;
  v12 = &v8[2 * v11];
  v12[4] = sub_1DED9E9F0;
  v12[5] = v6;
  swift_endAccess();
  swift_release();
  swift_release();
}

@end