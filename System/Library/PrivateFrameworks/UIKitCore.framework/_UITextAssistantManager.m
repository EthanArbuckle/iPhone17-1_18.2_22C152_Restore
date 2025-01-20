@interface _UITextAssistantManager
- (BOOL)isReplacingTextByRequest;
- (BOOL)performExternalEditsForWritingToolsSessionIdentifier:(id)a3 action:(int64_t)a4 usingBlock:(id)a5;
- (NSString)description;
- (UITextView)textView;
- (_NSRange)paragraphRangeForRange:(_NSRange)a3;
- (_UITextAssistantManager)initWithTextView:(id)a3;
- (id)contextForWritingToolsForScope:(int64_t)a3;
- (id)replaceRange:(id)a3 withWritingToolsReplacement:(id)a4;
- (void)_invalidateViewportLayoutForTextRange:(id)a3;
- (void)_wtc_highlightProofreadingReviewingRange:(_NSRange)a3;
- (void)_wtc_invalidateGrabberSuppression;
- (void)_wtc_invalidateSelectionUIHidden;
- (void)_wtc_removeUnderlineForProofreadingSuggestionID:(id)a3;
- (void)_wtc_underlineTextInCharacterRange:(_NSRange)a3 proofreadingSuggestionID:(id)a4;
- (void)cleanUpAnimatedTextLayoutInfoIfNecessary;
- (void)dealloc;
- (void)finishUndoRedoChanges;
- (void)removeTextAnimationAttributesAtRange:(_NSRange)a3;
- (void)reportTextChunkVisibilityUpdateForDelivery:(id)a3 textRange:(id)a4 visible:(BOOL)a5;
- (void)sessionCleanup;
- (void)setUpTextAnimationContextForRange:(_NSRange)a3 animation:(int64_t)a4;
- (void)tearDownTextAnimationContextForAnimation:(int64_t)a3;
- (void)updateForCharactersInRange:(_NSRange)a3 withReplacement:(id)a4 isUndoRedo:(BOOL)a5;
- (void)writingToolsCoordinator:(id)a3 adjustForUpdatedRange:(_NSRange)a4 forTextAnimation:(int64_t)a5 inContext:(id)a6 completion:(id)a7;
- (void)writingToolsCoordinator:(id)a3 finishTextAnimation:(int64_t)a4 forRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7;
- (void)writingToolsCoordinator:(id)a3 prepareForTextAnimation:(int64_t)a4 forRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7;
- (void)writingToolsCoordinator:(id)a3 replaceRange:(_NSRange)a4 inContext:(id)a5 proposedText:(id)a6 reason:(int64_t)a7 animationParameters:(id)a8 completion:(id)a9;
- (void)writingToolsCoordinator:(id)a3 requestsBoundingBezierPathsForRange:(_NSRange)a4 inContext:(id)a5 completion:(id)a6;
- (void)writingToolsCoordinator:(id)a3 requestsContextsForScope:(int64_t)a4 completion:(id)a5;
- (void)writingToolsCoordinator:(id)a3 requestsPreviewForTextAnimation:(int64_t)a4 ofRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7;
- (void)writingToolsCoordinator:(id)a3 requestsRangeInContextWithIdentifierForPoint:(CGPoint)a4 completion:(id)a5;
- (void)writingToolsCoordinator:(id)a3 requestsUnderlinePathsForRange:(_NSRange)a4 inContext:(id)a5 completion:(id)a6;
- (void)writingToolsCoordinator:(id)a3 selectRanges:(id)a4 inContext:(id)a5 completion:(id)a6;
- (void)writingToolsCoordinator:(id)a3 willChangeToState:(int64_t)a4 completion:(id)a5;
@end

@implementation _UITextAssistantManager

- (void)dealloc
{
  if (self->_viewportLayoutObservationToken)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_viewportLayoutObservationToken];

    viewportLayoutObservationToken = self->_viewportLayoutObservationToken;
    self->_viewportLayoutObservationToken = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_UITextAssistantManager;
  [(_UITextAssistantManager *)&v5 dealloc];
}

- (_UITextAssistantManager)initWithTextView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UITextAssistantManager;
  objc_super v5 = [(_UITextAssistantManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textView, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    textAnimationContextsByAnimationType = v6->_textAnimationContextsByAnimationType;
    v6->_textAnimationContextsByAnimationType = v7;
  }
  return v6;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UITextAssistantManager;
  v3 = [(_UITextAssistantManager *)&v7 description];
  id v4 = (void *)[v3 mutableCopy];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v4, "appendFormat:", @" textView=%p", WeakRetained);

  return (NSString *)v4;
}

- (void)sessionCleanup
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  activeContext = self->_activeContext;
  self->_activeContext = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  [WeakRetained _setUniqueWritingToolsAnimatedLayoutInfo:0];

  [(_UIAssertion *)self->_grabberSuppression _invalidate];
  grabberSuppression = self->_grabberSuppression;
  self->_grabberSuppression = 0;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v7 = [(NSMutableDictionary *)self->_textAnimationContextsByAnimationType keyEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        -[_UITextAssistantManager tearDownTextAnimationContextForAnimation:](self, "tearDownTextAnimationContextForAnimation:", [*(id *)(*((void *)&v17 + 1) + 8 * v11++) integerValue]);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  if ([(NSMutableDictionary *)self->_textAnimationContextsByAnimationType count])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UITextAssistantManager.m", 122, @"Tear-down should have removed all the _UITextAnimationContexts, but look! _textAnimationContextsByAnimationType=%@", self->_textAnimationContextsByAnimationType object file lineNumber description];
  }
  [(_UIInvalidatable *)self->_selectionUIHiddenAssertion _invalidate];
  selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
  self->_selectionUIHiddenAssertion = 0;

  if (self->_viewportLayoutObservationToken)
  {
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 removeObserver:self->_viewportLayoutObservationToken];

    viewportLayoutObservationToken = self->_viewportLayoutObservationToken;
    self->_viewportLayoutObservationToken = 0;
  }
  self->_offsetToContextualRange = 0;
  initialSelectedRangeInDocument = self->_initialSelectedRangeInDocument;
  self->_initialSelectedRangeInDocument = 0;

  self->_externalEditAction = 0;
}

- (id)contextForWritingToolsForScope:(int64_t)a3
{
  id v4 = self;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_super v7 = [WeakRetained selectedTextRange];

  id v8 = objc_loadWeakRetained((id *)p_textView);
  uint64_t v9 = [v8 textLayoutController];
  uint64_t v10 = [v9 documentRange];

  if (!v7) {
    goto LABEL_7;
  }
  id v11 = objc_loadWeakRetained((id *)p_textView);
  v12 = [v10 start];
  v13 = [v7 start];
  if ([v11 offsetFromPosition:v12 toPosition:v13] < 0)
  {

LABEL_7:
    uint64_t v22 = 0;
    id v23 = 0;
    goto LABEL_45;
  }
  location = (id *)p_textView;
  id v14 = objc_loadWeakRetained((id *)p_textView);
  v15 = [v7 end];
  v75 = v10;
  v16 = [v10 end];
  uint64_t v17 = [v14 offsetFromPosition:v15 toPosition:v16];

  if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = v75;
    if (a3 == 1)
    {
      long long v18 = location;
      id v19 = objc_loadWeakRetained(location);
      long long v20 = [v19 textLayoutController];
      v21 = v20;
    }
    else
    {
      int v24 = [v7 isEmpty];
      long long v18 = location;
      id v19 = objc_loadWeakRetained(location);
      long long v20 = [v19 textLayoutController];
      v21 = v20;
      if (!v24)
      {
        uint64_t v25 = [v20 _writingToolsMinimumContextualRangeForRange:v7];
LABEL_12:
        id v23 = (id)v25;

        if (!v23) {
          id v23 = v7;
        }
        id v26 = objc_loadWeakRetained(v18);
        v27 = [v23 start];
        v28 = [v7 start];
        uint64_t v29 = [v26 offsetFromPosition:v27 toPosition:v28];

        id v30 = objc_loadWeakRetained(v18);
        [v30 _nsrangeForTextRange:v7];
        uint64_t v32 = v31;

        if ((v29 | v32) >= 0) {
          uint64_t v33 = v29;
        }
        else {
          uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if ((v29 | v32) >= 0) {
          uint64_t v34 = v32;
        }
        else {
          uint64_t v34 = 0;
        }
        uint64_t v73 = v34;
        uint64_t v74 = v33;
        id v35 = objc_loadWeakRetained(v18);
        v36 = [v35 textLayoutController];
        v37 = [v36 documentRange];
        v38 = [v37 start];
        v39 = [v23 start];
        uint64_t v40 = [v35 offsetFromPosition:v38 toPosition:v39];

        v4->_offsetToContextualRange = v40;
        objc_storeStrong((id *)&v4->_initialSelectedRangeInDocument, v7);
        id v41 = objc_loadWeakRetained(location);
        v42 = [v41 attributedTextInRange:v23];

        id v43 = objc_loadWeakRetained(location);
        LODWORD(v36) = [v43 _delegateSuppliesWritingToolsIgnoredRanges];

        if (!v36)
        {
          uint64_t v68 = v74;
LABEL_41:
          if (v68 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v22 = 0;
          }
          else {
            uint64_t v22 = -[UIWritingToolsCoordinatorContext initWithAttributedString:range:]([UIWritingToolsCoordinatorContext alloc], "initWithAttributedString:range:", v42, v68, v73);
          }

          goto LABEL_45;
        }
        v76 = v42;
        v71 = v4;
        v72 = v7;
        id v44 = objc_loadWeakRetained(location);
        id v70 = v23;
        uint64_t v45 = [v44 _nsrangeForTextRange:v23];
        NSUInteger v47 = v46;

        id v48 = objc_loadWeakRetained(location);
        v49 = [v48 delegate];
        id v50 = objc_loadWeakRetained(location);
        v51 = objc_msgSend(v49, "textView:writingToolsIgnoredRangesInEnclosingRange:", v50, v45, v47);

        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v52 = v51;
        uint64_t v53 = [v52 countByEnumeratingWithState:&v80 objects:v94 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          v55 = 0;
          uint64_t v56 = *(void *)v81;
          uint64_t v79 = *MEMORY[0x1E4FB7500];
          v42 = v76;
          id obj = v52;
          do
          {
            for (uint64_t i = 0; i != v54; ++i)
            {
              if (*(void *)v81 != v56) {
                objc_enumerationMutation(obj);
              }
              v58 = *(void **)(*((void *)&v80 + 1) + 8 * i);
              uint64_t v59 = [v58 rangeValue];
              uint64_t v61 = v60;
              v97.location = [v58 rangeValue];
              v98.location = 0;
              v98.length = v47;
              NSRange v62 = NSIntersectionRange(v97, v98);
              if ((uint64_t)v62.length < 1)
              {
                v63 = *(NSObject **)(__UILogGetCategoryCachedImpl("WritingTools", &contextForWritingToolsForScope____s_category)+ 8);
                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                {
                  v64 = v63;
                  id v65 = objc_loadWeakRetained(location);
                  v66 = [v65 delegate];
                  *(_DWORD *)buf = 138413314;
                  v85 = v66;
                  __int16 v86 = 2048;
                  uint64_t v87 = v59;
                  __int16 v88 = 2048;
                  uint64_t v89 = v61;
                  __int16 v90 = 2048;
                  uint64_t v91 = 0;
                  __int16 v92 = 2048;
                  NSUInteger v93 = v47;
                  _os_log_impl(&dword_1853B0000, v64, OS_LOG_TYPE_ERROR, "Delegate, %@, requested range to ignore, {.location=%lu,.length=%lu}, does not intersect enclosing range, {.location=%lu,.length=%lu}", buf, 0x34u);

                  v42 = v76;
                }
              }
              else
              {
                if (!v55) {
                  v55 = (void *)[v42 mutableCopy];
                }
                objc_msgSend(v55, "addAttribute:value:range:", v79, &unk_1ED3F5928, v62.location, v62.length);
              }
            }
            id v52 = obj;
            uint64_t v54 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
          }
          while (v54);

          uint64_t v10 = v75;
          if (!v55)
          {
            objc_super v7 = v72;
            id v23 = v70;
            uint64_t v68 = v74;
            goto LABEL_40;
          }
          uint64_t v67 = [v55 copy];

          v42 = (void *)v67;
          objc_super v7 = v72;
          id v23 = v70;
          uint64_t v68 = v74;
        }
        else
        {
          v55 = v52;
          objc_super v7 = v72;
          uint64_t v68 = v74;
          v42 = v76;
        }

LABEL_40:
        id v4 = v71;
        goto LABEL_41;
      }
    }
    uint64_t v25 = [v20 documentRange];
    goto LABEL_12;
  }
  uint64_t v22 = 0;
  id v23 = 0;
  uint64_t v10 = v75;
LABEL_45:
  objc_storeStrong((id *)&v4->_activeContext, v22);

  return v22;
}

- (void)writingToolsCoordinator:(id)a3 requestsContextsForScope:(int64_t)a4 completion:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_super v7 = (void (**)(id, void *))a5;
  uint64_t v8 = [(_UITextAssistantManager *)self contextForWritingToolsForScope:a4];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    v11[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v7[2](v7, v10);
  }
  else
  {
    v7[2](v7, (void *)MEMORY[0x1E4F1CBF0]);
  }
}

- (void)writingToolsCoordinator:(id)a3 willChangeToState:(int64_t)a4 completion:(id)a5
{
  id v15 = a3;
  uint64_t v8 = (void (**)(void))a5;
  if (a4 == 3)
  {
    [(_UIInvalidatable *)self->_selectionUIHiddenAssertion _invalidate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    uint64_t v10 = [WeakRetained _selectionDisplayInteraction];
    id v11 = [v10 _obtainSelectionUIHiddenAssertionForReason:@"Writing Tools Began Session" animated:1];
    selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
    self->_selectionUIHiddenAssertion = v11;

    id v13 = objc_loadWeakRetained((id *)&self->_textView);
    [v13 _setWritingToolsStreamingReplacements:1];
  }
  if ([v15 state] == 3)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_textView);
    [v14 _setWritingToolsStreamingReplacements:0];
  }
  if (!a4) {
    [(_UITextAssistantManager *)self sessionCleanup];
  }
  v8[2](v8);
}

- (void)writingToolsCoordinator:(id)a3 replaceRange:(_NSRange)a4 inContext:(id)a5 proposedText:(id)a6 reason:(int64_t)a7 animationParameters:(id)a8 completion:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger v13 = a4.location;
  v90[1] = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v76 = a5;
  id v80 = a6;
  id v79 = a8;
  v77 = (void (**)(id, void))a9;
  unint64_t v15 = self->_offsetToContextualRange + v13;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v78 = objc_msgSend(WeakRetained, "_NSTextRangeFromNSRange:", v15, length);

  id v17 = objc_loadWeakRetained((id *)&self->_textView);
  v90[0] = v78;
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:1];
  id v19 = [v17 _rangeForTextKitRanges:v18];

  if (a7)
  {
    self->_isReplacingTextByRequest = 1;
    id v20 = objc_loadWeakRetained((id *)&self->_textView);
    id v21 = (id)[v20 _replaceRange:v19 withAttributedText:v80 updatingSelection:0];

    uint64_t v22 = 0;
    self->_isReplacingTextByRequest = 0;
  }
  else
  {
    id v23 = objc_loadWeakRetained((id *)&self->_textView);
    int v24 = [v19 start];
    uint64_t v25 = [v19 start];
    id v26 = [v23 textRangeFromPosition:v24 toPosition:v25];
    id v27 = objc_loadWeakRetained((id *)&self->_textView);
    [v27 setSelectedTextRange:v26];

    uint64_t v28 = -[_UITextAssistantManager paragraphRangeForRange:](self, "paragraphRangeForRange:", v15, length);
    uint64_t v30 = v29;
    id v31 = objc_loadWeakRetained((id *)&self->_textView);
    uint64_t v32 = objc_msgSend(v31, "_nonNullUITextRangeFromNSRange:", v28, v30);
    [v31 _boundingRectForRange:v32];
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;

    v91.origin.x = v34;
    v91.origin.y = v36;
    v91.size.width = v38;
    v91.size.height = v40;
    double Height = CGRectGetHeight(v91);

    self->_isReplacingTextByRequest = 1;
    v42 = [(_UITextAssistantManager *)self replaceRange:v19 withWritingToolsReplacement:v80];
    uint64_t v22 = v42;
    self->_isReplacingTextByRequest = 0;
    if (v42) {
      uint64_t v43 = [v42 length];
    }
    else {
      uint64_t v43 = [v80 length];
    }
    uint64_t v44 = -[_UITextAssistantManager paragraphRangeForRange:](self, "paragraphRangeForRange:", v15, v43);
    uint64_t v46 = v45;
    id v47 = objc_loadWeakRetained((id *)&self->_textView);
    id v48 = objc_msgSend(v47, "_nonNullUITextRangeFromNSRange:", v44, v46);
    [v47 _boundingRectForRange:v48];
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    CGFloat v56 = v55;

    v92.origin.x = v50;
    v92.origin.y = v52;
    v92.size.width = v54;
    v92.size.height = v56;
    double v57 = CGRectGetHeight(v92);

    v58 = [_UIAnimatedTextSpacer alloc];
    [v79 delay];
    double v60 = v59;
    [v79 duration];
    NSRange v62 = [(_UIAnimatedTextSpacer *)v58 initWithSpringBehavior:0 delay:v60 duration:v61];
    id v63 = objc_loadWeakRetained((id *)&self->_textView);
    v64 = [v63 textLayoutManager];

    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __125___UITextAssistantManager_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion___block_invoke;
    v88[3] = &unk_1E52D9F70;
    id v74 = v64;
    id v89 = v74;
    [(_UIAnimatedTextSpacer *)v62 setLayoutInvalidator:v88];
    id v65 = [_UIAnimatedTextLayoutInfo alloc];
    id v66 = objc_loadWeakRetained((id *)&self->_textView);
    uint64_t v67 = objc_msgSend(v66, "_NSTextRangeFromNSRange:", v44, v46);
    uint64_t v68 = [(_UIAnimatedTextLayoutInfo *)v65 initWithAnimatedTextSpacer:v62 animatingTextRange:v67];
    id v69 = objc_loadWeakRetained((id *)&self->_textView);
    [v69 _setUniqueWritingToolsAnimatedLayoutInfo:v68];

    objc_initWeak(&location, self);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __125___UITextAssistantManager_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion___block_invoke_2;
    v85[3] = &unk_1E52DC308;
    objc_copyWeak(&v86, &location);
    [(_UIAnimatedTextSpacer *)v62 setCompletionHandler:v85];
    id v70 = [(_UIAnimatedTextSpacer *)v62 beginExplicitHeightAnimationFromSource:Height toDestination:v57];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __125___UITextAssistantManager_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion___block_invoke_3;
    v83[3] = &unk_1E52FF238;
    id v71 = v70;
    id v84 = v71;
    [v79 setProgressHandler:v83];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __125___UITextAssistantManager_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion___block_invoke_4;
    v81[3] = &unk_1E52D9F70;
    id v72 = v71;
    id v82 = v72;
    [v79 setCompletionHandler:v81];

    objc_destroyWeak(&v86);
    objc_destroyWeak(&location);
  }
  if (v22) {
    id v73 = v22;
  }
  else {
    id v73 = v80;
  }
  ((void (**)(id, id))v77)[2](v77, v73);
}

- (void)writingToolsCoordinator:(id)a3 selectRanges:(id)a4 inContext:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a6;
  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4)&& (unint64_t)[v8 count] >= 2&& os_variant_has_internal_diagnostics()&& ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
  {
    uint64_t v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &writingToolsCoordinator_selectRanges_inContext_completion____s_category)+ 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      id v24 = v8;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "_UITextAssistantManager doesn't yet support more than one selection at a time. Only the first of these ranges will be applied. %@", (uint8_t *)&v23, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  id v11 = [WeakRetained interactionAssistant];
  v12 = [v11 _selectionViewManager];
  [v12 setActivated:1];

  if ([v8 count])
  {
    NSUInteger v13 = [v8 objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 rangeValue];
    uint64_t v16 = v15;

    unint64_t v17 = self->_offsetToContextualRange + v14;
    id v18 = objc_loadWeakRetained((id *)&self->_textView);
    id v19 = objc_msgSend(v18, "_nonNullUITextRangeFromNSRange:", v17, v16);
  }
  else
  {
    id v19 = 0;
  }
  id v20 = objc_loadWeakRetained((id *)&self->_textView);
  [v20 setSelectedTextRange:v19];

  [(_UIInvalidatable *)self->_selectionUIHiddenAssertion _invalidate];
  selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
  self->_selectionUIHiddenAssertion = 0;

  v9[2](v9);
}

- (void)writingToolsCoordinator:(id)a3 requestsRangeInContextWithIdentifierForPoint:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  p_textView = &self->_textView;
  uint64_t v9 = (void (**)(id, uint64_t, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(WeakRetained, "characterRangeAtPoint:", x, y);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    id v11 = objc_loadWeakRetained((id *)p_textView);
    uint64_t v12 = [v11 _nsrangeForTextRange:v17];
    if (self)
    {
      uint64_t v14 = v13;
      if (v12 - self->_offsetToContextualRange >= 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v15 = v12 - self->_offsetToContextualRange;
      }
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v16 = [(UIWritingToolsCoordinatorContext *)self->_activeContext identifier];
  v9[2](v9, v15, v14, v16);
}

- (void)writingToolsCoordinator:(id)a3 requestsBoundingBezierPathsForRange:(_NSRange)a4 inContext:(id)a5 completion:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void (**)(id, void *))a6;
  if (self)
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (location != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v10 = self->_offsetToContextualRange + location;
    }
  }
  else
  {
    NSUInteger length = 0;
    uint64_t v10 = 0;
  }
  p_textView = &self->_textView;
  id v12 = objc_loadWeakRetained((id *)p_textView);
  uint64_t v13 = objc_msgSend(v12, "_nonNullUITextRangeFromNSRange:", v10, length);
  uint64_t v14 = [v12 selectionRectsForRange:v13];

  uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "rect", (void)v47);
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        id WeakRetained = objc_loadWeakRetained((id *)p_textView);
        uint64_t v30 = [WeakRetained textInputTraits];
        [v30 selectionEdgeInsets];
        double v32 = v22 + v31;
        double v34 = v24 + v33;
        double v36 = v26 - (v31 + v35);
        double v38 = v28 - (v33 + v37);

        id v39 = objc_loadWeakRetained((id *)p_textView);
        CGFloat v40 = [v39 textInputTraits];
        [v40 selectionCornerRadius];
        double v42 = v41;

        v53.origin.double x = v32;
        v53.origin.double y = v34;
        v53.size.width = v36;
        v53.size.height = v38;
        double v43 = CGRectGetHeight(v53) * 0.5;
        if (v43 >= v42) {
          double v44 = v42;
        }
        else {
          double v44 = v43;
        }
        if (v44 <= 0.0) {
          +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v32, v34, v36, v38);
        }
        else {
        uint64_t v45 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v32, v34, v36, v38);
        }
        [v15 addObject:v45];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v18);
  }

  uint64_t v46 = (void *)[v15 copy];
  v9[2](v9, v46);
}

- (void)writingToolsCoordinator:(id)a3 requestsUnderlinePathsForRange:(_NSRange)a4 inContext:(id)a5 completion:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v39 = a5;
  double v38 = (void (**)(id, void *))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  id v12 = [WeakRetained interactionAssistant];
  uint64_t v13 = [v12 _selectionViewManager];

  if (self)
  {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    if (location != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v14 = self->_offsetToContextualRange + location;
    }
  }
  else
  {
    NSUInteger length = 0;
    uint64_t v14 = 0;
  }
  id v15 = objc_loadWeakRetained((id *)&self->_textView);
  id v16 = objc_msgSend(v15, "_nonNullUITextRangeFromNSRange:", v14, length);
  double v37 = v13;
  uint64_t v17 = [v13 _underlineRectsForRange:v16];

  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v19);
        }
        double v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        [v24 fullRect];
        double x = v50.origin.x;
        double y = v50.origin.y;
        double width = v50.size.width;
        if (CGRectIsNull(v50))
        {
          if (self->_viewportLayoutObservationToken) {
            continue;
          }
          double v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v29 = [MEMORY[0x1E4F28F08] mainQueue];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __103___UITextAssistantManager_writingToolsCoordinator_requestsUnderlinePathsForRange_inContext_completion___block_invoke;
          v41[3] = &unk_1E52FB088;
          id v42 = v40;
          id v43 = v39;
          uint64_t v30 = [v28 addObserverForName:@"_UITextViewportLayoutControllerDidLayout" object:0 queue:v29 usingBlock:v41];
          viewportLayoutObservationToken = self->_viewportLayoutObservationToken;
          self->_viewportLayoutObservationToken = v30;

          double v32 = v42;
        }
        else
        {
          [v24 baselineOffset];
          double v32 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y + v33 + 2.0, width, 2.0, 1.0);
          [v18 addObject:v32];
          if (self->_viewportLayoutObservationToken)
          {
            double v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v34 removeObserver:self->_viewportLayoutObservationToken];

            double v35 = self->_viewportLayoutObservationToken;
            self->_viewportLayoutObservationToken = 0;
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v21);
  }

  double v36 = (void *)[v18 copy];
  v38[2](v38, v36);
}

- (void)writingToolsCoordinator:(id)a3 prepareForTextAnimation:(int64_t)a4 forRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = (void (**)(void))a7;
  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
  {
    uint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &writingToolsCoordinator_prepareForTextAnimation_forRange_inContext_completion____s_category)+ 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = v13;
      id v15 = UIWritingToolsCoordinatorTextAnimationDebugDescription(a4);
      int v16 = 138412802;
      uint64_t v17 = v15;
      __int16 v18 = 2048;
      NSUInteger v19 = location;
      __int16 v20 = 2048;
      NSUInteger v21 = length;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "prepareForTextAnimation: %@, range={%lu, %lu}", (uint8_t *)&v16, 0x20u);
    }
  }
  unint64_t v12 = self->_offsetToContextualRange + location;
  -[_UITextAssistantManager removeTextAnimationAttributesAtRange:](self, "removeTextAnimationAttributesAtRange:", v12, length);
  -[_UITextAssistantManager setUpTextAnimationContextForRange:animation:](self, "setUpTextAnimationContextForRange:animation:", v12, length, a4);
  v11[2](v11);
}

- (void)writingToolsCoordinator:(id)a3 adjustForUpdatedRange:(_NSRange)a4 forTextAnimation:(int64_t)a5 inContext:(id)a6 completion:(id)a7
{
}

- (void)writingToolsCoordinator:(id)a3 requestsPreviewForTextAnimation:(int64_t)a4 ofRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v13 = a6;
  uint64_t v14 = (void (**)(void))a7;
  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
  {
    double v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &writingToolsCoordinator_requestsPreviewForTextAnimation_ofRange_inContext_completion____s_category)+ 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      double v24 = v23;
      double v25 = UIWritingToolsCoordinatorTextAnimationDebugDescription(a4);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = location;
      *(_WORD *)&buf[22] = 2048;
      double v33 = (uint64_t (*)(uint64_t, uint64_t))length;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "previewForTextAnimation: %@, range={%lu, %lu}", buf, 0x20u);
    }
  }
  unint64_t offsetToContextualRange = self->_offsetToContextualRange;
  int v16 = [NSNumber numberWithInteger:a4];
  uint64_t v17 = UIWritingToolsCoordinatorTextAnimationDebugDescription(a4);
  __int16 v18 = [(NSMutableDictionary *)self->_textAnimationContextsByAnimationType objectForKeyedSubscript:v16];
  unint64_t v19 = offsetToContextualRange + location;
  if (!v18)
  {
    -[_UITextAssistantManager setUpTextAnimationContextForRange:animation:](self, "setUpTextAnimationContextForRange:animation:", v19, length, a4);
    __int16 v18 = [(NSMutableDictionary *)self->_textAnimationContextsByAnimationType objectForKeyedSubscript:v16];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  NSUInteger v21 = objc_msgSend(WeakRetained, "_nonNullUITextRangeFromNSRange:", v19, length);

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  double v33 = __Block_byref_object_copy__145;
  double v34 = __Block_byref_object_dispose__145;
  id v35 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __112___UITextAssistantManager_writingToolsCoordinator_requestsPreviewForTextAnimation_ofRange_inContext_completion___block_invoke;
  v29[3] = &unk_1E52FF260;
  double v31 = buf;
  v29[4] = self;
  id v22 = v21;
  id v30 = v22;
  [v18 snapshotWithComponents:0xFFFFLL exclusiveComponents:0 usingBlock:v29];
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    double v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UITextAssistantManager.m", 416, @"Failed to create targetedPreview for %@ of %@", v17, v22 object file lineNumber description];
  }
  v14[2](v14);

  _Block_object_dispose(buf, 8);
}

- (void)writingToolsCoordinator:(id)a3 finishTextAnimation:(int64_t)a4 forRange:(_NSRange)a5 inContext:(id)a6 completion:(id)a7
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void (**)(void))a7;
  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
  {
    uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &writingToolsCoordinator_finishTextAnimation_forRange_inContext_completion____s_category)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = v10;
      unint64_t v12 = UIWritingToolsCoordinatorTextAnimationDebugDescription(a4);
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "finishTextAnimation: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  [(_UITextAssistantManager *)self tearDownTextAnimationContextForAnimation:a4];
  if (a4 == 2) {
    [(_UITextAssistantManager *)self cleanUpAnimatedTextLayoutInfoIfNecessary];
  }
  v9[2](v9);
}

- (void)_wtc_invalidateGrabberSuppression
{
  [(_UIAssertion *)self->_grabberSuppression _invalidate];
  grabberSuppression = self->_grabberSuppression;
  self->_grabberSuppression = 0;
}

- (void)_wtc_invalidateSelectionUIHidden
{
  [(_UIInvalidatable *)self->_selectionUIHiddenAssertion _invalidate];
  selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
  self->_selectionUIHiddenAssertion = 0;
}

- (void)_wtc_underlineTextInCharacterRange:(_NSRange)a3 proofreadingSuggestionID:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v15 = a4;
  if (self)
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (location != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v7 = self->_offsetToContextualRange + location;
    }
  }
  else
  {
    NSUInteger length = 0;
    uint64_t v7 = 0;
  }
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)p_textView);
  uint64_t v10 = [WeakRetained interactionAssistant];
  id v11 = [v10 _selectionViewManager];

  id v12 = objc_loadWeakRetained((id *)p_textView);
  int v13 = objc_msgSend(v12, "_nonNullUITextRangeFromNSRange:", v7, length);
  id v14 = (id)[v11 _underlineTextInRange:v13 animated:0 preferredUUID:v15];
}

- (void)_wtc_removeUnderlineForProofreadingSuggestionID:(id)a3
{
  p_textView = &self->_textView;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textView);
  v6 = [WeakRetained interactionAssistant];
  id v7 = [v6 _selectionViewManager];

  [v7 _removeUnderlineWithIdentifier:v4 animated:0];
}

- (void)_wtc_highlightProofreadingReviewingRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  id v8 = [WeakRetained interactionAssistant];
  id v16 = [v8 _selectionViewManager];

  [(_UIInvalidatable *)self->_selectionUIHiddenAssertion _invalidate];
  selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
  self->_selectionUIHiddenAssertion = 0;

  uint64_t v10 = [v16 _obtainGrabberSuppressionAssertion];
  grabberSuppression = self->_grabberSuppression;
  self->_grabberSuppression = v10;

  unint64_t v12 = self->_offsetToContextualRange + location;
  id v13 = objc_loadWeakRetained((id *)p_textView);
  id v14 = objc_msgSend(v13, "_nonNullUITextRangeFromNSRange:", v12, length);
  id v15 = objc_loadWeakRetained((id *)p_textView);
  [v15 setSelectedTextRange:v14];
}

- (void)removeTextAnimationAttributesAtRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v6 = [WeakRetained attributedText];
  id v12 = (id)[v6 mutableCopy];

  unint64_t v7 = [v12 length];
  if (location + length <= v7) {
    NSUInteger v8 = length;
  }
  else {
    NSUInteger v8 = v7 - location;
  }
  if (v7 >= location)
  {
    NSUInteger v9 = location;
  }
  else
  {
    NSUInteger v8 = 0;
    NSUInteger v9 = v7;
  }
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v10 = v7;
  }
  else {
    unint64_t v10 = v8;
  }
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v11 = 0;
  }
  else {
    NSUInteger v11 = v9;
  }
  objc_msgSend(v12, "removeAttribute:range:", *(void *)off_1E52D2298, v11, v10);
}

- (void)setUpTextAnimationContextForRange:(_NSRange)a3 animation:(int64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v25[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v8 = [NSNumber numberWithInteger:a4];
  NSUInteger v9 = UIWritingToolsCoordinatorTextAnimationDebugDescription(a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  NSUInteger v11 = objc_msgSend(WeakRetained, "_NSTextRangeFromNSRange:", location, length);

  id v12 = [(NSMutableDictionary *)self->_textAnimationContextsByAnimationType objectForKeyedSubscript:v8];

  if (!v12)
  {
    id v13 = [_UITextAnimationContext alloc];
    id v14 = objc_loadWeakRetained((id *)&self->_textView);
    id v15 = [v14 textLayoutManager];
    v25[0] = v11;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    uint64_t v17 = [(_UITextAnimationContext *)v13 initWithTextLayoutManager:v15 textRanges:v16 animationName:v9];

    [(NSMutableDictionary *)self->_textAnimationContextsByAnimationType setObject:v17 forKeyedSubscript:v8];
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
    {
      __int16 v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &setUpTextAnimationContextForRange_animation____s_category)+ 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412802;
        __int16 v20 = v17;
        __int16 v21 = 2112;
        id v22 = v11;
        __int16 v23 = 2112;
        double v24 = v9;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Created %@ with %@ for %@", (uint8_t *)&v19, 0x20u);
      }
    }
  }
  [(_UITextAssistantManager *)self _invalidateViewportLayoutForTextRange:v11];
}

- (void)tearDownTextAnimationContextForAnimation:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  v6 = UIWritingToolsCoordinatorTextAnimationDebugDescription(a3);
  unint64_t v7 = [(NSMutableDictionary *)self->_textAnimationContextsByAnimationType objectForKeyedSubscript:v5];
  NSUInteger v8 = v7;
  if (v7)
  {
    [v7 finalizeAnimation];
    [(NSMutableDictionary *)self->_textAnimationContextsByAnimationType removeObjectForKey:v5];
    NSUInteger v9 = [v8 enclosingTextRange];
    [(_UITextAssistantManager *)self _invalidateViewportLayoutForTextRange:v9];
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
    {
      unint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &_MergedGlobals_1172) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412802;
        id v13 = v8;
        __int16 v14 = 2112;
        id v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v6;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Finalized and released %@, invalidating layout for %@ for %@", (uint8_t *)&v12, 0x20u);
      }
    }
  }
  else if (os_variant_has_internal_diagnostics() {
         && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
  }
  {
    NSUInteger v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB262068) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "_UITextAnimationContext already finalized and released or never created for %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)cleanUpAnimatedTextLayoutInfoIfNecessary
{
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_super v5 = [WeakRetained _uniqueWritingToolsAnimatedLayoutInfo];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_textView);
    [v6 _setUniqueWritingToolsAnimatedLayoutInfo:0];

    [(_UITextAssistantManager *)self _invalidateViewportLayoutForTextRange:0];
  }
}

- (void)_invalidateViewportLayoutForTextRange:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  id v6 = WeakRetained;
  if (v4)
  {
    unint64_t v7 = [WeakRetained textLayoutController];

    v12[0] = v4;
    NSUInteger v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    NSUInteger v9 = [v7 textRangeForTextKit2Ranges:v8];

    [v7 invalidateLayoutForRange:v9];
  }
  else
  {
    unint64_t v10 = [WeakRetained textContainer];
    NSUInteger v11 = [v10 textViewportLayoutController];
    [v11 setNeedsLayout];
  }
}

- (_NSRange)paragraphRangeForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  id v6 = [WeakRetained attributedText];
  unint64_t v7 = [v6 string];

  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __int16 v16 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)__int16 v21 = 0;
        _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "Paragraph range requested with NSNotFound location. Please file a radar on UIKit if you have repro steps", v21, 2u);
      }
    }
    else
    {
      NSUInteger v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB262070) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Paragraph range requested with NSNotFound location. Please file a radar on UIKit if you have repro steps", buf, 2u);
      }
    }
    NSUInteger location = [v7 length];
    NSUInteger length = 0;
  }
  else if (location + length > [v7 length])
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)int v19 = 0;
        _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "Paragraph range requested for range overflowing beyond length of text. Please file a radar on UIKit if you have repro steps", v19, 2u);
      }
    }
    else
    {
      NSUInteger v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB262078) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v18[0] = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Paragraph range requested for range overflowing beyond length of text. Please file a radar on UIKit if you have repro steps", (uint8_t *)v18, 2u);
      }
    }
    unint64_t v10 = [v7 length];
    if (v10 < location) {
      NSUInteger location = v10;
    }
    NSUInteger length = v10 - location;
  }
  uint64_t v11 = objc_msgSend(v7, "paragraphRangeForRange:", location, length);
  NSUInteger v13 = v12;

  NSUInteger v14 = v11;
  NSUInteger v15 = v13;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (id)replaceRange:(id)a3 withWritingToolsReplacement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_textView = &self->_textView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  unint64_t v10 = [WeakRetained textStorage];
  uint64_t v11 = [v10 length];

  id v12 = objc_loadWeakRetained((id *)p_textView);
  NSUInteger v13 = [v12 _replaceRange:v6 withAttributedText:v7 updatingSelection:0];

  id v14 = objc_loadWeakRetained((id *)p_textView);
  int v15 = [v14 _textStorageOverridesReplaceCharactersInRangeWithAttributedString];

  if (!v15) {
    goto LABEL_7;
  }
  id v16 = objc_loadWeakRetained((id *)p_textView);
  uint64_t v17 = [v16 textStorage];
  uint64_t v18 = [v17 length] - v11;

  id v19 = objc_loadWeakRetained((id *)p_textView);
  uint64_t v20 = [v19 _nsrangeForTextRange:v6];
  uint64_t v22 = v21;

  uint64_t v23 = v22 + v18;
  uint64_t v24 = [v7 length];
  if (v23 != v24)
  {
    id v25 = objc_loadWeakRetained((id *)p_textView);
    uint64_t v26 = objc_msgSend(v25, "_textRangeFromNSRange:", v20, v23);

    NSUInteger v13 = (void *)v26;
  }
  id v27 = objc_loadWeakRetained((id *)p_textView);
  id v28 = [v27 attributedTextInRange:v13];

  if (v23 == v24 && [v28 isEqualToAttributedString:v7])
  {

LABEL_7:
    id v28 = 0;
  }

  return v28;
}

- (void)updateForCharactersInRange:(_NSRange)a3 withReplacement:(id)a4 isUndoRedo:(BOOL)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  SEL v42 = a2;
  id v43 = a4;
  if (a5)
  {
    BOOL v9 = 1;
    if (!self)
    {
      BOOL v10 = 0;
      NSUInteger v11 = 0;
      NSUInteger v12 = 0;
      BOOL v13 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v9 = self->_externalEditAction == 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  int v15 = [WeakRetained writingToolsCoordinator];

  id v16 = [(UIWritingToolsCoordinatorContext *)self->_activeContext identifier];
  uint64_t v17 = [v15 _adjustedResolvedRangeForContextWithIdentifier:v16];
  uint64_t v19 = v18;

  NSUInteger offsetToContextualRange = self->_offsetToContextualRange;
  uint64_t v21 = [(UIWritingToolsCoordinatorContext *)self->_activeContext attributedString];
  uint64_t v22 = [v21 length];
  uint64_t v23 = [(UIWritingToolsCoordinatorContext *)self->_activeContext resolvedRange];
  NSUInteger v25 = v17 + v19 + v22 - (v24 + v23);

  NSUInteger v26 = location + length;
  BOOL v13 = location < offsetToContextualRange || v26 > v25 + offsetToContextualRange;
  BOOL v10 = v26 < offsetToContextualRange;
  v45.NSUInteger location = location;
  v45.NSUInteger length = length;
  v46.NSUInteger location = offsetToContextualRange;
  v46.NSUInteger length = v25;
  NSRange v28 = NSIntersectionRange(v45, v46);
  NSUInteger v11 = v28.location;
  NSUInteger v12 = v28.length;

LABEL_12:
  id v29 = objc_loadWeakRetained((id *)&self->_textView);
  id v30 = [v29 writingToolsCoordinator];

  double v31 = [(UIWritingToolsCoordinatorContext *)self->_activeContext identifier];
  if (v13)
  {
    if (v10)
    {
      int64_t v32 = self->_offsetToContextualRange + [v43 length] - length;
      self->_NSUInteger offsetToContextualRange = v32;
      if (v32 < 0)
      {
        double v41 = [MEMORY[0x1E4F28B00] currentHandler];
        [v41 handleFailureInMethod:v42 object:self file:@"_UITextAssistantManager.m" lineNumber:648 description:@"Invalid character offset after text update"];
      }
      objc_msgSend(v30, "updateForReflowedTextInContextWithIdentifier:", v31, v42);
    }
    else if (v12)
    {
      id v34 = v43;
      id v35 = v34;
      unint64_t v36 = self->_offsetToContextualRange;
      if (v9)
      {
        if (location - v36 >= 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v37 = location - v36;
        }
        double v38 = v34;
        NSUInteger v12 = length;
      }
      else
      {
        unint64_t v37 = v11 - v36;
        unint64_t v39 = [v34 length];
        if (v37 >= v39) {
          unint64_t v40 = v39;
        }
        else {
          unint64_t v40 = v37;
        }
        double v38 = objc_msgSend(v35, "attributedSubstringFromRange:", v40, objc_msgSend(v35, "length", v42) - v40);

        unint64_t v36 = self->_offsetToContextualRange;
      }
      if (location < v36) {
        self->_offsetToContextualRange += [v35 length] - length;
      }
      objc_msgSend(v30, "updateRange:withText:reason:forContextWithIdentifier:", v37, v12, v38, v9, v31, v42);
    }
  }
  else
  {
    if (location - self->_offsetToContextualRange >= 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v33 = location - self->_offsetToContextualRange;
    }
    objc_msgSend(v30, "updateRange:withText:reason:forContextWithIdentifier:", v33, length, v43, v9, v31, v42);
  }
}

- (void)finishUndoRedoChanges
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  id v6 = [WeakRetained _writingToolsCoordinator];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
  objc_super v5 = [(UIWritingToolsCoordinatorContext *)self->_activeContext identifier];
  objc_msgSend(v6, "updateRange:withText:reason:forContextWithIdentifier:", 0, 0, v4, 0, v5);
}

- (void)reportTextChunkVisibilityUpdateForDelivery:(id)a3 textRange:(id)a4 visible:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v7)
  {
    if (has_internal_diagnostics
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
    {
      BOOL v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB262080) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSUInteger v11 = @"hidden";
        int v17 = 138412802;
        if (v5) {
          NSUInteger v11 = @"visible";
        }
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v7;
        NSUInteger v12 = "Updating chunk visibility to %@ on range %@ for replacement delivery: %@";
        BOOL v13 = v10;
        uint32_t v14 = 32;
LABEL_21:
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v17, v14);
      }
    }
  }
  else if (has_internal_diagnostics {
         && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
  }
  {
    int v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB262088) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = @"hidden";
      if (v5) {
        id v16 = @"visible";
      }
      int v17 = 138412546;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v8;
      NSUInteger v12 = "Updating chunk visibility to %@ on range %@ for pondering effect";
      BOOL v13 = v15;
      uint32_t v14 = 22;
      goto LABEL_21;
    }
  }
}

- (BOOL)performExternalEditsForWritingToolsSessionIdentifier:(id)a3 action:(int64_t)a4 usingBlock:(id)a5
{
  id v8 = a3;
  BOOL v9 = (uint64_t (**)(id, id, id, int64_t))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  char v11 = [WeakRetained _isWritingToolsStreamingReplacements];

  if (v11)
  {
    char v12 = 0;
  }
  else
  {
    int64_t externalEditAction = self->_externalEditAction;
    self->_int64_t externalEditAction = a4;
    id v14 = objc_loadWeakRetained((id *)&self->_textView);
    char v12 = v9[2](v9, v14, v8, a4);

    self->_int64_t externalEditAction = externalEditAction;
  }

  return v12;
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UITextView *)WeakRetained;
}

- (BOOL)isReplacingTextByRequest
{
  return self->_isReplacingTextByRequest;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong((id *)&self->_textAnimationContextsByAnimationType, 0);
  objc_storeStrong((id *)&self->_activeContext, 0);
  objc_storeStrong((id *)&self->_viewportLayoutObservationToken, 0);
  objc_storeStrong((id *)&self->_initialSelectedRangeInDocument, 0);
  objc_storeStrong((id *)&self->_selectionUIHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_grabberSuppression, 0);
}

@end