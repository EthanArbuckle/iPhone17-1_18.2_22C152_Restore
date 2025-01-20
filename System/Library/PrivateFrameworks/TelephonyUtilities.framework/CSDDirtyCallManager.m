@interface CSDDirtyCallManager
- (CSDDirtyCallManager)init;
- (id)callChanged;
- (void)add:(id)a3;
- (void)setCallChanged:(id)a3;
@end

@implementation CSDDirtyCallManager

- (id)callChanged
{
  uint64_t v2 = sub_10026BA8C();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_10027D68C;
    v6[3] = &unk_10050F598;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCallChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10026C870;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_10026BB74((uint64_t)v4, v5);
}

- (void)add:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10026BCA4(v4);
}

- (CSDDirtyCallManager)init
{
}

- (void).cxx_destruct
{
  sub_100208490(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDDirtyCallManager_callChanged));

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end