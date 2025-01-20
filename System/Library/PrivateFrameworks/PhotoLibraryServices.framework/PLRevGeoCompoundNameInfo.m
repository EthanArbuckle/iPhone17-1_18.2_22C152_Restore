@interface PLRevGeoCompoundNameInfo
+ (BOOL)supportsSecureCoding;
+ (id)_localizedNameForName:(id)a3;
- (BOOL)isContinuation;
- (BOOL)isEqual:(id)a3;
- (BOOL)suffixWhenPrefixOnly;
- (NSArray)sortedNames;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (PLRevGeoCompoundNameInfo)initWithCoder:(id)a3;
- (PLRevGeoCompoundNameInfo)initWithNamePrefix:(id)a3 nameSuffix:(id)a4 sortedNames:(id)a5 isContinuation:(BOOL)a6 suffixWhenPrefixOnly:(BOOL)a7;
- (id)description;
- (id)localizedSortedNames;
- (id)localizedTitleForNameInfo;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLRevGeoCompoundNameInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedNames, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
}

- (BOOL)suffixWhenPrefixOnly
{
  return self->_suffixWhenPrefixOnly;
}

- (BOOL)isContinuation
{
  return self->_isContinuation;
}

- (NSArray)sortedNames
{
  return self->_sortedNames;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (PLRevGeoCompoundNameInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"namePrefix"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nameSuffix"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sortedNames"];

  uint64_t v11 = [v4 decodeBoolForKey:@"isContinuation"];
  uint64_t v12 = [v4 decodeBoolForKey:@"suffixWhenPrefixOnly"];

  v13 = [(PLRevGeoCompoundNameInfo *)self initWithNamePrefix:v5 nameSuffix:v6 sortedNames:v10 isContinuation:v11 suffixWhenPrefixOnly:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  namePrefix = self->_namePrefix;
  id v5 = a3;
  [v5 encodeObject:namePrefix forKey:@"namePrefix"];
  [v5 encodeObject:self->_nameSuffix forKey:@"nameSuffix"];
  [v5 encodeObject:self->_sortedNames forKey:@"sortedNames"];
  [v5 encodeBool:self->_isContinuation forKey:@"isContinuation"];
  [v5 encodeBool:self->_suffixWhenPrefixOnly forKey:@"suffixWhenPrefixOnly"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PLRevGeoCompoundNameInfo *)a3;
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_15;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    BOOL isContinuation = self->_isContinuation;
    if (isContinuation != [(PLRevGeoCompoundNameInfo *)v7 isContinuation]) {
      goto LABEL_13;
    }
    BOOL suffixWhenPrefixOnly = self->_suffixWhenPrefixOnly;
    if (suffixWhenPrefixOnly != [(PLRevGeoCompoundNameInfo *)v7 suffixWhenPrefixOnly]) {
      goto LABEL_13;
    }
    namePrefix = self->_namePrefix;
    uint64_t v11 = [(PLRevGeoCompoundNameInfo *)v7 namePrefix];
    if (namePrefix == (NSString *)v11)
    {
    }
    else
    {
      uint64_t v12 = (void *)v11;
      v13 = self->_namePrefix;
      v14 = [(PLRevGeoCompoundNameInfo *)v7 namePrefix];
      LODWORD(v13) = [(NSString *)v13 isEqualToString:v14];

      if (!v13) {
        goto LABEL_13;
      }
    }
    nameSuffix = self->_nameSuffix;
    uint64_t v16 = [(PLRevGeoCompoundNameInfo *)v7 nameSuffix];
    if (nameSuffix == (NSString *)v16)
    {
    }
    else
    {
      v17 = (void *)v16;
      v18 = self->_nameSuffix;
      v19 = [(PLRevGeoCompoundNameInfo *)v7 nameSuffix];
      LODWORD(v18) = [(NSString *)v18 isEqualToString:v19];

      if (!v18)
      {
LABEL_13:
        char v6 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    sortedNames = self->_sortedNames;
    v22 = [(PLRevGeoCompoundNameInfo *)v7 sortedNames];
    if (sortedNames == v22)
    {
      char v6 = 1;
    }
    else
    {
      v23 = self->_sortedNames;
      v24 = [(PLRevGeoCompoundNameInfo *)v7 sortedNames];
      char v6 = [(NSArray *)v23 isEqualToArray:v24];
    }
    goto LABEL_14;
  }
  char v6 = 0;
LABEL_15:

  return v6;
}

- (id)localizedTitleForNameInfo
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(PLRevGeoCompoundNameInfo *)self localizedSortedNames];
  if ([v2 count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v19 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v10 = [(id)objc_opt_class() _localizedNameForName:v9];
          uint64_t v11 = [v4 firstObject];

          if (v9 != v11)
          {
            uint64_t v12 = [v4 lastObject];

            v13 = @"MOMENT_TITLE_LIST_MID_SEPARATOR_FORMAT";
            if (v9 == v12)
            {
              if ([v4 count] == 2) {
                v13 = @"MOMENT_TITLE_LIST_END_SEPARATOR_FORMAT_1";
              }
              else {
                v13 = @"MOMENT_TITLE_LIST_END_SEPARATOR_FORMAT_N";
              }
            }
            v14 = PLMomentsLocalizedFrameworkString(v13);
            v18 = v10;
            uint64_t v15 = PFStringWithValidatedFormat();

            v10 = (void *)v15;
          }
          objc_msgSend(v3, "appendString:", v10, v18);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    uint64_t v16 = (void *)[v3 copy];
    v2 = v19;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)localizedSortedNames
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_namePrefix length]
    || [(NSString *)self->_nameSuffix length]
    || self->_isContinuation)
  {
    v30 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_sortedNames, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obj = self->_sortedNames;
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (!v3) {
      goto LABEL_52;
    }
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v32;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
        v9 = [(id)objc_opt_class() _localizedNameForName:v8];
        v10 = v9;
        if (v5)
        {
          char v5 = 1;
        }
        else if (v9 && self->_nameSuffix)
        {
          char v5 = -[NSString containsString:](v9, "containsString:");
        }
        else
        {
          char v5 = 0;
        }
        uint64_t v11 = [(NSArray *)self->_sortedNames firstObject];
        if (v8 == (void *)v11)
        {
          if ([(NSString *)self->_namePrefix length])
          {
          }
          else
          {
            BOOL isContinuation = self->_isContinuation;

            if (!isContinuation) {
              goto LABEL_39;
            }
          }
          uint64_t v12 = self->_namePrefix;
          if ([(NSString *)v12 length])
          {
            if ([(NSArray *)self->_sortedNames count] == 1
              && [(NSString *)self->_namePrefix rangeOfString:v8] != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v12 && self->_nameSuffix) {
                char v16 = -[NSString containsString:](v12, "containsString:");
              }
              else {
                char v16 = 0;
              }
              if (self->_suffixWhenPrefixOnly)
              {
                char v17 = [(NSString *)self->_nameSuffix length] ? v16 : 1;
                if ((v17 & 1) == 0)
                {
                  v18 = PLMomentsLocalizedFrameworkString(@"MOMENT_TITLE_SUFFIX_FORMAT");
                  v27 = v12;
                  nameSuffix = self->_nameSuffix;
                  uint64_t v19 = PFStringWithValidatedFormat();

                  uint64_t v12 = (NSString *)v19;
                }
              }
              uint64_t v15 = v12;
              uint64_t v12 = v15;
            }
            else
            {
              uint64_t v14 = PLMomentsLocalizedFrameworkString(@"MOMENT_TITLE_PREFIX_FORMAT");
              v27 = v12;
              nameSuffix = v10;
              PFStringWithValidatedFormat();
              uint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue();

              v10 = (NSString *)v14;
            }

            v10 = v15;
          }
          if (self->_isContinuation)
          {
            long long v20 = PLMomentsLocalizedFrameworkString(@"MOMENT_TITLE_CONTINUATION_FORMAT");
            v27 = v10;
            uint64_t v21 = PFStringWithValidatedFormat();

            v10 = (NSString *)v21;
          }
        }
        else
        {
          uint64_t v12 = (NSString *)v11;
        }

LABEL_39:
        uint64_t v22 = [(NSArray *)self->_sortedNames lastObject];
        if (v8 != (void *)v22)
        {
          uint64_t v8 = (void *)v22;
LABEL_41:

          goto LABEL_42;
        }
        if (![(NSString *)self->_nameSuffix length]
          || self->_suffixWhenPrefixOnly && [(NSString *)self->_namePrefix length])
        {
          goto LABEL_41;
        }

        if ((v5 & 1) == 0)
        {
          uint64_t v8 = PLMomentsLocalizedFrameworkString(@"MOMENT_TITLE_SUFFIX_FORMAT");
          v26 = v10;
          nameSuffix = self->_nameSuffix;
          uint64_t v23 = PFStringWithValidatedFormat();

          v10 = (NSString *)v23;
          goto LABEL_41;
        }
LABEL_42:
        if (v10) {
          [(NSArray *)v30 addObject:v10];
        }

        ++v7;
      }
      while (v4 != v7);
      uint64_t v24 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      uint64_t v4 = v24;
      if (!v24)
      {
LABEL_52:

        goto LABEL_53;
      }
    }
  }
  v30 = self->_sortedNames;
LABEL_53:
  return v30;
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PLRevGeoCompoundNameInfo;
  uint64_t v4 = [(PLRevGeoCompoundNameInfo *)&v7 description];
  char v5 = [v3 stringWithFormat:@"%@ namePrefix: %@, sortedNames: %@, nameSuffix: %@, isContinuation: %d, suffixWhenPrefixOnly: %d", v4, self->_namePrefix, self->_sortedNames, self->_nameSuffix, self->_isContinuation, self->_suffixWhenPrefixOnly];

  return v5;
}

- (PLRevGeoCompoundNameInfo)initWithNamePrefix:(id)a3 nameSuffix:(id)a4 sortedNames:(id)a5 isContinuation:(BOOL)a6 suffixWhenPrefixOnly:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PLRevGeoCompoundNameInfo;
  char v16 = [(PLRevGeoCompoundNameInfo *)&v19 init];
  char v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_namePrefix, a3);
    objc_storeStrong((id *)&v17->_nameSuffix, a4);
    objc_storeStrong((id *)&v17->_sortedNames, a5);
    v17->_BOOL isContinuation = a6;
    v17->_BOOL suffixWhenPrefixOnly = a7;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_localizedNameForName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"_$!<Home>!$_"])
  {
    PLMomentsLocalizedFrameworkString(@"MOMENT_HOME");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }
  char v5 = v4;

  return v5;
}

@end