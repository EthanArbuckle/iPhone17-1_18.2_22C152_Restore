@interface WFToolKitHelper
+ (id)createActionFromEncodedToolInvocation:(id)a3 error:(id *)a4;
+ (id)decodeContentPropertyPossibleValuesDefinition:(id)a3 error:(id *)a4;
+ (id)decodeDynamicEnumerationDefinition:(id)a3 error:(id *)a4;
+ (id)decodeSearchStringInEncodedQuery:(id)a3 error:(id *)a4;
+ (id)produceVariableFromEncodedReference:(id)a3 error:(id *)a4;
+ (int64_t)valueSetTypeForDefinition:(id)a3;
+ (void)fetchToolInvocationSummaryForInvocation:(NSData *)a3 variableSource:(WFVariableDataSource *)a4 completionBlock:(id)a5;
+ (void)produceEncodedDisplayRepresentationForRequest:(NSData *)a3 completionBlock:(id)a4;
+ (void)produceEncodedTypedPossibleValuesForContentProperty:(WFContentProperty *)a3 completionBlock:(id)a4;
+ (void)produceEncodedTypedValueFromCollection:(WFContentCollection *)a3 forEncodedExpectedType:(NSData *)a4 completionBlock:(id)a5;
+ (void)produceEncodedTypedValuesFromPossibleStates:(NSArray *)a3 ofParameter:(WFParameter *)a4 inAction:(WFAction *)a5 completionBlock:(id)a6;
+ (void)resolveDeferredValueForEncodedStorage:(NSData *)a3 encodedExpectedType:(NSData *)a4 completionBlock:(id)a5;
+ (void)runLinkQuery:(NSData *)a3 valueSet:(NSData *)a4 completionBlock:(id)a5;
- (WFToolKitHelper)init;
@end

@implementation WFToolKitHelper

+ (id)createActionFromEncodedToolInvocation:(id)a3 error:(id *)a4
{
  return sub_10005BF38((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))static ToolKitHelper.createAction(encodedToolInvocation:));
}

+ (id)produceVariableFromEncodedReference:(id)a3 error:(id *)a4
{
  return sub_10005BF38((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))static ToolKitHelper.produceVariable(encodedReference:));
}

+ (int64_t)valueSetTypeForDefinition:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_10006DE20();
  unint64_t v6 = v5;

  int64_t v7 = static ToolKitHelper.decodeValueSetType(encodedDefinition:)();
  sub_10005172C(v4, v6);
  return v7;
}

+ (id)decodeDynamicEnumerationDefinition:(id)a3 error:(id *)a4
{
  return sub_10005BF38((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))static ToolKitHelper.decodeDynamicEnumerationDefinition(encodedDefinition:));
}

+ (id)decodeContentPropertyPossibleValuesDefinition:(id)a3 error:(id *)a4
{
  return sub_10005BF38((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))static ToolKitHelper.decodeContentPropertyPossibleValuesDefinition(encodedDefinition:));
}

+ (void)runLinkQuery:(NSData *)a3 valueSet:(NSData *)a4 completionBlock:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  v11 = a4;
  sub_100059F5C();
}

+ (id)decodeSearchStringInEncodedQuery:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_10006DE20();
  unint64_t v7 = v6;

  static ToolKitHelper.decodeSearchString(in:)();
  sub_10005172C(v5, v7);
  NSString v8 = sub_10006F020();
  swift_bridgeObjectRelease();
  return v8;
}

+ (void)produceEncodedTypedValueFromCollection:(WFContentCollection *)a3 forEncodedExpectedType:(NSData *)a4 completionBlock:(id)a5
{
}

+ (void)produceEncodedTypedPossibleValuesForContentProperty:(WFContentProperty *)a3 completionBlock:(id)a4
{
}

+ (void)produceEncodedTypedValuesFromPossibleStates:(NSArray *)a3 ofParameter:(WFParameter *)a4 inAction:(WFAction *)a5 completionBlock:(id)a6
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
  sub_100059F5C();
}

+ (void)produceEncodedDisplayRepresentationForRequest:(NSData *)a3 completionBlock:(id)a4
{
}

+ (void)resolveDeferredValueForEncodedStorage:(NSData *)a3 encodedExpectedType:(NSData *)a4 completionBlock:(id)a5
{
}

+ (void)fetchToolInvocationSummaryForInvocation:(NSData *)a3 variableSource:(WFVariableDataSource *)a4 completionBlock:(id)a5
{
  NSString v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  swift_unknownObjectRetain();
  sub_100059F5C();
}

- (WFToolKitHelper)init
{
  return (WFToolKitHelper *)ToolKitHelper.init()();
}

@end