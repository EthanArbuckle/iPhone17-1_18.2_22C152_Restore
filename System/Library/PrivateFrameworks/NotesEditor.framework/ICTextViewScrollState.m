@interface ICTextViewScrollState
+ (id)scrollStateForAttachment:(id)a3 inNote:(id)a4;
+ (id)scrollStateForRange:(_NSRange)a3 inNote:(id)a4;
+ (id)scrollStateForTextView:(id)a3;
+ (void)setupDateFormatter;
- (BOOL)applyToTextView:(id)a3;
- (BOOL)captureIsWithinTimeThreshold;
- (BOOL)isApplying;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromArchive;
- (BOOL)isValid;
- (BOOL)loadingFromDictionaryFailed;
- (ICNote)note;
- (ICTTMergeableStringSelection)topLeftStringSelection;
- (ICTextViewScrollState)initWithData:(id)a3 managedObjectContext:(id)a4;
- (ICTextViewScrollState)initWithDictionary:(id)a3 note:(id)a4;
- (NSData)dataRepresentation;
- (NSDate)date;
- (NSDictionary)dictionaryRepresentation;
- (NSString)noteIdentifier;
- (double)timeIntervalSinceCapture;
- (double)topLeftTextAttachmentScrollHeightOffsetRatio;
- (unint64_t)hash;
- (unint64_t)topLeftCharIndexAtCapture;
- (unint64_t)topLeftTextCharacterIndex;
- (void)dataRepresentation;
- (void)setDate:(id)a3;
- (void)setFromArchive:(BOOL)a3;
- (void)setIsApplying:(BOOL)a3;
- (void)setLoadingFromDictionaryFailed:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)setNoteIdentifier:(id)a3;
- (void)setTopLeftCharIndexAtCapture:(unint64_t)a3;
- (void)setTopLeftStringSelection:(id)a3;
- (void)setTopLeftTextAttachmentScrollHeightOffsetRatio:(double)a3;
@end

@implementation ICTextViewScrollState

+ (id)scrollStateForTextView:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 visibleTextRect];
  double v5 = v4;
  double v7 = v6;
  [v3 contentInset];
  double v9 = v5 + v8;
  double v11 = v7 + v10;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    [v3 safeAreaInsets];
    double v9 = v9 + v12;
    double v11 = v11 + v13;
  }
  v14 = objc_msgSend(v3, "closestPositionToPoint:", v9, v11 + 5.0);
  v15 = [v3 textRangeFromPosition:v14 toPosition:v14];
  uint64_t v16 = objc_msgSend(v3, "ic_characterRangeFromTextRange:", v15);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v17 = v16,
        [v3 textStorage],
        v18 = objc_claimAutoreleasedReturnValue(),
        unint64_t v19 = [v18 length],
        v18,
        v17 >= v19))
  {
    v28 = 0;
  }
  else
  {
    v20 = [v3 textStorage];
    int v21 = objc_msgSend(v20, "containsAttachmentsInRange:", v17, 1);

    double v22 = 0.0;
    if (v21)
    {
      [v3 firstRectForRange:v15];
      CGFloat x = v41.origin.x;
      CGFloat y = v41.origin.y;
      CGFloat width = v41.size.width;
      CGFloat height = v41.size.height;
      CGRectGetMidX(v41);
      v42.origin.CGFloat x = x;
      v42.origin.CGFloat y = y;
      v42.size.CGFloat width = width;
      v42.size.CGFloat height = height;
      CGRectGetMinY(v42);
      TSUClamp();
      double v22 = v27;
    }
    v28 = objc_alloc_init(ICTextViewScrollState);
    [(ICTextViewScrollState *)v28 setTopLeftTextAttachmentScrollHeightOffsetRatio:v22];
    v29 = [v3 editorController];
    v30 = [v29 note];
    [(ICTextViewScrollState *)v28 setNote:v30];

    v31 = [MEMORY[0x263EFF910] date];
    [(ICTextViewScrollState *)v28 setDate:v31];

    v32 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v17, 0);
    v39[0] = v32;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];

    v34 = [(ICTextViewScrollState *)v28 note];
    v35 = [v34 mergeableString];
    v36 = [v35 selectionForCharacterRanges:v33 selectionAffinity:1];
    [(ICTextViewScrollState *)v28 setTopLeftStringSelection:v36];

    [(ICTextViewScrollState *)v28 setTopLeftCharIndexAtCapture:v17];
  }
  v37 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    +[ICTextViewScrollState scrollStateForTextView:](v3, v37);
  }

  return v28;
}

+ (void)scrollStateForTextView:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = [a1 editorController];
  double v4 = [v3 note];
  double v5 = [v4 identifier];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Captured Text View Scroll State for Note %@", v6, 0xCu);
}

- (ICTextViewScrollState)initWithDictionary:(id)a3 note:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)ICTextViewScrollState;
  double v8 = [(ICTextViewScrollState *)&v30 init];
  double v9 = v8;
  if (v8)
  {
    [(ICTextViewScrollState *)v8 setFromArchive:1];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"ScrollStateTLStringSelectionData"];
    double v11 = [v6 objectForKeyedSubscript:@"ScrollStateNoteIdentifier"];
    double v12 = [v6 objectForKeyedSubscript:@"ScrollStateTLScrollHeightOffsetRatio"];
    double v13 = [v6 objectForKeyedSubscript:@"ScrollStateDate"];
    v14 = [v6 objectForKeyedSubscript:@"ScrollStateTLC"];
    uint64_t v15 = [v14 unsignedIntegerValue];

    objc_opt_class();
    v29 = (void *)v10;
    uint64_t v27 = v15;
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v10 options:0];
    }
    else {
      uint64_t v16 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(id)objc_opt_class() setupDateFormatter];
      unint64_t v17 = [(id)dateFormatter dateFromString:v13];
    }
    else
    {
      unint64_t v17 = 0;
    }
    objc_opt_class();
    v28 = (void *)v16;
    v18 = ICDynamicCast();
    if (!v18) {
      [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"verifiedSelectionData != ((void *)0)" functionName:"-[ICTextViewScrollState initWithDictionary:note:]" simulateCrash:1 showAlert:0 format:@"Trying to init a text view scroll state without top left StringSelectionData"];
    }
    unint64_t v19 = [v7 identifier];
    char v20 = [v19 isEqualToString:v11];

    if (v20)
    {
      if (v18)
      {
        int v21 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[ICTextViewScrollState initWithDictionary:note:]();
        }

        os_log_t v22 = (os_log_t)[objc_alloc(MEMORY[0x263F5ACF8]) initWithData:v18];
        if (v22)
        {
          [(ICTextViewScrollState *)v9 setTopLeftStringSelection:v22];
          [(ICTextViewScrollState *)v9 setDate:v17];
          [(ICTextViewScrollState *)v9 setNote:v7];
          [v12 floatValue];
          [(ICTextViewScrollState *)v9 setTopLeftTextAttachmentScrollHeightOffsetRatio:v23];
          [(ICTextViewScrollState *)v9 setTopLeftCharIndexAtCapture:v27];
        }
        else
        {
          [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"mergableStringSelection != ((void *)0)" functionName:"-[ICTextViewScrollState initWithDictionary:note:]" simulateCrash:1 showAlert:0 format:@"failure to create mergable string selection from data."];
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x263F5AE60];
      v25 = [v7 identifier];
      [v24 handleFailedAssertWithCondition:"identifierMatches", "-[ICTextViewScrollState initWithDictionary:note:]", 1, 0, @"Trying to init a text view scroll state but identifiers don't match: expected %@ : received %@", v25, v11 functionName simulateCrash showAlert format];
    }
    [(ICTextViewScrollState *)v9 setLoadingFromDictionaryFailed:1];
    os_log_t v22 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[ICTextViewScrollState initWithDictionary:note:]();
    }
    goto LABEL_19;
  }
LABEL_20:

  return v9;
}

- (ICTextViewScrollState)initWithData:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:0];
  }
  else {
  double v8 = [NSDictionary dictionary];
  }
  uint64_t v9 = [v8 objectForKeyedSubscript:@"ScrollStateNoteIdentifier"];
  uint64_t v10 = (void *)v9;
  double v11 = 0;
  if (v7 && v9)
  {
    double v11 = [MEMORY[0x263F5AC98] noteWithIdentifier:v9 context:v7];
  }
  double v12 = [(ICTextViewScrollState *)self initWithDictionary:v8 note:v11];

  return v12;
}

+ (id)scrollStateForAttachment:(id)a3 inNote:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 rangeForAttachment:v6];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  if (v7 && v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v12 = [v6 parentAttachment];

    if (v12)
    {
      double v13 = [v6 parentAttachment];
      uint64_t v9 = [v7 rangeForAttachment:v13];
      uint64_t v11 = v14;
    }
    else
    {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  uint64_t v15 = objc_msgSend(a1, "scrollStateForRange:inNote:", v9, v11, v7);

  return v15;
}

+ (id)scrollStateForRange:(_NSRange)a3 inNote:(id)a4
{
  NSUInteger location = a3.location;
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_alloc_init(ICTextViewScrollState);
  [(ICTextViewScrollState *)v6 setNote:v5];
  id v7 = [MEMORY[0x263EFF910] date];
  [(ICTextViewScrollState *)v6 setDate:v7];

  uint64_t v8 = [v5 textStorage];

  unint64_t v9 = [v8 length];
  if (v9 < location) {
    NSUInteger location = v9;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, 0);
  v16[0] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];

  double v12 = [(ICTextViewScrollState *)v6 note];
  double v13 = [v12 mergeableString];
  uint64_t v14 = [v13 selectionForCharacterRanges:v11 selectionAffinity:1];
  [(ICTextViewScrollState *)v6 setTopLeftStringSelection:v14];

  [(ICTextViewScrollState *)v6 setTopLeftCharIndexAtCapture:location];

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  v17[5] = *MEMORY[0x263EF8340];
  [(id)objc_opt_class() setupDateFormatter];
  id v3 = [(ICTextViewScrollState *)self topLeftStringSelection];
  double v4 = [v3 serialize];
  id v5 = [v4 base64EncodedStringWithOptions:0];

  id v6 = [(ICTextViewScrollState *)self date];
  if (v6)
  {
    id v7 = (void *)dateFormatter;
    uint64_t v8 = [(ICTextViewScrollState *)self date];
    unint64_t v9 = [v7 stringFromDate:v8];
  }
  else
  {
    unint64_t v9 = 0;
  }

  uint64_t v10 = [(ICTextViewScrollState *)self noteIdentifier];
  uint64_t v11 = NSNumber;
  [(ICTextViewScrollState *)self topLeftTextAttachmentScrollHeightOffsetRatio];
  double v12 = objc_msgSend(v11, "numberWithDouble:");
  double v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICTextViewScrollState topLeftCharIndexAtCapture](self, "topLeftCharIndexAtCapture"));
  if (v5)
  {
    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((topLeftDataAsString) != nil)", "-[ICTextViewScrollState dictionaryRepresentation]", 1, 0, @"Expected non-nil value for '%s'", "topLeftDataAsString");
    if (v9)
    {
LABEL_6:
      if (v10) {
        goto LABEL_7;
      }
LABEL_14:
      objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteIdentifier) != nil)", "-[ICTextViewScrollState dictionaryRepresentation]", 1, 0, @"Expected non-nil value for '%s'", "noteIdentifier");
      if (v12) {
        goto LABEL_8;
      }
LABEL_15:
      objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((offsetRatio) != nil)", "-[ICTextViewScrollState dictionaryRepresentation]", 1, 0, @"Expected non-nil value for '%s'", "offsetRatio");
      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((dateString) != nil)", "-[ICTextViewScrollState dictionaryRepresentation]", 1, 0, @"Expected non-nil value for '%s'", "dateString");
  if (!v10) {
    goto LABEL_14;
  }
LABEL_7:
  if (!v12) {
    goto LABEL_15;
  }
LABEL_8:
  if (v5 && v9 && v10)
  {
    v16[0] = @"ScrollStateTLStringSelectionData";
    v16[1] = @"ScrollStateDate";
    v17[0] = v5;
    v17[1] = v9;
    void v16[2] = @"ScrollStateNoteIdentifier";
    v16[3] = @"ScrollStateTLScrollHeightOffsetRatio";
    v17[2] = v10;
    v17[3] = v12;
    v16[4] = @"ScrollStateTLC";
    v17[4] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
    goto LABEL_17;
  }
LABEL_16:
  [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no", "-[ICTextViewScrollState dictionaryRepresentation]", 1, 0, @"Missing data to create scroll state archive, returning nil" functionName simulateCrash showAlert format];
  uint64_t v14 = 0;
LABEL_17:

  return (NSDictionary *)v14;
}

- (NSData)dataRepresentation
{
  v2 = [(ICTextViewScrollState *)self dictionaryRepresentation];
  if (v2)
  {
    id v8 = 0;
    id v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:&v8];
    id v4 = v8;
    if (v4)
    {
      id v5 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ICTextViewScrollState dataRepresentation]();
      }

      id v6 = 0;
    }
    else
    {
      id v6 = v3;
    }
  }
  else
  {
    id v6 = 0;
  }

  return (NSData *)v6;
}

- (void)setNote:(id)a3
{
  p_note = &self->_note;
  id v7 = a3;
  id v5 = objc_storeWeak((id *)p_note, v7);
  id v6 = [v7 identifier];

  [(ICTextViewScrollState *)self setNoteIdentifier:v6];
}

- (unint64_t)topLeftTextCharacterIndex
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v3 = [(ICTextViewScrollState *)self topLeftStringSelection];
  if (v3)
  {
    id v4 = [(ICTextViewScrollState *)self note];

    if (v4)
    {
      id v5 = [(ICTextViewScrollState *)self note];
      id v6 = [v5 managedObjectContext];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __50__ICTextViewScrollState_topLeftTextCharacterIndex__block_invoke;
      v9[3] = &unk_2640B85C8;
      v9[4] = self;
      v9[5] = &v10;
      [v6 performBlockAndWait:v9];
    }
  }
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __50__ICTextViewScrollState_topLeftTextCharacterIndex__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) note];
  id v3 = [v2 mergeableString];
  id v4 = [*(id *)(a1 + 32) topLeftStringSelection];
  id v8 = [v3 characterRangesForSelection:v4];

  id v5 = v8;
  if (v8)
  {
    id v6 = [v8 firstObject];
    uint64_t v7 = [v6 rangeValue];

    id v5 = v8;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  }
}

- (BOOL)isValid
{
  BOOL v3 = [(ICTextViewScrollState *)self captureIsWithinTimeThreshold];
  if (v3) {
    LOBYTE(v3) = ![(ICTextViewScrollState *)self loadingFromDictionaryFailed];
  }
  return v3;
}

- (double)timeIntervalSinceCapture
{
  BOOL v3 = [MEMORY[0x263EFF910] date];
  id v4 = [(ICTextViewScrollState *)self date];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (BOOL)captureIsWithinTimeThreshold
{
  [(ICTextViewScrollState *)self timeIntervalSinceCapture];
  return v2 < 300.0;
}

- (BOOL)applyToTextView:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__21;
  v73 = __Block_byref_object_dispose__21;
  id v74 = 0;
  double v5 = [(ICTextViewScrollState *)self note];
  double v6 = [v5 managedObjectContext];
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __41__ICTextViewScrollState_applyToTextView___block_invoke;
  v68[3] = &unk_2640B92A8;
  v68[4] = self;
  v68[5] = &v69;
  [v6 performBlockAndWait:v68];

  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    if (+[ICExtensionSafeAPIShims applicationState] == 2) {
      goto LABEL_12;
    }
    uint64_t v13 = [(ICTextViewScrollState *)self note];
    if (!v13) {
      goto LABEL_12;
    }
    uint64_t v14 = [v4 editorController];
    if (v14)
    {
      uint64_t v15 = [v4 editorController];
      uint64_t v16 = [v15 note];
      unint64_t v17 = [v16 identifier];
      int v18 = [v17 isEqualToString:v70[5]];

      if (!v18) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    int v21 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v54 = [v4 editorController];
      v55 = [v54 note];
      v56 = [v55 identifier];
      *(_DWORD *)buf = 138412290;
      v76 = v56;
      _os_log_debug_impl(&dword_20BE60000, v21, OS_LOG_TYPE_DEBUG, "Applying Text View Scroll State for Note %@", buf, 0xCu);
    }
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      uint64_t v23 = objc_msgSend(v4, "ic_visibleRange");
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v24 = v22;
        v25 = [v4 layoutManager];
        objc_msgSend(v25, "ensureLayoutForCharacterRange:", 0, v23 + v24);
      }
    }
    unint64_t v26 = [(ICTextViewScrollState *)self topLeftTextCharacterIndex];
    uint64_t v27 = objc_msgSend(v4, "ic_textRangeFromCharacterRange:", v26, 1);
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      v28 = [v4 textLayoutManager];
      v29 = [v28 documentRange];
      objc_super v30 = [v29 location];

      v31 = [v28 locationFromLocation:v30 withOffset:v26 + 1];
      v32 = (void *)[objc_alloc(MEMORY[0x263F816E0]) initWithLocation:v30 endLocation:v31];
      v33 = [v4 textLayoutManager];
      [v33 ensureLayoutForRange:v32];
    }
    else
    {
      v28 = [v4 layoutManager];
      objc_msgSend(v28, "ensureGlyphsForCharacterRange:", v26, 1);
    }

    [v4 firstRectForRange:v27];
    double v35 = v34;
    double v37 = v36;
    if ([(ICTextViewScrollState *)self topLeftTextCharacterIndex])
    {
      [(ICTextViewScrollState *)self topLeftTextAttachmentScrollHeightOffsetRatio];
      if (v38 == 0.0) {
        double v39 = -2.0;
      }
      else {
        double v39 = 0.0;
      }
      if (ICInternalSettingsIsTextKit2Enabled()) {
        [v4 safeAreaInsets];
      }
      else {
        [v4 contentInset];
      }
      double v42 = v35 + v39 - v40;
    }
    else
    {
      if (ICInternalSettingsIsTextKit2Enabled()) {
        [v4 safeAreaInsets];
      }
      else {
        [v4 contentInset];
      }
      double v42 = -v41;
    }
    [(ICTextViewScrollState *)self topLeftTextAttachmentScrollHeightOffsetRatio];
    if (v51 > 0.0)
    {
      [(ICTextViewScrollState *)self topLeftTextAttachmentScrollHeightOffsetRatio];
      double v42 = v42 + v37 * v52;
    }
    [v4 contentOffset];
    if (vabdd_f64(v42, v53) > 20.0) {
      objc_msgSend(v4, "setClippedContentOffset:", *MEMORY[0x263F00148], v42);
    }
    goto LABEL_43;
  }
  if (+[ICExtensionSafeAPIShims applicationState] != 2
    && ![(ICTextViewScrollState *)self isApplying])
  {
    uint64_t v7 = [(ICTextViewScrollState *)self note];
    if (v7)
    {
      id v8 = [v4 editorController];
      if (!v8)
      {

LABEL_34:
        [(ICTextViewScrollState *)self setIsApplying:1];
        v43 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v57 = [v4 editorController];
          v58 = [v57 note];
          v59 = [v58 identifier];
          *(_DWORD *)buf = 138412290;
          v76 = v59;
          _os_log_debug_impl(&dword_20BE60000, v43, OS_LOG_TYPE_DEBUG, "Applying Text View Scroll State for Note %@", buf, 0xCu);
        }
        unint64_t v44 = [(ICTextViewScrollState *)self topLeftTextCharacterIndex];
        objc_opt_class();
        v45 = [v4 textLayoutManager];
        v46 = [v45 textContentManager];
        v47 = ICDynamicCast();
        uint64_t v27 = [v47 outlineController];

        objc_msgSend(v27, "expandAncestorsOfRange:", v44, 1);
        objc_opt_class();
        v48 = ICDynamicCast();
        v49 = (void *)MEMORY[0x263F82E00];
        uint64_t v60 = MEMORY[0x263EF8330];
        uint64_t v61 = 3221225472;
        v62 = __41__ICTextViewScrollState_applyToTextView___block_invoke_70;
        v63 = &unk_2640B8A70;
        id v50 = v48;
        unint64_t v66 = v44;
        uint64_t v67 = 1;
        id v64 = v50;
        v65 = self;
        [v49 performWithoutAnimation:&v60];
        -[ICTextViewScrollState setIsApplying:](self, "setIsApplying:", 0, v60, v61, v62, v63);

LABEL_43:
        BOOL v19 = 1;
        goto LABEL_13;
      }
      unint64_t v9 = [v4 editorController];
      uint64_t v10 = [v9 note];
      uint64_t v11 = [v10 identifier];
      int v12 = [v11 isEqualToString:v70[5]];

      if (v12) {
        goto LABEL_34;
      }
    }
  }
LABEL_12:
  BOOL v19 = 0;
LABEL_13:
  _Block_object_dispose(&v69, 8);

  return v19;
}

void __41__ICTextViewScrollState_applyToTextView___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) note];
  uint64_t v2 = [v5 identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __41__ICTextViewScrollState_applyToTextView___block_invoke_70(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) topLeftTextAttachmentScrollHeightOffsetRatio];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);

  return [v2 scrollRangeToVisible:v3 withHeightPercentageAdjustment:v4 forceTop:1];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = ICDynamicCast();

  if (v5)
  {
    [(id)objc_opt_class() setupDateFormatter];
    double v6 = [(ICTextViewScrollState *)self date];
    if (v6)
    {
      uint64_t v7 = (void *)dateFormatter;
      id v8 = [(ICTextViewScrollState *)self date];
      unint64_t v9 = [v7 stringFromDate:v8];
    }
    else
    {
      unint64_t v9 = 0;
    }

    uint64_t v11 = [v5 date];
    if (v11)
    {
      int v12 = (void *)dateFormatter;
      uint64_t v13 = [v5 date];
      uint64_t v14 = [v12 stringFromDate:v13];
    }
    else
    {
      uint64_t v14 = 0;
    }

    uint64_t v15 = [(ICTextViewScrollState *)self topLeftStringSelection];
    uint64_t v16 = [v5 topLeftStringSelection];
    unint64_t v17 = (void *)*MEMORY[0x263EFFD08];
    if ((void *)*MEMORY[0x263EFFD08] == v15) {
      int v18 = 0;
    }
    else {
      int v18 = v15;
    }
    uint64_t v19 = v18;
    if (v17 == v16) {
      char v20 = 0;
    }
    else {
      char v20 = v16;
    }
    unint64_t v21 = v20;
    if (v19 | v21)
    {
      uint64_t v22 = (void *)v21;
      LOBYTE(v10) = 0;
      if (!v19 || !v21) {
        goto LABEL_43;
      }
      int v10 = [(id)v19 isEqual:v21];

      if (!v10) {
        goto LABEL_44;
      }
    }
    uint64_t v23 = v17 == v9 ? 0 : v9;
    uint64_t v19 = v23;
    uint64_t v24 = v17 == v14 ? 0 : v14;
    unint64_t v25 = v24;
    if (v19 | v25)
    {
      uint64_t v22 = (void *)v25;
      LOBYTE(v10) = 0;
      if (!v19 || !v25) {
        goto LABEL_43;
      }
      int v10 = [(id)v19 isEqual:v25];

      if (!v10)
      {
LABEL_44:

        goto LABEL_45;
      }
    }
    uint64_t v19 = [(ICTextViewScrollState *)self noteIdentifier];
    uint64_t v22 = [v5 noteIdentifier];
    if (v17 == (void *)v19) {
      unint64_t v26 = 0;
    }
    else {
      unint64_t v26 = (void *)v19;
    }
    unint64_t v27 = v26;
    if (v17 == v22) {
      v28 = 0;
    }
    else {
      v28 = v22;
    }
    unint64_t v29 = v28;
    if (!(v27 | v29)) {
      goto LABEL_39;
    }
    objc_super v30 = (void *)v29;
    if (!v27 || !v29)
    {

      goto LABEL_42;
    }
    int v36 = [(id)v27 isEqual:v29];

    if (v36)
    {
LABEL_39:
      [(ICTextViewScrollState *)self topLeftTextAttachmentScrollHeightOffsetRatio];
      double v32 = v31;
      [v5 topLeftTextAttachmentScrollHeightOffsetRatio];
      if (v32 == v33)
      {
        unint64_t v34 = [(ICTextViewScrollState *)self topLeftCharIndexAtCapture];
        LOBYTE(v10) = v34 == [v5 topLeftCharIndexAtCapture];
LABEL_43:

        goto LABEL_44;
      }
    }
LABEL_42:
    LOBYTE(v10) = 0;
    goto LABEL_43;
  }
  LOBYTE(v10) = 0;
LABEL_45:

  return v10;
}

- (unint64_t)hash
{
  [(id)objc_opt_class() setupDateFormatter];
  uint64_t v3 = [(ICTextViewScrollState *)self date];
  if (v3)
  {
    id v4 = (void *)dateFormatter;
    id v5 = [(ICTextViewScrollState *)self date];
    double v6 = [v4 stringFromDate:v5];
  }
  else
  {
    double v6 = 0;
  }

  uint64_t v7 = [(ICTextViewScrollState *)self topLeftStringSelection];
  uint64_t v8 = [v7 hash];
  char v9 = [v6 hash];
  int v10 = [(ICTextViewScrollState *)self noteIdentifier];
  [v10 hash];
  [(ICTextViewScrollState *)self topLeftTextAttachmentScrollHeightOffsetRatio];
  [(ICTextViewScrollState *)self topLeftCharIndexAtCapture];
  unint64_t v18 = ICHashWithHashKeys(v8, v11, v12, v13, v14, v15, v16, v17, v9);

  return v18;
}

+ (void)setupDateFormatter
{
  if (setupDateFormatter_onceToken != -1) {
    dispatch_once(&setupDateFormatter_onceToken, &__block_literal_global_24);
  }
}

uint64_t __43__ICTextViewScrollState_setupDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)dateFormatter;
  dateFormatter = (uint64_t)v0;

  uint64_t v2 = (void *)dateFormatter;

  return [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZ"];
}

- (ICNote)note
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);

  return (ICNote *)WeakRetained;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)isFromArchive
{
  return self->_fromArchive;
}

- (void)setFromArchive:(BOOL)a3
{
  self->_fromArchive = a3;
}

- (ICTTMergeableStringSelection)topLeftStringSelection
{
  return self->_topLeftStringSelection;
}

- (void)setTopLeftStringSelection:(id)a3
{
}

- (double)topLeftTextAttachmentScrollHeightOffsetRatio
{
  return self->_topLeftTextAttachmentScrollHeightOffsetRatio;
}

- (void)setTopLeftTextAttachmentScrollHeightOffsetRatio:(double)a3
{
  self->_topLeftTextAttachmentScrollHeightOffsetRatio = a3;
}

- (NSString)noteIdentifier
{
  return self->_noteIdentifier;
}

- (void)setNoteIdentifier:(id)a3
{
}

- (BOOL)loadingFromDictionaryFailed
{
  return self->_loadingFromDictionaryFailed;
}

- (void)setLoadingFromDictionaryFailed:(BOOL)a3
{
  self->_loadingFromDictionaryFailed = a3;
}

- (BOOL)isApplying
{
  return self->_isApplying;
}

- (void)setIsApplying:(BOOL)a3
{
  self->_isApplying = a3;
}

- (unint64_t)topLeftCharIndexAtCapture
{
  return self->_topLeftCharIndexAtCapture;
}

- (void)setTopLeftCharIndexAtCapture:(unint64_t)a3
{
  self->_topLeftCharIndexAtCapture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteIdentifier, 0);
  objc_storeStrong((id *)&self->_topLeftStringSelection, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_destroyWeak((id *)&self->_note);
}

- (void)initWithDictionary:note:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_20BE60000, v0, OS_LOG_TYPE_DEBUG, "Skipping loading text view scroll state from archive for note:%@", v1, 0xCu);
}

- (void)initWithDictionary:note:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_20BE60000, v0, OS_LOG_TYPE_DEBUG, "Loading text view scroll state from archive for note:%@", v1, 0xCu);
}

- (void)dataRepresentation
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_20BE60000, v0, OS_LOG_TYPE_ERROR, "ICTextViewScrollState: Unable to serialize dictionary %@", v1, 0xCu);
}

@end