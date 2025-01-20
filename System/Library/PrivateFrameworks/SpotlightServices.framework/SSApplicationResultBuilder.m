@interface SSApplicationResultBuilder
+ (id)bundleId;
+ (id)formattedAlternateNamesForBundleId:(id)a3 withAlternateNames:(id)a4;
- (NSArray)alternateNames;
- (NSString)bundleId;
- (NSString)matchedAlternateName;
- (NSString)name;
- (NSURL)appURL;
- (SFRichText)highlightedAlternateName;
- (SSApplicationResultBuilder)initWithResult:(id)a3;
- (id)buildBadgingImageWithThumbnail:(id)a3;
- (id)buildResult;
- (id)buildThumbnail;
- (id)buildTitle;
- (void)setAlternateNames:(id)a3;
- (void)setAppURL:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHighlightedAlternateName:(id)a3;
- (void)setMatchedAlternateName:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SSApplicationResultBuilder

+ (id)formattedAlternateNamesForBundleId:(id)a3 withAlternateNames:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (formattedAlternateNamesForBundleId_withAlternateNames__onceToken != -1) {
    dispatch_once(&formattedAlternateNamesForBundleId_withAlternateNames__onceToken, &__block_literal_global_43);
  }
  v7 = [(id)formattedAlternateNamesForBundleId_withAlternateNames__cache objectForKey:v5];
  if (!v7)
  {
    v7 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v13, "length", (void)v19))
          {
            v14 = [v13 localizedLowercaseString];
            char v15 = [v14 isEqualToString:v13];

            if (v15)
            {
              id v16 = [v13 localizedCapitalizedString];
            }
            else
            {
              id v16 = v13;
            }
            v17 = v16;
            [v7 addObject:v16];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [(id)formattedAlternateNamesForBundleId_withAlternateNames__cache setObject:v7 forKey:v5];
  }

  return v7;
}

uint64_t __84__SSApplicationResultBuilder_formattedAlternateNamesForBundleId_withAlternateNames___block_invoke()
{
  formattedAlternateNamesForBundleId_withAlternateNames__cache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)bundleId
{
  return @"com.apple.application";
}

- (SSApplicationResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SSApplicationResultBuilder;
  id v5 = [(SSResultBuilder *)&v23 initWithResult:v4];
  if (v5)
  {
    uint64_t v6 = [v4 url];
    if (v6
      && (v7 = (void *)v6,
          [v4 url],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isFileURL],
          v8,
          v7,
          v9))
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v11 = [v4 url];
      v12 = [v11 path];
      v13 = [v10 bundleWithPath:v12];

      v14 = [v13 bundleIdentifier];
      [(SSApplicationResultBuilder *)v5 setBundleId:v14];
    }
    else
    {
      v13 = [v4 applicationBundleIdentifier];
      [(SSApplicationResultBuilder *)v5 setBundleId:v13];
    }

    char v15 = objc_opt_class();
    id v16 = [(SSApplicationResultBuilder *)v5 bundleId];
    v17 = [v4 valueForAttribute:*MEMORY[0x1E4F22A78] withType:objc_opt_class()];
    v18 = [v15 formattedAlternateNamesForBundleId:v16 withAlternateNames:v17];
    [(SSApplicationResultBuilder *)v5 setAlternateNames:v18];

    long long v19 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
    if (v19)
    {
      [(SSApplicationResultBuilder *)v5 setName:v19];
    }
    else
    {
      long long v20 = [v4 title];
      long long v21 = [v20 text];
      [(SSApplicationResultBuilder *)v5 setName:v21];
    }
  }

  return v5;
}

- (id)buildResult
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(SSResultBuilder *)self queryContext];
  id v4 = [v3 searchString];

  v29 = v4;
  if ([v4 length])
  {
    id v5 = [(SSApplicationResultBuilder *)self name];
    char v6 = [v5 localizedStandardContainsString:v4];

    if ((v6 & 1) == 0)
    {
      v7 = [(SSResultBuilder *)self queryContext];
      id v8 = [v7 evaluator];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = [(SSApplicationResultBuilder *)self alternateNames];
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            char v14 = [v13 localizedStandardContainsString:v29];
            char v15 = [(SSApplicationResultBuilder *)self name];
            id v16 = getHighlightedRichText(v13, v8, v15, 0);

            v17 = [v16 formattedTextPieces];
            unint64_t v18 = [v17 count];

            long long v19 = [(SSApplicationResultBuilder *)self matchedAlternateName];

            if (v14)
            {
              [(SSApplicationResultBuilder *)self setHighlightedAlternateName:v16];
              [(SSApplicationResultBuilder *)self setMatchedAlternateName:v13];

              goto LABEL_19;
            }
            if (v18 >= 2 && v19 == 0)
            {
              [(SSApplicationResultBuilder *)self setHighlightedAlternateName:v16];
              [(SSApplicationResultBuilder *)self setMatchedAlternateName:v13];
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_19:
    }
  }
  long long v21 = [(SSApplicationResultBuilder *)self matchedAlternateName];

  if (v21)
  {
    long long v22 = [(SSApplicationResultBuilder *)self matchedAlternateName];
    objc_super v23 = [(SSResultBuilder *)self result];
    [v23 setCompletion:v22];
  }
  if (![(SSResultBuilder *)self isTopHit])
  {
    uint64_t v24 = [(SSResultBuilder *)self buildInlineCard];
    v25 = [(SSResultBuilder *)self result];
    [v25 setInlineCard:v24];
  }
  v26 = [(SSResultBuilder *)self result];

  return v26;
}

- (id)buildTitle
{
  v2 = (void *)MEMORY[0x1E4F9A378];
  v3 = [(SSApplicationResultBuilder *)self name];
  id v4 = [v2 textWithString:v3];

  return v4;
}

- (id)buildThumbnail
{
  uint64_t v3 = [(SSApplicationResultBuilder *)self appURL];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(SSApplicationResultBuilder *)self appURL];
    id v6 = [v5 path];
    v7 = (const char *)[v6 fileSystemRepresentation];

    if (v7)
    {
      id v8 = realpath_DARWIN_EXTSN(v7, 0);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v8 isDirectory:0 relativeToURL:0];
        uint64_t v11 = (void *)v10;
        if (v10) {
          v12 = (void *)v10;
        }
        else {
          v12 = v4;
        }
        id v13 = v12;

        free(v9);
        id v4 = v13;
      }
    }
    char v14 = objc_opt_new();
    [v14 setFilePath:v4];
  }
  else
  {
    id v4 = [(SSApplicationResultBuilder *)self bundleId];

    if (v4)
    {
      char v14 = objc_opt_new();
      char v15 = [(SSApplicationResultBuilder *)self bundleId];
      [v14 setBundleIdentifier:v15];

      id v4 = 0;
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  return 0;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)matchedAlternateName
{
  return self->_matchedAlternateName;
}

- (void)setMatchedAlternateName:(id)a3
{
}

- (NSArray)alternateNames
{
  return self->_alternateNames;
}

- (void)setAlternateNames:(id)a3
{
}

- (SFRichText)highlightedAlternateName
{
  return self->_highlightedAlternateName;
}

- (void)setHighlightedAlternateName:(id)a3
{
}

- (NSURL)appURL
{
  return self->_appURL;
}

- (void)setAppURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appURL, 0);
  objc_storeStrong((id *)&self->_highlightedAlternateName, 0);
  objc_storeStrong((id *)&self->_alternateNames, 0);
  objc_storeStrong((id *)&self->_matchedAlternateName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end