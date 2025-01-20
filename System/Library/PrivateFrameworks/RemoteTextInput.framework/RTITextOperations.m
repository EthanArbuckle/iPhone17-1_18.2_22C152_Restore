@interface RTITextOperations
+ (BOOL)supportsSecureCoding;
+ (id)customInfoDictionary;
+ (void)registerCustomInfoClasses:(id)a3 forType:(id)a4;
+ (void)unregisterCustomInfoType:(id)a3;
- (BOOL)isAutoFillTextOperation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitAutoFillInvocation;
- (NSArray)multilingualLanguages;
- (NSAttributedString)attributedInsertionText;
- (NSAttributedString)textCheckingAnnotatedString;
- (NSDictionary)attributedPlaceholders;
- (NSMutableArray)attachmentClasses;
- (NSMutableArray)attachmentDatas;
- (NSMutableArray)fileHandles;
- (NSMutableArray)imageGlyphs;
- (NSMutableArray)imageUserInfos;
- (NSMutableArray)typeIdentifiers;
- (NSMutableDictionary)mutableAttributedPlaceholders;
- (NSSecureCoding)customInfo;
- (NSString)customInfoType;
- (NSString)description;
- (NSString)textCheckingAnnotationToRemove;
- (NSString)textToAssert;
- (NSUUID)targetSessionUUID;
- (RTIInputSourceState)inputSourceState;
- (RTIStyledIntermediateText)styledIntermediateText;
- (RTITextOperations)init;
- (RTITextOperations)initWithCoder:(id)a3;
- (RTITextOperations)initWithTargetSessionUUID:(id)a3;
- (SEL)editingActionSelector;
- (TIKeyboardIntermediateText)intermediateText;
- (TIKeyboardOutput)keyboardOutput;
- (_NSRange)selectionRangeToAssert;
- (_NSRange)textCheckingAnnotationRange;
- (_NSRange)textCheckingAnnotationRemovalRange;
- (_NSRange)textCheckingReplacementRange;
- (void)_createAttributedPlaceholdersIfNecessary;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAdaptiveImageGlyphsUsingBlock:(id)a3;
- (void)enumerateImagesAndUserInfosUsingBlock:(id)a3;
- (void)enumerateImagesUsingBlock:(id)a3;
- (void)enumerateTextAttachmentsUsingBlock:(id)a3;
- (void)insertAdaptiveImageGlyph:(id)a3;
- (void)insertAttributedText:(id)a3;
- (void)insertAttributedText:(id)a3 replacementRange:(_NSRange)a4;
- (void)insertImageWithFileHandle:(id)a3 typeIdentifier:(id)a4;
- (void)insertImageWithFileHandle:(id)a3 typeIdentifier:(id)a4 imageUserInfo:(id)a5;
- (void)insertText:(id)a3 replacementRange:(_NSRange)a4;
- (void)insertTextAttachment:(id)a3;
- (void)setAttachmentClasses:(id)a3;
- (void)setAttachmentDatas:(id)a3;
- (void)setAttributedPlaceholders:(id)a3;
- (void)setCustomInfo:(id)a3;
- (void)setCustomInfoType:(id)a3;
- (void)setEditingActionSelector:(SEL)a3;
- (void)setFileHandles:(id)a3;
- (void)setImageGlyphs:(id)a3;
- (void)setImageUserInfos:(id)a3;
- (void)setInputSourceState:(id)a3;
- (void)setIntermediateText:(id)a3;
- (void)setIsAutoFillTextOperation:(BOOL)a3;
- (void)setIsExplicitAutoFillInvocation:(BOOL)a3;
- (void)setMultilingualLanguages:(id)a3;
- (void)setSelectionRangeToAssert:(_NSRange)a3;
- (void)setStyledIntermediateText:(id)a3;
- (void)setTextCheckingAnnotatedString:(id)a3;
- (void)setTextCheckingAnnotationRange:(_NSRange)a3;
- (void)setTextCheckingAnnotationRemovalRange:(_NSRange)a3;
- (void)setTextCheckingAnnotationToRemove:(id)a3;
- (void)setTextCheckingReplacementRange:(_NSRange)a3;
- (void)setTextToAssert:(id)a3;
- (void)setTypeIdentifiers:(id)a3;
@end

@implementation RTITextOperations

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v30 = a3;
  if (([v30 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  keyboardOutput = self->_keyboardOutput;
  if (keyboardOutput) {
    [v30 encodeObject:keyboardOutput forKey:@"keyboardOutput"];
  }
  intermediateText = self->_intermediateText;
  if (intermediateText) {
    [v30 encodeObject:intermediateText forKey:@"intermediateText"];
  }
  styledIntermediateText = self->_styledIntermediateText;
  if (styledIntermediateText) {
    [v30 encodeObject:styledIntermediateText forKey:@"styledIntermediateText"];
  }
  textToAssert = self->_textToAssert;
  if (textToAssert) {
    [v30 encodeObject:textToAssert forKey:@"textToAssert"];
  }
  if (self->_selectionRangeToAssert.location != 0x7FFFFFFFFFFFFFFFLL || self->_selectionRangeToAssert.length)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
    [v30 encodeObject:v8 forKey:@"selectionRangeToAssert"];
  }
  editingActionSelector = self->_editingActionSelector;
  if (editingActionSelector)
  {
    v10 = NSStringFromSelector(editingActionSelector);
    [v30 encodeObject:v10 forKey:@"editingActionSelector"];
  }
  multilingualLanguages = self->_multilingualLanguages;
  if (multilingualLanguages) {
    [v30 encodeObject:multilingualLanguages forKey:@"multilingualLanguages"];
  }
  inputSourceState = self->_inputSourceState;
  if (inputSourceState) {
    [v30 encodeObject:inputSourceState forKey:@"inputSourceState"];
  }
  attributedPlaceholders = self->_attributedPlaceholders;
  if (attributedPlaceholders) {
    [v30 encodeObject:attributedPlaceholders forKey:@"attributedPlaceholders"];
  }
  if (self->_textCheckingAnnotationRange.location != 0x7FFFFFFFFFFFFFFFLL || self->_textCheckingAnnotationRange.length)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
    [v30 encodeObject:v14 forKey:@"textCheckingAnnotationRange"];
  }
  if (self->_textCheckingReplacementRange.location != 0x7FFFFFFFFFFFFFFFLL
    || self->_textCheckingReplacementRange.length)
  {
    v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
    [v30 encodeObject:v15 forKey:@"textCheckingReplacementRange"];
  }
  textCheckingAnnotatedString = self->_textCheckingAnnotatedString;
  if (textCheckingAnnotatedString) {
    [v30 encodeObject:textCheckingAnnotatedString forKey:@"textCheckingAnnotatedString"];
  }
  if (self->_textCheckingAnnotationRemovalRange.location != 0x7FFFFFFFFFFFFFFFLL
    || self->_textCheckingAnnotationRemovalRange.length)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
    [v30 encodeObject:v17 forKey:@"textCheckingAnnotationRemovalRange"];
  }
  textCheckingAnnotationToRemove = self->_textCheckingAnnotationToRemove;
  if (textCheckingAnnotationToRemove) {
    [v30 encodeObject:textCheckingAnnotationToRemove forKey:@"textCheckingAnnotationToRemove"];
  }
  customInfoType = self->_customInfoType;
  if (customInfoType) {
    [v30 encodeObject:customInfoType forKey:@"customInfoType"];
  }
  customInfo = self->_customInfo;
  if (customInfo) {
    [v30 encodeObject:customInfo forKey:@"customInfo"];
  }
  fileHandles = self->_fileHandles;
  if (fileHandles)
  {
    if (self->_typeIdentifiers)
    {
      uint64_t v22 = [(NSMutableArray *)fileHandles count];
      if (v22 == [(NSMutableArray *)self->_typeIdentifiers count])
      {
        uint64_t v23 = [(NSMutableArray *)self->_fileHandles count];
        if (v23 == [(NSMutableArray *)self->_imageUserInfos count])
        {
          [v30 encodeObject:self->_fileHandles forKey:@"fileHandles"];
          [v30 encodeObject:self->_typeIdentifiers forKey:@"typeIdentifiers"];
          [v30 encodeObject:self->_imageUserInfos forKey:@"imgUserInfo"];
        }
      }
    }
  }
  attachmentDatas = self->_attachmentDatas;
  if (attachmentDatas)
  {
    if (self->_attachmentClasses)
    {
      if (self->_typeIdentifiers)
      {
        uint64_t v25 = [(NSMutableArray *)attachmentDatas count];
        if (v25 == [(NSMutableArray *)self->_attachmentClasses count])
        {
          uint64_t v26 = [(NSMutableArray *)self->_attachmentClasses count];
          if (v26 == [(NSMutableArray *)self->_typeIdentifiers count])
          {
            [v30 encodeObject:self->_attachmentDatas forKey:@"attachmentDatas"];
            [v30 encodeObject:self->_attachmentClasses forKey:@"attachmentClasses"];
            [v30 encodeObject:self->_typeIdentifiers forKey:@"typeIdentifiers"];
          }
        }
      }
    }
  }
  imageGlyphs = self->_imageGlyphs;
  if (imageGlyphs) {
    [v30 encodeObject:imageGlyphs forKey:@"imageGlyphs"];
  }
  targetSessionUUID = self->_targetSessionUUID;
  v29 = v30;
  if (targetSessionUUID)
  {
    [v30 encodeObject:targetSessionUUID forKey:@"targetSessionUUID"];
    v29 = v30;
  }
  [v29 encodeBool:self->_isExplicitAutoFillInvocation forKey:@"isExplicitAutoFillInvocation"];
  [v30 encodeBool:self->_isAutoFillTextOperation forKey:@"isAutoFillTextOperation"];
}

- (RTITextOperations)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v5 = [(RTITextOperations *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardOutput"];
    keyboardOutput = v5->_keyboardOutput;
    v5->_keyboardOutput = (TIKeyboardOutput *)v6;

    if (!v5->_keyboardOutput)
    {
      v8 = (TIKeyboardOutput *)objc_alloc_init(MEMORY[0x1E4FAE370]);
      v9 = v5->_keyboardOutput;
      v5->_keyboardOutput = v8;
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intermediateText"];
    intermediateText = v5->_intermediateText;
    v5->_intermediateText = (TIKeyboardIntermediateText *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"styledIntermediateText"];
    styledIntermediateText = v5->_styledIntermediateText;
    v5->_styledIntermediateText = (RTIStyledIntermediateText *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textToAssert"];
    uint64_t v15 = [v14 copy];
    textToAssert = v5->_textToAssert;
    v5->_textToAssert = (NSString *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectionRangeToAssert"];
    v18 = v17;
    if (v17)
    {
      uint64_t v19 = [v17 rangeValue];
    }
    else
    {
      NSUInteger v20 = 0;
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_selectionRangeToAssert.location = v19;
    v5->_selectionRangeToAssert.length = v20;
    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"editingActionSelector"];
    uint64_t v22 = (NSString *)[v21 copy];

    if (v22)
    {
      SEL v23 = NSSelectorFromString(v22);
      if (v23) {
        v24 = v23;
      }
      else {
        v24 = 0;
      }
      v5->_editingActionSelector = v24;
    }
    uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"multilingualLanguages"];
    multilingualLanguages = v5->_multilingualLanguages;
    v5->_multilingualLanguages = (NSArray *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputSourceState"];
    inputSourceState = v5->_inputSourceState;
    v5->_inputSourceState = (RTIInputSourceState *)v30;

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v115 = 0;
    v116 = &v115;
    uint64_t v117 = 0x2050000000;
    v36 = (void *)getNSTextAlternativesClass_softClass;
    uint64_t v118 = getNSTextAlternativesClass_softClass;
    if (!getNSTextAlternativesClass_softClass)
    {
      uint64_t v110 = MEMORY[0x1E4F143A8];
      uint64_t v111 = 3221225472;
      v112 = __getNSTextAlternativesClass_block_invoke;
      v113 = &unk_1E583C6C0;
      v114 = &v115;
      __getNSTextAlternativesClass_block_invoke((uint64_t)&v110);
      v36 = (void *)v116[3];
    }
    v109 = v18;
    id v37 = v36;
    _Block_object_dispose(&v115, 8);
    v38 = objc_msgSend(v32, "setWithObjects:", v33, v34, v35, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"attributedPlaceholders"];
    attributedPlaceholders = v5->_attributedPlaceholders;
    v5->_attributedPlaceholders = (NSDictionary *)v39;

    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textCheckingAnnotationRange"];
    v107 = v41;
    if (v41)
    {
      uint64_t v42 = [v41 rangeValue];
    }
    else
    {
      NSUInteger v43 = 0;
      uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_textCheckingAnnotationRange.location = v42;
    v5->_textCheckingAnnotationRange.length = v43;
    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textCheckingReplacementRange"];
    v106 = v44;
    if (v44)
    {
      uint64_t v45 = [v44 rangeValue];
    }
    else
    {
      NSUInteger v46 = 0;
      uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_textCheckingReplacementRange.location = v45;
    v5->_textCheckingReplacementRange.length = v46;
    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textCheckingAnnotatedString"];
    textCheckingAnnotatedString = v5->_textCheckingAnnotatedString;
    v5->_textCheckingAnnotatedString = (NSAttributedString *)v47;

    v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textCheckingAnnotationRemovalRange"];
    v105 = v49;
    if (v49)
    {
      uint64_t v50 = [v49 rangeValue];
    }
    else
    {
      NSUInteger v51 = 0;
      uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_textCheckingAnnotationRemovalRange.location = v50;
    v5->_textCheckingAnnotationRemovalRange.length = v51;
    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textCheckingAnnotationToRemove"];
    textCheckingAnnotationToRemove = v5->_textCheckingAnnotationToRemove;
    v5->_textCheckingAnnotationToRemove = (NSString *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customInfoType"];
    customInfoType = v5->_customInfoType;
    v5->_customInfoType = (NSString *)v54;

    v56 = v5->_customInfoType;
    if (v56)
    {
      v57 = +[RTIUtilities customInfoClassesForType:v56 forClass:objc_opt_class()];
      if ([v57 count])
      {
        uint64_t v58 = [v4 decodeObjectOfClasses:v57 forKey:@"customInfo"];
        customInfo = v5->_customInfo;
        v5->_customInfo = (NSSecureCoding *)v58;
      }
    }
    v108 = v22;
    v60 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v61 = objc_opt_class();
    v62 = objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
    v63 = [v4 decodeObjectOfClasses:v62 forKey:@"fileHandles"];
    uint64_t v64 = [v63 mutableCopy];
    fileHandles = v5->_fileHandles;
    v5->_fileHandles = (NSMutableArray *)v64;

    v66 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v67 = objc_opt_class();
    v68 = objc_msgSend(v66, "setWithObjects:", v67, objc_opt_class(), 0);
    v69 = [v4 decodeObjectOfClasses:v68 forKey:@"typeIdentifiers"];
    uint64_t v70 = [v69 mutableCopy];
    typeIdentifiers = v5->_typeIdentifiers;
    v5->_typeIdentifiers = (NSMutableArray *)v70;

    v72 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v73 = objc_opt_class();
    uint64_t v74 = objc_opt_class();
    uint64_t v75 = objc_opt_class();
    uint64_t v76 = objc_opt_class();
    v77 = objc_msgSend(v72, "setWithObjects:", v73, v74, v75, v76, objc_opt_class(), 0);
    v78 = [v4 decodeObjectOfClasses:v77 forKey:@"imgUserInfo"];
    uint64_t v79 = [v78 mutableCopy];
    imageUserInfos = v5->_imageUserInfos;
    v5->_imageUserInfos = (NSMutableArray *)v79;

    v81 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v82 = objc_opt_class();
    v83 = objc_msgSend(v81, "setWithObjects:", v82, objc_opt_class(), 0);
    v84 = [v4 decodeObjectOfClasses:v83 forKey:@"attachmentDatas"];
    uint64_t v85 = [v84 mutableCopy];
    attachmentDatas = v5->_attachmentDatas;
    v5->_attachmentDatas = (NSMutableArray *)v85;

    v87 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v88 = objc_opt_class();
    v89 = objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
    v90 = [v4 decodeObjectOfClasses:v89 forKey:@"attachmentClasses"];
    uint64_t v91 = [v90 mutableCopy];
    attachmentClasses = v5->_attachmentClasses;
    v5->_attachmentClasses = (NSMutableArray *)v91;

    v93 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v94 = objc_opt_class();
    uint64_t v115 = 0;
    v116 = &v115;
    uint64_t v117 = 0x2050000000;
    v95 = (void *)getNSAdaptiveImageGlyphClass_softClass;
    uint64_t v118 = getNSAdaptiveImageGlyphClass_softClass;
    if (!getNSAdaptiveImageGlyphClass_softClass)
    {
      uint64_t v110 = MEMORY[0x1E4F143A8];
      uint64_t v111 = 3221225472;
      v112 = __getNSAdaptiveImageGlyphClass_block_invoke;
      v113 = &unk_1E583C6C0;
      v114 = &v115;
      __getNSAdaptiveImageGlyphClass_block_invoke((uint64_t)&v110);
      v95 = (void *)v116[3];
    }
    id v96 = v95;
    _Block_object_dispose(&v115, 8);
    uint64_t v97 = objc_opt_class();
    v98 = objc_msgSend(v93, "setWithObjects:", v94, v96, v97, objc_opt_class(), 0);
    v99 = [v4 decodeObjectOfClasses:v98 forKey:@"imageGlyphs"];
    uint64_t v100 = [v99 mutableCopy];
    imageGlyphs = v5->_imageGlyphs;
    v5->_imageGlyphs = (NSMutableArray *)v100;

    uint64_t v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetSessionUUID"];
    targetSessionUUID = v5->_targetSessionUUID;
    v5->_targetSessionUUID = (NSUUID *)v102;

    v5->_isExplicitAutoFillInvocation = [v4 decodeBoolForKey:@"isExplicitAutoFillInvocation"];
    v5->_isAutoFillTextOperation = [v4 decodeBoolForKey:@"isAutoFillTextOperation"];
  }
  return v5;
}

- (RTITextOperations)init
{
  return [(RTITextOperations *)self initWithTargetSessionUUID:0];
}

- (RTITextOperations)initWithTargetSessionUUID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTITextOperations;
  uint64_t v6 = [(RTITextOperations *)&v10 init];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FAE370]);
    v8 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v7;

    *(_OWORD *)(v6 + 168) = xmmword_19B01D570;
    *(_OWORD *)(v6 + 184) = xmmword_19B01D570;
    *(_OWORD *)(v6 + 200) = xmmword_19B01D570;
    *(_OWORD *)(v6 + 216) = xmmword_19B01D570;
    objc_storeStrong((id *)v6 + 19, a3);
  }

  return (RTITextOperations *)v6;
}

- (NSString)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(RTITextOperations *)self keyboardOutput];
  [v3 appendFormat:@"; keyboardOutput = %@", v4];

  id v5 = [(RTITextOperations *)self intermediateText];

  if (v5)
  {
    uint64_t v6 = [(RTITextOperations *)self intermediateText];
    [v3 appendFormat:@"; intermediateText = %@", v6];
  }
  id v7 = [(RTITextOperations *)self styledIntermediateText];

  if (v7)
  {
    v8 = [(RTITextOperations *)self styledIntermediateText];
    [v3 appendFormat:@"; styledIntermediateText = %@", v8];
  }
  v9 = [(RTITextOperations *)self textToAssert];

  if (v9)
  {
    objc_super v10 = [(RTITextOperations *)self textToAssert];
    [v3 appendFormat:@"; textToAssert = %@", v10];
  }
  if ([(RTITextOperations *)self selectionRangeToAssert] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)MEMORY[0x1E4F29238];
    uint64_t v12 = [(RTITextOperations *)self selectionRangeToAssert];
    v14 = objc_msgSend(v11, "valueWithRange:", v12, v13);
    [v3 appendFormat:@"; selectionRangeToAssert = %@", v14];
  }
  if ([(RTITextOperations *)self editingActionSelector])
  {
    uint64_t v15 = NSStringFromSelector([(RTITextOperations *)self editingActionSelector]);
    [v3 appendFormat:@"; editingActionSelector = %@", v15];
  }
  v16 = [(RTITextOperations *)self multilingualLanguages];

  if (v16)
  {
    v17 = [(RTITextOperations *)self multilingualLanguages];
    [v3 appendFormat:@"; multilingualLanguages = %@", v17];
  }
  v18 = [(RTITextOperations *)self inputSourceState];

  if (v18)
  {
    uint64_t v19 = [(RTITextOperations *)self inputSourceState];
    [v3 appendFormat:@"; inputSourceState = %@", v19];
  }
  if ([(RTITextOperations *)self textCheckingAnnotationRange] != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v20 = (void *)MEMORY[0x1E4F29238];
    uint64_t v21 = [(RTITextOperations *)self textCheckingAnnotationRange];
    SEL v23 = objc_msgSend(v20, "valueWithRange:", v21, v22);
    [v3 appendFormat:@"; textCheckingAnnotationRange = %@", v23];
  }
  if ([(RTITextOperations *)self textCheckingReplacementRange] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = (void *)MEMORY[0x1E4F29238];
    uint64_t v25 = [(RTITextOperations *)self textCheckingReplacementRange];
    v27 = objc_msgSend(v24, "valueWithRange:", v25, v26);
    [v3 appendFormat:@"; textCheckingReplacementRange = %@", v27];
  }
  uint64_t v28 = [(RTITextOperations *)self textCheckingAnnotatedString];

  if (v28)
  {
    v29 = [(RTITextOperations *)self textCheckingAnnotatedString];
    objc_msgSend(v3, "appendFormat:", @"; textCheckingAnnotatedString = %p", v29);
  }
  if ([(RTITextOperations *)self textCheckingAnnotationRemovalRange] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v30 = (void *)MEMORY[0x1E4F29238];
    uint64_t v31 = [(RTITextOperations *)self textCheckingAnnotationRemovalRange];
    uint64_t v33 = objc_msgSend(v30, "valueWithRange:", v31, v32);
    [v3 appendFormat:@"; textCheckingAnnotationRemovalRange = %@", v33];
  }
  uint64_t v34 = [(RTITextOperations *)self textCheckingAnnotationToRemove];

  if (v34)
  {
    uint64_t v35 = [(RTITextOperations *)self textCheckingAnnotationToRemove];
    [v3 appendFormat:@"; textCheckingAnnotationToRemove = %@", v35];
  }
  v36 = [(RTITextOperations *)self customInfoType];

  if (v36)
  {
    id v37 = [(RTITextOperations *)self customInfoType];
    [v3 appendFormat:@"; customInfoType = %@", v37];
  }
  v38 = [(RTITextOperations *)self customInfo];

  if (v38)
  {
    uint64_t v39 = [(RTITextOperations *)self customInfo];
    [v3 appendFormat:@"; customInfo = %@", v39];
  }
  v40 = [(RTITextOperations *)self fileHandles];
  if ([v40 count])
  {
    v41 = [(RTITextOperations *)self typeIdentifiers];
    uint64_t v42 = [v41 count];

    if (!v42) {
      goto LABEL_33;
    }
    v40 = [(RTITextOperations *)self typeIdentifiers];
    [v3 appendFormat:@"; fileHandles with types = %@", v40];
  }

LABEL_33:
  NSUInteger v43 = [(RTITextOperations *)self attachmentDatas];
  if ([v43 count])
  {
    v44 = [(RTITextOperations *)self attachmentClasses];
    uint64_t v45 = [v44 count];

    if (!v45) {
      goto LABEL_37;
    }
    NSUInteger v43 = [(RTITextOperations *)self attachmentClasses];
    [v3 appendFormat:@"; textAttachments = %@", v43];
  }

LABEL_37:
  NSUInteger v46 = [(RTITextOperations *)self imageGlyphs];
  uint64_t v47 = [v46 count];

  if (v47)
  {
    v48 = [(RTITextOperations *)self imageGlyphs];
    objc_msgSend(v3, "appendFormat:", @"; %lu adaptiveImageGlyphs", objc_msgSend(v48, "count"));
  }
  v49 = [(RTITextOperations *)self targetSessionUUID];
  [v3 appendFormat:@"; targetSessionUUID = %@", v49];

  if ([(RTITextOperations *)self isExplicitAutoFillInvocation]) {
    uint64_t v50 = @"YES";
  }
  else {
    uint64_t v50 = @"NO";
  }
  [v3 appendFormat:@"; isExplicitAutoFillInvocation = %@", v50];
  if ([(RTITextOperations *)self isAutoFillTextOperation]) {
    NSUInteger v51 = @"YES";
  }
  else {
    NSUInteger v51 = @"NO";
  }
  [v3 appendFormat:@"; isAutoFillTextOperation = %@", v51];
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTITextOperations *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(RTITextOperations *)self keyboardOutput];
      uint64_t v7 = [(RTITextOperations *)v5 keyboardOutput];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        v9 = [(RTITextOperations *)self keyboardOutput];
        objc_super v10 = [(RTITextOperations *)v5 keyboardOutput];
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_21;
        }
      }
      uint64_t v13 = [(RTITextOperations *)self intermediateText];
      uint64_t v14 = [(RTITextOperations *)v5 intermediateText];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        uint64_t v15 = (void *)v14;
        v16 = [(RTITextOperations *)self intermediateText];
        v17 = [(RTITextOperations *)v5 intermediateText];
        int v18 = [v16 isEqual:v17];

        if (!v18) {
          goto LABEL_21;
        }
      }
      uint64_t v19 = [(RTITextOperations *)self styledIntermediateText];
      uint64_t v20 = [(RTITextOperations *)v5 styledIntermediateText];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        uint64_t v21 = (void *)v20;
        uint64_t v22 = [(RTITextOperations *)self styledIntermediateText];
        SEL v23 = [(RTITextOperations *)v5 styledIntermediateText];
        int v24 = [v22 isEqual:v23];

        if (!v24) {
          goto LABEL_21;
        }
      }
      uint64_t v25 = NSString;
      uint64_t v26 = [(RTITextOperations *)self textToAssert];
      v27 = [(RTITextOperations *)v5 textToAssert];
      int v12 = [v25 _string:v26 matchesString:v27];

      if (!v12) {
        goto LABEL_22;
      }
      uint64_t v28 = [(RTITextOperations *)self selectionRangeToAssert];
      uint64_t v30 = v29;
      LOBYTE(v12) = 0;
      if (v28 != [(RTITextOperations *)v5 selectionRangeToAssert] || v30 != v31) {
        goto LABEL_22;
      }
      uint64_t v32 = [(RTITextOperations *)self editingActionSelector];
      if (v32 != [(RTITextOperations *)v5 editingActionSelector]) {
        goto LABEL_21;
      }
      uint64_t v34 = [(RTITextOperations *)self multilingualLanguages];
      uint64_t v35 = [(RTITextOperations *)v5 multilingualLanguages];
      if (v34 == (void *)v35)
      {
      }
      else
      {
        v36 = (void *)v35;
        id v37 = [(RTITextOperations *)self multilingualLanguages];
        v38 = [(RTITextOperations *)v5 multilingualLanguages];
        int v39 = [v37 isEqualToArray:v38];

        if (!v39) {
          goto LABEL_21;
        }
      }
      v40 = [(RTITextOperations *)self inputSourceState];
      uint64_t v41 = [(RTITextOperations *)v5 inputSourceState];
      if (v40 == (void *)v41)
      {
      }
      else
      {
        uint64_t v42 = (void *)v41;
        NSUInteger v43 = [(RTITextOperations *)self inputSourceState];
        v44 = [(RTITextOperations *)v5 inputSourceState];
        int v45 = [v43 isEqual:v44];

        if (!v45) {
          goto LABEL_21;
        }
      }
      uint64_t v46 = [(RTITextOperations *)self textCheckingAnnotationRange];
      uint64_t v48 = v47;
      LOBYTE(v12) = 0;
      if (v46 != [(RTITextOperations *)v5 textCheckingAnnotationRange]) {
        goto LABEL_22;
      }
      if (v48 != v49) {
        goto LABEL_22;
      }
      uint64_t v50 = [(RTITextOperations *)self textCheckingReplacementRange];
      uint64_t v52 = v51;
      LOBYTE(v12) = 0;
      if (v50 != [(RTITextOperations *)v5 textCheckingReplacementRange] || v52 != v53) {
        goto LABEL_22;
      }
      uint64_t v54 = [(RTITextOperations *)self textCheckingAnnotatedString];
      uint64_t v55 = [(RTITextOperations *)v5 textCheckingAnnotatedString];
      if (v54 == (void *)v55)
      {
      }
      else
      {
        v56 = (void *)v55;
        v57 = [(RTITextOperations *)self textCheckingAnnotatedString];
        uint64_t v58 = [(RTITextOperations *)v5 textCheckingAnnotatedString];
        int v59 = [v57 isEqual:v58];

        if (!v59) {
          goto LABEL_21;
        }
      }
      uint64_t v60 = [(RTITextOperations *)self textCheckingAnnotationRemovalRange];
      uint64_t v62 = v61;
      LOBYTE(v12) = 0;
      if (v60 != [(RTITextOperations *)v5 textCheckingAnnotationRemovalRange]
        || v62 != v63)
      {
        goto LABEL_22;
      }
      uint64_t v64 = [(RTITextOperations *)self textCheckingAnnotationToRemove];
      uint64_t v65 = [(RTITextOperations *)v5 textCheckingAnnotationToRemove];
      if (v64 == (void *)v65)
      {
      }
      else
      {
        v66 = (void *)v65;
        uint64_t v67 = [(RTITextOperations *)self textCheckingAnnotationToRemove];
        v68 = [(RTITextOperations *)v5 textCheckingAnnotationToRemove];
        int v69 = [v67 isEqual:v68];

        if (!v69) {
          goto LABEL_21;
        }
      }
      uint64_t v70 = [(RTITextOperations *)self customInfoType];
      uint64_t v71 = [(RTITextOperations *)v5 customInfoType];
      if (v70 == (void *)v71)
      {
      }
      else
      {
        v72 = (void *)v71;
        uint64_t v73 = [(RTITextOperations *)self customInfoType];
        uint64_t v74 = [(RTITextOperations *)v5 customInfoType];
        int v75 = [v73 isEqual:v74];

        if (!v75) {
          goto LABEL_21;
        }
      }
      uint64_t v76 = [(RTITextOperations *)self customInfo];
      uint64_t v77 = [(RTITextOperations *)v5 customInfo];
      if (v76 == (void *)v77)
      {
      }
      else
      {
        v78 = (void *)v77;
        uint64_t v79 = [(RTITextOperations *)self customInfo];
        v80 = [(RTITextOperations *)v5 customInfo];
        int v81 = [v79 isEqual:v80];

        if (!v81) {
          goto LABEL_21;
        }
      }
      uint64_t v82 = [(RTITextOperations *)self fileHandles];
      uint64_t v83 = [(RTITextOperations *)v5 fileHandles];
      if (v82 == (void *)v83)
      {
      }
      else
      {
        v84 = (void *)v83;
        uint64_t v85 = [(RTITextOperations *)self fileHandles];
        uint64_t v86 = [v85 count];
        v87 = [(RTITextOperations *)v5 fileHandles];
        uint64_t v88 = [v87 count];

        if (v86 != v88) {
          goto LABEL_21;
        }
      }
      v89 = [(RTITextOperations *)self typeIdentifiers];
      uint64_t v90 = [(RTITextOperations *)v5 typeIdentifiers];
      if (v89 == (void *)v90)
      {
      }
      else
      {
        uint64_t v91 = (void *)v90;
        v92 = [(RTITextOperations *)self typeIdentifiers];
        v93 = [(RTITextOperations *)v5 typeIdentifiers];
        int v94 = [v92 isEqualToArray:v93];

        if (!v94) {
          goto LABEL_21;
        }
      }
      v95 = [(RTITextOperations *)self imageUserInfos];
      uint64_t v96 = [(RTITextOperations *)v5 imageUserInfos];
      if (v95 == (void *)v96)
      {
      }
      else
      {
        uint64_t v97 = (void *)v96;
        v98 = [(RTITextOperations *)self imageUserInfos];
        v99 = [(RTITextOperations *)v5 imageUserInfos];
        int v100 = [v98 isEqualToArray:v99];

        if (!v100) {
          goto LABEL_21;
        }
      }
      v101 = [(RTITextOperations *)self attachmentDatas];
      uint64_t v102 = [(RTITextOperations *)v5 attachmentDatas];
      if (v101 == (void *)v102)
      {
      }
      else
      {
        v103 = (void *)v102;
        v104 = [(RTITextOperations *)self attachmentDatas];
        v105 = [(RTITextOperations *)v5 attachmentDatas];
        int v106 = [v104 isEqualToArray:v105];

        if (!v106) {
          goto LABEL_21;
        }
      }
      v107 = [(RTITextOperations *)self attachmentClasses];
      uint64_t v108 = [(RTITextOperations *)v5 attachmentClasses];
      if (v107 == (void *)v108)
      {
      }
      else
      {
        v109 = (void *)v108;
        uint64_t v110 = [(RTITextOperations *)self attachmentClasses];
        uint64_t v111 = [(RTITextOperations *)v5 attachmentClasses];
        int v112 = [v110 isEqualToArray:v111];

        if (!v112) {
          goto LABEL_21;
        }
      }
      v113 = [(RTITextOperations *)self imageGlyphs];
      uint64_t v114 = [(RTITextOperations *)v5 imageGlyphs];
      if (v113 == (void *)v114)
      {
      }
      else
      {
        uint64_t v115 = (void *)v114;
        v116 = [(RTITextOperations *)self imageGlyphs];
        uint64_t v117 = [(RTITextOperations *)v5 imageGlyphs];
        int v118 = [v116 isEqualToArray:v117];

        if (!v118) {
          goto LABEL_21;
        }
      }
      v119 = [(RTITextOperations *)self targetSessionUUID];
      uint64_t v120 = [(RTITextOperations *)v5 targetSessionUUID];
      if (v119 == (void *)v120)
      {
      }
      else
      {
        v121 = (void *)v120;
        v122 = [(RTITextOperations *)self targetSessionUUID];
        v123 = [(RTITextOperations *)v5 targetSessionUUID];
        int v124 = [v122 isEqual:v123];

        if (!v124) {
          goto LABEL_21;
        }
      }
      BOOL v125 = [(RTITextOperations *)self isExplicitAutoFillInvocation];
      if (v125 == [(RTITextOperations *)v5 isExplicitAutoFillInvocation])
      {
        BOOL v126 = [(RTITextOperations *)self isAutoFillTextOperation];
        int v12 = v126 ^ [(RTITextOperations *)v5 isAutoFillTextOperation] ^ 1;
        goto LABEL_22;
      }
LABEL_21:
      LOBYTE(v12) = 0;
LABEL_22:

      goto LABEL_23;
    }
    LOBYTE(v12) = 0;
  }
LABEL_23:

  return v12;
}

+ (id)customInfoDictionary
{
  if (customInfoDictionary_onceToken_0 != -1) {
    dispatch_once(&customInfoDictionary_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)customInfoDictionary_customInfoDictionary_0;
  return v2;
}

uint64_t __41__RTITextOperations_customInfoDictionary__block_invoke()
{
  customInfoDictionary_customInfoDictionary_0 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

+ (void)registerCustomInfoClasses:(id)a3 forType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[RTIUtilities registerCustomInfoClasses:v6 forType:v5 forClass:objc_opt_class()];
}

+ (void)unregisterCustomInfoType:(id)a3
{
  id v3 = a3;
  +[RTIUtilities unregisterCustomInfoType:v3 forClass:objc_opt_class()];
}

- (void)insertText:(id)a3 replacementRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  -[RTITextOperations setSelectionRangeToAssert:](self, "setSelectionRangeToAssert:", location, length);
  id v8 = [(RTITextOperations *)self keyboardOutput];
  [v8 insertText:v7];
}

- (void)_createAttributedPlaceholdersIfNecessary
{
  if (!self->_attributedPlaceholders)
  {
    self->_attributedPlaceholders = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    MEMORY[0x1F41817F8]();
  }
}

- (NSMutableDictionary)mutableAttributedPlaceholders
{
  return (NSMutableDictionary *)self->_attributedPlaceholders;
}

- (void)insertAttributedText:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"NSTextAlternatives";
  v11[1] = @"NSTextAnimation";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v11 count:2];
  id v7 = +[RTIUtilities _codableAttributedString:v5 validAttributes:v6];

  [(RTITextOperations *)self _createAttributedPlaceholdersIfNecessary];
  id v8 = [v7 string];
  v9 = [(RTITextOperations *)self mutableAttributedPlaceholders];
  [v9 setObject:v7 forKey:v8];

  objc_super v10 = [(RTITextOperations *)self keyboardOutput];
  [v10 insertText:v8];
}

- (void)insertAttributedText:(id)a3 replacementRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  -[RTITextOperations setSelectionRangeToAssert:](self, "setSelectionRangeToAssert:", location, length);
  [(RTITextOperations *)self insertAttributedText:v7];
}

- (NSAttributedString)attributedInsertionText
{
  if (self->_attributedPlaceholders)
  {
    id v3 = [(RTITextOperations *)self keyboardOutput];
    id v4 = [v3 insertionText];

    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4];
    attributedPlaceholders = self->_attributedPlaceholders;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__RTITextOperations_attributedInsertionText__block_invoke;
    v12[3] = &unk_1E583CC18;
    id v13 = v4;
    id v7 = v5;
    id v14 = v7;
    id v8 = v4;
    [(NSDictionary *)attributedPlaceholders enumerateKeysAndObjectsUsingBlock:v12];
    v9 = v14;
    id v10 = v7;
  }
  else
  {
    id v10 = 0;
  }
  return (NSAttributedString *)v10;
}

void __44__RTITextOperations_attributedInsertionText__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 rangeOfString:a2];
  uint64_t v9 = v8;
  id v10 = +[RTIUtilities _decodableAttributedString:v6];

  objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withAttributedString:", v7, v9, v10);
}

- (void)insertImageWithFileHandle:(id)a3 typeIdentifier:(id)a4
{
}

- (void)insertImageWithFileHandle:(id)a3 typeIdentifier:(id)a4 imageUserInfo:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!self->_fileHandles)
  {
    id v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    [(RTITextOperations *)self setFileHandles:v10];
  }
  if (!self->_typeIdentifiers)
  {
    int v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    [(RTITextOperations *)self setTypeIdentifiers:v11];
  }
  if (!self->_imageUserInfos)
  {
    int v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    [(RTITextOperations *)self setImageUserInfos:v12];
  }
  id v13 = [(RTITextOperations *)self fileHandles];
  if ([v13 count]) {
    goto LABEL_10;
  }
  id v14 = [(RTITextOperations *)self typeIdentifiers];
  if ([v14 count])
  {

LABEL_10:
LABEL_11:
    uint64_t v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Not supporting >1 FileHandle insertion at this time." userInfo:0];
    [v15 raise];

    goto LABEL_12;
  }
  v16 = [(RTITextOperations *)self imageUserInfos];
  uint64_t v17 = [v16 count];

  if (v17) {
    goto LABEL_11;
  }
LABEL_12:
  [(NSMutableArray *)self->_fileHandles addObject:v18];
  [(NSMutableArray *)self->_typeIdentifiers addObject:v8];
  if (!v9) {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }
  [(NSMutableArray *)self->_imageUserInfos addObject:v9];
}

- (void)insertTextAttachment:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    if (!self->_attachmentDatas)
    {
      id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      [(RTITextOperations *)self setAttachmentDatas:v4];
    }
    if (!self->_attachmentClasses)
    {
      id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      [(RTITextOperations *)self setAttachmentClasses:v5];
    }
    if (!self->_typeIdentifiers)
    {
      id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      [(RTITextOperations *)self setTypeIdentifiers:v6];
    }
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = [v11 contents];
    id v10 = [v11 fileType];
    if (v9)
    {
      [(NSMutableArray *)self->_attachmentDatas addObject:v9];
      [(NSMutableArray *)self->_attachmentClasses addObject:v8];
      [(NSMutableArray *)self->_typeIdentifiers addObject:v10];
    }
  }
}

- (void)insertAdaptiveImageGlyph:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    imageGlyphs = self->_imageGlyphs;
    id v7 = v4;
    if (!imageGlyphs)
    {
      id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      [(RTITextOperations *)self setImageGlyphs:v6];

      imageGlyphs = self->_imageGlyphs;
    }
    [(NSMutableArray *)imageGlyphs addObject:v7];
  }
  MEMORY[0x1F41817F8]();
}

- (void)enumerateImagesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    fileHandles = self->_fileHandles;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__RTITextOperations_enumerateImagesUsingBlock___block_invoke;
    v7[3] = &unk_1E583CC40;
    v7[4] = self;
    id v8 = v4;
    [(NSMutableArray *)fileHandles enumerateObjectsUsingBlock:v7];
  }
}

void __47__RTITextOperations_enumerateImagesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateImagesAndUserInfosUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    fileHandles = self->_fileHandles;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__RTITextOperations_enumerateImagesAndUserInfosUsingBlock___block_invoke;
    v7[3] = &unk_1E583CC40;
    v7[4] = self;
    id v8 = v4;
    [(NSMutableArray *)fileHandles enumerateObjectsUsingBlock:v7];
  }
}

void __59__RTITextOperations_enumerateImagesAndUserInfosUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = a2;
  id v8 = [v5 objectAtIndexedSubscript:a3];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 72) objectAtIndexedSubscript:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateTextAttachmentsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    attachmentDatas = self->_attachmentDatas;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__RTITextOperations_enumerateTextAttachmentsUsingBlock___block_invoke;
    v7[3] = &unk_1E583CC68;
    v7[4] = self;
    id v8 = v4;
    [(NSMutableArray *)attachmentDatas enumerateObjectsUsingBlock:v7];
  }
}

void __56__RTITextOperations_enumerateTextAttachmentsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 88) objectAtIndexedSubscript:a3];
  if ([(NSString *)v6 isEqualToString:@"NSEmojiImageTextAttachment"])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v7 = (void *)getNSEmojiImageTextAttachmentClass_softClass;
    uint64_t v15 = getNSEmojiImageTextAttachmentClass_softClass;
    if (!getNSEmojiImageTextAttachmentClass_softClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getNSEmojiImageTextAttachmentClass_block_invoke;
      void v11[3] = &unk_1E583C6C0;
      v11[4] = &v12;
      __getNSEmojiImageTextAttachmentClass_block_invoke((uint64_t)v11);
      id v7 = (void *)v13[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v12, 8);
    id v9 = (void *)[[v8 alloc] initWithData:v5];
  }
  else
  {
    id v10 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndexedSubscript:a3];
    id v9 = (void *)[objc_alloc(NSClassFromString(v6)) initWithData:v5 ofType:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateAdaptiveImageGlyphsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    imageGlyphs = self->_imageGlyphs;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__RTITextOperations_enumerateAdaptiveImageGlyphsUsingBlock___block_invoke;
    v7[3] = &unk_1E583CC90;
    id v8 = v4;
    [(NSMutableArray *)imageGlyphs enumerateObjectsUsingBlock:v7];
  }
}

uint64_t __60__RTITextOperations_enumerateAdaptiveImageGlyphsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setTextCheckingAnnotatedString:(id)a3
{
  self->_textCheckingAnnotatedString = +[RTIUtilities _attributedStringWithoutDefaultAttributes:a3];
  MEMORY[0x1F41817F8]();
}

- (TIKeyboardOutput)keyboardOutput
{
  return self->_keyboardOutput;
}

- (TIKeyboardIntermediateText)intermediateText
{
  return self->_intermediateText;
}

- (void)setIntermediateText:(id)a3
{
}

- (RTIStyledIntermediateText)styledIntermediateText
{
  return self->_styledIntermediateText;
}

- (void)setStyledIntermediateText:(id)a3
{
}

- (NSDictionary)attributedPlaceholders
{
  return self->_attributedPlaceholders;
}

- (void)setAttributedPlaceholders:(id)a3
{
}

- (NSAttributedString)textCheckingAnnotatedString
{
  return self->_textCheckingAnnotatedString;
}

- (NSMutableArray)fileHandles
{
  return self->_fileHandles;
}

- (void)setFileHandles:(id)a3
{
}

- (NSMutableArray)typeIdentifiers
{
  return self->_typeIdentifiers;
}

- (void)setTypeIdentifiers:(id)a3
{
}

- (NSMutableArray)imageUserInfos
{
  return self->_imageUserInfos;
}

- (void)setImageUserInfos:(id)a3
{
}

- (NSMutableArray)attachmentDatas
{
  return self->_attachmentDatas;
}

- (void)setAttachmentDatas:(id)a3
{
}

- (NSMutableArray)attachmentClasses
{
  return self->_attachmentClasses;
}

- (void)setAttachmentClasses:(id)a3
{
}

- (NSMutableArray)imageGlyphs
{
  return self->_imageGlyphs;
}

- (void)setImageGlyphs:(id)a3
{
}

- (BOOL)isExplicitAutoFillInvocation
{
  return self->_isExplicitAutoFillInvocation;
}

- (void)setIsExplicitAutoFillInvocation:(BOOL)a3
{
  self->_isExplicitAutoFillInvocation = a3;
}

- (BOOL)isAutoFillTextOperation
{
  return self->_isAutoFillTextOperation;
}

- (void)setIsAutoFillTextOperation:(BOOL)a3
{
  self->_isAutoFillTextOperation = a3;
}

- (NSString)textToAssert
{
  return self->_textToAssert;
}

- (void)setTextToAssert:(id)a3
{
}

- (_NSRange)selectionRangeToAssert
{
  NSUInteger length = self->_selectionRangeToAssert.length;
  NSUInteger location = self->_selectionRangeToAssert.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSelectionRangeToAssert:(_NSRange)a3
{
  self->_selectionRangeToAssert = a3;
}

- (SEL)editingActionSelector
{
  if (self->_editingActionSelector) {
    return self->_editingActionSelector;
  }
  else {
    return 0;
  }
}

- (void)setEditingActionSelector:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_editingActionSelector = v3;
}

- (NSArray)multilingualLanguages
{
  return self->_multilingualLanguages;
}

- (void)setMultilingualLanguages:(id)a3
{
}

- (RTIInputSourceState)inputSourceState
{
  return self->_inputSourceState;
}

- (void)setInputSourceState:(id)a3
{
}

- (NSString)customInfoType
{
  return self->_customInfoType;
}

- (void)setCustomInfoType:(id)a3
{
}

- (NSSecureCoding)customInfo
{
  return self->_customInfo;
}

- (void)setCustomInfo:(id)a3
{
}

- (NSUUID)targetSessionUUID
{
  return self->_targetSessionUUID;
}

- (_NSRange)textCheckingAnnotationRange
{
  NSUInteger length = self->_textCheckingAnnotationRange.length;
  NSUInteger location = self->_textCheckingAnnotationRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTextCheckingAnnotationRange:(_NSRange)a3
{
  self->_textCheckingAnnotationRange = a3;
}

- (_NSRange)textCheckingReplacementRange
{
  NSUInteger length = self->_textCheckingReplacementRange.length;
  NSUInteger location = self->_textCheckingReplacementRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTextCheckingReplacementRange:(_NSRange)a3
{
  self->_textCheckingReplacementRange = a3;
}

- (_NSRange)textCheckingAnnotationRemovalRange
{
  NSUInteger length = self->_textCheckingAnnotationRemovalRange.length;
  NSUInteger location = self->_textCheckingAnnotationRemovalRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTextCheckingAnnotationRemovalRange:(_NSRange)a3
{
  self->_textCheckingAnnotationRemovalRange = a3;
}

- (NSString)textCheckingAnnotationToRemove
{
  return self->_textCheckingAnnotationToRemove;
}

- (void)setTextCheckingAnnotationToRemove:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textCheckingAnnotationToRemove, 0);
  objc_storeStrong((id *)&self->_targetSessionUUID, 0);
  objc_storeStrong((id *)&self->_customInfo, 0);
  objc_storeStrong((id *)&self->_customInfoType, 0);
  objc_storeStrong((id *)&self->_inputSourceState, 0);
  objc_storeStrong((id *)&self->_multilingualLanguages, 0);
  objc_storeStrong((id *)&self->_textToAssert, 0);
  objc_storeStrong((id *)&self->_imageGlyphs, 0);
  objc_storeStrong((id *)&self->_attachmentClasses, 0);
  objc_storeStrong((id *)&self->_attachmentDatas, 0);
  objc_storeStrong((id *)&self->_imageUserInfos, 0);
  objc_storeStrong((id *)&self->_typeIdentifiers, 0);
  objc_storeStrong((id *)&self->_fileHandles, 0);
  objc_storeStrong((id *)&self->_textCheckingAnnotatedString, 0);
  objc_storeStrong((id *)&self->_attributedPlaceholders, 0);
  objc_storeStrong((id *)&self->_styledIntermediateText, 0);
  objc_storeStrong((id *)&self->_intermediateText, 0);
  objc_storeStrong((id *)&self->_keyboardOutput, 0);
}

@end