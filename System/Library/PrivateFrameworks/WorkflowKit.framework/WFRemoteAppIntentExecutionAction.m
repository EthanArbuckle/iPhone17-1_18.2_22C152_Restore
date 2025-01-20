@interface WFRemoteAppIntentExecutionAction
- (BOOL)isApprovedForPublicShortcutsDrawer;
- (WFRemoteAppIntentExecutionAction)init;
- (WFRemoteAppIntentExecutionAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFRemoteAppIntentExecutionAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C802FF88();
}

- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  id v7 = sub_1C803D574((uint64_t)a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v7;
}

- (BOOL)isApprovedForPublicShortcutsDrawer
{
  v2 = self;
  sub_1C803D9CC();

  return 0;
}

- (WFRemoteAppIntentExecutionAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v7 = sub_1C8532658();
  uint64_t v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA512650);
    a5 = (id)sub_1C8532538();
  }
  id v10 = a4;
  return (WFRemoteAppIntentExecutionAction *)sub_1C803DBA4(v7, v9, a4, (uint64_t)a5);
}

- (WFRemoteAppIntentExecutionAction)init
{
  return (WFRemoteAppIntentExecutionAction *)sub_1C803DD0C();
}

@end