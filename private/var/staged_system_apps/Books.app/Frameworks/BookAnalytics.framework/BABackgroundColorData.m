@interface BABackgroundColorData
- (BABackgroundColorData)init;
- (BABackgroundColorData)initWithBackgroundColor:(int64_t)a3;
@end

@implementation BABackgroundColorData

- (BABackgroundColorData)initWithBackgroundColor:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BABackgroundColorData_backgroundColor) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BridgedBackgroundColorData();
  return [(BABackgroundColorData *)&v4 init];
}

- (BABackgroundColorData)init
{
  result = (BABackgroundColorData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end