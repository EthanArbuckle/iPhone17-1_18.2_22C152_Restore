@interface GKTrimSuggestionsModifier
- (GKFriendSuggesterSettings)settings;
- (GKTrimSuggestionsModifier)initWithSettings:(id)a3;
- (id)trimSuggestions:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation GKTrimSuggestionsModifier

- (GKTrimSuggestionsModifier)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKTrimSuggestionsModifier;
  v6 = [(GKTrimSuggestionsModifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (id)trimSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [(GKTrimSuggestionsModifier *)self settings];
  id v6 = [v5 suggestionsLimit];

  id v7 = [v4 count];
  if (v6 >= v7) {
    id v8 = v7;
  }
  else {
    id v8 = v6;
  }
  objc_super v9 = [v4 subarrayWithRange:0, v8];

  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  v11 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    v14 = "-[GKTrimSuggestionsModifier trimSuggestions:]";
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s trimmedResults: %@", (uint8_t *)&v13, 0x16u);
  }

  return v9;
}

- (GKFriendSuggesterSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end