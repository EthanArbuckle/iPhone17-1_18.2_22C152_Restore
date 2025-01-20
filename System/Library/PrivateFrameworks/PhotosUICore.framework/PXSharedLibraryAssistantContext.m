@interface PXSharedLibraryAssistantContext
+ (id)_reviewContextIdentifierForMode:(int64_t)a3 hasPreview:(BOOL)a4;
+ (id)replyAssistantContextWithSharedLibraryStatusProvider:(id)a3 sharedLibrary:(id)a4 legacyDevicesFallbackMonitor:(id)a5;
+ (id)setupAssistantContextWithSharedLibraryStatusProvider:(id)a3 sharedLibrary:(id)a4 sourceLibraryInfo:(id)a5 legacyDevicesFallbackMonitor:(id)a6;
- (BOOL)shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:(id)a3;
- (NSMutableDictionary)stepContextIdentifiersToContexts;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibrary)sharedLibrary;
- (PXSharedLibraryAssistantContext)init;
- (PXSharedLibraryAssistantViewModel)viewModel;
- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor;
- (PXSharedLibraryLegacyDevicesRemoteController)legacyDevicesRemoteController;
- (PXSharedLibraryStatusProvider)statusProvider;
- (id)_cameraStepContextWithIdentifier:(id)a3;
- (id)_dateSelectionStepContextWithIdentifier:(id)a3;
- (id)_firstVisibleStepContextIdentifierIgnoringPreview:(BOOL)a3;
- (id)_howToStepContextWithIdentifier:(id)a3;
- (id)_initWithSharedLibraryStatusProvider:(id)a3 sharedLibrary:(id)a4 sourceLibraryInfo:(id)a5 legacyDevicesFallbackMonitor:(id)a6 legacyDevicesRemoteController:(id)a7 mode:(int64_t)a8;
- (id)_legacyDeviceStepContextIdentifierOrNextContextIdentifier:(id)a3;
- (id)_legacyDevicesFallbackStepContextWithIdentifier:(id)a3;
- (id)_nextContextIdentifierForSelectedPolicy:(int64_t)a3;
- (id)_nextStepContextIdentifierFromStepContextIdentifier:(id)a3;
- (id)_participantsStepContextWithIdentifier:(id)a3;
- (id)_peopleSelectionStepContextWithIdentifier:(id)a3;
- (id)_replyIntroStepContextWithIdentifier:(id)a3;
- (id)_reviewParticipantsSetupDirectStepContextWithIdentifier:(id)a3;
- (id)_reviewParticipantsSetupPreviewStepContextWithIdentifier:(id)a3;
- (id)_reviewParticipantsSetupStepContextWithIdentifier:(id)a3;
- (id)_reviewReplyDirectStepContextWithIdentifier:(id)a3;
- (id)_reviewReplyPreviewStepContextWithIdentifier:(id)a3;
- (id)_reviewReplyStepContextWithIdentifier:(id)a3;
- (id)_rulesStepContextWithIdentifier:(id)a3;
- (id)_setupIntroStepContextWithIdentifier:(id)a3;
- (id)_summaryStepContextWithIdentifier:(id)a3;
- (id)initialStepContextIdentifiers;
- (id)nextStepContextIdentifierFromStepContextIdentifier:(id)a3;
- (id)sharedLibraryStepContextForStepContextIdentifier:(id)a3;
- (id)stepContextForStepContextIdentifier:(id)a3;
- (void)_updateCombinedImage;
- (void)_updateParticipantsInFaceTile;
- (void)configureParticipantListForStepContext:(id)a3 isReviewStep:(BOOL)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAssistantTraitCollection:(id)a3;
- (void)stepContextWithIdentifier:(id)a3 confirmCancellationWithAlertProperties:(id)a4;
- (void)willCancelAssistant;
@end

@implementation PXSharedLibraryAssistantContext

- (id)_reviewParticipantsSetupPreviewStepContextWithIdentifier:(id)a3
{
  v3 = [(PXSharedLibraryAssistantContext *)self _reviewParticipantsSetupStepContextWithIdentifier:a3];
  [v3 performChanges:&__block_literal_global_306_70393];
  return v3;
}

void __102__PXSharedLibraryAssistantContext_Internal___reviewParticipantsSetupPreviewStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setFirstButtonType:4];
  [v2 setSecondButtonType:0];
}

- (id)_reviewParticipantsSetupDirectStepContextWithIdentifier:(id)a3
{
  v3 = [(PXSharedLibraryAssistantContext *)self _reviewParticipantsSetupStepContextWithIdentifier:a3];
  [v3 performChanges:&__block_literal_global_304];
  return v3;
}

uint64_t __101__PXSharedLibraryAssistantContext_Internal___reviewParticipantsSetupDirectStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFirstButtonType:4];
}

- (id)_reviewParticipantsSetupStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXSharedLibraryAssistantContext *)self viewModel];
  v6 = objc_alloc_init(PXSharedLibraryAssistantParticipantViewModel);
  [(PXSharedLibraryAssistantParticipantViewModel *)v6 performChanges:&__block_literal_global_295];
  v7 = [PXSharedLibraryAssistantReviewParticipantsViewController alloc];
  v8 = [(PXSharedLibraryAssistantContext *)self statusProvider];
  v9 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)v7 initWithViewModel:v5 participantViewModel:v6 sharedLibraryStatusProvider:v8];

  v10 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v9];
  [(PXSharedLibraryAssistantContext *)self configureParticipantListForStepContext:v10 isReviewStep:1];

  return v10;
}

void __95__PXSharedLibraryAssistantContext_Internal___reviewParticipantsSetupStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ReviewRecipients_Title");
  [v2 setTitle:v3];

  PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ReviewRecipients_Title_Table_Header");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setSubtitle:v4];
}

- (id)_legacyDevicesFallbackStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXSharedLibraryAssistantContext *)self legacyDevicesFallbackMonitor];
  v6 = [v5 devices];

  v7 = [[PXSharedLibraryLegacyDevicesFallbackViewController alloc] initWithDevices:v6];
  v8 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v7];

  [(PXAssistantStepContext *)v8 performChanges:&__block_literal_global_293_70403];
  return v8;
}

uint64_t __93__PXSharedLibraryAssistantContext_Internal___legacyDevicesFallbackStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFirstButtonType:4];
}

- (id)_howToStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [PXSharedLibraryAssistantHowToViewController alloc];
  v6 = [(PXSharedLibraryAssistantContext *)self libraryFilterState];
  v7 = [(PXSharedLibraryAssistantHowToViewController *)v5 initWithLibraryFilterState:v6];

  v8 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v7];
  [(PXAssistantStepContext *)v8 performChanges:&__block_literal_global_290];

  return v8;
}

uint64_t __77__PXSharedLibraryAssistantContext_Internal___howToStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFirstButtonType:3];
}

- (id)_cameraStepContextWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PXSharedLibraryAssistantCameraViewController);
  v5 = [[PXAssistantStepContext alloc] initWithIdentifier:v3 viewController:v4];

  [(PXAssistantStepContext *)v5 performChanges:&__block_literal_global_287];
  return v5;
}

void __78__PXSharedLibraryAssistantContext_Internal___cameraStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setFirstButtonType:3];
  [v2 setSecondButtonType:2];
}

- (id)_reviewReplyPreviewStepContextWithIdentifier:(id)a3
{
  id v3 = [(PXSharedLibraryAssistantContext *)self _reviewReplyStepContextWithIdentifier:a3];
  [v3 performChanges:&__block_literal_global_284];
  return v3;
}

uint64_t __90__PXSharedLibraryAssistantContext_Internal___reviewReplyPreviewStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFirstButtonType:3];
}

- (id)_reviewReplyDirectStepContextWithIdentifier:(id)a3
{
  id v3 = [(PXSharedLibraryAssistantContext *)self _reviewReplyStepContextWithIdentifier:a3];
  [v3 performChanges:&__block_literal_global_282_70405];
  return v3;
}

uint64_t __89__PXSharedLibraryAssistantContext_Internal___reviewReplyDirectStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFirstButtonType:4];
}

- (id)_reviewReplyStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXSharedLibraryAssistantContext *)self viewModel];
  v6 = [PXSharedLibraryReplyAssistantReviewViewController alloc];
  v7 = [(PXSharedLibraryAssistantContext *)self statusProvider];
  v8 = [(PXSharedLibraryReplyAssistantReviewViewController *)v6 initWithViewModel:v5 sharedLibraryStatusProvider:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__PXSharedLibraryAssistantContext_Internal___reviewReplyStepContextWithIdentifier___block_invoke;
  v11[3] = &unk_1E5DD07C0;
  v11[4] = self;
  [v5 performChanges:v11];
  v9 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v8];

  return v9;
}

void __83__PXSharedLibraryAssistantContext_Internal___reviewReplyStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sharedLibrary];
  [v3 setSharedLibrary:v4];
}

- (id)_summaryStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXSharedLibraryAssistantContext *)self viewModel];
  v6 = [PXSharedLibraryAssistantSummaryViewController alloc];
  v7 = [(PXSharedLibraryAssistantContext *)self statusProvider];
  v8 = [(PXSharedLibraryAssistantContext *)self libraryFilterState];
  v9 = [(PXSharedLibraryAssistantSummaryViewController *)v6 initWithViewModel:v5 sharedLibraryStatusProvider:v7 libraryFilterState:v8];

  v10 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PXSharedLibraryAssistantContext_Internal___summaryStepContextWithIdentifier___block_invoke;
  v12[3] = &unk_1E5DD07C0;
  v12[4] = self;
  [v5 performChanges:v12];
  [(PXAssistantStepContext *)v10 performChanges:&__block_literal_global_279];

  return v10;
}

void __79__PXSharedLibraryAssistantContext_Internal___summaryStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sharedLibrary];
  [v3 setSharedLibrary:v4];
}

uint64_t __79__PXSharedLibraryAssistantContext_Internal___summaryStepContextWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setFirstButtonType:4];
}

- (id)_peopleSelectionStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXSharedLibraryAssistantContext *)self viewModel];
  v6 = [[PXSharedLibraryAssistantPeopleViewController alloc] initWithViewModel:v5];
  v7 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v6];

  [(PXAssistantStepContext *)v7 performChanges:&__block_literal_global_276_70408];
  return v7;
}

uint64_t __87__PXSharedLibraryAssistantContext_Internal___peopleSelectionStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFirstButtonType:4];
}

- (id)_dateSelectionStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXSharedLibraryAssistantContext *)self viewModel];
  v6 = [[PXSharedLibraryAssistantDatePickerViewController alloc] initWithViewModel:v5];
  v7 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v6];

  [(PXAssistantStepContext *)v7 performChanges:&__block_literal_global_273];
  return v7;
}

uint64_t __85__PXSharedLibraryAssistantContext_Internal___dateSelectionStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFirstButtonType:4];
}

- (id)_rulesStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXSharedLibraryAssistantContext *)self viewModel];
  v6 = [[PXSharedLibraryAssistantRulesViewController alloc] initWithViewModel:v5];
  v7 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v6];

  [(PXAssistantStepContext *)v7 performChanges:&__block_literal_global_270_70410];
  return v7;
}

uint64_t __77__PXSharedLibraryAssistantContext_Internal___rulesStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFirstButtonType:4];
}

- (id)_participantsStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PXSharedLibraryAssistantParticipantViewModel);
  [(PXSharedLibraryAssistantParticipantViewModel *)v5 performChanges:&__block_literal_global_258];
  v6 = [PXSharedLibraryAssistantParticipantViewController alloc];
  v7 = [(PXSharedLibraryAssistantContext *)self viewModel];
  v8 = [(PXSharedLibraryAssistantParticipantViewController *)v6 initWithAssistantViewModel:v7 participantViewModel:v5];

  v9 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v8];
  [(PXSharedLibraryAssistantContext *)self configureParticipantListForStepContext:v9 isReviewStep:0];
  [(PXAssistantStepContext *)v9 performChanges:&__block_literal_global_267];

  return v9;
}

uint64_t __84__PXSharedLibraryAssistantContext_Internal___participantsStepContextWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setFirstButtonType:4];
}

void __84__PXSharedLibraryAssistantContext_Internal___participantsStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Participants_Title");
  [v2 setTitle:v3];

  PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Participants_Subtitle");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setSubtitle:v4];
}

- (id)_replyIntroStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXSharedLibraryAssistantContext *)self viewModel];
  v6 = [PXSharedLibraryReplyAssistantViewController alloc];
  v7 = [(PXSharedLibraryAssistantContext *)self legacyDevicesFallbackMonitor];
  v8 = [(PXSharedLibraryReplyAssistantViewController *)v6 initWithViewModel:v5 legacyDevicesFallbackMonitor:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__PXSharedLibraryAssistantContext_Internal___replyIntroStepContextWithIdentifier___block_invoke;
  v11[3] = &unk_1E5DD07C0;
  v11[4] = self;
  [v5 performChanges:v11];
  v9 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v8];

  [(PXAssistantStepContext *)v9 performChanges:&__block_literal_global_254];
  return v9;
}

void __82__PXSharedLibraryAssistantContext_Internal___replyIntroStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sharedLibrary];
  [v3 setSharedLibrary:v4];
}

void __82__PXSharedLibraryAssistantContext_Internal___replyIntroStepContextWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setFirstButtonType:4];
  [v2 setSecondButtonType:2];
}

- (id)_setupIntroStepContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [PXSharedLibraryAssistantWelcomeViewController alloc];
  v6 = [(PXSharedLibraryAssistantContext *)self legacyDevicesFallbackMonitor];
  v7 = [(PXSharedLibraryAssistantContext *)self legacyDevicesRemoteController];
  v8 = [(PXSharedLibraryAssistantWelcomeViewController *)v5 initWithLegacyDevicesFallbackMonitor:v6 legacyDevicesRemoteController:v7];

  v9 = [[PXAssistantStepContext alloc] initWithIdentifier:v4 viewController:v8];
  [(PXAssistantStepContext *)v9 performChanges:&__block_literal_global_70418];

  return v9;
}

void __82__PXSharedLibraryAssistantContext_Internal___setupIntroStepContextWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setFirstButtonType:3];
  [v2 setSecondButtonType:2];
}

- (id)sharedLibraryStepContextForStepContextIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantContext+Internal.m", 64, @"Invalid parameter not satisfying: %@", @"stepContextIdentifier" object file lineNumber description];
  }
  v6 = [(PXSharedLibraryAssistantContext *)self stepContextIdentifiersToContexts];
  v7 = [v6 objectForKeyedSubscript:v5];
  if (!v7)
  {
    if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierIntroSetup"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _setupIntroStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierIntroReply"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _replyIntroStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierParticipants"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _participantsStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierRules"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _rulesStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierDateSelection"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _dateSelectionStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierPeopleSelection"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _peopleSelectionStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierPreview"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _summaryStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierReviewReplyDirect"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _reviewReplyDirectStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierReviewReplyPreview"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _reviewReplyPreviewStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierFutureRules"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _cameraStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierReviewParticipantsSetupDirect"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _reviewParticipantsSetupDirectStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierReviewParticipantsSetupPreview"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _reviewParticipantsSetupPreviewStepContextWithIdentifier:v5];
    }
    else if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierHowTo"])
    {
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _howToStepContextWithIdentifier:v5];
    }
    else
    {
      if (![v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierLegacyDevicesFallback"])
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        v13 = [NSString stringWithUTF8String:"-[PXSharedLibraryAssistantContext(Internal) sharedLibraryStepContextForStepContextIdentifier:]"];
        [v12 handleFailureInFunction:v13 file:@"PXSharedLibraryAssistantContext+Internal.m" lineNumber:101 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      uint64_t v8 = [(PXSharedLibraryAssistantContext *)self _legacyDevicesFallbackStepContextWithIdentifier:v5];
    }
    v7 = (void *)v8;
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantContext+Internal.m", 104, @"Didn't build step context for identifier %@", v5 object file lineNumber description];
    }
    [v6 setObject:v7 forKeyedSubscript:v5];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepContextIdentifiersToContexts, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_legacyDevicesRemoteController, 0);
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, 0);
  objc_storeStrong((id *)&self->_faceTileImageProvider, 0);
}

- (NSMutableDictionary)stepContextIdentifiersToContexts
{
  return self->_stepContextIdentifiersToContexts;
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (PXSharedLibrary)sharedLibrary
{
  return self->_sharedLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (PXSharedLibraryLegacyDevicesRemoteController)legacyDevicesRemoteController
{
  return self->_legacyDevicesRemoteController;
}

- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor
{
  return self->_legacyDevicesFallbackMonitor;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibraryFaceTileImageProviderObservationContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_12;
    }
    id v12 = v9;
    [(PXSharedLibraryAssistantContext *)self _updateCombinedImage];
    goto LABEL_11;
  }
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_120804 != a5
    && PXSharedLibraryAssistantReviewViewModelObservationContext != (void)a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantContext.m" lineNumber:450 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x20) != 0)
  {
    id v12 = v9;
    [(PXSharedLibraryAssistantContext *)self _updateParticipantsInFaceTile];
LABEL_11:
    id v9 = v12;
  }
LABEL_12:
}

- (void)_updateParticipantsInFaceTile
{
  id v3 = [(PXSharedLibraryFaceTileImageProvider *)self->_faceTileImageProvider providerModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__PXSharedLibraryAssistantContext__updateParticipantsInFaceTile__block_invoke;
  v4[3] = &unk_1E5DBC318;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __64__PXSharedLibraryAssistantContext__updateParticipantsInFaceTile__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setIncludeMeContact:0];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 56) participantDataSource];
  id v4 = [v5 participantImageCombinerItems];
  [v3 setFaceTileCombinerItems:v4];
}

- (void)_updateCombinedImage
{
  viewModel = self->_viewModel;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PXSharedLibraryAssistantContext__updateCombinedImage__block_invoke;
  v3[3] = &unk_1E5DD07C0;
  v3[4] = self;
  [(PXSharedLibraryAssistantViewModel *)viewModel performChanges:v3];
}

void __55__PXSharedLibraryAssistantContext__updateCombinedImage__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = a2;
  id v4 = [v2 combinedImage];
  [v3 setParticipantsImage:v4];
}

- (void)stepContextWithIdentifier:(id)a3 confirmCancellationWithAlertProperties:(id)a4
{
  id v23 = a3;
  v7 = (void (**)(id, __CFString *, void *, void *, void *, void *, uint64_t))a4;
  if (!v23)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantContext.m", 390, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_17:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantContext.m", 391, @"Invalid parameter not satisfying: %@", @"alertProperties" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_17;
  }
LABEL_3:
  uint64_t v8 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel sharedLibrary];
  int v9 = [v8 isInPreview];

  if ([(PXSharedLibraryAssistantViewModel *)self->_viewModel mode] == 1
    && ([(PXSharedLibraryAssistantViewModel *)self->_viewModel sharedLibrary],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isPublished],
        v10,
        (v11 & 1) != 0))
  {
    uint64_t v12 = 0;
    char v13 = 0;
    v14 = @"PXSharedLibrarySetupAssistant_CancelAfterPublish_ContinueButton";
    v15 = @"PXSharedLibrarySetupAssistant_CancelAfterPublish_ExitButton";
    v16 = @"PXSharedLibrarySetupAssistant_CancelAfterPublish_Description_iOS";
  }
  else
  {
    if (v9) {
      v14 = @"PXSharedLibrarySetupAssistant_CancelAfterPreview_ContinueButton";
    }
    else {
      v14 = 0;
    }
    char v13 = v9 ^ 1;
    v15 = @"PXSharedLibrarySetupAssistant_Cancel_ExitButton";
    v16 = @"PXSharedLibrarySetupAssistant_Cancel_Description_iOS";
    uint64_t v12 = 1;
  }
  v17 = PXLocalizedSharedLibraryString(v16);
  v18 = PXLocalizedSharedLibraryString(v15);
  if (v13)
  {
    v19 = 0;
  }
  else
  {
    v19 = PXLocalizedSharedLibraryString(v14);
  }
  v20 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Cancel_CancelButton");
  v7[2](v7, &stru_1F00B0030, v17, v18, v20, v19, v12);
}

- (void)willCancelAssistant
{
}

uint64_t __54__PXSharedLibraryAssistantContext_willCancelAssistant__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsCancelingAssistant:1];
}

- (BOOL)shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantContext.m", 373, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierFutureRules"]) {
    LOBYTE(v6) = 0;
  }
  else {
    int v6 = [v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierHowTo"] ^ 1;
  }
  BOOL v7 = v6 & [(PXSharedLibraryAssistantViewModel *)self->_viewModel hasChangedUserInputValues];

  return v7;
}

- (void)setAssistantTraitCollection:(id)a3
{
  id v4 = a3;
  [v4 displayScale];
  uint64_t v6 = v5;
  char v7 = [v4 isRTL];

  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  int v9 = [(PXSharedLibraryFaceTileImageProvider *)self->_faceTileImageProvider providerModel];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PXSharedLibraryAssistantContext_setAssistantTraitCollection___block_invoke;
  v11[3] = &unk_1E5DBC2F0;
  uint64_t v14 = v6;
  char v15 = v7;
  id v10 = v8;
  id v12 = v10;
  id v13 = v10;
  [v9 performChanges:v11];
}

void __63__PXSharedLibraryAssistantContext_setAssistantTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 48);
  id v4 = a2;
  [v4 setDisplayScale:v3];
  [v4 setIsRTL:*(unsigned __int8 *)(a1 + 56)];
  [v4 setBackgroundColor:*(void *)(a1 + 32)];
  [v4 setBorderColor:*(void *)(a1 + 40)];
}

- (id)stepContextForStepContextIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantContext.m", 345, @"Invalid parameter not satisfying: %@", @"stepContextIdentifier" object file lineNumber description];
  }
  uint64_t v6 = [(PXSharedLibraryAssistantContext *)self sharedLibraryStepContextForStepContextIdentifier:v5];

  return v6;
}

- (id)_legacyDeviceStepContextIdentifierOrNextContextIdentifier:(id)a3
{
  id v4 = (__CFString *)a3;
  legacyDevicesFallbackMonitor = self->_legacyDevicesFallbackMonitor;
  if (legacyDevicesFallbackMonitor
    && [(PXSharedLibraryLegacyDevicesFallbackMonitor *)legacyDevicesFallbackMonitor state] != 1)
  {
    legacyDevicesRemoteController = self->_legacyDevicesRemoteController;
    if (legacyDevicesRemoteController) {
      BOOL v6 = [(PXSharedLibraryLegacyDevicesRemoteController *)legacyDevicesRemoteController state] == 3;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }
  id v8 = [(PXSharedLibraryLegacyDevicesFallbackMonitor *)self->_legacyDevicesFallbackMonitor devices];
  uint64_t v9 = [v8 count];

  if (v9) {
    int v10 = v6;
  }
  else {
    int v10 = 1;
  }
  if (v10) {
    char v11 = v4;
  }
  else {
    char v11 = @"PXSharedLibraryStepContextIdentifierLegacyDevicesFallback";
  }
  id v12 = v11;

  return v12;
}

- (id)_nextContextIdentifierForSelectedPolicy:(int64_t)a3
{
  unint64_t v4 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel autoSharePolicy];
  if (v4 >= 2)
  {
    if (v4 != 2)
    {
      uint64_t v9 = 0;
      goto LABEL_17;
    }
    if ([(PXSharedLibraryAssistantViewModel *)self->_viewModel shouldShowPeopleState] == 1) {
      uint64_t v9 = @"PXSharedLibraryStepContextIdentifierPeopleSelection";
    }
    else {
      uint64_t v9 = @"PXSharedLibraryStepContextIdentifierDateSelection";
    }
    goto LABEL_16;
  }
  viewModel = self->_viewModel;
  if (!viewModel)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  [(PXSharedLibraryAssistantViewModel *)viewModel shareCounts];
  uint64_t v6 = v12;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v13;
    uint64_t v8 = v14;
LABEL_10:
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL && !(v7 + v6 + v8))
    {
      objc_msgSend((id)objc_opt_class(), "_reviewContextIdentifierForMode:hasPreview:", -[PXSharedLibraryAssistantViewModel mode](self->_viewModel, "mode"), -[PXSharedLibrary isInPreview](self->_sharedLibrary, "isInPreview"));
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  uint64_t v9 = @"PXSharedLibraryStepContextIdentifierPreview";
LABEL_16:
  int v10 = v9;
LABEL_17:
  return v9;
}

- (id)_nextStepContextIdentifierFromStepContextIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantContext.m", 232, @"Invalid parameter not satisfying: %@", @"stepContextIdentifier" object file lineNumber description];
  }
  if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierIntroSetup"])
  {
    uint64_t v6 = @"PXSharedLibraryStepContextIdentifierParticipants";
LABEL_7:
    uint64_t v7 = [(PXSharedLibraryAssistantContext *)self _legacyDeviceStepContextIdentifierOrNextContextIdentifier:v6];
LABEL_8:
    uint64_t v8 = (__CFString *)v7;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierIntroReply"])
  {
    uint64_t v6 = @"PXSharedLibraryStepContextIdentifierRules";
    goto LABEL_7;
  }
  if (![v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierParticipants"])
  {
    if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierRules"])
    {
      uint64_t v7 = [(PXSharedLibraryAssistantContext *)self _nextContextIdentifierForSelectedPolicy:[(PXSharedLibraryAssistantViewModel *)self->_viewModel autoSharePolicy]];
      goto LABEL_8;
    }
    if (![v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierDateSelection"])
    {
      if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierPeopleSelection"])
      {
        uint64_t v8 = @"PXSharedLibraryStepContextIdentifierDateSelection";
        goto LABEL_14;
      }
      if (![v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierPreview"])
      {
        if (([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierReviewParticipantsSetupDirect"] & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", @"PXSharedLibraryStepContextIdentifierReviewParticipantsSetupPreview") & 1) != 0|| (objc_msgSend(v5, "isEqualToString:", @"PXSharedLibraryStepContextIdentifierReviewReplyDirect") & 1) != 0|| objc_msgSend(v5, "isEqualToString:", @"PXSharedLibraryStepContextIdentifierReviewReplyPreview"))
        {
          uint64_t v8 = @"PXSharedLibraryStepContextIdentifierFutureRules";
          goto LABEL_14;
        }
        if ([v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierFutureRules"])
        {
          uint64_t v8 = @"PXSharedLibraryStepContextIdentifierHowTo";
          goto LABEL_14;
        }
        if (![v5 isEqualToString:@"PXSharedLibraryStepContextIdentifierLegacyDevicesFallback"])
        {
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantContext.m" lineNumber:275 description:@"Code which should be unreachable has been reached"];

          abort();
        }
        if ([(PXSharedLibraryAssistantViewModel *)self->_viewModel mode] == 1)
        {
          uint64_t v8 = @"PXSharedLibraryStepContextIdentifierParticipants";
          goto LABEL_14;
        }
        goto LABEL_13;
      }
LABEL_37:
      uint64_t v7 = objc_msgSend((id)objc_opt_class(), "_reviewContextIdentifierForMode:hasPreview:", -[PXSharedLibraryAssistantViewModel mode](self->_viewModel, "mode"), -[PXSharedLibrary isInPreview](self->_sharedLibrary, "isInPreview"));
      goto LABEL_8;
    }
    char v11 = [(PXSharedLibraryAssistantContext *)self viewModel];
    uint64_t v12 = v11;
    if (v11)
    {
      [v11 shareCounts];
      uint64_t v13 = v19;
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v14 = 0;
        goto LABEL_34;
      }
      uint64_t v16 = v20;
      uint64_t v15 = v21;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v13 = 0;
    }
    BOOL v14 = 0;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL) {
      BOOL v14 = v16 + v13 + v15 == 0;
    }
LABEL_34:

    if ([(PXSharedLibraryAssistantViewModel *)self->_viewModel autoSharePolicy] && !v14)
    {
      uint64_t v8 = @"PXSharedLibraryStepContextIdentifierPreview";
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_13:
  uint64_t v8 = @"PXSharedLibraryStepContextIdentifierRules";
LABEL_14:
  int v10 = v8;
LABEL_9:

  return v8;
}

- (id)_firstVisibleStepContextIdentifierIgnoringPreview:(BOOL)a3
{
  if (a3) {
    sharedLibrary = 0;
  }
  else {
    sharedLibrary = self->_sharedLibrary;
  }
  uint64_t v6 = sharedLibrary;
  int64_t v7 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel mode];
  switch(v7)
  {
    case 1:
      uint64_t v9 = @"PXSharedLibraryStepContextIdentifierReviewParticipantsSetupPreview";
      if (!v6) {
        uint64_t v9 = @"PXSharedLibraryStepContextIdentifierIntroSetup";
      }
      goto LABEL_13;
    case 2:
      int v10 = [(PXSharedLibrary *)v6 isInPreview];
      uint64_t v9 = @"PXSharedLibraryStepContextIdentifierIntroReply";
      if (v10) {
        uint64_t v9 = @"PXSharedLibraryStepContextIdentifierReviewReplyPreview";
      }
LABEL_13:
      uint64_t v8 = v9;
      goto LABEL_14;
    case 0:
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantContext.m" lineNumber:211 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  uint64_t v8 = 0;
LABEL_14:

  return v8;
}

- (id)nextStepContextIdentifierFromStepContextIdentifier:(id)a3
{
  if (a3) {
    -[PXSharedLibraryAssistantContext _nextStepContextIdentifierFromStepContextIdentifier:](self, "_nextStepContextIdentifierFromStepContextIdentifier:");
  }
  else {
  double v3 = -[PXSharedLibraryAssistantContext _firstVisibleStepContextIdentifierIgnoringPreview:](self, "_firstVisibleStepContextIdentifierIgnoringPreview:");
  }
  return v3;
}

- (id)initialStepContextIdentifiers
{
  unint64_t v4 = [(PXSharedLibraryAssistantContext *)self _firstVisibleStepContextIdentifierIgnoringPreview:0];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = 0;
  do
  {
    if (v6)
    {
      uint64_t v7 = [(PXSharedLibraryAssistantContext *)self _nextStepContextIdentifierFromStepContextIdentifier:v6];

      uint64_t v6 = (void *)v7;
      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v6 = [(PXSharedLibraryAssistantContext *)self _firstVisibleStepContextIdentifierIgnoringPreview:1];
      if (v6) {
        goto LABEL_4;
      }
    }
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantContext.m", 187, @"Invalid parameter not satisfying: %@", @"nextIdentifier" object file lineNumber description];

LABEL_4:
    int v8 = [v6 isEqualToString:v4];
    [v5 addObject:v6];
  }
  while (!v8);

  return v5;
}

- (void)configureParticipantListForStepContext:(id)a3 isReviewStep:(BOOL)a4
{
  BOOL v4 = a4;
  [(PXSharedLibraryAssistantContext *)self _updateParticipantsInFaceTile];
  viewModel = self->_viewModel;
  uint64_t v7 = &PXSharedLibraryAssistantReviewViewModelObservationContext;
  if (!v4) {
    uint64_t v7 = &PXSharedLibraryAssistantViewModelObservationContext_120804;
  }
  uint64_t v8 = *v7;
  [(PXSharedLibraryAssistantViewModel *)viewModel registerChangeObserver:self context:v8];
}

- (id)_initWithSharedLibraryStatusProvider:(id)a3 sharedLibrary:(id)a4 sourceLibraryInfo:(id)a5 legacyDevicesFallbackMonitor:(id)a6 legacyDevicesRemoteController:(id)a7 mode:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v64.receiver = self;
  v64.super_class = (Class)PXSharedLibraryAssistantContext;
  uint64_t v19 = [(PXSharedLibraryAssistantContext *)&v64 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_statusProvider, a3);
    uint64_t v21 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v20->_statusProvider];
    libraryFilterState = v20->_libraryFilterState;
    v20->_libraryFilterState = v21;

    objc_storeStrong((id *)&v20->_sharedLibrary, a4);
    id v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    stepContextIdentifiersToContexts = v20->_stepContextIdentifiersToContexts;
    v20->_stepContextIdentifiersToContexts = v23;

    objc_storeStrong((id *)&v20->_legacyDevicesFallbackMonitor, a6);
    objc_storeStrong((id *)&v20->_legacyDevicesRemoteController, a7);
    if (v15) {
      PXSharedLibraryUIParticipantsForSharedLibrary(v15, 1u);
    }
    v25 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v26 = +[PXSharedLibraryParticipantDataSourceManager aggregatedDataSourceWithParticipants:MEMORY[0x1E4F1CBF0]];
    v27 = objc_alloc_init(PXSharedLibraryFaceTileImageProvider);
    faceTileImageProvider = v20->_faceTileImageProvider;
    v20->_faceTileImageProvider = v27;

    v29 = [(PXSharedLibraryFaceTileImageProvider *)v20->_faceTileImageProvider providerModel];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __168__PXSharedLibraryAssistantContext__initWithSharedLibraryStatusProvider_sharedLibrary_sourceLibraryInfo_legacyDevicesFallbackMonitor_legacyDevicesRemoteController_mode___block_invoke;
    v61[3] = &unk_1E5DBC230;
    int64_t v63 = a8;
    id v62 = 0;
    [v29 performChanges:v61];
    [(PXSharedLibraryFaceTileImageProvider *)v20->_faceTileImageProvider registerChangeObserver:v20 context:PXSharedLibraryFaceTileImageProviderObservationContext];
    id v48 = v17;
    id v49 = v14;
    v46 = v25;
    id v47 = v18;
    v44 = (void *)v26;
    v45 = v29;
    v30 = (void *)MEMORY[0x1E4F1CBF0];
    v31 = (void *)MEMORY[0x1E4F1CBF0];
    v32 = v16;
    v33 = [v16 createDataSourceManager];
    if (v33)
    {
      v34 = (void *)[objc_alloc((Class)off_1E5DA5640) initWithAssetsDataSourceManager:v33];
      [v34 prepareCountsIfNeeded];
    }
    v35 = objc_alloc_init(PXSharedLibraryAssistantViewModel);
    viewModel = v20->_viewModel;
    v20->_viewModel = v35;

    v37 = v20->_viewModel;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __168__PXSharedLibraryAssistantContext__initWithSharedLibraryStatusProvider_sharedLibrary_sourceLibraryInfo_legacyDevicesFallbackMonitor_legacyDevicesRemoteController_mode___block_invoke_2;
    v51[3] = &unk_1E5DBC258;
    int64_t v58 = a8;
    uint64_t v59 = 0;
    id v52 = 0;
    id v53 = v30;
    v54 = v20;
    id v55 = v44;
    uint64_t v60 = 0;
    id v56 = v32;
    id v57 = v31;
    id v38 = v31;
    id v39 = v44;
    id v40 = v30;
    id v41 = 0;
    v42 = v37;
    id v16 = v32;
    [(PXSharedLibraryAssistantViewModel *)v42 performInitialChanges:v51];

    id v17 = v48;
    id v14 = v49;
    id v18 = v47;
  }

  return v20;
}

void __168__PXSharedLibraryAssistantContext__initWithSharedLibraryStatusProvider_sharedLibrary_sourceLibraryInfo_legacyDevicesFallbackMonitor_legacyDevicesRemoteController_mode___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setIncludeMeContact:0];
  [v4 setImageDiameter:80.0];
  if (*(void *)(a1 + 40) == 2)
  {
    double v3 = PXSharedLibraryRecipientsForSharedLibrary(*(void **)(a1 + 32));
    [v4 setFaceTileCombinerItems:v3];
  }
}

void __168__PXSharedLibraryAssistantContext__initWithSharedLibraryStatusProvider_sharedLibrary_sourceLibraryInfo_legacyDevicesFallbackMonitor_legacyDevicesRemoteController_mode___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[10];
  id v5 = a2;
  [v5 setMode:v3];
  [v5 setAutoSharePolicy:a1[11]];
  [v5 setStartDate:a1[4]];
  [v5 setPersonUUIDs:a1[5]];
  id v4 = [*(id *)(a1[6] + 8) combinedImage];
  [v5 setParticipantsImage:v4];

  [v5 setParticipantDataSource:a1[7]];
  [v5 setSourceLibraryInfo:a1[8]];
  [v5 setSharedLibrary:*(void *)(a1[6] + 48)];
  [v5 setSelectedRuleType:a1[12]];
  [v5 setAssetLocalIdentifiers:a1[9]];
}

- (PXSharedLibraryAssistantContext)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryAssistantContext.m", 50, @"%s is not available as initializer", "-[PXSharedLibraryAssistantContext init]");

  abort();
}

+ (id)_reviewContextIdentifierForMode:(int64_t)a3 hasPreview:(BOOL)a4
{
  switch(a3)
  {
    case 1:
      id v5 = PXSharedLibraryStepContextIdentifierReviewParticipantsSetupDirect;
      uint64_t v6 = PXSharedLibraryStepContextIdentifierReviewParticipantsSetupPreview;
      break;
    case 2:
      id v5 = PXSharedLibraryStepContextIdentifierReviewReplyDirect;
      uint64_t v6 = PXSharedLibraryStepContextIdentifierReviewReplyPreview;
      break;
    case 0:
      int v10 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0, a4);
      [v10 handleFailureInMethod:a2 object:a1 file:@"PXSharedLibraryAssistantContext.m" lineNumber:284 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      id v4 = 0;
      goto LABEL_10;
  }
  if (a4) {
    id v5 = v6;
  }
  id v4 = *v5;
LABEL_10:
  return v4;
}

+ (id)replyAssistantContextWithSharedLibraryStatusProvider:(id)a3 sharedLibrary:(id)a4 legacyDevicesFallbackMonitor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PXSharedLibraryAssistantContext.m", 149, @"Invalid parameter not satisfying: %@", @"sharedLibraryStatusProvider" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"PXSharedLibraryAssistantContext.m", 150, @"Invalid parameter not satisfying: %@", @"sharedLibrary" object file lineNumber description];

LABEL_3:
  uint64_t v12 = [v10 isInPreview];
  if (!v11)
  {
    id v11 = +[PXSharedLibraryLegacyDevicesFallbackMonitor legacyDevicesFallbackMonitorIfEnabledWithSharedLibraryOrPreviewPresent:v12];
  }
  uint64_t v13 = +[PXSharedLibraryLegacyDevicesRemoteController legacyDevicesRemoteControllerIfEnabledWithSharedLibraryOrPreviewPresent:v12];
  id v14 = [v10 sourceLibraryInfo];
  id v15 = [[PXSharedLibraryAssistantContext alloc] _initWithSharedLibraryStatusProvider:v9 sharedLibrary:v10 sourceLibraryInfo:v14 legacyDevicesFallbackMonitor:v11 legacyDevicesRemoteController:v13 mode:2];

  return v15;
}

+ (id)setupAssistantContextWithSharedLibraryStatusProvider:(id)a3 sharedLibrary:(id)a4 sourceLibraryInfo:(id)a5 legacyDevicesFallbackMonitor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v14;
  if (v11)
  {
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"PXSharedLibraryAssistantContext.m", 134, @"Invalid parameter not satisfying: %@", @"sharedLibraryStatusProvider" object file lineNumber description];

  if (!v15)
  {
LABEL_3:
    id v15 = +[PXSharedLibraryLegacyDevicesFallbackMonitor legacyDevicesFallbackMonitorIfEnabledWithSharedLibraryOrPreviewPresent:v12 != 0];
  }
LABEL_4:
  id v16 = +[PXSharedLibraryLegacyDevicesRemoteController legacyDevicesRemoteControllerIfEnabledWithSharedLibraryOrPreviewPresent:v12 != 0];
  id v17 = [[PXSharedLibraryAssistantContext alloc] _initWithSharedLibraryStatusProvider:v11 sharedLibrary:v12 sourceLibraryInfo:v13 legacyDevicesFallbackMonitor:v15 legacyDevicesRemoteController:v16 mode:1];

  return v17;
}

@end