@interface PPSocialHighlightStorageGuardedData
- (void)addToBloomFilter:(uint64_t)a1;
- (void)sendEvent:(uint64_t)a1;
@end

@implementation PPSocialHighlightStorageGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackStreamBloomFilter, 0);
  objc_storeStrong((id *)&self->feedbackStream, 0);
}

- (void)sendEvent:(uint64_t)a1
{
  if (a1)
  {
    v3 = *(void **)(a1 + 8);
    id v5 = a2;
    v4 = [v3 source];
    [v4 sendEvent:v5];

    -[PPSocialHighlightStorageGuardedData addToBloomFilter:](a1, v5);
  }
}

- (void)addToBloomFilter:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && *(void *)(a1 + 16))
  {
    v4 = (void *)MEMORY[0x1E4F937A0];
    id v11 = v3;
    id v5 = [v3 highlight];
    v6 = [v5 sourceBundleId];
    v7 = [v11 highlight];
    v8 = [v7 domainIdentifier];
    v9 = [v11 highlight];
    v10 = [v9 attributionIdentifier];
    [v4 addDeletableContentWithBundleIdentifier:v6 domainIdentifier:v8 uniqueIdentifier:v10 toBloomFilter:*(void *)(a1 + 16)];

    id v3 = v11;
    ++*(void *)(a1 + 24);
  }
}

@end