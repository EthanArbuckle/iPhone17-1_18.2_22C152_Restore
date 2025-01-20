@interface WFClipboardVariable
- (BOOL)isAvailable;
- (BOOL)requiresModernVariableSupport;
- (WFClipboardVariable)initWithAggrandizements:(id)a3;
- (id)icon;
- (id)name;
- (id)possibleContentClassesWithContext:(id)a3;
- (id)requiredAccessResources;
- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4;
@end

@implementation WFClipboardVariable

- (id)requiredAccessResources
{
  v2 = [(objc_class *)getUIPasteboardClass_62547() generalPasteboard];
  v3 = [MEMORY[0x1E4F5A830] requiredResourcesForContentInPasteboard:v2];

  return v3;
}

- (id)possibleContentClassesWithContext:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v4 = objc_opt_class();
  return (id)[v3 orderedSetWithObject:v4];
}

- (BOOL)requiresModernVariableSupport
{
  v2 = [(WFVariable *)self aggrandizements];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)icon
{
  id v2 = objc_alloc(MEMORY[0x1E4FB49C8]);
  BOOL v3 = [MEMORY[0x1E4FB45E0] colorWithSystemColor:1];
  uint64_t v4 = [MEMORY[0x1E4FB4760] clearBackground];
  v5 = (void *)[v2 initWithSymbolName:@"clipboard" symbolColor:v3 background:v4];

  return v5;
}

- (id)name
{
  return WFLocalizedStringWithKey(@"Clipboard variable", @"Clipboard");
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = (uint64_t (*)(void))getUIPasteboardClass_62547;
  id v5 = a4;
  id v6 = [(id)v4() generalPasteboard];
  [MEMORY[0x1E4F5A830] generateCollectionFromPasteboard:v6 completionHandler:v5];
}

- (WFClipboardVariable)initWithAggrandizements:(id)a3
{
  uint64_t v4 = WFVariableDictionaryWithAggrandizements(a3);
  id v5 = [(WFVariable *)self initWithDictionary:v4 variableProvider:0];

  return v5;
}

@end