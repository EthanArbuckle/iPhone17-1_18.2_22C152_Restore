@interface TIInputModeLocaleIdentifierOverrideMapping
+ (id)sharedInstance;
- (NSDictionary)overrideMapping;
- (id)overrideLocaleForIdentifier:(id)a3;
- (unsigned)localeIdentifierHasOverride:(id)a3;
@end

@implementation TIInputModeLocaleIdentifierOverrideMapping

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TIInputModeLocaleIdentifierOverrideMapping_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __60__TIInputModeLocaleIdentifierOverrideMapping_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

- (NSDictionary)overrideMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__TIInputModeLocaleIdentifierOverrideMapping_overrideMapping__block_invoke;
  block[3] = &unk_1E555A428;
  block[4] = self;
  if (overrideMapping_onceToken != -1) {
    dispatch_once(&overrideMapping_onceToken, block);
  }
  return self->_overrideMapping;
}

void __61__TIInputModeLocaleIdentifierOverrideMapping_overrideMapping__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = &unk_1EDC2C300;
}

- (id)overrideLocaleForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(TIInputModeLocaleIdentifierOverrideMapping *)self overrideMapping];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (unsigned)localeIdentifierHasOverride:(id)a3
{
  id v4 = a3;
  v5 = [(TIInputModeLocaleIdentifierOverrideMapping *)self overrideMapping];
  v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

@end