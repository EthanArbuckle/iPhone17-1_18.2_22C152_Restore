@interface WFSiriAskEachTimeParameterState
+ (Class)processingValueClass;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (WFPropertyListObject)serializedRepresentation;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFSiriAskEachTimeParameterState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

- (WFPropertyListObject)serializedRepresentation
{
  return 0;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v6 = a5;
  id v7 = (id)objc_opt_new();
  (*((void (**)(id, id, void))a5 + 2))(v6, v7, 0);
}

- (unint64_t)hash
{
  return 0;
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end