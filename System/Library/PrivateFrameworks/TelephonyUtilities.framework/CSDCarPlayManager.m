@interface CSDCarPlayManager
- (BOOL)isCarPlayConnected;
- (CSDCarPlayManager)init;
- (id)carPlayScreenConnectionChanged;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setCarPlayScreenConnectionChanged:(id)a3;
@end

@implementation CSDCarPlayManager

- (id)carPlayScreenConnectionChanged
{
  uint64_t v2 = sub_100209D68();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_100209DA8;
    v6[3] = &unk_10050C9E8;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCarPlayScreenConnectionChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10020A794;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_100209EA4((uint64_t)v4, v5);
}

- (BOOL)isCarPlayConnected
{
  uint64_t v2 = self;
  BOOL v3 = sub_100209EF8();

  return v3;
}

- (CSDCarPlayManager)init
{
  return (CSDCarPlayManager *)sub_100209F48();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDCarPlayManager_carPlayScreenConnectionChanged);

  sub_100208490(v3);
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10020A58C((uint64_t)v5, 1);
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10020A58C((uint64_t)v5, 0);
}

@end