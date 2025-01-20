@interface ATXProactiveCardSuggestionClient
- (ATXProactiveCardSuggestionClient)initWithSourceId:(id)a3;
- (id)createSuggestionWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intent:(id)a11 metadata:(id)a12;
- (void)clearSuggestions;
- (void)clearSuggestionsWithCompletionHandler:(id)a3;
- (void)retrieveCurrentSuggestionsWithReply:(id)a3;
- (void)updateSuggestions:(id)a3;
- (void)updateSuggestions:(id)a3 completionHandler:(id)a4;
@end

@implementation ATXProactiveCardSuggestionClient

- (ATXProactiveCardSuggestionClient)initWithSourceId:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXProactiveCardSuggestionClient;
  v5 = [(ATXProactiveCardSuggestionClient *)&v11 init];
  if (v5)
  {
    v6 = [[ATXProactiveSuggestionClientModel alloc] initWithClientModelId:v4 requestDelegate:0];
    clientModel = v5->_clientModel;
    v5->_clientModel = v6;

    uint64_t v8 = [v4 copy];
    sourceId = v5->_sourceId;
    v5->_sourceId = (NSString *)v8;
  }
  return v5;
}

- (void)updateSuggestions:(id)a3
{
}

- (void)updateSuggestions:(id)a3 completionHandler:(id)a4
{
}

- (void)clearSuggestions
{
}

- (void)clearSuggestionsWithCompletionHandler:(id)a3
{
}

- (void)retrieveCurrentSuggestionsWithReply:(id)a3
{
}

- (id)createSuggestionWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intent:(id)a11 metadata:(id)a12
{
  id v38 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  if (v20)
  {
    if (v21) {
      goto LABEL_3;
    }
  }
  else
  {
    id v20 = [MEMORY[0x1E4F1C9C8] now];
    if (v21) {
      goto LABEL_3;
    }
  }
  id v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:3600.0];
LABEL_3:
  INIntentWithTypedIntent();
  v24 = v34 = v22;
  id v32 = v23;
  v25 = v38;
  v33 = v23;
  v26 = v16;
  v27 = [[ATXInfoSuggestion alloc] initWithAppBundleIdentifier:v38 widgetBundleIdentifier:v16 widgetKind:v17 criterion:v18 applicableLayouts:a7 suggestionIdentifier:v19 startDate:v20 endDate:v21 intent:v24 metadata:v32 relevanceScore:0];
  [(ATXInfoSuggestion *)v27 setSourceIdentifier:self->_sourceId];
  v36 = v17;
  if (!v19)
  {
    v28 = [MEMORY[0x1E4F29128] UUID];
    v29 = [v28 UUIDString];
    [(ATXInfoSuggestion *)v27 setSuggestionIdentifier:v29];

    v25 = v38;
  }
  v30 = +[ATXInfoSuggestion proactiveSuggestionForInfoSuggestion:v27 withClientModelId:self->_sourceId clientModelVersion:@"0.1.0" rawScore:0 confidenceCategory:0.0];

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_clientModel, 0);
}

@end