@interface PXPhotoKitPersonSuggestion
+ (id)personSuggestionWithPerson:(id)a3;
+ (id)personSuggestionWithPerson:(id)a3 keyFaceFetchResult:(id)a4;
+ (id)personSuggestionWithPerson:(id)a3 keyFaceFetchResult:(id)a4 keyAssetFetchResult:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesRecipientInRecipients:(id)a3;
- (NSString)description;
- (NSString)localizedName;
- (PHFetchResult)keyAssetFetchResult;
- (PHFetchResult)keyFaceFetchResult;
- (PHPerson)person;
- (PXPhotoKitPersonSuggestion)init;
- (PXPhotoKitPersonSuggestion)initWithPerson:(id)a3 keyFaceFetchResult:(id)a4 keyAssetFetchResult:(id)a5;
- (id)_linkedContactForPerson:(id)a3;
- (id)personSuggestionUpdatedKeyAssetFetchResult:(id)a3;
- (id)personSuggestionUpdatedKeyFaceFetchResult:(id)a3;
- (id)personSuggestionUpdatedPerson:(id)a3;
- (unint64_t)hash;
- (void)_fetchQueue_fetchLinkedContactForPerson:(id)a3;
- (void)_prefetchLinkedContactInBackgroundForPerson:(id)a3;
- (void)fetchContactAndBestTransport:(id)a3;
- (void)setPrefetchedContact:(id)a3;
@end

@implementation PXPhotoKitPersonSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_keyFaceFetchResult, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_fetchQueue_bestTransport, 0);
  objc_storeStrong((id *)&self->_fetchQueue_prefetchedContact, 0);
  objc_storeStrong((id *)&self->_fetchQueue_linkedContact, 0);
}

- (PHFetchResult)keyAssetFetchResult
{
  return self->_keyAssetFetchResult;
}

- (PHFetchResult)keyFaceFetchResult
{
  return self->_keyFaceFetchResult;
}

- (PHPerson)person
{
  return self->_person;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PXPhotoKitPersonSuggestion;
  v3 = [(PXPhotoKitPersonSuggestion *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" localized name: %@ person: %@, key face: %@, key asset: %@>", self->_localizedName, self->_person, self->_keyFaceFetchResult, self->_keyAssetFetchResult];

  return (NSString *)v4;
}

- (unint64_t)hash
{
  v2 = [(PXPhotoKitPersonSuggestion *)self person];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_super v6 = [(PXPhotoKitPersonSuggestion *)self person];
    v7 = [v5 person];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_prefetchLinkedContactInBackgroundForPerson:(id)a3
{
  id v4 = a3;
  id v5 = _ContactFetchQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PXPhotoKitPersonSuggestion__prefetchLinkedContactInBackgroundForPerson___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __74__PXPhotoKitPersonSuggestion__prefetchLinkedContactInBackgroundForPerson___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchQueue_fetchLinkedContactForPerson:", *(void *)(a1 + 40));
}

- (void)_fetchQueue_fetchLinkedContactForPerson:(id)a3
{
  id v10 = a3;
  id v4 = _ContactFetchQueue();
  dispatch_assert_queue_V2(v4);

  fetchQueue_prefetchedContact = self->_fetchQueue_prefetchedContact;
  if (self->_fetchQueue_checkedForLinkedContact)
  {
    if (!fetchQueue_prefetchedContact) {
      goto LABEL_8;
    }
    self->_fetchQueue_checkedForLinkedContact = 1;
    goto LABEL_5;
  }
  self->_fetchQueue_checkedForLinkedContact = 1;
  if (fetchQueue_prefetchedContact)
  {
LABEL_5:
    id v6 = fetchQueue_prefetchedContact;
    goto LABEL_6;
  }
  id v6 = [(PXPhotoKitPersonSuggestion *)self _linkedContactForPerson:v10];
LABEL_6:
  fetchQueue_linkedContact = self->_fetchQueue_linkedContact;
  self->_fetchQueue_linkedContact = v6;

  if (self->_fetchQueue_linkedContact)
  {
    +[PXRecipientTransportUtilities px_bestMessagingTransportForContact:](PXRecipientTransportUtilities, "px_bestMessagingTransportForContact:");
    id v8 = (PXRecipientTransport *)objc_claimAutoreleasedReturnValue();
    fetchQueue_bestTransport = self->_fetchQueue_bestTransport;
    self->_fetchQueue_bestTransport = v8;
  }
LABEL_8:
}

- (id)_linkedContactForPerson:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1AEE0];
  uint64_t v10 = *MEMORY[0x1E4F1ADC8];
  uint64_t v11 = v3;
  id v4 = (void *)MEMORY[0x1E4F1BBA8];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "descriptorForRequiredKeys", v10, v11);
  v12 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:3];

  id v8 = [v5 linkedContactWithKeysToFetch:v7];

  return v8;
}

- (BOOL)matchesRecipientInRecipients:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXPhotoKitPersonSuggestion *)self person];
  id v6 = objc_msgSend(v5, "px_localizedName");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "contact", (void)v15);
        v12 = objc_msgSend(MEMORY[0x1E4F391F0], "px_localizedNameFromContact:", v11);
        char v13 = [v6 isEqualToString:v12];

        if (v13)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)fetchContactAndBestTransport:(id)a3
{
  id v5 = (void (**)(id, uint64_t, uint64_t))a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitPersonSuggestion.m", 101, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__122888;
  v24 = __Block_byref_object_dispose__122889;
  id v25 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__122888;
  long long v18 = __Block_byref_object_dispose__122889;
  id v19 = 0;
  id v6 = [(PXPhotoKitPersonSuggestion *)self person];
  id v7 = _ContactFetchQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PXPhotoKitPersonSuggestion_fetchContactAndBestTransport___block_invoke;
  block[3] = &unk_1E5DBC600;
  block[4] = self;
  id v8 = v6;
  id v11 = v8;
  v12 = &v20;
  char v13 = &v14;
  dispatch_sync(v7, block);

  v5[2](v5, v21[5], v15[5]);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __59__PXPhotoKitPersonSuggestion_fetchContactAndBestTransport___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fetchQueue_fetchLinkedContactForPerson:", *(void *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (void)setPrefetchedContact:(id)a3
{
  id v4 = a3;
  id v5 = _ContactFetchQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PXPhotoKitPersonSuggestion_setPrefetchedContact___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __51__PXPhotoKitPersonSuggestion_setPrefetchedContact___block_invoke(uint64_t a1)
{
}

- (id)personSuggestionUpdatedPerson:(id)a3
{
  id v4 = a3;
  id v5 = [[PXPhotoKitPersonSuggestion alloc] initWithPerson:v4 keyFaceFetchResult:self->_keyFaceFetchResult keyAssetFetchResult:self->_keyAssetFetchResult];

  return v5;
}

- (id)personSuggestionUpdatedKeyAssetFetchResult:(id)a3
{
  id v4 = a3;
  id v5 = [[PXPhotoKitPersonSuggestion alloc] initWithPerson:self->_person keyFaceFetchResult:self->_keyFaceFetchResult keyAssetFetchResult:v4];

  return v5;
}

- (id)personSuggestionUpdatedKeyFaceFetchResult:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (void *)MEMORY[0x1E4F38EB8];
    id v6 = [v4 firstObject];
    v11[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v8 = [v5 fetchAssetsForFaces:v7 options:0];
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [[PXPhotoKitPersonSuggestion alloc] initWithPerson:self->_person keyFaceFetchResult:v4 keyAssetFetchResult:v8];

  return v9;
}

- (PXPhotoKitPersonSuggestion)initWithPerson:(id)a3 keyFaceFetchResult:(id)a4 keyAssetFetchResult:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXPhotoKitPersonSuggestion.m", 49, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)PXPhotoKitPersonSuggestion;
  char v13 = [(PXPhotoKitPersonSuggestion *)&v20 init];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_person, a3);
    long long v15 = objc_msgSend(v10, "px_localizedName");
    uint64_t v16 = [v15 copy];
    localizedName = v14->_localizedName;
    v14->_localizedName = (NSString *)v16;

    objc_storeStrong((id *)&v14->_keyFaceFetchResult, a4);
    objc_storeStrong((id *)&v14->_keyAssetFetchResult, a5);
    [(PXPhotoKitPersonSuggestion *)v14 _prefetchLinkedContactInBackgroundForPerson:v10];
  }

  return v14;
}

- (PXPhotoKitPersonSuggestion)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitPersonSuggestion.m", 45, @"%s is not available as initializer", "-[PXPhotoKitPersonSuggestion init]");

  abort();
}

+ (id)personSuggestionWithPerson:(id)a3 keyFaceFetchResult:(id)a4 keyAssetFetchResult:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[PXPhotoKitPersonSuggestion alloc] initWithPerson:v9 keyFaceFetchResult:v8 keyAssetFetchResult:v7];

  return v10;
}

+ (id)personSuggestionWithPerson:(id)a3 keyFaceFetchResult:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = (void *)MEMORY[0x1E4F38EB8];
    id v8 = [v6 firstObject];
    v13[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v10 = [v7 fetchAssetsForFaces:v9 options:0];
  }
  else
  {
    id v10 = 0;
  }
  id v11 = +[PXPhotoKitPersonSuggestion personSuggestionWithPerson:v5 keyFaceFetchResult:v6 keyAssetFetchResult:v10];

  return v11;
}

+ (id)personSuggestionWithPerson:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F39050];
  id v4 = a3;
  id v5 = [v3 fetchKeyFaceForPerson:v4 options:0];
  id v6 = +[PXPhotoKitPersonSuggestion personSuggestionWithPerson:v4 keyFaceFetchResult:v5];

  return v6;
}

@end