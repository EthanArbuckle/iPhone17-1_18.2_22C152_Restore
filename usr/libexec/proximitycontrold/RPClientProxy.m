@interface RPClientProxy
- (OS_dispatch_queue)dispatchQueue;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation RPClientProxy

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)*(id *)&self->dispatchQueue[4];
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = *(id *)&self->dispatchQueue[4];
  *(void *)&self->dispatchQueue[4] = a3;
  id v3 = a3;
}

- (id)invalidationHandler
{
  if (*(void *)&self->invalidationHandler[4])
  {
    uint64_t v2 = *(void *)&self->invalidationHandler[12];
    v5[4] = *(void *)&self->invalidationHandler[4];
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_10007A0AC;
    v5[3] = &unk_10032E710;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setInvalidationHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1000D5AD0;
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = *(void *)&self->invalidationHandler[4];
  *(void *)&self->invalidationHandler[4] = v6;
  *(void *)&self->invalidationHandler[12] = v4;
  swift_retain();
  sub_10000F088(v7);

  swift_release();
}

- (id)interruptionHandler
{
  if (*(void *)&self->interruptionHandler[4])
  {
    uint64_t v2 = *(void *)&self->interruptionHandler[12];
    v5[4] = *(void *)&self->interruptionHandler[4];
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_10007A0AC;
    v5[3] = &unk_10032E6C0;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setInterruptionHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1000D56D0;
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = *(void *)&self->interruptionHandler[4];
  *(void *)&self->interruptionHandler[4] = v6;
  *(void *)&self->interruptionHandler[12] = v4;
  swift_retain();
  sub_10000F088(v7);

  swift_release();
}

- (void)activateWithCompletion:(id)a3
{
  id v3 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v3;
  swift_retain();
  sub_1001A9FF8((void (*)(void))sub_10004C9CC);
  swift_release();

  swift_release();
}

- (void)invalidate
{
  swift_retain();
  sub_1001AA51C();

  swift_release();
}

@end