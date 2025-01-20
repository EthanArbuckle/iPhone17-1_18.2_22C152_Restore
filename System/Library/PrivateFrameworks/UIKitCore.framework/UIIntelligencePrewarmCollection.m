@interface UIIntelligencePrewarmCollection
@end

@implementation UIIntelligencePrewarmCollection

void ___UIIntelligencePrewarmCollection_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 _userInterfaceIdiom];
  if (v4 == 3)
  {
    uint64_t v5 = a1[5];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    uint64_t v5 = a1[4];
  }
  *(unsigned char *)(*(void *)(v5 + 8) + 24) = 1;
LABEL_6:
  int v6 = [v3 _isEmbeddedScreen];

  if (v6) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void ___UIIntelligencePrewarmCollection_block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    v2 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
    [v2 backlightState];
  }
  if (*(unsigned char *)(a1 + 33))
  {
    +[_UICarPlaySession sharedInstance]();
    id v3 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[_UICarPlaySession currentSession](v3);
  }
}

@end