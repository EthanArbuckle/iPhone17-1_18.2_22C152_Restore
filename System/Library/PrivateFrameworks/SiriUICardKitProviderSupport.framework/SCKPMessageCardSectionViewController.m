@interface SCKPMessageCardSectionViewController
+ (void)initialize;
- (AVAudioPlayer)player;
- (BOOL)_canShowWhileLocked;
- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate;
- (INInteraction)interaction;
- (SCKPMessageCardSectionViewController)initWithMessageCardSection:(id)a3 interaction:(id)a4;
- (SFMessageCardSection)cardSection;
- (void)_asrUpdated:(id)a3;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)beginAudioPlayback;
- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5;
- (void)createAudioPlayer;
- (void)desiresInteractivity:(id)a3;
- (void)loadView;
- (void)messageCardSectionAttachmentTapped:(id)a3;
- (void)messageCardSectionContentUpdated:(id)a3;
- (void)messageCardSectionPlayButtonTapped:(id)a3;
- (void)messageCardSectionSendButtonTapped:(id)a3;
- (void)messageCardSectionViewBeganEditing:(id)a3;
- (void)messageCardSectionViewFinishedEditing:(id)a3;
- (void)messageContentUpdatedAndInitiatedByNewRequest:(BOOL)a3;
- (void)pauseAudioPlayback;
- (void)setCardSectionViewControllingDelegate:(id)a3;
- (void)setupPlaybackSessionOptions;
@end

@implementation SCKPMessageCardSectionViewController

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___SCKPMessageCardSectionViewController;
  objc_msgSendSuper2(&v2, sel_initialize);
  CRLogInitIfNeeded();
}

- (SCKPMessageCardSectionViewController)initWithMessageCardSection:(id)a3 interaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCKPMessageCardSectionViewController;
  v9 = [(SCKPMessageCardSectionViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cardSection, a3);
    objc_storeStrong((id *)&v10->_interaction, a4);
  }

  return v10;
}

- (void)loadView
{
  v3 = [[SCKPMessageCardSectionView alloc] initWithMessageCardSection:self->_cardSection delegate:self];
  [(SCKPMessageCardSectionViewController *)self setView:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)desiresInteractivity:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (void)messageCardSectionViewBeganEditing:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = NSNumber;
  v5 = [(SFMessageCardSection *)self->_cardSection messageText];
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
  [v12 setObject:v6 forKeyedSubscript:@"oldTextLength"];

  id v7 = [(SCKPMessageCardSectionViewController *)self textInputMode];
  id v8 = [v7 primaryLanguage];
  [v12 setObject:v8 forKeyedSubscript:@"keyboardLocale"];

  v9 = [MEMORY[0x263F283F8] sharedAnalytics];
  [v9 logEventWithType:5701 context:v12];

  v10 = [(SCKPMessageCardSectionViewController *)self cardSectionViewControllingDelegate];
  id v11 = objc_alloc_init(MEMORY[0x263F31668]);
  [v10 performCommand:v11 forViewController:self];
}

- (void)messageCardSectionViewFinishedEditing:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__SCKPMessageCardSectionViewController_messageCardSectionViewFinishedEditing___block_invoke;
  block[3] = &unk_26484DF80;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __78__SCKPMessageCardSectionViewController_messageCardSectionViewFinishedEditing___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) cardSectionViewControllingDelegate];
  id v2 = objc_alloc_init(MEMORY[0x263F31678]);
  [v3 performCommand:v2 forViewController:*(void *)(a1 + 32)];
}

- (void)messageCardSectionContentUpdated:(id)a3
{
}

- (void)messageContentUpdatedAndInitiatedByNewRequest:(BOOL)a3
{
  BOOL v3 = a3;
  v25[3] = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  v6 = NSNumber;
  id v7 = [(SCKPMessageCardSectionViewController *)self view];
  id v8 = [v7 displayedText];
  v9 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
  [v5 setObject:v9 forKeyedSubscript:@"newTextLength"];

  v10 = NSNumber;
  id v11 = [(SFMessageCardSection *)self->_cardSection messageText];
  id v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
  [v5 setObject:v12 forKeyedSubscript:@"oldTextLength"];

  v13 = [(SCKPMessageCardSectionViewController *)self textInputMode];
  v14 = [v13 primaryLanguage];
  [v5 setObject:v14 forKeyedSubscript:@"keyboardLocale"];

  v15 = [MEMORY[0x263F283F8] sharedAnalytics];
  [v15 logEventWithType:5702 context:v5];

  id v16 = objc_alloc_init(MEMORY[0x263F31680]);
  [v16 setInvocationIdentifier:*MEMORY[0x263F700E0]];
  v24[0] = *MEMORY[0x263F700D8];
  v17 = [(SCKPMessageCardSectionViewController *)self view];
  v18 = [v17 displayedText];
  v25[0] = v18;
  v24[1] = @"contentUpdateInitiatedByNewRequest";
  v19 = [NSNumber numberWithBool:v3];
  v25[1] = v19;
  v24[2] = @"keyboardLocale";
  v20 = [(SCKPMessageCardSectionViewController *)self textInputMode];
  v21 = [v20 primaryLanguage];
  v25[2] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  [v16 setUserInfo:v22];

  v23 = [(SCKPMessageCardSectionViewController *)self cardSectionViewControllingDelegate];
  [v23 performCommand:v16 forViewController:self];
}

- (void)messageCardSectionSendButtonTapped:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  dispatch_time_t v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  v6 = [v4 dictionary];
  id v7 = NSNumber;
  id v8 = [(SCKPMessageCardSectionViewController *)self view];
  v9 = [v8 displayedText];
  v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  [v6 setObject:v10 forKeyedSubscript:@"newTextLength"];

  id v11 = NSNumber;
  id v12 = [(SFMessageCardSection *)self->_cardSection messageText];
  v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
  [v6 setObject:v13 forKeyedSubscript:@"oldTextLength"];

  v14 = [(SCKPMessageCardSectionViewController *)self textInputMode];
  v15 = [v14 primaryLanguage];
  [v6 setObject:v15 forKeyedSubscript:@"keyboardLocale"];

  id v16 = [MEMORY[0x263F283F8] sharedAnalytics];
  [v16 logEventWithType:5703 context:v6];

  id v17 = objc_alloc_init(MEMORY[0x263F31680]);
  [v17 setInvocationIdentifier:*MEMORY[0x263F700F0]];
  v23[0] = *MEMORY[0x263F700E8];
  v18 = [v5 displayedText];

  v23[1] = @"keyboardLocale";
  v24[0] = v18;
  v19 = [(SCKPMessageCardSectionViewController *)self textInputMode];
  v20 = [v19 primaryLanguage];
  v24[1] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v17 setUserInfo:v21];

  v22 = [(SCKPMessageCardSectionViewController *)self cardSectionViewControllingDelegate];
  [v22 performCommand:v17 forViewController:self];
}

- (void)messageCardSectionPlayButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_player)
  {
    [(SCKPMessageCardSectionViewController *)self createAudioPlayer];
    id v4 = v5;
  }
  if ([v4 playButtonState])
  {
    if ([v5 playButtonState] == 1) {
      [(SCKPMessageCardSectionViewController *)self pauseAudioPlayback];
    }
  }
  else
  {
    [(SCKPMessageCardSectionViewController *)self setupPlaybackSessionOptions];
    [(SCKPMessageCardSectionViewController *)self beginAudioPlayback];
  }
}

- (void)messageCardSectionAttachmentTapped:(id)a3
{
  id v4 = [(SFMessageCardSection *)self->_cardSection commands];
  id v5 = [v4 firstObject];

  if (v5)
  {
    v6 = [(SCKPMessageCardSectionViewController *)self cardSectionViewControllingDelegate];
    [v6 performCommand:v5 forViewController:self];
  }
  else
  {
    id v7 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[SCKPMessageCardSectionViewController messageCardSectionAttachmentTapped:](v7);
    }
  }
}

- (void)createAudioPlayer
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_228A19000, v0, OS_LOG_TYPE_ERROR, "Failed to create AVAudioPlayer: %@", v1, 0xCu);
}

- (void)setupPlaybackSessionOptions
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_228A19000, v0, OS_LOG_TYPE_ERROR, "Failed setting the session category: %@", v1, 0xCu);
}

- (void)beginAudioPlayback
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_228A19000, log, OS_LOG_TYPE_ERROR, "Player failed to begin playback", v1, 2u);
}

- (void)pauseAudioPlayback
{
  [(AVAudioPlayer *)self->_player pause];
  id v3 = [(SCKPMessageCardSectionViewController *)self view];
  [v3 setPlayButtonState:0];
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
    -[SCKPMessageCardSectionViewController audioPlayerDidFinishPlaying:successfully:]();
  }
  v6 = [(SCKPMessageCardSectionViewController *)self view];
  [v6 setPlayButtonState:0];
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
    -[SCKPMessageCardSectionViewController audioPlayerDecodeErrorDidOccur:error:]();
  }
  id v8 = [(SCKPMessageCardSectionViewController *)self view];
  [v8 setPlayButtonState:0];
}

- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  v9 = v8;
  if (a3 == 7 && v8)
  {
    v10 = [v8 objectForKey:@"UpdatedRecognition"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SCKPMessageCardSectionViewController *)self _asrUpdated:v10];
    }
  }
  else
  {
    if (a3 == 9)
    {
      v14 = [(SCKPMessageCardSectionViewController *)self view];
      int v15 = [v14 keyboardIsVisible];

      if (!v15) {
        goto LABEL_12;
      }
      id v16 = [(SCKPMessageCardSectionViewController *)self view];
      [v16 dismissKeyboard];

      id v12 = self;
      uint64_t v13 = 1;
    }
    else
    {
      if (a3 != 8) {
        goto LABEL_12;
      }
      id v11 = [(SCKPMessageCardSectionViewController *)self view];
      [v11 dismissKeyboard];

      id v12 = self;
      uint64_t v13 = 0;
    }
    [(SCKPMessageCardSectionViewController *)v12 messageContentUpdatedAndInitiatedByNewRequest:v13];
  }
LABEL_12:
}

- (void)_asrUpdated:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(INInteraction *)self->_interaction intent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(INInteraction *)self->_interaction intent];
    id v8 = [v7 content];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      v10 = *MEMORY[0x263F31630];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
      {
LABEL_18:

        goto LABEL_19;
      }
      LOWORD(v17) = 0;
      id v11 = "Not updating ASR because the intent has content";
LABEL_5:
      _os_log_impl(&dword_228A19000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v17, 2u);
      goto LABEL_18;
    }
    id v12 = [v7 recipients];
    uint64_t v13 = [v12 count];

    if (!v13)
    {
      v10 = *MEMORY[0x263F31630];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      LOWORD(v17) = 0;
      id v11 = "Not updating ASR because we dont have a recipient";
      goto LABEL_5;
    }
    v14 = [v7 attachments];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      v10 = *MEMORY[0x263F31630];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      LOWORD(v17) = 0;
      id v11 = "Not updating ASR because the message has an attachment";
      goto LABEL_5;
    }
  }
  if (v4 && [v4 length])
  {
    id v16 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_228A19000, v16, OS_LOG_TYPE_INFO, "Updating message field with ASR recognition : %@", (uint8_t *)&v17, 0xCu);
    }
    id v7 = [(SCKPMessageCardSectionViewController *)self view];
    [v7 setMessageContents:v4];
    goto LABEL_18;
  }
LABEL_19:
}

- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->cardSectionViewControllingDelegate);

  return (CRKCardSectionViewControllingDelegate *)WeakRetained;
}

- (void)setCardSectionViewControllingDelegate:(id)a3
{
}

- (SFMessageCardSection)cardSection
{
  return (SFMessageCardSection *)objc_getProperty(self, a2, 984, 1);
}

- (INInteraction)interaction
{
  return (INInteraction *)objc_getProperty(self, a2, 992, 1);
}

- (AVAudioPlayer)player
{
  return (AVAudioPlayer *)objc_getProperty(self, a2, 1000, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);

  objc_destroyWeak((id *)&self->cardSectionViewControllingDelegate);
}

- (void)messageCardSectionAttachmentTapped:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_228A19000, log, OS_LOG_TYPE_ERROR, "#messages: Attempting to punchout with no referential punchout command.", v1, 2u);
}

- (void)audioPlayerDidFinishPlaying:successfully:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_228A19000, v1, OS_LOG_TYPE_ERROR, "Audio player: %@ finished playing with success: %d", v2, 0x12u);
}

- (void)audioPlayerDecodeErrorDidOccur:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_228A19000, v1, OS_LOG_TYPE_ERROR, "Audio player: %@ encountered error: %@", v2, 0x16u);
}

@end