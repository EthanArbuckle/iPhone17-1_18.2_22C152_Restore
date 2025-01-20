@interface TUMetadataClientController
+ (TUMetadataClientController)sharedInstance;
- (TUMetadataCache)metadataCache;
- (TUMetadataClientController)init;
- (id)_metadataDestinationIdForSearchItem:(id)a3;
- (id)directoryLabelForDestinationID:(id)a3;
- (id)directoryLabelForSearchItem:(id)a3;
- (id)locationForDestinationID:(id)a3;
- (id)locationForSearchItem:(id)a3;
- (id)suggestionForDestinationID:(id)a3;
- (id)suggestionForSearchItem:(id)a3;
- (void)setMetadataCache:(id)a3;
- (void)updateMetadataForCall:(id)a3;
- (void)updateMetadataForCall:(id)a3 completion:(id)a4;
- (void)updateMetadataForDestinationID:(id)a3;
- (void)updateMetadataForDestinationID:(id)a3 completion:(id)a4;
- (void)updateMetadataForRecentCalls:(id)a3;
- (void)updateMetadataForRecentCalls:(id)a3 completion:(id)a4;
@end

@implementation TUMetadataClientController

uint64_t __44__TUMetadataClientController_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (TUMetadataClientController)init
{
  v13.receiver = self;
  v13.super_class = (Class)TUMetadataClientController;
  v2 = [(TUMetadataClientController *)&v13 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F1CA48];
    v4 = objc_alloc_init(TUCallDirectoryMetadataCacheDataProvider);
    v5 = objc_alloc_init(TUSuggestionsMetadataCacheDataProvider);
    v6 = objc_alloc_init(TUGeoLocationMetadataCacheDataProvider);
    v7 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, 0);

    v8 = [TUMetadataCache alloc];
    v9 = (void *)[v7 copy];
    uint64_t v10 = [(TUMetadataCache *)v8 initWithDataProviders:v9];
    metadataCache = v2->_metadataCache;
    v2->_metadataCache = (TUMetadataCache *)v10;
  }
  return v2;
}

- (void)updateMetadataForRecentCalls:(id)a3 completion:(id)a4
{
  id v8 = a4;
  v6 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCalls:a3];
  if ([v6 count])
  {
    v7 = [(TUMetadataClientController *)self metadataCache];
    [v7 updateCacheWithDestinationIDs:v6 completion:v8];
  }
}

- (void)updateMetadataForRecentCalls:(id)a3
{
}

- (TUMetadataCache)metadataCache
{
  return self->_metadataCache;
}

+ (TUMetadataClientController)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__TUMetadataClientController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return (TUMetadataClientController *)v2;
}

- (id)suggestionForDestinationID:(id)a3
{
  id v4 = a3;
  v5 = [(TUMetadataClientController *)self metadataCache];
  v6 = [v5 metadataForDestinationID:v4];

  v7 = [v6 metadataForProvider:objc_opt_class()];

  return v7;
}

- (id)locationForDestinationID:(id)a3
{
  id v4 = a3;
  v5 = [(TUMetadataClientController *)self metadataCache];
  v6 = [v5 metadataForDestinationID:v4];

  v7 = [v6 metadataForProvider:objc_opt_class()];

  return v7;
}

- (id)directoryLabelForDestinationID:(id)a3
{
  id v4 = a3;
  v5 = [(TUMetadataClientController *)self metadataCache];
  v6 = [v5 metadataForDestinationID:v4];

  v7 = [v6 metadataForProvider:objc_opt_class()];

  return v7;
}

- (id)suggestionForSearchItem:(id)a3
{
  id v4 = [(TUMetadataClientController *)self _metadataDestinationIdForSearchItem:a3];
  if (v4)
  {
    v5 = [(TUMetadataClientController *)self suggestionForDestinationID:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)locationForSearchItem:(id)a3
{
  id v4 = [(TUMetadataClientController *)self _metadataDestinationIdForSearchItem:a3];
  if (v4)
  {
    v5 = [(TUMetadataClientController *)self locationForDestinationID:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)directoryLabelForSearchItem:(id)a3
{
  id v4 = [(TUMetadataClientController *)self _metadataDestinationIdForSearchItem:a3];
  if (v4)
  {
    v5 = [(TUMetadataClientController *)self directoryLabelForDestinationID:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_metadataDestinationIdForSearchItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 recentCall];
    v5 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:v4];
    v6 = [v5 firstObject];
LABEL_13:
    id v8 = v6;
    goto LABEL_14;
  }
  id v4 = [v3 destinationId];
  if (![v4 length])
  {
    id v8 = 0;
    goto LABEL_15;
  }
  if ([v4 destinationIdIsEmailAddress])
  {
    uint64_t v7 = +[TUHandle normalizedEmailAddressHandleForValue:v4];
    goto LABEL_11;
  }
  if (![v4 destinationIdIsPhoneNumber])
  {
    uint64_t v7 = +[TUHandle normalizedGenericHandleForValue:v4];
LABEL_11:
    v5 = (void *)v7;
    if (v7) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v9 = [v3 isoCountryCode];
  v5 = +[TUHandle normalizedPhoneNumberHandleForValue:v4 isoCountryCode:v9];

  if (v5)
  {
LABEL_12:
    v6 = [[TUMetadataDestinationID alloc] initWithHandle:v5];
    goto LABEL_13;
  }
LABEL_9:
  id v8 = 0;
LABEL_14:

LABEL_15:

  return v8;
}

- (void)updateMetadataForCall:(id)a3
{
}

- (void)updateMetadataForCall:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v6 = +[TUMetadataDestinationID metadataDestinationIDForCall:a3];
  if (v6) {
    [(TUMetadataClientController *)self updateMetadataForDestinationID:v6 completion:v7];
  }
}

- (void)updateMetadataForDestinationID:(id)a3
{
}

- (void)updateMetadataForDestinationID:(id)a3 completion:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUMetadataClientController *)self metadataCache];
  v10[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  [v8 updateCacheForEmptyDataProvidersWithDestinationIDs:v9 completion:v6];
}

- (void)setMetadataCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end