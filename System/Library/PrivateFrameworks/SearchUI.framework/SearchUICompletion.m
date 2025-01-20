@interface SearchUICompletion
+ (BOOL)stringMatchesWritingDirection:(id)a3;
+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4;
+ (_NSRange)nonPartialRangeOfTypedString:(id)a3 inString:(id)a4;
+ (id)initWithTypedString:(id)a3 result:(id)a4 cardSection:(id)a5;
+ (id)localizedNameForBundleIdentifier:(id)a3;
+ (id)localizedOpenString;
+ (id)localizedSearchString;
+ (id)localizedShowMoreString;
- (BOOL)completionResultIsPotentiallyPunchout;
- (BOOL)isValidRange:(_NSRange)a3;
- (NSAttributedString)completionString;
- (NSString)bridgeString;
- (NSString)copyableString;
- (NSString)extensionString;
- (NSString)typedString;
- (SFCardSection)cardSection;
- (SFImage)image;
- (SFSearchResult)result;
- (SearchUICompletion)initWithTypedString:(id)a3 result:(id)a4 cardSection:(id)a5;
- (id)completionStringToMatch;
- (id)completionStringWithString:(id)a3;
- (id)description;
- (id)prefixMatchExtensionString;
- (void)setBridgeString:(id)a3;
- (void)setCompletionString:(id)a3;
- (void)setExtensionString:(id)a3;
- (void)setImage:(id)a3;
- (void)updateFields;
@end

@implementation SearchUICompletion

+ (id)initWithTypedString:(id)a3 result:(id)a4 cardSection:(id)a5
{
  v23[8] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v23[3] = objc_opt_class();
  v23[4] = objc_opt_class();
  v23[5] = objc_opt_class();
  v23[6] = objc_opt_class();
  v23[7] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      if (objc_msgSend(v15, "supportsResult:cardSection:", v8, v9, (void)v18)) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v15 = 0;
  }

  v16 = (void *)[objc_alloc((Class)v15) initWithTypedString:v7 result:v8 cardSection:v9];
  return v16;
}

- (SearchUICompletion)initWithTypedString:(id)a3 result:(id)a4 cardSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SearchUICompletion;
  uint64_t v12 = [(SearchUICompletion *)&v24 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_typedString, a3);
    objc_storeStrong((id *)&v13->_result, a4);
    objc_storeStrong((id *)&v13->_cardSection, a5);
    if (+[SearchUIUtilities isIpad]
      && ([MEMORY[0x1E4FAE198] isMacOS] & 1) == 0)
    {
      bridgeString = v13->_bridgeString;
      v15 = @"﹣";
    }
    else
    {
      bridgeString = v13->_bridgeString;
      v15 = @" — ";
    }
    v13->_bridgeString = &v15->isa;

    v16 = [v10 applicationBundleIdentifier];
    if (![v16 length]) {
      goto LABEL_13;
    }
    v17 = +[SearchUIUtilities bundleIdentifierForApp:0];
    if ([v16 isEqualToString:v17])
    {
    }
    else
    {
      long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v16 allowPlaceholder:0 error:0];
      long long v19 = [v18 applicationState];
      int v20 = [v19 isValid];

      if (!v20)
      {
        image = v13->_image;
        v13->_image = 0;
        goto LABEL_12;
      }
    }
    uint64_t v21 = +[SearchUIAppIconImage appIconForResult:v10 variant:2];
    image = v13->_image;
    v13->_image = (SFImage *)v21;
LABEL_12:

LABEL_13:
    [(SearchUICompletion *)v13 updateFields];
  }
  return v13;
}

- (void)updateFields
{
  id v9 = [(SearchUICompletion *)self completionStringToMatch];
  if ([(id)objc_opt_class() stringMatchesWritingDirection:v9])
  {
    v3 = [(SearchUICompletion *)self completionStringWithString:v9];
    if (v3)
    {
      [(SearchUICompletion *)self setCompletionString:v3];
      [(SearchUICompletion *)self prefixMatchExtensionString];
    }
    else
    {
      [(SearchUICompletion *)self setCompletionString:0];
      [(SearchUICompletion *)self nonPrefixMatchExtensionString];
    v4 = };
    [(SearchUICompletion *)self setExtensionString:v4];
  }
  else
  {
    [(SearchUICompletion *)self setCompletionString:0];
    [(SearchUICompletion *)self setExtensionString:v9];
  }
  v5 = [(SearchUICompletion *)self typedString];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    if ([v9 length])
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];
      [(SearchUICompletion *)self setCompletionString:v7];

      id v8 = [(SearchUICompletion *)self prefixMatchExtensionString];
      [(SearchUICompletion *)self setExtensionString:v8];
    }
    else
    {
      [(SearchUICompletion *)self setCompletionString:0];
      [(SearchUICompletion *)self setExtensionString:0];
    }
  }
}

- (id)completionStringToMatch
{
  v3 = [(SearchUICompletion *)self result];
  v4 = [v3 completion];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(SearchUICompletion *)self result];
    id v8 = [v7 title];
    id v6 = [v8 text];
  }
  return v6;
}

- (id)prefixMatchExtensionString
{
  v2 = objc_opt_class();
  return (id)[v2 localizedOpenString];
}

+ (id)localizedOpenString
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"OPEN" value:&stru_1F40279D8 table:0];

  return v3;
}

+ (id)localizedSearchString
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SEARCH_BAR_PLACEHOLDER" value:&stru_1F40279D8 table:0];

  return v3;
}

+ (id)localizedShowMoreString
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SEARCH_RESULTS_SHOW_MORE_BUTTON_TITLE" value:&stru_1F40279D8 table:0];

  return v3;
}

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  return 0;
}

+ (id)localizedNameForBundleIdentifier:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F223C8];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

    id v6 = [v5 localizedName];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (BOOL)stringMatchesWritingDirection:(id)a3
{
  char v3 = [a3 _isNaturallyRTL];
  return v3 ^ [MEMORY[0x1E4FAE100] isLTR];
}

+ (_NSRange)nonPartialRangeOfTypedString:(id)a3 inString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 length];
  if (v5 && [v6 length] >= v7)
  {
    NSUInteger v9 = [v6 localizedStandardRangeOfString:v5];
    NSUInteger v8 = v12;
    unint64_t v13 = v12 + v9 - 1;
    if (v13 < [v6 length] - 1)
    {
      v17.NSUInteger location = [v6 rangeOfComposedCharacterSequenceAtIndex:v13];
      NSUInteger location = v17.location;
      NSUInteger length = v17.length;
      v19.NSUInteger location = v9;
      v19.NSUInteger length = v8;
      NSRange v16 = NSIntersectionRange(v17, v19);
      if (v16.location != location || v16.length != length)
      {
        NSUInteger v8 = 0;
        NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  else
  {
    NSUInteger v8 = 0;
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v10 = v9;
  NSUInteger v11 = v8;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (BOOL)isValidRange:(_NSRange)a3
{
  return a3.location == 0;
}

- (id)completionStringWithString:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SearchUICompletion *)self typedString];
  NSUInteger v6 = [(id)objc_opt_class() nonPartialRangeOfTypedString:v5 inString:v4];
  NSUInteger v8 = v7;
  if (!-[SearchUICompletion isValidRange:](self, "isValidRange:", v6, v7))
  {
    NSUInteger v9 = SearchUIGeneralLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412546;
      v32 = v5;
      __int16 v33 = 2112;
      id v34 = v4;
      _os_log_impl(&dword_1E45B5000, v9, OS_LOG_TYPE_DEFAULT, "to handle new normalized range match with compatibility equivalence, precomposing typedString: %@ and completionString: %@", (uint8_t *)&v31, 0x16u);
    }

    uint64_t v10 = [v5 precomposedStringWithCompatibilityMapping];

    uint64_t v11 = [v4 precomposedStringWithCompatibilityMapping];

    NSUInteger v6 = [(id)objc_opt_class() nonPartialRangeOfTypedString:v10 inString:v11];
    NSUInteger v8 = v12;
    id v5 = (void *)v10;
    id v4 = (id)v11;
  }
  if (-[SearchUICompletion isValidRange:](self, "isValidRange:", v6, v8))
  {
    unint64_t v13 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    uint64_t v14 = (void *)[v13 mutableCopy];

    [v14 setAllowsDefaultTighteningForTruncation:0];
    id v15 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v39 = *MEMORY[0x1E4FB0738];
    v40[0] = v14;
    NSRange v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    NSRange v17 = (void *)[v15 initWithString:v5 attributes:v16];

    unint64_t v18 = [v4 length];
    NSUInteger v19 = v18 - v8;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL || v18 > [v4 length])
    {
      int v20 = SearchUIGeneralLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v42.NSUInteger location = v8;
        v42.NSUInteger length = v19;
        v28 = NSStringFromRange(v42);
        v29 = [(SearchUICompletion *)self typedString];
        v43.NSUInteger location = v6;
        v43.NSUInteger length = v8;
        v30 = NSStringFromRange(v43);
        int v31 = 138413058;
        v32 = v28;
        __int16 v33 = 2112;
        id v34 = v4;
        __int16 v35 = 2112;
        v36 = v29;
        __int16 v37 = 2112;
        v38 = v30;
        _os_log_error_impl(&dword_1E45B5000, v20, OS_LOG_TYPE_ERROR, "suffix range: %@ is wrong for completionString: %@ with typedString: %@. originalRange: %@", (uint8_t *)&v31, 0x2Au);
      }
      uint64_t v21 = 0;
    }
    else
    {
      id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v23 = objc_msgSend(v4, "substringWithRange:", v8, v19);
      objc_super v24 = (void *)v23;
      if (v23) {
        v25 = (__CFString *)v23;
      }
      else {
        v25 = &stru_1F40279D8;
      }
      v26 = (void *)[v22 initWithString:v25];

      [v17 appendAttributedString:v26];
      uint64_t v21 = (void *)[v17 copy];
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUICompletion;
  char v3 = [(SearchUICompletion *)&v8 description];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(SearchUICompletion *)self completionString];
  NSUInteger v6 = [(SearchUICompletion *)self extensionString];
  [v4 appendFormat:@"completion:%@ extension:%@", v5, v6];

  return v4;
}

- (NSAttributedString)completionString
{
  return self->_completionString;
}

- (void)setCompletionString:(id)a3
{
}

- (NSString)extensionString
{
  return self->_extensionString;
}

- (void)setExtensionString:(id)a3
{
}

- (NSString)bridgeString
{
  return self->_bridgeString;
}

- (void)setBridgeString:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)copyableString
{
  return self->_copyableString;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return self->_completionResultIsPotentiallyPunchout;
}

- (NSString)typedString
{
  return self->_typedString;
}

- (SFSearchResult)result
{
  return self->_result;
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_typedString, 0);
  objc_storeStrong((id *)&self->_copyableString, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_bridgeString, 0);
  objc_storeStrong((id *)&self->_extensionString, 0);
  objc_storeStrong((id *)&self->_completionString, 0);
}

@end