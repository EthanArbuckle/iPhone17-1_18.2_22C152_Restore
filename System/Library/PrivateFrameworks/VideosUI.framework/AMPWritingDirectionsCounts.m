@interface AMPWritingDirectionsCounts
+ (AMPWritingDirectionsCounts)zero;
+ (id)add:(id)a3 to:(id)a4;
- (AMPWritingDirectionsCounts)init;
- (AMPWritingDirectionsCounts)initWithNatural:(unint64_t)a3 leftToRight:(unint64_t)a4 rightToLeft:(unint64_t)a5;
- (BOOL)hasStronglyTypedCounts;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRTLEnough;
- (BOOL)isRTLMinimal;
- (NSString)description;
- (unint64_t)leftToRight;
- (unint64_t)natural;
- (unint64_t)rightToLeft;
- (unint64_t)significantValues;
- (unint64_t)total;
@end

@implementation AMPWritingDirectionsCounts

- (unint64_t)natural
{
  return WritingDirectionsCounts.natural.getter();
}

- (unint64_t)leftToRight
{
  return WritingDirectionsCounts.leftToRight.getter();
}

- (unint64_t)rightToLeft
{
  return WritingDirectionsCounts.rightToLeft.getter();
}

- (unint64_t)total
{
  return WritingDirectionsCounts.total.getter();
}

- (unint64_t)significantValues
{
  return WritingDirectionsCounts.significantValues.getter();
}

- (BOOL)hasStronglyTypedCounts
{
  return WritingDirectionsCounts.hasStronglyTypedCounts.getter() & 1;
}

- (BOOL)isRTLEnough
{
  return WritingDirectionsCounts.isRTLEnough.getter() & 1;
}

- (BOOL)isRTLMinimal
{
  return WritingDirectionsCounts.isRTLMinimal.getter() & 1;
}

- (AMPWritingDirectionsCounts)initWithNatural:(unint64_t)a3 leftToRight:(unint64_t)a4 rightToLeft:(unint64_t)a5
{
  return (AMPWritingDirectionsCounts *)WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)((char *)a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1E387DB08();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = WritingDirectionsCounts.isEqual(_:)((uint64_t)v8);

  sub_1E2C324CC((uint64_t)v8);
  return v6;
}

+ (id)add:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)static WritingDirectionsCounts.add(_:_:)(v5, v6);

  return v7;
}

+ (AMPWritingDirectionsCounts)zero
{
  id v2 = static WritingDirectionsCounts.zero.getter();
  return (AMPWritingDirectionsCounts *)v2;
}

- (NSString)description
{
  id v2 = self;
  WritingDirectionsCounts.description.getter();

  v3 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (AMPWritingDirectionsCounts)init
{
}

@end