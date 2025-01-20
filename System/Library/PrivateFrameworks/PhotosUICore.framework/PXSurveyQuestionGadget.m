@interface PXSurveyQuestionGadget
+ (id)sharedWorkQueue;
+ (unsigned)confirmYesSoundID;
+ (void)preloadResources;
- (BOOL)_presentAssetCollectionByLemonadeUI:(id)a3;
- (BOOL)_presentOneUpByLemonadeUI:(id)a3;
- (BOOL)_presentViewControllerByLemonadeUI:(id)a3;
- (BOOL)currentlyInOneUp;
- (BOOL)isContentHidden;
- (BOOL)isEqual:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)collectionViewItemClass;
- (NSSet)assetUUIDsAssociatedWithGadget;
- (PHQuestion)question;
- (PXGadgetDelegate)delegate;
- (PXGadgetSpec)gadgetSpec;
- (PXRegionOfInterest)regionOfInterestForOneUpTransition;
- (PXSurveyQuestionConfiguration)configuration;
- (PXSurveyQuestionConfigurationHandlers)handlers;
- (PXSurveyQuestionGadget)init;
- (PXSurveyQuestionGadget)initWithSurveyQuestion:(id)a3 gadgetType:(unint64_t)a4;
- (PXSurveyQuestionGadgetLemonadeUIDelegate)lemonadeUIDelegate;
- (PXSurveyQuestionsGadgetContentView)contentView;
- (UIImage)currentImage;
- (id)additionalReasonsForWallpaperQuestionsForAnswer:(unint64_t)a3;
- (id)gadgetContentView:(id)a3 additionalReasonMessageForAnswer:(unint64_t)a4;
- (id)gadgetContentView:(id)a3 additionalReasonTitleForAnswer:(unint64_t)a4;
- (id)gadgetContentView:(id)a3 additionalReasonsForAnswer:(unint64_t)a4;
- (id)uniqueGadgetIdentifier;
- (unint64_t)answer;
- (unint64_t)gadgetCapabilities;
- (unint64_t)gadgetType;
- (unint64_t)hash;
- (unsigned)questionType;
- (void)_didFinishUpdatingSurveyQuestionStateFromAnswer;
- (void)_playConfirmYesSound;
- (void)_updateContentViewConfiguration;
- (void)_updateSurveyQuestionStateFromAnswer:(unint64_t)a3 andReason:(id)a4;
- (void)gadgetContentView:(id)a3 didAnswer:(unint64_t)a4 withReason:(id)a5;
- (void)prepareCollectionViewItem:(id)a3;
- (void)refreshQuestionContentView;
- (void)removeCollectionViewItem:(id)a3;
- (void)setAnswer:(unint64_t)a3;
- (void)setAssetUUIDsAssociatedWithGadget:(id)a3;
- (void)setContentHidden:(BOOL)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentlyInOneUp:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setGadgetSpec:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setLemonadeUIDelegate:(id)a3;
@end

@implementation PXSurveyQuestionGadget

- (void)setLemonadeUIDelegate:(id)a3
{
}

- (PXSurveyQuestionsGadgetContentView)contentView
{
  return self->_contentView;
}

- (unsigned)questionType
{
  v2 = [(PXSurveyQuestionGadget *)self question];
  unsigned __int16 v3 = [v2 type];

  return v3;
}

- (PHQuestion)question
{
  return self->_question;
}

- (void)prepareCollectionViewItem:(id)a3
{
  v14 = (PXSurveyQuestionsGadgetContentView *)a3;
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = [(PXSurveyQuestionsGadgetContentView *)v14 px_descriptionForAssertionMessage];
    [v9 handleFailureInMethod:a2, self, @"PXSurveyQuestionGadget.m", 218, @"%@ should be an instance inheriting from %@, but it is %@", @"collectionViewItem", v11, v13 object file lineNumber description];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXSurveyQuestionGadget.m", 218, @"%@ should be an instance inheriting from %@, but it is nil", @"collectionViewItem", v11 object file lineNumber description];
  }

LABEL_3:
  contentView = self->_contentView;
  self->_contentView = v14;

  v6 = [PXSurveyQuestionDefaultConfiguration alloc];
  v7 = [(PHQuestion *)self->_question px_displayTitle];
  v8 = [(PXSurveyQuestionDefaultConfiguration *)v6 initWithTitle:v7];
  [(PXSurveyQuestionsGadgetContentView *)self->_contentView setConfiguration:v8];

  [(PXSurveyQuestionsGadgetContentView *)self->_contentView updateButtonsWithAnswerState:[(PXSurveyQuestionGadget *)self answer] reason:self->_currentAnswerReason];
  [(PXSurveyQuestionsGadgetContentView *)self->_contentView setDelegate:self];
  [(PXSurveyQuestionGadget *)self _updateContentViewConfiguration];
}

- (unint64_t)answer
{
  return self->_answer;
}

void __57__PXSurveyQuestionGadget__updateContentViewConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(*(void *)(a1 + 32) + 8) == a2)
  {
    v4 = (id *)(a1 + 40);
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained(v4);
    v7 = [WeakRetained handlers];
    [v5 setHandlers:v7];

    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    [v8 setConfiguration:v5];
  }
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  handlers = self->_handlers;
  if (!handlers)
  {
    v4 = objc_alloc_init(PXSurveyQuestionConfigurationHandlers);
    id v5 = self->_handlers;
    self->_handlers = v4;

    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __34__PXSurveyQuestionGadget_handlers__block_invoke;
    v11[3] = &unk_1E5DBEFD0;
    objc_copyWeak(&v12, &location);
    [(PXSurveyQuestionConfigurationHandlers *)self->_handlers setDidSelectAssetHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __34__PXSurveyQuestionGadget_handlers__block_invoke_2;
    v9[3] = &unk_1E5DBEFF8;
    objc_copyWeak(&v10, &location);
    [(PXSurveyQuestionConfigurationHandlers *)self->_handlers setPushViewControllerHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__PXSurveyQuestionGadget_handlers__block_invoke_3;
    v7[3] = &unk_1E5DBF020;
    objc_copyWeak(&v8, &location);
    [(PXSurveyQuestionConfigurationHandlers *)self->_handlers setPresentViewControllerHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    handlers = self->_handlers;
  }
  return handlers;
}

- (void)_updateContentViewConfiguration
{
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_contentView);
  question = self->_question;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PXSurveyQuestionGadget__updateContentViewConfiguration__block_invoke;
  v4[3] = &unk_1E5DBF048;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  objc_copyWeak(&v6, &from);
  self->_configurationRequestId = [(PHQuestion *)question px_requestConfigurationWithResultHandler:v4];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_assetUUIDsAssociatedWithGadget, 0);
  objc_destroyWeak((id *)&self->_lemonadeUIDelegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_storeStrong((id *)&self->_currentAnswerReason, 0);
}

- (void)setHandlers:(id)a3
{
}

- (BOOL)isContentHidden
{
  return self->_contentHidden;
}

- (void)setCurrentlyInOneUp:(BOOL)a3
{
  self->_currentlyInOneUp = a3;
}

- (BOOL)currentlyInOneUp
{
  return self->_currentlyInOneUp;
}

- (void)setAssetUUIDsAssociatedWithGadget:(id)a3
{
}

- (NSSet)assetUUIDsAssociatedWithGadget
{
  return self->_assetUUIDsAssociatedWithGadget;
}

- (PXSurveyQuestionGadgetLemonadeUIDelegate)lemonadeUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lemonadeUIDelegate);
  return (PXSurveyQuestionGadgetLemonadeUIDelegate *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (void)setAnswer:(unint64_t)a3
{
  self->_answer = a3;
}

- (unint64_t)gadgetType
{
  return self->_gadgetType;
}

- (void)setDelegate:(id)a3
{
}

- (PXGadgetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGadgetDelegate *)WeakRetained;
}

- (void)setGadgetSpec:(id)a3
{
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)_playConfirmYesSound
{
  SystemSoundID v2 = [(id)objc_opt_class() confirmYesSoundID];
  if (v2)
  {
    AudioServicesPlaySystemSound(v2);
  }
}

- (id)gadgetContentView:(id)a3 additionalReasonMessageForAnswer:(unint64_t)a4
{
  if ([(PHQuestion *)self->_question type] == 25)
  {
    id v5 = @"PXInternalPhotosChallengeAdditionalReasonExhaustiveMomentLabelingMessage";
  }
  else if ([(PHQuestion *)self->_question type] == 8)
  {
    id v5 = @"PXInternalPhotosChallengeAdditionalReasonFrequentLocationMessage";
  }
  else if ([(PHQuestion *)self->_question type] == 13 {
         && [(PHQuestion *)self->_question entityType] == 1)
  }
  {
    id v5 = @"PXInternalPhotosChallengeAdditionalReasonPetMessage";
  }
  else if ([(PHQuestion *)self->_question type] == 5 {
         && [(PHQuestion *)self->_question entityType] == 1
  }
         && ([(PHQuestion *)self->_question additionalInfo],
             id v6 = objc_claimAutoreleasedReturnValue(),
             [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8EA28]],
             v7 = objc_claimAutoreleasedReturnValue(),
             char v8 = [v7 isEqualToString:@"CHILD"],
             v7,
             v6,
             (v8 & 1) != 0))
  {
    id v5 = @"PXInternalPhotosChallengeAdditionalReasonChildMessage";
  }
  else
  {
    id v5 = @"PXInternalPhotosChallengeAdditionalReasonMessage";
  }
  v9 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
  return v9;
}

- (id)gadgetContentView:(id)a3 additionalReasonTitleForAnswer:(unint64_t)a4
{
  if ([(PHQuestion *)self->_question type] == 24)
  {
    id v5 = @"PXInternalPhotosChallengeAlbumClassificationAdditionalReasonTitle";
    goto LABEL_7;
  }
  if ([(PHQuestion *)self->_question type] == 25)
  {
    id v5 = @"PXInternalPhotosChallengeAdditionalReasonExhaustiveMomentLabelingTitle";
    goto LABEL_7;
  }
  if ([(PHQuestion *)self->_question type] == 8)
  {
    id v5 = @"PXInternalPhotosChallengeAdditionalReasonFrequentLocationTitle";
    goto LABEL_7;
  }
  if ([(PHQuestion *)self->_question type] == 26
    && ([(PHQuestion *)self->_question additionalInfo],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:*MEMORY[0x1E4F8EA88]],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEqual:MEMORY[0x1E4F1CC28]],
        v10,
        v9,
        v11))
  {
    id v12 = [(PHQuestion *)self->_question additionalInfo];
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F8EAA0]];

    v14 = @"PXInternalPhotosChallengeTripTitlingAdditionalReasonTitle";
  }
  else
  {
    if ([(PHQuestion *)self->_question type] != 28
      || ([(PHQuestion *)self->_question additionalInfo],
          v15 = objc_claimAutoreleasedReturnValue(),
          [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8EA88]],
          v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 isEqual:MEMORY[0x1E4F1CC28]],
          v16,
          v15,
          !v17))
    {
      if ([(PHQuestion *)self->_question type] == 13
        && [(PHQuestion *)self->_question entityType] == 1)
      {
        id v5 = @"PXInternalPhotosChallengeAdditionalReasonPetTitle";
      }
      else if ([(PHQuestion *)self->_question type] == 5 {
             && [(PHQuestion *)self->_question entityType] == 1
      }
             && ([(PHQuestion *)self->_question additionalInfo],
                 v20 = objc_claimAutoreleasedReturnValue(),
                 [v20 objectForKeyedSubscript:*MEMORY[0x1E4F8EA28]],
                 v21 = objc_claimAutoreleasedReturnValue(),
                 int v22 = [v21 isEqualToString:@"CHILD"],
                 v21,
                 v20,
                 v22))
      {
        id v5 = @"PXInternalPhotosChallengeAdditionalReasonChildTitle";
      }
      else
      {
        if ([(PHQuestion *)self->_question type] == 30)
        {
          uint64_t v6 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonTitle");
          goto LABEL_8;
        }
        id v5 = @"PXInternalPhotosChallengeAdditionalReasonTitle";
      }
LABEL_7:
      uint64_t v6 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
LABEL_8:
      v7 = (void *)v6;
      goto LABEL_9;
    }
    v18 = [(PHQuestion *)self->_question additionalInfo];
    v13 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F8EA98]];

    v14 = @"PXInternalPhotosChallengeDayHighlightTitlingAdditionalReasonTitle";
  }
  v19 = PXLocalizedStringFromTable(v14, @"PhotosUICore");
  v7 = PXStringWithValidatedFormat();

LABEL_9:
  return v7;
}

- (id)additionalReasonsForWallpaperQuestionsForAnswer:(unint64_t)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    unsigned __int16 v3 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeWallpaperAnswerNoReasonSomewhatPoor", @"PhotosUICore");
    v7[0] = v3;
    v4 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeWallpaperAnswerNoReasonEmbarrassinglyBad", @"PhotosUICore");
    v7[1] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (id)gadgetContentView:(id)a3 additionalReasonsForAnswer:(unint64_t)a4
{
  v67[5] = *MEMORY[0x1E4F143B8];
  if ([(PHQuestion *)self->_question type] == 18)
  {
    if (a4 == 1)
    {
      uint64_t v6 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeContentSyndicationAnswerYesReasonInPhoto", @"PhotosUICore");
      v66[0] = v6;
      v7 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeContentSyndicationAnswerYesReasonPresent", @"PhotosUICore");
      v66[1] = v7;
      char v8 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeContentSyndicationAnswerYesReasonFamilyOrPet", @"PhotosUICore");
      v66[2] = v8;
      v9 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeContentSyndicationAnswerYesReasonNotPresentButWant", @"PhotosUICore");
      v66[3] = v9;
      id v10 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeContentSyndicationAnswerReasonOther", @"PhotosUICore");
      v66[4] = v10;
      int v11 = (void *)MEMORY[0x1E4F1C978];
      id v12 = v66;
      goto LABEL_15;
    }
    if (a4 == 2)
    {
      uint64_t v6 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeContentSyndicationAnswerNoReasonNotPresent", @"PhotosUICore");
      v67[0] = v6;
      v7 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeContentSyndicationAnswerNoReasonPresentButNoLike", @"PhotosUICore");
      v67[1] = v7;
      char v8 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeContentSyndicationAnswerNoReasonMemeOrScreenshot", @"PhotosUICore");
      v67[2] = v8;
      v9 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeContentSyndicationAnswerNoReasonUninterestingOrBad", @"PhotosUICore");
      v67[3] = v9;
      id v10 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeContentSyndicationAnswerReasonOther", @"PhotosUICore");
      v67[4] = v10;
      int v11 = (void *)MEMORY[0x1E4F1C978];
      id v12 = v67;
LABEL_15:
      id v17 = [v11 arrayWithObjects:v12 count:5];
LABEL_29:

      goto LABEL_30;
    }
    goto LABEL_61;
  }
  if ([(PHQuestion *)self->_question type] == 20)
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        uint64_t v6 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonNotCriticalText");
        v65[0] = v6;
        v7 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonSensitiveText");
        v65[1] = v7;
        char v8 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonNotPresentText");
        v65[2] = v8;
        v9 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonUninterestingText");
        v65[3] = v9;
        id v10 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonLocationText");
        v65[4] = v10;
        v13 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonEventText");
        v65[5] = v13;
        v14 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonOtherText");
        v65[6] = v14;
        v15 = (void *)MEMORY[0x1E4F1C978];
        v16 = v65;
LABEL_13:
        id v17 = [v15 arrayWithObjects:v16 count:7];

LABEL_28:
        goto LABEL_29;
      }
      goto LABEL_61;
    }
    uint64_t v6 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonParticipantsInPhotoText");
    v64[0] = v6;
    v7 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonParticipantsPresentText");
    v64[1] = v7;
    char v8 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonFamilyText");
    v64[2] = v8;
    v9 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonLocationText");
    v64[3] = v9;
    id v10 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonEventText");
    v64[4] = v10;
    v13 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonOtherText");
    v64[5] = v13;
    v18 = (void *)MEMORY[0x1E4F1C978];
    v19 = v64;
    goto LABEL_27;
  }
  if ([(PHQuestion *)self->_question type] == 23)
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        uint64_t v6 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonNotCriticalText");
        v63[0] = v6;
        v7 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonSensitiveText");
        v63[1] = v7;
        char v8 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonNotPresentText");
        v63[2] = v8;
        v9 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonUninterestingText");
        v63[3] = v9;
        id v10 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonLocationText");
        v63[4] = v10;
        v13 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonEventText");
        v63[5] = v13;
        v14 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerNoReasonOtherText");
        v63[6] = v14;
        v15 = (void *)MEMORY[0x1E4F1C978];
        v16 = v63;
        goto LABEL_13;
      }
LABEL_61:
      id v17 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_62;
    }
    uint64_t v6 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonParticipantsInPhotoText");
    v62[0] = v6;
    v7 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonParticipantsPresentText");
    v62[1] = v7;
    char v8 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonFamilyText");
    v62[2] = v8;
    v9 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonLocationText");
    v62[3] = v9;
    id v10 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonEventText");
    v62[4] = v10;
    v13 = PXLocalizedSharedLibraryString(@"PXInternalPhotosChallengeSharedLibraryAnswerYesReasonOtherText");
    v62[5] = v13;
    v18 = (void *)MEMORY[0x1E4F1C978];
    v19 = v62;
LABEL_27:
    id v17 = [v18 arrayWithObjects:v19 count:6];
    goto LABEL_28;
  }
  if ([(PHQuestion *)self->_question type] == 24)
  {
    if (a4 == 1)
    {
      v52 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonTrips", @"PhotosUICore");
      v60[0] = v52;
      v51 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonCelebrations", @"PhotosUICore");
      v60[1] = v51;
      v50 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonFriends", @"PhotosUICore");
      v60[2] = v50;
      v49 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonFamily", @"PhotosUICore");
      v60[3] = v49;
      v48 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonPartner", @"PhotosUICore");
      v60[4] = v48;
      v47 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonPets", @"PhotosUICore");
      v60[5] = v47;
      v46 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonMyself", @"PhotosUICore");
      v60[6] = v46;
      v45 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonHobbies", @"PhotosUICore");
      v60[7] = v45;
      v44 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonArtistic", @"PhotosUICore");
      v60[8] = v44;
      v26 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonNature", @"PhotosUICore");
      v60[9] = v26;
      v27 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonFood", @"PhotosUICore");
      v60[10] = v27;
      v28 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonUtility", @"PhotosUICore");
      v60[11] = v28;
      v29 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonScratch", @"PhotosUICore");
      v60[12] = v29;
      v30 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonAppleWork", @"PhotosUICore");
      v60[13] = v30;
      v31 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonNonAppleWork", @"PhotosUICore");
      v60[14] = v31;
      v32 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerYesReasonOther", @"PhotosUICore");
      v60[15] = v32;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:16];

      goto LABEL_62;
    }
    if (a4 == 2)
    {
      uint64_t v6 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerNoReasonAppleWork", @"PhotosUICore");
      v61[0] = v6;
      v7 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerNoReasonNonAppleWork", @"PhotosUICore");
      v61[1] = v7;
      char v8 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerNoReasonThirdPartyApp", @"PhotosUICore");
      v61[2] = v8;
      v9 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAlbumClassificationAnswerNoReasonOther", @"PhotosUICore");
      v61[3] = v9;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];
LABEL_30:

LABEL_31:
LABEL_32:

      goto LABEL_62;
    }
    goto LABEL_61;
  }
  if ([(PHQuestion *)self->_question type] == 25)
  {
    if (a4 != 1) {
      goto LABEL_61;
    }
    v20 = [(PXSurveyQuestionGadget *)self question];
    v21 = [v20 additionalInfo];
    uint64_t v6 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F8E948]];

    if (v6)
    {
      int v22 = [v6 componentsSeparatedByString:@","];
      v7 = v22;
      if (!v22)
      {
        id v17 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_31;
      }
      id v23 = v22;
LABEL_69:
      id v17 = v23;
      goto LABEL_31;
    }
LABEL_47:
    id v17 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_32;
  }
  if ([(PHQuestion *)self->_question type] == 8)
  {
    if (a4 != 1) {
      goto LABEL_61;
    }
    v24 = [(PXSurveyQuestionGadget *)self question];
    v25 = [v24 additionalInfo];
    uint64_t v6 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F8E968]];

    if (v6)
    {
      id v17 = v6;
      goto LABEL_32;
    }
    goto LABEL_47;
  }
  if ([(PHQuestion *)self->_question type] == 26
    || [(PHQuestion *)self->_question type] == 28)
  {
    v33 = [(PHQuestion *)self->_question additionalInfo];
    v34 = [v33 objectForKeyedSubscript:*MEMORY[0x1E4F8EA88]];
    int v35 = [v34 isEqual:MEMORY[0x1E4F1CC28]];

    if (v35)
    {
      if (a4 == 2)
      {
        uint64_t v6 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeYes", @"PhotosUICore");
        v58[0] = v6;
        v7 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeTitlingAnswerNeither", @"PhotosUICore");
        v58[1] = v7;
        v36 = (void *)MEMORY[0x1E4F1C978];
        v37 = v58;
      }
      else
      {
        if (a4 != 1) {
          goto LABEL_61;
        }
        uint64_t v6 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeYes", @"PhotosUICore");
        v59[0] = v6;
        v7 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeNo", @"PhotosUICore");
        v59[1] = v7;
        v36 = (void *)MEMORY[0x1E4F1C978];
        v37 = v59;
      }
      goto LABEL_68;
    }
  }
  if ([(PHQuestion *)self->_question type] == 27)
  {
    if (a4 != 2) {
      goto LABEL_61;
    }
    uint64_t v6 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeLocationRepresentativeAssetAnswerNoBadChoice", @"PhotosUICore");
    v57[0] = v6;
    v7 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeLocationRepresentativeAssetAnswerNoWithBetterChoice", @"PhotosUICore");
    v57[1] = v7;
    v36 = (void *)MEMORY[0x1E4F1C978];
    v37 = v57;
    goto LABEL_68;
  }
  if ([(PHQuestion *)self->_question type] == 13
    && [(PHQuestion *)self->_question entityType] == 1)
  {
    if (a4 != 1) {
      goto LABEL_61;
    }
    uint64_t v6 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonCurrentPet", @"PhotosUICore");
    v56[0] = v6;
    v7 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonPreviousPet", @"PhotosUICore");
    v56[1] = v7;
    v36 = (void *)MEMORY[0x1E4F1C978];
    v37 = v56;
LABEL_68:
    id v23 = [v36 arrayWithObjects:v37 count:2];
    goto LABEL_69;
  }
  if ([(PHQuestion *)self->_question type] == 5
    && [(PHQuestion *)self->_question entityType] == 1)
  {
    v38 = [(PHQuestion *)self->_question additionalInfo];
    v39 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F8EA28]];
    int v40 = [v39 isEqualToString:@"CHILD"];

    if (v40)
    {
      if (a4 == 1)
      {
        uint64_t v6 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonBaby", @"PhotosUICore");
        v55[0] = v6;
        v7 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonChild", @"PhotosUICore");
        v55[1] = v7;
        char v8 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonYoungAdult", @"PhotosUICore");
        v55[2] = v8;
        v9 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonAdult", @"PhotosUICore");
        v55[3] = v9;
        id v10 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonSenior", @"PhotosUICore");
        v55[4] = v10;
        int v11 = (void *)MEMORY[0x1E4F1C978];
        id v12 = v55;
        goto LABEL_15;
      }
      goto LABEL_61;
    }
  }
  if ([(PHQuestion *)self->_question type] == 15)
  {
    if (a4 == 2)
    {
      uint64_t v6 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonPlaysTooOften", @"PhotosUICore");
      v54[0] = v6;
      v7 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonDontLikeSong", @"PhotosUICore");
      v54[1] = v7;
      char v8 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonMismatchEnergy", @"PhotosUICore");
      v54[2] = v8;
      v9 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonMismatchLyrics", @"PhotosUICore");
      v54[3] = v9;
      id v10 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonOther", @"PhotosUICore");
      v54[4] = v10;
      int v11 = (void *)MEMORY[0x1E4F1C978];
      id v12 = v54;
      goto LABEL_15;
    }
    goto LABEL_61;
  }
  int v43 = [(PHQuestion *)self->_question type];
  id v17 = (id)MEMORY[0x1E4F1CBF0];
  if (a4 == 2 && v43 == 30)
  {
    uint64_t v6 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonUnsafe");
    v53[0] = v6;
    v7 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonConfusing");
    v53[1] = v7;
    char v8 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotSpecific");
    v53[2] = v8;
    v9 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonTooSpecific");
    v53[3] = v9;
    id v10 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotAccurate");
    v53[4] = v10;
    v13 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotApplicable");
    v53[5] = v13;
    v18 = (void *)MEMORY[0x1E4F1C978];
    v19 = v53;
    goto LABEL_27;
  }
LABEL_62:
  if ([(PHQuestion *)self->_question type] == 22)
  {
    uint64_t v41 = [(PXSurveyQuestionGadget *)self additionalReasonsForWallpaperQuestionsForAnswer:a4];

    id v17 = (id)v41;
  }
  return v17;
}

- (void)_didFinishUpdatingSurveyQuestionStateFromAnswer
{
  [(PXSurveyQuestionGadget *)self _playConfirmYesSound];
  id v3 = [(PXSurveyQuestionGadget *)self delegate];
  [v3 didAnswerQuestionForGadget:self];
}

- (void)_updateSurveyQuestionStateFromAnswer:(unint64_t)a3 andReason:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke;
  aBlock[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v17, &location);
  v7 = (void (**)(void))_Block_copy(aBlock);
  switch(a3)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      int v8 = 2;
      break;
    case 2uLL:
      int v8 = 3;
      break;
    case 3uLL:
      int v8 = 1;
      break;
    case 4uLL:
      int v8 = 4;
      break;
    default:
      int v8 = 0;
      break;
  }
  if ([(PHQuestion *)self->_question type] == 25
    && [(PHQuestion *)self->_question state] == v8)
  {
LABEL_9:
    v7[2](v7);
  }
  else
  {
    v9 = [(PHQuestion *)self->_question photoLibrary];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke_2;
    v13[3] = &unk_1E5DBF070;
    v13[4] = self;
    __int16 v15 = v8;
    id v14 = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke_3;
    v10[3] = &unk_1E5DC1760;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    int v11 = v7;
    [v9 performChanges:v13 completionHandler:v10];

    objc_destroyWeak(v12);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didFinishUpdatingSurveyQuestionStateFromAnswer];
}

void __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke_2(uint64_t a1)
{
  id v62 = [MEMORY[0x1E4F39258] changeRequestForQuestion:*(void *)(*(void *)(a1 + 32) + 56)];
  [v62 setState:*(unsigned __int16 *)(a1 + 48)];
  SystemSoundID v2 = (void *)MEMORY[0x1E4F1CA60];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) additionalInfo];
  v4 = [v2 dictionaryWithDictionary:v3];

  uint64_t v5 = [*(id *)(a1 + 40) length];
  BOOL v6 = v5 != 0;
  v7 = (uint64_t *)MEMORY[0x1E4F8E920];
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
    [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:*v7];
  }
  if ([*(id *)(a1 + 32) questionType] == 25)
  {
    int v8 = [*(id *)(a1 + 32) configuration];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v10 = [*(id *)(a1 + 32) configuration];
      int v11 = [v10 contentView];

      id v12 = [v11 presentedAssetIds];
      v13 = [v12 allObjects];

      id v14 = [v13 componentsJoinedByString:@","];
      [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F8E950]];

      BOOL v6 = 1;
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 56) type] == 14)
  {
    __int16 v15 = [MEMORY[0x1E4F1C9C8] date];
    [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F8E960]];

    BOOL v6 = 1;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 56) type] == 26
    || [*(id *)(*(void *)(a1 + 32) + 56) type] == 28)
  {
    uint64_t v16 = *v7;
    id v17 = [v4 objectForKeyedSubscript:*v7];

    if (v17)
    {
      v18 = *(void **)(a1 + 40);
      v19 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeYes", @"PhotosUICore");
      LODWORD(v18) = [v18 isEqualToString:v19];

      if (v18) {
        v20 = @"YES";
      }
      else {
        v20 = @"NO";
      }
      [v4 setObject:v20 forKeyedSubscript:v16];
      BOOL v6 = 1;
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 56) type] == 13)
  {
    uint64_t v21 = *v7;
    int v22 = [v4 objectForKeyedSubscript:*v7];

    if (v22)
    {
      id v23 = *(void **)(a1 + 40);
      v24 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonCurrentPet", @"PhotosUICore");
      LODWORD(v23) = [v23 isEqualToString:v24];

      v25 = (void *)MEMORY[0x1E4F8EA18];
      if (!v23) {
        v25 = (void *)MEMORY[0x1E4F8EA20];
      }
      [v4 setObject:*v25 forKeyedSubscript:v21];
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 56) type] == 5)
  {
    v26 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8EA28]];
    if ([v26 isEqualToString:@"CHILD"])
    {
      uint64_t v27 = *v7;
      v28 = [v4 objectForKeyedSubscript:*v7];

      if (v28)
      {
        v29 = *(void **)(a1 + 40);
        v30 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonBaby", @"PhotosUICore");
        if ([v29 isEqualToString:v30])
        {
        }
        else
        {
          v31 = *(void **)(a1 + 40);
          v32 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonChild", @"PhotosUICore");
          LODWORD(v31) = [v31 isEqualToString:v32];

          if (!v31)
          {
            v33 = (void *)MEMORY[0x1E4F8E928];
            goto LABEL_29;
          }
        }
        v33 = (void *)MEMORY[0x1E4F8E930];
LABEL_29:
        [v4 setObject:*v33 forKeyedSubscript:v27];
      }
    }
    else
    {
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 56) type] == 15)
  {
    uint64_t v34 = *v7;
    int v35 = [v4 objectForKeyedSubscript:*v7];

    if (v35)
    {
      v36 = *(void **)(a1 + 40);
      v37 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonPlaysTooOften", @"PhotosUICore");
      LOBYTE(v36) = [v36 isEqualToString:v37];

      if (v36)
      {
        v38 = (void *)MEMORY[0x1E4F8E9D8];
      }
      else
      {
        v39 = *(void **)(a1 + 40);
        int v40 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonDontLikeSong", @"PhotosUICore");
        LOBYTE(v39) = [v39 isEqualToString:v40];

        if (v39)
        {
          v38 = (void *)MEMORY[0x1E4F8E9B8];
        }
        else
        {
          uint64_t v41 = *(void **)(a1 + 40);
          v42 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonMismatchEnergy", @"PhotosUICore");
          LOBYTE(v41) = [v41 isEqualToString:v42];

          if (v41)
          {
            v38 = (void *)MEMORY[0x1E4F8E9C0];
          }
          else
          {
            int v43 = *(void **)(a1 + 40);
            v44 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonMismatchLyrics", @"PhotosUICore");
            LOBYTE(v43) = [v43 isEqualToString:v44];

            if (v43)
            {
              v38 = (void *)MEMORY[0x1E4F8E9C8];
            }
            else
            {
              v45 = *(void **)(a1 + 40);
              v46 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeMemoryMusicQualityAnswerNoReasonOther", @"PhotosUICore");
              LODWORD(v45) = [v45 isEqualToString:v46];

              v38 = (void *)MEMORY[0x1E4F8E9E0];
              if (v45) {
                v38 = (void *)MEMORY[0x1E4F8E9D0];
              }
            }
          }
        }
      }
      [v4 setObject:*v38 forKeyedSubscript:v34];
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 56) type] == 30)
  {
    uint64_t v47 = *v7;
    v48 = [v4 objectForKeyedSubscript:*v7];

    if (v48)
    {
      v49 = *(void **)(a1 + 40);
      v50 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonUnsafe");
      LOBYTE(v49) = [v49 isEqualToString:v50];

      if (v49)
      {
        v51 = (void *)MEMORY[0x1E4F8EA60];
      }
      else
      {
        v52 = *(void **)(a1 + 40);
        v53 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonConfusing");
        LOBYTE(v52) = [v52 isEqualToString:v53];

        if (v52)
        {
          v51 = (void *)MEMORY[0x1E4F8EA30];
        }
        else
        {
          v54 = *(void **)(a1 + 40);
          v55 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotSpecific");
          LOBYTE(v54) = [v54 isEqualToString:v55];

          if (v54)
          {
            v51 = (void *)MEMORY[0x1E4F8EA48];
          }
          else
          {
            v56 = *(void **)(a1 + 40);
            v57 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonTooSpecific");
            LOBYTE(v56) = [v56 isEqualToString:v57];

            if (v56)
            {
              v51 = (void *)MEMORY[0x1E4F8EA50];
            }
            else
            {
              v58 = *(void **)(a1 + 40);
              v59 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotAccurate");
              LOBYTE(v58) = [v58 isEqualToString:v59];

              if (v58)
              {
                v51 = (void *)MEMORY[0x1E4F8EA38];
              }
              else
              {
                v60 = *(void **)(a1 + 40);
                v61 = PXLocalizedStoryPromptSuggestionsString(@"PXInternalPhotosChallengeStoryPromptSuggestionsAnswerNoReasonNotApplicable");
                LODWORD(v60) = [v60 isEqualToString:v61];

                v51 = (void *)MEMORY[0x1E4F8EA58];
                if (v60) {
                  v51 = (void *)MEMORY[0x1E4F8EA40];
                }
              }
            }
          }
        }
      }
      [v4 setObject:*v51 forKeyedSubscript:v47];
    }
  }
  if (v6) {
    [v62 setAdditionalInfo:v4];
  }
}

void __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke_3(id *a1, char a2, void *a3)
{
  id v5 = a3;
  char v7 = a2;
  objc_copyWeak(v6, a1 + 5);
  v6[1] = a1[6];
  v5;
  a1[4];
  px_dispatch_on_main_queue();
}

uint64_t __73__PXSurveyQuestionGadget__updateSurveyQuestionStateFromAnswer_andReason___block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setAnswer:v2];
  }
  else
  {
    v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "Error updating survey question state from answer (error: %@)", (uint8_t *)&v7, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)gadgetContentView:(id)a3 didAnswer:(unint64_t)a4 withReason:(id)a5
{
}

- (void)setContentHidden:(BOOL)a3
{
  if (self->_contentHidden != a3)
  {
    BOOL v3 = a3;
    self->_contentHidden = a3;
    id v4 = [(PXSurveyQuestionGadget *)self contentView];
    [v4 setContentHidden:v3];
  }
}

- (void)refreshQuestionContentView
{
  if (self->_contentView) {
    [(PXSurveyQuestionGadget *)self _updateContentViewConfiguration];
  }
}

- (void)removeCollectionViewItem:(id)a3
{
  id v13 = a3;
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    int v11 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v11);
    id v12 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXSurveyQuestionGadget.m", 227, @"%@ should be an instance inheriting from %@, but it is %@", @"collectionViewItem", v10, v12 object file lineNumber description];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXSurveyQuestionGadget.m", 227, @"%@ should be an instance inheriting from %@, but it is nil", @"collectionViewItem", v10 object file lineNumber description];
  }

LABEL_3:
  [v13 updateButtonsWithAnswerState:0 reason:0];
  uint64_t v5 = [v13 configuration];
  [v5 setHandlers:0];

  BOOL v6 = objc_alloc_init(PXSurveyQuestionDefaultConfiguration);
  [v13 setConfiguration:v6];

  [(PXSurveyQuestionsGadgetContentView *)self->_contentView setDelegate:0];
  contentView = self->_contentView;
  self->_contentView = 0;

  self->_configurationRequestId = 0x7FFFFFFFFFFFFFFFLL;
}

- (Class)collectionViewItemClass
{
  return (Class)objc_opt_class();
}

- (id)uniqueGadgetIdentifier
{
  return (id)[(PHQuestion *)self->_question uuid];
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (BOOL)_presentViewControllerByLemonadeUI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXSurveyQuestionGadget *)self lemonadeUIDelegate];
  if (v5)
  {
    BOOL v6 = [(PXSurveyQuestionGadget *)self regionOfInterestForOneUpTransition];
    [v5 surveyQuestionGadget:self presentViewController:v4 regionOfInterest:v6];
  }
  return v5 != 0;
}

- (BOOL)_presentAssetCollectionByLemonadeUI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXSurveyQuestionGadget *)self lemonadeUIDelegate];
  if (v5)
  {
    BOOL v6 = [(PXSurveyQuestionGadget *)self regionOfInterestForOneUpTransition];
    [v5 surveyQuestionGadget:self presentAssetCollection:v4 regionOfInterest:v6];
  }
  return v5 != 0;
}

- (BOOL)_presentOneUpByLemonadeUI:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(PXSurveyQuestionGadget *)self lemonadeUIDelegate];
  if (!v6)
  {
    char v9 = 0;
    goto LABEL_10;
  }
  int v7 = [(PXSurveyQuestionGadget *)self question];
  id v8 = v5;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    id v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"PXSurveyQuestionGadget.m", 165, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v18 object file lineNumber description];
LABEL_13:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    v20 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a2, self, @"PXSurveyQuestionGadget.m", 165, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v18, v20 object file lineNumber description];

    goto LABEL_13;
  }
LABEL_4:
  id v21 = 0;
  id v22 = 0;
  char v9 = objc_msgSend(v7, "px_assetCollectionAndAssetFetchResultForAsset:assetCollection:assetFetchResult:", v8, &v22, &v21);
  id v10 = v22;
  id v11 = v21;
  if (v9)
  {
    id v12 = [(PXSurveyQuestionGadget *)self regionOfInterestForOneUpTransition];
    [v6 surveyQuestionGadgetPresentOneUp:self keyAsset:v8 assetCollection:v10 regionOfInterest:v12];
  }
  else
  {
    id v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v8 uuid];
      id v14 = [v7 uuid];
      *(_DWORD *)buf = 138543618;
      v24 = v13;
      __int16 v25 = 2114;
      v26 = v14;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Failed to prepare for one up: No collection or fetch result for asset: %{public}@ for question: %{public}@", buf, 0x16u);
    }
  }

LABEL_10:
  return v9;
}

- (PXRegionOfInterest)regionOfInterestForOneUpTransition
{
  id v4 = [(PXSurveyQuestionGadget *)self contentView];
  if (!v4)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"PXSurveyQuestionGadget.m", 153, @"%@ asked for ROI for 1-Up transition, but our view is not loaded!", v14 object file lineNumber description];

    abort();
  }
  id v5 = v4;
  [v4 contentBoundsInCoordinateSpace:v4];
  id v10 = objc_msgSend(objc_alloc((Class)off_1E5DA82B8), "initWithRect:inCoordinateSpace:", v5, v6, v7, v8, v9);
  id v11 = [v5 configuration];
  [v11 contentRectForOneUp];
  objc_msgSend(v10, "setImageContentsRect:");

  return (PXRegionOfInterest *)v10;
}

- (UIImage)currentImage
{
  uint64_t v2 = [(PXSurveyQuestionGadget *)self contentView];
  BOOL v3 = [v2 configuration];
  id v4 = [v3 contentImageForOneUp];

  return (UIImage *)v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  +[PXSurveyQuestionsGadgetContentView sizeThatFits:](PXSurveyQuestionsGadgetContentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PXSurveyQuestionConfiguration)configuration
{
  uint64_t v2 = [(PXSurveyQuestionGadget *)self contentView];
  double v3 = [v2 configuration];
  double v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_alloc_init(PXSurveyQuestionDefaultConfiguration);
  }
  double v6 = v5;

  return (PXSurveyQuestionConfiguration *)v6;
}

void __34__PXSurveyQuestionGadget_handlers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _presentOneUpByLemonadeUI:v3];
}

void __34__PXSurveyQuestionGadget_handlers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = (id *)(a1 + 32);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  char v8 = [WeakRetained _presentAssetCollectionByLemonadeUI:v6];

  if ((v8 & 1) == 0)
  {
    id v9 = objc_loadWeakRetained(v5);
    id v10 = [v9 delegate];
    id v11 = objc_loadWeakRetained(v5);
    [v10 gadget:v11 transitionToViewController:v12 animated:1 completion:0];
  }
}

void __34__PXSurveyQuestionGadget_handlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  char v5 = [WeakRetained _presentViewControllerByLemonadeUI:v8];

  if ((v5 & 1) == 0)
  {
    id v6 = objc_loadWeakRetained(v3);
    double v7 = [v6 delegate];
    [v7 presentGadgetViewController:v8 animated:1 completion:0];
  }
}

- (unint64_t)hash
{
  return [(PHQuestion *)self->_question hash];
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PXSurveyQuestionGadget *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      question = self->_question;
      id v6 = v4;
      double v7 = [(PHQuestion *)question uuid];
      id v8 = [(PXSurveyQuestionGadget *)v6 question];

      id v9 = [v8 uuid];
      char v10 = [v7 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (PXSurveyQuestionGadget)initWithSurveyQuestion:(id)a3 gadgetType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXSurveyQuestionGadget;
  id v8 = [(PXSurveyQuestionGadget *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_question, a3);
    v9->_gadgetType = a4;
    v9->_configurationRequestId = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (PXSurveyQuestionGadget)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionGadget.m", 81, @"%s is not available as initializer", "-[PXSurveyQuestionGadget init]");

  abort();
}

+ (void)preloadResources
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXSurveyQuestionGadget_preloadResources__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preloadResources_onceToken_146761 != -1) {
    dispatch_once(&preloadResources_onceToken_146761, block);
  }
}

void __42__PXSurveyQuestionGadget_preloadResources__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PXPreloadScheduler sharedScheduler];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PXSurveyQuestionGadget_preloadResources__block_invoke_2;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = *(void *)(a1 + 32);
  [v2 scheduleTaskWithQoS:1 block:v3];
}

uint64_t __42__PXSurveyQuestionGadget_preloadResources__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) confirmYesSoundID];
}

+ (unsigned)confirmYesSoundID
{
  if (confirmYesSoundID_onceToken != -1) {
    dispatch_once(&confirmYesSoundID_onceToken, &__block_literal_global_196_146763);
  }
  return confirmYesSoundID_soundID;
}

void __43__PXSurveyQuestionGadget_confirmYesSoundID__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F28B50], "px_bundle");
  id v2 = [v0 pathForResource:@"PXPeopleConfirmYes" ofType:@"caf"];

  if ([v2 length])
  {
    CFURLRef v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
    AudioServicesCreateSystemSoundID(v1, (SystemSoundID *)&confirmYesSoundID_soundID);
  }
}

+ (id)sharedWorkQueue
{
  if (sharedWorkQueue_onceToken_146773 != -1) {
    dispatch_once(&sharedWorkQueue_onceToken_146773, &__block_literal_global_146774);
  }
  id v2 = (void *)sharedWorkQueue_sharedWorkQueue_146775;
  return v2;
}

void __41__PXSurveyQuestionGadget_sharedWorkQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.surveyWorkQueue", attr);
  id v2 = (void *)sharedWorkQueue_sharedWorkQueue_146775;
  sharedWorkQueue_sharedWorkQueue_146775 = (uint64_t)v1;
}

@end