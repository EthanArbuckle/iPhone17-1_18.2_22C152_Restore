@interface _UIRopeAnimation
- (_UIRopeAnimation)init;
- (void)addAnimation:(id)a3;
- (void)beginUsingSpringBehavior:(id)a3 completion:(id)a4;
- (void)invalidate;
@end

@implementation _UIRopeAnimation

- (_UIRopeAnimation)init
{
  return (_UIRopeAnimation *)sub_1858E93E0();
}

- (void)addAnimation:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_18557A3E8;
  *(void *)(v6 + 24) = v5;
  v7 = (void **)((char *)self + OBJC_IVAR____UIRopeAnimation__animations);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1853BFC18(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1853BFC18((void *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1853B59A0;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)beginUsingSpringBehavior:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_18544222C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1858E9874((uint64_t)v8, (uint64_t)v6, v7);
  sub_1854AFD40((uint64_t)v6);
}

- (void)invalidate
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____UIRopeAnimation__animations);
  swift_beginAccess();
  void *v2 = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end