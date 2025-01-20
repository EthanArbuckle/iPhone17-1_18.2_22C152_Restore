@interface _SEContentProcess
- (_SEContentProcess)init;
- (id)createVisibilityPropagationInteraction;
@end

@implementation _SEContentProcess

- (id)createVisibilityPropagationInteraction
{
  type metadata accessor for _ContentProcess(0);
  MEMORY[0x270FA5388]();
  v4 = (char *)&atoken - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C20D560((uint64_t)self + OBJC_IVAR____SEContentProcess_inner, (uint64_t)v4, type metadata accessor for _ContentProcess);
  v5 = self;
  *(void *)atoken.val = MEMORY[0x261180380]();
  atoken.val[2] = v6;
  atoken.val[3] = v7;
  atoken.val[4] = v8;
  atoken.val[5] = v9;
  atoken.val[6] = v10;
  atoken.val[7] = v11;
  uint64_t v12 = audit_token_to_pid(&atoken);
  v13 = (void *)sub_25C2219D8();
  id v14 = objc_msgSend(self, sel_interactionWithPID_environmentIdentifier_, v12, v13);

  sub_25C209F40((uint64_t)v4, type metadata accessor for _ContentProcess);
  return v14;
}

- (void).cxx_destruct
{
}

- (_SEContentProcess)init
{
  result = (_SEContentProcess *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end