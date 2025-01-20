@interface SUICKPAudioPlaybackCardSectionViewController
+ (id)cardSectionClasses;
- (void)_performCommands:(id)a3 applyingUserInfo:(id)a4;
- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5;
- (void)didEngageCardSection:(id)a3;
@end

@implementation SUICKPAudioPlaybackCardSectionViewController

+ (id)cardSectionClasses
{
  if (cardSectionClasses_onceToken_1 != -1) {
    dispatch_once(&cardSectionClasses_onceToken_1, &__block_literal_global_1);
  }
  v2 = (void *)cardSectionClasses_cardSectionClasses_1;
  return v2;
}

uint64_t __66__SUICKPAudioPlaybackCardSectionViewController_cardSectionClasses__block_invoke()
{
  cardSectionClasses_cardSectionClasses_1 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)SUICKPAudioPlaybackCardSectionViewController;
  [(CRKCardSectionViewController *)&v35 cardEventDidOccur:a3 withIdentifier:v8 userInfo:a5];
  v9 = [(CRKCardSectionViewController *)self cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v26 = (void *)*MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[SUICKPAudioPlaybackCardSectionViewController cardEventDidOccur:withIdentifier:userInfo:](v26, self);
    }
    goto LABEL_26;
  }
  v11 = [(SUICKPAudioPlaybackCardSectionViewController *)self view];
  char v12 = [v11 conformsToProtocol:&unk_26DFA9AE8];

  if ((v12 & 1) == 0)
  {
    v27 = (void *)*MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[SUICKPAudioPlaybackCardSectionViewController cardEventDidOccur:withIdentifier:userInfo:](v27, self);
    }
    goto LABEL_26;
  }
  if (a3 == 2)
  {
    v28 = [(CRKCardSectionViewController *)self cardSection];
    int v29 = [v28 state];

    if (!v29) {
      goto LABEL_26;
    }
    v30 = [(CRKCardSectionViewController *)self cardSection];
    v31 = v30;
    uint64_t v32 = 0;
LABEL_23:
    [v30 setState:v32];

    v13 = [(SUICKPAudioPlaybackCardSectionViewController *)self view];
    v33 = [(CRKCardSectionViewController *)self cardSection];
    [v13 updateStateFromCardSection:v33];

LABEL_25:
    goto LABEL_26;
  }
  if (a3 != 1) {
    goto LABEL_26;
  }
  v13 = [(CRKCardSectionViewController *)self cardSection];
  v14 = [v13 playCommands];
  id v15 = v8;
  id v16 = v14;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v18)
  {

    goto LABEL_25;
  }
  uint64_t v19 = v18;
  v34 = v13;
  uint64_t v20 = *(void *)v37;
  while (2)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v37 != v20) {
        objc_enumerationMutation(v17);
      }
      v22 = [*(id *)(*((void *)&v36 + 1) + 8 * i) value];
      v23 = [v22 referentialCommand];
      v24 = [v23 referenceIdentifier];

      char v25 = [v24 isEqualToString:v15];
      if (v25)
      {

LABEL_22:
        v30 = [(CRKCardSectionViewController *)self cardSection];
        v31 = v30;
        uint64_t v32 = 2;
        goto LABEL_23;
      }
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v19) {
      continue;
    }
    break;
  }

  if (v25) {
    goto LABEL_22;
  }
LABEL_26:
}

- (void)didEngageCardSection:(id)a3
{
  v38[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CRKCardSectionViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CRKCardSectionViewController *)self delegate];
    id v8 = (void *)MEMORY[0x263F316B0];
    v9 = [v4 cardSection];
    v10 = [v8 cardSectionWithSFCardSection:v9];
    [v7 cardSectionView:v10 willProcessEngagementFeedback:v4];
  }
  v11 = [(CRKCardSectionViewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(CRKCardSectionViewController *)self delegate];
    v14 = [(CRKCardSectionViewController *)self cardSection];
    [v13 userDidEngageCardSection:v14 withEngagementFeedback:v4];
  }
  id v15 = [(CRKCardSectionViewController *)self cardSection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v17 = [(CRKCardSectionViewController *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      uint64_t v19 = [v4 actionTarget];
      uint64_t v20 = [(CRKCardSectionViewController *)self cardSection];
      v21 = v20;
      if (v19 == 4)
      {
        int v22 = [v20 state];

        v23 = [(CRKCardSectionViewController *)self cardSection];
        v24 = v23;
        if (!v22)
        {
          objc_super v35 = [v23 stopCommands];
          [(SUICKPAudioPlaybackCardSectionViewController *)self _performCommands:v35 applyingUserInfo:0];

          id v26 = [(CRKCardSectionViewController *)self cardSection];
          v27 = [v26 playCommands];
          long long v37 = @"CRKAudioPlaybackCardSectionIgnoresMuteSwitch";
          v38[0] = MEMORY[0x263EFFA88];
          long long v36 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
          [(SUICKPAudioPlaybackCardSectionViewController *)self _performCommands:v27 applyingUserInfo:v36];

          goto LABEL_18;
        }
        int v25 = [v23 state];

        if (v25 == 2)
        {
          id v26 = [(CRKCardSectionViewController *)self cardSection];
          v27 = [v26 stopCommands];
          [(SUICKPAudioPlaybackCardSectionViewController *)self _performCommands:v27 applyingUserInfo:0];
LABEL_18:

          goto LABEL_19;
        }
      }
      else
      {
        v30 = [v20 backingCardSection];
        v31 = [v30 nextCard];

        if (v31)
        {
          id v26 = objc_alloc_init(MEMORY[0x263F31688]);
          uint64_t v32 = [(CRKCardSectionViewController *)self cardSection];
          v33 = [v32 backingCardSection];
          v34 = [v33 nextCard];
          [v26 setNextCard:v34];

          [(CRKCardSectionViewController *)self _performCommand:v26];
LABEL_19:
        }
      }
    }
    else
    {
      int v29 = *MEMORY[0x263F31630];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
        -[SUICKPAudioPlaybackCardSectionViewController didEngageCardSection:](v29);
      }
    }
  }
  else
  {
    v28 = (void *)*MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[SUICKPAudioPlaybackCardSectionViewController cardEventDidOccur:withIdentifier:userInfo:](v28, self);
    }
  }
}

- (void)_performCommands:(id)a3 applyingUserInfo:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        char v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v12 setUserInfo:v7];
        [(CRKCardSectionViewController *)self _performCommand:v12];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)cardEventDidOccur:(void *)a1 withIdentifier:(void *)a2 userInfo:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 view];
  id v5 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_0(&dword_22C0E8000, v6, v7, "SUICKPAudioPlaybackCardSectionViewController view is %@. Expecting SearchUICardSectionViewUpdatable", v8, v9, v10, v11, 2u);
}

- (void)cardEventDidOccur:(void *)a1 withIdentifier:(void *)a2 userInfo:.cold.2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 cardSection];
  id v5 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_0(&dword_22C0E8000, v6, v7, "SUICKPAudioPlaybackCardSectionViewController using %@. Expecting SFAudioPlaybackCardSection", v8, v9, v10, v11, 2u);
}

- (void)didEngageCardSection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C0E8000, log, OS_LOG_TYPE_ERROR, "[SUICKPAudioPlaybackCardSectionViewController delegate] does not repsond to performCommand:forCardSectionViewController:", v1, 2u);
}

@end