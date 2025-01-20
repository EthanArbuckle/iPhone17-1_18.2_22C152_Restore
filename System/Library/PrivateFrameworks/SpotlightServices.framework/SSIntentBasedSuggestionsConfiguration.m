@interface SSIntentBasedSuggestionsConfiguration
- (BOOL)showWebAsTypedSuggestion;
- (int)localSuggestionQuota;
- (int)serverSuggestionQuota;
- (void)setLocalSuggestionQuota:(int)a3;
- (void)setServerSuggestionQuota:(int)a3;
- (void)setShowWebAsTypedSuggestion:(BOOL)a3;
@end

@implementation SSIntentBasedSuggestionsConfiguration

- (BOOL)showWebAsTypedSuggestion
{
  return self->_showWebAsTypedSuggestion;
}

- (void)setShowWebAsTypedSuggestion:(BOOL)a3
{
  self->_showWebAsTypedSuggestion = a3;
}

- (int)localSuggestionQuota
{
  return self->_localSuggestionQuota;
}

- (void)setLocalSuggestionQuota:(int)a3
{
  self->_localSuggestionQuota = a3;
}

- (int)serverSuggestionQuota
{
  return self->_serverSuggestionQuota;
}

- (void)setServerSuggestionQuota:(int)a3
{
  self->_serverSuggestionQuota = a3;
}

@end