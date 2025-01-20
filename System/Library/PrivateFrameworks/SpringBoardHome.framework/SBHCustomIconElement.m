@interface SBHCustomIconElement
+ (Class)elementClassWithIdentifier:(id)a3;
+ (NSString)elementIdentifier;
+ (NSString)elementKind;
- (NSString)containerBundleIdentifier;
- (NSString)displayName;
- (NSString)uniqueIdentifier;
- (SBHCustomIconElement)init;
- (SBHCustomIconElement)initWithUniqueIdentifier:(id)a3;
- (SBHIconGridSizeClassSet)supportedGridSizeClasses;
- (id)copyWithSuggestionSource:(int64_t)a3;
- (id)copyWithUniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)suggestionSource;
- (unint64_t)priorityForIcon:(id)a3;
@end

@implementation SBHCustomIconElement

+ (Class)elementClassWithIdentifier:(id)a3
{
  v24[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = self;
  v24[0] = v4;
  v5 = self;
  v24[1] = v5;
  v6 = self;
  v24[2] = v6;
  v7 = self;
  v24[3] = v7;
  v8 = self;
  v24[4] = v8;
  v9 = self;
  v24[5] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:6];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v10;
  id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "elementIdentifier", (void)v19);
        char v17 = [v3 isEqualToString:v16];

        if (v17)
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (Class)v12;
}

- (SBHCustomIconElement)initWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHCustomIconElement;
  v5 = [(SBHCustomIconElement *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;

    v5->_suggestionSource = 0;
  }

  return v5;
}

- (SBHCustomIconElement)init
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  v5 = [(SBHCustomIconElement *)self initWithUniqueIdentifier:v4];

  return v5;
}

- (id)copyWithSuggestionSource:(int64_t)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithUniqueIdentifier:self->_uniqueIdentifier];
  *((void *)result + 3) = a3;
  return result;
}

- (id)copyWithUniqueIdentifier
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [v4 UUIDString];
  uint64_t v6 = (void *)[v3 initWithUniqueIdentifier:v5];

  v6[3] = self->_suggestionSource;
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithUniqueIdentifier:self->_uniqueIdentifier];
  *((void *)result + 3) = self->_suggestionSource;
  return result;
}

+ (NSString)elementIdentifier
{
  return (NSString *)&stru_1F2FA0300;
}

+ (NSString)elementKind
{
  return (NSString *)&stru_1F2FA0300;
}

- (NSString)displayName
{
  return (NSString *)&stru_1F2FA0300;
}

- (SBHIconGridSizeClassSet)supportedGridSizeClasses
{
  return (SBHIconGridSizeClassSet *)+[SBHIconGridSizeClassSet gridSizeClassSetForAllNonDefaultGridSizeClasses];
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 0;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (int64_t)suggestionSource
{
  return self->_suggestionSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end