@interface WFAskEachTimeVariable
- (BOOL)isAvailable;
- (BOOL)requiresModernVariableSupport;
- (BOOL)supportsAggrandizements;
- (NSString)prompt;
- (WFAskEachTimeVariable)init;
- (WFAskEachTimeVariable)initWithCollectionFilter:(id)a3;
- (WFAskEachTimeVariable)initWithPrompt:(id)a3;
- (WFAskEachTimeVariable)initWithPrompt:(id)a3 collectionFilter:(id)a4;
- (WFDisambiguationCollectionFilter)collectionFilter;
- (id)icon;
- (id)name;
- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4;
- (void)setCollectionFilter:(id)a3;
@end

@implementation WFAskEachTimeVariable

- (void).cxx_destruct
{
}

- (void)setCollectionFilter:(id)a3
{
}

- (BOOL)requiresModernVariableSupport
{
  return 0;
}

- (BOOL)supportsAggrandizements
{
  return 0;
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)name
{
  return WFLocalizedString(@"Ask Each Time");
}

- (id)icon
{
  id v2 = objc_alloc(MEMORY[0x1E4FB49C8]);
  v3 = [MEMORY[0x1E4FB45E0] colorWithSystemColor:1];
  v4 = [MEMORY[0x1E4FB4760] clearBackground];
  v5 = (void *)[v2 initWithSymbolName:@"text.bubble" symbolColor:v3 background:v4];

  return v5;
}

- (WFDisambiguationCollectionFilter)collectionFilter
{
  collectionFilter = self->_collectionFilter;
  if (!collectionFilter)
  {
    v4 = [(WFVariable *)self dictionary];
    v5 = [v4 objectForKey:@"CollectionFilter"];

    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = (WFDisambiguationCollectionFilter *)[objc_alloc(MEMORY[0x1E4FB46E8]) initWithSerializedRepresentation:v5];
        v7 = self->_collectionFilter;
        self->_collectionFilter = v6;
      }
    }

    collectionFilter = self->_collectionFilter;
  }
  return collectionFilter;
}

- (NSString)prompt
{
  id v2 = [(WFVariable *)self dictionary];
  v3 = [v2 objectForKey:@"Prompt"];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = getWFGeneralLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315138;
    v7 = "-[WFAskEachTimeVariable retrieveContentCollectionWithVariableSource:completionHandler:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_FAULT, "%s Ask Each Time variable unexpectedly asked for content", (uint8_t *)&v6, 0xCu);
  }

  (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
}

- (WFAskEachTimeVariable)initWithPrompt:(id)a3 collectionFilter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    uint64_t v8 = 0;
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = (void *)[v6 copy];
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  v9 = (void *)[v7 copy];
LABEL_6:
  v10 = objc_opt_new();
  [v10 setValue:v8 forKey:@"Prompt"];
  v11 = [v9 serializableRepresentation];
  [v10 setValue:v11 forKey:@"CollectionFilter"];

  v12 = [(WFVariable *)self initWithDictionary:v10 variableProvider:0];
  return v12;
}

- (WFAskEachTimeVariable)initWithCollectionFilter:(id)a3
{
  return [(WFAskEachTimeVariable *)self initWithPrompt:0 collectionFilter:a3];
}

- (WFAskEachTimeVariable)initWithPrompt:(id)a3
{
  return [(WFAskEachTimeVariable *)self initWithPrompt:a3 collectionFilter:0];
}

- (WFAskEachTimeVariable)init
{
  return [(WFAskEachTimeVariable *)self initWithPrompt:0 collectionFilter:0];
}

@end