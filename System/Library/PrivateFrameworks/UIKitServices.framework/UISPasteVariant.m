@interface UISPasteVariant
+ (NSArray)allVariants;
+ (id)variantForActionIdentifier:(id)a3;
+ (id)variantForSecureName:(unsigned int)a3;
+ (id)variantForSelector:(SEL)a3;
- (NSString)actionIdentifier;
- (NSString)glyph;
- (NSString)keyInput;
- (SEL)selector;
- (UISPasteVariant)initWithSecureName:(unsigned int)a3 selector:(SEL)a4 actionIdentifier:(id)a5 glpyh:(id)a6 keyInput:(id)a7 keyModifierFlags:(int64_t)a8;
- (id)localizedStringForLocalization:(id)a3;
- (int64_t)keyModifierFlags;
- (unsigned)secureName;
@end

@implementation UISPasteVariant

+ (NSArray)allVariants
{
  if (_MergedGlobals_8 != -1) {
    dispatch_once(&_MergedGlobals_8, &__block_literal_global_5);
  }
  v2 = (void *)qword_1EB288868;
  return (NSArray *)v2;
}

void __30__UISPasteVariant_allVariants__block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v0 = [[UISPasteVariant alloc] initWithSecureName:0x10000 selector:sel_paste_ actionIdentifier:@"com.apple.action.paste" glpyh:@"doc.on.clipboard" keyInput:@"v" keyModifierFlags:0x100000];
  v6[0] = v0;
  v1 = [[UISPasteVariant alloc] initWithSecureName:65537 selector:sel_pasteAndMatchStyle_ actionIdentifier:@"com.apple.action.pasteAndMatchStyle" glpyh:@"doc.on.clipboard" keyInput:@"v" keyModifierFlags:1703936];
  v6[1] = v1;
  v2 = [[UISPasteVariant alloc] initWithSecureName:65538 selector:sel_pasteAndGo_ actionIdentifier:@"com.apple.action.pasteAndGo" glpyh:@"doc.on.clipboard" keyInput:0 keyModifierFlags:0];
  v6[2] = v2;
  v3 = [[UISPasteVariant alloc] initWithSecureName:65539 selector:sel_pasteAndSearch_ actionIdentifier:@"com.apple.action.pasteAndSearch" glpyh:@"doc.on.clipboard" keyInput:0 keyModifierFlags:0];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v5 = (void *)qword_1EB288868;
  qword_1EB288868 = v4;
}

- (UISPasteVariant)initWithSecureName:(unsigned int)a3 selector:(SEL)a4 actionIdentifier:(id)a5 glpyh:(id)a6 keyInput:(id)a7 keyModifierFlags:(int64_t)a8
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)UISPasteVariant;
  v18 = [(UISPasteVariant *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_secureName = a3;
    v18->_selector = a4;
    objc_storeStrong((id *)&v18->_actionIdentifier, a5);
    uint64_t v20 = [v16 copy];
    glyph = v19->_glyph;
    v19->_glyph = (NSString *)v20;

    uint64_t v22 = [v17 copy];
    keyInput = v19->_keyInput;
    v19->_keyInput = (NSString *)v22;

    v19->_keyModifierFlags = a8;
  }

  return v19;
}

+ (id)variantForSecureName:(unsigned int)a3
{
  unsigned __int16 v3 = a3;
  uint64_t v4 = [a1 allVariants];
  if ([v4 count] <= (unint64_t)v3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v4 objectAtIndexedSubscript:v3];
  }

  return v5;
}

+ (id)variantForSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(a1, "allVariants", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((SEL)[v9 selector] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (id)variantForActionIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(a1, "allVariants", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 actionIdentifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)localizedStringForLocalization:(id)a3
{
  return UISLocalizedStringForSecureName(self->_secureName, a3);
}

- (unsigned)secureName
{
  return self->_secureName;
}

- (SEL)selector
{
  return self->_selector;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)glyph
{
  return self->_glyph;
}

- (NSString)keyInput
{
  return self->_keyInput;
}

- (int64_t)keyModifierFlags
{
  return self->_keyModifierFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyInput, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end