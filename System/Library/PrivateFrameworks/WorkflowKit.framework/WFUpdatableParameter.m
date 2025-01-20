@interface WFUpdatableParameter
- (Class)singleStateClass;
- (Class)toolkitStateClass;
- (WFParameter)underlyingParameter;
- (WFUpdatableParameter)initWithDefinition:(id)a3;
- (id)localizedLabelWithContext:(id)a3;
- (id)parameterStateFromDialogResponse:(id)a3;
- (void)createDialogRequestWithAttribution:(WFDialogAttribution *)a3 defaultState:(WFParameterState *)a4 prompt:(NSString *)a5 completionHandler:(id)a6;
@end

@implementation WFUpdatableParameter

- (WFParameter)underlyingParameter
{
  id v2 = WFUpdatableParameter.underlyingParameter.getter();
  return (WFParameter *)v2;
}

- (id)localizedLabelWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C7F76A00((uint64_t)v4);

  v6 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return v6;
}

- (WFUpdatableParameter)initWithDefinition:(id)a3
{
  return (WFUpdatableParameter *)WFUpdatableParameter.init(definition:)(a3);
}

- (Class)singleStateClass
{
  sub_1C7F76F34();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)createDialogRequestWithAttribution:(WFDialogAttribution *)a3 defaultState:(WFParameterState *)a4 prompt:(NSString *)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_1C82A95B4((uint64_t)&unk_1EA5135B0, (uint64_t)v11);
}

- (id)parameterStateFromDialogResponse:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_1C7F77774((uint64_t)v4);

  return v6;
}

- (Class)toolkitStateClass
{
  id v2 = self;
  sub_1C7F77C18();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___WFUpdatableParameter_stateDataSource;
  sub_1C7F782F8((uint64_t)v3);
}

@end