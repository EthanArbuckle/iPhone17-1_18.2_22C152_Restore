@interface TTRNoDefaultImplicitActionLayer
+ (id)defaultActionForKey:(id)a3;
- (_TtC15RemindersUICore31TTRNoDefaultImplicitActionLayer)init;
- (_TtC15RemindersUICore31TTRNoDefaultImplicitActionLayer)initWithCoder:(id)a3;
- (_TtC15RemindersUICore31TTRNoDefaultImplicitActionLayer)initWithLayer:(id)a3;
@end

@implementation TTRNoDefaultImplicitActionLayer

+ (id)defaultActionForKey:(id)a3
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);

  return v3;
}

- (_TtC15RemindersUICore31TTRNoDefaultImplicitActionLayer)init
{
  return (_TtC15RemindersUICore31TTRNoDefaultImplicitActionLayer *)sub_1B920B688(self, (uint64_t)a2, type metadata accessor for TTRNoDefaultImplicitActionLayer);
}

- (_TtC15RemindersUICore31TTRNoDefaultImplicitActionLayer)initWithLayer:(id)a3
{
  return (_TtC15RemindersUICore31TTRNoDefaultImplicitActionLayer *)sub_1B920B6E4(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for TTRNoDefaultImplicitActionLayer);
}

- (_TtC15RemindersUICore31TTRNoDefaultImplicitActionLayer)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore31TTRNoDefaultImplicitActionLayer *)sub_1B920B7A4(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for TTRNoDefaultImplicitActionLayer);
}

@end