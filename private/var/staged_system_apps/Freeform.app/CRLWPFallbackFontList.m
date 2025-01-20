@interface CRLWPFallbackFontList
+ (id)sharedInstance;
- (BOOL)isMasqueradingFontName:(id)a3;
- (CRLWPFallbackFontList)init;
- (CRLWPFallbackFontList)initWithList:(id)a3;
- (NSDictionary)fallbackFontList;
- (NSSet)masqueradingFontNames;
- (NSSet)replaceableFontNames;
- (id)fallbackFontNameForFontWithName:(id)a3;
- (id)fallbackListForPostscriptFontName:(id)a3;
- (id)localizedFontFamilyNameResolver;
- (id)localizedNameForMasqueradingFontName:(id)a3;
- (void)setFallbackFontList:(id)a3;
- (void)setLocalizedFontFamilyNameResolver:(id)a3;
@end

@implementation CRLWPFallbackFontList

+ (id)sharedInstance
{
  if (qword_1016A90B0 != -1) {
    dispatch_once(&qword_1016A90B0, &stru_1014D6448);
  }
  v2 = (void *)qword_1016A90A8;

  return v2;
}

- (CRLWPFallbackFontList)init
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 pathForResource:@"CRLWPFallbackFonts" ofType:@"plist"];

  id v5 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v4];
  v6 = [(CRLWPFallbackFontList *)self initWithList:v5];

  return v6;
}

- (CRLWPFallbackFontList)initWithList:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLWPFallbackFontList;
  v6 = [(CRLWPFallbackFontList *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fallbackFontList, a3);
    id localizedFontFamilyNameResolver = v7->_localizedFontFamilyNameResolver;
    v7->_id localizedFontFamilyNameResolver = &stru_1014D6488;
  }
  return v7;
}

- (NSSet)replaceableFontNames
{
  v2 = [(CRLWPFallbackFontList *)self fallbackFontList];
  v3 = [v2 allKeys];
  v4 = +[NSSet setWithArray:v3];

  return (NSSet *)v4;
}

- (id)fallbackListForPostscriptFontName:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  v6 = [(CRLWPFallbackFontList *)self fallbackFontList];
  v7 = [v6 objectForKeyedSubscript:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKeyedSubscript:@"PostScript-name"];
        [v5 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)fallbackFontNameForFontWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLWPFallbackFontList *)self fallbackFontList];
  v6 = [v5 objectForKeyedSubscript:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = [*(id *)(*((void *)&v16 + 1) + 8 * v11) objectForKeyedSubscript:@"PostScript-name" v16];
      v13 = +[CRLWPFontVerifier sharedInstance];
      unsigned __int8 v14 = [v13 isFontWithPostscriptNameInstalled:v12];

      if (v14) {
        break;
      }

      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

- (id)localizedNameForMasqueradingFontName:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLWPFallbackFontList *)self localizedFontFamilyNameResolver];
  v6 = v5[2]();

  id v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (BOOL)isMasqueradingFontName:(id)a3
{
  id v4 = a3;
  id v5 = +[CRLWPFontVerifier sharedInstance];
  unsigned __int8 v6 = [v5 isFontWithPostscriptNameInstalled:v4];

  if (v6)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    id v8 = [(CRLWPFallbackFontList *)self fallbackFontNameForFontWithName:v4];
    if ([v8 length])
    {
      id v9 = [(CRLWPFallbackFontList *)self masqueradingFontNames];
      unsigned __int8 v7 = [v9 containsObject:v8];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  return v7;
}

- (NSSet)masqueradingFontNames
{
  return (NSSet *)+[CRLWPFont masqueradingFontNames];
}

- (NSDictionary)fallbackFontList
{
  return self->_fallbackFontList;
}

- (void)setFallbackFontList:(id)a3
{
}

- (id)localizedFontFamilyNameResolver
{
  return self->_localizedFontFamilyNameResolver;
}

- (void)setLocalizedFontFamilyNameResolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_localizedFontFamilyNameResolver, 0);

  objc_storeStrong((id *)&self->_fallbackFontList, 0);
}

@end