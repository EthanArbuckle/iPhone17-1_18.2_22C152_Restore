@interface WBSReaderFontManager
- (NSArray)fonts;
- (NSArray)possibleFonts;
- (NSString)languageTag;
- (WBSReaderFontManager)init;
- (id)defaultFontForLanguageTag:(id)a3;
- (id)fontWithFontFamilyName:(id)a3;
- (void)_fontDownloadDidFinish:(id)a3;
- (void)updateLanguageTag:(id)a3;
@end

@implementation WBSReaderFontManager

- (WBSReaderFontManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSReaderFontManager;
  v2 = [(WBSReaderFontManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    languageTag = v2->_languageTag;
    v2->_languageTag = (NSString *)&stru_1EFBE3CF8;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = +[WBSReaderFontDownloadManager sharedManager];
    [v5 addObserver:v3 selector:sel__fontDownloadDidFinish_ name:@"WBSReaderFontDownloadDidFinishNotification" object:v6];

    v7 = v3;
  }

  return v3;
}

- (NSArray)fonts
{
  validatedFonts = self->_validatedFonts;
  if (validatedFonts)
  {
    v3 = validatedFonts;
  }
  else
  {
    v5 = +[WBSReaderLocalizedFonts fontsForLanguage:self->_languageTag];
    objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &__block_literal_global_95);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_validatedFonts;
    self->_validatedFonts = v6;

    v3 = self->_validatedFonts;
  }
  return v3;
}

uint64_t __29__WBSReaderFontManager_fonts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInstalled];
}

- (NSArray)possibleFonts
{
  return (NSArray *)+[WBSReaderLocalizedFonts fontsForLanguage:self->_languageTag];
}

- (id)defaultFontForLanguageTag:(id)a3
{
  v4 = +[WBSReaderLocalizedFonts defaultFontFamilyNameForLanguage:a3];
  v5 = [(WBSReaderFontManager *)self fontWithFontFamilyName:v4];

  return v5;
}

- (id)fontWithFontFamilyName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(WBSReaderFontManager *)self fonts];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 familyName];
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

- (void)updateLanguageTag:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_languageTag, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_languageTag, a3);
    validatedFonts = self->_validatedFonts;
    self->_validatedFonts = 0;
  }
}

- (void)_fontDownloadDidFinish:(id)a3
{
  validatedFonts = self->_validatedFonts;
  self->_validatedFonts = 0;
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageTag, 0);
  objc_storeStrong((id *)&self->_validatedFonts, 0);
}

@end