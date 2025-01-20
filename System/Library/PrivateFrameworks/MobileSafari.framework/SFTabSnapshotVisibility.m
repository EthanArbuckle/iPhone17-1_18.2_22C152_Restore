@interface SFTabSnapshotVisibility
- (SFTabSnapshotVisibility)init;
- (SFTabSnapshotVisibility)initWithPriority:(double)a3 tier:(unint64_t)a4;
- (double)priority;
- (unint64_t)tier;
- (void)setPriority:(double)a3;
- (void)setTier:(unint64_t)a3;
@end

@implementation SFTabSnapshotVisibility

- (SFTabSnapshotVisibility)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotVisibility_wrapped);
  void *v2 = 0;
  v2[1] = 1;
  v4.receiver = self;
  v4.super_class = (Class)SFTabSnapshotVisibility;
  return [(SFTabSnapshotVisibility *)&v4 init];
}

- (SFTabSnapshotVisibility)initWithPriority:(double)a3 tier:(unint64_t)a4
{
  objc_super v4 = (char *)self + OBJC_IVAR___SFTabSnapshotVisibility_wrapped;
  *(double *)objc_super v4 = a3;
  *((void *)v4 + 1) = a4;
  v6.receiver = self;
  v6.super_class = (Class)SFTabSnapshotVisibility;
  return [(SFTabSnapshotVisibility *)&v6 init];
}

- (double)priority
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotVisibility_wrapped);
}

- (void)setPriority:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotVisibility_wrapped) = a3;
}

- (unint64_t)tier
{
  return *(void *)&self->wrapped[OBJC_IVAR___SFTabSnapshotVisibility_wrapped];
}

- (void)setTier:(unint64_t)a3
{
  *(void *)&self->wrapped[OBJC_IVAR___SFTabSnapshotVisibility_wrapped] = a3;
}

@end