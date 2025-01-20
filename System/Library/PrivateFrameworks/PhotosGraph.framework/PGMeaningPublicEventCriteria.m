@interface PGMeaningPublicEventCriteria
+ (id)_publicEventCategoryForPublicEventCategoryName:(id)a3;
+ (id)criteriaKey;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)isValid;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSString)description;
- (NSString)publicEventCategory;
- (NSString)publicEventCategoryNameString;
- (void)setPublicEventCategory:(id)a3;
- (void)setPublicEventCategoryNameString:(id)a3;
@end

@implementation PGMeaningPublicEventCriteria

+ (id)_publicEventCategoryForPublicEventCategoryName:(id)a3
{
  v25[13] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v24[0] = @"musicConcerts";
  v21 = [MEMORY[0x1E4F76D68] musicConcerts];
  v25[0] = v21;
  v24[1] = @"nightLife";
  v20 = [MEMORY[0x1E4F76D68] nightLife];
  v25[1] = v20;
  v24[2] = @"theater";
  v19 = [MEMORY[0x1E4F76D68] theater];
  v25[2] = v19;
  v24[3] = @"dance";
  v17 = [MEMORY[0x1E4F76D68] dance];
  v25[3] = v17;
  v24[4] = @"festivalsAndFairs";
  v3 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
  v25[4] = v3;
  v24[5] = @"artsAndMuseums";
  v4 = [MEMORY[0x1E4F76D68] artsAndMuseums];
  v25[5] = v4;
  v24[6] = @"sports";
  v5 = [MEMORY[0x1E4F76D68] sports];
  v25[6] = v5;
  v24[7] = @"businessAndTechnology";
  v6 = [MEMORY[0x1E4F76D68] businessAndTechnology];
  v25[7] = v6;
  v24[8] = @"community";
  v7 = [MEMORY[0x1E4F76D68] community];
  v25[8] = v7;
  v24[9] = @"educational";
  v8 = [MEMORY[0x1E4F76D68] educational];
  v25[9] = v8;
  v24[10] = @"familyEvents";
  v9 = [MEMORY[0x1E4F76D68] familyEvents];
  v25[10] = v9;
  v24[11] = @"tours";
  v10 = [MEMORY[0x1E4F76D68] tours];
  v25[11] = v10;
  v24[12] = @"appleEvents";
  v11 = [MEMORY[0x1E4F76D68] appleEvents];
  v25[12] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:13];

  v13 = [v12 objectForKeyedSubscript:v18];
  if (!v13)
  {
    v14 = +[PGLogging sharedLogging];
    v15 = [v14 loggingConnection];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v18;
      _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid public event category name \"%@\"", buf, 0xCu);
    }
  }
  return v13;
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"publicEventCategory"];

  if (v6)
  {
    [v5 setPublicEventCategoryNameString:v6];
    v7 = [a1 _publicEventCategoryForPublicEventCategoryName:v6];
    [v5 setPublicEventCategory:v7];
  }
  return v5;
}

+ (id)criteriaKey
{
  return @"PublicEvent";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventCategoryNameString, 0);
  objc_storeStrong((id *)&self->_publicEventCategory, 0);
}

- (void)setPublicEventCategoryNameString:(id)a3
{
}

- (NSString)publicEventCategoryNameString
{
  return self->_publicEventCategoryNameString;
}

- (void)setPublicEventCategory:(id)a3
{
}

- (NSString)publicEventCategory
{
  return self->_publicEventCategory;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(PGMeaningPublicEventCriteria *)self publicEventCategory];
  id v4 = [v2 stringWithFormat:@"publicEventCategory: %@\n", v3];

  return (NSString *)v4;
}

- (BOOL)isValid
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(PGMeaningPublicEventCriteria *)self publicEventCategory];

  if (!v3)
  {
    id v4 = +[PGLogging sharedLogging];
    id v5 = [v4 loggingConnection];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(PGMeaningPublicEventCriteria *)self publicEventCategoryNameString];
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid public event category name \"%@\"", (uint8_t *)&v8, 0xCu);
    }
  }
  return v3 != 0;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PGMeaningPublicEventCriteria *)self publicEventCategory];

  if (v8)
  {
    v9 = [(PGMeaningPublicEventCriteria *)self publicEventCategory];
    uint64_t v10 = [v6 graph];
    v11 = +[PGGraphPublicEventCategoryNodeCollection publicEventCategoryNodesForCategory:v9 inGraph:v10];

    if ([v11 count])
    {
      v12 = [v7 publicEventCategoryNodes];
      char v13 = [v12 intersectsCollection:v11];
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

@end