@interface SSVContentLink
- (NSNumber)itemIdentifier;
- (NSString)categoryName;
- (NSString)itemTitle;
- (NSString)providerName;
- (NSString)searchTerm;
- (NSURL)URL;
- (id)_URLSchemeWithApplication:(int64_t)a3;
- (id)_stringForContentKind:(int64_t)a3;
- (int64_t)_targetApplicationWithContentKind:(int64_t)a3;
- (int64_t)contentKind;
- (int64_t)targetApplication;
- (void)setCategoryName:(id)a3;
- (void)setContentKind:(int64_t)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemTitle:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)setTargetApplication:(int64_t)a3;
@end

@implementation SSVContentLink

- (NSURL)URL
{
  int64_t v3 = [(SSVContentLink *)self targetApplication];
  int64_t v4 = [(SSVContentLink *)self contentKind];
  if (v3
    || (int64_t v3 = [(SSVContentLink *)self _targetApplicationWithContentKind:v4]) != 0)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
    v6 = [(SSVContentLink *)self _URLSchemeWithApplication:v3];
    [v5 setScheme:v6];

    [v5 setPath:@"/"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (self->_itemIdentifier)
    {
      v8 = [MEMORY[0x1E4F290C8] queryItemWithName:@"action" value:@"lookup"];
      [v7 addObject:v8];

      v9 = (void *)MEMORY[0x1E4F290C8];
      v10 = [(NSNumber *)self->_itemIdentifier stringValue];
      v11 = @"ids";
      v12 = v9;
      categoryName = v10;
    }
    else
    {
      if (self->_searchTerm)
      {
        v15 = [MEMORY[0x1E4F290C8] queryItemWithName:@"action" value:@"search"];
        [v7 addObject:v15];

        v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"term" value:self->_searchTerm];
        [v7 addObject:v10];
        goto LABEL_9;
      }
      uint64_t v18 = [(SSVContentLink *)self _stringForContentKind:v4];
      v10 = (NSString *)v18;
      if (v3 != 3 || !v18)
      {
        if (self->_itemTitle || self->_providerName || self->_categoryName)
        {
          v23 = objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"term");
          [v7 addObject:v23];
        }
        if (![v7 count]) {
          goto LABEL_9;
        }
        v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"action" value:@"search"];
        [v7 insertObject:v14 atIndex:0];
        goto LABEL_6;
      }
      v19 = [MEMORY[0x1E4F290C8] queryItemWithName:@"action" value:@"library-link"];
      [v7 addObject:v19];

      v20 = [MEMORY[0x1E4F290C8] queryItemWithName:@"kind" value:v10];
      [v7 addObject:v20];

      if (self->_itemTitle)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"n");
        [v7 addObject:v21];
      }
      if (self->_providerName)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"an");
        [v7 addObject:v22];
      }
      categoryName = self->_categoryName;
      if (!categoryName) {
        goto LABEL_9;
      }
      v12 = (void *)MEMORY[0x1E4F290C8];
      v11 = @"gn";
    }
    v14 = [v12 queryItemWithName:v11 value:categoryName];
    [v7 addObject:v14];
LABEL_6:

LABEL_9:
    if ([v7 count])
    {
      [v5 setQueryItems:v7];
      v16 = [v5 URL];
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_13;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Must specify target app or content kind"];
  v16 = 0;
LABEL_13:
  return (NSURL *)v16;
}

- (id)_stringForContentKind:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 6) {
    return 0;
  }
  else {
    return off_1E5BA7CA8[a3 - 2];
  }
}

- (int64_t)_targetApplicationWithContentKind:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 0;
  }
  else {
    return qword_1A52F62B0[a3 - 1];
  }
}

- (id)_URLSchemeWithApplication:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E5BA7CE0[a3 - 1];
  }
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
}

- (int64_t)contentKind
{
  return self->_contentKind;
}

- (void)setContentKind:(int64_t)a3
{
  self->_contentKind = a3;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (int64_t)targetApplication
{
  return self->_targetApplication;
}

- (void)setTargetApplication:(int64_t)a3
{
  self->_targetApplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
}

@end