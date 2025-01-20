@interface PRNLPLanguageModel
+ (PRNLPLanguageModel)languageModelWithLocalization:(id)a3 type:(int64_t)a4;
- (BOOL)getConditionalProbabilityForString:(id)a3 context:(id)a4 probability:(double *)a5;
- (BOOL)stringIsBlocklisted:(id)a3;
- (NSString)localization;
- (PRNLPLanguageModel)initWithLocalization:(id)a3 type:(int64_t)a4;
- (id)description;
- (id)modelOptionsForLocale:(id)a3 type:(int64_t)a4;
- (id)stateWithContext:(id)a3;
- (int64_t)modelType;
- (void)dealloc;
@end

@implementation PRNLPLanguageModel

- (id)modelOptionsForLocale:(id)a3 type:(int64_t)a4
{
  switch(a4)
  {
    case 1:
      v5 = NSDictionary;
      uint64_t v6 = [NSNumber numberWithInteger:1];
      self = (id)objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x263F13EF0], a3, *MEMORY[0x263F13F00], 0, v18, v19, v20, v21);
      break;
    case 2:
      v7 = NSDictionary;
      uint64_t v8 = *MEMORY[0x263F13E70];
      uint64_t v9 = *MEMORY[0x263F13EE8];
      uint64_t v10 = [NSNumber numberWithInteger:2];
      self = (id)objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x263F13EF0], a3, *MEMORY[0x263F13F00], 0, v20, v21);
      break;
    case 3:
      v11 = NSDictionary;
      uint64_t v12 = *MEMORY[0x263F13E70];
      uint64_t v13 = *MEMORY[0x263F13EE8];
      uint64_t v14 = [NSNumber numberWithInteger:2];
      uint64_t v15 = *MEMORY[0x263F13EF0];
      uint64_t v16 = [NSNumber numberWithBool:1];
      v17 = (void *)MEMORY[0x263F13F08];
      goto LABEL_6;
    case 4:
      v11 = NSDictionary;
      uint64_t v12 = *MEMORY[0x263F13E70];
      uint64_t v13 = *MEMORY[0x263F13EE8];
      uint64_t v14 = [NSNumber numberWithInteger:2];
      uint64_t v15 = *MEMORY[0x263F13EF0];
      uint64_t v16 = [NSNumber numberWithBool:1];
      v17 = (void *)MEMORY[0x263F13EF8];
LABEL_6:
      self = (id)objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, v13, v14, v15, v16, *v17, a3, *MEMORY[0x263F13F00], 0);
      break;
    default:
      return self;
  }
  return self;
}

- (PRNLPLanguageModel)initWithLocalization:(id)a3 type:(int64_t)a4
{
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:a3];
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", -[PRNLPLanguageModel modelOptionsForLocale:type:](self, "modelOptionsForLocale:type:", v7, a4));
  uint64_t v9 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (_kSuppressAdaptation)
  {
    uint64_t v10 = [NSNumber numberWithBool:0];
    uint64_t v11 = *MEMORY[0x263F13ED8];
    [v8 setObject:v10 forKey:*MEMORY[0x263F13ED8]];
    objc_msgSend(v9, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 0), v11);
  }
  uint64_t v12 = (void *)[MEMORY[0x263F14010] languageModelWithOptions:v8 error:0];
  uint64_t v13 = (void *)[v12 sessionWithOptions:v9];
  v16.receiver = self;
  v16.super_class = (Class)PRNLPLanguageModel;
  uint64_t v14 = [(PRNLPLanguageModel *)&v16 init];
  if (v14)
  {
    v14->_localization = (NSString *)[a3 copy];
    v14->_modelType = a4;
    v14->_model = (NLLanguageModel *)v12;
    v14->_session = (NLLanguageModelSession *)v13;
    v14->_cachedStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v14->_cachedContextsRecycleQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }

  return v14;
}

+ (PRNLPLanguageModel)languageModelWithLocalization:(id)a3 type:(int64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithLocalization:a3 type:a4];
  return (PRNLPLanguageModel *)v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRNLPLanguageModel;
  [(PRNLPLanguageModel *)&v3 dealloc];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PRNLPLanguageModel;
  objc_super v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"%@(%@"), -[PRNLPLanguageModel description](&v6, sel_description), self->_localization;
  v4 = v3;
  if (self->_session) {
    [v3 appendFormat:@":%@", self->_session];
  }
  [v4 appendString:@""]);
  return v4;
}

- (BOOL)getConditionalProbabilityForString:(id)a3 context:(id)a4 probability:(double *)a5
{
  objc_super v6 = (void *)[(NLLanguageModelSession *)self->_session conditionalProbabilityForString:a3 context:a4];
  if (v6)
  {
    v7 = v6;
    LODWORD(v6) = [v6 isValid];
    if (v6)
    {
      [v7 log10Probability];
      if (a5) {
        *(void *)a5 = v8;
      }
      LOBYTE(v6) = 1;
    }
  }
  return (char)v6;
}

- (BOOL)stringIsBlocklisted:(id)a3
{
  return [(NLLanguageModelSession *)self->_session blocklistStatusForString:a3 matchType:2] != 0;
}

- (id)stateWithContext:(id)a3
{
  v5 = (PRNLPLanguageModelState *)(id)-[NSMutableDictionary objectForKey:](self->_cachedStates, "objectForKey:");
  if (!v5)
  {
    objc_super v6 = (void *)[(NLLanguageModelSession *)self->_session stateWithOptions:MEMORY[0x263EFFA78]];
    [v6 addContext:a3];
    v5 = [[PRNLPLanguageModelState alloc] initWithLanguageModel:self state:v6];
    while ([(NSMutableDictionary *)self->_cachedStates count])
    {
      if ([(NSMutableArray *)self->_cachedContextsRecycleQueue count]) {
        cachedContextsRecycleQueue = self->_cachedContextsRecycleQueue;
      }
      else {
        cachedContextsRecycleQueue = (NSMutableArray *)[(NSMutableDictionary *)self->_cachedStates allKeys];
      }
      uint64_t v8 = (void *)[(NSMutableArray *)cachedContextsRecycleQueue firstObject];
      id v9 = v8;
      [(NSMutableDictionary *)self->_cachedStates removeObjectForKey:v8];
      [(NSMutableArray *)self->_cachedContextsRecycleQueue removeObject:v8];
    }
    [(NSMutableDictionary *)self->_cachedStates setObject:v5 forKey:a3];
    [(NSMutableArray *)self->_cachedContextsRecycleQueue addObject:a3];
  }
  return v5;
}

- (NSString)localization
{
  return self->_localization;
}

- (int64_t)modelType
{
  return self->_modelType;
}

@end