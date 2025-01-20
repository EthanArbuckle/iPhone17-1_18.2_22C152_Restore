@interface UNCNContactResolver
@end

@implementation UNCNContactResolver

uint64_t __48___UNCNContactResolver_bestMatchForPhoneNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchThatMatchesPhoneNumber:*(void *)(a1 + 40) forContact:a2];
}

uint64_t __49___UNCNContactResolver_bestMatchForEmailAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _matchThatMatchesEmailAddress:*(void *)(a1 + 40) forContact:a2];
}

uint64_t __67___UNCNContactResolver_bestMatchForSocialProfile_bundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _matchThatMatchesSocialProfile:*(void *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 48) forContact:a2];
}

@end