@interface POXSDefinitions
+ (id)definitionForType:(Class)a3;
@end

@implementation POXSDefinitions

+ (id)definitionForType:(Class)a3
{
  if (definitionForType__predicate != -1)
  {
    dispatch_once(&definitionForType__predicate, &__block_literal_global_4);
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  id v4 = (id)definitionForType__definitions;
  objc_sync_enter(v4);
  v5 = [(id)definitionForType__definitions objectForKey:a3];
  if (!v5)
  {
    if ([(objc_class *)a3 conformsToProtocol:&unk_2707DC730])
    {
      v5 = [(objc_class *)a3 definition];
      if (v5) {
        [(id)definitionForType__definitions setObject:v5 forKey:a3];
      }
    }
    else
    {
      v5 = 0;
    }
  }
  objc_sync_exit(v4);

LABEL_11:
  return v5;
}

uint64_t __37__POXSDefinitions_definitionForType___block_invoke()
{
  definitionForType__definitions = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
  return MEMORY[0x270F9A758]();
}

@end