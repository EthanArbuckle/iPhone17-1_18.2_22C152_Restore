@interface WFRunnerConnection
- (WFRunnerConnection)init;
- (WFRunnerConnection)initWithRunDescriptor:(id)a3 host:(id)a4 onInterruption:(id)a5 onInvalidation:(id)a6;
- (id)asyncRunnerWithReason:(id)a3 error:(id *)a4;
- (id)onInterruption;
- (id)onInvalidation;
- (id)syncRunnerWithReason:(id)a3 error:(id *)a4;
- (int64_t)targetType;
- (void)invalidate;
- (void)setOnInterruption:(id)a3;
- (void)setOnInvalidation:(id)a3;
@end

@implementation WFRunnerConnection

- (int64_t)targetType
{
  return sub_1B3C766A4();
}

- (id)onInterruption
{
  return sub_1B3C769D0((uint64_t)self, (uint64_t)a2, RunnerConnection.onInterruption.getter, (uint64_t)&block_descriptor_28);
}

- (void)setOnInterruption:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1B3C78F80;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  RunnerConnection.onInterruption.setter((uint64_t)v4, v5);
}

- (id)onInvalidation
{
  return sub_1B3C769D0((uint64_t)self, (uint64_t)a2, RunnerConnection.onInvalidation.getter, (uint64_t)&block_descriptor);
}

- (void)setOnInvalidation:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1B3C78F80;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  RunnerConnection.onInvalidation.setter((uint64_t)v4, v5);
}

- (WFRunnerConnection)initWithRunDescriptor:(id)a3 host:(id)a4 onInterruption:(id)a5 onInvalidation:(id)a6
{
  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  id v13 = a3;
  swift_unknownObjectRetain();
  return (WFRunnerConnection *)RunnerConnection.init(runDescriptor:host:onInterruption:onInvalidation:)(a3, (uint64_t)a4, (uint64_t)sub_1B3C78BDC, v11, (uint64_t)sub_1B3C78F80, v12);
}

- (id)asyncRunnerWithReason:(id)a3 error:(id *)a4
{
  return sub_1B3C774B8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))RunnerConnection.asyncRunner(reason:));
}

- (id)syncRunnerWithReason:(id)a3 error:(id *)a4
{
  return sub_1B3C774B8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))RunnerConnection.syncRunner(reason:));
}

- (void)invalidate
{
  v2 = self;
  RunnerConnection.invalidate()();
}

- (WFRunnerConnection)init
{
}

- (void).cxx_destruct
{
  sub_1B3C78C04((uint64_t)self + OBJC_IVAR___WFRunnerConnection_host);
  sub_1B3C76F7C(*(id *)((char *)&self->super.isa + OBJC_IVAR___WFRunnerConnection_connection), self->policy[OBJC_IVAR___WFRunnerConnection_connection]);
  sub_1B3C767E8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFRunnerConnection_onInterruption));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFRunnerConnection_onInvalidation);
  sub_1B3C767E8(v3);
}

@end