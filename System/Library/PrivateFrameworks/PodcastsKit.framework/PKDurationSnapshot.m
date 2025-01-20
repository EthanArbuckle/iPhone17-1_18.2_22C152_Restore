@interface PKDurationSnapshot
- (PKDurationSnapshot)init;
- (PKDurationSnapshot)initWithSnapshotTime:(double)a3 rate:(float)a4 elapsedDuration:(double)a5 duration:(double)a6;
- (double)duration;
- (double)elapsedDuration;
- (double)snapshotTime;
- (float)rate;
@end

@implementation PKDurationSnapshot

- (double)snapshotTime
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PKDurationSnapshot_snapshotTime);
}

- (float)rate
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___PKDurationSnapshot_rate);
}

- (double)elapsedDuration
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PKDurationSnapshot_elapsedDuration);
}

- (double)duration
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PKDurationSnapshot_duration);
}

- (PKDurationSnapshot)initWithSnapshotTime:(double)a3 rate:(float)a4 elapsedDuration:(double)a5 duration:(double)a6
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___PKDurationSnapshot_snapshotTime) = a3;
  *(float *)((char *)&self->super.isa + OBJC_IVAR___PKDurationSnapshot_rate) = a4;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___PKDurationSnapshot_elapsedDuration) = a5;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___PKDurationSnapshot_duration) = a6;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DurationSnapshot();
  return [(PKDurationSnapshot *)&v7 init];
}

- (PKDurationSnapshot)init
{
  result = (PKDurationSnapshot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end