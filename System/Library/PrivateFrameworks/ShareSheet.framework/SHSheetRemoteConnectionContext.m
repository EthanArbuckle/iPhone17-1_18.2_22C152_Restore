@interface SHSheetRemoteConnectionContext
- (BOOL)hideSuggestions;
- (BOOL)instantShareSheet;
- (BOOL)isSharePlayAvailable;
- (BOOL)remoteShareSheet;
- (BOOL)shouldSuggestFamilyMembers;
- (BOOL)supportsCollaboration;
- (NSArray)assetIdentifiers;
- (NSArray)peopleSuggestionBundleIds;
- (NSArray)urlsBeingShared;
- (NSData)processedImageResultsData;
- (NSDictionary)sandboxExtensionsByfileURLPath;
- (NSString)sessionIdentifier;
- (SHSheetRemoteConnectionContext)initWithDictionary:(id)a3;
- (SHSheetRemoteConnectionContext)initWithSessionIdentifier:(id)a3;
- (_UIActivityDiscoveryContext)discoveryContext;
- (double)peopleSuggestionsTimeout;
- (id)createContextDictionary;
- (unint64_t)xrRenderingMode;
- (void)setAssetIdentifiers:(id)a3;
- (void)setDiscoveryContext:(id)a3;
- (void)setHideSuggestions:(BOOL)a3;
- (void)setInstantShareSheet:(BOOL)a3;
- (void)setIsSharePlayAvailable:(BOOL)a3;
- (void)setPeopleSuggestionBundleIds:(id)a3;
- (void)setPeopleSuggestionsTimeout:(double)a3;
- (void)setProcessedImageResultsData:(id)a3;
- (void)setRemoteShareSheet:(BOOL)a3;
- (void)setSandboxExtensionsByfileURLPath:(id)a3;
- (void)setShouldSuggestFamilyMembers:(BOOL)a3;
- (void)setSupportsCollaboration:(BOOL)a3;
- (void)setUrlsBeingShared:(id)a3;
- (void)setXrRenderingMode:(unint64_t)a3;
@end

@implementation SHSheetRemoteConnectionContext

- (SHSheetRemoteConnectionContext)initWithSessionIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetRemoteConnectionContext;
  v5 = [(SHSheetRemoteConnectionContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;
  }
  return v5;
}

- (SHSheetRemoteConnectionContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_sessionIdentifier);
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  v7 = [(SHSheetRemoteConnectionContext *)self initWithSessionIdentifier:v6];

  if (v7)
  {
    v8 = NSStringFromSelector(sel_discoveryContext);
    uint64_t v9 = [v4 objectForKeyedSubscript:v8];
    discoveryContext = v7->_discoveryContext;
    v7->_discoveryContext = (_UIActivityDiscoveryContext *)v9;

    v11 = NSStringFromSelector(sel_assetIdentifiers);
    uint64_t v12 = [v4 objectForKeyedSubscript:v11];
    assetIdentifiers = v7->_assetIdentifiers;
    v7->_assetIdentifiers = (NSArray *)v12;

    v14 = NSStringFromSelector(sel_urlsBeingShared);
    uint64_t v15 = [v4 objectForKeyedSubscript:v14];
    urlsBeingShared = v7->_urlsBeingShared;
    v7->_urlsBeingShared = (NSArray *)v15;

    v17 = NSStringFromSelector(sel_sandboxExtensionsByfileURLPath);
    uint64_t v18 = [v4 objectForKeyedSubscript:v17];
    sandboxExtensionsByfileURLPath = v7->_sandboxExtensionsByfileURLPath;
    v7->_sandboxExtensionsByfileURLPath = (NSDictionary *)v18;

    v20 = NSStringFromSelector(sel_shouldSuggestFamilyMembers);
    v21 = [v4 objectForKeyedSubscript:v20];
    v7->_shouldSuggestFamilyMembers = [v21 BOOLValue];

    v22 = NSStringFromSelector(sel_instantShareSheet);
    v23 = [v4 objectForKeyedSubscript:v22];
    v7->_instantShareSheet = [v23 BOOLValue];

    v24 = NSStringFromSelector(sel_remoteShareSheet);
    v25 = [v4 objectForKeyedSubscript:v24];
    v7->_remoteShareSheet = [v25 BOOLValue];

    v26 = NSStringFromSelector(sel_isSharePlayAvailable);
    v27 = [v4 objectForKeyedSubscript:v26];
    v7->_isSharePlayAvailable = [v27 BOOLValue];

    v28 = NSStringFromSelector(sel_supportsCollaboration);
    v29 = [v4 objectForKeyedSubscript:v28];
    v7->_supportsCollaboration = [v29 BOOLValue];

    v30 = NSStringFromSelector(sel_hideSuggestions);
    v31 = [v4 objectForKeyedSubscript:v30];
    v7->_hideSuggestions = [v31 BOOLValue];

    v32 = NSStringFromSelector(sel_peopleSuggestionBundleIds);
    uint64_t v33 = [v4 objectForKeyedSubscript:v32];
    peopleSuggestionBundleIds = v7->_peopleSuggestionBundleIds;
    v7->_peopleSuggestionBundleIds = (NSArray *)v33;

    v35 = NSStringFromSelector(sel_processedImageResultsData);
    uint64_t v36 = [v4 objectForKeyedSubscript:v35];
    processedImageResultsData = v7->_processedImageResultsData;
    v7->_processedImageResultsData = (NSData *)v36;

    v38 = NSStringFromSelector(sel_peopleSuggestionsTimeout);
    v39 = [v4 objectForKeyedSubscript:v38];
    [v39 doubleValue];
    v7->_peopleSuggestionsTimeout = v40;

    v41 = NSStringFromSelector(sel_xrRenderingMode);
    v42 = [v4 objectForKeyedSubscript:v41];
    v7->_xrRenderingMode = [v42 unsignedIntValue];
  }
  return v7;
}

- (id)createContextDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(SHSheetRemoteConnectionContext *)self sessionIdentifier];
  v5 = NSStringFromSelector(sel_sessionIdentifier);
  [v3 setObject:v4 forKeyedSubscript:v5];

  uint64_t v6 = [(SHSheetRemoteConnectionContext *)self discoveryContext];
  v7 = NSStringFromSelector(sel_discoveryContext);
  [v3 setObject:v6 forKeyedSubscript:v7];

  v8 = [(SHSheetRemoteConnectionContext *)self assetIdentifiers];
  uint64_t v9 = NSStringFromSelector(sel_assetIdentifiers);
  [v3 setObject:v8 forKeyedSubscript:v9];

  v10 = [(SHSheetRemoteConnectionContext *)self urlsBeingShared];
  v11 = NSStringFromSelector(sel_urlsBeingShared);
  [v3 setObject:v10 forKeyedSubscript:v11];

  uint64_t v12 = [(SHSheetRemoteConnectionContext *)self sandboxExtensionsByfileURLPath];
  v13 = NSStringFromSelector(sel_sandboxExtensionsByfileURLPath);
  [v3 setObject:v12 forKeyedSubscript:v13];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext shouldSuggestFamilyMembers](self, "shouldSuggestFamilyMembers"));
  uint64_t v15 = NSStringFromSelector(sel_shouldSuggestFamilyMembers);
  [v3 setObject:v14 forKeyedSubscript:v15];

  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext instantShareSheet](self, "instantShareSheet"));
  v17 = NSStringFromSelector(sel_instantShareSheet);
  [v3 setObject:v16 forKeyedSubscript:v17];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext remoteShareSheet](self, "remoteShareSheet"));
  v19 = NSStringFromSelector(sel_remoteShareSheet);
  [v3 setObject:v18 forKeyedSubscript:v19];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext isSharePlayAvailable](self, "isSharePlayAvailable"));
  v21 = NSStringFromSelector(sel_isSharePlayAvailable);
  [v3 setObject:v20 forKeyedSubscript:v21];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext supportsCollaboration](self, "supportsCollaboration"));
  v23 = NSStringFromSelector(sel_supportsCollaboration);
  [v3 setObject:v22 forKeyedSubscript:v23];

  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[SHSheetRemoteConnectionContext hideSuggestions](self, "hideSuggestions"));
  v25 = NSStringFromSelector(sel_hideSuggestions);
  [v3 setObject:v24 forKeyedSubscript:v25];

  v26 = [(SHSheetRemoteConnectionContext *)self peopleSuggestionBundleIds];
  v27 = NSStringFromSelector(sel_peopleSuggestionBundleIds);
  [v3 setObject:v26 forKeyedSubscript:v27];

  v28 = [(SHSheetRemoteConnectionContext *)self processedImageResultsData];
  v29 = NSStringFromSelector(sel_processedImageResultsData);
  [v3 setObject:v28 forKeyedSubscript:v29];

  v30 = NSNumber;
  [(SHSheetRemoteConnectionContext *)self peopleSuggestionsTimeout];
  v31 = objc_msgSend(v30, "numberWithDouble:");
  v32 = NSStringFromSelector(sel_peopleSuggestionsTimeout);
  [v3 setObject:v31 forKeyedSubscript:v32];

  uint64_t v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SHSheetRemoteConnectionContext xrRenderingMode](self, "xrRenderingMode"));
  v34 = NSStringFromSelector(sel_xrRenderingMode);
  [v3 setObject:v33 forKeyedSubscript:v34];

  return v3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (_UIActivityDiscoveryContext)discoveryContext
{
  return self->_discoveryContext;
}

- (void)setDiscoveryContext:(id)a3
{
}

- (NSArray)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (void)setAssetIdentifiers:(id)a3
{
}

- (NSArray)urlsBeingShared
{
  return self->_urlsBeingShared;
}

- (void)setUrlsBeingShared:(id)a3
{
}

- (NSDictionary)sandboxExtensionsByfileURLPath
{
  return self->_sandboxExtensionsByfileURLPath;
}

- (void)setSandboxExtensionsByfileURLPath:(id)a3
{
}

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (BOOL)isSharePlayAvailable
{
  return self->_isSharePlayAvailable;
}

- (void)setIsSharePlayAvailable:(BOOL)a3
{
  self->_isSharePlayAvailable = a3;
}

- (BOOL)supportsCollaboration
{
  return self->_supportsCollaboration;
}

- (void)setSupportsCollaboration:(BOOL)a3
{
  self->_supportsCollaboration = a3;
}

- (BOOL)hideSuggestions
{
  return self->_hideSuggestions;
}

- (void)setHideSuggestions:(BOOL)a3
{
  self->_hideSuggestions = a3;
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
}

- (NSData)processedImageResultsData
{
  return self->_processedImageResultsData;
}

- (void)setProcessedImageResultsData:(id)a3
{
}

- (double)peopleSuggestionsTimeout
{
  return self->_peopleSuggestionsTimeout;
}

- (void)setPeopleSuggestionsTimeout:(double)a3
{
  self->_peopleSuggestionsTimeout = a3;
}

- (unint64_t)xrRenderingMode
{
  return self->_xrRenderingMode;
}

- (void)setXrRenderingMode:(unint64_t)a3
{
  self->_xrRenderingMode = a3;
}

- (BOOL)instantShareSheet
{
  return self->_instantShareSheet;
}

- (void)setInstantShareSheet:(BOOL)a3
{
  self->_instantShareSheet = a3;
}

- (BOOL)remoteShareSheet
{
  return self->_remoteShareSheet;
}

- (void)setRemoteShareSheet:(BOOL)a3
{
  self->_remoteShareSheet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedImageResultsData, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionsByfileURLPath, 0);
  objc_storeStrong((id *)&self->_urlsBeingShared, 0);
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);
  objc_storeStrong((id *)&self->_discoveryContext, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end