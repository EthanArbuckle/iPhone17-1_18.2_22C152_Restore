@interface ICPlaybackPositionEntity
@end

@implementation ICPlaybackPositionEntity

void __49__ICPlaybackPositionEntity_SBCPrivate__sbcEntity__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  v6 = [v12 libraryUID];
  v7 = [*(id *)(a1 + 32) libraryIdentifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [v12 databasePath];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

@end