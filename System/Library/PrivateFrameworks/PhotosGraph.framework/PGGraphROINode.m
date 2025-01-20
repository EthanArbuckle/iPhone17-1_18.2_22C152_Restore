@interface PGGraphROINode
+ (MANodeFilter)beachFilter;
+ (MANodeFilter)mountainFilter;
+ (MANodeFilter)natureFilter;
+ (MANodeFilter)urbanFilter;
+ (MANodeFilter)waterFilter;
+ (id)_labelForROIType:(unint64_t)a3;
+ (id)_localizationKeyForROINode:(id)a3;
+ (id)filter;
+ (id)filterForTypes:(id)a3;
+ (id)filterWithLabels:(id)a3;
+ (id)momentOfROI;
+ (id)validROILabels;
+ (unint64_t)_roiTypeForLabel:(id)a3;
- (NSArray)localizedSynonyms;
- (NSString)featureIdentifier;
- (NSString)localizedName;
- (NSString)pg_topic;
- (PGGraphROINode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphROINode)initWithROIType:(unint64_t)a3;
- (PGGraphROINodeCollection)collection;
- (id)label;
- (unint64_t)featureType;
- (unsigned)domain;
@end

@implementation PGGraphROINode

- (NSString)pg_topic
{
  v2 = [(PGGraphROINode *)self label];
  if (isRecognizedROITopic_onceToken != -1) {
    dispatch_once(&isRecognizedROITopic_onceToken, &__block_literal_global_9785);
  }
  if ([(id)isRecognizedROITopic_recognizedROITopics containsObject:v2]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

- (id)label
{
  return self->_label;
}

- (NSString)featureIdentifier
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphROINode *)self label];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 9;
}

- (PGGraphROINodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphROINodeCollection alloc] initWithNode:self];
  return v2;
}

- (NSArray)localizedSynonyms
{
  v2 = [(id)objc_opt_class() _localizationKeyForROINode:self];
  id v3 = +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:v2];

  return (NSArray *)v3;
}

- (NSString)localizedName
{
  v2 = [(id)objc_opt_class() _localizationKeyForROINode:self];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:v2 value:v2 table:@"Localizable"];

  return (NSString *)v4;
}

- (unsigned)domain
{
  return 502;
}

- (PGGraphROINode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() _roiTypeForLabel:v6];

  if (v7)
  {
    return [(PGGraphROINode *)self initWithROIType:v7];
  }
  else
  {

    return 0;
  }
}

- (PGGraphROINode)initWithROIType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGGraphROINode;
  v4 = [(PGGraphNode *)&v7 init];
  if (v4)
  {
    v5 = [(id)objc_opt_class() _labelForROIType:a3];
    if (v5)
    {
      objc_storeStrong((id *)&v4->_label, v5);
    }
    else
    {

      v4 = 0;
    }
  }
  return v4;
}

+ (id)momentOfROI
{
  v2 = +[PGGraphROIEdge filter];
  id v3 = [v2 inRelation];

  return v3;
}

+ (id)_localizationKeyForROINode:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 label];
  v5 = localizationKeyForROILabel(v4);
  if (!v5)
  {
    id v6 = +[PGLogging sharedLogging];
    objc_super v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Trying to localize node with unsupported label/domain: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v5;
}

+ (unint64_t)_roiTypeForLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Urban"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Beach"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Mountain"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Nature"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"Water"])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)_labelForROIType:(unint64_t)a3
{
  if (a3 - 1 > 4)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = *off_1E68E99B8[a3 - 1];
  }
  return v4;
}

+ (id)validROILabels
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"Urban";
  v5[1] = @"Beach";
  v5[2] = @"Mountain";
  v5[3] = @"Nature";
  v5[4] = @"Water";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];

  return v3;
}

+ (MANodeFilter)waterFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Water" domain:502];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)natureFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Nature" domain:502];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)mountainFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Mountain" domain:502];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)beachFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Beach" domain:502];
  return (MANodeFilter *)v2;
}

+ (MANodeFilter)urbanFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Urban" domain:502];
  return (MANodeFilter *)v2;
}

+ (id)filterForTypes:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __33__PGGraphROINode_filterForTypes___block_invoke;
  v14 = &unk_1E68E9998;
  id v15 = v6;
  id v16 = a1;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v11];

  id v8 = objc_alloc(MEMORY[0x1E4F71F00]);
  int v9 = objc_msgSend(v8, "initWithLabels:domain:properties:", v7, 502, MEMORY[0x1E4F1CC08], v11, v12, v13, v14);

  return v9;
}

void __33__PGGraphROINode_filterForTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 40) _labelForROIType:a2];
  if (v3)
  {
    unint64_t v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v3 = v4;
  }
}

+ (id)filterWithLabels:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithLabels:v4 domain:502 properties:MEMORY[0x1E4F1CC08]];

  return v6;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:502];
  return v2;
}

@end