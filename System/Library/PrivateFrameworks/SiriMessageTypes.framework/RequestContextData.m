@interface RequestContextData
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (_TtC16SiriMessageTypes18RequestContextData)init;
- (_TtC16SiriMessageTypes18RequestContextData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RequestContextData

+ (BOOL)supportsSecureCoding
{
  return static RequestContextData.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC16SiriMessageTypes18RequestContextData)initWithCoder:(id)a3
{
  return (_TtC16SiriMessageTypes18RequestContextData *)RequestContextData.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25D02098C();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_25D0BD580();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self;
  }
  sub_25D020F74();
  char v7 = v6;

  sub_25D0239DC((uint64_t)v9, &qword_26A637600);
  return v7 & 1;
}

- (NSString)debugDescription
{
  v2 = self;
  sub_25D021578();

  v3 = (void *)sub_25D0BD2D0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC16SiriMessageTypes18RequestContextData)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25D0239DC((uint64_t)self + OBJC_IVAR____TtC16SiriMessageTypes18RequestContextData_approximatePreviousTTSInterval, &qword_26B3647A8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SiriMessageTypes18RequestContextData_conjunctionInfo);
}

@end