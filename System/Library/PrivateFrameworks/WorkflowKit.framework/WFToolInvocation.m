@interface WFToolInvocation
+ (NSString)errorDomain;
+ (void)invocationFrom:(LNAction *)a3 bundleIdentifier:(NSString *)a4 deviceIdentifier:(NSString *)a5 completionHandler:(id)a6;
- (BOOL)containsParameterValueForKey:(id)a3;
- (WFToolInvocation)init;
- (WFToolInvocation)initWithEncodedToolInvocation:(id)a3 error:(id *)a4;
- (id)encodeAndReturnError:(id *)a3;
- (id)options;
- (void)processedValueFromEncodedValue:(WFEncodedTypedValue *)a3 forParameter:(WFParameter *)a4 ofClass:(Class)a5 variableSource:(WFVariableDataSource *)a6 completionHandler:(id)a7;
- (void)valueForParameter:(WFParameter *)a3 ofClass:(Class)a4 variableSource:(WFVariableDataSource *)a5 completionHandler:(id)a6;
@end

@implementation WFToolInvocation

+ (NSString)errorDomain
{
  static ToolInvocationBox.errorDomain.getter();
  v2 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (WFToolInvocation)initWithEncodedToolInvocation:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (void *)sub_1C8530128();
  unint64_t v7 = v6;

  return (WFToolInvocation *)ToolInvocationBox.init(encodedToolInvocation:)(v5, v7);
}

+ (void)invocationFrom:(LNAction *)a3 bundleIdentifier:(NSString *)a4 deviceIdentifier:(NSString *)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = a1;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  sub_1C82A95B4((uint64_t)&unk_1EA513BF0, (uint64_t)v11);
}

- (BOOL)containsParameterValueForKey:(id)a3
{
  uint64_t v4 = sub_1C8532658();
  unint64_t v6 = v5;
  unint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = ToolInvocationBox.containsParameterValueForKey(_:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)options
{
  v2 = self;
  id v3 = ToolInvocationBox.options()();

  return v3;
}

- (id)encodeAndReturnError:(id *)a3
{
  uint64_t v4 = self;
  v5.super.isa = ToolInvocationBox.encode()().super.isa;

  if (v6.super.isa)
  {
    if (a3)
    {
      unint64_t v7 = (void *)sub_1C8530048();

      id v8 = v7;
      v5.super.isa = 0;
      *a3 = v7;
    }
    else
    {

      v5.super.isa = 0;
    }
  }
  return v5.super.isa;
}

- (void)valueForParameter:(WFParameter *)a3 ofClass:(Class)a4 variableSource:(WFVariableDataSource *)a5 completionHandler:(id)a6
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
  v13 = self;
  sub_1C82A95B4((uint64_t)&unk_1EA513BE0, (uint64_t)v11);
}

- (void)processedValueFromEncodedValue:(WFEncodedTypedValue *)a3 forParameter:(WFParameter *)a4 ofClass:(Class)a5 variableSource:(WFVariableDataSource *)a6 completionHandler:(id)a7
{
  v12 = _Block_copy(a7);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  swift_unknownObjectRetain();
  v16 = self;
  sub_1C82A95B4((uint64_t)&unk_1EA513BD0, (uint64_t)v13);
}

- (WFToolInvocation)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___WFToolInvocation_toolInvocation;
  sub_1C8530D48();
  OUTLINED_FUNCTION_28();
  NSData v5 = *(void (**)(char *, uint64_t))(v4 + 8);
  v5(v2, v3);
}

@end