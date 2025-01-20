@interface OSEligibilityQuery
- (OSEligibilityQuery)init;
- (OSEligibilityQuery)initWithDomain:(unint64_t)a3 auditToken:(id *)a4 error:(id *)a5;
- (OSEligibilityQuery)initWithDomain:(unint64_t)a3 bundleID:(id)a4 persona:(id)a5 error:(id *)a6;
- (OSEligibilityQuery)initWithDomain:(unint64_t)a3 error:(id *)a4;
- (OS_xpc_object)context;
- (OS_xpc_object)status;
- (unint64_t)answer;
- (unint64_t)answerSource;
@end

@implementation OSEligibilityQuery

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (unint64_t)answer
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___OSEligibilityQuery_answer);
}

- (unint64_t)answerSource
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___OSEligibilityQuery_answerSource);
}

- (OS_xpc_object)status
{
  v2 = (void *)swift_unknownObjectRetain();

  return (OS_xpc_object *)v2;
}

- (OS_xpc_object)context
{
  v2 = (void *)swift_unknownObjectRetain();

  return (OS_xpc_object *)v2;
}

- (OSEligibilityQuery)initWithDomain:(unint64_t)a3 error:(id *)a4
{
  return (OSEligibilityQuery *)sub_257DBA6E8(a3);
}

- (OSEligibilityQuery)initWithDomain:(unint64_t)a3 bundleID:(id)a4 persona:(id)a5 error:(id *)a6
{
  uint64_t v8 = sub_257DC2C38();
  unint64_t v10 = v9;
  if (a5)
  {
    uint64_t v11 = sub_257DC2C38();
    unint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v13 = 0;
  }
  return (OSEligibilityQuery *)sub_257DBA8B8(a3, v8, v10, v11, v13);
}

- (OSEligibilityQuery)initWithDomain:(unint64_t)a3 auditToken:(id *)a4 error:(id *)a5
{
  return (OSEligibilityQuery *)sub_257DBAB0C(a3, *(void *)a4->var0, *(void *)&a4->var0[2], *(void *)&a4->var0[4], *(void *)&a4->var0[6]);
}

- (OSEligibilityQuery)init
{
  result = (OSEligibilityQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end