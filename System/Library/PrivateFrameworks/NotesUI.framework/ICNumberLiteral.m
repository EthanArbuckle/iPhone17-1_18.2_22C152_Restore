@interface ICNumberLiteral
- (BOOL)isEqual:(id)a3;
- (ICNumberLiteral)init;
- (ICNumberLiteral)initWithRange:(_NSRange)a3 string:(id)a4;
- (NSString)string;
- (_NSRange)range;
- (void)setRange:(_NSRange)a3;
- (void)setString:(id)a3;
@end

@implementation ICNumberLiteral

- (_NSRange)range
{
  v2 = (NSUInteger *)((char *)self + OBJC_IVAR___ICNumberLiteral_range);
  swift_beginAccess();
  NSUInteger v3 = *v2;
  NSUInteger v4 = v2[1];
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = (NSUInteger *)((char *)self + OBJC_IVAR___ICNumberLiteral_range);
  swift_beginAccess();
  NSUInteger *v5 = location;
  v5[1] = length;
}

- (NSString)string
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B0B823CC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setString:(id)a3
{
  uint64_t v4 = sub_1B0B8240C();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___ICNumberLiteral_string);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (ICNumberLiteral)initWithRange:(_NSRange)a3 string:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = sub_1B0B8240C();
  v8 = (NSUInteger *)((char *)self + OBJC_IVAR___ICNumberLiteral_range);
  NSUInteger *v8 = location;
  v8[1] = length;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___ICNumberLiteral_string);
  uint64_t *v9 = v7;
  v9[1] = v10;
  v12.receiver = self;
  v12.super_class = (Class)ICNumberLiteral;
  return [(ICNumberLiteral *)&v12 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1B0B82E0C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = ICNumberLiteral.isEqual(_:)((uint64_t)v8);

  sub_1B0A4BA04((uint64_t)v8);
  return v6 & 1;
}

- (ICNumberLiteral)init
{
  _NSRange result = (ICNumberLiteral *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end