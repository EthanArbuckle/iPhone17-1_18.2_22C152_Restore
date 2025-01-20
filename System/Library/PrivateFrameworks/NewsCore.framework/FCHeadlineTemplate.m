@interface FCHeadlineTemplate
+ (FCHeadlineTemplate)headlineTemplateWithJSON:(id)a3 URLGenerator:(id)a4;
+ (id)_defaultBackgroundColor;
+ (id)_defaultTitleTextColor;
+ (id)_headlineTemplateWithJSON:(id)a3 versionNumber:(id)a4 URLGenerator:(id)a5;
+ (id)templateByMergingTemplate:(id)a3 intoTemplate:(id)a4;
- (BOOL)isEqual:(id)a3;
- (FCColor)backgroundColor;
- (FCHeadlineTemplate)init;
- (FCHeadlineTemplate)initWithJSONDictionary:(id)a3 versionNumber:(int64_t)a4 URLGenerator:(id)a5;
- (FCTextInfo)headlineBylineTextInfo;
- (FCTextInfo)headlineExcerptTextInfo;
- (FCTextInfo)headlineTitleTextInfo;
- (NSArray)loadableFonts;
- (id)_allThemePropertyNames;
- (unint64_t)hash;
- (void)mergeFromTemplate:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setHeadlineBylineTextInfo:(id)a3;
- (void)setHeadlineExcerptTextInfo:(id)a3;
- (void)setHeadlineTitleTextInfo:(id)a3;
- (void)setLoadableFonts:(id)a3;
@end

@implementation FCHeadlineTemplate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadableFonts, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_headlineBylineTextInfo, 0);
  objc_storeStrong((id *)&self->_headlineExcerptTextInfo, 0);
  objc_storeStrong((id *)&self->_headlineTitleTextInfo, 0);
}

- (FCTextInfo)headlineTitleTextInfo
{
  return self->_headlineTitleTextInfo;
}

- (FCTextInfo)headlineExcerptTextInfo
{
  return self->_headlineExcerptTextInfo;
}

- (FCTextInfo)headlineBylineTextInfo
{
  return self->_headlineBylineTextInfo;
}

- (void)setHeadlineTitleTextInfo:(id)a3
{
}

- (void)setHeadlineExcerptTextInfo:(id)a3
{
}

- (void)setHeadlineBylineTextInfo:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
}

- (FCHeadlineTemplate)init
{
  uint64_t v3 = [@"2" integerValue];
  return [(FCHeadlineTemplate *)self initWithJSONDictionary:0 versionNumber:v3 URLGenerator:0];
}

- (FCHeadlineTemplate)initWithJSONDictionary:(id)a3 versionNumber:(int64_t)a4 URLGenerator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v42.receiver = self;
  v42.super_class = (Class)FCHeadlineTemplate;
  v10 = [(FCHeadlineTemplate *)&v42 init];
  v11 = v10;
  if (v8 && v10)
  {
    if (a4 == 2)
    {
      v22 = [v8 objectForKeyedSubscript:@"titleFontAttributes"];
      uint64_t v23 = +[FCTextInfo textInfoFromJSONValues:v22 URLGenerator:v9];
      headlineTitleTextInfo = v11->_headlineTitleTextInfo;
      v11->_headlineTitleTextInfo = (FCTextInfo *)v23;

      v25 = [v8 objectForKeyedSubscript:@"bylineFontAttributes"];
      uint64_t v26 = +[FCTextInfo textInfoFromJSONValues:v25 URLGenerator:v9];
      headlineBylineTextInfo = v11->_headlineBylineTextInfo;
      v11->_headlineBylineTextInfo = (FCTextInfo *)v26;

      v28 = [v8 objectForKeyedSubscript:@"backgroundColor"];
      if (v28) {
        +[FCColor colorWithHexString:v28];
      }
      else {
      uint64_t v29 = [(id)objc_opt_class() _defaultBackgroundColor];
      }
      backgroundColor = v11->_backgroundColor;
      v11->_backgroundColor = (FCColor *)v29;

      goto LABEL_16;
    }
    if (a4 == 1)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__FCHeadlineTemplate_initWithJSONDictionary_versionNumber_URLGenerator___block_invoke;
      aBlock[3] = &unk_1E5B57520;
      id v12 = v8;
      id v40 = v12;
      id v41 = v9;
      v13 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __72__FCHeadlineTemplate_initWithJSONDictionary_versionNumber_URLGenerator___block_invoke_2;
      v37[3] = &unk_1E5B57548;
      id v14 = v12;
      id v38 = v14;
      v15 = (void (**)(void *, __CFString *))_Block_copy(v37);
      v16 = objc_alloc_init(FCTextInfo);
      v17 = v11->_headlineTitleTextInfo;
      v11->_headlineTitleTextInfo = v16;

      v18 = [v14 objectForKeyedSubscript:@"titleFontName"];
      v19 = v13[2](v13, @"titleFontResourceID");
      v20 = +[FCLoadableFont loadableFontWithName:v18 url:v19];
      [(FCTextInfo *)v11->_headlineTitleTextInfo setFont:v20];

      v21 = v15[2](v15, @"titleColor");
      if (v21)
      {
        [(FCTextInfo *)v11->_headlineTitleTextInfo setColor:v21];
      }
      else
      {
        v30 = +[FCColor blackColor];
        [(FCTextInfo *)v11->_headlineTitleTextInfo setColor:v30];
      }
      v31 = v15[2](v15, @"backgroundColor");
      v32 = v31;
      if (v31)
      {
        v33 = v31;
      }
      else
      {
        v33 = [(id)objc_opt_class() _defaultBackgroundColor];
      }
      v35 = v11->_backgroundColor;
      v11->_backgroundColor = v33;

      v28 = v40;
LABEL_16:
    }
  }

  return v11;
}

+ (FCHeadlineTemplate)headlineTemplateWithJSON:(id)a3 URLGenerator:(id)a4
{
  return (FCHeadlineTemplate *)[a1 _headlineTemplateWithJSON:a3 versionNumber:@"2" URLGenerator:a4];
}

+ (id)_headlineTemplateWithJSON:(id)a3 versionNumber:(id)a4 URLGenerator:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 length])
  {
    v10 = [v7 dataUsingEncoding:4];
    id v20 = 0;
    v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:0 error:&v20];
    id v12 = v20;
    if (v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)[[NSString alloc] initWithFormat:@"failed to deserialize JSONData template with error: %@", v12];
      *(_DWORD *)buf = 136315906;
      v22 = "+[FCHeadlineTemplate _headlineTemplateWithJSON:versionNumber:URLGenerator:]";
      __int16 v23 = 2080;
      v24 = "FCHeadlineTemplate.m";
      __int16 v25 = 1024;
      int v26 = 84;
      __int16 v27 = 2114;
      v28 = v19;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v13 = [v11 objectForKeyedSubscript:v8];
    id v14 = v13;
    if (v13
      && ([v13 objectForKeyedSubscript:@"templateType"],
          v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 isEqualToString:@"Image On Top"],
          v15,
          v16))
    {
      v17 = -[FCImageOnTopPremiumHeadlineTemplate initWithJSONDictionary:versionNumber:URLGenerator:]([FCImageOnTopPremiumHeadlineTemplate alloc], "initWithJSONDictionary:versionNumber:URLGenerator:", v14, [v8 integerValue], v9);
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)templateByMergingTemplate:(id)a3 intoTemplate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 mergeFromTemplate:v5];

  [v7 mergeFromTemplate:v6];
  return v7;
}

- (void)mergeFromTemplate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v4, "_allThemePropertyNames", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(NSString **)(*((void *)&v12 + 1) + 8 * i);
        NSSelectorFromString(v10);
        if (objc_opt_respondsToSelector())
        {
          v11 = [v4 valueForKey:v10];
          if (v11) {
            [(FCHeadlineTemplate *)self setValue:v11 forKey:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

id __72__FCHeadlineTemplate_initWithJSONDictionary_versionNumber_URLGenerator___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) generateURLForResourceID:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __72__FCHeadlineTemplate_initWithJSONDictionary_versionNumber_URLGenerator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if ([v2 length])
  {
    uint64_t v3 = +[FCColor colorWithHexString:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)loadableFonts
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(FCHeadlineTemplate *)self headlineTitleTextInfo];
  id v5 = [v4 font];

  if (v5)
  {
    uint64_t v6 = [(FCHeadlineTemplate *)self headlineTitleTextInfo];
    uint64_t v7 = [v6 font];
    [v3 addObject:v7];
  }
  uint64_t v8 = [(FCHeadlineTemplate *)self headlineBylineTextInfo];
  id v9 = [v8 font];

  if (v9)
  {
    v10 = [(FCHeadlineTemplate *)self headlineBylineTextInfo];
    v11 = [v10 font];
    [v3 addObject:v11];
  }
  long long v12 = [(FCHeadlineTemplate *)self headlineExcerptTextInfo];
  long long v13 = [v12 font];

  if (v13)
  {
    long long v14 = [(FCHeadlineTemplate *)self headlineExcerptTextInfo];
    long long v15 = [v14 font];
    [v3 addObject:v15];
  }
  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FCHeadlineTemplate *)a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (self == v4)
  {
    BOOL v8 = 1;
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      *((unsigned char *)v14 + 24) = 1;
      uint64_t v6 = [(FCHeadlineTemplate *)self _allThemePropertyNames];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __30__FCHeadlineTemplate_isEqual___block_invoke;
      v10[3] = &unk_1E5B57570;
      v10[4] = self;
      uint64_t v7 = v5;
      v11 = v7;
      long long v12 = &v13;
      [v6 enumerateObjectsUsingBlock:v10];
    }
    else
    {
      uint64_t v7 = 0;
    }

    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __30__FCHeadlineTemplate_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  BOOL v8 = [v6 valueForKey:v7];
  id v9 = [*(id *)(a1 + 40) valueForKey:v7];

  LOBYTE(v7) = [v8 isEqual:v9];
  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (unint64_t)hash
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(FCHeadlineTemplate *)self _allThemePropertyNames];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [(FCHeadlineTemplate *)self valueForKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        v6 ^= [v9 hash];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_allThemePropertyNames
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = NSStringFromSelector(sel_headlineTitleTextInfo);
  v8[0] = v2;
  uint64_t v3 = NSStringFromSelector(sel_headlineExcerptTextInfo);
  v8[1] = v3;
  uint64_t v4 = NSStringFromSelector(sel_backgroundColor);
  v8[2] = v4;
  uint64_t v5 = NSStringFromSelector(sel_headlineBylineTextInfo);
  v8[3] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)_defaultTitleTextColor
{
  if (qword_1EB5D1810 != -1) {
    dispatch_once(&qword_1EB5D1810, &__block_literal_global_119);
  }
  v2 = (void *)_MergedGlobals_192;
  return v2;
}

uint64_t __44__FCHeadlineTemplate__defaultTitleTextColor__block_invoke()
{
  uint64_t v0 = +[FCColor blackColor];
  uint64_t v1 = _MergedGlobals_192;
  _MergedGlobals_192 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_defaultBackgroundColor
{
  if (qword_1EB5D1820 != -1) {
    dispatch_once(&qword_1EB5D1820, &__block_literal_global_62_2);
  }
  v2 = (void *)qword_1EB5D1818;
  return v2;
}

uint64_t __45__FCHeadlineTemplate__defaultBackgroundColor__block_invoke()
{
  uint64_t v0 = +[FCColor colorWithRed:0.961 green:0.957 blue:0.941 alpha:1.0];
  uint64_t v1 = qword_1EB5D1818;
  qword_1EB5D1818 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setLoadableFonts:(id)a3
{
}

@end