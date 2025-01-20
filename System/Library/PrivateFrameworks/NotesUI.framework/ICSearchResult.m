@interface ICSearchResult
+ (BOOL)canFitAttributedString:(id)a3 ellipses:(id)a4 shouldPrefixWithEllipses:(BOOL)a5 insideFrame:(CGRect)a6 centered:(BOOL)a7;
+ (CGRect)boundingRectForAttributedString:(id)a3 fittingSize:(CGSize)a4;
+ (id)attributedStringWithMatchHighlighted:(id)a3 optionalAttributedHighlightedString:(id)a4 textCheckingResult:(id)a5 highlightColor:(id)a6 insideFrame:(CGRect)a7 finishingUpRegexMatchFinder:(id)a8;
+ (id)attributedStringWithMatchHighlighted:(id)a3 optionalAttributedHighlightedString:(id)a4 textCheckingResult:(id)a5 usingAttributes:(id)a6 highlightColor:(id)a7 insideFrame:(CGRect)a8 isSnippetForParticipantMatch:(BOOL)a9 finishingUpRegexMatchFinder:(id)a10;
+ (id)attributedStringWithMatchHighlighted:(id)a3 textCheckingResult:(id)a4 highlightColor:(id)a5 insideFrame:(CGRect)a6 finishingUpRegexMatchFinder:(id)a7;
+ (id)attributesByHighlightingAttributes:(id)a3 withHighlightColor:(id)a4;
+ (id)authorNameToHighlightForNote:(id)a3 fromSearchResult:(id)a4 textCheckingResult:(id *)a5;
+ (id)finishUpHighlightingWithMatchFinder:(id)a3 forAttributedString:(id)a4 inRange:(_NSRange)a5 highlightedAttributes:(id)a6;
+ (id)firstTextCheckingResultOfRegex:(id)a3 inDocumentText:(id)a4;
- (BOOL)isDisplayingParticipantMatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMathNote;
- (CGRect)snippetAttributedStringInsideFrame;
- (CGRect)titleAttributedStringInsideFrame;
- (ICSearchIndexable)currentContextObject;
- (ICSearchIndexable)object;
- (ICSearchResult)initWithMainContextObject:(id)a3 currentContextObject:(id)a4 configuration:(id)a5;
- (ICSearchResult)initWithObject:(id)a3 configuration:(id)a4;
- (ICSearchResultConfiguration)configuration;
- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder;
- (ICSearchResultRegexMatchFinder)participantHighlightRegexMatchFinder;
- (ICSearchResultRegexMatchFinder)snippetHighlightRegexMatchFinder;
- (ICSearchResultRegexMatchFinder)titleHighlightRegexMatchFinder;
- (NSAttributedString)displayingAttributedSnippet;
- (NSAttributedString)displayingAttributedTitle;
- (NSAttributedString)snippetAttributedString;
- (NSAttributedString)titleAttributedString;
- (NSDictionary)decomposedHighlightInfo;
- (NSRegularExpression)tipKitCheckRegex;
- (NSString)description;
- (NSString)displayingSnippet;
- (NSString)displayingTitle;
- (NSTextCheckingResult)displayingSnippetCheckingResult;
- (NSTextCheckingResult)displayingTitleCheckingResult;
- (NSValue)firstMatchingRangeInNote;
- (id)attributedSummaryWithBaseAttributes:(id)a3 highlightColor:(id)a4 insideFrame:(CGRect)a5;
- (id)attributedTitleWithBaseAttributes:(id)a3 highlightColor:(id)a4 insideFrame:(CGRect)a5;
- (id)snippetWithBaseAttributes:(id)a3 highlightColor:(id)a4 insideFrame:(CGRect)a5;
- (int64_t)compareByModificationDate:(id)a3;
- (unint64_t)hash;
- (void)initializeRegexes;
- (void)prepareDisplayingSnippetWithAccessingObject:(id)a3;
- (void)prepareDisplayingTitleWithAccessingObject:(id)a3;
- (void)prepareFirstMatchingRangeWithAccessingObject:(id)a3;
- (void)refetchObjectFromContext:(id)a3;
- (void)refreshDisplaySnippet;
- (void)refreshDisplayTitle;
- (void)refreshFirstMatchingRange;
- (void)setCurrentContextObject:(id)a3;
- (void)setDisplayingAttributedSnippet:(id)a3;
- (void)setDisplayingAttributedTitle:(id)a3;
- (void)setDisplayingSnippet:(id)a3;
- (void)setDisplayingSnippetCheckingResult:(id)a3;
- (void)setDisplayingTitle:(id)a3;
- (void)setDisplayingTitleCheckingResult:(id)a3;
- (void)setFirstMatchingRangeInNote:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setIsDisplayingParticipantMatch:(BOOL)a3;
- (void)setMathNote:(BOOL)a3;
- (void)setParticipantHighlightRegexMatchFinder:(id)a3;
- (void)setSnippetAttributedString:(id)a3;
- (void)setSnippetAttributedStringInsideFrame:(CGRect)a3;
- (void)setSnippetHighlightRegexMatchFinder:(id)a3;
- (void)setTipKitCheckRegex:(id)a3;
- (void)setTitleAttributedString:(id)a3;
- (void)setTitleAttributedStringInsideFrame:(CGRect)a3;
- (void)setTitleHighlightRegexMatchFinder:(id)a3;
@end

@implementation ICSearchResult

- (ICSearchResult)initWithObject:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)ICSearchResult;
  v9 = [(ICSearchResult *)&v31 init];
  if (v9)
  {
    if (!v7) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"object" functionName:"-[ICSearchResult initWithObject:configuration:]" simulateCrash:1 showAlert:0 format:@"object is nil"];
    }
    v10 = [v7 managedObjectContext];
    int v11 = objc_msgSend(v10, "ic_isMainThreadContext");

    if (v11)
    {
      objc_storeStrong((id *)&v9->_object, a3);
      objc_storeStrong((id *)&v9->_currentContextObject, a3);
    }
    else
    {
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__57;
      v29 = __Block_byref_object_dispose__57;
      id v30 = 0;
      v12 = [v7 managedObjectContext];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __47__ICSearchResult_initWithObject_configuration___block_invoke;
      v22[3] = &unk_1E5FD91F8;
      v24 = &v25;
      id v23 = v7;
      [v12 performBlockAndWait:v22];

      if (v26[5])
      {
        v13 = [MEMORY[0x1E4F837B8] sharedIndexer];
        uint64_t v14 = [v13 mainContextObjectForObjectIDURIString:v26[5]];
        object = v9->_object;
        v9->_object = (ICSearchIndexable *)v14;
      }
      else
      {
        v13 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[ICSearchResult initWithObject:configuration:](v13);
        }
      }

      _Block_object_dispose(&v25, 8);
    }
    objc_storeStrong((id *)&v9->_configuration, a4);
    uint64_t v16 = [(ICSearchIndexable *)v9->_object hash];
    v9->_cachedHash = [v8 hash] + v16;
    [(ICSearchResult *)v9 initializeRegexes];
    v17 = [v7 managedObjectContext];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__ICSearchResult_initWithObject_configuration___block_invoke_15;
    v19[3] = &unk_1E5FD91D0;
    v20 = v9;
    id v21 = v7;
    [v17 performBlockAndWait:v19];
  }
  return v9;
}

uint64_t __47__ICSearchResult_initWithObject_configuration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) searchIndexingIdentifier];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;
  return MEMORY[0x1F41817F8](v2);
}

uint64_t __47__ICSearchResult_initWithObject_configuration___block_invoke_15(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareDisplayingTitleWithAccessingObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) prepareDisplayingSnippetWithAccessingObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 prepareFirstMatchingRangeWithAccessingObject:v3];
}

- (ICSearchResult)initWithMainContextObject:(id)a3 currentContextObject:(id)a4 configuration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICSearchResult;
  v12 = [(ICSearchResult *)&v19 init];
  if (v12)
  {
    if (v9)
    {
      if (v10)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_object, a3);
        objc_storeStrong((id *)&v12->_currentContextObject, a4);
        objc_storeStrong((id *)&v12->_configuration, a5);
        uint64_t v13 = [v9 hash];
        v12->_cachedHash = [v11 hash] + v13;
        [(ICSearchResult *)v12 initializeRegexes];
        uint64_t v14 = [v10 managedObjectContext];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __79__ICSearchResult_initWithMainContextObject_currentContextObject_configuration___block_invoke;
        v16[3] = &unk_1E5FD91D0;
        v17 = v12;
        id v18 = v10;
        [v14 performBlockAndWait:v16];

        goto LABEL_5;
      }
    }
    else
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"mainContextObject" functionName:"-[ICSearchResult initWithMainContextObject:currentContextObject:configuration:]" simulateCrash:1 showAlert:0 format:@"mainContextObject is nil"];
      if (v10) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"currentContextObject" functionName:"-[ICSearchResult initWithMainContextObject:currentContextObject:configuration:]" simulateCrash:1 showAlert:0 format:@"currentContextObject is nil"];
    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

uint64_t __79__ICSearchResult_initWithMainContextObject_currentContextObject_configuration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareDisplayingTitleWithAccessingObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) prepareDisplayingSnippetWithAccessingObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 prepareFirstMatchingRangeWithAccessingObject:v3];
}

- (void)initializeRegexes
{
  v38[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICSearchResult *)self decomposedHighlightInfo];
  v4 = [v3 objectForKeyedSubscript:&unk_1F09A4418];
  if (v4)
  {
    v5 = [ICSearchResultRegexMatchFinder alloc];
    v6 = [v4 objectForKeyedSubscript:&unk_1F09A4430];
    id v7 = [v4 objectForKeyedSubscript:&unk_1F09A4448];
    id v8 = [(ICSearchResult *)self configuration];
    id v9 = [v8 searchString];
    id v10 = [(ICSearchResultRegexMatchFinder *)v5 initWithPrefixMatchingTokens:v6 substringMatchingTokens:v7 searchString:v9];
    [(ICSearchResult *)self setTitleHighlightRegexMatchFinder:v10];
  }
  id v11 = [v3 objectForKeyedSubscript:&unk_1F09A4460];
  if (v11)
  {
    v12 = [ICSearchResultRegexMatchFinder alloc];
    uint64_t v13 = [v11 objectForKeyedSubscript:&unk_1F09A4430];
    uint64_t v14 = [v11 objectForKeyedSubscript:&unk_1F09A4448];
    v15 = [(ICSearchResult *)self configuration];
    uint64_t v16 = [v15 searchString];
    v17 = [(ICSearchResultRegexMatchFinder *)v12 initWithPrefixMatchingTokens:v13 substringMatchingTokens:v14 searchString:v16];
    [(ICSearchResult *)self setParticipantHighlightRegexMatchFinder:v17];
  }
  v37 = v3;
  id v18 = [v3 objectForKeyedSubscript:&unk_1F09A4478];
  if (v18)
  {
    objc_super v19 = [ICSearchResultRegexMatchFinder alloc];
    v20 = [v18 objectForKeyedSubscript:&unk_1F09A4430];
    id v21 = [v18 objectForKeyedSubscript:&unk_1F09A4448];
    v22 = [(ICSearchResult *)self configuration];
    id v23 = [v22 searchString];
    v24 = [(ICSearchResultRegexMatchFinder *)v19 initWithPrefixMatchingTokens:v20 substringMatchingTokens:v21 searchString:v23];
    [(ICSearchResult *)self setSnippetHighlightRegexMatchFinder:v24];
  }
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] mergeFieldElement:v4 withElement:v18];
  v26 = [ICSearchResultRegexMatchFinder alloc];
  uint64_t v27 = [v25 objectForKeyedSubscript:&unk_1F09A4430];
  v28 = [v25 objectForKeyedSubscript:&unk_1F09A4448];
  v29 = [(ICSearchResult *)self configuration];
  id v30 = [v29 searchString];
  objc_super v31 = [(ICSearchResultRegexMatchFinder *)v26 initWithPrefixMatchingTokens:v27 substringMatchingTokens:v28 searchString:v30];
  [(ICSearchResult *)self setHighlightPatternRegexFinder:v31];

  v32 = (void *)MEMORY[0x1E4F28FD8];
  v33 = [(ICSearchResult *)self configuration];
  v34 = [v33 searchString];
  v38[0] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  v36 = objc_msgSend(v32, "ic_regexForSearchStrings:", v35);
  [(ICSearchResult *)self setTipKitCheckRegex:v36];
}

- (NSDictionary)decomposedHighlightInfo
{
  decomposedHighlightInfo = self->_decomposedHighlightInfo;
  if (!decomposedHighlightInfo)
  {
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    v5 = [(ICSearchResult *)self configuration];
    v6 = [v5 sortableSearchableItem];
    id v7 = [v6 highlightInfo];
    id v8 = [v4 decomposedHighlightInfo:v7];
    id v9 = self->_decomposedHighlightInfo;
    self->_decomposedHighlightInfo = v8;

    decomposedHighlightInfo = self->_decomposedHighlightInfo;
  }
  return decomposedHighlightInfo;
}

- (void)refreshDisplayTitle
{
  uint64_t v3 = [(ICSearchResult *)self object];
  v4 = [v3 managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ICSearchResult_refreshDisplayTitle__block_invoke;
  v5[3] = &unk_1E5FD8DF0;
  v5[4] = self;
  [v4 performBlockAndWait:v5];
}

void __37__ICSearchResult_refreshDisplayTitle__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 object];
  [v1 prepareDisplayingTitleWithAccessingObject:v2];
}

- (void)refreshDisplaySnippet
{
  uint64_t v3 = [(ICSearchResult *)self object];
  v4 = [v3 managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__ICSearchResult_refreshDisplaySnippet__block_invoke;
  v5[3] = &unk_1E5FD8DF0;
  v5[4] = self;
  [v4 performBlockAndWait:v5];
}

void __39__ICSearchResult_refreshDisplaySnippet__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 object];
  [v1 prepareDisplayingSnippetWithAccessingObject:v2];
}

- (void)refreshFirstMatchingRange
{
  uint64_t v3 = [(ICSearchResult *)self object];
  v4 = [v3 managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ICSearchResult_refreshFirstMatchingRange__block_invoke;
  v5[3] = &unk_1E5FD8DF0;
  v5[4] = self;
  [v4 performBlockAndWait:v5];
}

void __43__ICSearchResult_refreshFirstMatchingRange__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 object];
  [v1 prepareFirstMatchingRangeWithAccessingObject:v2];
}

- (void)prepareDisplayingTitleWithAccessingObject:(id)a3
{
  id v15 = a3;
  -[ICSearchResult setTitleAttributedStringInsideFrame:](self, "setTitleAttributedStringInsideFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(ICSearchResult *)self setDisplayingTitle:0];
  [(ICSearchResult *)self setDisplayingTitleCheckingResult:0];
  if (objc_opt_respondsToSelector()) {
    v4 = v15;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  objc_opt_class();
  v6 = ICDynamicCast();
  id v7 = v6;
  if (v5) {
    [v5 trimmedTitle];
  }
  else {
  id v8 = [v6 title];
  }
  id v9 = objc_msgSend(v8, "ic_whitespaceAndNewlineCoalescedString");

  if (v9)
  {
    [(ICSearchResult *)self setDisplayingTitle:v9];
    id v10 = [(ICSearchResult *)self titleHighlightRegexMatchFinder];
    id v11 = [(ICSearchResult *)self displayingTitle];
    v12 = [v10 firstMatchInDocumentWithGlobalFallback:v11];
    [(ICSearchResult *)self setDisplayingTitleCheckingResult:v12];
  }
  if (v5)
  {
    uint64_t v13 = [v5 trimmedAttributedTitle];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      [(ICSearchResult *)self setDisplayingAttributedTitle:v13];
    }
  }
}

- (void)prepareDisplayingSnippetWithAccessingObject:(id)a3
{
  id v4 = a3;
  -[ICSearchResult setSnippetAttributedStringInsideFrame:](self, "setSnippetAttributedStringInsideFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(ICSearchResult *)self setDisplayingSnippet:0];
  [(ICSearchResult *)self setDisplayingSnippetCheckingResult:0];
  [(ICSearchResult *)self setIsDisplayingParticipantMatch:0];
  if (objc_opt_respondsToSelector()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    if ([v6 isPasswordProtected])
    {
      objc_opt_class();
      id v8 = ICDynamicCast();
      id v9 = [MEMORY[0x1E4F83418] snippetForPasswordProtectedNote:v8];
      [(ICSearchResult *)self setDisplayingSnippet:v9];
LABEL_14:

      goto LABEL_15;
    }
    id v10 = [(ICSearchResult *)self participantHighlightRegexMatchFinder];

    if (v10)
    {
      id v28 = 0;
      id v11 = +[ICSearchResult authorNameToHighlightForNote:v7 fromSearchResult:self textCheckingResult:&v28];
      id v12 = v28;
      if (v11)
      {
        uint64_t v13 = NSString;
        uint64_t v14 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared with %@" value:@"Shared with %@" table:0 allowSiri:1];
        id v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v11);
        [(ICSearchResult *)self setDisplayingSnippet:v15];

        uint64_t v16 = [(ICSearchResult *)self displayingSnippet];
        uint64_t v17 = [v16 rangeOfString:v11];

        id v18 = [ICSearchTextCheckingResult alloc];
        uint64_t v19 = [v12 range] + v17;
        [v12 range];
        uint64_t v21 = -[ICSearchTextCheckingResult initWithRange:](v18, "initWithRange:", v19, v20);

        [(ICSearchResult *)self setDisplayingSnippetCheckingResult:v21];
        [(ICSearchResult *)self setIsDisplayingParticipantMatch:1];
        id v12 = (id)v21;
      }
    }
    uint64_t v22 = [(ICSearchResult *)self displayingSnippet];
    if (!v22
      || (id v23 = (void *)v22,
          [(ICSearchResult *)self displayingSnippetCheckingResult],
          v24 = objc_claimAutoreleasedReturnValue(),
          v24,
          v23,
          !v24))
    {
      uint64_t v25 = [v7 noteWithoutTitle];
      v26 = objc_msgSend(v25, "ic_whitespaceAndNewlineCoalescedAttributedString");
      [(ICSearchResult *)self setDisplayingAttributedSnippet:v26];

      id v8 = [(ICSearchResult *)self snippetHighlightRegexMatchFinder];
      id v9 = [(ICSearchResult *)self displayingSnippet];
      uint64_t v27 = [v8 firstMatchInDocumentWithGlobalFallback:v9];
      [(ICSearchResult *)self setDisplayingSnippetCheckingResult:v27];

      goto LABEL_14;
    }
  }
LABEL_15:
}

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_object == (ICSearchIndexable *)*((void *)v4 + 4)
    && [(ICSearchResultConfiguration *)self->_configuration isEqual:*((void *)v4 + 5)];

  return v5;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = [(ICSearchResult *)self configuration];
  BOOL v5 = [v4 searchString];
  uint64_t v6 = [v5 hash];
  id v7 = [(ICSearchResult *)self object];
  id v8 = [v7 searchIndexingIdentifier];
  id v9 = [v3 stringWithFormat:@"(searchStringHash = %lu) %@", v6, v8];

  return (NSString *)v9;
}

- (int64_t)compareByModificationDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICSearchResult *)self object];
  uint64_t v6 = [v5 modificationDate];
  id v7 = [v4 object];

  id v8 = [v7 modificationDate];
  int64_t v9 = [v6 compare:v8];

  return v9;
}

- (void)refetchObjectFromContext:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(ICSearchIndexable *)self->_object objectID];

    if (v4)
    {
      BOOL v5 = [(ICSearchIndexable *)self->_object objectID];
      uint64_t v6 = [v8 existingObjectWithID:v5 error:0];
      object = self->_object;
      self->_object = v6;
    }
  }
}

- (id)attributedSummaryWithBaseAttributes:(id)a3 highlightColor:(id)a4 insideFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [(ICSearchResult *)self configuration];
  uint64_t v14 = [v13 foundAttachmentObjectID];

  if (v14)
  {
    id v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Found in attachments" value:@"Found in attachments" table:0 allowSiri:1];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15];
  }
  else
  {
    uint64_t v16 = -[ICSearchResult snippetWithBaseAttributes:highlightColor:insideFrame:](self, "snippetWithBaseAttributes:highlightColor:insideFrame:", v11, v12, x, y, width, height);
  }

  return v16;
}

- (void)prepareFirstMatchingRangeWithAccessingObject:(id)a3
{
  id v27 = a3;
  [(ICSearchResult *)self setFirstMatchingRangeInNote:0];
  uint64_t v4 = [v27 searchResultType];
  if (v4 == 1)
  {
    objc_opt_class();
    uint64_t v17 = ICDynamicCast();
    BOOL v5 = v17;
    if (!v17) {
      goto LABEL_19;
    }
    uint64_t v18 = [v17 rangeInNote];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_19;
    }
    id v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v18, v19);
    uint64_t v20 = self;
    uint64_t v21 = v7;
LABEL_10:
    [(ICSearchResult *)v20 setFirstMatchingRangeInNote:v21];
    goto LABEL_18;
  }
  if (v4) {
    goto LABEL_20;
  }
  objc_opt_class();
  BOOL v5 = ICDynamicCast();
  objc_opt_class();
  uint64_t v6 = ICDynamicCast();
  id v7 = (void *)v6;
  if (v5)
  {
    id v8 = [v5 searchableString];
    int64_t v9 = [(ICSearchResult *)self highlightPatternRegexFinder];
    id v10 = [v8 string];
    id v11 = [v9 firstMatchInDocumentWithGlobalFallback:v10];

    if (v11)
    {
      uint64_t v12 = [v11 range];
      uint64_t v14 = objc_msgSend(v5, "textRangeForSearchRange:inSearchableString:", v12, v13, v8);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v14, v15);
      }
      [(ICSearchResult *)self setFirstMatchingRangeInNote:v16];
    }
    goto LABEL_17;
  }
  if (v6)
  {
    id v8 = [(ICSearchResult *)self displayingSnippetCheckingResult];
    if (v8) {
      goto LABEL_14;
    }
    uint64_t v22 = [v7 contentAsPlainTextPreservingNewlines];
    id v23 = [(ICSearchResult *)self highlightPatternRegexFinder];
    id v8 = [v23 firstMatchInDocumentWithGlobalFallback:v22];

    if (v8)
    {
LABEL_14:
      v24 = (void *)MEMORY[0x1E4F29238];
      uint64_t v25 = [v8 range];
      id v11 = objc_msgSend(v24, "valueWithRange:", v25, v26);
      [(ICSearchResult *)self setFirstMatchingRangeInNote:v11];
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v20 = self;
    uint64_t v21 = 0;
    goto LABEL_10;
  }
LABEL_18:

LABEL_19:
LABEL_20:
}

+ (CGRect)boundingRectForAttributedString:(id)a3 fittingSize:(CGSize)a4
{
  objc_msgSend(a3, "boundingRectWithSize:options:context:", 3, 0, a4.width + a4.width, a4.height + a4.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

+ (BOOL)canFitAttributedString:(id)a3 ellipses:(id)a4 shouldPrefixWithEllipses:(BOOL)a5 insideFrame:(CGRect)a6 centered:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.size.height;
  double width = a6.size.width;
  BOOL v10 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = v13;
  uint64_t v16 = v15;
  uint64_t v17 = v15;
  if (v10)
  {
    uint64_t v18 = (void *)[v15 mutableCopy];
    [v18 insertAttributedString:v14 atIndex:0];
    uint64_t v17 = (void *)[v18 copy];
  }
  [v14 size];
  [a1 boundingRectForAttributedString:v14 fittingSize:width];
  double v20 = 1.0;
  if (v7) {
    double v20 = 0.5;
  }
  CGFloat v21 = width * v20;
  CGFloat v22 = fmax(height, ceil(v19));
  objc_msgSend(a1, "boundingRectForAttributedString:fittingSize:", v17, v21, v22);
  v30.origin.double x = v23;
  v30.origin.double y = v24;
  v30.size.double width = v25;
  v30.size.double height = v26;
  v29.origin.double x = 0.0;
  v29.origin.double y = 0.0;
  v29.size.double width = v21;
  v29.size.double height = v22;
  BOOL v27 = CGRectContainsRect(v29, v30);

  return v27;
}

+ (id)attributesByHighlightingAttributes:(id)a3 withHighlightColor:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    double v6 = v5;
    id v7 = a3;
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4FB1618];
    id v9 = a3;
    double v6 = [v8 tintColor];
  }
  if (a3) {
    id v10 = a3;
  }
  else {
    id v10 = (id)MEMORY[0x1E4F1CC08];
  }
  id v11 = (void *)[v10 mutableCopy];

  [v11 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
  uint64_t v12 = (void *)[v11 copy];

  return v12;
}

+ (id)attributedStringWithMatchHighlighted:(id)a3 optionalAttributedHighlightedString:(id)a4 textCheckingResult:(id)a5 usingAttributes:(id)a6 highlightColor:(id)a7 insideFrame:(CGRect)a8 isSnippetForParticipantMatch:(BOOL)a9 finishingUpRegexMatchFinder:(id)a10
{
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  CGFloat v24 = v19;
  id v82 = a10;
  if (v19)
  {
    if (v20)
    {
      uint64_t v25 = [v19 length];
      if (v25 != [v20 length]) {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"attributedHighlightedString == ((void *)0) || string == ((void *)0) || string.length == attributedHighlightedString.length" functionName:"+[ICSearchResult attributedStringWithMatchHighlighted:optionalAttributedHighlightedString:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:]" simulateCrash:1 showAlert:0 format:@"Unsupported use of method."];
      }
    }
  }
  v80 = v22;
  uint64_t v26 = [v22 copy];
  BOOL v27 = (void *)v26;
  id v28 = (void *)MEMORY[0x1E4F1CC08];
  if (v26) {
    id v28 = (void *)v26;
  }
  id v29 = v28;

  v79 = v23;
  CGRect v30 = [a1 attributesByHighlightingAttributes:v29 withHighlightColor:v23];
  v81 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"…" attributes:v29];
  objc_super v31 = &off_1B0B98000;
  if (v21)
  {
    uint64_t v32 = [v21 range];
    uint64_t v34 = objc_msgSend(v19, "paragraphRangeForRange:", v32, v33);
    uint64_t v36 = v35;
    v37 = (char *)([v21 range] - v34);
    [v21 range];
    uint64_t v39 = v38;
    v76 = v24;
    if (v20)
    {
      objc_msgSend(v20, "attributedSubstringFromRange:", v34, v36);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v41 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v40];
      uint64_t v42 = objc_msgSend(v41, "ic_range");
      objc_msgSend(v41, "addAttributes:range:", v29, v42, v43);
    }
    else
    {
      objc_msgSend(v24, "substringWithRange:", v34, v36);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v45 = objc_alloc(MEMORY[0x1E4F28E48]);
      if (v40) {
        v46 = v40;
      }
      else {
        v46 = &stru_1F0973378;
      }
      id v41 = (id)[v45 initWithString:v46 attributes:v29];
    }

    objc_msgSend(v41, "addAttributes:range:", v30, v37, v39);
    v112.origin.CGFloat x = x;
    v112.origin.CGFloat y = y;
    v112.size.CGFloat width = width;
    v112.size.CGFloat height = height;
    if (CGRectIsInfinite(v112))
    {
      id v47 = v41;
      objc_super v31 = &off_1B0B98000;
    }
    else
    {
      uint64_t v92 = 0;
      v93 = &v92;
      uint64_t v94 = 0x2020000000;
      v95 = 0;
      if (a9) {
        goto LABEL_24;
      }
      v95 = v37;
      v48 = [v41 string];
      v74 = &v37[v39];
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __210__ICSearchResult_attributedStringWithMatchHighlighted_optionalAttributedHighlightedString_textCheckingResult_usingAttributes_highlightColor_insideFrame_isSnippetForParticipantMatch_finishingUpRegexMatchFinder___block_invoke;
      v98[3] = &unk_1E5FDD7E0;
      v102 = v37;
      uint64_t v103 = v39;
      id v49 = v41;
      id v99 = v49;
      id v104 = a1;
      id v50 = v81;
      CGFloat v105 = x;
      CGFloat v106 = y;
      CGFloat v107 = width;
      CGFloat v108 = height;
      BOOL v109 = a9;
      id v100 = v50;
      v101 = &v92;
      objc_msgSend(v48, "enumerateSubstringsInRange:options:usingBlock:", 0, v74, 259, v98);

      if (!v93[3])
      {
LABEL_24:
        id v47 = v41;
        CGFloat v24 = v76;
        objc_super v31 = &off_1B0B98000;
      }
      else
      {
        id v73 = v50;
        v78 = v49;
        uint64_t v51 = [v49 length];
        uint64_t v75 = v93[3];
        v52 = NSString;
        v53 = [v49 string];
        int v54 = objc_msgSend(v52, "ic_isCharacterInlineAttachmentPrefix:", objc_msgSend(v53, "characterAtIndex:", v93[3] - 1));
        uint64_t v55 = v51 - v75;

        uint64_t v56 = v93[3];
        CGFloat v24 = v76;
        if (v54)
        {
          v93[3] = --v56;
          ++v55;
        }
        objc_super v31 = &off_1B0B98000;
        v57 = objc_msgSend(v78, "ic_attributedSubstringFromRange:", v56, v55);
        id v47 = (id)[v57 mutableCopy];

        if (v93[3]) {
          [v47 insertAttributedString:v73 atIndex:0];
        }
      }
      _Block_object_dispose(&v92, 8);
    }
    goto LABEL_29;
  }
  id v44 = v20;
  if (v20)
  {
    id v41 = v44;
    id v20 = v44;
LABEL_28:
    v59 = (void *)[v41 mutableCopy];
    uint64_t v60 = objc_msgSend(v41, "ic_range");
    objc_msgSend(v59, "addAttributes:range:", v29, v60, v61);
    id v47 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v59];

LABEL_29:
    goto LABEL_30;
  }
  id v20 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v19];
  v110[0] = 0;
  uint64_t v58 = [MEMORY[0x1E4F83798] snippetForAttributedContent:v20 attributedSnippetIfNecessary:v110];
  id v41 = v110[0];

  if (v41)
  {
    CGFloat v24 = (void *)v58;
    goto LABEL_28;
  }
  id v71 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v58) {
    v72 = (__CFString *)v58;
  }
  else {
    v72 = &stru_1F0973378;
  }
  id v47 = (id)[v71 initWithString:v72 attributes:v29];
  CGFloat v24 = (void *)v58;
LABEL_30:
  if ((unint64_t)[v47 length] >= 0x100)
  {
    uint64_t v62 = objc_msgSend(v47, "attributedSubstringFromRange:", 0, 255);

    id v47 = (id)v62;
  }
  v63 = objc_msgSend(v47, "ic_attributedStringByReplacingNewlineCharactersWithWhiteSpace");

  v64 = objc_msgSend((id)objc_opt_class(), "finishUpHighlightingWithMatchFinder:forAttributedString:inRange:highlightedAttributes:", v82, v63, 0, objc_msgSend(v63, "length"), v30);

  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3010000000;
  uint64_t v96 = 0;
  uint64_t v97 = 0;
  v95 = (char *)&unk_1B0BF84BB;
  v65 = [v64 string];
  uint64_t v66 = [v64 length];
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = *((void *)v31 + 232);
  v83[2] = __210__ICSearchResult_attributedStringWithMatchHighlighted_optionalAttributedHighlightedString_textCheckingResult_usingAttributes_highlightColor_insideFrame_isSnippetForParticipantMatch_finishingUpRegexMatchFinder___block_invoke_2;
  v83[3] = &unk_1E5FDD808;
  v86 = &v92;
  id v67 = v64;
  id v84 = v67;
  id v87 = a1;
  id v68 = v81;
  id v85 = v68;
  CGFloat v88 = x;
  CGFloat v89 = y;
  CGFloat v90 = width;
  CGFloat v91 = height;
  objc_msgSend(v65, "enumerateSubstringsInRange:options:usingBlock:", 0, v66, 5, v83);

  v69 = objc_msgSend((id)objc_opt_class(), "finishUpHighlightingWithMatchFinder:forAttributedString:inRange:highlightedAttributes:", v82, v67, v93[4], v93[5], v30);

  _Block_object_dispose(&v92, 8);
  return v69;
}

void __210__ICSearchResult_attributedStringWithMatchHighlighted_optionalAttributedHighlightedString_textCheckingResult_usingAttributes_highlightColor_insideFrame_isSnippetForParticipantMatch_finishingUpRegexMatchFinder___block_invoke(uint64_t a1, int a2, NSRange range1, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  v12.length = range1.length;
  NSUInteger location = range1.location;
  NSRange v13 = *(NSRange *)(a1 + 56);
  v12.NSUInteger location = location;
  NSRange v9 = NSUnionRange(v12, v13);
  if (v9.length > 0xFF)
  {
    *a6 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "ic_attributedSubstringFromRange:", v9.location, v9.length);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 72), "canFitAttributedString:ellipses:shouldPrefixWithEllipses:insideFrame:centered:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104)))*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9.location; {
    else
    }
      *a6 = 1;
  }
}

void __210__ICSearchResult_attributedStringWithMatchHighlighted_optionalAttributedHighlightedString_textCheckingResult_usingAttributes_highlightColor_insideFrame_isSnippetForParticipantMatch_finishingUpRegexMatchFinder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v9 + 32) = 0;
  *(void *)(v9 + 40) = a3 + a4;
  objc_msgSend(*(id *)(a1 + 32), "ic_attributedSubstringFromRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 56), "canFitAttributedString:ellipses:shouldPrefixWithEllipses:insideFrame:centered:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88)) & 1) == 0)*a7 = 1; {
}
  }

+ (id)attributedStringWithMatchHighlighted:(id)a3 textCheckingResult:(id)a4 highlightColor:(id)a5 insideFrame:(CGRect)a6 finishingUpRegexMatchFinder:(id)a7
{
  return +[ICSearchResult attributedStringWithMatchHighlighted:optionalAttributedHighlightedString:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:](ICSearchResult, "attributedStringWithMatchHighlighted:optionalAttributedHighlightedString:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:", a3, 0, a4, 0, a5, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7);
}

+ (id)attributedStringWithMatchHighlighted:(id)a3 optionalAttributedHighlightedString:(id)a4 textCheckingResult:(id)a5 highlightColor:(id)a6 insideFrame:(CGRect)a7 finishingUpRegexMatchFinder:(id)a8
{
  return +[ICSearchResult attributedStringWithMatchHighlighted:optionalAttributedHighlightedString:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:](ICSearchResult, "attributedStringWithMatchHighlighted:optionalAttributedHighlightedString:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:", a3, a4, a5, 0, a6, 0, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height, a8);
}

+ (id)finishUpHighlightingWithMatchFinder:(id)a3 forAttributedString:(id)a4 inRange:(_NSRange)a5 highlightedAttributes:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v11;
  id v14 = v13;
  if (location || length != [v13 length])
  {
    v39.NSUInteger length = [v14 length];
    v38.NSUInteger location = location;
    v38.NSUInteger length = length;
    v39.NSUInteger location = 0;
    NSRange v17 = NSIntersectionRange(v38, v39);
    NSUInteger v15 = v17.location;
    uint64_t v16 = objc_msgSend(v14, "ic_attributedSubstringFromRange:", v17.location, v17.length);
  }
  else
  {
    NSUInteger v15 = 0;
    uint64_t v16 = v14;
  }
  uint64_t v18 = [v16 string];
  id v19 = [v10 matchesInDocumentWithPerTokenFallback:v18];

  id v20 = v14;
  if ([v19 count])
  {
    id v31 = v10;
    id v21 = (void *)[v14 mutableCopy];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v22 = v19;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v33;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = [*(id *)(*((void *)&v32 + 1) + 8 * v26) range];
          objc_msgSend(v21, "addAttributes:range:", v12, v27 + v15, v28);
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v24);
    }

    id v20 = (void *)[v21 copy];
    id v10 = v31;
  }
  id v29 = v20;

  return v29;
}

- (id)attributedTitleWithBaseAttributes:(id)a3 highlightColor:(id)a4 insideFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(ICSearchResult *)self displayingTitle];
  id v14 = [(ICSearchResult *)self displayingAttributedTitle];
  NSUInteger v15 = [(ICSearchResult *)self displayingTitleCheckingResult];
  uint64_t v16 = [(ICSearchResult *)self titleHighlightRegexMatchFinder];
  NSRange v17 = +[ICSearchResult attributedStringWithMatchHighlighted:optionalAttributedHighlightedString:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:](ICSearchResult, "attributedStringWithMatchHighlighted:optionalAttributedHighlightedString:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:", v13, v14, v15, v12, v11, 0, x, y, width, height, v16);

  [(ICSearchResult *)self setTitleAttributedString:v17];
  -[ICSearchResult setTitleAttributedStringInsideFrame:](self, "setTitleAttributedStringInsideFrame:", x, y, width, height);
  return [(ICSearchResult *)self titleAttributedString];
}

+ (id)authorNameToHighlightForNote:(id)a3 fromSearchResult:(id)a4 textCheckingResult:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 participantHighlightRegexMatchFinder];

  if (v9)
  {
    uint64_t v28 = a5;
    id v10 = [v8 displayingTitleCheckingResult];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v29 = v7;
    id v11 = [v7 authorsExcludingCurrentUser];
    uint64_t v34 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
    id v12 = 0;
    if (v34)
    {
      uint64_t v13 = *(void *)v40;
      id v31 = v11;
      long long v32 = v10;
      uint64_t v30 = *(void *)v40;
      while (2)
      {
        uint64_t v14 = 0;
        NSUInteger v15 = v12;
        do
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
          NSRange v17 = objc_msgSend(v16, "ic_localizedNameWithDefaultFormattingStyle");
          uint64_t v18 = [v8 participantHighlightRegexMatchFinder];
          id v12 = [v18 firstMatchInDocumentWithGlobalFallback:v17];

          if (v12)
          {
            if (v10)
            {
              long long v37 = 0u;
              long long v38 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v19 = objc_msgSend(v16, "ic_componentsForSearchHighlighting");
              id v20 = (id)[v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v20)
              {
                id v33 = v12;
                uint64_t v21 = *(void *)v36;
                while (2)
                {
                  for (i = 0; i != v20; i = (char *)i + 1)
                  {
                    if (*(void *)v36 != v21) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                    uint64_t v24 = [v8 configuration];
                    uint64_t v25 = [v24 searchString];
                    uint64_t v26 = [v23 compare:v25 options:1];

                    if (!v26)
                    {
                      id v20 = v17;
                      goto LABEL_20;
                    }
                  }
                  id v20 = (id)[v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
                  if (v20) {
                    continue;
                  }
                  break;
                }
LABEL_20:
                id v11 = v31;
                id v10 = v32;
                id v12 = v33;
                uint64_t v13 = v30;
              }
            }
            else
            {
              id v20 = v17;
            }

            if (v20)
            {

              if (v28)
              {
                id v12 = v12;
                id *v28 = v12;
              }
              goto LABEL_31;
            }
          }
          else
          {
          }
          ++v14;
          NSUInteger v15 = v12;
        }
        while (v14 != v34);
        uint64_t v34 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }

    id v20 = 0;
LABEL_31:
    id v7 = v29;
  }
  else
  {
    id v20 = 0;
    if (a5) {
      *a5 = 0;
    }
  }

  return v20;
}

+ (id)firstTextCheckingResultOfRegex:(id)a3 inDocumentText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 length];
  id v8 = 0;
  if (v5 && v7)
  {
    id v8 = objc_msgSend(v5, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  }

  return v8;
}

- (id)snippetWithBaseAttributes:(id)a3 highlightColor:(id)a4 insideFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy__57;
  long long v36 = __Block_byref_object_dispose__57;
  id v37 = 0;
  uint64_t v13 = [(ICSearchResult *)self displayingSnippet];
  if (v13)
  {

LABEL_4:
    NSUInteger v15 = [(ICSearchResult *)self object];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = [(ICSearchResult *)self object];
    }
    else
    {
      uint64_t v16 = 0;
    }

    NSRange v17 = [(ICSearchResult *)self object];
    uint64_t v18 = [v17 managedObjectContext];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__ICSearchResult_snippetWithBaseAttributes_highlightColor_insideFrame___block_invoke;
    v22[3] = &unk_1E5FDD830;
    id v19 = v16;
    id v23 = v19;
    uint64_t v24 = self;
    id v25 = v11;
    uint64_t v27 = &v32;
    id v26 = v12;
    CGFloat v28 = x;
    CGFloat v29 = y;
    CGFloat v30 = width;
    CGFloat v31 = height;
    [v18 performBlockAndWait:v22];

    goto LABEL_8;
  }
  uint64_t v14 = [(ICSearchResult *)self displayingAttributedSnippet];

  if (v14) {
    goto LABEL_4;
  }
LABEL_8:
  id v20 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v20;
}

void __71__ICSearchResult_snippetWithBaseAttributes_highlightColor_insideFrame___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isPasswordProtected];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2)
  {
    double v4 = [v3 displayingAttributedSnippet];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) displayingAttributedTitle];
      id v6 = (void *)[v5 mutableCopy];

      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = objc_msgSend(v6, "ic_range");
      objc_msgSend(v6, "addAttributes:range:", v7, v8, v9);
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v6];
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v6 = [*(id *)(a1 + 40) displayingSnippet];
      uint64_t v10 = [v20 initWithString:v6 attributes:*(void *)(a1 + 48)];
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    id v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v10;

    id v23 = *(void **)(a1 + 40);
    [v23 setSnippetAttributedString:0];
  }
  else
  {
    char v11 = [v3 isDisplayingParticipantMatch];
    id v12 = *(void **)(a1 + 40);
    if (v11) {
      [v12 participantHighlightRegexMatchFinder];
    }
    else {
    id v24 = [v12 snippetHighlightRegexMatchFinder];
    }
    uint64_t v13 = [*(id *)(a1 + 40) displayingSnippet];
    uint64_t v14 = [*(id *)(a1 + 40) displayingAttributedSnippet];
    NSUInteger v15 = [*(id *)(a1 + 40) displayingSnippetCheckingResult];
    uint64_t v16 = +[ICSearchResult attributedStringWithMatchHighlighted:optionalAttributedHighlightedString:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:](ICSearchResult, "attributedStringWithMatchHighlighted:optionalAttributedHighlightedString:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:", v13, v14, v15, *(void *)(a1 + 48), *(void *)(a1 + 56), [*(id *)(a1 + 40) isDisplayingParticipantMatch], *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), v24);
    [*(id *)(a1 + 40) setSnippetAttributedString:v16];

    objc_msgSend(*(id *)(a1 + 40), "setSnippetAttributedStringInsideFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    uint64_t v17 = [*(id *)(a1 + 40) snippetAttributedString];
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
}

- (ICSearchIndexable)object
{
  return self->_object;
}

- (BOOL)isMathNote
{
  return self->_mathNote;
}

- (void)setMathNote:(BOOL)a3
{
  self->_mathNote = a3;
}

- (ICSearchResultConfiguration)configuration
{
  return self->_configuration;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
}

- (NSRegularExpression)tipKitCheckRegex
{
  return self->_tipKitCheckRegex;
}

- (void)setTipKitCheckRegex:(id)a3
{
}

- (NSValue)firstMatchingRangeInNote
{
  return self->_firstMatchingRangeInNote;
}

- (void)setFirstMatchingRangeInNote:(id)a3
{
}

- (ICSearchIndexable)currentContextObject
{
  return self->_currentContextObject;
}

- (void)setCurrentContextObject:(id)a3
{
}

- (NSString)displayingTitle
{
  return self->_displayingTitle;
}

- (void)setDisplayingTitle:(id)a3
{
}

- (NSAttributedString)displayingAttributedTitle
{
  return self->_displayingAttributedTitle;
}

- (void)setDisplayingAttributedTitle:(id)a3
{
}

- (ICSearchResultRegexMatchFinder)titleHighlightRegexMatchFinder
{
  return self->_titleHighlightRegexMatchFinder;
}

- (void)setTitleHighlightRegexMatchFinder:(id)a3
{
}

- (NSTextCheckingResult)displayingTitleCheckingResult
{
  return self->_displayingTitleCheckingResult;
}

- (void)setDisplayingTitleCheckingResult:(id)a3
{
}

- (NSAttributedString)titleAttributedString
{
  return self->_titleAttributedString;
}

- (void)setTitleAttributedString:(id)a3
{
}

- (CGRect)titleAttributedStringInsideFrame
{
  double x = self->_titleAttributedStringInsideFrame.origin.x;
  double y = self->_titleAttributedStringInsideFrame.origin.y;
  double width = self->_titleAttributedStringInsideFrame.size.width;
  double height = self->_titleAttributedStringInsideFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTitleAttributedStringInsideFrame:(CGRect)a3
{
  self->_titleAttributedStringInsideFrame = a3;
}

- (NSString)displayingSnippet
{
  return self->_displayingSnippet;
}

- (void)setDisplayingSnippet:(id)a3
{
}

- (NSAttributedString)displayingAttributedSnippet
{
  return self->_displayingAttributedSnippet;
}

- (void)setDisplayingAttributedSnippet:(id)a3
{
}

- (ICSearchResultRegexMatchFinder)snippetHighlightRegexMatchFinder
{
  return self->_snippetHighlightRegexMatchFinder;
}

- (void)setSnippetHighlightRegexMatchFinder:(id)a3
{
}

- (NSTextCheckingResult)displayingSnippetCheckingResult
{
  return self->_displayingSnippetCheckingResult;
}

- (void)setDisplayingSnippetCheckingResult:(id)a3
{
}

- (NSAttributedString)snippetAttributedString
{
  return self->_snippetAttributedString;
}

- (void)setSnippetAttributedString:(id)a3
{
}

- (CGRect)snippetAttributedStringInsideFrame
{
  double x = self->_snippetAttributedStringInsideFrame.origin.x;
  double y = self->_snippetAttributedStringInsideFrame.origin.y;
  double width = self->_snippetAttributedStringInsideFrame.size.width;
  double height = self->_snippetAttributedStringInsideFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSnippetAttributedStringInsideFrame:(CGRect)a3
{
  self->_snippetAttributedStringInsideFrame = a3;
}

- (BOOL)isDisplayingParticipantMatch
{
  return self->_isDisplayingParticipantMatch;
}

- (void)setIsDisplayingParticipantMatch:(BOOL)a3
{
  self->_isDisplayingParticipantMatch = a3;
}

- (ICSearchResultRegexMatchFinder)participantHighlightRegexMatchFinder
{
  return self->_participantHighlightRegexMatchFinder;
}

- (void)setParticipantHighlightRegexMatchFinder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantHighlightRegexMatchFinder, 0);
  objc_storeStrong((id *)&self->_snippetAttributedString, 0);
  objc_storeStrong((id *)&self->_displayingSnippetCheckingResult, 0);
  objc_storeStrong((id *)&self->_snippetHighlightRegexMatchFinder, 0);
  objc_storeStrong((id *)&self->_displayingAttributedSnippet, 0);
  objc_storeStrong((id *)&self->_displayingSnippet, 0);
  objc_storeStrong((id *)&self->_titleAttributedString, 0);
  objc_storeStrong((id *)&self->_displayingTitleCheckingResult, 0);
  objc_storeStrong((id *)&self->_titleHighlightRegexMatchFinder, 0);
  objc_storeStrong((id *)&self->_displayingAttributedTitle, 0);
  objc_storeStrong((id *)&self->_displayingTitle, 0);
  objc_storeStrong((id *)&self->_currentContextObject, 0);
  objc_storeStrong((id *)&self->_firstMatchingRangeInNote, 0);
  objc_storeStrong((id *)&self->_tipKitCheckRegex, 0);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_decomposedHighlightInfo, 0);
}

- (void)initWithObject:(os_log_t)log configuration:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "No identifier for main context object search result", v1, 2u);
}

@end