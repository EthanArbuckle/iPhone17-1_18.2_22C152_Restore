@interface PGGraphLanguageNode
+ (id)filter;
+ (id)filterWithLocaleIdentifiers:(id)a3;
- (BOOL)hasProperties:(id)a3;
- (NSString)localeIdentifier;
- (PGGraphLanguageNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphLanguageNode)initWithLocaleIdentifier:(id)a3;
- (id)description;
- (id)label;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (unsigned)domain;
@end

@implementation PGGraphLanguageNode

- (void).cxx_destruct
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (unsigned)domain
{
  return 205;
}

- (id)label
{
  v2 = @"Language";
  return @"Language";
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PGGraphLanguageNode (%@)", self->_localeIdentifier];
}

- (id)propertyForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"localeIdentifier"])
  {
    v5 = self->_localeIdentifier;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphLanguageNode.", (uint8_t *)&v7, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  localeIdentifier = self->_localeIdentifier;
  v5 = @"localeIdentifier";
  v6[0] = localeIdentifier;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"localeIdentifier"];
    int v7 = v6;
    BOOL v8 = !v6 || [v6 isEqual:self->_localeIdentifier];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (PGGraphLanguageNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6 = objc_msgSend(a5, "objectForKeyedSubscript:", @"localeIdentifier", a4);
  int v7 = [(PGGraphLanguageNode *)self initWithLocaleIdentifier:v6];

  return v7;
}

- (PGGraphLanguageNode)initWithLocaleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphLanguageNode;
  v6 = [(PGGraphNode *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localeIdentifier, a3);
  }

  return v7;
}

+ (id)filterWithLocaleIdentifiers:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  objc_super v9 = @"localeIdentifier";
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  int v7 = (void *)[v5 initWithLabel:@"Language" domain:205 properties:v6];
  return v7;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Language" domain:205];
  return v2;
}

@end