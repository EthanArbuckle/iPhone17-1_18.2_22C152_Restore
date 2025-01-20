@interface WFPosterParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
@end

@implementation WFPosterParameterState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  return (id)[a3 serializedRepresentation];
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  return +[WFPosterRepresentation posterWithSerializedRepresentation:](WFPosterRepresentation, "posterWithSerializedRepresentation:", a3, a4, a5);
}

@end