@interface ICAttributionViewConfiguration
+ (OS_dispatch_queue)loadDataQueue;
- (BOOL)forceVisible;
- (BOOL)forcesAttributionHidden;
- (BOOL)forcesTimestampHidden;
- (BOOL)hasValidRange;
- (BOOL)isAttributionHidden;
- (BOOL)isBlurred;
- (BOOL)isDataLoaded;
- (BOOL)isDisclosureImageHidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttributionViewConfiguration:(id)a3;
- (BOOL)isFocused;
- (BOOL)isPreview;
- (BOOL)isStatusImageHidden;
- (BOOL)isTimestampHidden;
- (CGRect)adjustedFormattedTimestampFrame;
- (CGRect)adjustedFrame;
- (CGRect)associatedTextFrame;
- (CGRect)attributionFrame;
- (CGRect)disclosureImageFrame;
- (CGRect)formattedTimestampFrame;
- (CGRect)frame;
- (CGRect)rectForRange:(_NSRange)a3;
- (CGRect)statusImageFrame;
- (ICAttributionViewConfiguration)initWithConfiguration:(id)a3;
- (ICAttributionViewConfiguration)initWithSharedState:(id)a3 editGroups:(id)a4 parentConfiguration:(id)a5;
- (ICAttributionViewConfiguration)initWithSharedState:(id)a3 textEdit:(id)a4 parentConfiguration:(id)a5;
- (ICAttributionViewConfiguration)parentConfiguration;
- (ICAttributionViewConfigurationSharedState)sharedState;
- (ICTTTextEdit)textEdit;
- (NSArray)childConfigurations;
- (NSArray)editGroups;
- (NSArray)unreadUserIDs;
- (NSAttributedString)attribution;
- (NSAttributedString)formattedTimestamp;
- (NSDate)explicitTimestamp;
- (NSDate)timestamp;
- (NSMutableArray)highlightConfigurations;
- (NSOrderedSet)userIDs;
- (NSString)attributionUserID;
- (UIImage)disclosureImage;
- (UIImage)statusImage;
- (_NSRange)range;
- (_NSRange)trimmedRange;
- (double)appliedHorizontalAdjustmentRatio;
- (double)preferredHighlightValue;
- (id)attributionTextStorage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)editGroupForRange:(_NSRange)a3;
- (id)formattedTimestampTextStorage;
- (unint64_t)hash;
- (void)addEditGroup:(id)a3;
- (void)commonInitWithSharedState:(id)a3 range:(_NSRange)a4;
- (void)drawStatusImageInContext:(CGContext *)a3 canvasSize:(CGSize)a4;
- (void)loadDataWithCompletion:(id)a3;
- (void)setAdjustedFormattedTimestampFrame:(CGRect)a3;
- (void)setAdjustedFrame:(CGRect)a3;
- (void)setAppliedHorizontalAdjustmentRatio:(double)a3;
- (void)setAssociatedTextFrame:(CGRect)a3;
- (void)setAttribution:(id)a3;
- (void)setAttributionTextStorage:(id)a3;
- (void)setBlurred:(BOOL)a3;
- (void)setDataLoaded:(BOOL)a3;
- (void)setExplicitTimestamp:(id)a3;
- (void)setFocused:(BOOL)a3;
- (void)setForceVisible:(BOOL)a3;
- (void)setForcesAttributionHidden:(BOOL)a3;
- (void)setForcesTimestampHidden:(BOOL)a3;
- (void)setFormattedTimestamp:(id)a3;
- (void)setFormattedTimestampTextStorage:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightConfigurations:(id)a3;
- (void)setParentConfiguration:(id)a3;
- (void)setPreferredHighlightValue:(double)a3;
- (void)setPreview:(BOOL)a3;
- (void)setStatusImage:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrimmedRange:(_NSRange)a3;
- (void)synchronouslyLoadData;
- (void)updateAttribution;
- (void)updateAttributionTextStorage;
- (void)updateChildConfigurations;
- (void)updateFormattedTimestampTextStorage;
- (void)updateFrames;
- (void)updateHighlightAlpha;
- (void)updateHighlightFrames;
- (void)updateStatusImage;
- (void)updateTimestamp;
- (void)updateUnreadUserIDs;
@end

@implementation ICAttributionViewConfiguration

+ (OS_dispatch_queue)loadDataQueue
{
  if (loadDataQueue_token != -1) {
    dispatch_once(&loadDataQueue_token, &__block_literal_global_18);
  }
  v2 = (void *)loadDataQueue_loadDataQueue;

  return (OS_dispatch_queue *)v2;
}

void __47__ICAttributionViewConfiguration_loadDataQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.notes.attribution.configuration.load-data-queue", attr);
  v2 = (void *)loadDataQueue_loadDataQueue;
  loadDataQueue_loadDataQueue = (uint64_t)v1;
}

- (ICAttributionViewConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)ICAttributionViewConfiguration;
  v5 = [(ICAttributionViewConfiguration *)&v77 init];
  if (v5)
  {
    uint64_t v6 = [v4 sharedState];
    sharedState = v5->_sharedState;
    v5->_sharedState = (ICAttributionViewConfigurationSharedState *)v6;

    v8 = [v4 editGroups];
    uint64_t v9 = [v8 copy];
    editGroups = v5->_editGroups;
    v5->_editGroups = (NSArray *)v9;

    uint64_t v11 = [v4 textEdit];
    textEdit = v5->_textEdit;
    v5->_textEdit = (ICTTTextEdit *)v11;

    v5->_range.location = [v4 range];
    v5->_range.length = v13;
    v5->_trimmedRange.location = [v4 trimmedRange];
    v5->_trimmedRange.length = v14;
    [v4 frame];
    v5->_frame.origin.x = v15;
    v5->_frame.origin.y = v16;
    v5->_frame.size.width = v17;
    v5->_frame.size.height = v18;
    [v4 adjustedFrame];
    v5->_adjustedFrame.origin.x = v19;
    v5->_adjustedFrame.origin.y = v20;
    v5->_adjustedFrame.size.width = v21;
    v5->_adjustedFrame.size.height = v22;
    [v4 associatedTextFrame];
    v5->_associatedTextFrame.origin.x = v23;
    v5->_associatedTextFrame.origin.y = v24;
    v5->_associatedTextFrame.size.width = v25;
    v5->_associatedTextFrame.size.height = v26;
    uint64_t v27 = [v4 attribution];
    attribution = v5->_attribution;
    v5->_attribution = (NSAttributedString *)v27;

    [v4 attributionFrame];
    v5->_attributionFrame.origin.x = v29;
    v5->_attributionFrame.origin.y = v30;
    v5->_attributionFrame.size.width = v31;
    v5->_attributionFrame.size.height = v32;
    v5->_forcesAttributionHidden = [v4 forcesAttributionHidden];
    uint64_t v33 = [v4 attributionTextStorage];
    id attributionTextStorage = v5->_attributionTextStorage;
    v5->_id attributionTextStorage = (id)v33;

    uint64_t v35 = [v4 timestamp];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v35;

    v5->_forcesTimestampHidden = [v4 forcesTimestampHidden];
    uint64_t v37 = [v4 formattedTimestamp];
    formattedTimestamp = v5->_formattedTimestamp;
    v5->_formattedTimestamp = (NSAttributedString *)v37;

    [v4 formattedTimestampFrame];
    v5->_formattedTimestampFrame.origin.x = v39;
    v5->_formattedTimestampFrame.origin.y = v40;
    v5->_formattedTimestampFrame.size.width = v41;
    v5->_formattedTimestampFrame.size.height = v42;
    uint64_t v43 = [v4 formattedTimestampTextStorage];
    id formattedTimestampTextStorage = v5->_formattedTimestampTextStorage;
    v5->_id formattedTimestampTextStorage = (id)v43;

    [v4 adjustedFormattedTimestampFrame];
    v5->_adjustedFormattedTimestampFrame.origin.x = v45;
    v5->_adjustedFormattedTimestampFrame.origin.y = v46;
    v5->_adjustedFormattedTimestampFrame.size.width = v47;
    v5->_adjustedFormattedTimestampFrame.size.height = v48;
    uint64_t v49 = [v4 explicitTimestamp];
    explicitTimestamp = v5->_explicitTimestamp;
    v5->_explicitTimestamp = (NSDate *)v49;

    [v4 disclosureImageFrame];
    v5->_disclosureImageFrame.origin.x = v51;
    v5->_disclosureImageFrame.origin.y = v52;
    v5->_disclosureImageFrame.size.width = v53;
    v5->_disclosureImageFrame.size.height = v54;
    uint64_t v55 = [v4 statusImage];
    statusImage = v5->_statusImage;
    v5->_statusImage = (UIImage *)v55;

    [v4 statusImageFrame];
    v5->_statusImageFrame.origin.x = v57;
    v5->_statusImageFrame.origin.y = v58;
    v5->_statusImageFrame.size.width = v59;
    v5->_statusImageFrame.size.height = v60;
    [v4 appliedHorizontalAdjustmentRatio];
    v5->_appliedHorizontalAdjustmentRatio = v61;
    [v4 preferredHighlightValue];
    v5->_preferredHighlightValue = v62;
    id v63 = objc_alloc(MEMORY[0x263EFF980]);
    v64 = [v4 highlightConfigurations];
    uint64_t v65 = [v63 initWithArray:v64 copyItems:1];
    highlightConfigurations = v5->_highlightConfigurations;
    v5->_highlightConfigurations = (NSMutableArray *)v65;

    v67 = [v4 childConfigurations];
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __56__ICAttributionViewConfiguration_initWithConfiguration___block_invoke;
    v75[3] = &unk_2640BA600;
    v68 = v5;
    v76 = v68;
    uint64_t v69 = objc_msgSend(v67, "ic_map:", v75);
    childConfigurations = v68->_childConfigurations;
    v68->_childConfigurations = (NSArray *)v69;

    v68->_preview = [v4 isPreview];
    v68->_focused = [v4 isFocused];
    v68->_blurred = [v4 isBlurred];
    v71 = [v4 unreadUserIDs];
    uint64_t v72 = [v71 copy];
    unreadUserIDs = v68->_unreadUserIDs;
    v68->_unreadUserIDs = (NSArray *)v72;

    v68->_forceVisible = [v4 forceVisible];
    v68->_dataLoaded = [v4 isDataLoaded];
  }
  return v5;
}

id __56__ICAttributionViewConfiguration_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 copy];
  [v3 setParentConfiguration:*(void *)(a1 + 32)];

  return v3;
}

- (ICAttributionViewConfiguration)initWithSharedState:(id)a3 editGroups:(id)a4 parentConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICAttributionViewConfiguration;
  uint64_t v11 = [(ICAttributionViewConfiguration *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_editGroups, a4);
    objc_storeWeak((id *)&v12->_parentConfiguration, v10);
    NSUInteger v13 = [v9 firstObject];
    uint64_t v14 = [v13 range];
    -[ICAttributionViewConfiguration commonInitWithSharedState:range:](v12, "commonInitWithSharedState:range:", v8, v14, v15);
  }
  return v12;
}

- (ICAttributionViewConfiguration)initWithSharedState:(id)a3 textEdit:(id)a4 parentConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICAttributionViewConfiguration;
  uint64_t v11 = [(ICAttributionViewConfiguration *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textEdit, a4);
    objc_storeWeak((id *)&v12->_parentConfiguration, v10);
    uint64_t v13 = [v9 range];
    -[ICAttributionViewConfiguration commonInitWithSharedState:range:](v12, "commonInitWithSharedState:range:", v8, v13, v14);
  }

  return v12;
}

- (id)debugDescription
{
  if ([(ICAttributionViewConfiguration *)self forcesAttributionHidden])
  {
    v3 = NSString;
    id v4 = [(ICAttributionViewConfiguration *)self attribution];
    v5 = [v4 string];
    uint64_t v6 = [v3 stringWithFormat:@"[%@]", v5];
  }
  else
  {
    id v4 = [(ICAttributionViewConfiguration *)self attribution];
    uint64_t v6 = [v4 string];
  }

  if ([(ICAttributionViewConfiguration *)self forcesTimestampHidden])
  {
    v7 = NSString;
    id v8 = [(ICAttributionViewConfiguration *)self formattedTimestamp];
    id v9 = [v8 string];
    id v10 = [v7 stringWithFormat:@"[%@]", v9];
  }
  else
  {
    id v8 = [(ICAttributionViewConfiguration *)self formattedTimestamp];
    id v10 = [v8 string];
  }

  uint64_t v11 = [(ICAttributionViewConfiguration *)self childConfigurations];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = [(ICAttributionViewConfiguration *)self childConfigurations];
    uint64_t v14 = objc_msgSend(v13, "ic_map:", &__block_literal_global_22);
    uint64_t v15 = [v14 componentsJoinedByString:@"\n"];

    objc_super v16 = NSString;
    [(ICAttributionViewConfiguration *)self adjustedFrame];
    objc_super v17 = ICStringFromRect();
    CGFloat v18 = [v16 stringWithFormat:@"<Frame: %@\n Name: %@\n Time: %@\n%@>", v17, v6, v10, v15];
  }
  else
  {
    CGFloat v19 = NSString;
    [(ICAttributionViewConfiguration *)self adjustedFrame];
    uint64_t v15 = ICStringFromRect();
    CGFloat v18 = [v19 stringWithFormat:@"<Frame: %@\n Name: %@\n Time: %@>", v15, v6, v10];
  }

  return v18;
}

id __50__ICAttributionViewConfiguration_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 debugDescription];
  v3 = [v2 componentsSeparatedByString:@"\n"];
  id v4 = objc_msgSend(v3, "ic_map:", &__block_literal_global_28);
  v5 = [v4 componentsJoinedByString:@"\n"];

  return v5;
}

uint64_t __50__ICAttributionViewConfiguration_debugDescription__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"\t%@", a2];
}

- (BOOL)isEqualToAttributionViewConfiguration:(id)a3
{
  id v7 = a3;
  id v8 = [(ICAttributionViewConfiguration *)self textEdit];
  if (!v8)
  {
    uint64_t v15 = [v7 textEdit];
    if (!v15)
    {
      uint64_t v15 = 0;
      int v9 = 0;
      goto LABEL_7;
    }
  }
  v3 = [(ICAttributionViewConfiguration *)self textEdit];
  id v4 = [v7 textEdit];
  if ([v3 isEqual:v4])
  {
    int v9 = 1;
LABEL_7:
    uint64_t v11 = [(ICAttributionViewConfiguration *)self editGroups];
    if (v11 || ([v7 editGroups], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = [(ICAttributionViewConfiguration *)self editGroups];
      uint64_t v13 = [v7 editGroups];
      char v10 = [v12 isEqual:v13];

      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
      char v10 = 1;
    }

LABEL_13:
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v10 = 0;
LABEL_14:

LABEL_15:
  if (!v8) {

  }
  return v10;
}

- (BOOL)isAttributionHidden
{
  if (![(ICAttributionViewConfiguration *)self forcesAttributionHidden]
    && ![(ICAttributionViewConfiguration *)self isBlurred])
  {
    v5 = [(ICAttributionViewConfiguration *)self parentConfiguration];
    if (!v5 && [(ICAttributionViewConfiguration *)self isFocused])
    {
      char v4 = 1;
LABEL_12:

      return v4;
    }
    uint64_t v6 = [(ICAttributionViewConfiguration *)self parentConfiguration];
    if (!v6
      || ([(ICAttributionViewConfiguration *)self parentConfiguration],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 isFocused]))
    {
      id v7 = [(ICAttributionViewConfiguration *)self parentConfiguration];
      char v4 = [v7 isBlurred];

      if (!v6) {
        goto LABEL_12;
      }
    }
    else
    {
      char v4 = 1;
    }

    goto LABEL_12;
  }
  return 1;
}

- (BOOL)isTimestampHidden
{
  if ([(ICAttributionViewConfiguration *)self forcesTimestampHidden]
    || [(ICAttributionViewConfiguration *)self isPreview]
    || [(ICAttributionViewConfiguration *)self isFocused]
    || [(ICAttributionViewConfiguration *)self isBlurred])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v5 = [(ICAttributionViewConfiguration *)self parentConfiguration];
    if (v5)
    {
      uint64_t v6 = [(ICAttributionViewConfiguration *)self parentConfiguration];
      int v3 = [v6 isFocused] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isStatusImageHidden
{
  [(ICAttributionViewConfiguration *)self statusImageFrame];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(ICAttributionViewConfiguration *)self unreadUserIDs];
  if ([v7 count])
  {
    BOOL v8 = 1;
    if (![(ICAttributionViewConfiguration *)self isFocused] && v6 != 0.0 && v4 != 0.0)
    {
      int v9 = [(ICAttributionViewConfiguration *)self parentConfiguration];
      if (v9)
      {
        char v10 = [(ICAttributionViewConfiguration *)self parentConfiguration];
        if ([v10 isFocused]) {
          BOOL v8 = [(ICAttributionViewConfiguration *)self isBlurred];
        }
      }
      else
      {
        BOOL v8 = [(ICAttributionViewConfiguration *)self isBlurred];
      }
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)isDisclosureImageHidden
{
  if ([(ICAttributionViewConfiguration *)self isBlurred]
    || [(ICAttributionViewConfiguration *)self isPreview])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    double v4 = [(ICAttributionViewConfiguration *)self parentConfiguration];
    if (v4)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      double v5 = [(ICAttributionViewConfiguration *)self childConfigurations];
      if ((unint64_t)[v5 count] > 1) {
        LOBYTE(v3) = 0;
      }
      else {
        BOOL v3 = ![(ICAttributionViewConfiguration *)self forcesTimestampHidden];
      }
    }
  }
  return v3;
}

- (void)setFocused:(BOOL)a3
{
  self->_focused = a3;
  if (a3) {
    self->_blurred = 0;
  }
  [(ICAttributionViewConfiguration *)self updateHighlightAlpha];
}

- (void)setBlurred:(BOOL)a3
{
  self->_blurred = a3;
  if (a3) {
    self->_focused = 0;
  }
  [(ICAttributionViewConfiguration *)self updateHighlightAlpha];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectEqualToRect(self->_frame, a3))
  {
    self->_frame.origin.double x = x;
    self->_frame.origin.double y = y;
    self->_frame.size.double width = width;
    self->_frame.size.double height = height;
    -[ICAttributionViewConfiguration setAdjustedFrame:](self, "setAdjustedFrame:", x, y, width, height);
  }
}

- (void)setAdjustedFrame:(CGRect)a3
{
  double y = a3.origin.y;
  uint64_t v20 = *MEMORY[0x263EF8340];
  self->_adjustedFrame = a3;
  [(ICAttributionViewConfiguration *)self frame];
  double v6 = y - v5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(ICAttributionViewConfiguration *)self highlightConfigurations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v12 frame];
        objc_msgSend(v12, "setAdjustedFrame:");
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(ICAttributionViewConfiguration *)self childConfigurations];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__ICAttributionViewConfiguration_setAdjustedFrame___block_invoke;
  v14[3] = &unk_2640BA668;
  *(double *)&v14[5] = v6;
  v14[4] = self;
  [v13 enumerateObjectsUsingBlock:v14];
}

void __51__ICAttributionViewConfiguration_setAdjustedFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = a2;
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12 - *(double *)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 32) childConfigurations];
    id v52 = [v14 objectAtIndexedSubscript:a3 - 1];

    [v52 adjustedFrame];
    double v16 = v15;
    [v52 formattedTimestampFrame];
    if (v13 >= v16 + v17) {
      double v18 = v13;
    }
    else {
      double v18 = v16 + v17;
    }
    objc_msgSend(v5, "setAdjustedFrame:", v7, v18, v9, v11);
    [v5 adjustedFrame];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    [v52 adjustedFrame];
    v57.origin.CGFloat x = v27;
    v57.origin.CGFloat y = v28;
    v57.size.CGFloat width = v29;
    v57.size.double height = v30;
    v54.origin.CGFloat x = v20;
    v54.origin.CGFloat y = v22;
    v54.size.CGFloat width = v24;
    v54.size.double height = v26;
    CGRect v55 = CGRectIntersection(v54, v57);
    CGFloat x = v55.origin.x;
    CGFloat y = v55.origin.y;
    CGFloat width = v55.size.width;
    double height = v55.size.height;
    [v52 formattedTimestampFrame];
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.double height = height;
    if (!CGRectIsNull(v56))
    {
      [v52 formattedTimestampFrame];
      double v36 = v43;
      double v45 = v44;
      double v40 = v46;
      double v42 = v47;
      CGFloat v48 = [*(id *)(a1 + 32) childConfigurations];
      uint64_t v49 = [v48 firstObject];

      [v49 attributionFrame];
      if (height >= v50) {
        double v51 = v50;
      }
      else {
        double v51 = height;
      }
      double v38 = v45 - v51;
    }
    objc_msgSend(v52, "setAdjustedFormattedTimestampFrame:", v36, v38, v40, v42);
  }
}

- (void)setTrimmedRange:(_NSRange)a3
{
  if (self->_trimmedRange.location != a3.location || self->_trimmedRange.length != a3.length)
  {
    self->_trimmedRange = a3;
    -[ICAttributionViewConfiguration rectForRange:](self, "rectForRange:");
    -[ICAttributionViewConfiguration setAssociatedTextFrame:](self, "setAssociatedTextFrame:");
  }
}

- (void)addEditGroup:(id)a3
{
  id v18 = a3;
  double v4 = [(ICAttributionViewConfiguration *)self editGroups];
  id v5 = [v4 arrayByAddingObject:v18];
  editGroups = self->_editGroups;
  self->_editGroups = v5;

  v20.location = [v18 range];
  v20.length = v7;
  self->_range = NSUnionRange(self->_range, v20);
  if ([(ICAttributionViewConfiguration *)self hasValidRange])
  {
    double v8 = [(ICAttributionViewConfiguration *)self sharedState];
    double v9 = [v8 noteTextStorage];
    double v10 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v11 = [v18 range];
    NSUInteger v13 = objc_msgSend(v9, "ic_rangeByTrimmingCharactersInSet:inRange:", v10, v11, v12);
    NSUInteger v15 = v14;

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v13 = [v18 range];
      NSUInteger v15 = v16;
    }
    v21.location = v13;
    v21.length = v15;
    NSRange v17 = NSUnionRange(self->_trimmedRange, v21);
    -[ICAttributionViewConfiguration setTrimmedRange:](self, "setTrimmedRange:", v17.location, v17.length);
  }
}

- (void)loadDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() loadDataQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ICAttributionViewConfiguration_loadDataWithCompletion___block_invoke;
  v7[3] = &unk_2640BA690;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__ICAttributionViewConfiguration_loadDataWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) synchronouslyLoadData];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)synchronouslyLoadData
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(ICAttributionViewConfiguration *)self hasValidRange])
  {
    BOOL v3 = [(ICAttributionViewConfiguration *)self sharedState];
    id v4 = [v3 note];
    id v5 = [v4 managedObjectContext];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__ICAttributionViewConfiguration_synchronouslyLoadData__block_invoke;
    v16[3] = &unk_2640B8140;
    v16[4] = self;
    [v5 performBlockAndWait:v16];

    [(ICAttributionViewConfiguration *)self updateStatusImage];
    [(ICAttributionViewConfiguration *)self updateFrames];
    id v6 = [(ICAttributionViewConfiguration *)self parentConfiguration];

    if (!v6)
    {
      [(ICAttributionViewConfiguration *)self updateHighlightFrames];
      [(ICAttributionViewConfiguration *)self updateChildConfigurations];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      NSUInteger v7 = [(ICAttributionViewConfiguration *)self childConfigurations];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * v11++) synchronouslyLoadData];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
        }
        while (v9);
      }
    }
    [(ICAttributionViewConfiguration *)self setDataLoaded:1];
  }
}

uint64_t __55__ICAttributionViewConfiguration_synchronouslyLoadData__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateAttribution];
  [*(id *)(a1 + 32) updateTimestamp];
  v2 = *(void **)(a1 + 32);

  return [v2 updateUnreadUserIDs];
}

- (BOOL)hasValidRange
{
  BOOL v3 = [(ICAttributionViewConfiguration *)self sharedState];
  id v4 = [v3 noteTextStorage];
  id v5 = [v4 string];
  uint64_t v6 = [(ICAttributionViewConfiguration *)self range];
  if (objc_msgSend(v5, "ic_rangeIsValid:", v6, v7))
  {
    uint64_t v8 = [(ICAttributionViewConfiguration *)self sharedState];
    uint64_t v9 = [v8 noteTextStorage];
    uint64_t v10 = [v9 string];
    uint64_t v11 = [(ICAttributionViewConfiguration *)self trimmedRange];
    char v13 = objc_msgSend(v10, "ic_rangeIsValid:", v11, v12);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICAttributionViewConfiguration *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ICAttributionViewConfiguration *)self isEqualToAttributionViewConfiguration:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t result = self->_hash;
  if (!result)
  {
    id v4 = [(ICAttributionViewConfiguration *)self textEdit];
    uint64_t v5 = [v4 hash];
    if (!v5)
    {
      BOOL v6 = [MEMORY[0x263EFF9D0] null];
      uint64_t v5 = [v6 hash];
    }
    id v7 = [(ICAttributionViewConfiguration *)self editGroups];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = [v9 hash];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v10 = ICHashWithObject(*(void **)(*((void *)&v23 + 1) + 8 * i)) - v10 + 32 * v10;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    self->_hash = ICHashWithHashKeys(v5, v16, v17, v18, v19, v20, v21, v22, v10);
    return self->_hash;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ICAttributionViewConfiguration allocWithZone:a3];

  return [(ICAttributionViewConfiguration *)v4 initWithConfiguration:self];
}

- (void)commonInitWithSharedState:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v17 = a3;
  objc_storeStrong((id *)&self->_sharedState, a3);
  self->_range.NSUInteger location = location;
  self->_range.NSUInteger length = length;
  CGSize v8 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_frame.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_frame.size = v8;
  self->_dataLoaded = 0;
  *(_WORD *)&self->_focused = 0;
  if ([(ICAttributionViewConfiguration *)self hasValidRange])
  {
    uint64_t v9 = [(ICAttributionViewConfiguration *)self sharedState];
    uint64_t v10 = [v9 noteTextStorage];
    id v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v12 = objc_msgSend(v10, "ic_rangeByTrimmingCharactersInSet:inRange:", v11, location, length);
    NSUInteger v14 = v13;

    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v15 = location;
    }
    else {
      NSUInteger v15 = v12;
    }
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v16 = length;
    }
    else {
      NSUInteger v16 = v14;
    }
    -[ICAttributionViewConfiguration setTrimmedRange:](self, "setTrimmedRange:", v15, v16);
    [(ICAttributionViewConfiguration *)self updateFrames];
  }
}

- (void)updateAttribution
{
  v36[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICAttributionViewConfiguration *)self attributionUserID];
  id v4 = [(ICAttributionViewConfiguration *)self sharedState];
  uint64_t v5 = [v4 shortNameForUserID:v3];

  uint64_t v6 = *MEMORY[0x263F81500];
  v35[0] = *MEMORY[0x263F81500];
  id v7 = [(ICAttributionViewConfiguration *)self sharedState];
  CGSize v8 = [v7 highlightColorForUserID:v3];
  v36[0] = v8;
  uint64_t v9 = *MEMORY[0x263F814F0];
  v35[1] = *MEMORY[0x263F814F0];
  uint64_t v10 = [(ICAttributionViewConfiguration *)self sharedState];
  id v11 = [v10 primaryFont];
  v36[1] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];

  NSUInteger v13 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v5 attributes:v12];
  NSUInteger v14 = [(ICAttributionViewConfiguration *)self userIDs];
  unint64_t v15 = [v14 count];

  if (v15 >= 2)
  {
    v33[0] = v6;
    if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
      [MEMORY[0x263F825C8] systemGrayColor];
    }
    else {
    NSUInteger v16 = [MEMORY[0x263F825C8] secondaryLabelColor];
    }
    v33[1] = v9;
    v34[0] = v16;
    id v17 = [(ICAttributionViewConfiguration *)self sharedState];
    uint64_t v18 = [v17 secondaryFont];
    v34[1] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

    uint64_t v20 = NSString;
    uint64_t v21 = [(ICAttributionViewConfiguration *)self userIDs];
    uint64_t v22 = objc_msgSend(v20, "localizedStringWithFormat:", @" + %lu", objc_msgSend(v21, "count") - 1);

    long long v23 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v22 attributes:v19];
    [v13 appendAttributedString:v23];
  }
  long long v24 = [(ICAttributionViewConfiguration *)self attribution];
  long long v25 = (void *)*MEMORY[0x263EFFD08];
  if ((void *)*MEMORY[0x263EFFD08] == v13) {
    long long v26 = 0;
  }
  else {
    long long v26 = v13;
  }
  unint64_t v27 = v26;
  if (v25 == v24) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = v24;
  }
  unint64_t v29 = v28;
  if (v27 | v29)
  {
    CGFloat v30 = (void *)v29;
    if (v27 && v29)
    {
      char v31 = [(id)v27 isEqual:v29];

      if (v31) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    CGFloat v32 = (void *)[v13 copy];
    [(ICAttributionViewConfiguration *)self setAttribution:v32];

    [(ICAttributionViewConfiguration *)self updateAttributionTextStorage];
  }
  else
  {
  }
LABEL_20:
}

- (void)updateStatusImage
{
  if (![(ICAttributionViewConfiguration *)self isStatusImageHidden])
  {
    [(ICAttributionViewConfiguration *)self statusImageFrame];
    double v4 = v3;
    double v6 = v5;
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v3, v5);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__ICAttributionViewConfiguration_updateStatusImage__block_invoke;
    v11[3] = &unk_2640BA6B8;
    v11[4] = self;
    *(double *)&v11[5] = v4;
    *(double *)&v11[6] = v6;
    CGSize v8 = [v7 imageWithActions:v11];
    uint64_t v9 = [v8 imageWithRenderingMode:1];
    statusImage = self->_statusImage;
    self->_statusImage = v9;
  }
}

uint64_t __51__ICAttributionViewConfiguration_updateStatusImage__block_invoke(double *a1, void *a2)
{
  double v3 = (void *)*((void *)a1 + 4);
  uint64_t v4 = [a2 CGContext];
  double v5 = a1[5];
  double v6 = a1[6];

  return objc_msgSend(v3, "drawStatusImageInContext:canvasSize:", v4, v5, v6);
}

- (void)drawStatusImageInContext:(CGContext *)a3 canvasSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v28 = *MEMORY[0x263EF8340];
  CGSize v8 = [(ICAttributionViewConfiguration *)self unreadUserIDs];
  if ((unint64_t)[v8 count] <= 2) {
    double v9 = 4.0;
  }
  else {
    double v9 = 3.0;
  }
  uint64_t v10 = [v8 count];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    double v14 = (height + -10.0) * 0.5;
    double v15 = (width - ((double)(unint64_t)(v10 - 1) * v9 + 10.0)) * 0.5;
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v11);
        }
        double v18 = v15 + 10.0;
        if (v15 + 10.0 <= 16.0)
        {
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
          uint64_t v20 = [(ICAttributionViewConfiguration *)self sharedState];
          uint64_t v21 = [v20 highlightColorForUserID:v19];

          id v22 = v21;
          CGContextSetFillColorWithColor(a3, (CGColorRef)[v22 CGColor]);
          v29.size.double width = 10.0;
          v29.size.double height = 10.0;
          v29.origin.CGFloat x = v15;
          v29.origin.CGFloat y = v14;
          CGContextFillEllipseInRect(a3, v29);
          double v15 = v9 + v15;
        }
        ++v17;
      }
      while (v13 != v17);
      uint64_t v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v18);
    }
    while (v13);
  }
}

- (void)updateTimestamp
{
  void v35[2] = *MEMORY[0x263EF8340];
  double v3 = [(ICAttributionViewConfiguration *)self explicitTimestamp];

  if (v3)
  {
    uint64_t v4 = [(ICAttributionViewConfiguration *)self explicitTimestamp];
    goto LABEL_9;
  }
  double v5 = [(ICAttributionViewConfiguration *)self textEdit];

  if (v5)
  {
    double v6 = [(ICAttributionViewConfiguration *)self textEdit];
    uint64_t v4 = [v6 timestamp];
LABEL_8:

    goto LABEL_9;
  }
  id v7 = [(ICAttributionViewConfiguration *)self editGroups];
  CGSize v8 = [v7 firstObject];
  uint64_t v4 = [v8 latestTimestamp];

  double v6 = [(ICAttributionViewConfiguration *)self editGroups];
  if ((unint64_t)[v6 count] <= 1) {
    goto LABEL_8;
  }
  double v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = [(ICAttributionViewConfiguration *)self editGroups];
  id v11 = objc_msgSend(v10, "ic_compactMap:", &__block_literal_global_50);
  uint64_t v12 = [v9 setWithArray:v11];
  uint64_t v13 = [v12 count];

  if (v13 == 1)
  {
    double v14 = [(ICAttributionViewConfiguration *)self editGroups];
    uint64_t v15 = [v14 valueForKeyPath:@"@max.latestTimestamp"];

    uint64_t v4 = (void *)v15;
  }
LABEL_9:
  uint64_t v16 = objc_msgSend(v4, "ic_briefFormattedDate");
  uint64_t v17 = (void *)v16;
  double v18 = &stru_26C10E100;
  if (v16) {
    double v18 = (__CFString *)v16;
  }
  uint64_t v19 = v18;

  v34[0] = *MEMORY[0x263F81500];
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    [MEMORY[0x263F825C8] systemGrayColor];
  }
  else {
  uint64_t v20 = [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  v35[0] = v20;
  v34[1] = *MEMORY[0x263F814F0];
  uint64_t v21 = [(ICAttributionViewConfiguration *)self sharedState];
  id v22 = [v21 secondaryFont];
  v35[1] = v22;
  long long v23 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

  long long v24 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v19 attributes:v23];
  [(ICAttributionViewConfiguration *)self setTimestamp:v4];
  long long v25 = [(ICAttributionViewConfiguration *)self formattedTimestamp];
  long long v26 = (void *)*MEMORY[0x263EFFD08];
  if ((void *)*MEMORY[0x263EFFD08] == v24) {
    unint64_t v27 = 0;
  }
  else {
    unint64_t v27 = v24;
  }
  unint64_t v28 = v27;
  if (v26 == v25) {
    CGRect v29 = 0;
  }
  else {
    CGRect v29 = v25;
  }
  unint64_t v30 = v29;
  if (v28 | v30)
  {
    char v31 = (void *)v30;
    if (v28 && v30)
    {
      char v32 = [(id)v28 isEqual:v30];

      if (v32) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    uint64_t v33 = (void *)[v24 copy];
    [(ICAttributionViewConfiguration *)self setFormattedTimestamp:v33];

    [(ICAttributionViewConfiguration *)self updateFormattedTimestampTextStorage];
  }
  else
  {
  }
LABEL_28:
}

uint64_t __49__ICAttributionViewConfiguration_updateTimestamp__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08D40];
  uint64_t v4 = [a2 range];

  return objc_msgSend(v2, "valueWithRange:", v4, v3);
}

- (UIImage)disclosureImage
{
  BOOL v3 = [(ICAttributionViewConfiguration *)self isFocused];
  uint64_t v4 = [(ICAttributionViewConfiguration *)self sharedState];
  double v5 = v4;
  if (v3) {
    [v4 expandedDisclosureImage];
  }
  else {
  double v6 = [v4 collapsedDisclosureImage];
  }

  return (UIImage *)v6;
}

- (void)updateFrames
{
  if ([(ICAttributionViewConfiguration *)self hasValidRange])
  {
    BOOL v3 = [(ICAttributionViewConfiguration *)self sharedState];
    uint64_t v4 = [v3 primaryFont];
    [v4 lineHeight];
    double v6 = v5;

    id v7 = [(ICAttributionViewConfiguration *)self sharedState];
    CGSize v8 = [v7 secondaryFont];
    [v8 lineHeight];
    double v10 = v9;

    id v11 = [(ICAttributionViewConfiguration *)self sharedState];
    uint64_t v12 = [v11 expandedDisclosureImage];
    [v12 size];
    double v14 = v13 + 4.0;

    if ([(ICAttributionViewConfiguration *)self forcesAttributionHidden]) {
      double v15 = 0.0;
    }
    else {
      double v15 = v6;
    }
    uint64_t v16 = [(ICAttributionViewConfiguration *)self sharedState];
    [v16 panelWidth];
    double v18 = v17 - v14 + -16.0;

    self->_attributionFrame.origin.CGFloat x = 0.0;
    self->_attributionFrame.origin.double y = 0.0;
    self->_attributionFrame.size.double width = v18;
    self->_attributionFrame.size.double height = v15;
    self->_disclosureImageFrame.origin.CGFloat x = v18;
    self->_disclosureImageFrame.origin.double y = 0.0;
    self->_disclosureImageFrame.size.double width = v14;
    self->_disclosureImageFrame.size.double height = v15;
    BOOL v19 = [(ICAttributionViewConfiguration *)self isAttributionHidden];
    double v20 = (v15 - v15) * -0.5;
    if (!v19) {
      double v20 = 0.0;
    }
    self->_statusImageFrame.origin.CGFloat x = self->_disclosureImageFrame.origin.x + self->_disclosureImageFrame.size.width;
    self->_statusImageFrame.origin.double y = v20;
    self->_statusImageFrame.size.double width = 16.0;
    self->_statusImageFrame.size.double height = v15;
    if ([(ICAttributionViewConfiguration *)self forcesTimestampHidden]
      || [(ICAttributionViewConfiguration *)self isDataLoaded]
      && ([(ICAttributionViewConfiguration *)self timestamp],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          !v21))
    {
      double v10 = 0.0;
    }
    self->_formattedTimestampFrame.origin.CGFloat x = 0.0;
    self->_formattedTimestampFrame.origin.double y = self->_attributionFrame.size.height;
    self->_formattedTimestampFrame.size.double width = v18;
    self->_formattedTimestampFrame.size.double height = v10;
    uint64_t v22 = [(ICAttributionViewConfiguration *)self trimmedRange];
    -[ICAttributionViewConfiguration rectForRange:](self, "rectForRange:", v22, v23);
    self->_associatedTextFrame.origin.CGFloat x = v24;
    self->_associatedTextFrame.origin.double y = v25;
    self->_associatedTextFrame.size.double width = v26;
    self->_associatedTextFrame.size.double height = v27;
    [(ICAttributionViewConfiguration *)self frame];
    double v29 = v28;
    [(ICAttributionViewConfiguration *)self frame];
    if (v30 == 0.0)
    {
      [(ICAttributionViewConfiguration *)self frame];
      if (v31 == 0.0)
      {
        char v32 = [(ICAttributionViewConfiguration *)self sharedState];
        [v32 topTextViewInset];
        double v34 = v33;
        double y = self->_associatedTextFrame.origin.y;
        double v36 = [(ICAttributionViewConfiguration *)self parentConfiguration];
        [v36 adjustedFrame];
        double v38 = v37;

        uint64_t v39 = [(ICAttributionViewConfiguration *)self trimmedRange];
        uint64_t v60 = 0;
        double v61 = &v60;
        uint64_t v62 = 0x2020000000;
        char v63 = 0;
        uint64_t v52 = MEMORY[0x263EF8330];
        uint64_t v53 = 3221225472;
        CGRect v54 = __46__ICAttributionViewConfiguration_updateFrames__block_invoke;
        CGRect v55 = &unk_2640BA700;
        uint64_t v58 = v39;
        uint64_t v59 = 1;
        CGRect v56 = self;
        CGRect v57 = &v60;
        performBlockOnMainThreadAndWait();
        double v29 = v34 + y - v38;
        if (!*((unsigned char *)v61 + 24))
        {
          -[ICAttributionViewConfiguration rectForRange:](self, "rectForRange:", [(ICAttributionViewConfiguration *)self trimmedRange], 1);
          double v41 = v40;
          [(ICAttributionViewConfiguration *)self attributionFrame];
          if (v41 > v42)
          {
            [(ICAttributionViewConfiguration *)self attributionFrame];
            double v29 = v29 + (v41 - v43) * 0.5;
          }
        }
        _Block_object_dispose(&v60, 8);
      }
    }
    double v44 = [(ICAttributionViewConfiguration *)self sharedState];
    [v44 panelWidth];
    self->_frame.origin.CGFloat x = 0.0;
    self->_frame.origin.double y = v29;
    self->_frame.size.double width = v45;
    self->_frame.size.double height = v15 + v10 + 4.0;

    CGSize size = self->_frame.size;
    self->_adjustedFrame.origin = self->_frame.origin;
    self->_adjustedFrame.CGSize size = size;
    double v47 = [(ICAttributionViewConfiguration *)self sharedState];
    int v48 = [v47 isRTL];

    if (v48)
    {
      self->_statusImageFrame.origin.CGFloat x = 0.0;
      CGFloat v49 = self->_statusImageFrame.size.width + 0.0;
      self->_disclosureImageFrame.origin.CGFloat x = v49;
      CGFloat v50 = v49 + self->_disclosureImageFrame.size.width;
      self->_attributionFrame.origin.CGFloat x = v50;
      self->_formattedTimestampFrame.origin.CGFloat x = v50;
    }
    CGSize v51 = self->_formattedTimestampFrame.size;
    self->_adjustedFormattedTimestampFrame.origin = self->_formattedTimestampFrame.origin;
    self->_adjustedFormattedTimestampFrame.CGSize size = v51;
  }
}

void __46__ICAttributionViewConfiguration_updateFrames__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sharedState];
  BOOL v3 = [v2 noteTextStorage];
  uint64_t v4 = *MEMORY[0x263F814A0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__ICAttributionViewConfiguration_updateFrames__block_invoke_2;
  v6[3] = &unk_2640B80C8;
  uint64_t v5 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, v5, *(void *)(a1 + 56), 0, v6);
}

void __46__ICAttributionViewConfiguration_updateFrames__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (void)updateHighlightFrames
{
  if ([(ICAttributionViewConfiguration *)self hasValidRange])
  {
    id v3 = [(ICAttributionViewConfiguration *)self parentConfiguration];

    id v4 = [MEMORY[0x263EFF980] array];
    uint64_t v5 = v4;
    if (v3)
    {
      highlightConfigurations = self->_highlightConfigurations;
      self->_highlightConfigurations = v5;
    }
    else
    {
      uint64_t v8 = MEMORY[0x263EF8330];
      id v7 = v4;
      performBlockOnMainThreadAndWait();
      if ((-[NSMutableArray isEqualToArray:](self->_highlightConfigurations, "isEqualToArray:", v7, v8, 3221225472, __55__ICAttributionViewConfiguration_updateHighlightFrames__block_invoke, &unk_2640B82D8, self) & 1) == 0)objc_storeStrong((id *)&self->_highlightConfigurations, v5); {
      [(ICAttributionViewConfiguration *)self updateHighlightAlpha];
      }
    }
  }
}

void __55__ICAttributionViewConfiguration_updateHighlightFrames__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sharedState];
  id v3 = [v2 noteTextStorage];
  uint64_t v4 = *MEMORY[0x263F814A0];
  uint64_t v5 = [*(id *)(a1 + 32) range];
  uint64_t v7 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__ICAttributionViewConfiguration_updateHighlightFrames__block_invoke_2;
  v9[3] = &unk_2640B8C78;
  uint64_t v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, v5, v7, 0, v9);
}

void __55__ICAttributionViewConfiguration_updateHighlightFrames__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = v30;
  if (v30)
  {
    double v9 = (void *)MEMORY[0x263F5AB78];
    id v10 = [v30 fileType];
    if ([v9 typeUTIIsInlineDrawing:v10])
    {
    }
    else
    {
      id v11 = (void *)MEMORY[0x263F5AB78];
      uint64_t v12 = [v30 fileType];
      LODWORD(v11) = [v11 typeUTIIsSystemPaper:v12];

      uint64_t v8 = v30;
      if (!v11) {
        goto LABEL_8;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "rectForRange:", a3, a4);
    double v14 = v13;
    double v16 = v15;
    double v17 = [*(id *)(a1 + 32) sharedState];
    double v18 = 0.0;
    if (([v17 isRTL] & 1) == 0)
    {
      [*(id *)(a1 + 32) statusImageFrame];
      double v20 = v19;
      [*(id *)(a1 + 32) statusImageFrame];
      double v18 = v20 + v21;
    }

    [*(id *)(a1 + 32) frame];
    double v23 = v14 - v22 + 8.0;
    CGFloat v24 = objc_msgSend(*(id *)(a1 + 32), "editGroupForRange:", a3, a4);
    CGFloat v25 = [v24 userID];

    CGFloat v26 = [*(id *)(a1 + 32) sharedState];
    CGFloat v27 = [v26 highlightColorForUserID:v25];

    double v28 = objc_alloc_init(ICAttributionViewHighlightConfiguration);
    double v29 = [v30 attachmentIdentifier];
    [(ICAttributionViewHighlightConfiguration *)v28 setIdentifier:v29];

    -[ICAttributionViewHighlightConfiguration setFrame:](v28, "setFrame:", v18, v23, 4.0, v16);
    -[ICAttributionViewHighlightConfiguration setAdjustedFrame:](v28, "setAdjustedFrame:", v18, v23, 4.0, v16);
    [(ICAttributionViewHighlightConfiguration *)v28 setColor:v27];
    [*(id *)(a1 + 40) addObject:v28];

    uint64_t v8 = v30;
  }
LABEL_8:
}

- (void)updateHighlightAlpha
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_highlightConfigurations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        BOOL v9 = [(ICAttributionViewConfiguration *)self isBlurred];
        double v10 = 0.0;
        if (!v9) {
          [(ICAttributionViewConfiguration *)self preferredHighlightValue];
        }
        [v8 setAlpha:v10];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)updateChildConfigurations
{
  uint64_t v139 = *MEMORY[0x263EF8340];
  childConfigurations = self->_childConfigurations;
  self->_childConfigurations = (NSArray *)MEMORY[0x263EFFA68];

  uint64_t v4 = [(ICAttributionViewConfiguration *)self parentConfiguration];

  if (v4) {
    return;
  }
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = [(ICAttributionViewConfiguration *)self editGroups];
  uint64_t v6 = [obj countByEnumeratingWithState:&v131 objects:v138 count:16];
  if (!v6) {
    goto LABEL_29;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v132;
  v109 = v130;
  uint64_t v111 = *(void *)v132;
  do
  {
    uint64_t v9 = 0;
    id v113 = (id)v7;
    do
    {
      if (*(void *)v132 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v117 = v9;
      double v10 = *(void **)(*((void *)&v131 + 1) + 8 * v9);
      long long v11 = [(ICAttributionViewConfiguration *)self editGroups];
      unint64_t v12 = [v11 count];

      if (v12 >= 2)
      {
        v129[0] = MEMORY[0x263EF8330];
        v129[1] = 3221225472;
        v130[0] = __59__ICAttributionViewConfiguration_updateChildConfigurations__block_invoke;
        v130[1] = &unk_2640BA728;
        v130[2] = v10;
        long long v13 = objc_msgSend(v5, "ic_objectPassingTest:", v129);
        if (v13)
        {
          long long v14 = [v10 latestTimestamp];
          double v15 = [v13 timestamp];
          int v16 = objc_msgSend(v14, "ic_isLaterThanDate:", v15);

          uint64_t v17 = v117;
          if (v16)
          {
            double v18 = [v10 latestTimestamp];
            [v13 setExplicitTimestamp:v18];
            goto LABEL_25;
          }
        }
        else
        {
          id v30 = [ICAttributionViewConfiguration alloc];
          double v31 = [(ICAttributionViewConfiguration *)self sharedState];
          v137 = v10;
          char v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v137 count:1];
          double v18 = [(ICAttributionViewConfiguration *)v30 initWithSharedState:v31 editGroups:v32 parentConfiguration:self];

          [(ICAttributionViewConfiguration *)v18 synchronouslyLoadData];
          [(ICAttributionViewConfiguration *)self frame];
          double v34 = v33;
          [(ICAttributionViewConfiguration *)v18 frame];
          double v36 = v35;
          double v37 = [v5 lastObject];
          if (v37)
          {
            [(ICAttributionViewConfiguration *)v18 frame];
            double v39 = v38;
            double v34 = v40;
            double v36 = v41;
            [v37 frame];
            double v43 = v42;
            [v37 frame];
            double v45 = v43 + v44;
          }
          else
          {
            double v45 = 0.0;
            double v39 = 0.0;
          }
          -[ICAttributionViewConfiguration setFrame:](v18, "setFrame:", v39, v45, v34, v36);
          [(ICAttributionViewConfiguration *)v18 setForceVisible:1];
          [v5 addObject:v18];

          uint64_t v17 = v117;
LABEL_25:
        }
        goto LABEL_27;
      }
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      double v19 = [v10 edits];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v125 objects:v136 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v126;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v126 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v125 + 1) + 8 * i);
            CGFloat v25 = [ICAttributionViewConfiguration alloc];
            CGFloat v26 = [(ICAttributionViewConfiguration *)self sharedState];
            CGFloat v27 = [(ICAttributionViewConfiguration *)v25 initWithSharedState:v26 textEdit:v24 parentConfiguration:self];

            -[ICAttributionViewConfiguration setForcesAttributionHidden:](v27, "setForcesAttributionHidden:", [v5 count] != 0);
            if (![v5 count])
            {
              [(ICAttributionViewConfiguration *)self frame];
              double v29 = v28;
              [(ICAttributionViewConfiguration *)v27 frame];
              -[ICAttributionViewConfiguration setFrame:](v27, "setFrame:", 0.0, 0.0, v29);
              [(ICAttributionViewConfiguration *)v27 setForceVisible:1];
            }
            [v5 addObject:v27];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v125 objects:v136 count:16];
        }
        while (v21);
      }

      uint64_t v8 = v111;
      uint64_t v7 = (uint64_t)v113;
      uint64_t v17 = v117;
LABEL_27:
      uint64_t v9 = v17 + 1;
    }
    while (v9 != v7);
    uint64_t v7 = [obj countByEnumeratingWithState:&v131 objects:v138 count:16];
  }
  while (v7);
LABEL_29:

  double v46 = [MEMORY[0x263EFF980] array];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v114 = v5;
  uint64_t v118 = [v114 countByEnumeratingWithState:&v121 objects:v135 count:16];
  if (v118)
  {
    id obja = *(id *)v122;
    v112 = v120;
    v110 = v46;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(id *)v122 != obja) {
          objc_enumerationMutation(v114);
        }
        int v48 = *(void **)(*((void *)&v121 + 1) + 8 * v47);
        objc_msgSend(v48, "synchronouslyLoadData", v110, v112);
        if (([v48 isAttributionHidden] & 1) == 0)
        {
          v119[0] = MEMORY[0x263EF8330];
          v119[1] = 3221225472;
          v120[0] = __59__ICAttributionViewConfiguration_updateChildConfigurations__block_invoke_2;
          v120[1] = &unk_2640BA728;
          v120[2] = v48;
          uint64_t v49 = objc_msgSend(v46, "ic_objectPassingTest:", v119);
          if (v49)
          {
            CGFloat v50 = (void *)v49;
            CGSize v51 = [v48 timestamp];
            uint64_t v52 = [v50 timestamp];
            int v53 = objc_msgSend(v51, "ic_isLaterThanDate:", v52);

            if (v53)
            {
              CGRect v54 = [v48 timestamp];
              [v50 setExplicitTimestamp:v54];
            }
            goto LABEL_60;
          }
        }
        CGRect v55 = [v46 lastObject];
        CGFloat v50 = v55;
        if (!v55)
        {
          int v92 = 0;
          int v91 = 0;
          BOOL v93 = 1;
          goto LABEL_56;
        }
        [v55 frame];
        CGFloat v57 = v56;
        CGFloat v59 = v58;
        CGFloat v61 = v60;
        CGFloat v63 = v62;
        [v48 frame];
        v141.origin.CGFloat x = v64;
        v141.origin.double y = v65;
        v141.size.double width = v66;
        v141.size.double height = v67;
        v140.origin.CGFloat x = v57;
        v140.origin.double y = v59;
        v140.size.double width = v61;
        v140.size.double height = v63;
        if (CGRectIntersectsRect(v140, v141)
          || ([v48 frame], double v69 = v68, objc_msgSend(v50, "frame"), v69 <= v70))
        {
          v71 = [v50 timestamp];
          uint64_t v72 = [v48 timestamp];
          if (objc_msgSend(v71, "ic_isEarlierThanDate:", v72)
            && ![v50 forceVisible])
          {
            char v103 = [v48 forceVisible];

            if ((v103 & 1) == 0)
            {
              objc_msgSend(v48, "setForcesAttributionHidden:", objc_msgSend(v50, "isAttributionHidden"));
              [v50 frame];
              objc_msgSend(v48, "setFrame:");
              [v46 removeObject:v50];
LABEL_59:
              [v46 addObject:v48];
              goto LABEL_60;
            }
          }
          else
          {
          }
          v73 = [v48 editGroups];
          if (![v73 count])
          {

LABEL_52:
            int v91 = 1;
            goto LABEL_53;
          }
          char v74 = [v48 isAttributionHidden];

          if (v74) {
            goto LABEL_52;
          }
          [v48 frame];
          double v76 = v75;
          double v78 = v77;
          double v80 = v79;
          [v50 frame];
          double v83 = v81 + v82;
          v84 = [v48 textEdit];
          uint64_t v85 = [v84 range];
          -[ICAttributionViewConfiguration rectForRange:](self, "rectForRange:", v85, v86);
          double v88 = v87;
          double v90 = v89;

          if (([v48 forceVisible] & 1) == 0 && v80 + v83 > v88 + v90) {
            goto LABEL_52;
          }
          objc_msgSend(v48, "setFrame:", v76, v83, v78, v80);
        }
        int v91 = 0;
LABEL_53:
        v94 = [v48 formattedTimestamp];
        v95 = [v94 string];
        v96 = [v50 formattedTimestamp];
        v97 = [v96 string];
        int v92 = [v95 isEqualToString:v97];

        v98 = [v48 timestamp];
        v99 = [v50 timestamp];
        [v98 timeIntervalSinceDate:v99];
        double v101 = v100;

        double v102 = -v101;
        if (v101 >= 0.0) {
          double v102 = v101;
        }
        BOOL v93 = v102 >= 86400.0;
        double v46 = v110;
LABEL_56:
        if (([v48 forceVisible] & 1) != 0 || ((v91 | v92) & 1) == 0 && v93) {
          goto LABEL_59;
        }
LABEL_60:

        ++v47;
      }
      while (v118 != v47);
      uint64_t v104 = [v114 countByEnumeratingWithState:&v121 objects:v135 count:16];
      uint64_t v118 = v104;
    }
    while (v104);
  }

  if ([v46 count] == 1)
  {
    v105 = [(ICAttributionViewConfiguration *)self timestamp];
    v106 = [v46 firstObject];
    [v106 setExplicitTimestamp:v105];
  }
  v107 = (NSArray *)[v46 copy];
  v108 = self->_childConfigurations;
  self->_childConfigurations = v107;
}

uint64_t __59__ICAttributionViewConfiguration_updateChildConfigurations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 userIDs];
  uint64_t v4 = [*(id *)(a1 + 32) userID];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

uint64_t __59__ICAttributionViewConfiguration_updateChildConfigurations__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAttributionHidden])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [v3 userIDs];
    uint64_t v6 = [*(id *)(a1 + 32) userIDs];
    uint64_t v4 = [v5 isEqual:v6];
  }
  return v4;
}

- (CGRect)rectForRange:(_NSRange)a3
{
  uint64_t v12 = 0;
  long long v13 = (double *)&v12;
  uint64_t v14 = 0x4010000000;
  double v15 = &unk_20C1E2BF2;
  long long v3 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v16 = *MEMORY[0x263F001A8];
  long long v17 = v3;
  performBlockOnMainThreadAndWait();
  double v4 = v13[4];
  double v5 = v13[5];
  double v6 = v13[6];
  double v7 = v13[7];
  _Block_object_dispose(&v12, 8);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

void __47__ICAttributionViewConfiguration_rectForRange___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) sharedState];
  v2 = [v8 textView];
  objc_msgSend(v2, "ic_rectForRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  long long v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
}

- (id)editGroupForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = [(ICAttributionViewConfiguration *)self editGroups];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__ICAttributionViewConfiguration_editGroupForRange___block_invoke;
  v8[3] = &__block_descriptor_48_e34_B32__0__ICTTTextEditGroup_8Q16_B24l;
  v8[4] = location;
  v8[5] = length;
  uint64_t v6 = objc_msgSend(v5, "ic_objectPassingTest:", v8);

  return v6;
}

BOOL __52__ICAttributionViewConfiguration_editGroupForRange___block_invoke(NSRange *a1, void *a2)
{
  v4.NSUInteger location = [a2 range];
  return NSIntersectionRange(v4, a1[32]).length != 0;
}

- (NSString)attributionUserID
{
  long long v3 = [(ICAttributionViewConfiguration *)self textEdit];
  if (v3)
  {
    NSRange v4 = [(ICAttributionViewConfiguration *)self sharedState];
    uint64_t v5 = [v4 note];
    uint64_t v6 = [(ICAttributionViewConfiguration *)self textEdit];
    uint64_t v7 = [v6 replicaID];
    id v8 = [v5 userIDForReplicaID:v7];
  }
  else
  {
    NSRange v4 = [(ICAttributionViewConfiguration *)self editGroups];
    uint64_t v5 = [v4 firstObject];
    id v8 = [v5 userID];
  }

  return (NSString *)v8;
}

- (NSOrderedSet)userIDs
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v3 = [MEMORY[0x263EFF9B0] orderedSet];
  NSRange v4 = [(ICAttributionViewConfiguration *)self textEdit];

  if (v4)
  {
    uint64_t v5 = [(ICAttributionViewConfiguration *)self attributionUserID];
    objc_msgSend(v3, "ic_addNonNilObject:", v5);
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(ICAttributionViewConfiguration *)self editGroups];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) userID];
          objc_msgSend(v3, "ic_addNonNilObject:", v10);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }

  double v11 = (void *)[v3 copy];

  return (NSOrderedSet *)v11;
}

- (void)updateUnreadUserIDs
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v22 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v3 = [(ICAttributionViewConfiguration *)self textEdit];

  if (v3)
  {
    NSRange v4 = [(ICAttributionViewConfiguration *)self sharedState];
    uint64_t v5 = [(ICAttributionViewConfiguration *)self timestamp];
    uint64_t v6 = [(ICAttributionViewConfiguration *)self attributionUserID];
    int v7 = [v4 isTimestampUnread:v5 forUserID:v6];

    if (v7)
    {
      uint64_t v8 = [(ICAttributionViewConfiguration *)self attributionUserID];
      objc_msgSend(v22, "ic_addNonNilObject:", v8);
LABEL_14:
    }
  }
  else
  {
    double v9 = [(ICAttributionViewConfiguration *)self editGroups];

    if (v9)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v8 = [(ICAttributionViewConfiguration *)self editGroups];
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v8);
            }
            long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            long long v15 = [(ICAttributionViewConfiguration *)self sharedState];
            long long v16 = [v14 latestTimestamp];
            long long v17 = [v14 userID];
            int v18 = [v15 isTimestampUnread:v16 forUserID:v17];

            if (v18)
            {
              double v19 = [v14 userID];
              objc_msgSend(v22, "ic_addNonNilObject:", v19);
            }
          }
          uint64_t v11 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v11);
      }
      goto LABEL_14;
    }
  }
  uint64_t v20 = [v22 array];
  unreadUserIDs = self->_unreadUserIDs;
  self->_unreadUserIDs = v20;
}

- (ICAttributionViewConfigurationSharedState)sharedState
{
  return self->_sharedState;
}

- (NSArray)editGroups
{
  return self->_editGroups;
}

- (ICTTTextEdit)textEdit
{
  return self->_textEdit;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)trimmedRange
{
  NSUInteger length = self->_trimmedRange.length;
  NSUInteger location = self->_trimmedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (CGRect)attributionFrame
{
  double x = self->_attributionFrame.origin.x;
  double y = self->_attributionFrame.origin.y;
  double width = self->_attributionFrame.size.width;
  double height = self->_attributionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSAttributedString)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
}

- (CGRect)formattedTimestampFrame
{
  double x = self->_formattedTimestampFrame.origin.x;
  double y = self->_formattedTimestampFrame.origin.y;
  double width = self->_formattedTimestampFrame.size.width;
  double height = self->_formattedTimestampFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSAttributedString)formattedTimestamp
{
  return self->_formattedTimestamp;
}

- (void)setFormattedTimestamp:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (CGRect)disclosureImageFrame
{
  double x = self->_disclosureImageFrame.origin.x;
  double y = self->_disclosureImageFrame.origin.y;
  double width = self->_disclosureImageFrame.size.width;
  double height = self->_disclosureImageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)statusImageFrame
{
  double x = self->_statusImageFrame.origin.x;
  double y = self->_statusImageFrame.origin.y;
  double width = self->_statusImageFrame.size.width;
  double height = self->_statusImageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIImage)statusImage
{
  return self->_statusImage;
}

- (void)setStatusImage:(id)a3
{
}

- (NSMutableArray)highlightConfigurations
{
  return self->_highlightConfigurations;
}

- (void)setHighlightConfigurations:(id)a3
{
}

- (CGRect)associatedTextFrame
{
  double x = self->_associatedTextFrame.origin.x;
  double y = self->_associatedTextFrame.origin.y;
  double width = self->_associatedTextFrame.size.width;
  double height = self->_associatedTextFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAssociatedTextFrame:(CGRect)a3
{
  self->_associatedTextFrame = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)adjustedFrame
{
  double x = self->_adjustedFrame.origin.x;
  double y = self->_adjustedFrame.origin.y;
  double width = self->_adjustedFrame.size.width;
  double height = self->_adjustedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)adjustedFormattedTimestampFrame
{
  double x = self->_adjustedFormattedTimestampFrame.origin.x;
  double y = self->_adjustedFormattedTimestampFrame.origin.y;
  double width = self->_adjustedFormattedTimestampFrame.size.width;
  double height = self->_adjustedFormattedTimestampFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAdjustedFormattedTimestampFrame:(CGRect)a3
{
  self->_adjustedFormattedTimestampFrame = a3;
}

- (double)appliedHorizontalAdjustmentRatio
{
  return self->_appliedHorizontalAdjustmentRatio;
}

- (void)setAppliedHorizontalAdjustmentRatio:(double)a3
{
  self->_appliedHorizontalAdjustmentRatio = a3;
}

- (double)preferredHighlightValue
{
  return self->_preferredHighlightValue;
}

- (void)setPreferredHighlightValue:(double)a3
{
  self->_preferredHighlightValue = a3;
}

- (BOOL)forcesAttributionHidden
{
  return self->_forcesAttributionHidden;
}

- (void)setForcesAttributionHidden:(BOOL)a3
{
  self->_forcesAttributionHidden = a3;
}

- (BOOL)forcesTimestampHidden
{
  return self->_forcesTimestampHidden;
}

- (void)setForcesTimestampHidden:(BOOL)a3
{
  self->_forcesTimestampHidden = a3;
}

- (BOOL)isPreview
{
  return self->_preview;
}

- (void)setPreview:(BOOL)a3
{
  self->_preview = a3;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (BOOL)isBlurred
{
  return self->_blurred;
}

- (NSArray)childConfigurations
{
  return self->_childConfigurations;
}

- (ICAttributionViewConfiguration)parentConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentConfiguration);

  return (ICAttributionViewConfiguration *)WeakRetained;
}

- (void)setParentConfiguration:(id)a3
{
}

- (id)attributionTextStorage
{
  return self->_attributionTextStorage;
}

- (void)setAttributionTextStorage:(id)a3
{
}

- (NSDate)explicitTimestamp
{
  return self->_explicitTimestamp;
}

- (void)setExplicitTimestamp:(id)a3
{
}

- (id)formattedTimestampTextStorage
{
  return self->_formattedTimestampTextStorage;
}

- (void)setFormattedTimestampTextStorage:(id)a3
{
}

- (NSArray)unreadUserIDs
{
  return self->_unreadUserIDs;
}

- (BOOL)forceVisible
{
  return self->_forceVisible;
}

- (void)setForceVisible:(BOOL)a3
{
  self->_forceVisible = a3;
}

- (BOOL)isDataLoaded
{
  return self->_dataLoaded;
}

- (void)setDataLoaded:(BOOL)a3
{
  self->_dataLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unreadUserIDs, 0);
  objc_storeStrong(&self->_formattedTimestampTextStorage, 0);
  objc_storeStrong((id *)&self->_explicitTimestamp, 0);
  objc_storeStrong(&self->_attributionTextStorage, 0);
  objc_destroyWeak((id *)&self->_parentConfiguration);
  objc_storeStrong((id *)&self->_childConfigurations, 0);
  objc_storeStrong((id *)&self->_highlightConfigurations, 0);
  objc_storeStrong((id *)&self->_statusImage, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_formattedTimestamp, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_textEdit, 0);
  objc_storeStrong((id *)&self->_editGroups, 0);

  objc_storeStrong((id *)&self->_sharedState, 0);
}

- (void)updateAttributionTextStorage
{
  v2 = self;
  sub_20C044E8C((SEL *)&selRef_attribution, (SEL *)&selRef_setAttributionTextStorage_);
}

- (void)updateFormattedTimestampTextStorage
{
  v2 = self;
  sub_20C044E8C((SEL *)&selRef_formattedTimestamp, (SEL *)&selRef_setFormattedTimestampTextStorage_);
}

@end