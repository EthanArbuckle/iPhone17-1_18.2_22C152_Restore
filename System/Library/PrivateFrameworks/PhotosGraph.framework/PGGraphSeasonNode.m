@interface PGGraphSeasonNode
+ (id)_localizationKeyForSeasonNode:(id)a3;
+ (id)dateOfSeason;
+ (id)filter;
+ (id)filterForSeasonName:(id)a3;
- (BOOL)hasProperties:(id)a3;
- (MANodeFilter)uniquelyIdentifyingFilter;
- (NSArray)localizedSynonyms;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)localizedName;
- (NSString)name;
- (PGGraphSeasonNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphSeasonNode)initWithName:(id)a3;
- (PGGraphSeasonNodeCollection)collection;
- (id)label;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (unint64_t)featureType;
- (unint64_t)numberOfMomentNodes;
- (unsigned)domain;
@end

@implementation PGGraphSeasonNode

- (void).cxx_destruct
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphSeasonNode *)self name];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 14;
}

- (PGGraphSeasonNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphSeasonNodeCollection alloc] initWithNode:self];
  return v2;
}

- (NSArray)localizedSynonyms
{
  v2 = [(id)objc_opt_class() _localizationKeyForSeasonNode:self];
  v3 = +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:v2];

  return (NSArray *)v3;
}

- (NSString)localizedName
{
  v2 = [(id)objc_opt_class() _localizationKeyForSeasonNode:self];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:v2 value:v2 table:@"Localizable"];

  return (NSString *)v4;
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  id v3 = objc_alloc(MEMORY[0x1E4F71F00]);
  v4 = [(PGGraphSeasonNode *)self propertyDictionary];
  v5 = (void *)[v3 initWithLabel:@"Season" domain:400 properties:v4];

  return (MANodeFilter *)v5;
}

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  v2 = @"Season";
  return @"Season";
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PGGraphSeasonNode (%@)", self->_name];
}

- (id)propertyForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"name"])
  {
    v5 = self->_name;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphSeasonNode.", (uint8_t *)&v7, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  name = self->_name;
  v5 = @"name";
  v6[0] = name;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"name"];
    int v7 = v6;
    BOOL v8 = !v6 || [v6 isEqual:self->_name];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (PGGraphSeasonNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6 = objc_msgSend(a5, "objectForKeyedSubscript:", @"name", a4);
  int v7 = [(PGGraphSeasonNode *)self initWithName:v6];

  return v7;
}

- (PGGraphSeasonNode)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSeasonNode;
  v6 = [(PGGraphNode *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (unint64_t)numberOfMomentNodes
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__PGGraphSeasonNode_numberOfMomentNodes__block_invoke;
  v4[3] = &unk_1E68EBAC0;
  v4[4] = &v5;
  [(MANode *)self enumerateNeighborNodesThroughEdgesWithLabel:@"SEASON" domain:400 usingBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__PGGraphSeasonNode_numberOfMomentNodes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 countOfEdgesWithLabel:@"DATE" domain:400];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)filterForSeasonName:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  objc_super v9 = @"name";
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  uint64_t v7 = (void *)[v5 initWithLabel:@"Season" domain:400 properties:v6];
  return v7;
}

+ (id)dateOfSeason
{
  unint64_t v2 = +[PGGraphSeasonEdge filter];
  id v3 = [v2 inRelation];

  return v3;
}

+ (id)_localizationKeyForSeasonNode:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 name];
  if ([v4 isEqualToString:*MEMORY[0x1E4F76BC8]])
  {
    id v5 = @"PGSeasonMemoryTitleFormatSpring";
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F76BD0]])
  {
    id v5 = @"PGSeasonMemoryTitleFormatSummer";
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F76BC0]])
  {
    id v5 = @"PGSeasonMemoryTitleFormatAutumn";
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4F76BD8]])
  {
    id v5 = @"PGSeasonMemoryTitleFormatWinter";
  }
  else
  {
    v6 = +[PGLogging sharedLogging];
    uint64_t v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Trying to localize season node with unsupported label: %@", (uint8_t *)&v9, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

+ (id)filter
{
  unint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Season" domain:400];
  return v2;
}

@end