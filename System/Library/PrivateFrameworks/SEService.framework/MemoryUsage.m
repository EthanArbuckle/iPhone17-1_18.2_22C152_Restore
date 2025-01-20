@interface MemoryUsage
+ (BOOL)supportsSecureCoding;
+ (_TtC9SEService11MemoryUsage)empty;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC9SEService11MemoryUsage)init;
- (_TtC9SEService11MemoryUsage)initWithCoder:(id)a3;
- (_TtC9SEService11MemoryUsage)initWithPHeap:(int64_t)a3 cor:(int64_t)a4 cod:(int64_t)a5 usedIndices:(int64_t)a6;
- (int64_t)cod;
- (int64_t)cor;
- (int64_t)pHeap;
- (int64_t)usedIndices;
- (void)encodeWithCoder:(id)a3;
- (void)setCod:(int64_t)a3;
- (void)setCor:(int64_t)a3;
- (void)setPHeap:(int64_t)a3;
- (void)setUsedIndices:(int64_t)a3;
@end

@implementation MemoryUsage

- (_TtC9SEService11MemoryUsage)initWithPHeap:(int64_t)a3 cor:(int64_t)a4 cod:(int64_t)a5 usedIndices:(int64_t)a6
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11MemoryUsage_pHeap) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11MemoryUsage_cor) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11MemoryUsage_cod) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11MemoryUsage_usedIndices) = (Class)a6;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MemoryUsage();
  return [(MemoryUsage *)&v7 init];
}

+ (_TtC9SEService11MemoryUsage)empty
{
  v2 = (objc_class *)type metadata accessor for MemoryUsage();
  v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC9SEService11MemoryUsage_pHeap] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9SEService11MemoryUsage_cor] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9SEService11MemoryUsage_cod] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9SEService11MemoryUsage_usedIndices] = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  return (_TtC9SEService11MemoryUsage *)v4;
}

- (int64_t)pHeap
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_pHeap);
  swift_beginAccess();
  return *v2;
}

- (void)setPHeap:(int64_t)a3
{
  id v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_pHeap);
  swift_beginAccess();
  *id v4 = a3;
}

- (int64_t)cor
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_cor);
  swift_beginAccess();
  return *v2;
}

- (void)setCor:(int64_t)a3
{
  id v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_cor);
  swift_beginAccess();
  *id v4 = a3;
}

- (int64_t)cod
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_cod);
  swift_beginAccess();
  return *v2;
}

- (void)setCod:(int64_t)a3
{
  id v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_cod);
  swift_beginAccess();
  *id v4 = a3;
}

- (int64_t)usedIndices
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_usedIndices);
  swift_beginAccess();
  return *v2;
}

- (void)setUsedIndices:(int64_t)a3
{
  id v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_usedIndices);
  swift_beginAccess();
  *id v4 = a3;
}

- (NSString)description
{
  return (NSString *)sub_21477DBC4(self, (uint64_t)a2, (void (*)(void))sub_21477DC34);
}

+ (BOOL)supportsSecureCoding
{
  return byte_26781D7F1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26781D7F1 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21477DFB4(v4);
}

- (_TtC9SEService11MemoryUsage)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC9SEService11MemoryUsage *)sub_214780CC0(v3);

  return v4;
}

- (_TtC9SEService11MemoryUsage)init
{
  result = (_TtC9SEService11MemoryUsage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end