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
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_natural);
}

- (unint64_t)leftToRight
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight);
}

- (unint64_t)rightToLeft
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft);
}

- (unint64_t)total
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_total);
}

- (unint64_t)significantValues
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_significantValues);
}

- (BOOL)hasStronglyTypedCounts
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_hasStronglyTypedCounts);
}

- (BOOL)isRTLEnough
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_isRTLEnough);
}

- (BOOL)isRTLMinimal
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_isRTLMinimal);
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
    sub_1E3E7DCA0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1E3D6E0BC((uint64_t)v8);

  sub_1E3C2AC28((uint64_t)v8);
  return v6;
}

+ (id)add:(id)a3 to:(id)a4
{
  v5 = (char *)a3;
  id v6 = a4;
  v7 = sub_1E3D6EB34(v5, (uint64_t)v6);

  return v7;
}

+ (AMPWritingDirectionsCounts)zero
{
  if (qword_1EAE24498 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBFDEEA8;

  return (AMPWritingDirectionsCounts *)v2;
}

- (NSString)description
{
  v2 = self;
  sub_1E3D6E4AC();

  v3 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (AMPWritingDirectionsCounts)init
{
  result = (AMPWritingDirectionsCounts *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end