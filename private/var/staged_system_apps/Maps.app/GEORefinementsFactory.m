@interface GEORefinementsFactory
+ (id)allRefinementsSectionsWith:(id)a3;
+ (id)barMultiSelectResultRefinementsWith:(id)a3;
+ (id)barResultRefinementsWith:(id)a3;
+ (id)updatedOpenOptionResultRefinementWith:(id)a3;
- (_TtC4Maps21GEORefinementsFactory)init;
@end

@implementation GEORefinementsFactory

+ (id)barResultRefinementsWith:(id)a3
{
  id v3 = a3;
  v4 = sub_1002DC2EC();

  if (v4)
  {
    sub_100100830(0, &qword_1015D5AC8);
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }

  return v5.super.isa;
}

+ (id)allRefinementsSectionsWith:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  unint64_t v5 = sub_1002DB130(v4);

  if (v5)
  {
    sub_100100830(0, &qword_1015D65B8);
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }

  return v6.super.isa;
}

+ (id)barMultiSelectResultRefinementsWith:(id)a3
{
  id v3 = a3;
  id v4 = (void *)sub_1002DCA6C(v3);

  return v4;
}

+ (id)updatedOpenOptionResultRefinementWith:(id)a3
{
  id v3 = a3;
  id v4 = sub_1002DC4E8(v3);

  return v4;
}

- (_TtC4Maps21GEORefinementsFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GEORefinementsFactory();
  return [(GEORefinementsFactory *)&v3 init];
}

@end