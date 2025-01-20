@interface ParticipantsForSharedLibrary
@end

@implementation ParticipantsForSharedLibrary

void ___ParticipantsForSharedLibrary_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (!*(unsigned char *)(a1 + 48)
    || (v4 = _PXSharedLibraryParticipantsAreEqual(*(void **)(a1 + 32), v3), id v3 = v6, (v4 & 1) == 0))
  {
    if (!*(unsigned char *)(a1 + 49) || (v5 = [v3 isCurrentUser], id v3 = v6, (v5 & 1) == 0))
    {
      [*(id *)(a1 + 40) addObject:v3];
      id v3 = v6;
    }
  }
}

@end