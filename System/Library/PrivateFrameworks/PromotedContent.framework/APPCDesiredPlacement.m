@interface APPCDesiredPlacement
- (APPCDesiredPlacement)init;
- (APPCDesiredPlacement)initWithType:(int64_t)a3 count:(int64_t)a4;
- (int64_t)count;
- (int64_t)type;
@end

@implementation APPCDesiredPlacement

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCDesiredPlacement_type);
}

- (int64_t)count
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCDesiredPlacement_count);
}

- (APPCDesiredPlacement)initWithType:(int64_t)a3 count:(int64_t)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCDesiredPlacement_type) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCDesiredPlacement_count) = (Class)a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DesiredPlacement();
  return [(APPCDesiredPlacement *)&v5 init];
}

- (APPCDesiredPlacement)init
{
  result = (APPCDesiredPlacement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end