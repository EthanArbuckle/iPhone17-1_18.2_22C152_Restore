@interface ATXSuggestionReceiverPendingRefreshTracker
- (ATXSuggestionReceiverPendingRefreshTracker)init;
- (BOOL)shouldForceRefreshForAllUIs;
- (NSMutableDictionary)registeredDelegatesForClientModels;
- (NSMutableDictionary)requestUUIDToClientModelCaches;
- (NSMutableSet)clientModelsThatUpdatedSuggestions;
- (void)setClientModelsThatUpdatedSuggestions:(id)a3;
- (void)setRegisteredDelegatesForClientModels:(id)a3;
- (void)setRequestUUIDToClientModelCaches:(id)a3;
- (void)setShouldForceRefreshForAllUIs:(BOOL)a3;
@end

@implementation ATXSuggestionReceiverPendingRefreshTracker

- (ATXSuggestionReceiverPendingRefreshTracker)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXSuggestionReceiverPendingRefreshTracker;
  v2 = [(ATXSuggestionReceiverPendingRefreshTracker *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    clientModelsThatUpdatedSuggestions = v2->_clientModelsThatUpdatedSuggestions;
    v2->_clientModelsThatUpdatedSuggestions = (NSMutableSet *)v3;

    v2->_shouldForceRefreshForAllUIs = 0;
    uint64_t v5 = objc_opt_new();
    registeredDelegatesForClientModels = v2->_registeredDelegatesForClientModels;
    v2->_registeredDelegatesForClientModels = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    requestUUIDToClientModelCaches = v2->_requestUUIDToClientModelCaches;
    v2->_requestUUIDToClientModelCaches = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (NSMutableSet)clientModelsThatUpdatedSuggestions
{
  return self->_clientModelsThatUpdatedSuggestions;
}

- (void)setClientModelsThatUpdatedSuggestions:(id)a3
{
}

- (BOOL)shouldForceRefreshForAllUIs
{
  return self->_shouldForceRefreshForAllUIs;
}

- (void)setShouldForceRefreshForAllUIs:(BOOL)a3
{
  self->_shouldForceRefreshForAllUIs = a3;
}

- (NSMutableDictionary)registeredDelegatesForClientModels
{
  return self->_registeredDelegatesForClientModels;
}

- (void)setRegisteredDelegatesForClientModels:(id)a3
{
}

- (NSMutableDictionary)requestUUIDToClientModelCaches
{
  return self->_requestUUIDToClientModelCaches;
}

- (void)setRequestUUIDToClientModelCaches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUIDToClientModelCaches, 0);
  objc_storeStrong((id *)&self->_registeredDelegatesForClientModels, 0);
  objc_storeStrong((id *)&self->_clientModelsThatUpdatedSuggestions, 0);
}

@end