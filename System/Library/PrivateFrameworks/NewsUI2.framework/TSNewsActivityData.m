@interface TSNewsActivityData
+ (int64_t)convertToArticleTraitWithTrait:(int64_t)a3;
- (NSArray)traits;
- (NSString)description;
- (NSString)identifier;
- (TSNewsActivityData)init;
- (TSNewsActivityData)initWithActivity:(int64_t)a3 identifier:(id)a4;
- (TSNewsActivityData)initWithActivity:(int64_t)a3 identifier:(id)a4 object:(id)a5;
- (TSNewsActivityData)initWithActivity:(int64_t)a3 identifier:(id)a4 object:(id)a5 traits:(id)a6;
- (id)object;
- (int64_t)activity;
@end

@implementation TSNewsActivityData

- (int64_t)activity
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_activity);
}

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)object
{
  v2 = (void *)swift_unknownObjectRetain();
  return v2;
}

- (NSArray)traits
{
  sub_1DEA69724();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFE200();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (TSNewsActivityData)initWithActivity:(int64_t)a3 identifier:(id)a4
{
  sub_1DFDFDD20();
  v6 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  sub_1DEA69724();
  v7 = (void *)sub_1DFDFE200();
  v8 = [(TSNewsActivityData *)self initWithActivity:a3 identifier:v6 object:0 traits:v7];

  return v8;
}

- (TSNewsActivityData)initWithActivity:(int64_t)a3 identifier:(id)a4 object:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = sub_1DFDFDD20();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_activity) = (Class)a3;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___TSNewsActivityData_identifier);
  uint64_t *v10 = v9;
  v10[1] = v11;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_object) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_traits) = (Class)MEMORY[0x1E4FBC860];
  v13.receiver = self;
  v13.super_class = ObjectType;
  swift_unknownObjectRetain();
  return [(TSNewsActivityData *)&v13 init];
}

- (TSNewsActivityData)initWithActivity:(int64_t)a3 identifier:(id)a4 object:(id)a5 traits:(id)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = sub_1DFDFDD20();
  uint64_t v12 = v11;
  sub_1DEA69724();
  objc_super v13 = (objc_class *)sub_1DFDFE220();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_activity) = (Class)a3;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___TSNewsActivityData_identifier);
  uint64_t *v14 = v10;
  v14[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_object) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_traits) = v13;
  v16.receiver = self;
  v16.super_class = ObjectType;
  swift_unknownObjectRetain();
  return [(TSNewsActivityData *)&v16 init];
}

+ (int64_t)convertToArticleTraitWithTrait:(int64_t)a3
{
  int64_t result = a3;
  if ((unint64_t)a3 >= 4)
  {
    int64_t result = sub_1DFDFFFD0();
    __break(1u);
  }
  return result;
}

- (TSNewsActivityData)init
{
  int64_t result = (TSNewsActivityData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  BridgedNewsActivityData.description.getter();

  v3 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end