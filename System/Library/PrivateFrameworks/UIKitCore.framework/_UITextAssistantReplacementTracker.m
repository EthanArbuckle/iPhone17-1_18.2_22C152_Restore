@interface _UITextAssistantReplacementTracker
- (BOOL)hasProcessedOriginalRange;
- (BOOL)isFinished;
- (BOOL)isProofreading;
- (BOOL)isRewriting;
- (BOOL)selectRewriteMatchingUndoRedoReplacementText:(id)a3;
- (NSAttributedString)activeText;
- (NSAttributedString)assembledRewrittenText;
- (NSAttributedString)originalText;
- (NSAttributedString)processedOriginalText;
- (NSAttributedString)rewrittenText;
- (NSAttributedString)unprocessedOriginalText;
- (NSUUID)contextUUID;
- (NSWritingToolsProofreadingController)proofreadingController;
- (_NSRange)activeCharacterRange;
- (_NSRange)activeFullCharacterRange;
- (_NSRange)activeUnprocessedCharacterRange;
- (_NSRange)finalCurrentChunkCharacterRange;
- (_NSRange)initialCurrentChunkCharacterRange;
- (_NSRange)originalCharacterRange;
- (_NSRange)processedOriginalCharacterRange;
- (_NSRange)rewrittenCharacterRange;
- (_NSRange)sourceRangeForChunkFromDelivery:(id)a3;
- (_NSRange)targetRangeForChunkFromDelivery:(id)a3;
- (id)assembledRewrittenTextToDelivery:(id)a3 matchingInitialDeliveries:(BOOL)a4;
- (id)description;
- (id)initFromSessionContext:(id)a3 offsetForSessionRange:(unint64_t)a4 withProofreadingController:(id)a5;
- (id)newEditTracker;
- (id)nextDeliveryForDelivery:(id)a3;
- (id)originalChunkTextForDelivery:(id)a3;
- (id)recordRewrittenText:(id)a3 forRange:(_NSRange)a4 withContext:(id)a5 finished:(BOOL)a6;
- (id)rewrittenChunkTextForDelivery:(id)a3;
- (int64_t)compositionSessionState;
- (uint64_t)currentChunkCharacterRangeUpdatingLength:(uint64_t)a1;
- (uint64_t)rangeForChunkFromDelivery:(int)a3 useOriginalLength:;
- (unint64_t)numberOfPreviousRewrittenTexts;
- (unint64_t)offsetForSessionRange;
- (void)setCompositionSessionState:(int64_t)a3;
- (void)setOffsetForSessionRange:(unint64_t)a3;
- (void)updateReplacementChunkForDeliveryID:(id)a3 newText:(id)a4;
@end

@implementation _UITextAssistantReplacementTracker

- (id)newEditTracker
{
  id v3 = objc_alloc((Class)off_1E52D2F80);
  NSUInteger length = self->_sessionContextRange.length;
  return (id)objc_msgSend(v3, "initWithContextRange:", 0, length);
}

- (id)initFromSessionContext:(id)a3 offsetForSessionRange:(unint64_t)a4 withProofreadingController:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)_UITextAssistantReplacementTracker;
  v11 = [(_UITextAssistantReplacementTracker *)&v28 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_originalContext, a3);
    uint64_t v13 = [v9 uuid];
    contextUUID = v12->_contextUUID;
    v12->_contextUUID = (NSUUID *)v13;

    v12->_offsetForSessionRange = a4;
    v12->_sessionContextRange.location = [v9 range];
    v12->_sessionContextRange.NSUInteger length = v15;
    v16 = [v9 attributedText];
    uint64_t v17 = objc_msgSend(v16, "attributedSubstringFromRange:", v12->_sessionContextRange.location, v12->_sessionContextRange.length);
    originalText = v12->_originalText;
    v12->_originalText = (NSAttributedString *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
    rewrittenText = v12->_rewrittenText;
    v12->_rewrittenText = (NSAttributedString *)v19;

    v12->_selectedRewriteIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v12->_proofreadingController, a5);
    v12->_proofreading = v10 != 0;
    if (v10) {
      v12->_compositionSessionState = -1;
    }
    uint64_t v21 = [(_UITextAssistantReplacementTracker *)v12 newEditTracker];
    editTracker = v12->_editTracker;
    v12->_editTracker = (NSWritingToolsEditTracker *)v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    replacementDeliveryUUIDs = v12->_replacementDeliveryUUIDs;
    v12->_replacementDeliveryUUIDs = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    replacementChunksByUUID = v12->_replacementChunksByUUID;
    v12->_replacementChunksByUUID = v25;
  }
  return v12;
}

- (BOOL)isRewriting
{
  return !self->_proofreading;
}

- (void)setOffsetForSessionRange:(unint64_t)a3
{
  if (self->_offsetForSessionRange != a3)
  {
    self->_offsetForSessionRange = a3;
    processedOriginalText = self->_processedOriginalText;
    self->_processedOriginalText = 0;

    unprocessedOriginalText = self->_unprocessedOriginalText;
    self->_unprocessedOriginalText = 0;
  }
}

- (void)setCompositionSessionState:(int64_t)a3
{
  BOOL v6 = [(_UITextAssistantReplacementTracker *)self isProofreading];
  if (a3 != -1 && v6)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"_UITextAssistantReplacementTracker.m" lineNumber:123 description:@"Can't set replacement tracker's compositionSessionState to anything other than Invalid when proofreading"];
  }
  if (self->_compositionSessionState != a3)
  {
    self->_compositionSessionState = a3;
    if (!a3)
    {
      v7 = [(_UITextAssistantReplacementTracker *)self newEditTracker];
      editTracker = self->_editTracker;
      self->_editTracker = v7;

      self->_finished = 0;
      [(NSMutableArray *)self->_replacementDeliveryUUIDs removeAllObjects];
      [(NSMutableDictionary *)self->_replacementChunksByUUID removeAllObjects];
      [(NSMutableDictionary *)self->_initialReplacementChunksByUUID removeAllObjects];
      if ([(NSAttributedString *)self->_rewrittenText length])
      {
        previousRewrites = self->_previousRewrites;
        if (!previousRewrites)
        {
          id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v11 = self->_previousRewrites;
          self->_previousRewrites = v10;

          v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          previousRewrittenTexts = self->_previousRewrittenTexts;
          self->_previousRewrittenTexts = v12;

          previousRewrites = self->_previousRewrites;
        }
        v14 = [(NSAttributedString *)self->_rewrittenText string];
        [(NSMutableArray *)previousRewrites addObject:v14];

        [(NSMutableArray *)self->_previousRewrittenTexts addObject:self->_rewrittenText];
      }
      NSUInteger v15 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
      rewrittenText = self->_rewrittenText;
      self->_rewrittenText = v15;
    }
    processedOriginalText = self->_processedOriginalText;
    self->_processedOriginalText = 0;

    unprocessedOriginalText = self->_unprocessedOriginalText;
    self->_unprocessedOriginalText = 0;
  }
}

- (id)recordRewrittenText:(id)a3 forRange:(_NSRange)a4 withContext:(id)a5 finished:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  v14 = [v13 uuid];
  contextUUID = self->_contextUUID;
  v16 = v14;
  uint64_t v17 = contextUUID;
  if (v16 == v17)
  {
  }
  else
  {
    v18 = v17;
    id v19 = v12;
    if (v16 && v17)
    {
      char v20 = [(NSUUID *)v16 isEqual:v17];

      if (v20) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [(NSUUID *)v16 handleFailureInMethod:a2 object:self file:@"_UITextAssistantReplacementTracker.m" lineNumber:174 description:@"Mismatched composition session context"];
    id v12 = v19;
  }
  id v19 = v12;

LABEL_8:
  uint64_t v21 = self->_originalContext;
  v22 = (WTContext *)v13;
  v23 = v22;
  NSUInteger v105 = length;
  SEL v98 = a2;
  if (v21 == v22)
  {

    v24 = v19;
    goto LABEL_16;
  }
  v24 = v19;
  if (v22 && v21)
  {
    char v25 = [(WTContext *)v21 isEqual:v22];

    if (v25) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        v77 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &_MergedGlobals_1071) + 8);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v77, OS_LOG_TYPE_ERROR, "Surprise request to record rewritten text with context argument's range different from the range of the context that the tracker was initialized with", buf, 2u);
        }
      }
    }
  }
LABEL_16:
  p_rewrittenText = &self->_rewrittenText;
  rewrittenText = self->_rewrittenText;
  self->_finished = v6;
  objc_super v28 = [(NSAttributedString *)rewrittenText string];
  if (self->_initialReplacementChunksByUUID)
  {
    v29 = [(_UITextAssistantReplacementTracker *)self assembledRewrittenTextToDelivery:0 matchingInitialDeliveries:1];
    uint64_t v30 = [v29 string];

    objc_super v28 = (void *)v30;
  }
  if (v6)
  {
    v31 = [v24 string];
    int v32 = [v31 isEqualToString:v28];

    if (v32)
    {
      v33 = 0;
      self->_selectedRewriteIndex = [(NSMutableArray *)self->_previousRewrittenTexts count];
      goto LABEL_60;
    }
  }
  v100 = v28;
  BOOL v101 = v6;
  processedOriginalText = self->_processedOriginalText;
  self->_processedOriginalText = 0;

  unprocessedOriginalText = self->_unprocessedOriginalText;
  self->_unprocessedOriginalText = 0;

  v33 = [MEMORY[0x1E4F29128] UUID];
  BOOL v36 = [(_UITextAssistantReplacementTracker *)self isProofreading];
  fallbackDeliveryID = self->_fallbackDeliveryID;
  self->_fallbackDeliveryID = 0;

  BOOL v102 = v36;
  if (!v36)
  {
    unint64_t v38 = [v24 length];
    if (v38 <= [(NSAttributedString *)*p_rewrittenText length])
    {
      v96 = v24;
      if (os_variant_has_internal_diagnostics())
      {
        if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
        {
          if (byte_1E8FD4F9C)
          {
            v86 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB260B38) + 8);
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
            {
              replacementDeliveryUUIDs = self->_replacementDeliveryUUIDs;
              v88 = v86;
              uint64_t v89 = [(NSMutableArray *)replacementDeliveryUUIDs count];
              *(_DWORD *)buf = 134217984;
              uint64_t v113 = v89;
              _os_log_impl(&dword_1853B0000, v88, OS_LOG_TYPE_ERROR, "New delivery is no longer than the rewrite so far. Replacing all accumulated chunks with the current delivery. Number of chunks cleared = %lu", buf, 0xCu);
            }
          }
        }
      }
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      v39 = self->_replacementDeliveryUUIDs;
      uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v107 objects:v111 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v108;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v108 != v42) {
              objc_enumerationMutation(v39);
            }
            [(NSWritingToolsEditTracker *)self->_editTracker removeEditForSuggestionWithUUID:*(void *)(*((void *)&v107 + 1) + 8 * i)];
          }
          uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v107 objects:v111 count:16];
        }
        while (v41);
      }

      [(NSMutableArray *)self->_replacementDeliveryUUIDs removeAllObjects];
      [(NSMutableDictionary *)self->_replacementChunksByUUID removeAllObjects];
      [(NSMutableDictionary *)self->_initialReplacementChunksByUUID removeAllObjects];
      objc_storeStrong((id *)&self->_fallbackDeliveryID, v33);
      v24 = v96;
    }
  }
  v44 = [(NSMutableArray *)self->_replacementDeliveryUUIDs lastObject];
  if (v44)
  {
    v45 = [(NSMutableDictionary *)self->_replacementChunksByUUID objectForKeyedSubscript:v44];
    v46 = v45;
    if (v102)
    {
      if (v45)
      {
        uint64_t v47 = [v45 originalRange];
        uint64_t v49 = v47 + v48;
        uint64_t v50 = location - (v47 + v48);
        if (v50 < 0)
        {
          v51 = [MEMORY[0x1E4F28B00] currentHandler];
          [v51 handleFailureInMethod:v98 object:self file:@"_UITextAssistantReplacementTracker.m" lineNumber:220 description:@"Unexpected overlapping proofreading delivery range"];
        }
      }
      else
      {
        uint64_t v50 = 0;
        uint64_t v49 = 0;
      }
      goto LABEL_50;
    }
  }
  else
  {
    v46 = 0;
    uint64_t v50 = 0;
    uint64_t v49 = 0;
    if (v102)
    {
LABEL_50:
      if (*p_rewrittenText) {
        uint64_t v65 = [(NSAttributedString *)*p_rewrittenText mutableCopy];
      }
      else {
        uint64_t v65 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1ED0E84C0];
      }
      v66 = (void *)v65;
      v99 = v46;
      if (v50)
      {
        v67 = -[NSAttributedString attributedSubstringFromRange:](self->_originalText, "attributedSubstringFromRange:", v49, v50);
        [v66 appendAttributedString:v67];
      }
      [v66 appendAttributedString:v24];
      uint64_t v68 = [v66 copy];
      v69 = *p_rewrittenText;
      *p_rewrittenText = (NSAttributedString *)v68;

      id v52 = v24;
      NSUInteger v53 = location;
      goto LABEL_56;
    }
  }
  objc_storeStrong((id *)&self->_rewrittenText, a3);
  id v52 = v24;
  if (v44)
  {
    NSUInteger v53 = location;
    if (v46)
    {
      uint64_t v54 = location + v105 - [v46 originalEndIndex];
      uint64_t v97 = v54;
      if (v54 < 0)
      {
        v90 = [MEMORY[0x1E4F28B00] currentHandler];
        [v90 handleFailureInMethod:v98, self, @"_UITextAssistantReplacementTracker.m", 238, @"Negative length found for incoming replacement.\npreviousChunk: %@\ninRange={%lu, %lu}", v46, location, v105 object file lineNumber description];
      }
      else if (!v54)
      {
        if (os_variant_has_internal_diagnostics())
        {
          if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
          {
            if (byte_1E8FD4F9C)
            {
              v92 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB260B40) + 8);
              if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1853B0000, v92, OS_LOG_TYPE_ERROR, "Proper animation for extending rewrites TBD: rdar://127571889", buf, 2u);
              }
            }
          }
        }
      }
      uint64_t v55 = [v46 originalEndIndex];
      editTracker = self->_editTracker;
      uint64_t v57 = [v46 originalRange];
      uint64_t v59 = -[NSWritingToolsEditTracker rangeOfSuggestionWithRange:UUID:applyDelta:](editTracker, "rangeOfSuggestionWithRange:UUID:applyDelta:", v57, v58, v44, 1);
      uint64_t v61 = v59 + v60;
      uint64_t v62 = [v52 length] - (v59 + v60);
      if (v62 < 0)
      {
        v106 = [MEMORY[0x1E4F28B00] currentHandler];
        [v106 handleFailureInMethod:v98 object:self file:@"_UITextAssistantReplacementTracker.m" lineNumber:248 description:@"Error in rewrite length calculation"];
      }
      uint64_t v63 = objc_msgSend(v52, "attributedSubstringFromRange:", v61, v62);

      id v52 = (id)v63;
      NSUInteger v105 = v97;
      NSUInteger v53 = v55;
    }
  }
  else
  {
    NSUInteger v53 = location;
  }
  v99 = v46;
  id v64 = [v52 string];
  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C)
  {
    NSUInteger v104 = v53;
    v78 = objc_msgSend(v64, "substringWithRange:", 0, objc_msgSend(v64, "length") != 0);
    int v79 = [v78 isEqualToString:@"\n"];

    int v80 = v79;
    if (v79)
    {
      if (os_variant_has_internal_diagnostics())
      {
        if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
        {
          if (byte_1E8FD4F9C)
          {
            v93 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB260B90) + 8);
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1853B0000, v93, OS_LOG_TYPE_ERROR, "\tfirst character is linefeed", buf, 2u);
            }
          }
        }
      }
    }
    uint64_t v81 = [v64 length];
    if (v81 <= 1) {
      uint64_t v82 = 1;
    }
    else {
      uint64_t v82 = v81;
    }
    v83 = objc_msgSend(v64, "substringWithRange:", v82 - 1, objc_msgSend(v64, "length") != 0);
    int v84 = [v83 isEqualToString:@"\n"];

    if (v84)
    {
      NSUInteger v53 = v104;
      if (os_variant_has_internal_diagnostics())
      {
        if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
        {
          if (byte_1E8FD4F9C)
          {
            v85 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB260B98) + 8);
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1853B0000, v85, OS_LOG_TYPE_ERROR, "\tlast character is linefeed", buf, 2u);
            }
          }
        }
      }
      goto LABEL_94;
    }
    NSUInteger v53 = v104;
    if (v80)
    {
LABEL_94:
      if (os_variant_has_internal_diagnostics())
      {
        if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
        {
          if (byte_1E8FD4F9C)
          {
            v91 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB260BA0) + 8);
            if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v113 = (uint64_t)v64;
              _os_log_impl(&dword_1853B0000, v91, OS_LOG_TYPE_ERROR, "\n------------\n%@\n------------", buf, 0xCu);
            }
          }
        }
      }
    }
  }

LABEL_56:
  [(NSMutableArray *)self->_replacementDeliveryUUIDs addObject:v33];
  v70 = -[_UIWritingToolsReplacementChunk initWithReplacementChunk:originalRange:uuid:]([_UIWritingToolsReplacementChunk alloc], "initWithReplacementChunk:originalRange:uuid:", v52, v53, v105, v33);
  [(NSMutableDictionary *)self->_replacementChunksByUUID setObject:v70 forKeyedSubscript:v33];
  -[NSWritingToolsEditTracker addEditForSuggestionWithRange:lengthDelta:UUID:](self->_editTracker, "addEditForSuggestionWithRange:lengthDelta:UUID:", v53, v105, [(_UIWritingToolsReplacementChunk *)v70 lengthDelta], v33);
  if (os_variant_has_internal_diagnostics())
  {
    v72 = [(_UITextAssistantReplacementTracker *)self assembledRewrittenText];
    v73 = [(_UITextAssistantReplacementTracker *)self rewrittenText];
    char v74 = [v72 isEqualToAttributedString:v73];

    if ((v74 & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v94 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
        {
          v95 = @"Composition";
          if (v102) {
            v95 = @"Proofreading";
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v113 = (uint64_t)v95;
          _os_log_fault_impl(&dword_1853B0000, v94, OS_LOG_TYPE_FAULT, "%@ replacement improperly recorded", buf, 0xCu);
        }
      }
      else
      {
        v75 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260B48) + 8);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          v76 = @"Composition";
          if (v102) {
            v76 = @"Proofreading";
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v113 = (uint64_t)v76;
          _os_log_impl(&dword_1853B0000, v75, OS_LOG_TYPE_ERROR, "%@ replacement improperly recorded", buf, 0xCu);
        }
      }
    }
  }
  if (v101) {
    self->_selectedRewriteIndex = [(NSMutableArray *)self->_previousRewrittenTexts count];
  }

  objc_super v28 = v100;
LABEL_60:

  return v33;
}

- (void)updateReplacementChunkForDeliveryID:(id)a3 newText:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  replacementDeliveryUUIDs = self->_replacementDeliveryUUIDs;
  id v8 = a4;
  if (([(NSMutableArray *)replacementDeliveryUUIDs containsObject:v6] & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v22 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        v23 = self->_replacementDeliveryUUIDs;
        int v24 = 138412546;
        id v25 = v6;
        __int16 v26 = 2112;
        v27 = v23;
        _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "Can't update replacement chunk for abandoned delivery, %@. It's not contained in %@", (uint8_t *)&v24, 0x16u);
      }
    }
    else
    {
      char v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &updateReplacementChunkForDeliveryID_newText____s_category)+ 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = self->_replacementDeliveryUUIDs;
        int v24 = 138412546;
        id v25 = v6;
        __int16 v26 = 2112;
        v27 = v21;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Can't update replacement chunk for abandoned delivery, %@. It's not contained in %@", (uint8_t *)&v24, 0x16u);
      }
    }
  }
  id v9 = [(NSMutableDictionary *)self->_replacementChunksByUUID objectForKeyedSubscript:v6];
  [(NSWritingToolsEditTracker *)self->_editTracker removeEditForSuggestionWithUUID:v6];
  id v10 = [(NSMutableDictionary *)self->_initialReplacementChunksByUUID objectForKeyedSubscript:v6];

  if (!v10)
  {
    initialReplacementChunksByUUID = self->_initialReplacementChunksByUUID;
    if (!initialReplacementChunksByUUID)
    {
      id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = self->_initialReplacementChunksByUUID;
      self->_initialReplacementChunksByUUID = v12;

      initialReplacementChunksByUUID = self->_initialReplacementChunksByUUID;
    }
    [(NSMutableDictionary *)initialReplacementChunksByUUID setObject:v9 forKeyedSubscript:v6];
  }
  uint64_t v14 = [v9 originalRange];
  uint64_t v16 = v15;
  uint64_t v17 = -[_UIWritingToolsReplacementChunk initWithReplacementChunk:originalRange:uuid:]([_UIWritingToolsReplacementChunk alloc], "initWithReplacementChunk:originalRange:uuid:", v8, v14, v15, v6);

  -[NSWritingToolsEditTracker addEditForSuggestionWithRange:lengthDelta:UUID:](self->_editTracker, "addEditForSuggestionWithRange:lengthDelta:UUID:", v14, v16, [(_UIWritingToolsReplacementChunk *)v17 lengthDelta], v6);
  [(NSMutableDictionary *)self->_replacementChunksByUUID setObject:v17 forKeyedSubscript:v6];
  v18 = [(_UITextAssistantReplacementTracker *)self assembledRewrittenText];
  rewrittenText = self->_rewrittenText;
  self->_rewrittenText = v18;
}

- (BOOL)selectRewriteMatchingUndoRedoReplacementText:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(_UITextAssistantReplacementTracker *)self isRewriting])
  {
    id v6 = [v5 string];
    previousRewrites = self->_previousRewrites;
    if (!previousRewrites
      || (int64_t v8 = [(NSMutableArray *)previousRewrites indexOfObject:v6], v8 == 0x7FFFFFFFFFFFFFFFLL))
    {
      id v9 = [(NSAttributedString *)self->_rewrittenText string];
      int v10 = [v6 isEqualToString:v9];

      if (!v10 || (int64_t v8 = [(NSMutableArray *)self->_previousRewrites count], v8 == 0x7FFFFFFFFFFFFFFFLL))
      {
        if (os_variant_has_internal_diagnostics())
        {
          if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
          {
            if (byte_1E8FD4F9C)
            {
              id v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB260B50) + 8);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                uint64_t v14 = v13;
                uint64_t v15 = [v5 string];
                int v22 = 138412290;
                int64_t v23 = (int64_t)v15;
                _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "No rewrite version matches undoRedoReplacmentText\n%@", (uint8_t *)&v22, 0xCu);
              }
            }
          }
        }

        goto LABEL_10;
      }
    }

    self->_selectedRewriteIndex = v8;
    if (os_variant_has_internal_diagnostics())
    {
      BOOL v11 = 1;
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
      {
        if (byte_1E8FD4F9C)
        {
          uint64_t v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB260B60) + 8);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            int v22 = 134217984;
            int64_t v23 = v8;
            _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Selecting rewrite version for index %li", (uint8_t *)&v22, 0xCu);
          }
        }
      }
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    if (![(_UITextAssistantReplacementTracker *)self isProofreading]
      || !os_variant_has_internal_diagnostics())
    {
LABEL_10:
      BOOL v11 = 0;
      goto LABEL_13;
    }
    BOOL v11 = 0;
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4)
    {
      uint64_t v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &qword_1EB260B58) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = v16;
        v18 = NSStringFromSelector(a2);
        id v19 = (objc_class *)objc_opt_class();
        char v20 = NSStringFromClass(v19);
        int v22 = 138412546;
        int64_t v23 = (int64_t)v18;
        __int16 v24 = 2112;
        id v25 = v20;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "%@ unexpectedly received by %@ during proofreading", (uint8_t *)&v22, 0x16u);
      }
      goto LABEL_10;
    }
  }
LABEL_13:

  return v11;
}

- (NSAttributedString)assembledRewrittenText
{
  return (NSAttributedString *)[(_UITextAssistantReplacementTracker *)self assembledRewrittenTextToDelivery:0 matchingInitialDeliveries:0];
}

- (id)assembledRewrittenTextToDelivery:(id)a3 matchingInitialDeliveries:(BOOL)a4
{
  BOOL v25 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_replacementDeliveryUUIDs;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v28;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(obj);
      }
      BOOL v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
      if (v25 && (initialReplacementChunksByUUID = self->_initialReplacementChunksByUUID) != 0)
      {
        id v13 = [(NSMutableDictionary *)initialReplacementChunksByUUID objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * v10)];
        uint64_t v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [(NSMutableDictionary *)self->_replacementChunksByUUID objectForKeyedSubscript:v11];
        }
        uint64_t v16 = v15;
      }
      else
      {
        uint64_t v16 = [(NSMutableDictionary *)self->_replacementChunksByUUID objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * v10)];
      }
      uint64_t v17 = [v16 originalRange];
      uint64_t v19 = v18;
      if (v17 - v8 >= 1)
      {
        char v20 = [(NSAttributedString *)self->_originalText attributedSubstringFromRange:v8];
        [v5 appendAttributedString:v20];
      }
      uint64_t v21 = [v16 replacement];
      [v5 appendAttributedString:v21];

      LOBYTE(v21) = [v11 isEqual:v26];
      if (v21) {
        break;
      }
      uint64_t v8 = v17 + v19;
      if (v7 == ++v10)
      {
        uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  int v22 = (void *)[v5 copy];
  return v22;
}

- (NSAttributedString)processedOriginalText
{
  processedOriginalText = self->_processedOriginalText;
  if (!processedOriginalText)
  {
    uint64_t v4 = [(_UITextAssistantReplacementTracker *)self processedOriginalCharacterRange];
    -[NSAttributedString attributedSubstringFromRange:](self->_originalText, "attributedSubstringFromRange:", v4 - (self->_offsetForSessionRange + self->_sessionContextRange.location), v5);
    uint64_t v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_processedOriginalText;
    self->_processedOriginalText = v6;

    processedOriginalText = self->_processedOriginalText;
  }
  return processedOriginalText;
}

- (NSAttributedString)unprocessedOriginalText
{
  unprocessedOriginalText = self->_unprocessedOriginalText;
  if (!unprocessedOriginalText)
  {
    int64_t length = self->_sessionContextRange.length;
    uint64_t v6 = [(NSMutableArray *)self->_replacementDeliveryUUIDs lastObject];
    if (v6)
    {
      uint64_t v7 = [(NSMutableDictionary *)self->_replacementChunksByUUID objectForKeyedSubscript:v6];
      uint64_t v8 = [v7 originalRange];
      uint64_t v10 = v8 + v9;
      length -= v8 + v9;
      if (length < 0)
      {
        uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"_UITextAssistantReplacementTracker.m" lineNumber:369 description:@"Invalid unprocessed range length"];
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    -[NSAttributedString attributedSubstringFromRange:](self->_originalText, "attributedSubstringFromRange:", v10, length);
    BOOL v11 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    id v12 = self->_unprocessedOriginalText;
    self->_unprocessedOriginalText = v11;

    unprocessedOriginalText = self->_unprocessedOriginalText;
  }
  return unprocessedOriginalText;
}

- (id)rewrittenChunkTextForDelivery:(id)a3
{
  uint64_t v5 = (NSUUID *)a3;
  uint64_t v6 = v5;
  if (([(NSMutableArray *)self->_replacementDeliveryUUIDs containsObject:v5] & 1) == 0)
  {
    uint64_t v6 = self->_fallbackDeliveryID;
  }
  if (!v6)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UITextAssistantReplacementTracker.m" lineNumber:384 description:@"Unknown delivery ID for retrieving chunk rewrite"];
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_replacementChunksByUUID objectForKeyedSubscript:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 replacement];
  }
  else
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (id)originalChunkTextForDelivery:(id)a3
{
  uint64_t v5 = (NSUUID *)a3;
  uint64_t v6 = v5;
  if (([(NSMutableArray *)self->_replacementDeliveryUUIDs containsObject:v5] & 1) == 0)
  {
    uint64_t v6 = self->_fallbackDeliveryID;
  }
  if (!v6)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UITextAssistantReplacementTracker.m" lineNumber:395 description:@"Unknown delivery ID for retrieving chunk original"];
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_replacementChunksByUUID objectForKeyedSubscript:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    originalText = self->_originalText;
    uint64_t v10 = [v7 originalRange];
    uint64_t v12 = -[NSAttributedString attributedSubstringFromRange:](originalText, "attributedSubstringFromRange:", v10, v11);
  }
  else
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
  }
  id v13 = (void *)v12;

  return v13;
}

- (NSAttributedString)activeText
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_compositionSessionState != 2)
  {
    uint64_t v6 = [(_UITextAssistantReplacementTracker *)self processedOriginalText];
    goto LABEL_13;
  }
  if (![(_UITextAssistantReplacementTracker *)self isRewriting])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = v8;
    unint64_t v10 = self->_compositionSessionState + 1;
    if (v10 > 3) {
      uint64_t v11 = @"Unknown";
    }
    else {
      uint64_t v11 = off_1E52F07D8[v10];
    }
    [v8 handleFailureInMethod:a2, self, @"_UITextAssistantReplacementTracker.m", 403, @"_compositionSessionState should not be set to %@ unless replacement tracker is rewriting", v11 object file lineNumber description];
  }
  if (![(_UITextAssistantReplacementTracker *)self isFinished]) {
    goto LABEL_11;
  }
  unint64_t v4 = [(NSMutableArray *)self->_previousRewrites count];
  unint64_t selectedRewriteIndex = self->_selectedRewriteIndex;
  if ((selectedRewriteIndex & 0x8000000000000000) == 0 && selectedRewriteIndex < v4)
  {
    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
      {
        if (byte_1E8FD4F9C)
        {
          id v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB260B68) + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int64_t v16 = self->_selectedRewriteIndex;
            unint64_t v17 = self->_compositionSessionState + 1;
            if (v17 > 3) {
              uint64_t v18 = @"Unknown";
            }
            else {
              uint64_t v18 = off_1E52F07D8[v17];
            }
            *(_DWORD *)buf = 134218242;
            int64_t v28 = v16;
            __int16 v29 = 2112;
            long long v30 = v18;
            __int16 v24 = v15;
            _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Choosing previous rewrite version at index %li for resolving activeText for %@", buf, 0x16u);
          }
        }
      }
    }
    uint64_t v6 = [(NSMutableArray *)self->_previousRewrittenTexts objectAtIndexedSubscript:self->_selectedRewriteIndex];
    goto LABEL_13;
  }
  if (selectedRewriteIndex != v4)
  {
    unint64_t v19 = v4;
    if (os_variant_has_internal_diagnostics())
    {
      BOOL v25 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        int64_t v26 = self->_selectedRewriteIndex;
        *(_DWORD *)buf = 134218240;
        int64_t v28 = v26;
        __int16 v29 = 2048;
        long long v30 = (__CFString *)v19;
        _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "Setting _selectedRewriteIndex with unexpected value, %li, to match known number of rewrites, %li ", buf, 0x16u);
      }
    }
    else
    {
      char v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260B70) + 8);
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      unint64_t v4 = v19;
      if (!v21) {
        goto LABEL_10;
      }
      int64_t v22 = self->_selectedRewriteIndex;
      *(_DWORD *)buf = 134218240;
      int64_t v28 = v22;
      __int16 v29 = 2048;
      long long v30 = (__CFString *)v19;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Setting _selectedRewriteIndex with unexpected value, %li, to match known number of rewrites, %li ", buf, 0x16u);
    }
    unint64_t v4 = v19;
  }
LABEL_10:
  self->_unint64_t selectedRewriteIndex = v4;
LABEL_11:
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB260B78) + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          unint64_t v13 = self->_compositionSessionState + 1;
          if (v13 > 3) {
            uint64_t v14 = @"Unknown";
          }
          else {
            uint64_t v14 = off_1E52F07D8[v13];
          }
          *(_DWORD *)buf = 138412290;
          int64_t v28 = (int64_t)v14;
          int64_t v23 = v12;
          _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Choosing last rewrite version for resolving activeText for %@", buf, 0xCu);
        }
      }
    }
  }
  uint64_t v6 = self->_rewrittenText;
LABEL_13:
  return v6;
}

- (unint64_t)numberOfPreviousRewrittenTexts
{
  return [(NSMutableArray *)self->_previousRewrites count];
}

- (BOOL)hasProcessedOriginalRange
{
  [(_UITextAssistantReplacementTracker *)self processedOriginalCharacterRange];
  uint64_t v4 = v3;
  [(_UITextAssistantReplacementTracker *)self originalCharacterRange];
  return v4 == v5;
}

- (_NSRange)originalCharacterRange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = self->_offsetForSessionRange + self->_sessionContextRange.location;
  NSUInteger length = self->_sessionContextRange.length;
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &originalCharacterRange___s_category)+ 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = v7;
          uint64_t v9 = NSStringFromSelector(a2);
          int v10 = 138412802;
          uint64_t v11 = v9;
          __int16 v12 = 2048;
          unint64_t v13 = v3;
          __int16 v14 = 2048;
          NSUInteger v15 = length;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v10, 0x20u);
        }
      }
    }
  }
  NSUInteger v5 = v3;
  NSUInteger v6 = length;
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (_NSRange)processedOriginalCharacterRange
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t offsetForSessionRange = self->_offsetForSessionRange;
  NSUInteger location = self->_sessionContextRange.location;
  NSUInteger v6 = [(NSMutableArray *)self->_replacementDeliveryUUIDs lastObject];
  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_replacementChunksByUUID objectForKeyedSubscript:v6];
    uint64_t v8 = [v7 originalRange];
    NSUInteger v10 = v8 + v9;
    if (v8 + v9 < 0)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"_UITextAssistantReplacementTracker.m" lineNumber:449 description:@"error in calculating length of processedOriginalCharacterRange"];
    }
  }
  else
  {
    NSUInteger v10 = 0;
  }
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        unint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &processedOriginalCharacterRange___s_category)+ 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          __int16 v14 = v13;
          NSUInteger v15 = NSStringFromSelector(a2);
          int v17 = 138412802;
          uint64_t v18 = v15;
          __int16 v19 = 2048;
          NSUInteger v20 = location + offsetForSessionRange;
          __int16 v21 = 2048;
          NSUInteger v22 = v10;
          _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v17, 0x20u);
        }
      }
    }
  }

  NSUInteger v11 = location + offsetForSessionRange;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (uint64_t)currentChunkCharacterRangeUpdatingLength:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    if (*(void *)(a1 + 112) == 1)
    {
      NSUInteger v11 = [MEMORY[0x1E4F28B00] currentHandler];
      NSUInteger v12 = v11;
      unint64_t v13 = *(void *)(v2 + 112) + 1;
      if (v13 > 3) {
        __int16 v14 = @"Unknown";
      }
      else {
        __int16 v14 = off_1E52F07D8[v13];
      }
      [v11 handleFailureInMethod:sel_currentChunkCharacterRangeUpdatingLength_, v2, @"_UITextAssistantReplacementTracker.m", 458, @"initial and final current-chunk ranges not valid for session state: %@", v14 object file lineNumber description];
    }
    uint64_t v4 = [*(id *)(v2 + 48) lastObject];
    if (v4)
    {
      NSUInteger v5 = [*(id *)(v2 + 56) objectForKeyedSubscript:v4];
      NSUInteger v6 = *(void **)(v2 + 40);
      uint64_t v7 = [v5 originalRange];
      uint64_t v9 = objc_msgSend(v6, "rangeOfSuggestionWithRange:UUID:applyDelta:", v7, v8, v4, a2);
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v2 = v9 + *(void *)(v2 + 16) + *(void *)(v2 + 8);
  }
  return v2;
}

- (_NSRange)initialCurrentChunkCharacterRange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = -[_UITextAssistantReplacementTracker currentChunkCharacterRangeUpdatingLength:]((uint64_t)self, 0);
  NSUInteger v5 = v4;
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &initialCurrentChunkCharacterRange___s_category)+ 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = v8;
          NSUInteger v10 = NSStringFromSelector(a2);
          int v11 = 138412802;
          NSUInteger v12 = v10;
          __int16 v13 = 2048;
          uint64_t v14 = v3;
          __int16 v15 = 2048;
          NSUInteger v16 = v5;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v11, 0x20u);
        }
      }
    }
  }
  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)finalCurrentChunkCharacterRange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = -[_UITextAssistantReplacementTracker currentChunkCharacterRangeUpdatingLength:]((uint64_t)self, 1);
  NSUInteger v5 = v4;
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &finalCurrentChunkCharacterRange___s_category)+ 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = v8;
          NSUInteger v10 = NSStringFromSelector(a2);
          int v11 = 138412802;
          NSUInteger v12 = v10;
          __int16 v13 = 2048;
          uint64_t v14 = v3;
          __int16 v15 = 2048;
          NSUInteger v16 = v5;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v11, 0x20u);
        }
      }
    }
  }
  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)rewrittenCharacterRange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  NSUInteger location = self->_sessionContextRange.location;
  NSUInteger v5 = [(NSAttributedString *)self->_rewrittenText length];
  NSUInteger v6 = self->_offsetForSessionRange + location;
  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
  {
    uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &rewrittenCharacterRange___s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSUInteger v10 = v9;
      int v11 = NSStringFromSelector(a2);
      int v12 = 138412802;
      __int16 v13 = v11;
      __int16 v14 = 2048;
      NSUInteger v15 = v6;
      __int16 v16 = 2048;
      NSUInteger v17 = v5;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v12, 0x20u);
    }
  }
  NSUInteger v7 = v6;
  NSUInteger v8 = v5;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (uint64_t)rangeForChunkFromDelivery:(int)a3 useOriginalLength:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  NSUInteger v6 = v5;
  if (a1)
  {
    id v7 = v5;
    if (([*(id *)(a1 + 48) containsObject:v7] & 1) == 0)
    {
      id v8 = *(id *)(a1 + 72);

      id v7 = v8;
    }
    if (v7)
    {
      uint64_t v9 = [*(id *)(a1 + 56) objectForKeyedSubscript:v7];
      NSUInteger v10 = v9;
      if (*(void *)(a1 + 112) == 1)
      {
        if (os_variant_has_internal_diagnostics())
        {
          if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
          {
            if (byte_1E8FD4F9C)
            {
              __int16 v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &rangeForChunkFromDelivery_useOriginalLength____s_category)+ 8);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                int v17 = 138412290;
                id v18 = v7;
                _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "ALERT: unexpected request for chunk-delivery range while showing original. %@", (uint8_t *)&v17, 0xCu);
              }
            }
          }
        }
        uint64_t v11 = [v10 originalRange];
      }
      else
      {
        int v12 = *(void **)(a1 + 40);
        uint64_t v13 = [v9 originalRange];
        uint64_t v11 = objc_msgSend(v12, "rangeOfSuggestionWithRange:UUID:applyDelta:", v13, v14, v7, a3 ^ 1u);
      }
      a1 = v11 + *(void *)(a1 + 8) + *(void *)(a1 + 16);
    }
    else
    {
      a1 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return a1;
}

- (_NSRange)sourceRangeForChunkFromDelivery:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = -[_UITextAssistantReplacementTracker rangeForChunkFromDelivery:useOriginalLength:]((uint64_t)self, v5, 1);
  NSUInteger v8 = v7;
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &sourceRangeForChunkFromDelivery____s_category)+ 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = v11;
          uint64_t v13 = NSStringFromSelector(a2);
          int v14 = 138413058;
          NSUInteger v15 = v13;
          __int16 v16 = 2112;
          id v17 = v5;
          __int16 v18 = 2048;
          uint64_t v19 = v6;
          __int16 v20 = 2048;
          NSUInteger v21 = v8;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "\t%@ %@={%lu, %lu}", (uint8_t *)&v14, 0x2Au);
        }
      }
    }
  }

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)targetRangeForChunkFromDelivery:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = -[_UITextAssistantReplacementTracker rangeForChunkFromDelivery:useOriginalLength:]((uint64_t)self, v5, 0);
  NSUInteger v8 = v7;
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &targetRangeForChunkFromDelivery____s_category)+ 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = v11;
          uint64_t v13 = NSStringFromSelector(a2);
          int v14 = 138413058;
          NSUInteger v15 = v13;
          __int16 v16 = 2112;
          id v17 = v5;
          __int16 v18 = 2048;
          uint64_t v19 = v6;
          __int16 v20 = 2048;
          NSUInteger v21 = v8;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "\t%@ %@={%lu, %lu}", (uint8_t *)&v14, 0x2Au);
        }
      }
    }
  }

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (id)nextDeliveryForDelivery:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(NSMutableArray *)self->_replacementDeliveryUUIDs indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v5 = v4, v4 >= [(NSMutableArray *)self->_replacementDeliveryUUIDs count] - 1))
  {
    uint64_t v6 = 0;
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
      {
        if (byte_1E8FD4F9C)
        {
          NSUInteger v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &nextDeliveryForDelivery____s_category)+ 8);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            replacementDeliveryUUIDs = self->_replacementDeliveryUUIDs;
            NSUInteger v10 = v8;
            v11[0] = 67109376;
            v11[1] = v5 + 1;
            __int16 v12 = 1024;
            int v13 = [(NSMutableArray *)replacementDeliveryUUIDs count];
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "next delivery index = %u of %u", (uint8_t *)v11, 0xEu);
          }
        }
      }
    }
    uint64_t v6 = [(NSMutableArray *)self->_replacementDeliveryUUIDs objectAtIndexedSubscript:v5 + 1];
  }
  return v6;
}

- (_NSRange)activeFullCharacterRange
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(_UITextAssistantReplacementTracker *)self isProofreading]
    || (int64_t compositionSessionState = self->_compositionSessionState, compositionSessionState == 2))
  {
    uint64_t v7 = [(NSWritingToolsEditTracker *)self->_editTracker currentContextRange];
    NSUInteger length = v8;
    NSUInteger location = v7 + self->_sessionContextRange.location;
  }
  else if (compositionSessionState == 1)
  {
    NSUInteger location = self->_sessionContextRange.location;
    NSUInteger length = self->_sessionContextRange.length;
  }
  else if (compositionSessionState)
  {
    __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UITextAssistantReplacementTracker.m" lineNumber:571 description:@"Unknown composition session state"];

    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NSUInteger length = 0;
    NSUInteger location = self->_sessionContextRange.location;
  }
  NSUInteger v9 = self->_offsetForSessionRange + location;
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        int v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &activeFullCharacterRange___s_category)+ 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = v13;
          NSUInteger v15 = NSStringFromSelector(a2);
          int v16 = 138412802;
          id v17 = v15;
          __int16 v18 = 2048;
          NSUInteger v19 = v9;
          __int16 v20 = 2048;
          NSUInteger v21 = length;
          _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v16, 0x20u);
        }
      }
    }
  }
  NSUInteger v10 = v9;
  NSUInteger v11 = length;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (_NSRange)activeCharacterRange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(_UITextAssistantReplacementTracker *)self isProofreading]) {
    goto LABEL_6;
  }
  if (self->_compositionSessionState != 2)
  {
LABEL_7:
    uint64_t v8 = [(_UITextAssistantReplacementTracker *)self processedOriginalCharacterRange];
    goto LABEL_8;
  }
  if (![(_UITextAssistantReplacementTracker *)self isFinished])
  {
LABEL_6:
    uint64_t v8 = [(_UITextAssistantReplacementTracker *)self rewrittenCharacterRange];
LABEL_8:
    NSUInteger v7 = v8;
    uint64_t v6 = v9;
    goto LABEL_9;
  }
  if (self->_compositionSessionState != 2) {
    goto LABEL_7;
  }
  NSUInteger location = self->_sessionContextRange.location;
  unint64_t v5 = [(_UITextAssistantReplacementTracker *)self activeText];
  uint64_t v6 = [v5 length];

  NSUInteger v7 = self->_offsetForSessionRange + location;
LABEL_9:
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        __int16 v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &activeCharacterRange___s_category)+ 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = v12;
          uint64_t v14 = NSStringFromSelector(a2);
          int v15 = 138412802;
          int v16 = v14;
          __int16 v17 = 2048;
          NSUInteger v18 = v7;
          __int16 v19 = 2048;
          uint64_t v20 = v6;
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v15, 0x20u);
        }
      }
    }
  }
  NSUInteger v10 = v7;
  NSUInteger v11 = v6;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (_NSRange)activeUnprocessedCharacterRange
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  NSUInteger length = self->_sessionContextRange.length;
  uint64_t v5 = [(_UITextAssistantReplacementTracker *)self processedOriginalCharacterRange];
  uint64_t v7 = v6;
  uint64_t v8 = length - v6;
  if (v8 < 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      NSUInteger v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v19) = 0;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "overshot processed length when calculating unprocessed range", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260B80) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "overshot processed length when calculating unprocessed range", (uint8_t *)&v19, 2u);
      }
    }
    uint64_t v8 = 0;
  }
  if ([(_UITextAssistantReplacementTracker *)self isProofreading]
    || self->_compositionSessionState == 2)
  {
    uint64_t v10 = [(_UITextAssistantReplacementTracker *)self rewrittenCharacterRange];
    NSUInteger v12 = v10 + v11;
  }
  else
  {
    NSUInteger v12 = v5 + v7;
  }
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        int v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB260B88) + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v16 = v15;
          __int16 v17 = NSStringFromSelector(a2);
          int v19 = 138412802;
          uint64_t v20 = v17;
          __int16 v21 = 2048;
          NSUInteger v22 = v12;
          __int16 v23 = 2048;
          uint64_t v24 = v8;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v19, 0x20u);
        }
      }
    }
  }
  NSUInteger v13 = v12;
  NSUInteger v14 = v8;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (id)description
{
  v28.receiver = self;
  v28.super_class = (Class)_UITextAssistantReplacementTracker;
  uint64_t v3 = [(_UITextAssistantReplacementTracker *)&v28 description];
  unint64_t v4 = self->_compositionSessionState + 1;
  long long v27 = (void *)v3;
  if (v4 > 3) {
    uint64_t v5 = @"Unknown";
  }
  else {
    uint64_t v5 = off_1E52F07D8[v4];
  }
  __int16 v23 = v5;
  NSUInteger location = self->_sessionContextRange.location;
  NSUInteger length = self->_sessionContextRange.length;
  uint64_t v24 = [(NSWritingToolsEditTracker *)self->_editTracker currentContextRange];
  [(NSWritingToolsEditTracker *)self->_editTracker currentContextRange];
  uint64_t v7 = v6;
  unint64_t offsetForSessionRange = self->_offsetForSessionRange;
  originalText = self->_originalText;
  rewrittenText = self->_rewrittenText;
  uint64_t v11 = [(NSMutableArray *)self->_replacementDeliveryUUIDs lastObject];
  if (v11)
  {
    NSUInteger v12 = NSString;
    replacementChunksByUUID = self->_replacementChunksByUUID;
    NSUInteger v22 = [(NSMutableArray *)self->_replacementDeliveryUUIDs lastObject];
    __int16 v21 = -[NSMutableDictionary objectForKeyedSubscript:](replacementChunksByUUID, "objectForKeyedSubscript:");
    objc_msgSend(v12, "stringWithFormat:", @" lastChunk=%p", v21);
    NSUInteger v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSUInteger v14 = &stru_1ED0E84C0;
  }
  editTracker = self->_editTracker;
  proofreadingController = self->_proofreadingController;
  if (proofreadingController)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"proofreadingController=%p", self->_proofreadingController);
    __int16 v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v17 = &stru_1ED0E84C0;
  }
  if (self->_finished) {
    NSUInteger v18 = @"YES";
  }
  else {
    NSUInteger v18 = @"NO";
  }
  int v19 = objc_msgSend(v27, "stringByAppendingFormat:", @" state=%@ originalRange={%lu, %lu} currentRange={%lu, %lu} offset=(%ld} original=%p rewrite=%p%@ editTracker=%p%@ finished=%@"), v23, location, length, v24, v7, offsetForSessionRange, originalText, rewrittenText, v14, editTracker, v17, v18;
  if (proofreadingController) {

  }
  if (v11)
  {
  }
  return v19;
}

- (int64_t)compositionSessionState
{
  return self->_compositionSessionState;
}

- (NSUUID)contextUUID
{
  return self->_contextUUID;
}

- (NSWritingToolsProofreadingController)proofreadingController
{
  return self->_proofreadingController;
}

- (unint64_t)offsetForSessionRange
{
  return self->_offsetForSessionRange;
}

- (BOOL)isProofreading
{
  return self->_proofreading;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSAttributedString)originalText
{
  return self->_originalText;
}

- (NSAttributedString)rewrittenText
{
  return self->_rewrittenText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenText, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_proofreadingController, 0);
  objc_storeStrong((id *)&self->_contextUUID, 0);
  objc_storeStrong((id *)&self->_unprocessedOriginalText, 0);
  objc_storeStrong((id *)&self->_processedOriginalText, 0);
  objc_storeStrong((id *)&self->_previousRewrittenTexts, 0);
  objc_storeStrong((id *)&self->_previousRewrites, 0);
  objc_storeStrong((id *)&self->_fallbackDeliveryID, 0);
  objc_storeStrong((id *)&self->_initialReplacementChunksByUUID, 0);
  objc_storeStrong((id *)&self->_replacementChunksByUUID, 0);
  objc_storeStrong((id *)&self->_replacementDeliveryUUIDs, 0);
  objc_storeStrong((id *)&self->_editTracker, 0);
  objc_storeStrong((id *)&self->_originalContext, 0);
}

@end