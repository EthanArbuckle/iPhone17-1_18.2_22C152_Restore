@interface PGGraphPOINode
+ (id)_localizationKeyForPOINode:(id)a3;
+ (id)filter;
+ (id)filterWithLabel:(id)a3;
+ (id)filterWithLabels:(id)a3;
+ (id)momentOfPOI;
+ (id)validPOILabels;
- (NSArray)localizedSynonyms;
- (NSString)featureIdentifier;
- (NSString)localizedName;
- (NSString)pg_topic;
- (PGGraphPOINode)initWithLabel:(id)a3;
- (PGGraphPOINodeCollection)collection;
- (id)label;
- (unint64_t)featureType;
- (unsigned)domain;
@end

@implementation PGGraphPOINode

- (NSString)pg_topic
{
  v2 = [(PGGraphPOINode *)self label];
  v3 = +[PGGraphPOINode validPOILabels];
  int v4 = [v3 containsObject:v2];

  if (v4) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }

  return (NSString *)v5;
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
  v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(PGGraphPOINode *)self label];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 10;
}

- (NSArray)localizedSynonyms
{
  v2 = [(id)objc_opt_class() _localizationKeyForPOINode:self];
  v3 = +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:v2];

  return (NSArray *)v3;
}

- (NSString)localizedName
{
  v2 = [(id)objc_opt_class() _localizationKeyForPOINode:self];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v4 = [v3 localizedStringForKey:v2 value:v2 table:@"Localizable"];

  return (NSString *)v4;
}

- (PGGraphPOINodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphPOINodeCollection alloc] initWithNode:self];
  return v2;
}

- (unsigned)domain
{
  return 501;
}

- (PGGraphPOINode)initWithLabel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphPOINode;
  id v5 = [(PGGraphNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

+ (id)momentOfPOI
{
  v2 = +[PGGraphPOIEdge filter];
  v3 = [v2 inRelation];

  return v3;
}

+ (id)filterWithLabels:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = (void *)[v5 initWithLabels:v4 domain:501 properties:MEMORY[0x1E4F1CC08]];

  return v6;
}

+ (id)filterWithLabel:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithLabel:v4 domain:501];

  return v5;
}

+ (id)_localizationKeyForPOINode:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 label];
  id v5 = localizationKeyForPOILabel(v4);
  if (!v5)
  {
    uint64_t v6 = +[PGLogging sharedLogging];
    v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Trying to localize node with unsupported label/domain: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v5;
}

+ (id)validPOILabels
{
  v5[14] = *MEMORY[0x1E4F143B8];
  v5[0] = @"Restaurant";
  v5[1] = @"Nightlife";
  v5[2] = @"Travel";
  v5[3] = @"Culture";
  v5[4] = @"Museum";
  v5[5] = @"Entertainment";
  v5[6] = @"AmusementPark";
  v5[7] = @"Park";
  v5[8] = @"Performance";
  v5[9] = @"Stadium";
  v5[10] = @"Activity";
  v5[11] = @"Diving";
  v5[12] = @"Hiking";
  v5[13] = @"Hospital";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:14];
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];

  return v3;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:501];
  return v2;
}

@end