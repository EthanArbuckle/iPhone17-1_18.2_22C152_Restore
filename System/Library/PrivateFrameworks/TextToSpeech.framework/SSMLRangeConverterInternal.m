@interface SSMLRangeConverterInternal
- (NSString)plainString;
- (NSString)ssml;
- (SSMLRangeConverterInternal)init;
- (SSMLRangeConverterInternal)initWithSSML:(id)a3;
- (_NSRange)stringRangeFrom:(_NSRange)a3;
- (void)setPlainString:(id)a3;
- (void)setSsml:(id)a3;
@end

@implementation SSMLRangeConverterInternal

- (NSString)ssml
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A6891FD0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setSsml:(id)a3
{
  uint64_t v4 = sub_1A6892000();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___SSMLRangeConverterInternal_ssml);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)plainString
{
  v2 = self;
  sub_1A67F428C();

  v3 = (void *)sub_1A6891FD0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)setPlainString:(id)a3
{
  uint64_t v4 = sub_1A6892000();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___SSMLRangeConverterInternal____lazy_storage___plainString);
  *uint64_t v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (SSMLRangeConverterInternal)initWithSSML:(id)a3
{
  uint64_t v4 = sub_1A6892000();
  uint64_t v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SSMLRangeConverterInternal____lazy_storage___plainString);
  *uint64_t v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSMLRangeConverterInternal____lazy_storage___converter) = 0;
  uint64_t v6 = (uint64_t *)((char *)self + OBJC_IVAR___SSMLRangeConverterInternal_ssml);
  *uint64_t v6 = v4;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SSMLRangeConverter();
  return [(SSMLRangeConverterInternal *)&v9 init];
}

- (_NSRange)stringRangeFrom:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = self;
  uint64_t v6 = sub_1A67F47A8(location, length);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (SSMLRangeConverterInternal)init
{
  _NSRange result = (SSMLRangeConverterInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end