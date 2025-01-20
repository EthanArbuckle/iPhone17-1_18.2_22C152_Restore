@interface AceObject(SiriUIUUFRShowable)
- (id)_uufrShownRequestedByInstrumentationManager:()SiriUIUUFRShowable;
@end

@implementation AceObject(SiriUIUUFRShowable)

- (id)_uufrShownRequestedByInstrumentationManager:()SiriUIUUFRShowable
{
  id v2 = objc_alloc_init(MEMORY[0x263F6EEC8]);
  v3 = [a1 aceId];
  [v2 setAceViewID:v3];

  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v2 setSnippetClass:v5];

  return v2;
}

@end