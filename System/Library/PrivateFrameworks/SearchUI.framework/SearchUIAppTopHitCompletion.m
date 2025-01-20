@interface SearchUIAppTopHitCompletion
+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4;
- (BOOL)completionResultIsPotentiallyPunchout;
- (NSString)enforcedExtensionString;
- (SearchUIAppTopHitCompletion)initWithTypedString:(id)a3 result:(id)a4 cardSection:(id)a5;
- (id)nonPrefixMatchExtensionString;
- (id)prefixMatchExtensionString;
- (void)setEnforcedExtensionString:(id)a3;
@end

@implementation SearchUIAppTopHitCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v5 = a4;
  if ([a3 isLocalApplicationResult]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [v5 spotlightBackingResult];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (SearchUIAppTopHitCompletion)initWithTypedString:(id)a3 result:(id)a4 cardSection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v10 spotlightBackingResult],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    v12 = [v10 spotlightBackingResult];
    v19.receiver = self;
    v19.super_class = (Class)SearchUIAppTopHitCompletion;
    v13 = [(SearchUICompletion *)&v19 initWithTypedString:v8 result:v12 cardSection:v10];

    if (v13)
    {
      v14 = [v10 title];
      v15 = [v14 text];
      [(SearchUIAppTopHitCompletion *)v13 setEnforcedExtensionString:v15];

      [(SearchUICompletion *)v13 updateFields];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SearchUIAppTopHitCompletion;
    v13 = [(SearchUICompletion *)&v18 initWithTypedString:v8 result:v9 cardSection:v10];
  }
  v16 = v13;

  return v16;
}

- (id)nonPrefixMatchExtensionString
{
  v3 = [(SearchUIAppTopHitCompletion *)self enforcedExtensionString];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUIAppTopHitCompletion;
    id v5 = [(SearchUICompletion *)&v8 nonPrefixMatchExtensionString];
  }
  v6 = v5;

  return v6;
}

- (id)prefixMatchExtensionString
{
  v3 = [(SearchUIAppTopHitCompletion *)self enforcedExtensionString];
  if ([v3 length])
  {
    v4 = [(SearchUICompletion *)self completionStringToMatch];
    id v5 = [(SearchUIAppTopHitCompletion *)self enforcedExtensionString];
    char v6 = [v4 isEqualToString:v5];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = [(SearchUIAppTopHitCompletion *)self enforcedExtensionString];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v9.receiver = self;
  v9.super_class = (Class)SearchUIAppTopHitCompletion;
  BOOL v7 = [(SearchUICompletion *)&v9 prefixMatchExtensionString];
LABEL_6:
  return v7;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return 1;
}

- (NSString)enforcedExtensionString
{
  return self->_enforcedExtensionString;
}

- (void)setEnforcedExtensionString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end