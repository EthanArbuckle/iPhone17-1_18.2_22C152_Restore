@interface ICTTTextController
+ (double)attachmentParagraphSpacing;
+ (double)attachmentParagraphSpacingBefore;
+ (double)bodyParagraphSpacing;
+ (double)bodyParagraphSpacingBefore;
+ (double)superscriptScaleFactor;
+ (id)preferredFontForICTTTextStyle:(unsigned int)a3;
- (BOOL)disableSingleLineA;
- (BOOL)isForPrint;
- (BOOL)isForSiri;
- (BOOL)isInPreviewMode;
- (BOOL)keepNSTextTableAttributes;
- (BOOL)showsEditorDebugTooltips;
- (ICTTTextController)init;
- (ICTTZoomController)zoomController;
- (NSDictionary)indentForHeadIndent;
- (double)bodyStyleFontSizeThreshold;
- (double)headingStyleFontSizeThreshold;
- (id)bodyAttributes;
- (id)bodyAttributesWithContentSizeCategory:(id)a3;
- (id)captionAttributes;
- (id)captionAttributesWithContentSizeCategory:(id)a3;
- (id)checklistAttributes;
- (id)checklistAttributesWithContentSizeCategory:(id)a3;
- (id)copyAttribute:(id)a3 fromAttributes:(id)a4 toAttributes:(id)a5;
- (id)copyNSParagraphStylefromAttributes:(id)a3 toAttributes:(id)a4;
- (id)defaultListAttributes;
- (id)defaultListAttributesWithContentSizeCategory:(id)a3;
- (id)defaultParagraphStyle;
- (id)defaultTypingAttributesForEmptyDocument;
- (id)filterStyleAttributes:(id)a3 range:(_NSRange)a4;
- (id)fixedWidthAttributes;
- (id)fixedWidthAttributesWithContentSizeCategory:(id)a3;
- (id)headingAttributes;
- (id)headingAttributesWithContentSizeCategory:(id)a3;
- (id)indentsForIndividualParagraphHeadIndentsInAttributedString:(id)a3;
- (id)modelForStyleAttributes:(id)a3 filterAttributes:(BOOL)a4;
- (id)modelForStyleAttributes:(id)a3 filterAttributes:(BOOL)a4 pasteboardAttributedString:(id)a5;
- (id)preferredAttributesForICTTTextStyle:(unsigned int)a3;
- (id)referenceAttributesForLocation:(unint64_t)a3 textStorage:(id)a4 currentParagraphStart:(unint64_t)a5;
- (id)removeAttribute:(id)a3 ifInconsistentAtLocation:(unint64_t)a4 inTextStorage:(id)a5 forNewTypingAttributes:(id)a6;
- (id)strippedTypingAttributesAtStartOfParagraph:(id)a3 atTheEndOfDocument:(BOOL)a4 isTyping:(BOOL)a5;
- (id)styleForModelAttributes:(id)a3;
- (id)styleForModelAttributes:(id)a3 contentSizeCategory:(id)a4;
- (id)subheadingAttributes;
- (id)subheadingAttributesWithContentSizeCategory:(id)a3;
- (id)titleAttributes;
- (id)titleAttributesWithContentSizeCategory:(id)a3;
- (id)typingAttributesForRange:(_NSRange)a3 forSelectionChange:(BOOL)a4 currentTypingAttributes:(id)a5 inTextStorage:(id)a6;
- (id)typingAttributesForRange:(_NSRange)a3 forSelectionChange:(BOOL)a4 forSettingTextStyle:(BOOL)a5 currentTypingAttributes:(id)a6 inTextStorage:(id)a7;
- (id)typingAttributesForSettingTextStyleForRange:(_NSRange)a3 currentTypingAttributes:(id)a4 inTextStorage:(id)a5;
- (id)writingToolsIgnoredRangesForTextStorage:(id)a3 inEnclosingRange:(_NSRange)a4 note:(id)a5;
- (unint64_t)defaultTabInterval;
- (unint64_t)defaultTabIntervalInAttributedString:(id)a3;
- (void)addBIToStyle:(id)a3;
- (void)guessFontSizeThresholdsForTTStylesInAttributedString:(id)a3;
- (void)prepareIndentInformationInAttributedString:(id)a3;
- (void)resetGuessedFontSizes;
- (void)resetIndentInformation;
- (void)setBodyStyleFontSizeThreshold:(double)a3;
- (void)setDefaultTabInterval:(unint64_t)a3;
- (void)setDisableSingleLineA:(BOOL)a3;
- (void)setHeadingStyleFontSizeThreshold:(double)a3;
- (void)setInPreviewMode:(BOOL)a3;
- (void)setIndentForHeadIndent:(id)a3;
- (void)setIsForPrint:(BOOL)a3;
- (void)setIsForSiri:(BOOL)a3;
- (void)setKeepNSTextTableAttributes:(BOOL)a3;
- (void)setShowsEditorDebugTooltips:(BOOL)a3;
- (void)setZoomController:(id)a3;
- (void)styleFontInAttributedString:(id)a3 inRange:(_NSRange)a4 contentSizeCategory:(id)a5;
- (void)styleFontInTextStorage:(id)a3 inRange:(_NSRange)a4;
- (void)styleText:(id)a3 inExactRange:(_NSRange)a4 fixModelAttributes:(BOOL)a5;
- (void)styleText:(id)a3 inRange:(_NSRange)a4 fixModelAttributes:(BOOL)a5;
@end

@implementation ICTTTextController

- (void)styleFontInAttributedString:(id)a3 inRange:(_NSRange)a4 contentSizeCategory:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (location < location + length)
  {
    NSUInteger v11 = location;
    do
    {
      v12 = (void *)MEMORY[0x1B3E9ED80]();
      v13 = objc_msgSend(v9, "attributesAtIndex:longestEffectiveRange:inRange:", v11, &v15, location, length);
      v14 = [(ICTTTextController *)self styleForModelAttributes:v13 contentSizeCategory:v10];
      objc_msgSend(v9, "setAttributes:range:", v14, v15, v16);

      NSUInteger v11 = v16 + v15;
    }
    while (v11 < location + length);
  }
}

- (id)styleForModelAttributes:(id)a3 contentSizeCategory:(id)a4
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = [MEMORY[0x1E4F834C0] allowedAttributesForStyle];
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v127 objects:v131 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v128;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v128 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v127 + 1) + 8 * i);
        if ([v9 containsObject:v15])
        {
          uint64_t v16 = [v10 objectForKeyedSubscript:v15];
          [v8 setObject:v16 forKeyedSubscript:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v127 objects:v131 count:16];
    }
    while (v12);
  }

  v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", v7, -[ICTTTextController isForPrint](self, "isForPrint"));
  uint64_t v18 = *MEMORY[0x1E4FB06F8];
  [v8 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  v19 = (void *)MEMORY[0x1E4F83220];
  v20 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
  v21 = (uint64_t *)MEMORY[0x1E4FB0738];
  if (v20)
  {
    v126 = v20;
    int v22 = [v20 style];
    switch(v22)
    {
      case 0:
        uint64_t v23 = [(ICTTTextController *)self titleAttributesWithContentSizeCategory:v7];
        goto LABEL_23;
      case 1:
        uint64_t v23 = [(ICTTTextController *)self headingAttributesWithContentSizeCategory:v7];
        goto LABEL_23;
      case 2:
        uint64_t v23 = [(ICTTTextController *)self subheadingAttributesWithContentSizeCategory:v7];
        goto LABEL_23;
      case 3:
        uint64_t v23 = [(ICTTTextController *)self bodyAttributesWithContentSizeCategory:v7];
        goto LABEL_23;
      case 4:
        uint64_t v23 = [(ICTTTextController *)self fixedWidthAttributesWithContentSizeCategory:v7];
        goto LABEL_23;
      case 5:
        uint64_t v23 = [(ICTTTextController *)self captionAttributes];
        goto LABEL_23;
      default:
        if ((v22 - 100) >= 3)
        {
          if (v22 != 103) {
            goto LABEL_24;
          }
          uint64_t v23 = [(ICTTTextController *)self checklistAttributesWithContentSizeCategory:v7];
        }
        else
        {
          uint64_t v23 = [(ICTTTextController *)self defaultListAttributesWithContentSizeCategory:v7];
        }
LABEL_23:
        v26 = (void *)v23;
        [v8 addEntriesFromDictionary:v23];

LABEL_24:
        v27 = self;
        uint64_t v28 = v18;
        v29 = v27;
        [(ICTTTextController *)v27 addBIToStyle:v8];
        uint64_t v30 = *v21;
        v31 = [v8 objectForKeyedSubscript:*v21];
        if (v31)
        {
          v32 = [v8 objectForKeyedSubscript:v30];
          v33 = (void *)[v32 mutableCopy];
        }
        else
        {
          v33 = objc_msgSend(MEMORY[0x1E4FB0850], "ic_mutableDefaultParagraphStyle");
        }

        objc_msgSend(v33, "setAlignment:", objc_msgSend(v126, "alignment"));
        objc_msgSend(v33, "setBaseWritingDirection:", objc_msgSend(v126, "writingDirection"));
        v34 = (void *)[v33 copy];
        [v8 setObject:v34 forKeyedSubscript:v30];

        uint64_t v124 = [v126 writingDirection];
        uint64_t v123 = [v126 alignment];

        uint64_t v18 = v28;
        self = v29;
        break;
    }
  }
  else
  {
    v24 = [(ICTTTextController *)self bodyAttributes];
    [v8 addEntriesFromDictionary:v24];

    [(ICTTTextController *)self addBIToStyle:v8];
    v25 = [MEMORY[0x1E4F834E8] paragraphStyleNamed:3];
    [v8 setObject:v25 forKeyedSubscript:*v19];

    v126 = [v8 objectForKeyedSubscript:*v19];
    uint64_t v123 = 4;
    uint64_t v124 = -1;
  }
  v125 = v7;
  if ([(ICTTTextController *)self keepNSTextTableAttributes])
  {
    v122 = self;
    uint64_t v35 = v18;
    uint64_t v36 = *MEMORY[0x1E4FB0738];
    v37 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];
    v38 = [v37 textBlocks];
    v39 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_27_1];
    v40 = [v38 filteredArrayUsingPredicate:v39];

    if ([v40 count])
    {
      v41 = [v8 objectForKeyedSubscript:v36];
      if (v41)
      {
        v42 = [v8 objectForKeyedSubscript:v36];
        v43 = (void *)[v42 mutableCopy];
      }
      else
      {
        v43 = objc_msgSend(MEMORY[0x1E4FB0850], "ic_mutableDefaultParagraphStyle");
      }

      [v43 setTextBlocks:v40];
      v44 = (void *)[v43 copy];
      [v8 setObject:v44 forKeyedSubscript:v36];
    }
    uint64_t v18 = v35;
    self = v122;
  }
  v45 = (void *)MEMORY[0x1E4F83240];
  v46 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83240]];

  v47 = (void *)MEMORY[0x1E4FB0808];
  if (v46)
  {
    v48 = [v8 objectForKeyedSubscript:*v45];
    [v8 setObject:v48 forKeyedSubscript:*v47];
  }
  else
  {
    uint64_t v49 = *MEMORY[0x1E4FB0808];
    v50 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB0808]];

    if (v50) {
      [v8 removeObjectForKey:v49];
    }
  }
  v51 = (void *)MEMORY[0x1E4F83228];
  v52 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83228]];

  v53 = (void *)MEMORY[0x1E4FB0768];
  if (v52)
  {
    v54 = NSNumber;
    v55 = [v8 objectForKeyedSubscript:*v51];
    v56 = objc_msgSend(v54, "numberWithInteger:", objc_msgSend(v55, "BOOLValue"));
    [v8 setObject:v56 forKeyedSubscript:*v53];
  }
  else
  {
    uint64_t v57 = *MEMORY[0x1E4FB0768];
    v58 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB0768]];

    if (v58) {
      [v8 removeObjectForKey:v57];
    }
  }
  uint64_t v59 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB0720]];
  v60 = (void *)MEMORY[0x1E4FB0700];
  if (v59)
  {
    v61 = (void *)v59;
    v62 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83200]];

    if (!v62)
    {
      uint64_t v66 = *MEMORY[0x1E4F5F118];
      v67 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F5F118]];

      if (!v67) {
        goto LABEL_51;
      }
      objc_opt_class();
      uint64_t v68 = [v8 objectForKeyedSubscript:v66];
      v69 = ICDynamicCast();

      [v69 coreResult];
      LOBYTE(v68) = DDShouldUseLightLinksForResult();

      if ((v68 & 1) == 0)
      {
LABEL_51:
        uint64_t v64 = [MEMORY[0x1E4FB1618] tintColor];
        goto LABEL_54;
      }
    }
  }
  v63 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83570]];

  if (v63)
  {
    uint64_t v64 = [MEMORY[0x1E4FB1618] ICHashtagUnconfirmedColor];
LABEL_54:
    v71 = (void *)v64;
    [v8 setObject:v64 forKeyedSubscript:*v60];

    goto LABEL_55;
  }
  v65 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83580]];

  if (v65)
  {
    uint64_t v64 = [MEMORY[0x1E4FB1618] ICMentionUnconfirmedColor];
    goto LABEL_54;
  }
  v70 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83538]];

  if (v70)
  {
    uint64_t v64 = [MEMORY[0x1E4FB1618] ICLinkAcceleratorUnconfirmedColor];
    goto LABEL_54;
  }
  v113 = (void *)MEMORY[0x1E4F83200];
  v114 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83200]];

  if (!v114)
  {
    v119 = (void *)MEMORY[0x1E4F83218];
    v120 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83218]];

    if (v120)
    {
      v121 = [v8 objectForKeyedSubscript:*v119];

      [MEMORY[0x1E4FB1618] colorWithCGColor:v121];
    }
    else
    {
      [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
    uint64_t v64 = };
    goto LABEL_54;
  }
  if (ICInternalSettingsIsEmphasisEnabled())
  {
    [v8 setObject:*MEMORY[0x1E4FB07D0] forKeyedSubscript:*MEMORY[0x1E4FB07C8]];
    v115 = [v10 objectForKeyedSubscript:*v113];
    uint64_t v116 = (int)[v115 intValue];

    v117 = (void *)ICEmphasisColorTypeForTag(v116);
    v118 = ICNSTextHighlightColorSchemeForEmphasisColorType((uint64_t)v117);
    [v8 setObject:v118 forKeyedSubscript:*MEMORY[0x1E4FB0798]];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v64 = ICColorForEmphasisColorType(v117);
      goto LABEL_54;
    }
  }
LABEL_55:
  v72 = [v8 objectForKeyedSubscript:*v60];
  [v8 setObject:v72 forKeyedSubscript:*MEMORY[0x1E4F83588]];

  uint64_t v73 = *MEMORY[0x1E4FB06C0];
  v74 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB06C0]];

  if (v74)
  {
    v75 = [v10 objectForKeyedSubscript:v73];
    [v8 setObject:v75 forKeyedSubscript:v73];
  }
  uint64_t v76 = *MEMORY[0x1E4F83550];
  v77 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F83550]];

  if (v77)
  {
    v78 = [v10 objectForKeyedSubscript:v76];
    [v8 setObject:v78 forKeyedSubscript:v76];
  }
  v79 = (void *)MEMORY[0x1E4F83548];
  v80 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F83548]];

  if (v80)
  {
    v81 = [v10 objectForKeyedSubscript:*v79];
    [v8 setObject:v81 forKeyedSubscript:*v79];
  }
  v82 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F83208]];
  v83 = v82;
  if (v82)
  {
    [v82 pointSize];
    if (v84 != INFINITY)
    {
      v85 = objc_msgSend(v83, "nativeFontForStyle:contentSizeCategory:isForPrint:", objc_msgSend(v126, "style"), v125, -[ICTTTextController isForPrint](self, "isForPrint"));
      [v8 setObject:v85 forKeyedSubscript:v18];

      [(ICTTTextController *)self addBIToStyle:v8];
    }
  }
  v86 = (void *)MEMORY[0x1E4F83230];
  v87 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F83230]];
  if (v87)
  {
    v88 = [v10 objectForKeyedSubscript:*v86];
    uint64_t v89 = [v88 integerValue];
  }
  else
  {
    uint64_t v89 = 0;
  }

  v90 = [v8 objectForKeyedSubscript:v18];
  [v90 pointSize];
  double v92 = v91;

  if (v83 || !v89)
  {
    if (!v89) {
      goto LABEL_72;
    }
  }
  else
  {
    v93 = [v8 objectForKeyedSubscript:v18];
    [v93 pointSize];
    double v95 = v94;
    +[ICTTTextController superscriptScaleFactor];
    v97 = [v93 fontWithSize:v95 * v96];
    [v8 setObject:v97 forKeyedSubscript:v18];
  }
  v98 = [NSNumber numberWithDouble:round((double)v89 * 0.2 * (double)(uint64_t)v92)];
  [v8 setObject:v98 forKeyedSubscript:*MEMORY[0x1E4FB06C8]];

LABEL_72:
  uint64_t v99 = *MEMORY[0x1E4FB06B8];
  v100 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];

  if (v100)
  {
    v101 = [v8 objectForKeyedSubscript:v99];
    if ([v101 conformsToProtocol:&unk_1F09A5DB0]
      && ([MEMORY[0x1E4F834B0] isInlineAttachment:v101] & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E4FB0850], "ic_mutableDefaultParagraphStyle");
      v102 = self;
      v104 = uint64_t v103 = v18;
      [(id)objc_opt_class() attachmentParagraphSpacing];
      objc_msgSend(v104, "setParagraphSpacing:");
      [(id)objc_opt_class() attachmentParagraphSpacingBefore];
      objc_msgSend(v104, "setParagraphSpacingBefore:");
      [v104 setBaseWritingDirection:v124];
      [v104 setAlignment:v123];
      v105 = (void *)[v104 copy];
      [v8 setObject:v105 forKeyedSubscript:*MEMORY[0x1E4FB0738]];

      uint64_t v18 = v103;
      self = v102;
    }
  }
  v106 = [(ICTTTextController *)self zoomController];

  if (!v106) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.zoomController) != nil)", "-[ICTTTextController styleForModelAttributes:contentSizeCategory:]", 1, 0, @"Expected non-nil value for '%s'", "self.zoomController");
  }
  v107 = [(ICTTTextController *)self zoomController];
  v108 = [v107 zoomFontInAttributes:v8];

  if ([(ICTTTextController *)self disableSingleLineA])
  {
    v109 = [v108 objectForKey:v18];

    if (v109)
    {
      v110 = [v108 objectForKeyedSubscript:v18];
      v111 = objc_msgSend(v110, "ic_fontWithoutSingleLineA");
      [v108 setObject:v111 forKeyedSubscript:v18];
    }
  }

  return v108;
}

- (ICTTZoomController)zoomController
{
  return self->_zoomController;
}

- (BOOL)keepNSTextTableAttributes
{
  return self->_keepNSTextTableAttributes;
}

- (BOOL)disableSingleLineA
{
  return self->_disableSingleLineA;
}

- (void)addBIToStyle:(id)a3
{
  id v11 = a3;
  v3 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F83210]];
  v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 intValue];
    uint64_t v6 = *MEMORY[0x1E4FB06F8];
    id v7 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
    uint64_t v8 = [MEMORY[0x1E4F834B8] convertFont:v7 toBold:v5 & 1 toItalic:(v5 >> 1) & 1];
    id v9 = (void *)v8;
    if (v8) {
      BOOL v10 = v8 == (void)v7;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10) {
      [v11 setObject:v8 forKeyedSubscript:v6];
    }
  }
}

- (id)defaultListAttributesWithContentSizeCategory:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4FB0850];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  [v6 setParagraphSpacing:0.0];
  [v6 setParagraphSpacingBefore:0.0];
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  double v8 = 4.0;
  if (IsTextKit2Enabled) {
    double v8 = 2.0;
  }
  [v6 setLineSpacing:v8];
  [v6 setLineHeightMultiple:1.0];
  v13[0] = *MEMORY[0x1E4FB0738];
  id v9 = (void *)[v6 copy];
  v14[0] = v9;
  v13[1] = *MEMORY[0x1E4FB06F8];
  BOOL v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", v5, -[ICTTTextController isForPrint](self, "isForPrint"));

  v14[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v11;
}

- (id)bodyAttributesWithContentSizeCategory:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4FB0850];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  [(id)objc_opt_class() bodyParagraphSpacing];
  objc_msgSend(v6, "setParagraphSpacing:");
  [(id)objc_opt_class() bodyParagraphSpacingBefore];
  objc_msgSend(v6, "setParagraphSpacingBefore:");
  [v6 setLineHeightMultiple:1.0];
  [v6 setLineSpacing:4.0];
  v11[0] = *MEMORY[0x1E4FB0738];
  id v7 = (void *)[v6 copy];
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E4FB06F8];
  double v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", v5, -[ICTTTextController isForPrint](self, "isForPrint"));

  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

+ (double)bodyParagraphSpacing
{
  return 0.0;
}

+ (double)bodyParagraphSpacingBefore
{
  return 0.0;
}

+ (double)attachmentParagraphSpacing
{
  return 8.0;
}

+ (double)attachmentParagraphSpacingBefore
{
  return 9.0;
}

- (id)titleAttributesWithContentSizeCategory:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4FB0850];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  [v6 setParagraphSpacing:3.0];
  [v6 setParagraphSpacingBefore:0.0];
  [v6 setLineHeightMultiple:1.0];
  [v6 setLineSpacing:1.0];
  v11[0] = *MEMORY[0x1E4FB0738];
  id v7 = (void *)[v6 copy];
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E4FB06F8];
  double v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForTitleTextWithContentSizeCategory:isForPrint:isReducedSize:", v5, -[ICTTTextController isForPrint](self, "isForPrint"), -[ICTTTextController isForSiri](self, "isForSiri"));

  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (BOOL)isForSiri
{
  return self->_isForSiri;
}

- (id)headingAttributesWithContentSizeCategory:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4FB0850];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  [v6 setParagraphSpacing:4.0];
  [v6 setParagraphSpacingBefore:0.0];
  [v6 setLineHeightMultiple:1.0];
  v11[0] = *MEMORY[0x1E4FB0738];
  id v7 = (void *)[v6 copy];
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E4FB06F8];
  double v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForHeadingTextWithContentSizeCategory:isForPrint:", v5, -[ICTTTextController isForPrint](self, "isForPrint"));

  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)preferredAttributesForICTTTextStyle:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      v3 = [(ICTTTextController *)self titleAttributes];
      break;
    case 1u:
      v3 = [(ICTTTextController *)self headingAttributes];
      break;
    case 2u:
      v3 = [(ICTTTextController *)self subheadingAttributes];
      break;
    case 3u:
      v3 = [(ICTTTextController *)self bodyAttributes];
      break;
    case 4u:
      v3 = [(ICTTTextController *)self fixedWidthAttributes];
      break;
    default:
      switch(a3)
      {
        case 'd':
        case 'e':
        case 'f':
          v3 = [(ICTTTextController *)self defaultListAttributes];
          break;
        case 'g':
          v3 = [(ICTTTextController *)self checklistAttributes];
          break;
        default:
          v3 = 0;
          break;
      }
      break;
  }
  return v3;
}

- (id)bodyAttributes
{
  return [(ICTTTextController *)self bodyAttributesWithContentSizeCategory:0];
}

- (BOOL)isInPreviewMode
{
  return self->_inPreviewMode;
}

- (id)defaultListAttributes
{
  return [(ICTTTextController *)self defaultListAttributesWithContentSizeCategory:0];
}

void __64__ICTTTextController_styleText_inExactRange_fixModelAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  objc_opt_class();
  id v7 = [*(id *)(a1 + 32) highlightsAttributedString];
  double v8 = ICDynamicCast();
  id v9 = v8;
  uint64_t v10 = *MEMORY[0x1E4FB0720];
  if (v11) {
    objc_msgSend(v8, "addAttribute:value:range:", v10, v11, a3, a4);
  }
  else {
    objc_msgSend(v8, "removeAttribute:range:", v10, a3, a4);
  }
}

- (void)setIsForSiri:(BOOL)a3
{
  self->_isForSiruint64_t i = a3;
}

- (void)styleText:(id)a3 inRange:(_NSRange)a4 fixModelAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v19 = a3;
  if ([v19 length])
  {
    if (location >= [v19 length])
    {
      NSUInteger length = 0;
      NSUInteger location = [v19 length] - 1;
    }
    id v9 = [v19 string];
    uint64_t v10 = objc_msgSend(v9, "paragraphRangeForRange:", location, length);
    NSUInteger v12 = v11;

    unint64_t v13 = length + location;
    if (v13 == v10 + v12 && v13 < [v19 length])
    {
      v14 = [v19 string];
      NSUInteger v15 = objc_msgSend(v14, "paragraphRangeForRange:", v13, 0);
      NSUInteger v17 = v16;

      v21.NSUInteger location = v10;
      v21.NSUInteger length = v12;
      v22.NSUInteger location = v15;
      v22.NSUInteger length = v17;
      NSRange v18 = NSUnionRange(v21, v22);
      uint64_t v10 = v18.location;
      NSUInteger v12 = v18.length;
    }
    -[ICTTTextController styleText:inExactRange:fixModelAttributes:](self, "styleText:inExactRange:fixModelAttributes:", v19, v10, v12, v5);
  }
}

- (void)styleText:(id)a3 inExactRange:(_NSRange)a4 fixModelAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v24.NSUInteger location = objc_msgSend(v9, "ic_range");
  v24.NSUInteger length = v10;
  v23.NSUInteger location = location;
  v23.NSUInteger length = length;
  NSRange v11 = NSIntersectionRange(v23, v24);
  if (v11.length)
  {
    if (v5)
    {
      [v9 setDisableUndoCoalesceBreaking:1];
      -[ICTTTextController fixModelAttributesInTextStorage:inRange:](self, "fixModelAttributesInTextStorage:inRange:", v9, v11.location, v11.length);
      [v9 setDisableUndoCoalesceBreaking:0];
    }
    [v9 beginTemporaryAttributeEditing];
    uint64_t v21 = *MEMORY[0x1E4FB0738];
    NSUInteger v12 = [(ICTTTextController *)self defaultParagraphStyle];
    v22[0] = v12;
    unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    objc_msgSend(v9, "addAttributes:range:", v13, v11.location, v11.length);

    -[ICTTTextController styleFontInTextStorage:inRange:](self, "styleFontInTextStorage:inRange:", v9, v11.location, v11.length);
    -[ICTTTextController styleListsAndIndentsInAttributedString:inRange:](self, "styleListsAndIndentsInAttributedString:inRange:", v9, v11.location, v11.length);
    uint64_t v14 = *MEMORY[0x1E4FB0720];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    NSRange v18 = __64__ICTTTextController_styleText_inExactRange_fixModelAttributes___block_invoke;
    id v19 = &unk_1E5FDE740;
    id v15 = v9;
    id v20 = v15;
    objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v14, v11.location, v11.length, 0, &v16);
    objc_msgSend(v15, "invalidateAttributesInRange:", v11.location, v11.length, v16, v17, v18, v19);
    [v15 endTemporaryAttributeEditing];
  }
}

- (void)styleFontInTextStorage:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [v7 beginEditing];
  -[ICTTTextController styleFontInAttributedString:inRange:contentSizeCategory:](self, "styleFontInAttributedString:inRange:contentSizeCategory:", v7, location, length, 0);
  [v7 endEditing];
}

- (id)defaultParagraphStyle
{
  v2 = objc_msgSend(MEMORY[0x1E4FB0850], "ic_mutableDefaultParagraphStyle");
  [v2 setLineHeightMultiple:1.2];
  v3 = (void *)[v2 copy];

  return v3;
}

- (ICTTTextController)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICTTTextController;
  v2 = [(ICTTTextController *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(ICZoomController);
    zoomController = v2->_zoomController;
    v2->_zoomController = &v3->super;

    BOOL v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_showsEditorDebugTooltips = [v5 BOOLForKey:kICShowEditorDebugTooltips];

    [(ICTTTextController *)v2 resetGuessedFontSizes];
  }
  return v2;
}

- (void)setHeadingStyleFontSizeThreshold:(double)a3
{
  self->_headingStyleFontSizeThreshold = a3;
}

- (void)resetGuessedFontSizes
{
  [(ICTTTextController *)self setBodyStyleFontSizeThreshold:16.0];
  [(ICTTTextController *)self setHeadingStyleFontSizeThreshold:19.0];
}

- (void)setBodyStyleFontSizeThreshold:(double)a3
{
  self->_bodyStyleFontSizeThreshold = a3;
}

- (id)titleAttributes
{
  return [(ICTTTextController *)self titleAttributesWithContentSizeCategory:0];
}

- (id)headingAttributes
{
  return [(ICTTTextController *)self headingAttributesWithContentSizeCategory:0];
}

- (id)subheadingAttributes
{
  return [(ICTTTextController *)self subheadingAttributesWithContentSizeCategory:0];
}

- (id)subheadingAttributesWithContentSizeCategory:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4FB0850];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  [v6 setLineHeightMultiple:1.0];
  [v6 setLineSpacing:4.0];
  v11[0] = *MEMORY[0x1E4FB0738];
  objc_super v7 = (void *)[v6 copy];
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E4FB06F8];
  double v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForSubheadingTextWithContentSizeCategory:isForPrint:", v5, -[ICTTTextController isForPrint](self, "isForPrint"));

  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)captionAttributes
{
  return [(ICTTTextController *)self captionAttributesWithContentSizeCategory:0];
}

- (id)captionAttributesWithContentSizeCategory:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4FB0850], "ic_mutableDefaultParagraphStyle");
  [v4 setAlignment:1];
  if (v3)
  {
    id v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v3];
    uint64_t v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] compatibleWithTraitCollection:v5];
    objc_super v7 = objc_msgSend(v6, "ic_fontWithSingleLineA");
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
    objc_super v7 = objc_msgSend(v5, "ic_fontWithSingleLineA");
  }

  v11[0] = *MEMORY[0x1E4FB0738];
  double v8 = (void *)[v4 copy];
  v11[1] = *MEMORY[0x1E4FB06F8];
  v12[0] = v8;
  v12[1] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)checklistAttributes
{
  return [(ICTTTextController *)self checklistAttributesWithContentSizeCategory:0];
}

- (id)checklistAttributesWithContentSizeCategory:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4FB0850];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  [v6 setParagraphSpacing:5.0];
  [v6 setParagraphSpacingBefore:5.0];
  [v6 setLineHeightMultiple:1.0];
  v11[0] = *MEMORY[0x1E4FB0738];
  objc_super v7 = (void *)[v6 copy];
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E4FB06F8];
  double v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", v5, -[ICTTTextController isForPrint](self, "isForPrint"));

  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)fixedWidthAttributes
{
  return [(ICTTTextController *)self fixedWidthAttributesWithContentSizeCategory:0];
}

- (id)fixedWidthAttributesWithContentSizeCategory:(id)a3
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4FB0850];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "ic_mutableDefaultParagraphStyle");
  [v5 setLineSpacing:2.0];
  v10[0] = *MEMORY[0x1E4FB0738];
  uint64_t v6 = (void *)[v5 copy];
  v11[0] = v6;
  v10[1] = *MEMORY[0x1E4FB06F8];
  objc_super v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForFixedWidthTextWithContentSizeCategory:", v4);

  v11[1] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

+ (double)superscriptScaleFactor
{
  return 0.83;
}

- (id)typingAttributesForSettingTextStyleForRange:(_NSRange)a3 currentTypingAttributes:(id)a4 inTextStorage:(id)a5
{
  return -[ICTTTextController typingAttributesForRange:forSelectionChange:forSettingTextStyle:currentTypingAttributes:inTextStorage:](self, "typingAttributesForRange:forSelectionChange:forSettingTextStyle:currentTypingAttributes:inTextStorage:", a3.location, a3.length, 0, 1, a4, a5);
}

- (id)typingAttributesForRange:(_NSRange)a3 forSelectionChange:(BOOL)a4 currentTypingAttributes:(id)a5 inTextStorage:(id)a6
{
  return -[ICTTTextController typingAttributesForRange:forSelectionChange:forSettingTextStyle:currentTypingAttributes:inTextStorage:](self, "typingAttributesForRange:forSelectionChange:forSettingTextStyle:currentTypingAttributes:inTextStorage:", a3.location, a3.length, a4, 0, a5, a6);
}

- (id)typingAttributesForRange:(_NSRange)a3 forSelectionChange:(BOOL)a4 forSettingTextStyle:(BOOL)a5 currentTypingAttributes:(id)a6 inTextStorage:(id)a7
{
  BOOL v8 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v13 = a6;
  id v14 = a7;
  NSUInteger v15 = [v14 length];
  if (length) {
    v16.NSUInteger length = v15;
  }
  else {
    v16.NSUInteger length = v15 + 1;
  }
  v68.NSUInteger location = location;
  v68.NSUInteger length = length;
  v16.NSUInteger location = 0;
  NSRange v17 = NSIntersectionRange(v68, v16);
  NSUInteger v18 = v17.location;
  NSUInteger v19 = v17.length;
  uint64_t v20 = [v14 logicalRangeForLocation:v17.location];
  uint64_t v22 = v21;
  if ([v14 convertAttributes])
  {
    [(ICTTTextController *)self modelForStyleAttributes:v13 filterAttributes:0];
    id v23 = v14;
    BOOL v24 = v8;
    v26 = v25 = self;
    uint64_t v27 = [(ICTTTextController *)v25 styleForModelAttributes:v26];

    self = v25;
    BOOL v8 = v24;
    id v14 = v23;
    NSUInteger v18 = v17.location;
    NSUInteger v19 = v17.length;
    id v13 = (id)v27;
  }
  uint64_t v65 = 0;
  NSUInteger v66 = 0;
  uint64_t v28 = [v14 string];
  objc_msgSend(v28, "getParagraphStart:end:contentsEnd:forRange:", 0, &v66, 0, 0, 0);

  v29 = [v14 string];
  objc_msgSend(v29, "getParagraphStart:end:contentsEnd:forRange:", &v65, 0, 0, v18, v19);

  NSUInteger v30 = v66;
  NSUInteger v31 = v20 + v22;
  if (v66 >= v31) {
    NSUInteger v30 = v31;
  }
  NSUInteger v66 = v30;
  if (!a4 && !v8)
  {
    if (!v22)
    {
      objc_opt_class();
      v32 = (void *)MEMORY[0x1E4F83220];
      v33 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
      v34 = ICDynamicCast();
      int v35 = [v34 isList];

      if (v35)
      {
        id v36 = (id)[v13 mutableCopy];
        [v36 removeObjectForKey:*v32];
        v37 = v13;
        goto LABEL_21;
      }
    }
    goto LABEL_23;
  }
  if (!v18 && !v19 && !v30)
  {
    v38 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];

    if (v38) {
      goto LABEL_23;
    }
    [(ICTTTextController *)self defaultTypingAttributesForEmptyDocument];
    v37 = v13;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v19)
  {
    v37 = [v14 attributesAtIndex:v18 effectiveRange:0];
    v39 = [(ICTTTextController *)self styleForModelAttributes:v37];
    v40 = (void *)[v39 mutableCopy];

    v41 = [(ICTTTextController *)self removeAttribute:*MEMORY[0x1E4FB0720] ifInconsistentAtLocation:v18 inTextStorage:v14 forNewTypingAttributes:v40];

    if (!v41)
    {
LABEL_22:

      goto LABEL_23;
    }
    id v42 = [(ICTTTextController *)self copyNSParagraphStylefromAttributes:v37 toAttributes:v41];

    id v36 = v42;
LABEL_21:
    id v13 = v36;
    goto LABEL_22;
  }
  uint64_t v50 = v65;
  if (!v8 && v18 == v65)
  {
    objc_opt_class();
    v51 = ICDynamicCast();
    uint64_t v52 = -[ICTTTextController strippedTypingAttributesAtStartOfParagraph:atTheEndOfDocument:isTyping:](self, "strippedTypingAttributesAtStartOfParagraph:atTheEndOfDocument:isTyping:", v13, v18 == v31, [v51 isTypingOrMarkingText]);

    id v13 = (id)v52;
  }
  if (v18 <= v31)
  {
    objc_opt_class();
    v53 = ICDynamicCast();
    int v54 = [v53 isTypingOrMarkingText];

    if (v54)
    {
      if (v18 >= v31)
      {
        v37 = 0;
        goto LABEL_22;
      }
      v37 = [v14 attributesAtIndex:v18 effectiveRange:0];
      v55 = (void *)[v13 mutableCopy];
      id v56 = [(ICTTTextController *)self copyAttribute:*MEMORY[0x1E4F83220] fromAttributes:v37 toAttributes:v55];
      goto LABEL_46;
    }
    uint64_t v57 = [(ICTTTextController *)self referenceAttributesForLocation:v18 textStorage:v14 currentParagraphStart:v65];
    id v58 = (id)v57;
    if (v18 == v50)
    {
      if (v8)
      {
        uint64_t v59 = (void *)MEMORY[0x1E4F83220];
        v60 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
        v61 = (void *)[v58 mutableCopy];
        v37 = v61;
        if (v60) {
          [v61 setObject:v60 forKeyedSubscript:*v59];
        }

        goto LABEL_44;
      }
      if (v18 == v31)
      {
        v37 = 0;
        goto LABEL_48;
      }
    }
    v37 = (void *)v57;
LABEL_44:
    if (!v37) {
      goto LABEL_22;
    }
    v62 = [(ICTTTextController *)self styleForModelAttributes:v37];
    v55 = (void *)[v62 mutableCopy];

    id v56 = [(ICTTTextController *)self removeAttribute:*MEMORY[0x1E4FB0720] ifInconsistentAtLocation:v18 inTextStorage:v14 forNewTypingAttributes:v55];
LABEL_46:
    v63 = v56;

    if (!v63) {
      goto LABEL_22;
    }
    id v64 = [(ICTTTextController *)self copyNSParagraphStylefromAttributes:v37 toAttributes:v63];

    id v58 = v64;
    id v13 = v58;
LABEL_48:

    goto LABEL_22;
  }
LABEL_23:
  if (typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__onceToken != -1) {
    dispatch_once(&typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__onceToken, &__block_literal_global_94);
  }
  v43 = (void *)typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__stripTypingAttributeKeys;
  v44 = (void *)MEMORY[0x1E4F1CAD0];
  v45 = [v13 allKeys];
  v46 = [v44 setWithArray:v45];
  LODWORD(v43) = [v43 intersectsSet:v46];

  if (v43)
  {
    v47 = (void *)[v13 mutableCopy];
    v48 = [(id)typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__stripTypingAttributeKeys allObjects];
    [v47 removeObjectsForKeys:v48];

    id v13 = v47;
  }

  return v13;
}

void __124__ICTTTextController_typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage___block_invoke()
{
  v8[9] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4FB06B0];
  v8[0] = *MEMORY[0x1E4FB06B8];
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4FB0780];
  v8[2] = *MEMORY[0x1E4FB06C0];
  v8[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F83550];
  v8[4] = *MEMORY[0x1E4F83548];
  v8[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F83580];
  v8[6] = *MEMORY[0x1E4F83570];
  v8[7] = v4;
  v8[8] = *MEMORY[0x1E4F83538];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:9];
  uint64_t v6 = [v0 setWithArray:v5];
  objc_super v7 = (void *)typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__stripTypingAttributeKeys;
  typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__stripTypingAttributeKeys = v6;
}

- (id)defaultTypingAttributesForEmptyDocument
{
  uint64_t v3 = +[ICTextStyle noteDefaultNamedStyle];
  uint64_t v4 = [MEMORY[0x1E4F834E8] paragraphStyleNamed:v3];
  if (v3 == 1)
  {
    id v5 = [(ICTTTextController *)self headingAttributes];
  }
  else
  {
    if (v3) {
      [(ICTTTextController *)self bodyAttributes];
    }
    else {
    id v5 = [(ICTTTextController *)self titleAttributes];
    }
  }
  uint64_t v6 = v5;
  objc_super v7 = (void *)[v5 mutableCopy];
  [v7 setObject:v4 forKey:*MEMORY[0x1E4F83220]];
  BOOL v8 = [(ICTTTextController *)self zoomController];
  id v9 = [v8 zoomFontInAttributes:v7];

  NSUInteger v10 = (void *)[v9 copy];
  return v10;
}

- (id)strippedTypingAttributesAtStartOfParagraph:(id)a3 atTheEndOfDocument:(BOOL)a4 isTyping:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void *)[v8 mutableCopy];
  [v9 removeObjectForKey:*MEMORY[0x1E4FB0720]];
  if (v6)
  {
    NSUInteger v10 = (void *)MEMORY[0x1E4F83220];
    NSRange v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
    NSUInteger v12 = [MEMORY[0x1E4F834E8] paragraphStyleNamed:3];
    id v13 = (void *)[v12 mutableCopy];

    objc_msgSend(v13, "setIndent:", objc_msgSend(v11, "indent"));
    [v9 setObject:v13 forKey:*v10];
    [v9 removeObjectForKey:*MEMORY[0x1E4FB0738]];
    if (!a5)
    {
      [v9 removeObjectForKey:*MEMORY[0x1E4F83208]];
      [v9 removeObjectForKey:*MEMORY[0x1E4FB06F8]];
      [v9 removeObjectForKey:*MEMORY[0x1E4F83210]];
      [v9 removeObjectForKey:*MEMORY[0x1E4FB0768]];
      [v9 removeObjectForKey:*MEMORY[0x1E4FB0808]];
      [v9 removeObjectForKey:*MEMORY[0x1E4F83228]];
      [v9 removeObjectForKey:*MEMORY[0x1E4F83240]];
    }
  }
  id v14 = [(ICTTTextController *)self styleForModelAttributes:v9];

  return v14;
}

- (id)copyAttribute:(id)a3 fromAttributes:(id)a4 toAttributes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  NSUInteger v10 = [v8 objectForKeyedSubscript:v7];

  if (v10)
  {
    NSRange v11 = [v8 objectForKeyedSubscript:v7];
    [v9 setObject:v11 forKeyedSubscript:v7];
  }
  else
  {
    [v9 removeObjectForKey:v7];
  }

  return v9;
}

- (id)copyNSParagraphStylefromAttributes:(id)a3 toAttributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4FB0738];
  id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];

  if (v8)
  {
    id v9 = [v5 objectForKeyedSubscript:v7];
    NSUInteger v10 = (void *)[v9 mutableCopy];

    NSRange v11 = (void *)MEMORY[0x1E4F83220];
    uint64_t v12 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
    if (!v12) {
      goto LABEL_4;
    }
    id v13 = (void *)v12;
    objc_opt_class();
    id v14 = [v5 objectForKeyedSubscript:*v11];
    NSUInteger v15 = ICDynamicCast();
    int v16 = [v15 style];

    if (v16 == 3)
    {
LABEL_4:
      [v10 paragraphSpacing];
      double v18 = v17;
      [(id)objc_opt_class() attachmentParagraphSpacing];
      if (v18 == v19)
      {
        [v10 paragraphSpacingBefore];
        double v21 = v20;
        [(id)objc_opt_class() attachmentParagraphSpacingBefore];
        if (v21 == v22)
        {
          [(id)objc_opt_class() bodyParagraphSpacing];
          objc_msgSend(v10, "setParagraphSpacing:");
          [(id)objc_opt_class() bodyParagraphSpacingBefore];
          objc_msgSend(v10, "setParagraphSpacingBefore:");
        }
      }
    }
    id v23 = (void *)[v10 copy];
    [v6 setObject:v23 forKeyedSubscript:v7];
  }
  else
  {
    [v6 removeObjectForKey:v7];
  }

  return v6;
}

- (id)referenceAttributesForLocation:(unint64_t)a3 textStorage:(id)a4 currentParagraphStart:(unint64_t)a5
{
  id v7 = a4;
  id v8 = v7;
  if (a3 != a5 || [v7 length] <= a3)
  {
    if ((uint64_t)a3 <= 1) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = a3;
    }
    a3 = v9 - 1;
  }
  NSUInteger v10 = [v8 attributesAtIndex:a3 effectiveRange:0];

  return v10;
}

- (id)removeAttribute:(id)a3 ifInconsistentAtLocation:(unint64_t)a4 inTextStorage:(id)a5 forNewTypingAttributes:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if ([v10 length] <= a4
    || ((uint64_t)a4 <= 1 ? (unint64_t v12 = 1) : (unint64_t v12 = a4),
        [v10 attribute:v9 atIndex:v12 - 1 effectiveRange:0],
        id v13 = objc_claimAutoreleasedReturnValue(),
        [v10 attribute:v9 atIndex:a4 effectiveRange:0],
        id v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14 != v13))
  {
    [v11 removeObjectForKey:v9];
  }

  return v11;
}

- (id)styleForModelAttributes:(id)a3
{
  return [(ICTTTextController *)self styleForModelAttributes:a3 contentSizeCategory:0];
}

uint64_t __66__ICTTTextController_styleForModelAttributes_contentSizeCategory___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)guessFontSizeThresholdsForTTStylesInAttributedString:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ICTTTextController *)self resetGuessedFontSizes];
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__82;
  v45 = __Block_byref_object_dispose__82;
  id v46 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v4 string];
  uint64_t v6 = [v4 length];
  uint64_t v7 = *MEMORY[0x1E4FB0738];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke;
  v37[3] = &unk_1E5FDA830;
  id v32 = v5;
  id v38 = v32;
  id v8 = v4;
  id v39 = v8;
  v40 = &v41;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v37);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = (id)v42[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v10)
  {
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v34;
    double v13 = 0.0;
    double v14 = 1.79769313e308;
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
    do
    {
      uint64_t v19 = 0;
      double v20 = v17;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        double v21 = *(void **)(*((void *)&v33 + 1) + 8 * v19);
        double v22 = [v21 objectAtIndexedSubscript:0];
        unint64_t v23 = [v22 integerValue];

        BOOL v24 = [v21 objectAtIndexedSubscript:1];
        [v24 doubleValue];
        double v26 = v25;

        if (v23 > v11)
        {
          unint64_t v11 = v23;
          double v13 = v26;
        }
        if (v26 > v15) {
          double v27 = v26;
        }
        else {
          double v27 = v15;
        }
        if (v26 <= v16)
        {
          double v28 = v16;
        }
        else
        {
          double v27 = v16;
          double v28 = v26;
        }
        if (v23 < 3)
        {
          double v15 = v27;
          double v16 = v28;
        }
        if (v26 <= v20) {
          double v17 = v20;
        }
        else {
          double v17 = v26;
        }
        if (v26 > v20) {
          double v18 = v20;
        }
        if (v26 < v14) {
          double v14 = v26;
        }
        ++v19;
        double v20 = v17;
      }
      while (v10 != v19);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v47 count:16];
    }
    while (v10);
  }
  else
  {
    double v13 = 0.0;
    double v14 = 1.79769313e308;
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
  }

  [(ICTTTextController *)self bodyStyleFontSizeThreshold];
  BOOL v30 = v13 <= v29;
  double v31 = v13;
  if (!v30 || (double v31 = v14, v13 == 0.0)) {
    [(ICTTTextController *)self setBodyStyleFontSizeThreshold:v31];
  }
  if (v15 > v13 || (double v15 = v16, v16 > v13) || (double v15 = v18, v18 > v13) || (double v15 = v17, v17 >= v13)) {
    [(ICTTTextController *)self setHeadingStyleFontSizeThreshold:v15];
  }

  _Block_object_dispose(&v41, 8);
}

void __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  unint64_t v7 = a3 + a4;
  if (a3 < a3 + a4)
  {
    uint64_t v20 = *MEMORY[0x1E4F28540];
    uint64_t v21 = *MEMORY[0x1E4FB06F8];
    do
    {
      id v8 = (void *)MEMORY[0x1B3E9ED80]();
      uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "paragraphRangeForRange:", a3, 0);
      unint64_t v11 = v9;
      uint64_t v28 = 0;
      double v29 = &v28;
      uint64_t v30 = 0x2020000000;
      unint64_t v31 = 0;
      uint64_t v24 = 0;
      double v25 = (double *)&v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v27 = 0x4030000000000000;
      if (v9 >= 0x1A)
      {
        unint64_t v12 = (unint64_t)((double)(v9 / 0x64) + 1.0);
        if (v9 >= 0x12C) {
          unint64_t v12 = 4;
        }
        unint64_t v31 = v12;
        double v13 = *(void **)(a1 + 32);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke_2;
        v23[3] = &unk_1E5FDE6C8;
        v23[4] = &v28;
        objc_msgSend(v13, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", v10, v9, v20, 0, 0, v23);
      }
      double v14 = *(void **)(a1 + 40);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      void v22[2] = __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke_3;
      v22[3] = &unk_1E5FDE6F0;
      v22[4] = &v24;
      objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v21, v10, v11, 0, v22);
      double v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      double v16 = [NSNumber numberWithUnsignedInteger:v29[3]];
      v32[0] = v16;
      double v17 = [NSNumber numberWithDouble:v25[3]];
      v32[1] = v17;
      double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
      [v15 addObject:v18];

      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(&v28, 8);
      a3 = v10 + v11;
    }
    while (a3 < v7);
  }
}

uint64_t __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (*MEMORY[0x1E4F28508] == a2) {
    ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

uint64_t __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 pointSize];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (unint64_t)defaultTabIntervalInAttributedString:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v4 = objc_msgSend(v3, "ic_range");
  uint64_t v5 = *MEMORY[0x1E4FB0738];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__ICTTTextController_defaultTabIntervalInAttributedString___block_invoke;
  v9[3] = &unk_1E5FDE718;
  v9[4] = &v10;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, v4, v6, 0, v9);
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __59__ICTTTextController_defaultTabIntervalInAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  [v9 defaultTabInterval];
  if (v7 != 0.0)
  {
    [v9 defaultTabInterval];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (unint64_t)v8;
    *a5 = 1;
  }
}

- (id)indentsForIndividualParagraphHeadIndentsInAttributedString:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__82;
  uint64_t v27 = __Block_byref_object_dispose__82;
  id v28 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = objc_msgSend(v3, "ic_range");
  uint64_t v5 = *MEMORY[0x1E4FB0738];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __81__ICTTTextController_indentsForIndividualParagraphHeadIndentsInAttributedString___block_invoke;
  v22[3] = &unk_1E5FDE718;
  v22[4] = &v23;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, v4, v6, 0, v22);
  double v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v8 = objc_msgSend((id)v24[5], "allObjects", 0);
  id v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        double v15 = [NSNumber numberWithUnsignedInteger:v11 + i];
        [v7 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v29 count:16];
      v11 += i;
    }
    while (v10);
  }

  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];

  _Block_object_dispose(&v23, 8);
  return v16;
}

void __81__ICTTTextController_indentsForIndividualParagraphHeadIndentsInAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = NSNumber;
  [a2 headIndent];
  objc_msgSend(v3, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v4];
}

- (void)prepareIndentInformationInAttributedString:(id)a3
{
  id v5 = a3;
  -[ICTTTextController setDefaultTabInterval:](self, "setDefaultTabInterval:", -[ICTTTextController defaultTabIntervalInAttributedString:](self, "defaultTabIntervalInAttributedString:"));
  if (![(ICTTTextController *)self defaultTabInterval])
  {
    id v4 = [(ICTTTextController *)self indentsForIndividualParagraphHeadIndentsInAttributedString:v5];
    [(ICTTTextController *)self setIndentForHeadIndent:v4];
  }
}

- (void)resetIndentInformation
{
  [(ICTTTextController *)self setDefaultTabInterval:0];
  [(ICTTTextController *)self setIndentForHeadIndent:0];
}

- (id)modelForStyleAttributes:(id)a3 filterAttributes:(BOOL)a4
{
  return [(ICTTTextController *)self modelForStyleAttributes:a3 filterAttributes:a4 pasteboardAttributedString:0];
}

- (id)modelForStyleAttributes:(id)a3 filterAttributes:(BOOL)a4 pasteboardAttributedString:(id)a5
{
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(ICTTTextController *)self zoomController];
  [v11 zoomFactor];
  double v13 = v12;

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v140 = *MEMORY[0x1E4FB06F8];
  double v15 = objc_msgSend(v9, "objectForKeyedSubscript:");
  double v16 = v15;
  double v17 = (void *)MEMORY[0x1E4F83220];
  if (!v7 || !v15)
  {
    if (!v15) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  [v15 pointSize];
  double v19 = v18;
  [(ICTTTextController *)self headingStyleFontSizeThreshold];
  if (v19 <= v13 * v20)
  {
    [v16 pointSize];
    double v23 = v22;
    [(ICTTTextController *)self bodyStyleFontSizeThreshold];
    if (v23 <= v13 * v24) {
      goto LABEL_10;
    }
    uint64_t v21 = 1;
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v25 = [MEMORY[0x1E4F834E0] paragraphStyleNamed:v21];
  [v25 setNeedsParagraphCleanup:1];
  [v14 setObject:v25 forKeyedSubscript:*v17];

LABEL_10:
  __int16 v145 = 0;
  [MEMORY[0x1E4F834B8] font:v16 isBold:(char *)&v145 + 1 isItalic:&v145];
  if (HIBYTE(v145) | (2 * v145))
  {
    uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [v14 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F83210]];
  }
LABEL_12:
  uint64_t v27 = *MEMORY[0x1E4FB0808];
  uint64_t v28 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB0808]];
  if (v28)
  {
    double v29 = (void *)v28;
    uint64_t v30 = [v9 objectForKeyedSubscript:v27];
    uint64_t v5 = [v30 integerValue];

    if (v5) {
      [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F83240]];
    }
  }
  uint64_t v31 = *MEMORY[0x1E4FB0768];
  uint64_t v32 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB0768]];
  if (v32)
  {
    long long v33 = (void *)v32;
    long long v34 = [v9 objectForKeyedSubscript:v31];
    uint64_t v5 = [v34 integerValue];

    if (v5) {
      [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F83228]];
    }
  }
  long long v35 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB07C8]];

  if (v35)
  {
    long long v36 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB0798]];
    uint64_t v37 = ICEmphasisColorTypeForNSTextHighlightColorScheme(v36);

    id v38 = [NSNumber numberWithInteger:v37];
    [v14 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F83200]];
  }
  if (!v7)
  {
    id v39 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    if (v39)
    {
      v40 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
      uint64_t v5 = [v39 isEqual:v40];

      if ((v5 & 1) == 0)
      {
        CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)[v39 CGColor], 1.0);
        [v14 setObject:CopyWithAlpha forKeyedSubscript:*MEMORY[0x1E4F83218]];
        CGColorRelease(CopyWithAlpha);
      }
    }
  }
  id v42 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F5F118]];
  v142 = v10;
  if (!v42
    || ([v9 objectForKeyedSubscript:*MEMORY[0x1E4F83598]],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v43 = *MEMORY[0x1E4FB0720];
    v44 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB0720]];

    if (v42)
    {
    }
    if (v44)
    {
      v45 = [v9 objectForKeyedSubscript:v43];
      [v14 setObject:v45 forKeyedSubscript:v43];

      id v46 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
      [v46 CGColor];
      id v47 = [MEMORY[0x1E4FB1618] tintColor];
      [v47 CGColor];
      int v48 = ICCGColorEquivalentToColor();

      if (v48) {
        [v14 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F83218]];
      }
    }
  }
  else
  {
  }
  uint64_t v49 = (void *)MEMORY[0x1E4F83230];
  uint64_t v50 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F83230]];

  if (v50)
  {
    v51 = [v9 objectForKeyedSubscript:*v49];
    [v14 setObject:v51 forKeyedSubscript:*v49];
  }
  uint64_t v52 = *MEMORY[0x1E4FB0818];
  v53 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB0818]];

  if (v53)
  {
    int v54 = [v9 objectForKeyedSubscript:v52];
    [v14 setObject:v54 forKeyedSubscript:v52];
  }
  uint64_t v55 = *MEMORY[0x1E4FB06B8];
  id v56 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];

  if (v56)
  {
    uint64_t v57 = [v9 objectForKeyedSubscript:v55];
    [v14 setObject:v57 forKeyedSubscript:v55];
  }
  uint64_t v58 = *MEMORY[0x1E4FB06B0];
  uint64_t v59 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB06B0]];

  if (v59)
  {
    v60 = [v9 objectForKeyedSubscript:v58];
    [v14 setObject:v60 forKeyedSubscript:v58];
  }
  v61 = (void *)MEMORY[0x1E4F83220];
  v62 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];

  if (v62)
  {
    v63 = [v9 objectForKeyedSubscript:*v61];
    [v14 setObject:v63 forKeyedSubscript:*v61];
  }
  uint64_t v64 = *MEMORY[0x1E4FB0738];
  uint64_t v65 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];

  if (v65)
  {
    v138 = self;
    NSUInteger v66 = [v9 objectForKeyedSubscript:v64];
    v67 = [v9 objectForKeyedSubscript:*v61];
    NSRange v68 = [v66 textLists];
    if ([v68 count])
    {
      char v69 = [v67 isList];

      if ((v69 & 1) == 0)
      {
        v70 = [v66 textLists];
        v71 = [v70 lastObject];

        v136 = v71;
        v72 = [v71 markerFormat];
        if ([v72 containsString:@"{hyphen}"])
        {
          uint64_t v73 = (void *)MEMORY[0x1E4F834E0];
          uint64_t v74 = 101;
        }
        else
        {
          if ([v72 containsString:@"{decimal}"])
          {
            v75 = [MEMORY[0x1E4F834E0] paragraphStyleNamed:102];

            uint64_t v76 = v136;
            if ([v136 startingItemNumber] < 1) {
              uint64_t v85 = 0;
            }
            else {
              uint64_t v85 = [v136 startingItemNumber];
            }
            [v75 setStartingItemNumber:v85];
            goto LABEL_76;
          }
          if (([v72 containsString:@"{check}"] & 1) != 0
            || ([v71 markerTextAttachment],
                v90 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                char isKindOfClass = objc_opt_isKindOfClass(),
                v90,
                (isKindOfClass & 1) != 0))
          {
            v75 = [MEMORY[0x1E4F834E0] paragraphStyleNamed:103];

            double v91 = [v9 objectForKeyedSubscript:v31];

            if (!v91) {
              goto LABEL_50;
            }
            v67 = [v75 todo];
            double v92 = [v67 todoWithDone:1];
            [v75 setTodo:v92];

LABEL_49:
LABEL_50:
            uint64_t v76 = v136;
LABEL_76:
            double v94 = [v66 textLists];
            objc_msgSend(v75, "setIndent:", objc_msgSend(v94, "count") - 1);

            [v75 setNeedsListCleanup:1];
            goto LABEL_77;
          }
          uint64_t v73 = (void *)MEMORY[0x1E4F834E0];
          uint64_t v74 = 100;
        }
        v75 = [v73 paragraphStyleNamed:v74];
        goto LABEL_49;
      }
    }
    else
    {
    }
    [v66 headIndent];
    if (v77 <= 0.0)
    {
      if ([v142 length])
      {
        BOOL v80 = [v142 length] != 1;
        v81 = [v142 attribute:*MEMORY[0x1E4F287E0] atIndex:v80 effectiveRange:0];
        if ([v81 intentKind] == 6)
        {
          v82 = [MEMORY[0x1E4F834E0] paragraphStyleNamed:3];

          uint64_t v83 = 0;
          if (v81)
          {
            do
            {
              ++v83;
              uint64_t v84 = [v81 parentIntent];

              v81 = (void *)v84;
            }
            while (v84);
          }
          [v82 setBlockQuoteLevel:v83];
          v81 = 0;
          v67 = v82;
        }
      }
      goto LABEL_78;
    }
    if ([(ICTTTextController *)v138 defaultTabInterval])
    {
      [v66 headIndent];
      uint64_t v79 = vcvtpd_u64_f64(fabs(v78 / (double)[(ICTTTextController *)v138 defaultTabInterval]));
    }
    else
    {
      v86 = [(ICTTTextController *)v138 indentForHeadIndent];

      if (v86)
      {
        v137 = [(ICTTTextController *)v138 indentForHeadIndent];
        v87 = NSNumber;
        [v66 headIndent];
        v88 = objc_msgSend(v87, "numberWithDouble:");
        uint64_t v89 = [v137 objectForKeyedSubscript:v88];
        uint64_t v79 = [v89 unsignedIntegerValue];
      }
      else
      {
        v93 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
          -[ICTTTextController modelForStyleAttributes:filterAttributes:pasteboardAttributedString:](v93);
        }

        uint64_t v79 = 0;
      }
    }
    v75 = [MEMORY[0x1E4F834E0] paragraphStyleNamed:3];

    [v75 setIndent:v79];
LABEL_77:
    v67 = v75;
LABEL_78:
    v61 = (void *)MEMORY[0x1E4F83220];
    if (v67)
    {
      objc_msgSend(v67, "setAlignment:", objc_msgSend(v66, "alignment"));
      objc_msgSend(v67, "setWritingDirection:", objc_msgSend(v66, "baseWritingDirection"));
      [v14 setObject:v67 forKeyedSubscript:*v61];
    }

    self = v138;
  }
  double v95 = [v9 objectForKeyedSubscript:v64];
  double v96 = [v14 objectForKeyedSubscript:*v61];
  v97 = v96;
  if (v7 && v95)
  {
    if (v96)
    {
      uint64_t v98 = [v96 alignment];
      if (v98 == *MEMORY[0x1E4F83258])
      {
LABEL_92:
        uint64_t v103 = [v97 writingDirection];
        if (v103 == [v95 baseWritingDirection]) {
          goto LABEL_100;
        }
        id v104 = (id)[v97 mutableCopy];
LABEL_96:
        id v105 = v104;

        objc_msgSend(v105, "setWritingDirection:", objc_msgSend(v95, "baseWritingDirection"));
        uint64_t v106 = [v105 alignment];
        if (v106 == *MEMORY[0x1E4F83260] || (uint64_t v107 = [v105 alignment], v107 == *MEMORY[0x1E4F83268])) {
          [v105 setAlignment:*MEMORY[0x1E4F83258]];
        }
        [v14 setObject:v105 forKeyedSubscript:*v61];

LABEL_100:
        if (v7) {
          goto LABEL_137;
        }
        goto LABEL_101;
      }
      id v99 = (id)[v97 mutableCopy];
    }
    else
    {
      uint64_t v100 = [v95 alignment];
      if (v100 == *MEMORY[0x1E4F83258]) {
        goto LABEL_94;
      }
      id v99 = objc_alloc_init(MEMORY[0x1E4F834E0]);
    }
    id v101 = v99;

    [v101 setAlignment:*MEMORY[0x1E4F83258]];
    id v102 = v101;

    [v14 setObject:v102 forKeyedSubscript:*v61];
    v97 = v102;
    if (v102) {
      goto LABEL_92;
    }
  }
  else
  {
    if (!v95) {
      goto LABEL_100;
    }
    if (v96) {
      goto LABEL_92;
    }
  }
LABEL_94:
  if ([v95 baseWritingDirection] != -1)
  {
    id v104 = objc_alloc_init(MEMORY[0x1E4F834E0]);
    v97 = 0;
    goto LABEL_96;
  }
  v97 = 0;
  if (v7) {
    goto LABEL_137;
  }
LABEL_101:
  if (v16)
  {
    v139 = [(ICTTTextController *)self styleForModelAttributes:v14];
    v108 = [v139 objectForKeyedSubscript:v140];
    [v16 pointSize];
    if (v109 <= 0.0 || ([v16 pointSize], v110 == INFINITY)) {
      v111 = v108;
    }
    else {
      v111 = v16;
    }
    [v111 pointSize];
    double v113 = v112;
    v114 = [v108 fontName];
    v115 = [v16 fontName];
    int v116 = [v114 isEqualToString:v115];

    [v108 pointSize];
    double v118 = round(v117);
    double v119 = round(v113);
    if ((v116 & 1) != 0 || !v97)
    {
LABEL_127:
      if (v116 && v118 == v119)
      {
LABEL_136:

        goto LABEL_137;
      }
LABEL_129:
      v126 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F83210]];
      uint64_t v127 = [v126 integerValue];

      id v128 = objc_alloc(MEMORY[0x1E4F834B8]);
      if (v116)
      {
        long long v129 = 0;
      }
      else
      {
        long long v129 = [v16 fontName];
      }
      double v130 = 0.0;
      if (v118 != v119)
      {
        objc_msgSend(v16, "pointSize", 0.0);
        double v130 = v131 / v13;
      }
      uint64_t v132 = (void *)[v128 initWithName:v129 size:v127 hints:v130];
      [v14 setObject:v132 forKeyedSubscript:*MEMORY[0x1E4F83208]];

      if ((v116 & 1) == 0) {
      goto LABEL_136;
      }
    }
    if (![v97 isHeader])
    {
      LOBYTE(v116) = 0;
      goto LABEL_129;
    }
    int v120 = [v97 style];
    if (v120 == 2)
    {
      uint64_t v121 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForSubheadingText");
    }
    else if (v120 == 1)
    {
      uint64_t v121 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForHeadingText");
    }
    else
    {
      if (v120) {
        objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyText");
      }
      else {
      uint64_t v121 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForTitleText");
      }
    }
    v122 = (void *)v121;
    __int16 v144 = 0;
    __int16 v143 = 0;
    [MEMORY[0x1E4F834B8] font:v16 isBold:(char *)&v144 + 1 isItalic:(char *)&v143 + 1];
    [MEMORY[0x1E4F834B8] font:v122 isBold:&v144 isItalic:&v143];
    uint64_t v123 = [v16 familyName];
    uint64_t v124 = [v108 familyName];
    if ([v123 isEqualToString:v124] && HIBYTE(v144) == v144)
    {
      int v141 = HIBYTE(v143);
      int v125 = v143;

      if (v141 == v125)
      {
        [v14 removeObjectForKey:*MEMORY[0x1E4F83210]];
        int v116 = 1;
LABEL_126:

        goto LABEL_127;
      }
    }
    else
    {
    }
    int v116 = 0;
    goto LABEL_126;
  }
LABEL_137:
  id v133 = v14;

  return v133;
}

- (id)filterStyleAttributes:(id)a3 range:(_NSRange)a4
{
  id v4 = a3;
  return v4;
}

- (id)writingToolsIgnoredRangesForTextStorage:(id)a3 inEnclosingRange:(_NSRange)a4 note:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [v9 calculateDocumentController];
  if (v11)
  {
    double v12 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v14 = [v9 calculateDocumentController];
      double v15 = [v14 expressionsIndexSet];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __84__ICTTTextController_writingToolsIgnoredRangesForTextStorage_inEnclosingRange_note___block_invoke;
      v26[3] = &unk_1E5FDE768;
      id v27 = v10;
      objc_msgSend(v15, "enumerateRangesInRange:options:usingBlock:", location, length, 0, v26);
    }
  }
  double v16 = [v9 textStorage];
  uint64_t v17 = *MEMORY[0x1E4F83220];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  double v23 = __84__ICTTTextController_writingToolsIgnoredRangesForTextStorage_inEnclosingRange_note___block_invoke_2;
  double v24 = &unk_1E5FDC388;
  id v25 = v10;
  id v18 = v10;
  objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v17, location, length, 0, &v21);

  double v19 = objc_msgSend(v18, "copy", v21, v22, v23, v24);
  return v19;
}

void __84__ICTTTextController_writingToolsIgnoredRangesForTextStorage_inEnclosingRange_note___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
}

void __84__ICTTTextController_writingToolsIgnoredRangesForTextStorage_inEnclosingRange_note___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if ([a2 isBlockQuote])
  {
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) addObject:v7];
  }
}

+ (id)preferredFontForICTTTextStyle:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      id v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForTitleText");
      break;
    case 1u:
      id v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForHeadingText");
      break;
    case 2u:
      id v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForSubheadingText");
      break;
    case 3u:
LABEL_4:
      id v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyText");
      break;
    case 4u:
      id v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForFixedWidthText");
      break;
    default:
      switch(a3)
      {
        case 'd':
        case 'e':
        case 'f':
        case 'g':
          goto LABEL_4;
        default:
          id v3 = 0;
          break;
      }
      break;
  }
  return v3;
}

- (BOOL)isForPrint
{
  return self->_isForPrint;
}

- (void)setIsForPrint:(BOOL)a3
{
  self->_isForPrint = a3;
}

- (double)bodyStyleFontSizeThreshold
{
  return self->_bodyStyleFontSizeThreshold;
}

- (double)headingStyleFontSizeThreshold
{
  return self->_headingStyleFontSizeThreshold;
}

- (unint64_t)defaultTabInterval
{
  return self->_defaultTabInterval;
}

- (void)setDefaultTabInterval:(unint64_t)a3
{
  self->_defaultTabInterval = a3;
}

- (NSDictionary)indentForHeadIndent
{
  return self->_indentForHeadIndent;
}

- (void)setIndentForHeadIndent:(id)a3
{
}

- (void)setZoomController:(id)a3
{
}

- (void)setKeepNSTextTableAttributes:(BOOL)a3
{
  self->_keepNSTextTableAttributes = a3;
}

- (void)setDisableSingleLineA:(BOOL)a3
{
  self->_disableSingleLineA = a3;
}

- (void)setInPreviewMode:(BOOL)a3
{
  self->_inPreviewMode = a3;
}

- (BOOL)showsEditorDebugTooltips
{
  return self->_showsEditorDebugTooltips;
}

- (void)setShowsEditorDebugTooltips:(BOOL)a3
{
  self->_showsEditorDebugTooltips = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomController, 0);
  objc_storeStrong((id *)&self->_indentForHeadIndent, 0);
}

- (void)modelForStyleAttributes:(os_log_t)log filterAttributes:pasteboardAttributedString:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
}

@end