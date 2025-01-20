@interface WFRunShortcutIntentAction
- (id)parameterOverrides;
@end

@implementation WFRunShortcutIntentAction

- (id)parameterOverrides
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)WFRunShortcutIntentAction;
  v2 = [(WFOverridableLinkAction *)&v8 parameterOverrides];
  v3 = (void *)[v2 mutableCopy];

  v9 = @"Class";
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  WFAddEntriesToDictionary(v3, @"shortcut", v6);

  return v3;
}

@end