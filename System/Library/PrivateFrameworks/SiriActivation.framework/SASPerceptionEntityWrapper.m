@interface SASPerceptionEntityWrapper
- (SASPerceptionEntityWrapper)init;
- (void)userEngagementStatusWith:(id)a3;
@end

@implementation SASPerceptionEntityWrapper

- (SASPerceptionEntityWrapper)init
{
  type metadata accessor for PerceptionModelImpl();
  uint64_t v2 = swift_allocObject();
  v3 = (objc_class *)type metadata accessor for PerceptionEntityWrapper();
  v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR___SASPerceptionEntityWrapper_model] = v2;
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = [(SASPerceptionEntityWrapper *)&v7 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)userEngagementStatusWith:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *, void))v4[2];
  v6 = self;
  v5(v4, 0);
  _Block_release(v4);
}

- (void).cxx_destruct
{
}

@end