@interface SiriSharedUISystemAssistantExperienceContainerView
+ (id)makeDropletContainerShadowView;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)hasLoadingViews;
- (BOOL)isDisplayingResponse;
- (BOOL)isExternalKeyboardPresented;
- (BOOL)isFirstSnippet;
- (BOOL)isSuggestionsExpanded;
- (BOOL)loadingToResultRequiresMerge;
- (BOOL)resultEligibleForLightEffects;
- (BOOL)showsSensitiveUI;
- (SiriSharedUISystemAssistantExperienceContainerView)initWithCoder:(id)a3;
- (SiriSharedUISystemAssistantExperienceContainerView)initWithFrame:(CGRect)a3;
- (SiriSharedUISystemAssistantExperienceContainerViewDelegate)delegate;
- (UIView)resultSnippetBackgroundView;
- (double)bottomContentInset;
- (double)textFieldHeight;
- (double)userUtteranceViewHeight;
- (id)blurrableView;
- (id)createDefaultMaterialBackgroundView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)resultContentView;
- (id)transitionToRemovedResponseElements:(unint64_t)a3;
- (int64_t)inputType;
- (unint64_t)presentedResponseElements;
- (void)applyDestOverFilter:(BOOL)a3;
- (void)cleanupBottomFloatingButtonIfNeeded;
- (void)cleanupLoadingTransitionIfNeeded;
- (void)cleanupResponseElementsByIds:(id)a3;
- (void)cleanupResultTransitionIfNeeded;
- (void)cleanupResultView;
- (void)clearResultViewAndBackground;
- (void)didDismissResults;
- (void)finalizePopAnimationOfType:(int64_t)a3;
- (void)firstSnippetMaterialAnimation;
- (void)layoutSubviews;
- (void)mitoseWithDuration:(float)a3;
- (void)performAnimatedBlur:(int64_t)a3 usingSpringWithMass:(double)a4 stiffness:(double)a5 damping:(double)a6;
- (void)performAnimatedBlur:(int64_t)a3 withDuration:(double)a4;
- (void)postPillMergeBounce;
- (void)preFollowupPulseWithDuration:(float)a3;
- (void)prepareForDrillinAnimation;
- (void)prepareForPopAnimationOfType:(int64_t)a3;
- (void)reduceMotionCarouselWithDuration:(float)a3 isFirstSnippet:(BOOL)a4;
- (void)reduceMotionPillMergeWithDuration:(float)a3;
- (void)removeSuggestions;
- (void)restoreSubviewsFromDrillIn;
- (void)safeAreaInsetsDidChange;
- (void)searchUIBackgroundColorUpdateSuccessful:(BOOL)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setBottomFloatingButton:(id)a3;
- (void)setCollapseLoadingWith:(id)a3 collapseLoadingSize:(CGSize)a4;
- (void)setDelegate:(id)a3;
- (void)setInputType:(int64_t)a3;
- (void)setIsExternalKeyboardPresented:(BOOL)a3;
- (void)setIsFirstSnippet:(BOOL)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setMergedResultsForTransition;
- (void)setResultEligibleForLightEffects:(BOOL)a3;
- (void)setResultWithResultView:(id)a3 resultSize:(CGSize)a4;
- (void)setResultWithResultView:(id)a3 resultSize:(CGSize)a4 eligibleForLightEffects:(BOOL)a5;
- (void)setShowsSensitiveUI:(BOOL)a3;
- (void)setSuggestions:(id)a3;
- (void)setSuggestions:(id)a3 animatedBlur:(BOOL)a4;
- (void)setTextFieldHeight:(double)a3;
- (void)setTextFieldWithTextFieldView:(id)a3;
- (void)setTransitionLoadingToResultWithResultSize:(CGSize)a3;
- (void)setUserUtteranceViewHeight:(double)a3;
- (void)setVoiceLoading:(id)a3;
- (void)startLatencyLightOnActivePill;
- (void)suggestionTapAnimationWithIndex:(int64_t)a3 isTouchUp:(BOOL)a4;
- (void)suggestionsMitose;
- (void)transitionFromResultToCollapseLoading;
- (void)transitionMergedResults;
- (void)transitionSuggestionToLoadingWithIndex:(int64_t)a3;
- (void)transitionTextFieldLoadingToLoading;
- (void)transitionToResult;
- (void)transitionToSuggestionsCollapsed;
- (void)transitionToSuggestionsCollapsedWithIndex:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)transitionToSuggestionsExpanded;
- (void)transitionToUpdatedContentInset;
- (void)transitionVoiceLoadingToLoading;
- (void)updateBackgroundView:(id)a3 smartDialogView:(id)a4 isSnippetAsyncColored:(BOOL)a5;
- (void)updateBottomFloatingButtonVisibility:(BOOL)a3;
- (void)updateKeyboardLightEffects:(BOOL)a3;
- (void)updateLoadingPillSizeWithCandidateSize:(CGSize)a3;
- (void)updateResultSizeWithResultSize:(CGSize)a3;
@end

@implementation SiriSharedUISystemAssistantExperienceContainerView

+ (id)makeDropletContainerShadowView
{
  id v2 = _sSo50SiriSharedUISystemAssistantExperienceContainerViewC0aB2UIE011makeDropletf6ShadowG0So6UIViewCyFZ_0();
  return v2;
}

- (SiriSharedUISystemAssistantExperienceContainerView)initWithFrame:(CGRect)a3
{
  return (SiriSharedUISystemAssistantExperienceContainerView *)sub_20CA66228(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SiriSharedUISystemAssistantExperienceContainerView)initWithCoder:(id)a3
{
  return (SiriSharedUISystemAssistantExperienceContainerView *)SiriSharedUISystemAssistantExperienceContainerView.init(coder:)(a3);
}

- (double)textFieldHeight
{
  id v2 = (double *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_textFieldHeight);
  swift_beginAccess();
  return *v2;
}

- (void)setTextFieldHeight:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_textFieldHeight);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)userUtteranceViewHeight
{
  id v2 = (double *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_userUtteranceViewHeight);
  swift_beginAccess();
  return *v2;
}

- (void)setUserUtteranceViewHeight:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_userUtteranceViewHeight);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)isExternalKeyboardPresented
{
  id v2 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_isExternalKeyboardPresented;
  swift_beginAccess();
  return *v2;
}

- (void)setIsExternalKeyboardPresented:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_isExternalKeyboardPresented;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (UIView)resultSnippetBackgroundView
{
  return (UIView *)sub_20CA71244((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_snippetBackgroundView);
}

- (id)createDefaultMaterialBackgroundView
{
  id v2 = self;
  id v3 = [(SiriSharedUISystemAssistantExperienceContainerView *)v2 traitCollection];
  objc_msgSend(v3, sel_userInterfaceStyle);

  id v4 = objc_allocWithZone((Class)type metadata accessor for SiriSharedUIStandardViewDropletMaterial());
  v5 = sub_20CA2E9DC(1);

  return v5;
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v5 = self;
  Swift::Bool v6 = SiriSharedUISystemAssistantExperienceContainerView.hasContentAt(point:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  return v6;
}

- (BOOL)isDisplayingResponse
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultView))
    return 1;
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_loadingViews);
  swift_beginAccess();
  if (*v4 >> 62)
  {
    Swift::Bool v6 = self;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_20CA83368();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 != 0;
}

- (unint64_t)presentedResponseElements
{
  id v2 = self;
  unint64_t v3 = SiriSharedUISystemAssistantExperienceContainerView.presentedResponseElements()();

  return v3;
}

- (void)setTextFieldWithTextFieldView:(id)a3
{
  id v5 = a3;
  Swift::Bool v6 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setTextField(textFieldView:)((UIView_optional *)a3);
}

- (void)setSuggestions:(id)a3 animatedBlur:(BOOL)a4
{
  sub_20CA20160(0, (unint64_t *)&qword_2676ECFE0);
  sub_20CA82FB8();
  id v5 = self;
  id v6 = (id)sub_20CA82FA8();
  [(SiriSharedUISystemAssistantExperienceContainerView *)v5 setSuggestions:v6];

  swift_bridgeObjectRelease();
}

- (void)setSuggestions:(id)a3
{
  sub_20CA20160(0, (unint64_t *)&qword_2676ECFE0);
  uint64_t v4 = sub_20CA82FB8();
  id v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setSuggestions(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)removeSuggestions
{
  sub_20CA20160(0, (unint64_t *)&qword_2676ECFE0);
  unint64_t v3 = self;
  id v4 = (id)sub_20CA82FA8();
  [(SiriSharedUISystemAssistantExperienceContainerView *)v3 setSuggestions:v4 animatedBlur:0];
}

- (void)setVoiceLoading:(id)a3
{
  id v4 = (UIView *)a3;
  id v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setVoiceLoading(_:)(v4);
}

- (void)setCollapseLoadingWith:(id)a3 collapseLoadingSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v7 = (UIView *)a3;
  v8 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setCollapseLoading(collapseLoading:collapseLoadingSize:)(v7, (CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));
}

- (void)setBottomFloatingButton:(id)a3
{
  id v4 = (UIView *)a3;
  id v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setBottomFloatingButton(_:)(v4);
}

- (void)updateBottomFloatingButtonVisibility:(BOOL)a3
{
  id v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.updateBottomFloatingButtonVisibility(_:)(a3);
}

- (void)cleanupBottomFloatingButtonIfNeeded
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_bottomFloatingButtonView);
  if (v3)
  {
    id v4 = (unsigned char *)(v3 + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_removeOnNextLayoutPass);
    swift_beginAccess();
    unsigned char *v4 = 1;
  }
  id v5 = self;
  [(SiriSharedUISystemAssistantExperienceContainerView *)v5 setNeedsLayout];
  [(SiriSharedUISystemAssistantExperienceContainerView *)v5 layoutIfNeeded];
}

- (void)setResultWithResultView:(id)a3 resultSize:(CGSize)a4
{
}

- (void)setResultWithResultView:(id)a3 resultSize:(CGSize)a4 eligibleForLightEffects:(BOOL)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v9 = (UIView *)a3;
  v10 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setResult(resultView:resultSize:eligibleForLightEffects:)(v9, (CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width), a5);
}

- (void)updateResultSizeWithResultSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.updateResultSize(resultSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));
}

- (void)updateLoadingPillSizeWithCandidateSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.updateLoadingPillSize(withCandidateSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));
}

- (void)setTransitionLoadingToResultWithResultSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setTransitionLoadingToResult(resultSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));
}

- (void)setMergedResultsForTransition
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultViewState) = 2;
  id v2 = self;
  [(SiriSharedUISystemAssistantExperienceContainerView *)v2 setNeedsLayout];
  [(SiriSharedUISystemAssistantExperienceContainerView *)v2 layoutIfNeeded];
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (*((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_isInAmbient) != a3)
  {
    BOOL v3 = a3;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_isInAmbient) = a3;
    id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_snippetsDropletView);
    id v5 = self;
    objc_msgSend(v4, sel_setHidden_, v3);
    [(SiriSharedUISystemAssistantExperienceContainerView *)v5 setNeedsLayout];
  }
}

- (void)updateKeyboardLightEffects:(BOOL)a3
{
  id v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.updateKeyboardLightEffects(_:)(a3);
}

- (SiriSharedUISystemAssistantExperienceContainerViewDelegate)delegate
{
  id v2 = (char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_delegate;
  swift_beginAccess();
  BOOL v3 = (void *)MEMORY[0x210553300](v2);
  return (SiriSharedUISystemAssistantExperienceContainerViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)inputType
{
  id v2 = (int64_t *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_inputType);
  swift_beginAccess();
  return *v2;
}

- (void)setInputType:(int64_t)a3
{
  id v4 = (int64_t *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_inputType);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)showsSensitiveUI
{
  id v2 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_showsSensitiveUI;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsSensitiveUI:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_showsSensitiveUI;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)bottomContentInset
{
  id v2 = (double *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_bottomContentInset);
  swift_beginAccess();
  return *v2;
}

- (void)setBottomContentInset:(double)a3
{
  id v4 = (double *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_bottomContentInset);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)isFirstSnippet
{
  id v2 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_isFirstSnippet;
  swift_beginAccess();
  return *v2;
}

- (void)setIsFirstSnippet:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_isFirstSnippet;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isSuggestionsExpanded
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_suggestionsExpanded);
}

- (BOOL)resultEligibleForLightEffects
{
  id v2 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultEligibleForLightEffects;
  swift_beginAccess();
  return *v2;
}

- (void)setResultEligibleForLightEffects:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultEligibleForLightEffects;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)loadingToResultRequiresMerge
{
  return *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView) != 0;
}

- (BOOL)hasLoadingViews
{
  BOOL v3 = (unint64_t *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_loadingViews);
  swift_beginAccess();
  unint64_t v4 = *v3;
  if (v4 >> 62)
  {
    v7 = self;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_20CA83368();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 != 0;
}

- (void)cleanupResultTransitionIfNeeded
{
  uint64_t v3 = OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView;
  unint64_t v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView);
  uint64_t v5 = self;
  if (v4)
  {
    id v6 = v4;
    sub_20CA67BCC(v6);

    id v7 = *(Class *)((char *)&self->super.super.super.super.isa + v3);
  }
  else
  {
    id v7 = 0;
  }
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = 0;
}

- (void)cleanupLoadingTransitionIfNeeded
{
  id v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_voiceLoadingView);
  if (v2) {
    objc_msgSend(v2, sel_removeFromSuperview);
  }
}

- (void)cleanupResponseElementsByIds:(id)a3
{
  sub_20CA81D88();
  uint64_t v4 = sub_20CA82FB8();
  uint64_t v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.cleanupResponseElements(by:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)cleanupResultView
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.cleanupResultView()();
}

- (void)suggestionTapAnimationWithIndex:(int64_t)a3 isTouchUp:(BOOL)a4
{
  id v6 = self;
  SiriSharedUISystemAssistantExperienceContainerView.suggestionTapAnimationWith(index:isTouchUp:)(a3, a4);
}

- (void)transitionToSuggestionsExpanded
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionToSuggestionsExpanded()();
}

- (void)transitionToSuggestionsCollapsedWithIndex:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionToSuggestionsCollapsedWith(index:animated:completionBlock:)(a3, a4, (uint64_t)sub_20CA7AE90, v9);

  swift_release();
}

- (void)transitionToSuggestionsCollapsed
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_suggestionsExpanded) = 0;
  id v2 = self;
  [(SiriSharedUISystemAssistantExperienceContainerView *)v2 setNeedsLayout];
  [(SiriSharedUISystemAssistantExperienceContainerView *)v2 layoutIfNeeded];
}

- (void)transitionSuggestionToLoadingWithIndex:(int64_t)a3
{
  uint64_t v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionSuggestionToLoading(index:)(a3);
}

- (void)transitionVoiceLoadingToLoading
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionVoiceLoadingToLoading()();
}

- (void)startLatencyLightOnActivePill
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.startLatencyLightOnActivePill()();
}

- (void)transitionTextFieldLoadingToLoading
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionTextFieldLoadingToLoading()();
}

- (id)transitionToRemovedResponseElements:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transition(toRemovedResponseElements:)(v3);

  sub_20CA81D88();
  uint64_t v5 = (void *)sub_20CA82FA8();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)transitionMergedResults
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView))
  {
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultViewState) = 1;
    id v2 = self;
    [(SiriSharedUISystemAssistantExperienceContainerView *)v2 setNeedsLayout];
    [(SiriSharedUISystemAssistantExperienceContainerView *)v2 layoutIfNeeded];
  }
}

- (void)transitionToResult
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionToResult()();
}

- (void)transitionFromResultToCollapseLoading
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionFromResultToCollapseLoading()();
}

- (void)transitionToUpdatedContentInset
{
  id v2 = self;
  [(SiriSharedUISystemAssistantExperienceContainerView *)v2 setNeedsLayout];
  [(SiriSharedUISystemAssistantExperienceContainerView *)v2 layoutIfNeeded];
}

- (void)clearResultViewAndBackground
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.clearResultViewAndBackground()();
}

- (void)prepareForDrillinAnimation
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.prepareForDrillinAnimation()();
}

- (void)restoreSubviewsFromDrillIn
{
  uint64_t v5 = self;
  [(SiriSharedUISystemAssistantExperienceContainerView *)v5 updateBottomFloatingButtonVisibility:1];
  id v2 = *(Class *)((char *)&v5->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_bottomFloatingButtonView);
  if (v2)
  {
    char v3 = v2;
    sub_20CA7D444();

    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = v5;
  }
}

- (void)prepareForPopAnimationOfType:(int64_t)a3
{
  uint64_t v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.prepareForPopAnimation(ofType:)(a3);
}

- (void)finalizePopAnimationOfType:(int64_t)a3
{
  uint64_t v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.finalizePopAnimation(ofType:)(a3);
}

- (void)didDismissResults
{
  (*(unsigned char **)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_fluidDismissalManager))[OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_isDismissing] = 0;
}

- (id)resultContentView
{
  return sub_20CA71244((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView);
}

- (id)blurrableView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_blurrableView));
}

- (void)updateBackgroundView:(id)a3 smartDialogView:(id)a4 isSnippetAsyncColored:(BOOL)a5
{
  v8 = (UIView *)a3;
  id v9 = a4;
  v10 = self;
  SiriSharedUISystemAssistantExperienceContainerView.updateBackgroundView(_:smartDialogView:isSnippetAsyncColored:)(v8, (UIView_optional *)a4, a5);
}

- (void)searchUIBackgroundColorUpdateSuccessful:(BOOL)a3
{
  uint64_t v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.searchUIBackgroundColorUpdateSuccessful(_:)(a3);
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUISystemAssistantExperienceContainerView;
  id v2 = self;
  [(SiriSharedUISystemAssistantExperienceContainerView *)&v3 safeAreaInsetsDidChange];
  [(SiriSharedUISystemAssistantExperienceContainerView *)v2 setNeedsLayout];
  [(SiriSharedUISystemAssistantExperienceContainerView *)v2 layoutIfNeeded];
}

- (void)layoutSubviews
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.layoutSubviews()();
}

- (void)firstSnippetMaterialAnimation
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.firstSnippetMaterialAnimation()();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)SiriSharedUISystemAssistantExperienceContainerView;
  id v7 = self;
  id v8 = a4;
  id v9 = -[SiriSharedUISystemAssistantExperienceContainerView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_20CA20160(0, (unint64_t *)&qword_2676ECFE0);
  v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = sub_20CA831C8();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }
  return v7;
}

- (void)suggestionsMitose
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.suggestionsMitose()();
}

- (void)reduceMotionCarouselWithDuration:(float)a3 isFirstSnippet:(BOOL)a4
{
  id v6 = self;
  SiriSharedUISystemAssistantExperienceContainerView.reduceMotionCarousel(withDuration:isFirstSnippet:)(a3, a4);
}

- (void)reduceMotionPillMergeWithDuration:(float)a3
{
  uint64_t v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.reduceMotionPillMerge(withDuration:)(a3);
}

- (void)applyDestOverFilter:(BOOL)a3
{
  uint64_t v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.applyDestOverFilter(_:)(a3);
}

- (void)mitoseWithDuration:(float)a3
{
  uint64_t v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.mitose(withDuration:)(a3);
}

- (void)postPillMergeBounce
{
  id v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.postPillMergeBounce()();
}

- (void)preFollowupPulseWithDuration:(float)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultView);
  uint64_t v5 = self;
  if (v4)
  {
    id v6 = v4;
    sub_20CA7D8E8(a3);
  }
  id v7 = self;
  id v8 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView);
  if (v8)
  {
    id v9 = v8;
    sub_20CA7D8E8(a3);

    id v7 = v9;
  }
}

- (void)performAnimatedBlur:(int64_t)a3 withDuration:(double)a4
{
  id v6 = self;
  SiriSharedUISystemAssistantExperienceContainerView.performAnimatedBlur(_:withDuration:)(a3, a4);
}

- (void)performAnimatedBlur:(int64_t)a3 usingSpringWithMass:(double)a4 stiffness:(double)a5 damping:(double)a6
{
  v10 = self;
  SiriSharedUISystemAssistantExperienceContainerView.performAnimatedBlur(_:usingSpringWithMass:stiffness:damping:)(a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_fluidDismissalManager));
  sub_20CA202D4((uint64_t)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_snippetsDropletView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_suggestionsDropletView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_blurrableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_textFieldView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_bottomFloatingButtonView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_voiceLoadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_textFieldLoadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_collapseLoadingView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_snippetBackgroundView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_pairedSmartDialogViewForBackground);
}

@end