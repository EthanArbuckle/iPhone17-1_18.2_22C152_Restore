@interface SFSearchResult
@end

@implementation SFSearchResult

uint64_t __70__SFSearchResult_SearchToShare__sts_providerIconWithScale_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x263F827E8] imageWithData:a2 scale:*(double *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = v3;
    uint64_t v4 = (*(uint64_t (**)(void))(v4 + 16))();
    uint64_t v3 = v6;
  }

  return MEMORY[0x270F9A758](v4, v3);
}

uint64_t __59__SFSearchResult_SearchToShare___sts_cardSectionWithClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end