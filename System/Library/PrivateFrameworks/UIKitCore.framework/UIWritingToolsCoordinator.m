@interface UIWritingToolsCoordinator
+ (BOOL)isWritingToolsAvailable;
- (BOOL)_isCancelingSession;
- (BOOL)_isSynchronizingWithUndoRedo;
- (BOOL)_isWrappingUpProofreadingSession;
- (BOOL)_showingOriginal;
- (BOOL)isEditable;
- (BOOL)proofreadingInteraction:(id)a3 shouldRespondToTapAtPoint:(CGPoint)a4;
- (NSArray)_effectContainerLookupIDs;
- (NSDictionary)_acceptedEvaluationContextsByContextID;
- (NSDictionary)_proposedEvaluationContextsByContextID;
- (NSDictionary)_replacementTrackersByContextID;
- (NSMapTable)_effectContainersByLookupID;
- (NSMutableArray)_proofreadingDeliverySuggestionIDs;
- (NSMutableArray)_writingToolsDelegateMessageInvocationBuffer;
- (NSMutableAttributedString)_proofreadingDeliveryReplacement;
- (NSMutableDictionary)_anticipationContainerInfosByContextID;
- (NSMutableDictionary)_backingProofreadingSuggestionStatesPerSuggestionIDByContextID;
- (NSMutableDictionary)_currentProofreadingTextPerContextID;
- (NSMutableDictionary)_proofreadingHighlightInfoBySuggestionID;
- (NSMutableDictionary)_proofreadingSuggestionIDsPerDeliveryIDByContextID;
- (NSMutableDictionary)_proofreadingSuggestionInfoBySuggestionID;
- (NSMutableDictionary)_proofreadingUnderlineInfoBySuggestionID;
- (NSMutableDictionary)_storedTargetedPreviewsByContextID;
- (NSMutableDictionary)_undoRollersByContextID;
- (NSMutableSet)_streamingContextIDs;
- (NSString)description;
- (NSUUID)_activeReviewingUUID;
- (NSUUID)_activeSessionUUID;
- (NSUUID)_contextIDForChosenSuggestion;
- (NSUUID)_inFlightDeliveryID;
- (NSWritingToolsProofreadingSuggestion)_chosenSuggestion;
- (UIView)decorationContainerView;
- (UIView)effectContainerView;
- (UIView)view;
- (UIWritingToolsCoordinator)init;
- (UIWritingToolsCoordinator)initWithDelegate:(id)a3;
- (UIWritingToolsCoordinatorDelegate)delegate;
- (WTSession)_pendingSessionForWritingToolsWillBegin;
- (WTTextViewDelegate_Proposed_v1)_sessionTextViewDelegate;
- (_NSRange)_adjustedResolvedRangeForContextWithIdentifier:(id)a3;
- (_UIWTCProofreadingDecorationView)_proofreadingDecorationView;
- (_UIWTCProofreadingInteraction)_proofreadingInteraction;
- (_UIWTCTemporaryBridging)_bridgingDelegate;
- (id)_bufferInvocationForSelector:(SEL)a3 arguments:(id)a4;
- (id)_drawProofreadingHighlightsForRange:(_NSRange)a3 inContext:(id)a4 forProofreadingSuggestionID:(id)a5;
- (id)_pendingCompletionForWritingToolsWillBegin;
- (id)_replacementTracker;
- (id)_replacementTrackerForContextID:(id)a3;
- (int64_t)_proofreadingVisualizationReplacementDelta;
- (int64_t)behavior;
- (int64_t)preferredBehavior;
- (int64_t)state;
- (unint64_t)_proofreadingDeliveryOffset;
- (unint64_t)preferredResultOptions;
- (unint64_t)resultOptions;
- (void)_addProofreadSuggestionPendingUnderlineForRange:(_NSRange)a3 inContext:(id)a4 forProofreadingSuggestionID:(id)a5;
- (void)_addProofreadingSuggestionReviewingHighlightForRange:(_NSRange)a3 inContext:(id)a4 forProofreadingSuggestionID:(id)a5;
- (void)_animateRewrittenTextForDelivery:(id)a3 contextID:(id)a4 lookupID:(id)a5;
- (void)_beginAnimatedTextReplacementForInFlightDeliveryInContextID:(id)a3;
- (void)_beginTextAssistantAnticipationInContainer:(id)a3 context:(id)a4 animationCharacterRange:(_NSRange)a5;
- (void)_beginTextAssistantAnticipationsForRange:(_NSRange)a3 inContext:(id)a4;
- (void)_changeToState:(void *)a3 postStateChangeActions:;
- (void)_completeReceivingSuggestions:(id)a3 processedRange:(_NSRange)a4 inContext:(id)a5 finished:(BOOL)a6;
- (void)_decorationContainerViewForRange:(_NSRange)a3 inContext:(id)a4 completion:(id)a5;
- (void)_delegateUpdateTextAccordingToProofreadingSuggestionInfoWithIdentifier:(id)a3 replacingCharactersInRange:(_NSRange)a4 newState:(int64_t)a5 contextID:(id)a6 updateCompletion:(id)a7;
- (void)_didDismissWritingTools;
- (void)_didEndProofreadingSession:(id)a3 accepted:(BOOL)a4 completion:(id)a5;
- (void)_didEndRewritingSession:(id)a3 accepted:(BOOL)a4;
- (void)_drawProofreadingUnderlinesForRange:(_NSRange)a3 inContext:(id)a4 forProofreadingSuggestionID:(id)a5 recordUnderlineInfo:(id)a6;
- (void)_effectContainerCleanup;
- (void)_endTextAssistantAnticipationInContainerForLookupID:(id)a3;
- (void)_endTextAssistantAnticipationsForContextIDs:(id)a3;
- (void)_fetchStoredTargetedPreviewForContextID:(id)a3 textAnimation:(int64_t)a4 completion:(id)a5;
- (void)_finishUndoRedoChangesForContextID:(id)a3;
- (void)_invalidateProofreadingSuggestionWithUUID:(id)a3 contextID:(id)a4;
- (void)_invalidateReplacementForDeliveryID:(id)a3 animated:(BOOL)a4;
- (void)_proofreadingOrCompositionFinishedInContext:(id)a3;
- (void)_removeAllProofreadingDecorations;
- (void)_removeProofreadingSuggestionPendingUnderlineForPoofreadingSuggestionID:(id)a3;
- (void)_removeProofreadingSuggestionReviewingHighlightForProofreadingSuggestionID:(id)a3;
- (void)_replacementEffectDidLandInFlightDelivery:(id)a3 inContext:(id)a4;
- (void)_resetProofreadingDecorationsForSuggestionsFollowingChangeLocationIndex:(unint64_t)a3 inContext:(id)a4;
- (void)_sendDelegateFinishTextAnimation:(int64_t)a3 contextID:(id)a4 completion:(id)a5;
- (void)_sendDelegatePrepareForTextAnimation:(int64_t)a3 forRange:(_NSRange)a4 contextID:(id)a5 completion:(id)a6;
- (void)_sendDelegateTargetedPreviewOfActiveRangeForTextAnimation:(int64_t)a3 contextID:(id)a4 completion:(id)a5;
- (void)_sendDelegatedAnimatedReplacementWithDelay:(double)a3 duration:(double)a4 deliveryID:(id)a5 contextID:(id)a6 completion:(id)a7;
- (void)_sessionCleanup;
- (void)_setAcceptedEvaluationContextsByContextID:(id)a3;
- (void)_setActiveReviewingUUID:(id)a3;
- (void)_setActiveSessionUUID:(id)a3;
- (void)_setAnticipationContainerInfosByContextID:(id)a3;
- (void)_setBackingProofreadingSuggestionStatesPerSuggestionIDByContextID:(id)a3;
- (void)_setBridgingDelegate:(id)a3;
- (void)_setCancelingSession:(BOOL)a3;
- (void)_setChosenSuggestion:(id)a3;
- (void)_setContextIDForChosenSuggestion:(id)a3;
- (void)_setCrossReferenceLookupID:(void *)a3 forView:;
- (void)_setCurrentProofreadingTextPerContextID:(id)a3;
- (void)_setEffectContainersByLookupID:(id)a3;
- (void)_setHasDeliveredReplacement:(BOOL)a3 forDeliveryID:(id)a4;
- (void)_setInFlightDeliveryID:(id)a3;
- (void)_setPendingCompletionForWritingToolsWillBegin:(id)a3;
- (void)_setPendingSessionForWritingToolsWillBegin:(id)a3;
- (void)_setPoofreadingSuggestionIDsPerDeliveryIDByContextID:(id)a3;
- (void)_setProofreadingDecorationView:(id)a3;
- (void)_setProofreadingDeliveryOffset:(unint64_t)a3;
- (void)_setProofreadingDeliveryReplacement:(id)a3;
- (void)_setProofreadingDeliverySuggestionIDs:(id)a3;
- (void)_setProofreadingHighlightInfoBySuggestionID:(id)a3;
- (void)_setProofreadingInteraction:(id)a3;
- (void)_setProofreadingSuggestionInfoBySuggestionID:(id)a3;
- (void)_setProofreadingUnderlineInfoBySuggestionID:(id)a3;
- (void)_setProofreadingVisualizationReplacementDelta:(int64_t)a3;
- (void)_setProposedEvaluationContextsByContextID:(id)a3;
- (void)_setReplacementTrackersByContextID:(id)a3;
- (void)_setSetSessionTextViewDelegate:(id)a3;
- (void)_setShowingOriginal:(BOOL)a3;
- (void)_setStoredTargetedPreviewsByContextID:(id)a3;
- (void)_setStreamingContextIDs:(id)a3;
- (void)_setSynchronizingWithUndoRedo:(BOOL)a3;
- (void)_setUpTextEffectViewInContainer:(id)a3;
- (void)_setWrappingUpProofreadingSession:(BOOL)a3;
- (void)_setWritingToolsDelegateMessageInvocationBuffer:(id)a3;
- (void)_synchronizeSuggestionInfoStateForProofreadingSuggestionWithIdentifier:(uint64_t)a3 state:;
- (void)_undrawProofreadingHighlightsForProofreadingSuggestionID:(id)a3;
- (void)_undrawProofreadingUnderlinesForProofreadingSuggestionID:(id)a3;
- (void)_updateDelegateRespondsToFlags;
- (void)_updateForProofreadingSuggestion:(id)a3 state:(int64_t)a4 saveState:(BOOL)a5 inContext:(id)a6;
- (void)_updateProofreadingDeliveryWithReplacement:(id)a3 accordingToProofreadingSuggestionWithIdentifier:(id)a4 replacingCharactersInRange:(_NSRange)a5 newState:(int64_t)a6 contextID:(id)a7;
- (void)_updateProofreadingTextAndTrackerToShowOriginal:(BOOL)a3 inContextID:(id)a4;
- (void)_updateReplacementTrackerStartingAnimationsWithText:(id)a3 forRange:(_NSRange)a4 inContextWithID:(id)a5 finished:(BOOL)a6;
- (void)_updateReplacementTrackerWithText:(id)a3 forRange:(_NSRange)a4 inContext:(id)a5 finished:(BOOL)a6;
- (void)_updateSelectedRangeForCompositionIfFinishedInContext:(id)a3 force:(BOOL)a4;
- (void)_updateTextViewAndTrackerWithIncomingCompositionSessionState:(int64_t)a3 forDelivery:(id)a4 animationParameters:(id)a5 contextID:(id)a6 completion:(id)a7;
- (void)_updateToCompositionSessionState:(int64_t)a3 contextID:(id)a4;
- (void)_updateVisualizationForProofreadingSuggestion:(id)a3 previousState:(int64_t)a4 delta:(int64_t)a5 inContext:(id)a6;
- (void)_updateVisualizationForProofreadingSuggestionsForDelivery:(id)a3 inContext:(id)a4;
- (void)canGenerateTargetedPreviewForChunk:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4;
- (void)canGenerateTargetedPreviewsWithCompletionHandler:(id)a3;
- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4;
- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4;
- (void)didMoveToView:(id)a3;
- (void)finishAnimationFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4;
- (void)prepareForAnimationFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4;
- (void)proofreadingController:(id)a3 replaceCharactersInRange:(_NSRange)a4 attributedString:(id)a5 state:(int64_t)a6 identifier:(id)a7 completion:(id)a8;
- (void)proofreadingInteraction:(id)a3 receivedTapAtLocation:(CGPoint)a4;
- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6;
- (void)setDecorationContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectContainerView:(id)a3;
- (void)setPreferredBehavior:(int64_t)a3;
- (void)setPreferredResultOptions:(unint64_t)a3;
- (void)stopWritingTools;
- (void)targetedPreviewFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4;
- (void)updateForReflowedTextInContextWithIdentifier:(id)a3;
- (void)updateRange:(_NSRange)a3 withText:(id)a4 reason:(int64_t)a5 forContextWithIdentifier:(id)a6;
- (void)updateTextChunkVisibilityForAnimation:(_TtC5UIKit21UITextEffectTextChunk *)a3 visible:(BOOL)a4 completionHandler:(id)a5;
- (void)updatedTargetedPreviewGeometryFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 previous:(CGRect)a4 completionHandler:(id)a5;
- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4;
- (void)willMoveToView:(id)a3;
- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4;
@end

@implementation UIWritingToolsCoordinator

- (void)prepareForAnimationFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E8FB54E8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E8FB54F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_185AB6FE4((uint64_t)v9, (uint64_t)&unk_1E8FB54F8, (uint64_t)v14);
  swift_release();
}

- (void)finishAnimationFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E8FB54C8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E8FB54D0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_185AB6FE4((uint64_t)v9, (uint64_t)&unk_1E8FB54D8, (uint64_t)v14);
  swift_release();
}

- (void)canGenerateTargetedPreviewsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E8FB54A8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E8FB54B0;
  v12[5] = v11;
  v13 = self;
  sub_185AB6FE4((uint64_t)v7, (uint64_t)&unk_1E8FB54B8, (uint64_t)v12);
  swift_release();
}

- (void)canGenerateTargetedPreviewForChunk:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E8FB5488;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E8FB5490;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_185AB6FE4((uint64_t)v9, (uint64_t)&unk_1E8FB5498, (uint64_t)v14);
  swift_release();
}

- (void)targetedPreviewFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E8FB5468;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E8FB5470;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_185AB6FE4((uint64_t)v9, (uint64_t)&unk_1E8FB5478, (uint64_t)v14);
  swift_release();
}

- (void)updateTextChunkVisibilityForAnimation:(_TtC5UIKit21UITextEffectTextChunk *)a3 visible:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E8FB5448;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E8FB5450;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = self;
  sub_185AB6FE4((uint64_t)v11, (uint64_t)&unk_1E8FB5458, (uint64_t)v16);
  swift_release();
}

- (void)updatedTargetedPreviewGeometryFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 previous:(CGRect)a4 completionHandler:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a5);
  v16 = (CGFloat *)swift_allocObject();
  *((void *)v16 + 2) = a3;
  v16[3] = x;
  v16[4] = y;
  v16[5] = width;
  v16[6] = height;
  *((void *)v16 + 7) = v15;
  *((void *)v16 + 8) = self;
  uint64_t v17 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E8FB5438;
  v18[5] = v16;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1E8FB2B40;
  v19[5] = v18;
  v20 = a3;
  v21 = self;
  sub_185AB6FE4((uint64_t)v14, (uint64_t)&unk_1E8FB2B48, (uint64_t)v19);
  swift_release();
}

- (void)_setUpTextEffectViewInContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_185A1FE40(v4);
}

- (void)_beginTextAssistantAnticipationInContainer:(id)a3 context:(id)a4 animationCharacterRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  location = (void *)a5.location;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_185A203C8(v9, (uint64_t)v10, location, length);
}

- (void)_endTextAssistantAnticipationInContainerForLookupID:(id)a3
{
  uint64_t v3 = sub_186A1D70C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_186A1D6EC();
  sub_185A23B00((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)_animateRewrittenTextForDelivery:(id)a3 contextID:(id)a4 lookupID:(id)a5
{
  uint64_t v6 = sub_186A1D70C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v18 - v11;
  MEMORY[0x1F4188790](v13);
  v15 = (char *)&v18 - v14;
  sub_186A1D6EC();
  sub_186A1D6EC();
  sub_186A1D6EC();
  v16 = self;
  sub_185A20D64((uint64_t)v15, (uint64_t)v12, (uint64_t)v9);

  uint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v9, v6);
  v17(v12, v6);
  v17(v15, v6);
}

- (void)_setHasDeliveredReplacement:(BOOL)a3 forDeliveryID:(id)a4
{
  uint64_t v6 = sub_186A1D70C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_186A1D6EC();
  uint64_t v10 = self;
  uint64_t v11 = sub_185A2353C((uint64_t)v9, v10);
  if (v11)
  {
    uint64_t v12 = v11;
    swift_beginAccess();
    uint64_t v13 = (UIWritingToolsCoordinator *)*(id *)(v12 + 24);
    swift_release();
    type metadata accessor for _UIWTCReplacementChunk(0);
    uint64_t v14 = swift_dynamicCastClass();
    if (v14) {
      *(unsigned char *)(v14 + OBJC_IVAR____TtC5UIKit22_UIWTCReplacementChunk_hasDeliveredReplacement) = a3;
    }

    uint64_t v10 = v13;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)_invalidateReplacementForDeliveryID:(id)a3 animated:(BOOL)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_186A1D70C();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_186A1D6EC();
  uint64_t v12 = self;
  uint64_t v13 = sub_185A2353C((uint64_t)v11, v12);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = sub_186A1ECBC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
    sub_186A1EC9C();
    swift_retain();
    uint64_t v16 = sub_186A1EC8C();
    uint64_t v17 = (void *)swift_allocObject();
    uint64_t v18 = MEMORY[0x1E4FBCFD8];
    v17[2] = v16;
    v17[3] = v18;
    v17[4] = v14;
    sub_18596D2B4((uint64_t)v7, (uint64_t)&unk_1E8FB3218, (uint64_t)v17);

    swift_release();
    swift_release();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)_effectContainerCleanup
{
  v2 = self;
  sub_185A21B3C();
}

- (NSMutableDictionary)_storedTargetedPreviewsByContextID
{
  inFlightDeliveryID = self->_inFlightDeliveryID;
  if (!inFlightDeliveryID)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = self->_inFlightDeliveryID;
    self->_inFlightDeliveryID = v4;

    inFlightDeliveryID = self->_inFlightDeliveryID;
  }
  return (NSMutableDictionary *)inFlightDeliveryID;
}

- (void)_setInFlightDeliveryID:(id)a3
{
  uint64_t v5 = (NSMutableDictionary *)a3;
  if (v5 && self->_undoRollersByContextID)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:255 description:@"Only one in-flight delivery at a time"];
  }
  undoRollersByContextID = self->_undoRollersByContextID;
  self->_undoRollersByContextID = v5;
}

- (NSMutableDictionary)_undoRollersByContextID
{
  effectContainerView = self->_effectContainerView;
  if (!effectContainerView)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = self->_effectContainerView;
    self->_effectContainerView = v4;

    effectContainerView = self->_effectContainerView;
  }
  return (NSMutableDictionary *)effectContainerView;
}

- (void)_sessionCleanup
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__UIWritingToolsCoordinator__sessionCleanup__block_invoke;
  v4[3] = &unk_1E52DF528;
  objc_copyWeak(v5, &location);
  v5[1] = (id)a2;
  -[UIWritingToolsCoordinator _changeToState:postStateChangeActions:]((uint64_t)self, 0, v4);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __44__UIWritingToolsCoordinator__sessionCleanup__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setProposedEvaluationContextsByContextID:0];
    [v3 _setAcceptedEvaluationContextsByContextID:0];
    [v3 _effectContainerCleanup];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v4 = objc_msgSend(v3, "_effectContainerLookupIDs", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v32;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v32 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * v8);
          uint64_t v10 = [v3 _effectContainersByLookupID];
          uint64_t v11 = [v10 objectForKey:v9];
          -[UIWritingToolsCoordinator _setCrossReferenceLookupID:forView:]((uint64_t)v3, 0, v11);

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v6);
    }

    uint64_t v12 = [v3 _effectContainersByLookupID];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:*(void *)(a1 + 40) object:v3 file:@"UIWritingToolsCoordinator.m" lineNumber:283 description:@"Error removing lookup IDs"];
    }
    uint64_t v14 = [v3 _anticipationContainerInfosByContextID];
    [v14 removeAllObjects];

    [v3 _setActiveSessionUUID:0];
    [v3 _setReplacementTrackersByContextID:0];
    [v3 _setInFlightDeliveryID:0];
    [v3 _setProofreadingDeliverySuggestionIDs:0];
    uint64_t v15 = [v3 _proofreadingSuggestionIDsPerDeliveryIDByContextID];
    [v15 removeAllObjects];

    uint64_t v16 = [v3 _proofreadingInteraction];

    if (v16)
    {
      uint64_t v17 = [v3 view];
      uint64_t v18 = [v3 _proofreadingInteraction];
      [v17 removeInteraction:v18];

      [v3 _setProofreadingInteraction:0];
    }
    [v3 _setProofreadingSuggestionInfoBySuggestionID:0];
    [v3 _setChosenSuggestion:0];
    [v3 _setContextIDForChosenSuggestion:0];
    uint64_t v19 = [v3 _backingProofreadingSuggestionStatesPerSuggestionIDByContextID];
    [v19 removeAllObjects];

    v20 = [v3 _proofreadingHighlightInfoBySuggestionID];
    [v20 removeAllObjects];

    v21 = [v3 _proofreadingUnderlineInfoBySuggestionID];
    [v21 removeAllObjects];

    uint64_t v22 = [v3 _currentProofreadingTextPerContextID];
    [v22 removeAllObjects];

    [v3 _setProofreadingDeliveryOffset:0];
    [v3 _setProofreadingDeliveryReplacement:0];
    [v3 _setCancelingSession:0];
    [v3 _setSynchronizingWithUndoRedo:0];
    [v3 _setShowingOriginal:0];
    v23 = [v3 _writingToolsDelegateMessageInvocationBuffer];
    [v23 removeAllObjects];

    v24 = [v3 _streamingContextIDs];
    [v24 removeAllObjects];

    v25 = [v3 _storedTargetedPreviewsByContextID];
    [v25 removeAllObjects];

    v26 = [v3 _undoRollersByContextID];
    [v26 removeAllObjects];

    [v3 _setSetSessionTextViewDelegate:0];
    v27 = [v3 _pendingCompletionForWritingToolsWillBegin];

    if (v27)
    {
      v28 = [v3 _pendingSessionForWritingToolsWillBegin];
      v29 = [v3 _pendingCompletionForWritingToolsWillBegin];
      [v3 willBeginWritingToolsSession:v28 requestContexts:v29];
    }
  }
}

- (void)_setCrossReferenceLookupID:(void *)a3 forView:
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1 && v5)
  {
    id v7 = [v5 _effectContainerLookupID];
    id v8 = v11;
    uint64_t v9 = v8;
    if (v7 == v8)
    {

      goto LABEL_12;
    }
    if (v8 && v7)
    {
      char v10 = [v7 isEqual:v8];

      if (v10) {
        goto LABEL_12;
      }
      [v6 _setEffectContainerLookupID:v9];
    }
    else
    {

      [v6 _setEffectContainerLookupID:v9];
      if (!v9)
      {
        [*(id *)(a1 + 184) removeObjectForKey:0];
        if (!v7) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
    [*(id *)(a1 + 184) setObject:v6 forKey:v9];
    if (v7) {
LABEL_11:
    }
      [*(id *)(a1 + 184) removeObjectForKey:v7];
LABEL_12:
  }
}

- (void)_changeToState:(void *)a3 postStateChangeActions:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    if (*(void *)(a1 + 296) == a2)
    {
      (*((void (**)(id))v5 + 2))(v5);
    }
    else
    {
      if (os_variant_has_internal_diagnostics()
        && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
      {
        char v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &_changeToState_postStateChangeActions____s_category)+ 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          if (a2 > 3) {
            id v11 = @"unknown";
          }
          else {
            id v11 = off_1E52DF888[a2];
          }
          *(_DWORD *)id location = 138412546;
          *(void *)&location[4] = a1;
          __int16 v17 = 2112;
          uint64_t v18 = v11;
          uint64_t v12 = v10;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@, changing to state %@", location, 0x16u);
        }
      }
      objc_initWeak((id *)location, (id)a1);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__UIWritingToolsCoordinator__changeToState_postStateChangeActions___block_invoke;
      aBlock[3] = &unk_1E52DF6E0;
      objc_copyWeak(v15, (id *)location);
      v15[1] = (id)a2;
      id v14 = v6;
      id v7 = _Block_copy(aBlock);
      id v8 = v7;
      if (*(unsigned char *)(a1 + 8))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 288));
        [WeakRetained writingToolsCoordinator:a1 willChangeToState:a2 completion:v8];
      }
      else
      {
        (*((void (**)(void *))v7 + 2))(v7);
      }

      objc_destroyWeak(v15);
      objc_destroyWeak((id *)location);
    }
  }
}

- (void)_updateDelegateRespondsToFlags
{
  p_state = &self->_state;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

  id v5 = objc_loadWeakRetained((id *)p_state);
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFD | v6;

  id v7 = objc_loadWeakRetained((id *)p_state);
  if (objc_opt_respondsToSelector()) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFB | v8;

  id v9 = objc_loadWeakRetained((id *)p_state);
  if (v9)
  {
    id v10 = v9;
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIUseWTCDecorations, @"UIUseWTCDecorations") & 1) != 0|| byte_1E8FD4FAC)
    {
      goto LABEL_12;
    }
    id v11 = objc_loadWeakRetained((id *)p_state);
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_13;
    }
  }
  id v10 = objc_loadWeakRetained((id *)p_state);
  objc_storeWeak((id *)&self->_proposedEvaluationContextsByContextID, v10);
LABEL_12:

LABEL_13:
  id v13 = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);

  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v13)
  {
    if (has_internal_diagnostics)
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
      {
        if (byte_1E8FD4FA4)
        {
          uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &_MergedGlobals_972) + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            __int16 v19 = 0;
            uint64_t v16 = "Proofreading decorations drawn through UITextSelectionDisplayInteraction";
            __int16 v17 = (uint8_t *)&v19;
LABEL_25:
            _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
          }
        }
      }
    }
  }
  else if (has_internal_diagnostics)
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
    {
      if (byte_1E8FD4FA4)
      {
        uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &qword_1EB25F2B8) + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          __int16 v18 = 0;
          uint64_t v16 = "Proofreading decorations drawn through UIWritingToolsCoordinator";
          __int16 v17 = (uint8_t *)&v18;
          goto LABEL_25;
        }
      }
    }
  }
}

- (UIWritingToolsCoordinator)init
{
  v20.receiver = self;
  v20.super_class = (Class)UIWritingToolsCoordinator;
  v2 = [(UIWritingToolsCoordinator *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    currentProofreadingTextPerContextID = v2->_currentProofreadingTextPerContextID;
    v2->_currentProofreadingTextPerContextID = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    chosenSuggestion = v2->_chosenSuggestion;
    v2->_chosenSuggestion = (NSWritingToolsProofreadingSuggestion *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    proofreadingUnderlineInfoBySuggestionID = v2->_proofreadingUnderlineInfoBySuggestionID;
    v2->_proofreadingUnderlineInfoBySuggestionID = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    streamingContextIDs = v2->_streamingContextIDs;
    v2->_streamingContextIDs = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    proofreadingHighlightInfoBySuggestionID = v2->_proofreadingHighlightInfoBySuggestionID;
    v2->_proofreadingHighlightInfoBySuggestionID = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    proofreadingSuggestionInfoBySuggestionID = v2->_proofreadingSuggestionInfoBySuggestionID;
    v2->_proofreadingSuggestionInfoBySuggestionID = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    proofreadingSuggestionIDsPerDeliveryIDByContextID = v2->_proofreadingSuggestionIDsPerDeliveryIDByContextID;
    v2->_proofreadingSuggestionIDsPerDeliveryIDByContextID = (NSMutableDictionary *)v15;

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id pendingCompletionForWritingToolsWillBegin = v2->_pendingCompletionForWritingToolsWillBegin;
    v2->_id pendingCompletionForWritingToolsWillBegin = v17;
  }
  return v2;
}

- (UIWritingToolsCoordinator)initWithDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIWritingToolsCoordinator *)self init];
  char v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_state, v4);
    [(UIWritingToolsCoordinator *)v6 _updateDelegateRespondsToFlags];
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_state);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_state, obj);
    [(UIWritingToolsCoordinator *)self _updateDelegateRespondsToFlags];
    uint64_t v5 = obj;
  }
}

- (void)setEffectContainerView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decorationContainerView);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    if (self->_preferredBehavior) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Changing effectContainerView only permitted for UIWritingToolsCoordinator.State.inactive"];
    }
    objc_storeWeak((id *)&self->_decorationContainerView, obj);
    uint64_t v5 = obj;
  }
}

- (UIView)effectContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decorationContainerView);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    id v5 = [(UIWritingToolsCoordinator *)self view];
  }
  char v6 = v5;

  return (UIView *)v6;
}

- (void)setDecorationContainerView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    if (self->_preferredBehavior) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Changing decorationContainerView only permitted for UIWritingToolsCoordinator.State.inactive"];
    }
    objc_storeWeak((id *)&self->_view, obj);
    id v5 = obj;
  }
}

- (UIView)decorationContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    id v5 = [(UIWritingToolsCoordinator *)self view];
  }
  char v6 = v5;

  return (UIView *)v6;
}

- (int64_t)behavior
{
  int64_t result = [(UIWritingToolsCoordinator *)self preferredBehavior];
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (unint64_t)resultOptions
{
  unint64_t result = [(UIWritingToolsCoordinator *)self preferredResultOptions];
  if (!result)
  {
    id v4 = [(UIWritingToolsCoordinator *)self view];
    unint64_t v5 = [v4 _defaultWritingToolsResultOptions];

    return v5;
  }
  return result;
}

- (void)updateRange:(_NSRange)a3 withText:(id)a4 reason:(int64_t)a5 forContextWithIdentifier:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  v52 = self;
  id v14 = [(UIWritingToolsCoordinator *)self _undoRollersByContextID];
  v53 = v13;
  uint64_t v15 = [v14 objectForKeyedSubscript:v13];

  if (a5 != 1 && v15) {
    [(UIWritingToolsCoordinator *)self _finishUndoRedoChangesForContextID:v53];
  }
  if (length || [v12 length])
  {
    v50 = v15;
    v49 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v53];
    unint64_t v17 = [(UIWritingToolsCoordinator *)self _adjustedResolvedRangeForContextWithIdentifier:v53];
    uint64_t v18 = v16;
    if (location <= v17 + v16)
    {
      if (a5 == 1 || location + length <= v17 + v16)
      {
        v26 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v53];
        v27 = v26;
        if (a5 == 1)
        {
          if (!v15)
          {
            v28 = [_UIWTCUndoRoller alloc];
            v29 = [v27 activeText];
            uint64_t v15 = [(_UIWTCUndoRoller *)v28 initWithEvaluatedText:v29 offset:v17];

            v30 = [(UIWritingToolsCoordinator *)v52 _undoRollersByContextID];
            [v30 setObject:v15 forKeyedSubscript:v53];
          }
          -[_UIWTCUndoRoller replaceRange:withText:](v15, "replaceRange:withText:", location, length, v12);
          if ([(_UIWTCUndoRoller *)v15 hasFouled]) {
            [(UIWritingToolsCoordinator *)v52 stopWritingTools];
          }
        }
        else
        {
          if (([v26 isRewriting] & 1) != 0 || location < v17)
          {
            [(UIWritingToolsCoordinator *)self stopWritingTools];
          }
          else
          {
            v47 = [(NSMutableDictionary *)self->_proofreadingSuggestionIDsPerDeliveryIDByContextID objectForKeyedSubscript:v53];
            objc_msgSend(v47, "replaceCharactersInRange:withAttributedString:", location, length, v12);
            v48 = v27;
            long long v31 = [v27 proofreadingController];
            NSUInteger v32 = [v12 length] - length;
            long long v33 = [v31 editTracker];
            objc_msgSend(v33, "addEditForRange:lengthDelta:", location, length, v32);

            long long v56 = 0u;
            long long v57 = 0u;
            uint64_t v46 = (v32 + location) & ~((uint64_t)(v32 + location) >> 63);
            long long v54 = 0u;
            long long v55 = 0u;
            id obj = [v31 suggestions];
            uint64_t v34 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
            if (v34)
            {
              uint64_t v35 = v34;
              uint64_t v36 = *(void *)v55;
              do
              {
                for (uint64_t i = 0; i != v35; ++i)
                {
                  if (*(void *)v55 != v36) {
                    objc_enumerationMutation(obj);
                  }
                  v38 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                  v39 = [v31 editTracker];
                  uint64_t v40 = [v38 originalRange];
                  uint64_t v42 = v41;
                  v43 = [v38 uuid];
                  uint64_t v44 = objc_msgSend(v39, "rangeOfSuggestionWithRange:UUID:applyDelta:", v40, v42, v43, 0);

                  if (v44 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v45 = [v38 uuid];
                    [(UIWritingToolsCoordinator *)v52 _invalidateProofreadingSuggestionWithUUID:v45 contextID:v53];
                  }
                }
                uint64_t v35 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
              }
              while (v35);
            }

            [(UIWritingToolsCoordinator *)v52 _resetProofreadingDecorationsForSuggestionsFollowingChangeLocationIndex:v46 inContext:v53];
            v27 = v48;
          }
          uint64_t v15 = v50;
        }
      }
      else
      {
        v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("WritingToolsCoordinator", &qword_1EB25F2C8) + 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = v23;
          v25 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 134219010;
          NSUInteger v60 = location;
          __int16 v61 = 2048;
          NSUInteger v62 = length;
          __int16 v63 = 2112;
          v64 = v25;
          __int16 v65 = 2048;
          unint64_t v66 = v17;
          __int16 v67 = 2048;
          uint64_t v68 = v18;
          _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "UIWritingToolsCoordinator can't update for range, {%lu, %lu}, passed in %@ that overflows the adjusted resolvedRange, {%lu, %lu}. Stopping Writing Tools", buf, 0x34u);
        }
        [(UIWritingToolsCoordinator *)self stopWritingTools];
      }
    }
    else
    {
      __int16 v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("WritingToolsCoordinator", &qword_1EB25F2C0) + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_super v20 = v19;
        NSStringFromSelector(a2);
        uint64_t v22 = v21 = v12;
        *(_DWORD *)buf = 134219010;
        NSUInteger v60 = location;
        __int16 v61 = 2048;
        NSUInteger v62 = length;
        __int16 v63 = 2112;
        v64 = v22;
        __int16 v65 = 2048;
        unint64_t v66 = v17;
        __int16 v67 = 2048;
        uint64_t v68 = v18;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "UIWritingToolsCoordinator ignoring range, {%lu, %lu}, passed in %@ that's after the adjusted resolvedRange, {%lu, %lu}.", buf, 0x34u);

        id v12 = v21;
      }
    }
  }
}

- (void)_finishUndoRedoChangesForContextID:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v4];
  BOOL v6 = [(UIWritingToolsCoordinator *)self _showingOriginal];
  uint64_t v7 = [(UIWritingToolsCoordinator *)self _undoRollersByContextID];
  char v8 = [v7 objectForKeyedSubscript:v4];

  if (v8)
  {
    BYTE1(self->_bridgingDelegate) = 1;
    if ([v8 hasFouled])
    {
      if (os_variant_has_internal_diagnostics()
        && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
      {
        uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB25F2D0) + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long v33 = 0;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "_undoRoller fouled while attempting to synchronize with original vs. rewritten text", v33, 2u);
        }
      }
      goto LABEL_35;
    }
    int v10 = [v5 isProofreading];
    uint64_t v11 = [v8 rolledReplacement];
    id v12 = v11;
    if (v10)
    {
      id v13 = [v11 string];
      if (v6)
      {
        id v14 = [v5 activeText];
        uint64_t v15 = [v14 string];
        int v16 = [v13 isEqualToString:v15];

        if (v16)
        {
          [(UIWritingToolsCoordinator *)self _updateProofreadingTextAndTrackerToShowOriginal:0 inContextID:v4];
          goto LABEL_36;
        }
LABEL_22:
        if (!os_variant_has_internal_diagnostics()
          || ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) != 0|| !byte_1E8FD4F9C)&& ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) != 0|| !byte_1E8FD4FA4))
        {
          goto LABEL_35;
        }
        v27 = *(id *)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB25F2D8) + 8);
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          goto LABEL_50;
        }
        if (v6) {
          v28 = @"rewritten text";
        }
        else {
          v28 = @"original text";
        }
        v29 = v5;
        if (v6)
        {
LABEL_47:
          [v29 rewrittenText];
          long long v31 = LABEL_49:;
          NSUInteger v32 = [v8 rolledReplacement];
          *(_DWORD *)long long v33 = 138412802;
          *(void *)&v33[4] = v28;
          *(_WORD *)&v33[12] = 2112;
          *(void *)&v33[14] = v31;
          *(_WORD *)&v33[22] = 2112;
          uint64_t v34 = v32;
          _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "_undoRoller failed to synchronize with original vs. rewritten text.\nExpected a match to %@\n%@\nReceived\n%@", v33, 0x20u);

LABEL_50:
          goto LABEL_35;
        }
LABEL_48:
        [v5 originalText];
        goto LABEL_49;
      }
      __int16 v19 = [v5 originalText];
      objc_super v20 = [v19 string];
      int v21 = [v13 isEqualToString:v20];

      if (!v21) {
        goto LABEL_22;
      }
      [(UIWritingToolsCoordinator *)self _updateProofreadingTextAndTrackerToShowOriginal:1 inContextID:v4];
    }
    else
    {
      int v17 = [v5 selectRewriteMatchingUndoRedoReplacementText:v11];

      if (v17)
      {
        if (!v6)
        {
          [(UIWritingToolsCoordinator *)self _updateToCompositionSessionState:2 contextID:v4];
          goto LABEL_36;
        }
        uint64_t v18 = [v5 numberOfPreviousRewrittenTexts];
        [(UIWritingToolsCoordinator *)self _updateToCompositionSessionState:2 contextID:v4];
        if (v18)
        {
LABEL_36:
          BYTE1(self->_bridgingDelegate) = 0;
          v30 = [(UIWritingToolsCoordinator *)self _undoRollersByContextID];
          [v30 setObject:0 forKeyedSubscript:v4];

          goto LABEL_37;
        }
      }
      else
      {
        uint64_t v22 = [v8 rolledReplacement];
        v23 = [v22 string];
        v24 = [v5 originalText];
        v25 = [v24 string];
        int v26 = [v23 isEqualToString:v25];

        if (!v26)
        {
          if (!os_variant_has_internal_diagnostics()
            || ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) != 0|| !byte_1E8FD4F9C)&& ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) != 0|| !byte_1E8FD4FA4))
          {
            goto LABEL_35;
          }
          v27 = objc_retain(*(id *)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB25F2E0)
                                              + 8));
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            goto LABEL_50;
          }
          if (v6) {
            v28 = @"rewritten text";
          }
          else {
            v28 = @"original text";
          }
          v29 = v5;
          if (v6) {
            goto LABEL_47;
          }
          goto LABEL_48;
        }
        [(UIWritingToolsCoordinator *)self _updateToCompositionSessionState:1 contextID:v4];
      }
    }
LABEL_35:
    [(UIWritingToolsCoordinator *)self stopWritingTools];
    goto LABEL_36;
  }
LABEL_37:
}

- (void)updateForReflowedTextInContextWithIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_anticipationContainerInfosByContextID, "objectForKeyedSubscript:");
  if ([v4 isProofreading])
  {
    unint64_t v5 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v6];
    -[UIWritingToolsCoordinator _resetProofreadingDecorationsForSuggestionsFollowingChangeLocationIndex:inContext:](self, "_resetProofreadingDecorationsForSuggestionsFollowingChangeLocationIndex:inContext:", [v5 evaluatedRange], v6);
  }
}

- (NSString)description
{
  v11.receiver = self;
  v11.super_class = (Class)UIWritingToolsCoordinator;
  uint64_t v3 = [(UIWritingToolsCoordinator *)&v11 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = objc_loadWeakRetained((id *)&self->_state);
  id v6 = v5;
  unint64_t preferredBehavior = self->_preferredBehavior;
  if (preferredBehavior > 3) {
    char v8 = @"unknown";
  }
  else {
    char v8 = off_1E52DF888[preferredBehavior];
  }
  uint64_t v9 = [v3 stringByAppendingFormat:@" view=%p delegate=%p state=%@", WeakRetained, v5, v8];

  return (NSString *)v9;
}

- (_NSRange)_adjustedResolvedRangeForContextWithIdentifier:(id)a3
{
  replacementTrackersByContextID = self->_replacementTrackersByContextID;
  id v5 = a3;
  id v6 = [(NSDictionary *)replacementTrackersByContextID objectForKeyedSubscript:v5];
  uint64_t v7 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v5];

  uint64_t v9 = [v6 resolvedRange];
  if (BYTE3(self->_bridgingDelegate))
  {
    uint64_t v10 = v8;
  }
  else
  {
    if ([v7 isProofreading])
    {
      objc_super v11 = [v7 proofreadingController];
      id v12 = [v11 editTracker];
      [v12 currentContextRange];
      uint64_t v10 = v13;
    }
    else
    {
      objc_super v11 = [v7 activeText];
      uint64_t v10 = [v11 length];
    }
  }
  NSUInteger v14 = v9;
  NSUInteger v15 = v10;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (BOOL)isEditable
{
  p_state = &self->_state;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_state);
  char v6 = [v5 isEditable];

  return v6;
}

- (void)didMoveToView:(id)a3
{
  id obj = a3;
  [obj _setWritingToolsCoordinator:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decorationContainerView);

  if (!WeakRetained) {
    objc_storeWeak((id *)&self->_decorationContainerView, obj);
  }
  p_view = &self->_view;
  id v6 = objc_loadWeakRetained((id *)p_view);

  if (!v6) {
    objc_storeWeak((id *)p_view, obj);
  }
}

- (void)willMoveToView:(id)a3
{
  id obj = a3;
  if (self->_activeReviewingUUID)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained removeInteraction:self->_activeReviewingUUID];
  }
  id v5 = objc_loadWeakRetained((id *)&self->_decorationContainerView);
  p_delegate = &self->_delegate;
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);

  if (v5 == v7) {
    objc_storeWeak((id *)&self->_decorationContainerView, 0);
  }
  p_view = &self->_view;
  id v9 = objc_loadWeakRetained((id *)p_view);
  id v10 = objc_loadWeakRetained((id *)p_delegate);

  if (v9 == v10) {
    objc_storeWeak((id *)p_view, 0);
  }
  id v11 = objc_loadWeakRetained((id *)p_delegate);
  [v11 _setWritingToolsCoordinator:0];

  objc_storeWeak((id *)p_delegate, obj);
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_opt_class())
  {
    if (self->_undoRollersByContextID)
    {
      [(UIWritingToolsCoordinator *)self _setPendingCompletionForWritingToolsWillBegin:v8];
      [(UIWritingToolsCoordinator *)self _setPendingSessionForWritingToolsWillBegin:v7];
    }
    else
    {
      if (self->_writingToolsDelegateMessageInvocationBuffer)
      {
        NSUInteger v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:616 description:@"New writing tools session starting without having ended the previous session"];
      }
      [(UIWritingToolsCoordinator *)self _setPendingCompletionForWritingToolsWillBegin:0];
      [(UIWritingToolsCoordinator *)self _setPendingSessionForWritingToolsWillBegin:0];
      objc_initWeak(buf, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__UIWritingToolsCoordinator_willBeginWritingToolsSession_requestContexts___block_invoke;
      aBlock[3] = &unk_1E52DF578;
      objc_copyWeak(&v19, buf);
      id v18 = v8;
      id v10 = v7;
      id v17 = v10;
      id v11 = _Block_copy(aBlock);
      id v12 = [v10 uuid];
      writingToolsDelegateMessageInvocationBuffer = self->_writingToolsDelegateMessageInvocationBuffer;
      self->_writingToolsDelegateMessageInvocationBuffer = v12;

      if (v10) {
        unint64_t v14 = 2;
      }
      else {
        unint64_t v14 = 1;
      }
      -[UIWritingToolsCoordinator _changeToState:postStateChangeActions:]((uint64_t)self, v14, v11);

      objc_destroyWeak(&v19);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistant", &willBeginWritingToolsSession_requestContexts____s_category)+ 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "The WritingTools framework is not available", (uint8_t *)buf, 2u);
    }
  }
}

void __74__UIWritingToolsCoordinator_willBeginWritingToolsSession_requestContexts___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3) {
      BOOL v4 = [v3 compositionSessionType] == 10;
    }
    else {
      BOOL v4 = 0;
    }
    id v5 = [WeakRetained delegate];
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F1CA60] dictionary];
      v15[0] = 0;
      v15[1] = v15;
      id v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__22;
      v15[4] = __Block_byref_object_dispose__22;
      id v16 = 0;
      id v7 = [MEMORY[0x1E4F1CA60] dictionary];
      objc_initWeak(&location, WeakRetained);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__UIWritingToolsCoordinator_willBeginWritingToolsSession_requestContexts___block_invoke_65;
      v9[3] = &unk_1E52DF550;
      objc_copyWeak(&v13, &location);
      id v11 = *(id *)(a1 + 40);
      id v12 = v15;
      id v8 = v6;
      id v10 = v8;
      [v5 writingToolsCoordinator:WeakRetained requestsContextsForScope:v4 completion:v9];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);

      _Block_object_dispose(v15, 8);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __74__UIWritingToolsCoordinator_willBeginWritingToolsSession_requestContexts___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = [v3 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          unint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          NSUInteger v15 = [v14 identifier];
          [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v15];
          id v16 = [v14 _wtContext];
          [v5 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v17 = (void *)[*(id *)(a1 + 32) copy];
    [WeakRetained _setProposedEvaluationContextsByContextID:v17];

    if ([v5 count])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __74__UIWritingToolsCoordinator_willBeginWritingToolsSession_requestContexts___block_invoke_2;
      v18[3] = &unk_1E52DB330;
      id v20 = *(id *)(a1 + 40);
      id v19 = v5;
      -[UIWritingToolsCoordinator _changeToState:postStateChangeActions:]((uint64_t)WeakRetained, 0, v18);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __74__UIWritingToolsCoordinator_willBeginWritingToolsSession_requestContexts___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v7 = a4;
  if (![v7 count])
  {
    uint64_t v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:690 description:@"Can't have begun a writing tools session without any contexts"];
  }
  v52 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v59;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v59 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v58 + 1) + 8 * v12);
        unint64_t v14 = [v13 uuid];
        NSUInteger v15 = [(NSDictionary *)self->_acceptedEvaluationContextsByContextID objectForKeyedSubscript:v14];
        id v16 = v15;
        if (v15)
        {
          [v15 _setWTContext:v13];
          uint64_t v17 = [v13 range];
          objc_msgSend(v16, "_setEvaluatedRange:", v17, v18);
          [v52 setObject:v16 forKeyedSubscript:v14];
          [v8 addObject:v16];
        }
        else if (os_variant_has_internal_diagnostics())
        {
          id v20 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v14;
            _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Couldn't match up evaluation context with identifier: %@", buf, 0xCu);
          }
        }
        else
        {
          id v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F2E8) + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v14;
            _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Couldn't match up evaluation context with identifier: %@", buf, 0xCu);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v21 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
      uint64_t v10 = v21;
    }
    while (v21);
  }

  long long v22 = (NSDictionary *)[v52 copy];
  long long v23 = self;
  replacementTrackersByContextID = self->_replacementTrackersByContextID;
  self->_replacementTrackersByContextID = v22;

  v25 = [v47 textViewDelegate];
  [(UIWritingToolsCoordinator *)self _setSetSessionTextViewDelegate:v25];

  uint64_t v26 = [v47 type];
  uint64_t v27 = v26;
  if (v26 == 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
      {
        if (byte_1E8FD4FA4)
        {
          v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &qword_1EB25F2F0) + 8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v8;
            v29 = "Begin proofread of evaluation contexts, %@";
LABEL_31:
            _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);
          }
        }
      }
    }
  }
  else if (v26 == 2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
      {
        if (byte_1E8FD4F9C)
        {
          v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB25F2F8) + 8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v8;
            v29 = "Begin rewrite of evaluation contexts, %@";
            goto LABEL_31;
          }
        }
      }
    }
  }
  else
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"UIWritingToolsCoordinator.m", 716, @"Unimplemented writing tools session type, %li", v27 object file lineNumber description];
  }
  v51 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v48 = v8;
  uint64_t v53 = [v48 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v53)
  {
    uint64_t v50 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v55 != v50) {
          objc_enumerationMutation(v48);
        }
        NSUInteger v32 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        long long v33 = [v32 identifier];
        uint64_t v34 = [v32 evaluatedRange];
        uint64_t v36 = v35;
        uint64_t v37 = v27;
        if (v27 == 1)
        {
          id v38 = objc_alloc((Class)off_1E52D2F88);
          v39 = [v32 attributedString];
          uint64_t v40 = objc_msgSend(v38, "initWithContextString:contextRange:delegate:", v39, v34, v36, v23);

          [v40 _setWritingToolsContextID:v33];
        }
        else
        {
          uint64_t v40 = 0;
        }
        uint64_t v41 = v23;
        uint64_t v42 = [_UITextAssistantReplacementTracker alloc];
        v43 = [v32 _wtContext];
        id v44 = [(_UITextAssistantReplacementTracker *)v42 initFromSessionContext:v43 offsetForSessionRange:0 withProofreadingController:v40];

        [v51 setObject:v44 forKey:v33];
        -[UIWritingToolsCoordinator _beginTextAssistantAnticipationsForRange:inContext:](v41, "_beginTextAssistantAnticipationsForRange:inContext:", v34, v36, v32);

        long long v23 = v41;
        uint64_t v27 = v37;
      }
      uint64_t v53 = [v48 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v53);
  }

  v45 = (void *)[v51 copy];
  [(UIWritingToolsCoordinator *)v23 _setReplacementTrackersByContextID:v45];

  -[UIWritingToolsCoordinator _changeToState:postStateChangeActions:]((uint64_t)v23, 3uLL, &__block_literal_global_73);
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  BOOL v4 = a4;
  v40[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(NSDictionary *)self->_replacementTrackersByContextID keyEnumerator];
  uint64_t v9 = [v8 allObjects];
  [(UIWritingToolsCoordinator *)self _endTextAssistantAnticipationsForContextIDs:v9];

  [self->_pendingCompletionForWritingToolsWillBegin removeAllObjects];
  if (!self->_undoRollersByContextID)
  {
    objc_initWeak(&location, self);
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    NSUInteger v32 = __64__UIWritingToolsCoordinator_didEndWritingToolsSession_accepted___block_invoke;
    long long v33 = &unk_1E52DC308;
    objc_copyWeak(&v34, &location);
    id v13 = (void (**)(void))_Block_copy(&v30);
    if (objc_msgSend(v7, "type", v30, v31, v32, v33) == 1)
    {
      [(UIWritingToolsCoordinator *)self _didEndProofreadingSession:v7 accepted:v4 completion:v13];
    }
    else
    {
      if ([v7 type] == 2)
      {
        [(UIWritingToolsCoordinator *)self _didEndRewritingSession:v7 accepted:v4];
      }
      else
      {
        if (!os_variant_has_internal_diagnostics()) {
          goto LABEL_10;
        }
        int v20 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging");
        int v21 = byte_1E8FD4F9C ? v20 : 1;
        if (v21 == 1)
        {
          char v22 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging");
          char v23 = byte_1E8FD4FA4 ? v22 : 1;
          if (v23) {
            goto LABEL_10;
          }
        }
        if (os_variant_has_internal_diagnostics())
        {
          int v24 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging");
          int v25 = byte_1E8FD4F9C ? v24 : 1;
          if (v25 != 1
            || ((char v26 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging"), !byte_1E8FD4FA4)? (v27 = 1): (v27 = v26), (v27 & 1) == 0))
          {
            v28 = objc_retain(*(id *)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB25F308)
                                                + 8));
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              uint64_t v29 = [v7 type];
              *(_DWORD *)buf = 134218242;
              uint64_t v37 = v29;
              __int16 v38 = 2112;
              v39 = self;
              _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Could not end unexpected Writing Tools session type, %lu, for %@", buf, 0x16u);
            }
          }
        }
      }
      v13[2](v13);
    }
LABEL_10:

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
  v40[0] = v7;
  uint64_t v10 = [NSNumber numberWithBool:v4];
  v40[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  uint64_t v12 = [(UIWritingToolsCoordinator *)self _bufferInvocationForSelector:a2 arguments:v11];

  if (os_variant_has_internal_diagnostics())
  {
    int v14 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging");
    int v15 = byte_1E8FD4F9C ? v14 : 1;
    if (v15 != 1
      || ((v16 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging"), !byte_1E8FD4FA4)? (char v17 = 1): (char v17 = v16), (v17 & 1) == 0))
    {
      uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB25F300) + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = @"reverted";
        if (v4) {
          id v19 = @"accepted";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v37 = (uint64_t)v19;
        __int16 v38 = 2112;
        v39 = v12;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Ending session with delivery in flight, %@. Deferring until most recent delivery lands. %@", buf, 0x16u);
      }
    }
  }

LABEL_11:
}

void __64__UIWritingToolsCoordinator_didEndWritingToolsSession_accepted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _sessionCleanup];
    id WeakRetained = v2;
  }
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  writingToolsDelegateMessageInvocationBuffer = self->_writingToolsDelegateMessageInvocationBuffer;
  id v33 = v7;
  uint64_t v9 = [v7 uuid];
  _confirmMatchingWritingToolsSession(writingToolsDelegateMessageInvocationBuffer, v9, a2);

  if (self->_undoRollersByContextID)
  {
    v45[0] = v33;
    uint64_t v10 = [NSNumber numberWithInteger:a4];
    v45[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    uint64_t v12 = [(UIWritingToolsCoordinator *)self _bufferInvocationForSelector:a2 arguments:v11];

    if (os_variant_has_internal_diagnostics())
    {
      int v25 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging");
      int v26 = byte_1E8FD4F9C ? v25 : 1;
      if (v26 != 1
        || ((char v27 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging"), !byte_1E8FD4FA4)? (v28 = 1): (v28 = v27), (v28 & 1) == 0))
      {
        uint64_t v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &writingToolsSession_didReceiveAction____s_category)+ 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          if (a4 == 1)
          {
            uint64_t v30 = @"ShowOriginal";
          }
          else if (a4 == 2)
          {
            uint64_t v30 = @"ShowRewritten";
          }
          else
          {
            uint64_t v30 = @"<unrecognized>";
            if (a4 == 3) {
              uint64_t v30 = @"CompositionRestart";
            }
          }
          *(_DWORD *)id location = 138412546;
          *(void *)&location[4] = v30;
          __int16 v43 = 2112;
          id v44 = v12;
          _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Packaged up Writing Tools action, %@, to deliver after animation finishes, %@", location, 0x16u);
        }
      }
    }
  }
  else if ([v33 type] == 2)
  {
    if ((unint64_t)(a4 - 1) >= 3)
    {
      char v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:785 description:@"UITextAssistantManager received unknown composition action"];

      uint64_t v13 = -1;
    }
    else
    {
      uint64_t v13 = qword_186B938F8[a4 - 1];
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v18 = [(NSDictionary *)self->_replacementTrackersByContextID keyEnumerator];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          char v23 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v22];
          if ([v23 compositionSessionState] | v13)
          {
            uint64_t v40 = v22;
            int v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
            [(UIWritingToolsCoordinator *)self _endTextAssistantAnticipationsForContextIDs:v24];

            [(UIWritingToolsCoordinator *)self _updateToCompositionSessionState:v13 contextID:v22];
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v19);
    }
  }
  else
  {
    int v14 = [(NSDictionary *)self->_replacementTrackersByContextID keyEnumerator];
    int v15 = [v14 allObjects];
    [(UIWritingToolsCoordinator *)self _endTextAssistantAnticipationsForContextIDs:v15];

    if ([v33 type] != 1)
    {
      uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:798 description:@"UITextAssistantManager received action for unknown session type"];
    }
    if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      NSUInteger v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:799 description:@"UITextAssistantManager received unknown proofreading action"];
    }
    else
    {
      objc_initWeak((id *)location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__UIWritingToolsCoordinator_writingToolsSession_didReceiveAction___block_invoke;
      aBlock[3] = &unk_1E52DF5A0;
      objc_copyWeak(v35, (id *)location);
      void aBlock[4] = self;
      v35[1] = (id)a4;
      char v16 = _Block_copy(aBlock);
      -[UIWritingToolsCoordinator _changeToState:postStateChangeActions:]((uint64_t)self, 3uLL, v16);

      objc_destroyWeak(v35);
      objc_destroyWeak((id *)location);
    }
  }
}

void __66__UIWritingToolsCoordinator_writingToolsSession_didReceiveAction___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "keyEnumerator", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [WeakRetained _updateProofreadingTextAndTrackerToShowOriginal:*(void *)(a1 + 48) == 1 inContextID:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    -[UIWritingToolsCoordinator _changeToState:postStateChangeActions:]((uint64_t)WeakRetained, 2uLL, &__block_literal_global_113);
  }
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v36 = a7;
  v55[5] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = (__CFString *)a4;
  id v13 = a6;
  if (self->_replacementTrackersByContextID)
  {
    id v38 = v13;
    writingToolsDelegateMessageInvocationBuffer = self->_writingToolsDelegateMessageInvocationBuffer;
    int v15 = [v11 uuid];
    _confirmMatchingWritingToolsSession(writingToolsDelegateMessageInvocationBuffer, v15, a2);

    if (self->_undoRollersByContextID)
    {
      v55[0] = v11;
      char v16 = v12;
      if (!v12) {
        char v16 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
      }
      v55[1] = v16;
      char v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a5.location, a5.length);
      v55[2] = v17;
      v55[3] = v38;
      uint64_t v18 = [NSNumber numberWithBool:v36];
      v55[4] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:5];
      id v20 = [(UIWritingToolsCoordinator *)self _bufferInvocationForSelector:a2 arguments:v19];

      if (!v12) {
      if (os_variant_has_internal_diagnostics())
      }
      {
        char v21 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging");
        char v22 = byte_1E8FD4F9C ? v21 : 1;
        if ((v22 & 1) == 0)
        {
          char v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB25F310) + 8);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            int v24 = &stru_1ED0E84C0;
            *(_DWORD *)buf = 138413314;
            NSUInteger v46 = (NSUInteger)v20;
            __int16 v47 = 2048;
            if (v36) {
              int v24 = @" [FINISHED]";
            }
            NSUInteger location = a5.location;
            __int16 v49 = 2048;
            NSUInteger length = a5.length;
            __int16 v51 = 2112;
            v52 = v12;
            __int16 v53 = 2112;
            long long v54 = v24;
            _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Packaged up composition replacement to deliver after animation finishes, %@\n\trange={%lu, %lu} replacement=%@%@", buf, 0x34u);
          }
        }
      }
    }
    else
    {
      int v25 = [v38 uuid];
      int v26 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v25];
      if ([v26 isFinished])
      {
        if (os_variant_has_internal_diagnostics())
        {
          uint64_t v35 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v35, OS_LOG_TYPE_FAULT, "Received a composition update after WritingTools previously signaled that composition updates had finished. This is a WritingTools error", buf, 2u);
          }
        }
        else
        {
          char v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F318) + 8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Received a composition update after WritingTools previously signaled that composition updates had finished. This is a WritingTools error", buf, 2u);
          }
        }
      }
      if (os_variant_has_internal_diagnostics())
      {
        char v29 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging");
        char v30 = byte_1E8FD4F9C ? v29 : 1;
        if ((v30 & 1) == 0)
        {
          uint64_t v31 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &qword_1EB25F320) + 8);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            NSUInteger v32 = v31;
            uint64_t v33 = [(__CFString *)v12 length];
            id v34 = &stru_1ED0E84C0;
            *(_DWORD *)buf = 134218754;
            NSUInteger v46 = a5.location;
            if (v36) {
              id v34 = @" FINISHED";
            }
            __int16 v47 = 2048;
            NSUInteger location = a5.length;
            __int16 v49 = 2048;
            NSUInteger length = v33;
            __int16 v51 = 2112;
            v52 = v34;
            _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "composition session will replace range {%lu, %lu} with text of length %lu.%@", buf, 0x2Au);
          }
        }
      }
      [(NSMapTable *)self->_effectContainersByLookupID addObject:v25];
      objc_initWeak((id *)buf, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __99__UIWritingToolsCoordinator_compositionSession_didReceiveText_replacementRange_inContext_finished___block_invoke;
      aBlock[3] = &unk_1E52DF5C8;
      objc_copyWeak(&v42, (id *)buf);
      uint64_t v40 = v12;
      _NSRange v43 = a5;
      id v20 = v25;
      id v41 = v20;
      BOOL v44 = v36;
      char v27 = _Block_copy(aBlock);
      -[UIWritingToolsCoordinator _changeToState:postStateChangeActions:]((uint64_t)self, 3uLL, v27);

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
    id v13 = v38;
  }
}

void __99__UIWritingToolsCoordinator_compositionSession_didReceiveText_replacementRange_inContext_finished___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateReplacementTrackerStartingAnimationsWithText:forRange:inContextWithID:finished:", *(void *)(a1 + 32), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
    id WeakRetained = v3;
    if (*(unsigned char *)(a1 + 72))
    {
      [v3 _proofreadingOrCompositionFinishedInContext:*(void *)(a1 + 40)];
      id WeakRetained = v3;
    }
  }
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v54[5] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  writingToolsDelegateMessageInvocationBuffer = self->_writingToolsDelegateMessageInvocationBuffer;
  uint64_t v18 = [v14 uuid];
  _confirmMatchingWritingToolsSession(writingToolsDelegateMessageInvocationBuffer, v18, a2);

  if (self->_undoRollersByContextID)
  {
    id v19 = (id)MEMORY[0x1E4F1CBF0];
    if (v15) {
      id v19 = v15;
    }
    v54[0] = v14;
    v54[1] = v19;
    id v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
    v54[2] = v20;
    v54[3] = v16;
    char v21 = [NSNumber numberWithBool:v7];
    v54[4] = v21;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:5];
    char v22 = v37 = v7;
    char v23 = [(UIWritingToolsCoordinator *)self _bufferInvocationForSelector:a2 arguments:v22];

    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
      {
        if (byte_1E8FD4FA4)
        {
          char v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &qword_1EB25F328) + 8);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            char v28 = v27;
            uint64_t v29 = [v15 count];
            *(_DWORD *)buf = 134219010;
            char v30 = &stru_1ED0E84C0;
            uint64_t v45 = v29;
            __int16 v46 = 2112;
            if (v37) {
              char v30 = @" [FINISHED]";
            }
            uint64_t v47 = (uint64_t)v23;
            __int16 v48 = 2048;
            NSUInteger v49 = location;
            __int16 v50 = 2048;
            NSUInteger v51 = length;
            __int16 v52 = 2112;
            __int16 v53 = v30;
            _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Packaged up %lu proofreading suggestions to deliver after animation finishes, %@\n\tprocessedRange={%lu, %lu}%@", buf, 0x34u);
          }
        }
      }
    }
  }
  else
  {
    BOOL v24 = v7;
    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
      {
        if (byte_1E8FD4FA4)
        {
          uint64_t v31 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &qword_1EB25F330) + 8);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            NSUInteger v32 = v31;
            uint64_t v33 = [v15 count];
            uint64_t v34 = [v14 uuid];
            uint64_t v35 = (void *)v34;
            *(_DWORD *)buf = 134219010;
            BOOL v36 = &stru_1ED0E84C0;
            uint64_t v45 = v33;
            __int16 v46 = 2112;
            if (v24) {
              BOOL v36 = @" [FINISHED]";
            }
            uint64_t v47 = v34;
            __int16 v48 = 2048;
            NSUInteger v49 = location;
            __int16 v50 = 2048;
            NSUInteger v51 = length;
            __int16 v52 = 2112;
            __int16 v53 = v36;
            _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "Received %lu suggestions in proofreading session %@. Processed range = {%lu, %lu}.%@", buf, 0x34u);
          }
        }
      }
    }
    effectContainersByLookupID = self->_effectContainersByLookupID;
    int v26 = [v16 uuid];
    [(NSMapTable *)effectContainersByLookupID addObject:v26];

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __105__UIWritingToolsCoordinator_proofreadingSession_didReceiveSuggestions_processedRange_inContext_finished___block_invoke;
    v38[3] = &unk_1E52DF5F0;
    v38[4] = self;
    id v39 = v15;
    NSUInteger v41 = location;
    NSUInteger v42 = length;
    id v40 = v16;
    BOOL v43 = v24;
    -[UIWritingToolsCoordinator _changeToState:postStateChangeActions:]((uint64_t)self, 3uLL, v38);
  }
}

uint64_t __105__UIWritingToolsCoordinator_proofreadingSession_didReceiveSuggestions_processedRange_inContext_finished___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeReceivingSuggestions:processedRange:inContext:finished:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 72));
}

- (void)_completeReceivingSuggestions:(id)a3 processedRange:(_NSRange)a4 inContext:(id)a5 finished:(BOOL)a6
{
  BOOL v58 = a6;
  NSUInteger length = (void *)a4.length;
  long long v60 = (void *)a4.location;
  v90[1] = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v57 = a5;
  long long v8 = [v57 uuid];
  long long v9 = [v57 attributedText];
  long long v10 = objc_msgSend(v9, "attributedSubstringFromRange:", v60, length);
  id v11 = (NSMutableArray *)[v10 mutableCopy];
  proofreadingDeliverySuggestionIDs = self->_proofreadingDeliverySuggestionIDs;
  self->_proofreadingDeliverySuggestionIDs = v11;

  if ([v63 count] || v58)
  {
    v90[0] = v8;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:1];
    [(UIWritingToolsCoordinator *)self _endTextAssistantAnticipationsForContextIDs:v13];

    if ([v63 count])
    {
      id v14 = (_UIWTCProofreadingInteraction *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      proofreadingInteraction = self->_proofreadingInteraction;
      self->_proofreadingInteraction = v14;

      if (!self->_activeReviewingUUID)
      {
        id v16 = [[_UIWTCProofreadingInteraction alloc] initWithDelegate:self];
        activeReviewingUUID = self->_activeReviewingUUID;
        self->_activeReviewingUUID = (NSUUID *)v16;

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained addInteraction:self->_activeReviewingUUID];
      }
    }
  }
  long long v56 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v8];
  id v19 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v8];
  long long v55 = (void *)[v19 evaluatedRange];
  long long v61 = v20;
  char v21 = [v56 proofreadingController];
  char v22 = [(NSMutableSet *)self->_streamingContextIDs objectForKeyedSubscript:v8];
  if (!v22)
  {
    char v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v63, "count"));
    [(NSMutableSet *)self->_streamingContextIDs setObject:v22 forKeyedSubscript:v8];
  }
  char v23 = [(NSMutableDictionary *)self->_proofreadingSuggestionIDsPerDeliveryIDByContextID objectForKeyedSubscript:v8];
  if (!v23)
  {
    BOOL v24 = [v19 attributedString];
    char v23 = (void *)[v24 mutableCopy];

    [(NSMutableDictionary *)self->_proofreadingSuggestionIDsPerDeliveryIDByContextID setObject:v23 forKeyedSubscript:v8];
  }
  int v25 = self->_proofreadingDecorationView;
  if (!v25)
  {
    int v25 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_storeStrong((id *)&self->_proofreadingDecorationView, v25);
  }
  int v26 = [v63 objectEnumerator];
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__22;
  v88 = __Block_byref_object_dispose__22;
  id v89 = [v26 nextObject];
  objc_initWeak(&location, self);
  uint64_t v77 = 0;
  v78 = (id *)&v77;
  uint64_t v79 = 0x3042000000;
  v80 = __Block_byref_object_copy__129;
  v81 = __Block_byref_object_dispose__130;
  id v82 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__UIWritingToolsCoordinator__completeReceivingSuggestions_processedRange_inContext_finished___block_invoke;
  aBlock[3] = &unk_1E52DF618;
  v73 = &v77;
  __int16 v53 = v75;
  objc_copyWeak(v75, &location);
  id v51 = v22;
  id v65 = v51;
  v74 = &v84;
  id v52 = v26;
  id v66 = v52;
  v75[1] = v55;
  v75[2] = v61;
  id v62 = v21;
  id v67 = v62;
  v75[3] = (id)a2;
  char v27 = v25;
  uint64_t v68 = v27;
  uint64_t v69 = self;
  v75[4] = v60;
  v75[5] = length;
  id v28 = v19;
  id v70 = v28;
  BOOL v76 = v58;
  id v29 = v23;
  id v71 = v29;
  id v50 = v8;
  id v72 = v50;
  char v30 = _Block_copy(aBlock);
  objc_storeWeak(v78 + 5, v30);
  if (v85[5])
  {
    uint64_t v31 = [_UIWTCProofreadingSuggestionInfo alloc];
    uint64_t v32 = v85[5];
    uint64_t v33 = objc_msgSend(v62, "contextString", v50, v51, v52, v75);
    uint64_t v34 = [(_UIWTCProofreadingSuggestionInfo *)v31 initWithWTTextSuggestion:v32 withOffset:v55 inAttributedString:v33];

    if ([(_UIWTCProofreadingInteraction *)v34 originalRange] < 0)
    {
      NSUInteger v49 = [MEMORY[0x1E4F28B00] currentHandler];
      [v49 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:969 description:@"Unexpected range for proofreading suggestion received from Writing Tools"];
    }
    uint64_t v35 = [(_UIWTCProofreadingInteraction *)v34 identifier];
    [(_UIWTCProofreadingDecorationView *)v27 setObject:v34 forKeyedSubscript:v35];

    BOOL v36 = [(_UIWTCProofreadingInteraction *)v34 identifier];
    uint64_t v37 = [(_UIWTCProofreadingInteraction *)v34 originalRange];
    uint64_t v39 = v38;
    id v40 = [(_UIWTCProofreadingInteraction *)v34 attributedString];
    objc_msgSend(v62, "addSuggestionWithUUID:originalRange:replacementString:completion:", v36, v37, v39, v40, v30);

    goto LABEL_19;
  }
  if (!v58)
  {
    NSUInteger v41 = self->_proofreadingDeliverySuggestionIDs;
    NSUInteger v42 = objc_msgSend(v28, "_wtContext", v50, v51, v52, v75);
    -[UIWritingToolsCoordinator _updateReplacementTrackerWithText:forRange:inContext:finished:](self, "_updateReplacementTrackerWithText:forRange:inContext:finished:", v41, v60, length, v42, 0);

    BOOL v43 = [v62 editTracker];
    uint64_t v44 = objc_msgSend(v43, "adjustRange:", 0, v60);
    uint64_t v46 = v45;

    uint64_t v47 = [(NSMutableArray *)self->_proofreadingDeliverySuggestionIDs length];
    __int16 v48 = self->_proofreadingDeliverySuggestionIDs;
    self->_proofreadingDeliveryReplacement = (NSMutableAttributedString *)(v44 + v46 + v47);
    self->_proofreadingDeliverySuggestionIDs = 0;

    uint64_t v34 = self->_proofreadingInteraction;
    self->_proofreadingInteraction = 0;
LABEL_19:

    goto LABEL_20;
  }
  (*((void (**)(void *, void, void))v30 + 2))(v30, 0, 0);
LABEL_20:

  objc_destroyWeak(v53);
  _Block_object_dispose(&v77, 8);
  objc_destroyWeak(&v82);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v84, 8);
}

void __93__UIWritingToolsCoordinator__completeReceivingSuggestions_processedRange_inContext_finished___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v34 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 112));
    if (v7)
    {
      if (v34)
      {
        long long v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "state"));
        [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v34];
      }
      uint64_t v9 = [*(id *)(a1 + 40) nextObject];
      uint64_t v10 = *(void *)(*(void *)(a1 + 104) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
      {
        uint64_t v12 = [_UIWTCProofreadingSuggestionInfo alloc];
        uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
        uint64_t v14 = *(void *)(a1 + 120);
        id v15 = [*(id *)(a1 + 48) contextString];
        id v16 = [(_UIWTCProofreadingSuggestionInfo *)v12 initWithWTTextSuggestion:v13 withOffset:v14 inAttributedString:v15];

        if ([(_UIWTCProofreadingSuggestionInfo *)v16 originalRange] < 0)
        {
          uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
          [v33 handleFailureInMethod:*(void *)(a1 + 136) object:v7 file:@"UIWritingToolsCoordinator.m" lineNumber:942 description:@"Unexpected range for proofreading suggestion received from Writing Tools"];
        }
        char v17 = *(void **)(a1 + 56);
        uint64_t v18 = [(_UIWTCProofreadingSuggestionInfo *)v16 identifier];
        [v17 setObject:v16 forKeyedSubscript:v18];

        id v19 = *(void **)(a1 + 48);
        id v20 = [(_UIWTCProofreadingSuggestionInfo *)v16 identifier];
        uint64_t v21 = [(_UIWTCProofreadingSuggestionInfo *)v16 originalRange];
        uint64_t v23 = v22;
        BOOL v24 = [(_UIWTCProofreadingSuggestionInfo *)v16 attributedString];
        objc_msgSend(v19, "addSuggestionWithUUID:originalRange:replacementString:completion:", v20, v21, v23, v24, WeakRetained);
      }
      else
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 136);
        int v26 = [*(id *)(a1 + 72) _wtContext];
        objc_msgSend(v7, "_updateReplacementTrackerWithText:forRange:inContext:finished:", v25, *(void *)(a1 + 144), *(void *)(a1 + 152), v26, *(unsigned __int8 *)(a1 + 160));

        uint64_t v27 = *(void *)(a1 + 144);
        id v28 = [*(id *)(a1 + 48) editTracker];
        uint64_t v29 = objc_msgSend(v28, "adjustRange:", 0, v27);
        uint64_t v31 = v29 + v30;

        uint64_t v32 = *(void *)(a1 + 152);
        id v16 = [v7 _proofreadingDeliveryReplacement];
        objc_msgSend(*(id *)(a1 + 80), "replaceCharactersInRange:withAttributedString:", v31, v32, v16);
        objc_msgSend(v7, "_setProofreadingDeliveryOffset:", -[_UIWTCProofreadingSuggestionInfo length](v16, "length") + v31);
        [v7 _setProofreadingDeliveryReplacement:0];
        [v7 _setProofreadingDeliverySuggestionIDs:0];
        if (*(unsigned char *)(a1 + 160))
        {
          [v7 _setProofreadingDeliveryOffset:0];
          [v7 _proofreadingOrCompositionFinishedInContext:*(void *)(a1 + 88)];
        }
      }
    }
  }
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  writingToolsDelegateMessageInvocationBuffer = self->_writingToolsDelegateMessageInvocationBuffer;
  id v15 = [v11 uuid];
  _confirmMatchingWritingToolsSession(writingToolsDelegateMessageInvocationBuffer, v15, a2);

  if (!self->_undoRollersByContextID)
  {
    uint64_t v18 = [v13 uuid];
    uint64_t v21 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v18];
    uint64_t v22 = [v21 proofreadingController];
    uint64_t v23 = [v22 suggestionWithUUID:v12];
    if ([v23 state] == 4)
    {
      -[UIWritingToolsCoordinator _synchronizeSuggestionInfoStateForProofreadingSuggestionWithIdentifier:state:]((uint64_t)self, v12, 4);
      if (os_variant_has_internal_diagnostics())
      {
        if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
        {
          if (byte_1E8FD4FA4)
          {
            BOOL v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &qword_1EB25F340) + 8);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              log = v24;
              uint64_t v32 = [v22 contextString];
              uint64_t v25 = [v32 string];
              uint64_t v26 = [v23 originalRange];
              id v28 = objc_msgSend(v25, "substringWithRange:", v26, v27);
              uint64_t v29 = [v23 originalRange];
              [v23 originalRange];
              *(_DWORD *)buf = 138412802;
              id v34 = v28;
              __int16 v35 = 2048;
              uint64_t v36 = v29;
              __int16 v37 = 2048;
              uint64_t v38 = v30;
              _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "Invalidated proofreading suggestion for \"%@\" from {.loc=%lu, .len=%lu} in context", buf, 0x20u);
            }
          }
        }
      }
    }
    else
    {
      [(UIWritingToolsCoordinator *)self _updateForProofreadingSuggestion:v23 state:a4 saveState:1 inContext:v18];
    }

    goto LABEL_16;
  }
  v39[0] = v11;
  id v16 = [NSNumber numberWithInteger:a4];
  v39[1] = v16;
  v39[2] = v12;
  v39[3] = v13;
  char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  uint64_t v18 = [(UIWritingToolsCoordinator *)self _bufferInvocationForSelector:a2 arguments:v17];

  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
    {
      if (byte_1E8FD4FA4)
      {
        id v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &qword_1EB25F338) + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          if ((unint64_t)a4 > 4) {
            id v20 = @"unknown";
          }
          else {
            id v20 = off_1E52DF8C0[a4];
          }
          *(_DWORD *)buf = 134218498;
          id v34 = v18;
          __int16 v35 = 2112;
          uint64_t v36 = (uint64_t)v12;
          __int16 v37 = 2112;
          uint64_t v38 = v20;
          uint64_t v21 = v19;
          _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Packaged up proofreading suggestion update to deliver after animation finishes, %p\n\tuuid=%@ state=%@", buf, 0x20u);
LABEL_16:
        }
      }
    }
  }
}

- (void)_synchronizeSuggestionInfoStateForProofreadingSuggestionWithIdentifier:(uint64_t)a3 state:
{
  id v5 = a2;
  if (a1)
  {
    id v9 = v5;
    uint64_t v6 = [*(id *)(a1 + 224) objectForKeyedSubscript:v5];
    if (!v6)
    {
      long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__synchronizeSuggestionInfoStateForProofreadingSuggestionWithIdentifier_state_ object:a1 file:@"UIWritingToolsCoordinator.m" lineNumber:1818 description:@"Proofreading suggestion tracking breakdown"];
    }
    if ([v6 state] != a3)
    {
      id v7 = [[_UIWTCProofreadingSuggestionInfo alloc] initWithProofreadingSuggestionInfo:v6 state:a3];
      [*(id *)(a1 + 224) setObject:v7 forKeyedSubscript:v9];
    }
    id v5 = v9;
  }
}

- (BOOL)proofreadingInteraction:(id)a3 shouldRespondToTapAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if (*(_OWORD *)&self->_contextIDForChosenSuggestion != 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
      {
        if (byte_1E8FD4FA4)
        {
          uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &proofreadingInteraction_shouldRespondToTapAtPoint____s_category)+ 8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            LOWORD(location[0]) = 0;
            _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Previous _chosenSuggestion hasn't been cleared before next tap in proofreading session. Reexamine the logic.", (uint8_t *)location, 2u);
          }
        }
      }
    }
    contextIDForChosenSuggestion = self->_contextIDForChosenSuggestion;
    self->_contextIDForChosenSuggestion = 0;

    sessionTextViewDelegate = self->_sessionTextViewDelegate;
    self->_sessionTextViewDelegate = 0;
  }
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__UIWritingToolsCoordinator_proofreadingInteraction_shouldRespondToTapAtPoint___block_invoke;
  aBlock[3] = &unk_1E52DF640;
  objc_copyWeak(&v16, location);
  uint64_t v10 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
  objc_msgSend(WeakRetained, "writingToolsCoordinator:requestsRangeInContextWithIdentifierForPoint:completion:", self, v10, x, y);

  BOOL v12 = self->_contextIDForChosenSuggestion != 0;
  objc_destroyWeak(&v16);
  objc_destroyWeak(location);

  return v12;
}

void __79__UIWritingToolsCoordinator_proofreadingInteraction_shouldRespondToTapAtPoint___block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v8 = WeakRetained;
  if (WeakRetained && a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v6)
    {
      id v9 = [WeakRetained _acceptedEvaluationContextsByContextID];
      if (![v9 count])
      {
        if (os_variant_has_internal_diagnostics())
        {
          if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
          {
            if (byte_1E8FD4FA4)
            {
              uint64_t v30 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &_UIInternalPreference_UIUseWTCDecorations_block_invoke___s_category)+ 8);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "ERROR: No contexts available for proofreading interaction. Ignoring tap", buf, 2u);
              }
            }
          }
        }
        [v8 _setChosenSuggestion:0];
        id v6 = 0;
LABEL_25:

        goto LABEL_26;
      }
      if ((unint64_t)[v9 count] >= 2) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"No context ID provided in selection returned from -writingToolsCoordinator:selectionForPoint when there are multiple contexts"];
      }
      uint64_t v10 = [v9 keyEnumerator];
      id v11 = [v10 allObjects];
      id v6 = [v11 firstObject];
    }
    BOOL v12 = [v8 _replacementTrackersByContextID];
    id v9 = [v12 objectForKeyedSubscript:v6];

    id v13 = [v9 proofreadingController];
    uint64_t v14 = [v13 editTracker];
    if (a3)
    {
      uint64_t v32 = v9;
      id v33 = v6;
      id v34 = v8;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v31 = v13;
      id v15 = [v13 suggestions];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v37 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (![v20 state])
            {
              uint64_t v21 = [v20 originalRange];
              uint64_t v23 = v22;
              BOOL v24 = [v20 uuid];
              NSUInteger v25 = objc_msgSend(v14, "rangeOfSuggestionWithRange:UUID:applyDelta:", v21, v23, v24, 1);
              NSUInteger v27 = v26;

              v43.id location = v25;
              v43.NSUInteger length = v27;
              v44.id location = a2;
              v44.NSUInteger length = a3;
              if (NSIntersectionRange(v43, v44).length)
              {
                [v34 _setChosenSuggestion:v20];
                [v34 _setContextIDForChosenSuggestion:v33];
                goto LABEL_20;
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
LABEL_20:

      id v6 = v33;
      long long v8 = v34;
      id v13 = v31;
      id v9 = v32;
    }
    id v28 = [v8 _bridgingDelegate];
    if (v28)
    {
      uint64_t v29 = [v8 _chosenSuggestion];

      if (!v29) {
        objc_msgSend(v28, "_wtc_invalidateGrabberSuppression");
      }
    }

    goto LABEL_25;
  }
LABEL_26:
}

- (void)proofreadingInteraction:(id)a3 receivedTapAtLocation:(CGPoint)a4
{
  contextIDForChosenSuggestion = self->_contextIDForChosenSuggestion;
  if (contextIDForChosenSuggestion)
  {
    id v8 = [(NSUUID *)contextIDForChosenSuggestion uuid];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_proofreadingVisualizationReplacementDelta);
    [WeakRetained proofreadingSessionWithUUID:self->_writingToolsDelegateMessageInvocationBuffer updateState:1 forSuggestionWithUUID:v8];

    [(UIWritingToolsCoordinator *)self _updateForProofreadingSuggestion:self->_contextIDForChosenSuggestion state:1 saveState:1 inContext:self->_sessionTextViewDelegate];
    id v7 = self->_contextIDForChosenSuggestion;
    self->_contextIDForChosenSuggestion = 0;
  }
}

- (void)proofreadingController:(id)a3 replaceCharactersInRange:(_NSRange)a4 attributedString:(id)a5 state:(int64_t)a6 identifier:(id)a7 completion:(id)a8
{
  NSUInteger length = a4.length;
  NSUInteger v12 = a4.location;
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = (void (**)(void, void, void, void))v17;
  if (BYTE2(self->_bridgingDelegate))
  {
    (*((void (**)(id, id, id, void))v17 + 2))(v17, v16, v15, 0);
  }
  else
  {
    NSUInteger v22 = length;
    id v19 = [v14 _writingToolsContextID];
    id v20 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v19];
    uint64_t v21 = [v20 resolvedRange];

    if (self->_proofreadingDeliverySuggestionIDs)
    {
      -[UIWritingToolsCoordinator _updateProofreadingDeliveryWithReplacement:accordingToProofreadingSuggestionWithIdentifier:replacingCharactersInRange:newState:contextID:](self, "_updateProofreadingDeliveryWithReplacement:accordingToProofreadingSuggestionWithIdentifier:replacingCharactersInRange:newState:contextID:", v15, v16, v12 - v21, v22, a6, v19);
      ((void (**)(void, id, id, uint64_t))v18)[2](v18, v16, v15, 1);
    }
    else
    {
      objc_initWeak(&location, self);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __122__UIWritingToolsCoordinator_proofreadingController_replaceCharactersInRange_attributedString_state_identifier_completion___block_invoke;
      v23[3] = &unk_1E52DF668;
      objc_copyWeak(v26, &location);
      NSUInteger v25 = v18;
      id v24 = v16;
      v26[1] = (id)a6;
      -[UIWritingToolsCoordinator _delegateUpdateTextAccordingToProofreadingSuggestionInfoWithIdentifier:replacingCharactersInRange:newState:contextID:updateCompletion:](self, "_delegateUpdateTextAccordingToProofreadingSuggestionInfoWithIdentifier:replacingCharactersInRange:newState:contextID:updateCompletion:", v24, v12, v22, a6, v19, v23);

      objc_destroyWeak(v26);
      objc_destroyWeak(&location);
    }
  }
}

void __122__UIWritingToolsCoordinator_proofreadingController_replaceCharactersInRange_attributedString_state_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    -[UIWritingToolsCoordinator _synchronizeSuggestionInfoStateForProofreadingSuggestionWithIdentifier:state:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void *)(a1 + 56));
  }
  (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSArray)_effectContainerLookupIDs
{
  id v2 = [(NSMutableDictionary *)self->_currentProofreadingTextPerContextID keyEnumerator];
  id v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)_endTextAssistantAnticipationsForContextIDs:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(NSWritingToolsProofreadingSuggestion *)self->_chosenSuggestion objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * v8)];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v16;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = [*(id *)(*((void *)&v15 + 1) + 8 * v13) lookupID];
              [(UIWritingToolsCoordinator *)self _endTextAssistantAnticipationInContainerForLookupID:v14];

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
}

- (void)_beginTextAssistantAnticipationsForRange:(_NSRange)a3 inContext:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v39[1] = *MEMORY[0x1E4F143B8];
  id v30 = a4;
  if (v30)
  {
    uint64_t v7 = [(UIWritingToolsCoordinator *)self effectContainerView];
    if (v7)
    {
      NSUInteger v26 = (void *)v7;
      v39[0] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
      id v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
      long long v38 = v9;
      uint64_t v10 = &v38;
    }
    else
    {
      NSUInteger v26 = [(UIWritingToolsCoordinator *)self view];
      long long v37 = v26;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      id v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
      long long v36 = v9;
      uint64_t v10 = &v36;
    }
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

    uint64_t v11 = [v30 identifier];
    uint64_t v12 = [(NSWritingToolsProofreadingSuggestion *)self->_chosenSuggestion objectForKeyedSubscript:v11];
    if (!v12)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      [(NSWritingToolsProofreadingSuggestion *)self->_chosenSuggestion setObject:v12 forKeyedSubscript:v11];
    }
    uint64_t v25 = (void *)v11;
    uint64_t v13 = self;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v8;
    uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v28 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(obj);
          }
          long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v19 = objc_msgSend(v18, "_effectContainerLookupID", v25);
          if (!v19)
          {
            long long v19 = [MEMORY[0x1E4F29128] UUID];
            -[UIWritingToolsCoordinator _setCrossReferenceLookupID:forView:]((uint64_t)v13, v19, v18);
          }
          long long v20 = [v29 objectAtIndexedSubscript:v16 + i];
          uint64_t v21 = [v20 rangeValue];
          uint64_t v23 = v22;

          id v24 = +[_UIWTCTextEffectContainerInfo effectContainerInfoWithLookupID:initialRange:](_UIWTCTextEffectContainerInfo, "effectContainerInfoWithLookupID:initialRange:", v19, v21, v23);
          if (([v12 containsObject:v24] & 1) == 0) {
            [v12 addObject:v24];
          }
          -[UIWritingToolsCoordinator _beginTextAssistantAnticipationInContainer:context:animationCharacterRange:](v13, "_beginTextAssistantAnticipationInContainer:context:animationCharacterRange:", v18, v30, v21, v23);
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        v16 += i;
      }
      while (v15);
    }
  }
}

- (void)_beginAnimatedTextReplacementForInFlightDeliveryInContextID:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v25 = [(UIWritingToolsCoordinator *)self _inFlightDeliveryID];
  uint64_t v5 = [(NSWritingToolsProofreadingSuggestion *)self->_chosenSuggestion objectForKeyedSubscript:v4];
  id v24 = self;
  NSUInteger v26 = v4;
  uint64_t v23 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v4];
  NSUInteger v6 = [v23 initialCurrentChunkCharacterRange];
  NSUInteger v8 = v7;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    NSUInteger length = 0;
    id v13 = 0;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (!v13) {
          id v13 = v16;
        }
        v33.NSUInteger location = [v16 initialRange];
        v34.NSUInteger location = v6;
        v34.NSUInteger length = v8;
        NSRange v17 = NSIntersectionRange(v33, v34);
        if (length < v17.length)
        {
          id v18 = v16;

          NSUInteger length = v17.length;
          id v13 = v18;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }
  else
  {
    id v13 = 0;
  }

  currentProofreadingTextPerContextID = v24->_currentProofreadingTextPerContextID;
  long long v20 = [v13 lookupID];
  uint64_t v21 = [(NSMutableDictionary *)currentProofreadingTextPerContextID objectForKey:v20];
  [(UIWritingToolsCoordinator *)v24 _setUpTextEffectViewInContainer:v21];

  uint64_t v22 = [v13 lookupID];
  [(UIWritingToolsCoordinator *)v24 _animateRewrittenTextForDelivery:v25 contextID:v26 lookupID:v22];
}

- (void)_sendDelegatePrepareForTextAnimation:(int64_t)a3 forRange:(_NSRange)a4 contextID:(id)a5 completion:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v12];
  if (!v14)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"UIWritingToolsCoordinator.m", 1264, @"Missing evaluation context for ID: %@", v12 object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__UIWritingToolsCoordinator__sendDelegatePrepareForTextAnimation_forRange_contextID_completion___block_invoke;
  aBlock[3] = &unk_1E52DA040;
  id v20 = v13;
  id v15 = v13;
  uint64_t v16 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
  objc_msgSend(WeakRetained, "writingToolsCoordinator:prepareForTextAnimation:forRange:inContext:completion:", self, a3, location, length, v14, v16);
}

uint64_t __96__UIWritingToolsCoordinator__sendDelegatePrepareForTextAnimation_forRange_contextID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_sendDelegateFinishTextAnimation:(int64_t)a3 contextID:(id)a4 completion:(id)a5
{
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v11 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v9];
  if (!v11)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"UIWritingToolsCoordinator.m", 1274, @"Missing evaluation context for ID: %@", v9 object file lineNumber description];
  }
  id v12 = [(UIWritingToolsCoordinator *)self _storedTargetedPreviewsByContextID];
  id v13 = [v12 objectForKeyedSubscript:v9];
  uint64_t v14 = [NSNumber numberWithInteger:a3];
  id v15 = [v13 objectForKeyedSubscript:v14];

  if (v15)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__UIWritingToolsCoordinator__sendDelegateFinishTextAnimation_contextID_completion___block_invoke;
    aBlock[3] = &unk_1E52DA040;
    long long v29 = v10;
    uint64_t v16 = _Block_copy(aBlock);
    NSRange v17 = [(UIWritingToolsCoordinator *)self _storedTargetedPreviewsByContextID];
    id v18 = [v17 objectForKeyedSubscript:v9];
    long long v19 = [NSNumber numberWithInteger:a3];
    [v18 removeObjectForKey:v19];

    id v20 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v9];
    uint64_t v21 = v20;
    if (a3 == 2)
    {
      uint64_t v22 = [v20 finalCurrentChunkCharacterRange];
    }
    else if (a3 == 1)
    {
      uint64_t v22 = [v20 initialCurrentChunkCharacterRange];
    }
    else
    {
      uint64_t v22 = [v20 activeUnprocessedCharacterRange];
    }
    uint64_t v24 = v22;
    uint64_t v25 = v23;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
    objc_msgSend(WeakRetained, "writingToolsCoordinator:finishTextAnimation:forRange:inContext:completion:", self, a3, v24, v25, v11, v16);
  }
  else
  {
    v10[2](v10);
  }
}

uint64_t __83__UIWritingToolsCoordinator__sendDelegateFinishTextAnimation_contextID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchStoredTargetedPreviewForContextID:(id)a3 textAnimation:(int64_t)a4 completion:(id)a5
{
  id v15 = (void (**)(id, void *))a5;
  id v9 = a3;
  uint64_t v10 = [(UIWritingToolsCoordinator *)self _storedTargetedPreviewsByContextID];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  id v12 = [NSNumber numberWithInteger:a4];
  id v13 = [v11 objectForKeyedSubscript:v12];

  if (!v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:1309 description:@"Expected stored targeted preview is missing"];
  }
  v15[2](v15, v13);
}

- (void)_sendDelegateTargetedPreviewOfActiveRangeForTextAnimation:(int64_t)a3 contextID:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(UIWritingToolsCoordinator *)self _storedTargetedPreviewsByContextID];
  id v12 = [v11 objectForKeyedSubscript:v9];
  id v13 = [NSNumber numberWithInteger:a3];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];

  if (v14)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    NSUInteger v26 = v25;
    if ((unint64_t)a3 > 2) {
      long long v27 = @"Unknown text animation";
    }
    else {
      long long v27 = off_1E52DF8A8[a3];
    }
    [v25 handleFailureInMethod:a2, self, @"UIWritingToolsCoordinator.m", 1315, @"Stored targeted preview for %@ hasn't been consumed before storing another. Should have been cleared when finishing", v27 object file lineNumber description];
  }
  id v15 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v9];
  if (!v15)
  {
    long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"UIWritingToolsCoordinator.m", 1317, @"Missing evaluation context for ID: %@", v9 object file lineNumber description];
  }
  uint64_t v16 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v9];
  NSRange v17 = v16;
  if (a3 == 2)
  {
    uint64_t v18 = [v16 finalCurrentChunkCharacterRange];
  }
  else if (a3 == 1)
  {
    uint64_t v18 = [v16 initialCurrentChunkCharacterRange];
  }
  else
  {
    uint64_t v18 = [v16 activeUnprocessedCharacterRange];
  }
  uint64_t v20 = v18;
  uint64_t v21 = v19;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __108__UIWritingToolsCoordinator__sendDelegateTargetedPreviewOfActiveRangeForTextAnimation_contextID_completion___block_invoke;
  v29[3] = &unk_1E52DF690;
  objc_copyWeak(v32, &location);
  id v23 = v10;
  id v31 = v23;
  id v24 = v9;
  id v30 = v24;
  v32[1] = (id)a3;
  objc_msgSend(WeakRetained, "writingToolsCoordinator:requestsPreviewForTextAnimation:ofRange:inContext:completion:", self, a3, v20, v21, v15, v29);

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
}

void __108__UIWritingToolsCoordinator__sendDelegateTargetedPreviewOfActiveRangeForTextAnimation_contextID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v8)
  {
    id v4 = [WeakRetained _storedTargetedPreviewsByContextID];
    uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (!v5)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      NSUInteger v6 = [WeakRetained _storedTargetedPreviewsByContextID];
      [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
    }
    NSUInteger v7 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    [v5 setObject:v8 forKeyedSubscript:v7];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_sendDelegatedAnimatedReplacementWithDelay:(double)a3 duration:(double)a4 deliveryID:(id)a5 contextID:(id)a6 completion:(id)a7
{
  anticipationContainerInfosByContextID = self->_anticipationContainerInfosByContextID;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v18 = [(NSMutableDictionary *)anticipationContainerInfosByContextID objectForKeyedSubscript:v14];
  if ([v18 isProofreading]) {
    uint64_t v16 = -1;
  }
  else {
    uint64_t v16 = 2;
  }
  NSRange v17 = [[UIWritingToolsCoordinatorAnimationParameters alloc] initWithDelay:a3 duration:a4];
  [(UIWritingToolsCoordinator *)self _updateTextViewAndTrackerWithIncomingCompositionSessionState:v16 forDelivery:v15 animationParameters:v17 contextID:v14 completion:v13];
}

- (void)_updateTextViewAndTrackerWithIncomingCompositionSessionState:(int64_t)a3 forDelivery:(id)a4 animationParameters:(id)a5 contextID:(id)a6 completion:(id)a7
{
  id v13 = (NSMutableDictionary *)a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void *))a7;
  if (v14) {
    NSRange v17 = (UIWritingToolsCoordinatorAnimationParameters *)v14;
  }
  else {
    NSRange v17 = [[UIWritingToolsCoordinatorAnimationParameters alloc] initWithDelay:0.0 duration:0.0];
  }
  id v18 = v17;
  uint64_t v19 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v15];
  if (!v19)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"UIWritingToolsCoordinator.m", 1370, @"Missing evaluation context for ID: %@", v15 object file lineNumber description];
  }
  uint64_t v20 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v15];
  uint64_t v21 = v20;
  if (BYTE1(self->_bridgingDelegate))
  {
    [v20 setCompositionSessionState:a3];
    if (v16) {
      v16[2](v16, v18);
    }
    goto LABEL_21;
  }
  int v22 = [v20 isProofreading];
  SEL v40 = a2;
  if (!v13 && v22)
  {
    NSUInteger v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:v40 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:1382 description:@"Full-text updates are not supported by the replacement tracker when proofreading"];

    goto LABEL_14;
  }
  if (!v13)
  {
LABEL_14:
    uint64_t v23 = [v21 activeCharacterRange];
    goto LABEL_15;
  }
  uint64_t v23 = [v21 sourceRangeForChunkFromDelivery:v13];
LABEL_15:
  uint64_t v35 = v24;
  uint64_t v36 = v23;
  if (v23 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSRange v34 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v39 = _UICompositionSessionStateDescription(a3);
    [v34 handleFailureInMethod:v40, self, @"UIWritingToolsCoordinator.m", 1385, @"Can't update text view with %@. Lost track of delivery when calculating source range. %@", v39, v13 object file lineNumber description];
  }
  int64_t v37 = a3;
  [v21 setCompositionSessionState:a3];
  long long v27 = v18;
  if (v13)
  {
    long long v28 = [v21 rewrittenChunkTextForDelivery:v13];
    undoRollersByContextID = v13;
  }
  else
  {
    long long v28 = [v21 activeText];
    undoRollersByContextID = self->_undoRollersByContextID;
  }
  id v30 = undoRollersByContextID;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __143__UIWritingToolsCoordinator__updateTextViewAndTrackerWithIncomingCompositionSessionState_forDelivery_animationParameters_contextID_completion___block_invoke;
  aBlock[3] = &unk_1E52DF6B8;
  NSRange v43 = v30;
  id v44 = v21;
  uint64_t v45 = v13;
  id v46 = v28;
  uint64_t v47 = self;
  SEL v50 = v40;
  int64_t v51 = v37;
  NSUInteger v49 = v16;
  __int16 v48 = v27;
  NSUInteger v41 = v16;
  id v31 = v28;
  long long v38 = v30;
  uint64_t v32 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
  objc_msgSend(WeakRetained, "writingToolsCoordinator:replaceRange:inContext:proposedText:reason:animationParameters:completion:", self, v36, v35, v19, v31, v14 == 0, v14, v32);

  id v18 = v27;
  uint64_t v16 = v41;
LABEL_21:
}

void __143__UIWritingToolsCoordinator__updateTextViewAndTrackerWithIncomingCompositionSessionState_forDelivery_animationParameters_contextID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5)
  {
    NSUInteger v6 = [v3 string];
    NSUInteger v7 = [*(id *)(a1 + 56) string];
    id v8 = v6;
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      id v10 = v9;
      if (v8 && v9)
      {
        char v11 = [v8 isEqual:v9];

        if (v11) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:*(void *)(a1 + 88) object:*(void *)(a1 + 64) file:@"UIWritingToolsCoordinator.m" lineNumber:1399 description:@"UIWritingToolsCoordinator does not support changing or rejecting the replacement text for noninteractive text replacement"];
    }

    goto LABEL_12;
  }
  if (!v3)
  {
    id v4 = [*(id *)(a1 + 40) originalChunkTextForDelivery:*(void *)(a1 + 48)];
    uint64_t v5 = *(void *)(a1 + 32);
  }
  [*(id *)(a1 + 40) updateReplacementChunkForDeliveryID:v5 newText:v4];
LABEL_12:
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C&& os_variant_has_internal_diagnostics())
  {
    id v13 = *(void **)(a1 + 40);
    if (*(void *)(a1 + 48)) {
      uint64_t v14 = objc_msgSend(v13, "targetRangeForChunkFromDelivery:");
    }
    else {
      uint64_t v14 = [v13 activeCharacterRange];
    }
    uint64_t v16 = v14;
    int v17 = v15;
    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
      {
        if (byte_1E8FD4F9C)
        {
          int v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &_UIInternalPreference_UIUseWTCDecorations_block_invoke_2___s_category)+ 8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            int v24 = v16;
            __int16 v25 = 1024;
            int v26 = v17;
            _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "New active character range: {%u, %u}", buf, 0xEu);
          }
        }
      }
    }
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v19 = *(void *)(a1 + 64);
      uint64_t v20 = *(void *)(a1 + 88);
      uint64_t v21 = _UICompositionSessionStateDescription(*(void *)(a1 + 96));
      [v18 handleFailureInMethod:v20, v19, @"UIWritingToolsCoordinator.m", 1405, @"Can't update text view with %@. Lost track of delivery when calculating target range. %@", v21, *(void *)(a1 + 48) object file lineNumber description];
    }
  }
  uint64_t v12 = *(void *)(a1 + 80);
  if (v12) {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, *(void *)(a1 + 72));
  }
}

- (void)_replacementEffectDidLandInFlightDelivery:(id)a3 inContext:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([v7 isEqual:self->_undoRollersByContextID] & 1) == 0)
  {
    int v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"UIWritingToolsCoordinator.m", 1417, @"Replacement animation landed mismatched delivery, %@. _inFlightDeliveryID=%@", v7, self->_undoRollersByContextID object file lineNumber description];
  }
  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
  {
    __int16 v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB25F348) + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      undoRollersByContextID = self->_undoRollersByContextID;
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)undoRollersByContextID;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "In-flight delivery has landed. %@", buf, 0xCu);
    }
  }
  id v9 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v8];
  id v10 = [v9 nextDeliveryForDelivery:self->_undoRollersByContextID];

  if (v10)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:1420 description:@"replacement tracker should not have to queue deliveries"];
  }
  [(UIWritingToolsCoordinator *)self _updateVisualizationForProofreadingSuggestionsForDelivery:v7 inContext:v8];
  [(UIWritingToolsCoordinator *)self _setInFlightDeliveryID:0];
  if ([self->_pendingCompletionForWritingToolsWillBegin count])
  {
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
    {
      long long v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB25F350) + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id pendingCompletionForWritingToolsWillBegin = self->_pendingCompletionForWritingToolsWillBegin;
        id v30 = v28;
        uint64_t v31 = [pendingCompletionForWritingToolsWillBegin count];
        *(_DWORD *)buf = 134217984;
        uint64_t v40 = v31;
        _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "Animation finished. Delivering buffered writingToolsDelegate messages. Count = %lu", buf, 0xCu);
      }
    }
    char v11 = (void *)[self->_pendingCompletionForWritingToolsWillBegin copy];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
LABEL_10:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        int v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
        if (![self->_pendingCompletionForWritingToolsWillBegin count]) {
          break;
        }
        [self->_pendingCompletionForWritingToolsWillBegin removeObjectAtIndex:0];
        if (os_variant_has_internal_diagnostics()
          && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
        {
          os_log_t log = *(os_log_t *)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB25F358) + 8);
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            loga = log;
            uint64_t v32 = NSStringFromSelector((SEL)[v17 selector]);
            *(_DWORD *)buf = 134218242;
            uint64_t v40 = (uint64_t)v17;
            __int16 v41 = 2112;
            uint64_t v42 = v32;
            _os_log_impl(&dword_1853B0000, loga, OS_LOG_TYPE_ERROR, "Delivering buffered invocation, %p, %@", buf, 0x16u);
          }
        }
        [v17 invokeWithTarget:self];
        if (v14 == ++v16)
        {
          uint64_t v18 = [v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
          uint64_t v14 = v18;
          if (v18) {
            goto LABEL_10;
          }
          break;
        }
      }
    }
  }
  uint64_t v19 = [v9 activeUnprocessedCharacterRange];
  uint64_t v21 = v20;
  int v22 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v8];
  if (v22 && v21)
  {
    uint64_t v23 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v8];
    -[UIWritingToolsCoordinator _beginTextAssistantAnticipationsForRange:inContext:](self, "_beginTextAssistantAnticipationsForRange:inContext:", v19, v21, v23);
  }
}

- (void)stopWritingTools
{
  if (self->_writingToolsDelegateMessageInvocationBuffer)
  {
    BYTE2(self->_bridgingDelegate) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained _endWritingTools];
  }
}

void __67__UIWritingToolsCoordinator__changeToState_postStateChangeActions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[37] = *(void *)(a1 + 48);
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (id)_bufferInvocationForSelector:(SEL)a3 arguments:(id)a4
{
  id v6 = a4;
  int v24 = self;
  id v7 = [(UIWritingToolsCoordinator *)self methodSignatureForSelector:a3];
  id v8 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v7];
  [v8 retainArguments];
  aSelector = a3;
  [v8 setSelector:a3];
  uint64_t v9 = [v6 count];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    while (1)
    {
      id v12 = (const char *)[v7 getArgumentTypeAtIndex:v11 + 2];
      if (!strcmp(v12, "@"))
      {
        id v25 = [v6 objectAtIndexedSubscript:v11];
        [v8 setArgument:&v25 atIndex:v11 + 2];

        goto LABEL_12;
      }
      if (!strcmp(v12, "Q") || !strcmp(v12, "q")) {
        break;
      }
      if (!strcmp(v12, "B"))
      {
        LOBYTE(v25) = 0;
        int v17 = [v6 objectAtIndexedSubscript:v11];
        char v18 = [v17 BOOLValue];

        LOBYTE(v25) = v18;
        goto LABEL_10;
      }
      if (!strcmp(v12, "{_NSRange=QQ}"))
      {
        id v25 = 0;
        uint64_t v26 = 0;
        uint64_t v19 = [v6 objectAtIndexedSubscript:v11];
        id v25 = (id)[v19 rangeValue];
        uint64_t v26 = v20;

        goto LABEL_10;
      }
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v14 = NSStringFromSelector(aSelector);
      [v13 handleFailureInMethod:a2, v24, @"UIWritingToolsCoordinator.m", 1568, @"Packaging implementation required for invocation argument type, %s in %@", v12, v14 object file lineNumber description];

LABEL_12:
      if (v10 == ++v11) {
        goto LABEL_16;
      }
    }
    id v25 = 0;
    uint64_t v15 = [v6 objectAtIndexedSubscript:v11];
    uint64_t v16 = (void *)[v15 integerValue];

    id v25 = v16;
LABEL_10:
    [v8 setArgument:&v25 atIndex:v11 + 2];
    goto LABEL_12;
  }
LABEL_16:
  [v24->_pendingCompletionForWritingToolsWillBegin addObject:v8];

  return v8;
}

- (void)_updateToCompositionSessionState:(int64_t)a3 contextID:(id)a4
{
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v6];
  id v8 = v7;
  if (a3)
  {
    if (a3 == 2)
    {
      if ([v7 compositionSessionState] != 2) {
        [(UIWritingToolsCoordinator *)self _updateTextViewAndTrackerWithIncomingCompositionSessionState:2 forDelivery:0 animationParameters:0 contextID:v6 completion:0];
      }
      [(UIWritingToolsCoordinator *)self _updateSelectedRangeForCompositionIfFinishedInContext:v6 force:0];
      BYTE3(self->_bridgingDelegate) = 0;
    }
    else if (a3 == 1)
    {
      if ([v7 compositionSessionState] == 2)
      {
        [(UIWritingToolsCoordinator *)self _updateTextViewAndTrackerWithIncomingCompositionSessionState:1 forDelivery:0 animationParameters:0 contextID:v6 completion:0];
        [(UIWritingToolsCoordinator *)self _updateSelectedRangeForCompositionIfFinishedInContext:v6 force:0];
      }
      BYTE3(self->_bridgingDelegate) = 1;
    }
  }
  else
  {
    if ([v7 compositionSessionState] == 2) {
      [(UIWritingToolsCoordinator *)self _updateTextViewAndTrackerWithIncomingCompositionSessionState:1 forDelivery:0 animationParameters:0 contextID:v6 completion:0];
    }
    [v8 setCompositionSessionState:0];
    BYTE3(self->_bridgingDelegate) = 0;
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__UIWritingToolsCoordinator__updateToCompositionSessionState_contextID___block_invoke;
    v9[3] = &unk_1E52DF708;
    objc_copyWeak(&v11, &location);
    void v9[4] = self;
    id v10 = v6;
    -[UIWritingToolsCoordinator _changeToState:postStateChangeActions:]((uint64_t)self, 3uLL, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __72__UIWritingToolsCoordinator__updateToCompositionSessionState_contextID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v3 = [v2 evaluatedRange];
    objc_msgSend(WeakRetained, "_beginTextAssistantAnticipationsForRange:inContext:", v3, v4, v2);
  }
}

- (void)_updateReplacementTrackerStartingAnimationsWithText:(id)a3 forRange:(_NSRange)a4 inContextWithID:(id)a5 finished:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v13];
  if (!v14)
  {
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"UIWritingToolsCoordinator.m", 1624, @"Lost UIWritingToolsCoordinatorContext for ID = %@", v13 object file lineNumber description];
  }
  unint64_t v15 = [v14 evaluatedRange];
  NSUInteger v16 = location - v15;
  if (location < v15)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    int v24 = NSStringFromSelector(a2);
    [v23 handleFailureInMethod:a2, self, @"UIWritingToolsCoordinator.m", 1627, @"%@ - range argument location is out of bounds", v24 object file lineNumber description];
  }
  int v17 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v13];
  char v18 = [v14 _wtContext];
  uint64_t v19 = objc_msgSend(v17, "recordRewrittenText:forRange:withContext:finished:", v12, v16, length, v18, v6);

  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
  {
    id v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &_updateReplacementTrackerStartingAnimationsWithText_forRange_inContextWithID_finished____s_category)+ 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v29 = v19;
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "Replacement tracker recorded delivery %@\n%@", buf, 0x16u);
    }
  }
  if (v19)
  {
    if (self->_proofreadingInteraction)
    {
      id v20 = [(NSMutableDictionary *)self->_proofreadingUnderlineInfoBySuggestionID objectForKeyedSubscript:v13];
      if (!v20)
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(NSMutableDictionary *)self->_proofreadingUnderlineInfoBySuggestionID setObject:v20 forKeyedSubscript:v13];
      }
      [v20 setObject:self->_proofreadingInteraction forKeyedSubscript:v19];
    }
    if (self->_undoRollersByContextID)
    {
      uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:1641 description:@"It should no longer be necessary to queue replacement deliveries"];
    }
    [(UIWritingToolsCoordinator *)self _setInFlightDeliveryID:v19];
    id v27 = v13;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    [(UIWritingToolsCoordinator *)self _endTextAssistantAnticipationsForContextIDs:v21];

    [(UIWritingToolsCoordinator *)self _beginAnimatedTextReplacementForInFlightDeliveryInContextID:v13];
  }
}

- (void)_updateReplacementTrackerWithText:(id)a3 forRange:(_NSRange)a4 inContext:(id)a5 finished:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = [v13 uuid];
  unint64_t v15 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v14];
  unint64_t v16 = [v15 evaluatedRange];
  NSUInteger v17 = location - v16;
  if (location < v16)
  {
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    id v25 = NSStringFromSelector(a2);
    [v22 handleFailureInMethod:a2, self, @"UIWritingToolsCoordinator.m", 1654, @"%@ - range argument location is out of bounds", v25 object file lineNumber description];
  }
  char v18 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v14];
  uint64_t v19 = objc_msgSend(v18, "recordRewrittenText:forRange:withContext:finished:", v12, v17, length, v13, v6);

  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
  {
    uint64_t v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &_updateReplacementTrackerWithText_forRange_inContext_finished____s_category)+ 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v28 = v19;
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Replacement tracker recorded delivery %@\n%@", buf, 0x16u);
    }
  }
  if (v19)
  {
    if (self->_proofreadingInteraction)
    {
      id v20 = [(NSMutableDictionary *)self->_proofreadingUnderlineInfoBySuggestionID objectForKeyedSubscript:v14];
      if (!v20)
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(NSMutableDictionary *)self->_proofreadingUnderlineInfoBySuggestionID setObject:v20 forKeyedSubscript:v14];
      }
      [v20 setObject:self->_proofreadingInteraction forKeyedSubscript:v19];
    }
    if (self->_undoRollersByContextID)
    {
      int v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:1668 description:@"It should no longer be necessary to queue replacement deliveries"];
    }
    [(UIWritingToolsCoordinator *)self _setInFlightDeliveryID:v19];
    uint64_t v26 = v14;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [(UIWritingToolsCoordinator *)self _endTextAssistantAnticipationsForContextIDs:v21];

    [(UIWritingToolsCoordinator *)self _beginAnimatedTextReplacementForInFlightDeliveryInContextID:v14];
  }
}

- (void)_updateSelectedRangeForCompositionIfFinishedInContext:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v7];
  if (([v8 isProofreading] & 1) == 0)
  {
    int v9 = [v8 isFinished];
    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
      {
        if (byte_1E8FD4F9C)
        {
          char v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &_updateSelectedRangeForCompositionIfFinishedInContext_force____s_category)+ 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = v18;
            uint64_t v20 = NSStringFromSelector(a2);
            uint64_t v21 = (void *)v20;
            int v22 = @"NO";
            if (v4) {
              uint64_t v23 = @"YES";
            }
            else {
              uint64_t v23 = @"NO";
            }
            *(_DWORD *)buf = 138412802;
            uint64_t v26 = v20;
            long long v28 = v23;
            __int16 v27 = 2112;
            if (v9) {
              int v22 = @"YES";
            }
            __int16 v29 = 2112;
            id v30 = v22;
            _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "%@ force? %@ finished? %@", buf, 0x20u);
          }
        }
      }
    }
    if ((v4 | v9) == 1)
    {
      uint64_t v10 = [v8 originalCharacterRange];
      uint64_t v12 = v11;
      if ([v8 compositionSessionState] == 2)
      {
        id v13 = [v8 activeText];
        uint64_t v12 = [v13 length];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
      unint64_t v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v10, v12);
      int v24 = v15;
      unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      NSUInteger v17 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v7];
      [WeakRetained writingToolsCoordinator:self selectRanges:v16 inContext:v17 completion:&__block_literal_global_200];
    }
  }
}

- (void)_proofreadingOrCompositionFinishedInContext:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = v5;
  if (self->_undoRollersByContextID)
  {
    v12[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v8 = [(UIWritingToolsCoordinator *)self _bufferInvocationForSelector:a2 arguments:v7];

    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
    {
      int v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &_proofreadingOrCompositionFinishedInContext____s_category)+ 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        uint64_t v11 = v8;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Packaged up cleanup following Writing Tools streaming, to deliver after animation finishes, %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    [(UIWritingToolsCoordinator *)self _updateSelectedRangeForCompositionIfFinishedInContext:v5 force:0];
    [(NSMapTable *)self->_effectContainersByLookupID removeObject:v6];
    if (self->_preferredBehavior != 2 && ![(NSMapTable *)self->_effectContainersByLookupID count]) {
      -[UIWritingToolsCoordinator _changeToState:postStateChangeActions:]((uint64_t)self, 2uLL, &__block_literal_global_202);
    }
  }
}

- (void)_updateVisualizationForProofreadingSuggestionsForDelivery:(id)a3 inContext:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v28 = [(NSMutableDictionary *)self->_proofreadingUnderlineInfoBySuggestionID objectForKeyedSubscript:v7];
  __int16 v29 = v6;
  id v8 = [v28 objectForKeyedSubscript:v6];
  __int16 v27 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v7];
  int v9 = [v27 proofreadingController];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = [v9 suggestionWithUUID:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        unint64_t v16 = [v15 replacementString];
        uint64_t v17 = [v16 length];
        [v15 originalRange];
        uint64_t v19 = v17 - v18;

        [(UIWritingToolsCoordinator *)self _updateVisualizationForProofreadingSuggestion:v15 previousState:0 delta:v19 inContext:v7];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v12);
  }

  if ([v27 isFinished] && !objc_msgSend(v28, "count"))
  {
    uint64_t v20 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v7];
    uint64_t v21 = [v20 range];
    uint64_t v23 = v21 + v22;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
    id v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v23, 0);
    NSRange v34 = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [WeakRetained writingToolsCoordinator:self selectRanges:v26 inContext:v20 completion:&__block_literal_global_204];
  }
}

- (void)_didEndProofreadingSession:(id)a3 accepted:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectEnumerator];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__22;
  v28[4] = __Block_byref_object_dispose__22;
  id v29 = 0;
  LOBYTE(self->_bridgingDelegate) = 1;
  objc_initWeak(&location, self);
  uint64_t v21 = 0;
  uint64_t v22 = (id *)&v21;
  uint64_t v23 = 0x3042000000;
  int v24 = __Block_byref_object_copy__129;
  id v25 = __Block_byref_object_dispose__130;
  id v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__UIWritingToolsCoordinator__didEndProofreadingSession_accepted_completion___block_invoke;
  aBlock[3] = &unk_1E52DF730;
  uint64_t v17 = &v21;
  objc_copyWeak(&v19, &location);
  uint64_t v18 = v28;
  id v11 = v10;
  id v15 = v11;
  BOOL v20 = a4;
  id v12 = v9;
  id v16 = v12;
  uint64_t v13 = (void (**)(void))_Block_copy(aBlock);
  objc_storeWeak(v22 + 5, v13);
  v13[2](v13);

  objc_destroyWeak(&v19);
  _Block_object_dispose(&v21, 8);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(v28, 8);
}

void __76__UIWritingToolsCoordinator__didEndProofreadingSession_accepted_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 64));
    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) nextObject];
      uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (v7)
      {
        id v8 = [v7 proofreadingController];
        [v8 finish:*(unsigned __int8 *)(a1 + 72) completion:v9];
      }
      else
      {
        [v3 _removeAllProofreadingDecorations];
        [v3 _setWrappingUpProofreadingSession:0];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }

    id WeakRetained = v9;
  }
}

- (void)_didEndRewritingSession:(id)a3 accepted:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = BYTE2(self->_bridgingDelegate);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(NSDictionary *)self->_replacementTrackersByContextID objectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    if (v6) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = !a4;
    }
    if (v6) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = a4;
    }
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) identifier];
        id v15 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v14];
        if ([v15 compositionSessionState] == 2)
        {
          if (v12) {
            goto LABEL_22;
          }
          uint64_t v16 = 1;
          goto LABEL_21;
        }
        if (![v15 compositionSessionState] || objc_msgSend(v15, "compositionSessionState") == 1)
        {
          if (![v15 compositionSessionState])
          {
            uint64_t v22 = v14;
            uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
            [(UIWritingToolsCoordinator *)self _endTextAssistantAnticipationsForContextIDs:v17];

            if (v11) {
              goto LABEL_22;
            }
LABEL_20:
            uint64_t v16 = 2;
LABEL_21:
            [(UIWritingToolsCoordinator *)self _updateTextViewAndTrackerWithIncomingCompositionSessionState:v16 forDelivery:0 animationParameters:0 contextID:v14 completion:0];
            [(UIWritingToolsCoordinator *)self _updateSelectedRangeForCompositionIfFinishedInContext:v14 force:1];
            goto LABEL_22;
          }
          if (!v11) {
            goto LABEL_20;
          }
        }
LABEL_22:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v9);
  }
}

- (void)_removeAllProofreadingDecorations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSMutableDictionary *)self->_proofreadingHighlightInfoBySuggestionID copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend(v3, "keyEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [(UIWritingToolsCoordinator *)self _removeProofreadingSuggestionPendingUnderlineForPoofreadingSuggestionID:v9];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);

        if (!WeakRetained) {
          [(UIWritingToolsCoordinator *)self _removeProofreadingSuggestionReviewingHighlightForProofreadingSuggestionID:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_updateProofreadingTextAndTrackerToShowOriginal:(BOOL)a3 inContextID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (BYTE3(self->_bridgingDelegate) != v4)
  {
    uint64_t v22 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v6];
    [v22 proofreadingController];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v21 = v28 = 0u;
    uint64_t v7 = [v21 suggestions];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      uint64_t v11 = 3;
      id v23 = v6;
      uint64_t v24 = self;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v13 state] != 4)
          {
            if (!v4)
            {
              long long v14 = [(NSMutableSet *)self->_streamingContextIDs objectForKeyedSubscript:v6];
              [v13 uuid];
              v16 = BOOL v15 = v4;
              [v14 objectForKeyedSubscript:v16];
              uint64_t v17 = v9;
              uint64_t v18 = v10;
              v20 = long long v19 = v7;
              uint64_t v11 = [v20 integerValue];

              uint64_t v7 = v19;
              uint64_t v10 = v18;
              uint64_t v9 = v17;

              BOOL v4 = v15;
              id v6 = v23;
              self = v24;
            }
            [(UIWritingToolsCoordinator *)self _updateForProofreadingSuggestion:v13 state:v11 saveState:0 inContext:v6];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }

    BYTE3(self->_bridgingDelegate) = v4;
  }
}

- (void)_updateForProofreadingSuggestion:(id)a3 state:(int64_t)a4 saveState:(BOOL)a5 inContext:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  long long v12 = (void *)[v10 state];
  long long v13 = [v10 uuid];
  long long v14 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v11];
  BOOL v15 = [v14 proofreadingController];
  -[UIWritingToolsCoordinator _synchronizeSuggestionInfoStateForProofreadingSuggestionWithIdentifier:state:]((uint64_t)self, v13, (uint64_t)v12);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__UIWritingToolsCoordinator__updateForProofreadingSuggestion_state_saveState_inContext___block_invoke;
  aBlock[3] = &unk_1E52DF780;
  objc_copyWeak(v28, &location);
  id v16 = v13;
  id v23 = v16;
  v28[1] = (id)a4;
  BOOL v29 = a5;
  id v17 = v11;
  id v24 = v17;
  id v18 = v10;
  id v25 = v18;
  long long v26 = self;
  v28[2] = v12;
  v28[3] = (id)a2;
  id v19 = v15;
  id v27 = v19;
  long long v20 = _Block_copy(aBlock);
  [v19 updateSuggestionWithUUID:v16 state:a4 completion:v20];

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

void __88__UIWritingToolsCoordinator__updateForProofreadingSuggestion_state_saveState_inContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    -[UIWritingToolsCoordinator _synchronizeSuggestionInfoStateForProofreadingSuggestionWithIdentifier:state:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void *)(a1 + 80));
    if (*(unsigned char *)(a1 + 104))
    {
      uint64_t v9 = [NSNumber numberWithInteger:*(void *)(a1 + 80)];
      id v10 = [v8 _backingProofreadingSuggestionStatesPerSuggestionIDByContextID];
      id v11 = [v10 objectForKeyedSubscript:*(void *)(a1 + 40)];
      [v11 setObject:v9 forKeyedSubscript:*(void *)(a1 + 32)];
    }
    [v8 _updateVisualizationForProofreadingSuggestion:*(void *)(a1 + 48) previousState:*(void *)(a1 + 88) delta:*(void *)(*(void *)(a1 + 56) + 88) inContext:*(void *)(a1 + 40)];
    [v8 _setProofreadingVisualizationReplacementDelta:0];
    if ([*(id *)(a1 + 48) state] == 1)
    {
      long long v12 = [*(id *)(*(void *)(a1 + 56) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
      if (!v12)
      {
        id v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:*(void *)(a1 + 96), v8, @"UIWritingToolsCoordinator.m", 1850, @"UIWritingToolsCoordinator can't find context for contextID: %@", *(void *)(a1 + 40) object file lineNumber description];
      }
      long long v13 = [*(id *)(a1 + 64) editTracker];
      uint64_t v14 = [*(id *)(a1 + 48) originalRange];
      uint64_t v16 = objc_msgSend(v13, "rangeOfSuggestionWithRange:UUID:applyDelta:", v14, v15, *(void *)(a1 + 32), 1);
      uint64_t v18 = v17;

      objc_initWeak(&location, v8);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__UIWritingToolsCoordinator__updateForProofreadingSuggestion_state_saveState_inContext___block_invoke_2;
      aBlock[3] = &unk_1E52DF758;
      objc_copyWeak(&v28, &location);
      id v19 = *(id *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 56);
      id v26 = v19;
      uint64_t v27 = v20;
      long long v21 = _Block_copy(aBlock);
      id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + 288));
      id v23 = [*(id *)(*(void *)(a1 + 56) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
      objc_msgSend(v22, "writingToolsCoordinator:requestsBoundingBezierPathsForRange:inContext:completion:", v8, v16, v18, v23, v21);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }
}

void __88__UIWritingToolsCoordinator__updateForProofreadingSuggestion_state_saveState_inContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (![v17 count]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"-writingToolsCoordinator:boundingBezierPathsForRange:inContext: returned an empty array"];
    }
    BOOL v4 = [v17 firstObject];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    long long v13 = [WeakRetained _sessionTextViewDelegate];
    uint64_t v14 = [WeakRetained _activeSessionUUID];
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 280));
    objc_msgSend(v13, "proofreadingSessionWithUUID:showDetailsForSuggestionWithUUID:relativeToRect:inView:", v14, v15, v16, v6, v8, v10, v12);
  }
}

- (void)_updateVisualizationForProofreadingSuggestion:(id)a3 previousState:(int64_t)a4 delta:(int64_t)a5 inContext:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  double v12 = [v10 uuid];
  unint64_t v13 = [v10 state];
  id v50 = v11;
  __int16 v48 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v11];
  uint64_t v14 = [v48 proofreadingController];
  uint64_t v15 = [v14 editTracker];
  uint64_t v16 = [v10 originalRange];
  uint64_t v18 = objc_msgSend(v15, "rangeOfSuggestionWithRange:UUID:applyDelta:", v16, v17, v12, v13 < 2);
  uint64_t v20 = v19;

  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4)
  {
    uint64_t v40 = *(id *)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &qword_1EB25F360) + 8);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = NSStringFromSelector(a2);
      uint64_t v42 = (void *)v41;
      if (v13 > 4) {
        NSRange v43 = @"unknown";
      }
      else {
        NSRange v43 = off_1E52DF8C0[v13];
      }
      if ((unint64_t)a4 > 4) {
        id v46 = @"unknown";
      }
      else {
        id v46 = off_1E52DF8C0[a4];
      }
      *(_DWORD *)buf = 138413570;
      uint64_t v53 = v41;
      __int16 v54 = 2112;
      long long v55 = v43;
      __int16 v56 = 2112;
      id v57 = v46;
      __int16 v58 = 2048;
      uint64_t v59 = v18;
      __int16 v60 = 2048;
      uint64_t v61 = v20;
      __int16 v62 = 2048;
      int64_t v63 = a5;
      _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_ERROR, "%@, state=%@, previousState=%@, range={%lu, %lu} delta=%li", buf, 0x3Eu);
    }
  }
  if (v20)
  {
    long long v21 = v50;
    if (v13 > 1)
    {
      [(UIWritingToolsCoordinator *)self _removeProofreadingSuggestionPendingUnderlineForPoofreadingSuggestionID:v12];
      uint64_t v26 = 0;
      uint64_t v27 = v20;
    }
    else
    {
      -[UIWritingToolsCoordinator _addProofreadSuggestionPendingUnderlineForRange:inContext:forProofreadingSuggestionID:](self, "_addProofreadSuggestionPendingUnderlineForRange:inContext:forProofreadingSuggestionID:", v18, v20, v50, v12);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);
      if (v13) {
        BOOL v23 = WeakRetained == 0;
      }
      else {
        BOOL v23 = 1;
      }
      int v24 = v23;

      BOOL v25 = v24 == 0;
      if (v24) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = v20;
      }
      if (v25) {
        uint64_t v27 = 0;
      }
      else {
        uint64_t v27 = v20;
      }
    }
    uint64_t v32 = v27 + v18;
    if (v13 == a4)
    {
LABEL_28:
      id v28 = v48;
      if (!v26 && v32 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v35 = objc_loadWeakRetained((id *)&self->_state);
        uint64_t v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v32, 0);
        int64_t v51 = v36;
        long long v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
        long long v38 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v50];
        [v35 writingToolsCoordinator:self selectRanges:v37 inContext:v38 completion:&__block_literal_global_218];

        long long v21 = v50;
      }
      goto LABEL_31;
    }
    if (a4 == 1)
    {
      [(UIWritingToolsCoordinator *)self _removeProofreadingSuggestionReviewingHighlightForProofreadingSuggestionID:v12];
      backingProofreadingSuggestionStatesPerSuggestionIDByContextID = self->_backingProofreadingSuggestionStatesPerSuggestionIDByContextID;
      self->_backingProofreadingSuggestionStatesPerSuggestionIDByContextID = 0;
LABEL_27:

      goto LABEL_28;
    }
    if (v13 != 4)
    {
      if (v13 != 1)
      {
        if (self->_backingProofreadingSuggestionStatesPerSuggestionIDByContextID) {
          uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
        }
        goto LABEL_28;
      }
      -[UIWritingToolsCoordinator _addProofreadingSuggestionReviewingHighlightForRange:inContext:forProofreadingSuggestionID:](self, "_addProofreadingSuggestionReviewingHighlightForRange:inContext:forProofreadingSuggestionID:", v18, v20, v50, v12);
      NSRange v34 = [v10 uuid];
      backingProofreadingSuggestionStatesPerSuggestionIDByContextID = self->_backingProofreadingSuggestionStatesPerSuggestionIDByContextID;
      self->_backingProofreadingSuggestionStatesPerSuggestionIDByContextID = v34;
      goto LABEL_27;
    }
    id v28 = v48;
    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
      {
        if (byte_1E8FD4FA4)
        {
          long long v39 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &qword_1EB25F368) + 8);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_ERROR, "Surprise! updating visualization for invalid state with valid range. Invalidating the selection range", buf, 2u);
          }
        }
      }
    }
  }
  else
  {
    long long v21 = v50;
    if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
      {
        if (byte_1E8FD4FA4)
        {
          uint64_t v44 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &qword_1EB25F370) + 8);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            if (v13 > 4) {
              uint64_t v45 = @"unknown";
            }
            else {
              uint64_t v45 = off_1E52DF8C0[v13];
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v53 = (uint64_t)v45;
            uint64_t v47 = v44;
            _os_log_impl(&dword_1853B0000, v47, OS_LOG_TYPE_ERROR, "Unexpected request to update visualization for a %@ proofreading suggestion with a 0-length range", buf, 0xCu);

            long long v21 = v50;
          }
        }
      }
    }
    id v28 = v48;
    if ([(NSMutableDictionary *)self->_backingProofreadingSuggestionStatesPerSuggestionIDByContextID isEqual:v12])
    {
      id v29 = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);
      objc_msgSend(v29, "_wtc_invalidateSelectionUIHidden");

      id v30 = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);
      objc_msgSend(v30, "_wtc_invalidateGrabberSuppression");

      long long v31 = self->_backingProofreadingSuggestionStatesPerSuggestionIDByContextID;
      self->_backingProofreadingSuggestionStatesPerSuggestionIDByContextID = 0;
    }
    [(UIWritingToolsCoordinator *)self _removeProofreadingSuggestionPendingUnderlineForPoofreadingSuggestionID:v12];
  }
LABEL_31:
  if (a5) {
    -[UIWritingToolsCoordinator _resetProofreadingDecorationsForSuggestionsFollowingChangeLocationIndex:inContext:](self, "_resetProofreadingDecorationsForSuggestionsFollowingChangeLocationIndex:inContext:", [v10 originalRange], v21);
  }
}

- (void)_invalidateProofreadingSuggestionWithUUID:(id)a3 contextID:(id)a4
{
  p_proofreadingVisualizationReplacementDelta = &self->_proofreadingVisualizationReplacementDelta;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proofreadingVisualizationReplacementDelta);
  [WeakRetained proofreadingSessionWithUUID:self->_writingToolsDelegateMessageInvocationBuffer updateState:4 forSuggestionWithUUID:v8];

  id v11 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v7];

  id v10 = [v11 proofreadingController];
  [v10 updateSuggestionWithUUID:v8 state:4 completion:&__block_literal_global_221];
}

- (void)_resetProofreadingDecorationsForSuggestionsFollowingChangeLocationIndex:(unint64_t)a3 inContext:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a4;
  uint64_t v19 = -[NSMutableDictionary objectForKeyedSubscript:](self->_anticipationContainerInfosByContextID, "objectForKeyedSubscript:");
  id v22 = [v19 proofreadingController];
  double v5 = [v22 suggestions];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [v10 uuid];
        if ([v10 state] == 4)
        {
          [(UIWritingToolsCoordinator *)self _removeProofreadingSuggestionPendingUnderlineForPoofreadingSuggestionID:v11];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);

          if (!WeakRetained) {
            [(UIWritingToolsCoordinator *)self _removeProofreadingSuggestionReviewingHighlightForProofreadingSuggestionID:v11];
          }
        }
        if ((unint64_t)[v10 state] <= 1)
        {
          unint64_t v13 = [v22 editTracker];
          uint64_t v14 = [v10 originalRange];
          unint64_t v16 = objc_msgSend(v13, "rangeOfSuggestionWithRange:UUID:applyDelta:", v14, v15, v11, 1);
          uint64_t v18 = v17;

          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [(UIWritingToolsCoordinator *)self _invalidateProofreadingSuggestionWithUUID:v11 contextID:v21];
          }
          else if (v16 >= a3)
          {
            -[UIWritingToolsCoordinator _addProofreadSuggestionPendingUnderlineForRange:inContext:forProofreadingSuggestionID:](self, "_addProofreadSuggestionPendingUnderlineForRange:inContext:forProofreadingSuggestionID:", v16, v18, v21, v11);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
}

- (void)_addProofreadSuggestionPendingUnderlineForRange:(_NSRange)a3 inContext:(id)a4 forProofreadingSuggestionID:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__UIWritingToolsCoordinator__addProofreadSuggestionPendingUnderlineForRange_inContext_forProofreadingSuggestionID___block_invoke;
  v11[3] = &unk_1E52DF7C8;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  -[UIWritingToolsCoordinator _drawProofreadingUnderlinesForRange:inContext:forProofreadingSuggestionID:recordUnderlineInfo:](self, "_drawProofreadingUnderlinesForRange:inContext:forProofreadingSuggestionID:recordUnderlineInfo:", location, length, a4, v10, v11);
}

uint64_t __115__UIWritingToolsCoordinator__addProofreadSuggestionPendingUnderlineForRange_inContext_forProofreadingSuggestionID___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 208);
    return [v4 setObject:a2 forKeyedSubscript:v3];
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Failed to create underline info for drawing underline", buf, 2u);
      }
    }
    else
    {
      uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_UIUseWTCDecorations_block_invoke_3___s_category)+ 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Failed to create underline info for drawing underline", v8, 2u);
      }
    }
    return [*(id *)(*(void *)(a1 + 32) + 208) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)_addProofreadingSuggestionReviewingHighlightForRange:(_NSRange)a3 inContext:(id)a4 forProofreadingSuggestionID:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  id v10 = -[UIWritingToolsCoordinator _drawProofreadingHighlightsForRange:inContext:forProofreadingSuggestionID:](self, "_drawProofreadingHighlightsForRange:inContext:forProofreadingSuggestionID:", location, length, a4, v9);
  if (v10)
  {
    [(NSMutableDictionary *)self->_proofreadingSuggestionInfoBySuggestionID setObject:v10 forKeyedSubscript:v9];
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Failed to create underline info for drawing underline", buf, 2u);
      }
    }
    else
    {
      id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_addProofreadingSuggestionReviewingHighlightForRange_inContext_forProofreadingSuggestionID____s_category)+ 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unint64_t v13 = 0;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Failed to create underline info for drawing underline", v13, 2u);
      }
    }
    [(NSMutableDictionary *)self->_proofreadingSuggestionInfoBySuggestionID removeObjectForKey:v9];
  }
}

- (void)_removeProofreadingSuggestionPendingUnderlineForPoofreadingSuggestionID:(id)a3
{
  id v4 = a3;
  [(UIWritingToolsCoordinator *)self _undrawProofreadingUnderlinesForProofreadingSuggestionID:v4];
  [(NSMutableDictionary *)self->_proofreadingHighlightInfoBySuggestionID removeObjectForKey:v4];
}

- (void)_removeProofreadingSuggestionReviewingHighlightForProofreadingSuggestionID:(id)a3
{
  id v4 = a3;
  [(UIWritingToolsCoordinator *)self _undrawProofreadingHighlightsForProofreadingSuggestionID:v4];
  [(NSMutableDictionary *)self->_proofreadingSuggestionInfoBySuggestionID removeObjectForKey:v4];
}

- (void)_decorationContainerViewForRange:(_NSRange)a3 inContext:(id)a4 completion:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__UIWritingToolsCoordinator__decorationContainerViewForRange_inContext_completion___block_invoke;
  aBlock[3] = &unk_1E52DF7F0;
  id v16 = v9;
  id v10 = v9;
  id v11 = a4;
  id v12 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
  uint64_t v14 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v11];

  objc_msgSend(WeakRetained, "writingToolsCoordinator:requestsDecorationContainerViewForRange:inContext:completion:", self, location, length, v14, v12);
}

uint64_t __83__UIWritingToolsCoordinator__decorationContainerViewForRange_inContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_drawProofreadingUnderlinesForRange:(_NSRange)a3 inContext:(id)a4 forProofreadingSuggestionID:(id)a5 recordUnderlineInfo:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger v9 = a3.location;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = (void (**)(id, void *))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);

  if (WeakRetained)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);
    objc_msgSend(v15, "_wtc_underlineTextInCharacterRange:proofreadingSuggestionID:", v9, length, v12);

    id v16 = +[_UIWTCProofreadingDecorationInfo underlineInfoWithIdentifier:v12 ranges:MEMORY[0x1E4F1CBF0] decorationPaths:MEMORY[0x1E4F1CC08] containers:MEMORY[0x1E4F1CBF0]];
    v13[2](v13, v16);
  }
  else
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v9, length);
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __123__UIWritingToolsCoordinator__drawProofreadingUnderlinesForRange_inContext_forProofreadingSuggestionID_recordUnderlineInfo___block_invoke;
    aBlock[3] = &unk_1E52DF818;
    objc_copyWeak(&v26, &location);
    id v23 = v12;
    id v18 = v17;
    id v24 = v18;
    long long v25 = v13;
    uint64_t v19 = _Block_copy(aBlock);
    id v20 = objc_loadWeakRetained((id *)&self->_state);
    id v21 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v11];
    objc_msgSend(v20, "writingToolsCoordinator:requestsUnderlinePathsForRange:inContext:completion:", self, v9, length, v21, v19);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

void __123__UIWritingToolsCoordinator__drawProofreadingUnderlinesForRange_inContext_forProofreadingSuggestionID_recordUnderlineInfo___block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained decorationContainerView];
    uint64_t v7 = [v6 _window];

    if (!v7) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"No window for drawing proofreading decorations. decorationContainerView=%@", v6 format];
    }
    uint64_t v8 = [v5 _proofreadingDecorationView];
    if (!v8)
    {
      NSUInteger v9 = [_UIWTCProofreadingDecorationView alloc];
      [v6 bounds];
      uint64_t v8 = -[_UIWTCProofreadingDecorationView initWithFrame:](v9, "initWithFrame:");
      [(UIView *)v8 setAutoresizingMask:18];
      [v5 _setProofreadingDecorationView:v8];
    }
    id v10 = [(UIView *)v8 superview];

    if (v10 != v6) {
      [v6 addSubview:v8];
    }
    uint64_t v11 = *(void *)(a1 + 32);
    v21[0] = *(void *)(a1 + 40);
    uint64_t v17 = v6;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    uint64_t v19 = *(void *)(a1 + 40);
    id v20 = v3;
    unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v14 = [v5 decorationContainerView];
    id v18 = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    id v16 = +[_UIWTCProofreadingDecorationInfo underlineInfoWithIdentifier:v11 ranges:v12 decorationPaths:v13 containers:v15];

    [(_UIWTCProofreadingDecorationView *)v8 addDecorationInfo:v16];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)_drawProofreadingHighlightsForRange:(_NSRange)a3 inContext:(id)a4 forProofreadingSuggestionID:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);
    objc_msgSend(v12, "_wtc_highlightProofreadingReviewingRange:", location, length);

    unint64_t v13 = +[_UIWTCProofreadingDecorationInfo highlightInfoWithIdentifier:v10 ranges:MEMORY[0x1E4F1CBF0] decorationPaths:MEMORY[0x1E4F1CC08] containers:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__22;
    uint64_t v36 = __Block_byref_object_dispose__22;
    id v37 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __103__UIWritingToolsCoordinator__drawProofreadingHighlightsForRange_inContext_forProofreadingSuggestionID___block_invoke;
    aBlock[3] = &unk_1E52DF840;
    void aBlock[4] = &v32;
    id v30 = _Block_copy(aBlock);
    id v15 = objc_loadWeakRetained((id *)&self->_state);
    id v16 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v9];
    objc_msgSend(v15, "writingToolsCoordinator:requestsBoundingBezierPathsForRange:inContext:completion:", self, location, length, v16, v30);

    uint64_t v17 = [(UIWritingToolsCoordinator *)self decorationContainerView];
    id v18 = [v17 _window];
    LODWORD(v16) = v18 == 0;

    if (v16) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"No window for drawing proofreading decorations. decorationContainerView=%@", v17 format];
    }
    storedTargetedPreviewsByContextID = self->_storedTargetedPreviewsByContextID;
    if (!storedTargetedPreviewsByContextID)
    {
      id v20 = [_UIWTCProofreadingDecorationView alloc];
      [v17 bounds];
      id v21 = -[_UIWTCProofreadingDecorationView initWithFrame:](v20, "initWithFrame:");
      id v22 = self->_storedTargetedPreviewsByContextID;
      self->_storedTargetedPreviewsByContextID = v21;

      [(NSMutableDictionary *)self->_storedTargetedPreviewsByContextID setAutoresizingMask:18];
      storedTargetedPreviewsByContextID = self->_storedTargetedPreviewsByContextID;
    }
    id v23 = [(NSMutableDictionary *)storedTargetedPreviewsByContextID superview];
    BOOL v24 = v23 == v17;

    if (!v24) {
      [v17 addSubview:self->_storedTargetedPreviewsByContextID];
    }
    v41[0] = v14;
    long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    long long v39 = v14;
    uint64_t v40 = v33[5];
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    uint64_t v27 = [(UIWritingToolsCoordinator *)self decorationContainerView];
    long long v38 = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    unint64_t v13 = +[_UIWTCProofreadingDecorationInfo highlightInfoWithIdentifier:v10 ranges:v25 decorationPaths:v26 containers:v28];

    [(NSMutableDictionary *)self->_storedTargetedPreviewsByContextID addDecorationInfo:v13];
    _Block_object_dispose(&v32, 8);
  }
  return v13;
}

void __103__UIWritingToolsCoordinator__drawProofreadingHighlightsForRange_inContext_forProofreadingSuggestionID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_undrawProofreadingUnderlinesForProofreadingSuggestionID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);

  if (WeakRetained)
  {
    uint64_t v6 = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);
    objc_msgSend(v6, "_wtc_removeUnderlineForProofreadingSuggestionID:", v4);
  }
  else
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_proofreadingHighlightInfoBySuggestionID objectForKeyedSubscript:v4];
    if (v6)
    {
      [(NSMutableDictionary *)self->_storedTargetedPreviewsByContextID removeDecorationInfo:v6];
    }
    else if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
      {
        if (byte_1E8FD4FA4)
        {
          uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &_undrawProofreadingUnderlinesForProofreadingSuggestionID____s_category)+ 8);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            int v8 = 138412290;
            id v9 = v4;
            _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Asked to undraw an underline that's missing from the index. Hopefully it's already been undrawn. Associated proofreadingSuggestionID = %@", (uint8_t *)&v8, 0xCu);
          }
        }
      }
    }
  }
}

- (void)_undrawProofreadingHighlightsForProofreadingSuggestionID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);

  if (WeakRetained)
  {
    uint64_t v6 = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);
    objc_msgSend(v6, "_wtc_invalidateGrabberSuppression");
  }
  else
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_proofreadingSuggestionInfoBySuggestionID objectForKeyedSubscript:v4];
    if (v6)
    {
      [(NSMutableDictionary *)self->_storedTargetedPreviewsByContextID removeDecorationInfo:v6];
    }
    else if (os_variant_has_internal_diagnostics())
    {
      if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0)
      {
        if (byte_1E8FD4FA4)
        {
          uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantProofread", &_undrawProofreadingHighlightsForProofreadingSuggestionID____s_category)+ 8);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            int v8 = 138412290;
            id v9 = v4;
            _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Asked to undraw a highlight that's missing from the index. Hopefully it's already been undrawn. Associated proofreadingSuggestionID = %@", (uint8_t *)&v8, 0xCu);
          }
        }
      }
    }
  }
}

- (id)_replacementTrackerForContextID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:a3];
}

- (void)_updateProofreadingDeliveryWithReplacement:(id)a3 accordingToProofreadingSuggestionWithIdentifier:(id)a4 replacingCharactersInRange:(_NSRange)a5 newState:(int64_t)a6 contextID:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v14 = a3;
  [(_UIWTCProofreadingInteraction *)self->_proofreadingInteraction addObject:a4];
  uint64_t v12 = location - (unint64_t)self->_proofreadingDeliveryReplacement;
  if (v12 < 0)
  {
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"UIWritingToolsCoordinator.m" lineNumber:2183 description:@"Range calculation error for accumulating proofreading replacements"];
  }
  -[NSMutableArray replaceCharactersInRange:withAttributedString:](self->_proofreadingDeliverySuggestionIDs, "replaceCharactersInRange:withAttributedString:", v12, length, v14);
}

- (void)_delegateUpdateTextAccordingToProofreadingSuggestionInfoWithIdentifier:(id)a3 replacingCharactersInRange:(_NSRange)a4 newState:(int64_t)a5 contextID:(id)a6 updateCompletion:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger v11 = a4.location;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  self->_activeSessionUUID = 0;
  uint64_t v41 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectForKeyedSubscript:v14];
  id v16 = [(NSDictionary *)self->_replacementTrackersByContextID objectForKeyedSubscript:v14];
  uint64_t v17 = [v16 evaluatedRange];
  id v18 = [(NSMutableDictionary *)self->_proofreadingSuggestionIDsPerDeliveryIDByContextID objectForKeyedSubscript:v14];
  long long v38 = (void *)length;
  long long v39 = (void *)v11;
  uint64_t v19 = objc_msgSend(v18, "attributedSubstringFromRange:", v11, length);
  id v20 = [(_UIWTCProofreadingDecorationView *)self->_proofreadingDecorationView objectForKeyedSubscript:v13];
  id v35 = (id *)a5;
  uint64_t v40 = v20;
  if (a5 == 3)
  {
    uint64_t v21 = [v20 originalRange];
    uint64_t v23 = v22;
    uint64_t v24 = v21 + v17;
    [v41 proofreadingController];
    long long v33 = v18;
    id v25 = v15;
    v27 = id v26 = v13;
    uint64_t v28 = [v27 contextString];
    id v29 = objc_msgSend(v28, "attributedSubstringFromRange:", v24, v23);

    id v13 = v26;
    id v15 = v25;
    id v18 = v33;
  }
  else
  {
    id v29 = [v20 attributedString];
  }
  if (BYTE1(self->_bridgingDelegate)) {
    goto LABEL_5;
  }
  if (([v19 isEqualToAttributedString:v29] & 1) == 0)
  {
    objc_initWeak(location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __163__UIWritingToolsCoordinator__delegateUpdateTextAccordingToProofreadingSuggestionInfoWithIdentifier_replacingCharactersInRange_newState_contextID_updateCompletion___block_invoke;
    aBlock[3] = &unk_1E52DF868;
    objc_copyWeak(v47, location);
    id v34 = v29;
    id v43 = v34;
    v47[1] = (id)a2;
    id v44 = v18;
    v47[2] = v39;
    v47[3] = v38;
    id v37 = v19;
    id v45 = v19;
    id v46 = v15;
    long long v31 = _Block_copy(aBlock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
    objc_msgSend(WeakRetained, "writingToolsCoordinator:replaceRange:inContext:proposedText:reason:animationParameters:completion:", self, v39, v38, v16, v34, 0, 0, v31);

    objc_destroyWeak(v47);
    objc_destroyWeak(location);
    uint64_t v19 = v37;
    goto LABEL_7;
  }
  if (BYTE1(self->_bridgingDelegate) || (id *)[v40 state] != v35)
  {
LABEL_5:
    uint64_t v30 = [v29 length];
    self->_activeSessionUUID = (NSUUID *)(v30 - [v19 length]);
  }
  (*((void (**)(id, void *))v15 + 2))(v15, v29);
LABEL_7:
}

void __163__UIWritingToolsCoordinator__delegateUpdateTextAccordingToProofreadingSuggestionInfoWithIdentifier_replacingCharactersInRange_newState_contextID_updateCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v10)
    {
      id v4 = [v10 string];
      double v5 = [*(id *)(a1 + 32) string];
      id v6 = v4;
      id v7 = v5;
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = v7;
        if (v6 && v7)
        {
          char v9 = [v6 isEqual:v7];

          if (v9) {
            goto LABEL_12;
          }
        }
        else
        {
        }
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        [v6 handleFailureInMethod:*(void *)(a1 + 72) object:WeakRetained file:@"UIWritingToolsCoordinator.m" lineNumber:2212 description:@"Writing Tools Coordinator doesn't yet handle client adjustments to proofreading results"];
      }
    }
LABEL_12:
    objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withAttributedString:", *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 32));
    objc_msgSend(WeakRetained, "_setProofreadingVisualizationReplacementDelta:", objc_msgSend(*(id *)(a1 + 32), "length") - objc_msgSend(*(id *)(a1 + 48), "length"));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (id)_replacementTracker
{
  id v2 = [(NSMutableDictionary *)self->_anticipationContainerInfosByContextID objectEnumerator];
  uint64_t v3 = [v2 allObjects];
  id v4 = [v3 objectAtIndexedSubscript:0];

  return v4;
}

- (BOOL)_showingOriginal
{
  return BYTE3(self->_bridgingDelegate);
}

+ (BOOL)isWritingToolsAvailable
{
  return +[UIResponder _isWritingToolsAvailable];
}

- (_UIWTCTemporaryBridging)_bridgingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proposedEvaluationContextsByContextID);
  return (_UIWTCTemporaryBridging *)WeakRetained;
}

- (void)_setBridgingDelegate:(id)a3
{
}

- (NSDictionary)_proposedEvaluationContextsByContextID
{
  return self->_acceptedEvaluationContextsByContextID;
}

- (void)_setProposedEvaluationContextsByContextID:(id)a3
{
}

- (NSDictionary)_acceptedEvaluationContextsByContextID
{
  return self->_replacementTrackersByContextID;
}

- (void)_setAcceptedEvaluationContextsByContextID:(id)a3
{
}

- (NSDictionary)_replacementTrackersByContextID
{
  return &self->_anticipationContainerInfosByContextID->super;
}

- (void)_setReplacementTrackersByContextID:(id)a3
{
}

- (NSMutableDictionary)_anticipationContainerInfosByContextID
{
  return (NSMutableDictionary *)self->_chosenSuggestion;
}

- (void)_setAnticipationContainerInfosByContextID:(id)a3
{
}

- (NSWritingToolsProofreadingSuggestion)_chosenSuggestion
{
  return (NSWritingToolsProofreadingSuggestion *)self->_contextIDForChosenSuggestion;
}

- (void)_setChosenSuggestion:(id)a3
{
}

- (NSUUID)_contextIDForChosenSuggestion
{
  return (NSUUID *)self->_sessionTextViewDelegate;
}

- (void)_setContextIDForChosenSuggestion:(id)a3
{
}

- (WTTextViewDelegate_Proposed_v1)_sessionTextViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proofreadingVisualizationReplacementDelta);
  return (WTTextViewDelegate_Proposed_v1 *)WeakRetained;
}

- (void)_setSetSessionTextViewDelegate:(id)a3
{
}

- (int64_t)_proofreadingVisualizationReplacementDelta
{
  return (int64_t)self->_activeSessionUUID;
}

- (void)_setProofreadingVisualizationReplacementDelta:(int64_t)a3
{
  self->_activeSessionUUID = (NSUUID *)a3;
}

- (NSUUID)_activeSessionUUID
{
  return (NSUUID *)self->_writingToolsDelegateMessageInvocationBuffer;
}

- (void)_setActiveSessionUUID:(id)a3
{
}

- (NSMutableArray)_writingToolsDelegateMessageInvocationBuffer
{
  return (NSMutableArray *)self->_pendingCompletionForWritingToolsWillBegin;
}

- (void)_setWritingToolsDelegateMessageInvocationBuffer:(id)a3
{
}

- (id)_pendingCompletionForWritingToolsWillBegin
{
  return self->_pendingSessionForWritingToolsWillBegin;
}

- (void)_setPendingCompletionForWritingToolsWillBegin:(id)a3
{
}

- (WTSession)_pendingSessionForWritingToolsWillBegin
{
  return (WTSession *)self->_proofreadingDeliveryOffset;
}

- (void)_setPendingSessionForWritingToolsWillBegin:(id)a3
{
}

- (unint64_t)_proofreadingDeliveryOffset
{
  return (unint64_t)self->_proofreadingDeliveryReplacement;
}

- (void)_setProofreadingDeliveryOffset:(unint64_t)a3
{
  self->_proofreadingDeliveryReplacement = (NSMutableAttributedString *)a3;
}

- (NSMutableAttributedString)_proofreadingDeliveryReplacement
{
  return (NSMutableAttributedString *)self->_proofreadingDeliverySuggestionIDs;
}

- (void)_setProofreadingDeliveryReplacement:(id)a3
{
}

- (NSMutableArray)_proofreadingDeliverySuggestionIDs
{
  return (NSMutableArray *)self->_proofreadingInteraction;
}

- (void)_setProofreadingDeliverySuggestionIDs:(id)a3
{
}

- (BOOL)_isWrappingUpProofreadingSession
{
  return (BOOL)self->_bridgingDelegate;
}

- (void)_setWrappingUpProofreadingSession:(BOOL)a3
{
  LOBYTE(self->_bridgingDelegate) = a3;
}

- (_UIWTCProofreadingInteraction)_proofreadingInteraction
{
  return (_UIWTCProofreadingInteraction *)self->_activeReviewingUUID;
}

- (void)_setProofreadingInteraction:(id)a3
{
}

- (BOOL)_isSynchronizingWithUndoRedo
{
  return BYTE1(self->_bridgingDelegate);
}

- (void)_setSynchronizingWithUndoRedo:(BOOL)a3
{
  BYTE1(self->_bridgingDelegate) = a3;
}

- (BOOL)_isCancelingSession
{
  return BYTE2(self->_bridgingDelegate);
}

- (void)_setCancelingSession:(BOOL)a3
{
  BYTE2(self->_bridgingDelegate) = a3;
}

- (void)_setShowingOriginal:(BOOL)a3
{
  BYTE3(self->_bridgingDelegate) = a3;
}

- (NSUUID)_activeReviewingUUID
{
  return (NSUUID *)self->_backingProofreadingSuggestionStatesPerSuggestionIDByContextID;
}

- (void)_setActiveReviewingUUID:(id)a3
{
}

- (NSMutableDictionary)_backingProofreadingSuggestionStatesPerSuggestionIDByContextID
{
  return (NSMutableDictionary *)self->_streamingContextIDs;
}

- (void)_setBackingProofreadingSuggestionStatesPerSuggestionIDByContextID:(id)a3
{
}

- (NSMutableSet)_streamingContextIDs
{
  return (NSMutableSet *)self->_effectContainersByLookupID;
}

- (void)_setStreamingContextIDs:(id)a3
{
}

- (NSMapTable)_effectContainersByLookupID
{
  return (NSMapTable *)self->_currentProofreadingTextPerContextID;
}

- (void)_setEffectContainersByLookupID:(id)a3
{
}

- (NSMutableDictionary)_currentProofreadingTextPerContextID
{
  return self->_proofreadingSuggestionIDsPerDeliveryIDByContextID;
}

- (void)_setCurrentProofreadingTextPerContextID:(id)a3
{
}

- (NSMutableDictionary)_proofreadingSuggestionIDsPerDeliveryIDByContextID
{
  return self->_proofreadingUnderlineInfoBySuggestionID;
}

- (void)_setPoofreadingSuggestionIDsPerDeliveryIDByContextID:(id)a3
{
}

- (NSMutableDictionary)_proofreadingUnderlineInfoBySuggestionID
{
  return self->_proofreadingHighlightInfoBySuggestionID;
}

- (void)_setProofreadingUnderlineInfoBySuggestionID:(id)a3
{
}

- (NSMutableDictionary)_proofreadingHighlightInfoBySuggestionID
{
  return self->_proofreadingSuggestionInfoBySuggestionID;
}

- (void)_setProofreadingHighlightInfoBySuggestionID:(id)a3
{
}

- (NSMutableDictionary)_proofreadingSuggestionInfoBySuggestionID
{
  return (NSMutableDictionary *)self->_proofreadingDecorationView;
}

- (void)_setProofreadingSuggestionInfoBySuggestionID:(id)a3
{
}

- (_UIWTCProofreadingDecorationView)_proofreadingDecorationView
{
  return (_UIWTCProofreadingDecorationView *)self->_storedTargetedPreviewsByContextID;
}

- (void)_setProofreadingDecorationView:(id)a3
{
}

- (void)_setStoredTargetedPreviewsByContextID:(id)a3
{
}

- (NSUUID)_inFlightDeliveryID
{
  return (NSUUID *)self->_undoRollersByContextID;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIView *)WeakRetained;
}

- (UIWritingToolsCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_state);
  return (UIWritingToolsCoordinatorDelegate *)WeakRetained;
}

- (int64_t)state
{
  return self->_preferredBehavior;
}

- (int64_t)preferredBehavior
{
  return self->_preferredResultOptions;
}

- (void)setPreferredBehavior:(int64_t)a3
{
  self->_preferredResultOptions = a3;
}

- (unint64_t)preferredResultOptions
{
  return (unint64_t)self[1].super.isa;
}

- (void)setPreferredResultOptions:(unint64_t)a3
{
  self[1].super.isa = (Class)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_state);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_decorationContainerView);
  objc_storeStrong((id *)&self->_effectContainerView, 0);
  objc_storeStrong((id *)&self->_undoRollersByContextID, 0);
  objc_storeStrong((id *)&self->_inFlightDeliveryID, 0);
  objc_storeStrong((id *)&self->_storedTargetedPreviewsByContextID, 0);
  objc_storeStrong((id *)&self->_proofreadingDecorationView, 0);
  objc_storeStrong((id *)&self->_proofreadingSuggestionInfoBySuggestionID, 0);
  objc_storeStrong((id *)&self->_proofreadingHighlightInfoBySuggestionID, 0);
  objc_storeStrong((id *)&self->_proofreadingUnderlineInfoBySuggestionID, 0);
  objc_storeStrong((id *)&self->_proofreadingSuggestionIDsPerDeliveryIDByContextID, 0);
  objc_storeStrong((id *)&self->_currentProofreadingTextPerContextID, 0);
  objc_storeStrong((id *)&self->_effectContainersByLookupID, 0);
  objc_storeStrong((id *)&self->_streamingContextIDs, 0);
  objc_storeStrong((id *)&self->_backingProofreadingSuggestionStatesPerSuggestionIDByContextID, 0);
  objc_storeStrong((id *)&self->_activeReviewingUUID, 0);
  objc_storeStrong((id *)&self->_proofreadingInteraction, 0);
  objc_storeStrong((id *)&self->_proofreadingDeliverySuggestionIDs, 0);
  objc_storeStrong((id *)&self->_proofreadingDeliveryOffset, 0);
  objc_storeStrong((id *)&self->_pendingSessionForWritingToolsWillBegin, 0);
  objc_storeStrong(&self->_pendingCompletionForWritingToolsWillBegin, 0);
  objc_storeStrong((id *)&self->_writingToolsDelegateMessageInvocationBuffer, 0);
  objc_destroyWeak((id *)&self->_proofreadingVisualizationReplacementDelta);
  objc_storeStrong((id *)&self->_sessionTextViewDelegate, 0);
  objc_storeStrong((id *)&self->_contextIDForChosenSuggestion, 0);
  objc_storeStrong((id *)&self->_chosenSuggestion, 0);
  objc_storeStrong((id *)&self->_anticipationContainerInfosByContextID, 0);
  objc_storeStrong((id *)&self->_replacementTrackersByContextID, 0);
  objc_storeStrong((id *)&self->_acceptedEvaluationContextsByContextID, 0);
  objc_destroyWeak((id *)&self->_proposedEvaluationContextsByContextID);
}

- (void)_didDismissWritingTools
{
  if (!LOBYTE(self->_bridgingDelegate) && !self->_undoRollersByContextID) {
    [(UIWritingToolsCoordinator *)self _sessionCleanup];
  }
}

@end