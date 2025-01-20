@interface _PSZKWFTPrimaryInteractionsConfig
- (BOOL)isEnabled;
- (NSArray)bundleIds;
- (NSArray)interactionCountMaxDepths;
- (NSArray)interactionHistoryRelativeStartDates;
- (NSArray)mechanisms;
- (_PSZKWFTPrimaryInteractionsConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 mechanisms:(id)a5 interactionCountMaxDepths:(id)a6 interactionHistoryRelativeStartDates:(id)a7 bundleIds:(id)a8 modelType:(int64_t)a9 clusterPruneThreshold:(unint64_t)a10 maxSuggestions:(unint64_t)a11;
- (_PSZKWFTPrimaryInteractionsConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 modelType:(int64_t)a5;
- (int64_t)defaultConfidenceCategory;
- (int64_t)modelType;
- (unint64_t)clusterPruneThreshold;
- (unint64_t)maxSuggestions;
@end

@implementation _PSZKWFTPrimaryInteractionsConfig

- (_PSZKWFTPrimaryInteractionsConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 mechanisms:(id)a5 interactionCountMaxDepths:(id)a6 interactionHistoryRelativeStartDates:(id)a7 bundleIds:(id)a8 modelType:(int64_t)a9 clusterPruneThreshold:(unint64_t)a10 maxSuggestions:(unint64_t)a11
{
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_PSZKWFTPrimaryInteractionsConfig;
  v21 = [(_PSZKWFTPrimaryInteractionsConfig *)&v25 init];
  v22 = v21;
  if (v21)
  {
    v21->_isEnabled = a3;
    v21->_defaultConfidenceCategory = a4;
    objc_storeStrong((id *)&v21->_mechanisms, a5);
    objc_storeStrong((id *)&v22->_interactionCountMaxDepths, a6);
    objc_storeStrong((id *)&v22->_interactionHistoryRelativeStartDates, a7);
    objc_storeStrong((id *)&v22->_bundleIds, a8);
    v22->_modelType = a9;
    v22->_maxSuggestions = a11;
    v22->_clusterPruneThreshold = a10;
  }

  return v22;
}

- (_PSZKWFTPrimaryInteractionsConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 modelType:(int64_t)a5
{
  BOOL v30 = a3;
  v33[2] = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF6764B8];
  v27 = v26 = v5;
  [v5 addObject:v27];
  v9 = [NSNumber numberWithInt:1000];
  [v6 addObject:v9];

  v10 = [NSNumber numberWithInt:0];
  [v7 addObject:v10];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v12 = +[_PSConstants mobileFacetimeBundleId];
  v33[0] = v12;
  v13 = +[_PSConstants macFacetimeBundleId];
  v33[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v15 = [v11 setWithArray:v14];

  [v8 addObject:v15];
  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EF675918];
  [v5 addObject:v16];
  id v17 = [NSNumber numberWithInt:1500];
  [v6 addObject:v17];

  id v18 = [NSNumber numberWithInt:4294967293];
  [v7 addObject:v18];

  id v19 = (void *)MEMORY[0x1E4F1CAD0];
  id v20 = +[_PSConstants mobileMessagesBundleId];
  v32[0] = v20;
  v21 = +[_PSConstants macMessagesBundleId];
  v32[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v23 = [v19 setWithArray:v22];

  [v8 addObject:v23];
  v24 = [(_PSZKWFTPrimaryInteractionsConfig *)self initWithIsEnabled:v30 defaultConfidenceCategory:a4 mechanisms:v26 interactionCountMaxDepths:v6 interactionHistoryRelativeStartDates:v7 bundleIds:v8 modelType:a5 clusterPruneThreshold:5 maxSuggestions:12];

  return v24;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (int64_t)defaultConfidenceCategory
{
  return self->_defaultConfidenceCategory;
}

- (NSArray)mechanisms
{
  return self->_mechanisms;
}

- (NSArray)interactionCountMaxDepths
{
  return self->_interactionCountMaxDepths;
}

- (NSArray)interactionHistoryRelativeStartDates
{
  return self->_interactionHistoryRelativeStartDates;
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (unint64_t)maxSuggestions
{
  return self->_maxSuggestions;
}

- (unint64_t)clusterPruneThreshold
{
  return self->_clusterPruneThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_interactionHistoryRelativeStartDates, 0);
  objc_storeStrong((id *)&self->_interactionCountMaxDepths, 0);

  objc_storeStrong((id *)&self->_mechanisms, 0);
}

@end