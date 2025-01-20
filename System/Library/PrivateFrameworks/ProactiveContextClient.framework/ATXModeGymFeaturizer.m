@interface ATXModeGymFeaturizer
- (ATXModeFeaturizerDelegate)delegate;
- (ATXModeGymFeaturizer)init;
- (ATXPOICategoryVisitDataProvider)dataProvider;
- (id)provideFeatures;
- (void)beginListening;
- (void)handleChange;
- (void)setDataProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopListening;
@end

@implementation ATXModeGymFeaturizer

- (ATXModeGymFeaturizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXModeGymFeaturizer;
  v2 = [(ATXModeGymFeaturizer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dataProvider = v2->_dataProvider;
    v2->_dataProvider = (ATXPOICategoryVisitDataProvider *)v3;
  }
  return v2;
}

- (id)provideFeatures
{
  uint64_t v3 = objc_alloc_init(ATXModeFeatureSet);
  v4 = [(ATXModeGymFeaturizer *)self dataProvider];
  v5 = [v4 getCurrentVisit];

  if (v5)
  {
    objc_super v6 = [v5 possibleCategoryNames];
    v7 = [v6 firstObject];

    if ([v7 isEqualToString:*MEMORY[0x1E4F64000]]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = [v7 isEqualToString:@"gym"];
    }
    [(ATXModeFeatureSet *)v3 setValue:v8 forBinaryFeatureOfType:24];
  }
  else
  {
    [(ATXModeFeatureSet *)v3 setValue:0 forBinaryFeatureOfType:24];
  }

  return v3;
}

- (void)beginListening
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ATXModeGymFeaturizer *)self dataProvider];
  v5[0] = *MEMORY[0x1E4F64000];
  v5[1] = @"gym";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  [v3 subscribeToPOIChangesForCategories:v4 observer:self enterSelector:sel_handleChange exitSelector:sel_handleChange sinkCompletion:&__block_literal_global_7];
}

void __38__ATXModeGymFeaturizer_beginListening__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __38__ATXModeGymFeaturizer_beginListening__block_invoke_cold_1(v2, v4);
    }
  }
}

- (void)stopListening
{
  id v2 = [(ATXModeGymFeaturizer *)self dataProvider];
  [v2 unsubscribeToPOIChanges];
}

- (void)handleChange
{
  id v4 = [(ATXModeGymFeaturizer *)self provideFeatures];
  uint64_t v3 = [(ATXModeGymFeaturizer *)self delegate];
  [v3 featurizer:self didUpdateFeatures:v4];
}

- (ATXModeFeaturizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXModeFeaturizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ATXPOICategoryVisitDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __38__ATXModeGymFeaturizer_beginListening__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_ERROR, "ATXModeGymFeaturizer: error subscribing to stream: %@", (uint8_t *)&v4, 0xCu);
}

@end