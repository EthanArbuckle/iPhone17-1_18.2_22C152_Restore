@interface SiriSharedUISAEViewState
- (BOOL)activeSmartDialogIsLatencyPill;
- (BOOL)hasSmartDialogSnippet;
- (BOOL)isInAmbient;
- (BOOL)requireFinalSpeechHypothesisBeforeAppearance;
- (BOOL)upcomingResultHasSnippet;
- (NSArray)_activeTranscriptItems;
- (NSArray)activeConversationTranscriptItems;
- (NSArray)previousConversationTranscriptItems;
- (NSArray)serverUtterances;
- (NSArray)storedConversationTranscriptItems;
- (NSMutableArray)finalAndDisplayedSmartDialogs;
- (SiriSharedUISAEUserUtteranceViewModel)userUtterance;
- (SiriSharedUISAEViewState)initWithContainerView:(id)a3;
- (SiriSharedUISAEViewStateDelegate)delegate;
- (SiriSharedUISmartDialogView)activeSmartDialogView;
- (SiriSharedUISystemAssistantExperienceContainerView)containerView;
- (int64_t)inputType;
- (void)_presentOrTransitionActiveSmartDialogView;
- (void)_presentPillOrCollapseResult;
- (void)_presentResult;
- (void)_setActiveConversationTranscriptItems:(id)a3;
- (void)_setActiveTranscriptItems:(id)a3;
- (void)_setIsPresentedWithSmartDialogText;
- (void)_setSmartDialogCard:(id)a3;
- (void)_setSmartDialogPlugin:(id)a3;
- (void)_setSmartDialogServerUtterances:(id)a3;
- (void)_setSmartDialogUserUtterance:(id)a3;
- (void)_setState:(int)a3;
- (void)_smartDialogContentDidChange;
- (void)removeResponseElements:(unint64_t)a3;
- (void)saeViewModelDidChange:(id)a3 withDiff:(unint64_t)a4;
- (void)setActiveSmartDialogView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasSmartDialogSnippet:(BOOL)a3;
- (void)setInputType:(int64_t)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setPreviousConversationTranscriptItems:(id)a3;
- (void)setSmartDialogAnimationInProgress:(BOOL)a3;
@end

@implementation SiriSharedUISAEViewState

- (SiriSharedUISAEViewState)initWithContainerView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriSharedUISAEViewState;
  v5 = [(SiriSharedUISAEViewState *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(SiriSharedUISAEViewState *)v5 setContainerView:v4];
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    finalAndDisplayedSmartDialogs = v6->_finalAndDisplayedSmartDialogs;
    v6->_finalAndDisplayedSmartDialogs = (NSMutableArray *)v7;

    v6->_previousViewState = 0;
    v6->_currentViewState = 0;
  }

  return v6;
}

- (void)saeViewModelDidChange:(id)a3 withDiff:(unint64_t)a4
{
  uint64_t v147 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  v8 = (os_log_t *)MEMORY[0x263F28348];
  if (a4 != 8)
  {
    unsigned int v128 = a4;
    v23 = [v6 conversationTranscriptItems];
    v24 = (SiriSharedUISmartDialogView *)[v23 mutableCopy];

    v130 = [v7 serverUtterances];
    v129 = [v7 userUtterance];
    v25 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v142 = "-[SiriSharedUISAEViewState saeViewModelDidChange:withDiff:]";
      __int16 v143 = 2112;
      v144 = v24;
      _os_log_impl(&dword_20C9D5000, v25, OS_LOG_TYPE_DEFAULT, "%s #sae Setting active conversation transcript items to : %@", buf, 0x16u);
    }
    os_log_t v26 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = [(SiriSharedUISmartDialogView *)v130 firstObject];
      v29 = [v28 text];
      *(_DWORD *)buf = 136315650;
      v142 = "-[SiriSharedUISAEViewState saeViewModelDidChange:withDiff:]";
      __int16 v143 = 2112;
      v144 = v130;
      __int16 v145 = 2112;
      v146 = v29;
      _os_log_impl(&dword_20C9D5000, v27, OS_LOG_TYPE_DEFAULT, "%s #sae Setting server utterances to : %@ text: %@", buf, 0x20u);
    }
    os_log_t v30 = *v8;
    BOOL v31 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
    v32 = v129;
    if (v31)
    {
      v33 = v30;
      v34 = [(SiriSharedUISmartDialogView *)v129 speech];
      v35 = [v34 userUtterance];
      v36 = [v35 bestTextInterpretation];
      *(_DWORD *)buf = 136315650;
      v142 = "-[SiriSharedUISAEViewState saeViewModelDidChange:withDiff:]";
      __int16 v143 = 2112;
      v144 = v129;
      __int16 v145 = 2112;
      v146 = v36;
      _os_log_impl(&dword_20C9D5000, v33, OS_LOG_TYPE_DEFAULT, "%s #sae Setting user utterance to : %@ text: %@", buf, 0x20u);
    }
    v37 = [(SiriSharedUISmartDialogView *)v129 latencySummary];

    v38 = [(SiriSharedUISAEViewState *)self delegate];
    BOOL v39 = 1;
    if (([v38 alwaysShowRecognizedSpeech] & 1) == 0 && !v37)
    {
      v40 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtterance speech];
      if (([v40 isFinal] & 1) == 0) {
        BOOL v39 = [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView revealRecognizedSpeech];
      }
    }
    if ((v128 & 2) != 0) {
      LOBYTE(v41) = 1;
    }
    else {
      int v41 = v128 | v39 & (v128 >> 2);
    }
    char v125 = v41;
    BOOL v42 = [(SiriSharedUISAEViewState *)self requireFinalSpeechHypothesisBeforeAppearance];
    v43 = [(SiriSharedUISmartDialogView *)v129 speech];
    v44 = [v43 userUtterance];

    if (v42)
    {
      v45 = [(SiriSharedUISmartDialogView *)v129 speech];
      int v46 = [v45 isFinal];
    }
    else
    {
      int v46 = 1;
    }
    if (v44) {
      int v47 = v46;
    }
    else {
      int v47 = 0;
    }
    v126 = self;
    v127 = v24;
    if ([(SiriSharedUISmartDialogView *)v130 count] && self->_isInAmbient)
    {
      v48 = v7;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      v49 = v130;
      uint64_t v50 = [(SiriSharedUISmartDialogView *)v49 countByEnumeratingWithState:&v135 objects:v140 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        char v52 = 0;
        uint64_t v53 = *(void *)v136;
        do
        {
          for (uint64_t i = 0; i != v51; ++i)
          {
            if (*(void *)v136 != v53) {
              objc_enumerationMutation(v49);
            }
            v55 = [*(id *)(*((void *)&v135 + 1) + 8 * i) dialogIdentifier];
            int v56 = [v55 isEqual:@"PlaybackControls#SilenceInterstitials"];

            if (v56) {
              char v52 = 1;
            }
          }
          uint64_t v51 = [(SiriSharedUISmartDialogView *)v49 countByEnumeratingWithState:&v135 objects:v140 count:16];
        }
        while (v51);
      }
      else
      {
        char v52 = 0;
      }

      int v57 = v52 & 1;
      uint64_t v7 = v48;
      self = v126;
      v24 = v127;
      v32 = v129;
    }
    else
    {
      int v57 = 0;
    }
    if ([(SiriSharedUISmartDialogView *)v24 count]) {
      goto LABEL_49;
    }
    uint64_t v58 = [(SiriSharedUISmartDialogView *)v130 count];
    int v59 = v57 ^ 1;
    if (!v58) {
      int v59 = 0;
    }
    if ((v59 | v47) == 1)
    {
LABEL_49:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained didPresentContent];
    }
    if (!self->_activeSmartDialogView)
    {
      id v61 = objc_loadWeakRetained((id *)&self->_delegate);
      v62 = [v61 createNewSmartDialog];
      activeSmartDialogView = self->_activeSmartDialogView;
      self->_activeSmartDialogView = v62;

      self->_upcomingResultHasSnippet = 0;
    }
    v64 = [(SiriSharedUISmartDialogView *)v32 speech];
    if (v64)
    {
      v65 = [(SiriSharedUISmartDialogView *)v32 speech];
      int v66 = [v65 isFinal] ^ 1;
    }
    else
    {
      int v66 = 0;
    }

    v67 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtterance speech];
    v68 = [v67 userUtterance];
    v69 = [v68 bestTextInterpretation];

    v70 = [(SiriSharedUISmartDialogView *)v32 speech];
    v71 = [v70 userUtterance];
    uint64_t v72 = [v71 bestTextInterpretation];

    int v73 = 0;
    if (v69 && v72)
    {
      v74 = [(SiriSharedUISmartDialogView *)v32 speech];
      if ([v74 isFinal]) {
        int v73 = [v69 isEqual:v72] ^ 1;
      }
      else {
        int v73 = 0;
      }
    }
    v123 = (void *)v72;
    v124 = v69;
    if (v69) {
      BOOL v75 = 1;
    }
    else {
      BOOL v75 = v72 == 0;
    }
    int v76 = !v75;
    if ([(SiriSharedUISmartDialogView *)v127 count])
    {
      BOOL v77 = 0;
    }
    else
    {
      v78 = [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView conversationSnippetViews];
      BOOL v77 = [v78 count] != 0;
    }
    if ([(SiriSharedUISmartDialogView *)self->_activeSmartDialogView hasResult])
    {
      int v79 = [(SiriSharedUISmartDialogView *)v129 shouldShow];
      if ((v128 & 1) != 0 || v79 | v66 | v73 | v77 | v76)
      {
        [(NSMutableArray *)self->_finalAndDisplayedSmartDialogs addObject:self->_activeSmartDialogView];
        [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView setIsActive:0];
        BOOL v80 = [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView revealRecognizedSpeech];
        id v81 = objc_loadWeakRetained((id *)&self->_delegate);
        v82 = [v81 createNewSmartDialog];
        v83 = self->_activeSmartDialogView;
        self->_activeSmartDialogView = v82;

        [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView setRevealRecognizedSpeech:v80];
        v84 = (NSArray *)[(NSArray *)self->_activeConversationTranscriptItems copy];
        previousConversationTranscriptItems = self->_previousConversationTranscriptItems;
        self->_previousConversationTranscriptItems = v84;

        self->_upcomingResultHasSnippet = 0;
        v86 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          v87 = self->_activeSmartDialogView;
          *(_DWORD *)buf = 136315394;
          v142 = "-[SiriSharedUISAEViewState saeViewModelDidChange:withDiff:]";
          __int16 v143 = 2112;
          v144 = v87;
          _os_log_impl(&dword_20C9D5000, v86, OS_LOG_TYPE_DEFAULT, "%s #droplet set new activeSmartDialog to %@", buf, 0x16u);
        }
      }
    }
    [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView setIsInAmbient:self->_isInAmbient];
    [(SiriSharedUISAEViewState *)self _setSmartDialogUserUtterance:v129];
    if ((v128 & 0x10) != 0)
    {
      id v88 = objc_loadWeakRetained((id *)&self->_delegate);
      char v89 = objc_opt_respondsToSelector();

      if (v89)
      {
        id v90 = objc_loadWeakRetained((id *)&self->_delegate);
        [v90 speechRecognitionHypothesisUpdated];
      }
    }
    id v22 = v127;
    char v91 = v128;
    if ((v128 & 1) == 0)
    {
      BOOL v98 = 0;
      v99 = (os_log_t *)MEMORY[0x263F28348];
      if ((v128 & 2) == 0) {
        goto LABEL_111;
      }
      goto LABEL_110;
    }
    id v92 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v93 = [v92 filterTranscriptItemsForSAEDialogBoxContent:v127];

    uint64_t v94 = v93;
    uint64_t v95 = +[SiriSharedUIUtilities filterTranscriptItemsForRFPluginContent:v127];
    v96 = self;
    v97 = (void *)v95;
    BOOL v98 = v95 != 0;
    v99 = (os_log_t *)MEMORY[0x263F28348];
    if (v94 | v95)
    {
      v96->_hasSmartDialogSnippet = 1;
      v122 = (void *)v94;
      if (v94 && v95)
      {
        v100 = *v99;
        if (os_log_type_enabled(*v99, OS_LOG_TYPE_ERROR)) {
          -[SiriSharedUISAEViewState saeViewModelDidChange:withDiff:](v100);
        }
        goto LABEL_89;
      }
      if (v94)
      {
LABEL_89:
        [(SiriSharedUISAEViewState *)v126 _setActiveConversationTranscriptItems:v127];
        uint64_t v94 = (uint64_t)v122;
        [(SiriSharedUISAEViewState *)v126 _setSmartDialogCard:v122];
        goto LABEL_109;
      }
      v101 = v126;
      if (v97)
      {
        BOOL v120 = v98;
        v121 = v7;
        v106 = [MEMORY[0x263EFF980] array];
        long long v131 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        v107 = v127;
        uint64_t v108 = [(SiriSharedUISmartDialogView *)v107 countByEnumeratingWithState:&v131 objects:v139 count:16];
        if (v108)
        {
          uint64_t v109 = v108;
          uint64_t v110 = *(void *)v132;
          do
          {
            for (uint64_t j = 0; j != v109; ++j)
            {
              if (*(void *)v132 != v110) {
                objc_enumerationMutation(v107);
              }
              v112 = *(void **)(*((void *)&v131 + 1) + 8 * j);
              v113 = [v112 aceObject];
              v114 = [v113 aceId];
              v115 = [v97 aceId];

              if (v114 != v115) {
                [v106 addObject:v112];
              }
            }
            uint64_t v109 = [(SiriSharedUISmartDialogView *)v107 countByEnumeratingWithState:&v131 objects:v139 count:16];
          }
          while (v109);
        }

        [(SiriSharedUISAEViewState *)v126 _setActiveConversationTranscriptItems:v106];
        [(SiriSharedUISAEViewState *)v126 _setSmartDialogPlugin:v97];

        uint64_t v7 = v121;
        uint64_t v94 = (uint64_t)v122;
        v99 = (os_log_t *)MEMORY[0x263F28348];
        id v22 = v127;
        char v91 = v128;
        BOOL v98 = v120;
LABEL_109:

        self = v126;
        if ((v91 & 2) == 0)
        {
LABEL_111:
          if ([(SiriSharedUISmartDialogView *)v130 count]) {
            int v118 = 1;
          }
          else {
            int v118 = v98;
          }
          if (v118 == 1) {
            [(SiriSharedUISAEViewState *)self _setIsPresentedWithSmartDialogText];
          }
          v119 = *v99;
          if (os_log_type_enabled(*v99, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v142 = "-[SiriSharedUISAEViewState saeViewModelDidChange:withDiff:]";
            _os_log_impl(&dword_20C9D5000, v119, OS_LOG_TYPE_DEFAULT, "%s #sae Applying updates", buf, 0xCu);
          }
          if (v125) {
            [(SiriSharedUISAEViewState *)self _smartDialogContentDidChange];
          }

          goto LABEL_121;
        }
LABEL_110:
        [(SiriSharedUISAEViewState *)self _setSmartDialogServerUtterances:v130];
        goto LABEL_111;
      }
    }
    else if ([(SiriSharedUISmartDialogView *)v130 count])
    {
      v101 = v126;
      v126->_hasSmartDialogSnippet = 1;
    }
    else
    {
      uint64_t v102 = v94;
      BOOL v103 = v98;
      v104 = [(SiriSharedUISAEViewState *)v126 activeSmartDialogView];
      v105 = [v104 serverUtterances];
      if ([v105 count])
      {
        v126->_hasSmartDialogSnippet = 1;
      }
      else
      {
        v116 = [(SiriSharedUISAEViewState *)v126 delegate];
        if ([v116 alwaysShowRecognizedSpeech]) {
          char v117 = 1;
        }
        else {
          char v117 = [(SiriSharedUISmartDialogView *)v126->_activeSmartDialogView revealRecognizedSpeech];
        }
        v126->_hasSmartDialogSnippet = v117;

        char v91 = v128;
      }

      v101 = v126;
      id v22 = v127;
      BOOL v98 = v103;
      uint64_t v94 = v102;
    }
    [(SiriSharedUISAEViewState *)v101 _setActiveConversationTranscriptItems:v22];
    goto LABEL_109;
  }
  int64_t v9 = [(SiriSharedUISAEViewState *)self inputType];
  uint64_t v10 = [v7 inputType];
  os_log_t v11 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    SiriSharedUIViewModelInputTypeGetDescription(v10);
    v13 = v8;
    v14 = (SiriSharedUISmartDialogView *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v142 = "-[SiriSharedUISAEViewState saeViewModelDidChange:withDiff:]";
    __int16 v143 = 2112;
    v144 = v14;
    _os_log_impl(&dword_20C9D5000, v12, OS_LOG_TYPE_DEFAULT, "%s #sae Setting input type to : %@", buf, 0x16u);

    v8 = v13;
  }
  [(SiriSharedUISAEViewState *)self setInputType:v10];
  id v15 = objc_loadWeakRetained((id *)&self->_delegate);
  [v15 didSetInputType:v10];

  if (v9 == 1 && v10 == 2)
  {
    os_log_t v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      SiriSharedUIViewModelInputTypeGetDescription(1);
      v18 = (SiriSharedUISmartDialogView *)objc_claimAutoreleasedReturnValue();
      v19 = SiriSharedUIViewModelInputTypeGetDescription(2);
      *(_DWORD *)buf = 136315650;
      v142 = "-[SiriSharedUISAEViewState saeViewModelDidChange:withDiff:]";
      __int16 v143 = 2112;
      v144 = v18;
      __int16 v145 = 2112;
      v146 = v19;
      _os_log_impl(&dword_20C9D5000, v17, OS_LOG_TYPE_DEFAULT, "%s #sae Switched input type from : %@ to : %@", buf, 0x20u);
    }
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 didSetInputTypeFromTextToVoice];
LABEL_121:
    }
  }
}

- (void)_smartDialogContentDidChange
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL animatingInActiveSmartDialogView = self->_animatingInActiveSmartDialogView;
  id v4 = *MEMORY[0x263F28348];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (animatingInActiveSmartDialogView)
  {
    if (v5)
    {
      int v7 = 136315138;
      v8 = "-[SiriSharedUISAEViewState _smartDialogContentDidChange]";
      _os_log_impl(&dword_20C9D5000, v4, OS_LOG_TYPE_DEFAULT, "%s #sae: smartDialog animation in progress, do not animate result", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v7 = 136315138;
      v8 = "-[SiriSharedUISAEViewState _smartDialogContentDidChange]";
      _os_log_impl(&dword_20C9D5000, v4, OS_LOG_TYPE_DEFAULT, "%s #sae: presenting result", (uint8_t *)&v7, 0xCu);
    }
    [(SiriSharedUISAEViewState *)self _presentOrTransitionActiveSmartDialogView];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained smartDialogContentDidChange];
}

- (void)_presentOrTransitionActiveSmartDialogView
{
  v3 = [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView userUtteranceViewModel];
  if ([v3 shouldShow])
  {
  }
  else
  {
    BOOL v4 = [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView ongoingASR];

    if (!v4) {
      goto LABEL_5;
    }
  }
  if (self->_activeSmartDialogIsLatencyPill)
  {
LABEL_5:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v6 = [WeakRetained hasPendingUpdates];

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 willPresentResult];

      [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView transitionToExpandablePlatterStyle:4];
      [(SiriSharedUISAEViewState *)self _presentResult];
    }
    return;
  }
  [(SiriSharedUISAEViewState *)self _presentPillOrCollapseResult];
}

- (void)_presentResult
{
}

- (void)_presentPillOrCollapseResult
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (![(NSArray *)self->_previousConversationTranscriptItems count]) {
    goto LABEL_6;
  }
  v3 = [(NSArray *)self->_previousConversationTranscriptItems firstObject];
  BOOL v4 = [v3 taskIdentifier];
  id v19 = [v4 UUIDString];

  BOOL v5 = [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView userUtteranceViewModel];
  int v6 = [v5 taskIdentifier];

  if (!v6 || ([v19 isEqual:v6] & 1) == 0)
  {

LABEL_6:
    id v7 = [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView superview];
    if (v7) {
      goto LABEL_7;
    }
    int currentViewState = self->_currentViewState;
    if (currentViewState == 2) {
      return;
    }
    if (currentViewState == 1) {
      goto LABEL_7;
    }
    self->_upcomingResultHasSnippet = 0;
    uint64_t v9 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtterance speech];
    if (v9)
    {
    }
    else
    {
      uint64_t v10 = [(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtterance latencySummary];

      if (!v10)
      {
        v17 = *MEMORY[0x263F28348];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        *(_DWORD *)buf = 136315138;
        char v21 = "-[SiriSharedUISAEViewState _presentPillOrCollapseResult]";
        v18 = "%s #droplet not presenting pill because we do not have ASR or latency text";
        goto LABEL_32;
      }
    }
    if (self->_inputType != 1
      || ([(SiriSharedUISAEUserUtteranceViewModel *)self->_userUtterance latencySummary],
          os_log_t v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      v12 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        char v21 = "-[SiriSharedUISAEViewState _presentPillOrCollapseResult]";
        _os_log_impl(&dword_20C9D5000, v12, OS_LOG_TYPE_DEFAULT, "%s #droplet presenting latency pill", buf, 0xCu);
      }
      if (self->_currentViewState == 3) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 1;
      }
      [(SiriSharedUISAEViewState *)self _setState:v13];
      v14 = [(SiriSharedUISAEViewState *)self delegate];
      if (([v14 alwaysShowRecognizedSpeech] & 1) != 0
        || [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView revealRecognizedSpeech])
      {
        id v15 = [(SiriSharedUISmartDialogView *)self->_activeSmartDialogView userUtteranceViewModel];
        int v16 = [v15 shouldShow];

        if (!v16) {
          return;
        }
      }
      else
      {
      }
      [(SiriSharedUISystemAssistantExperienceContainerView *)self->_containerView startLatencyLightOnActivePill];
      return;
    }
    v17 = *MEMORY[0x263F28348];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    char v21 = "-[SiriSharedUISAEViewState _presentPillOrCollapseResult]";
    v18 = "%s #droplet not presenting pill because we're in type to Siri and there is no latency summary";
LABEL_32:
    _os_log_impl(&dword_20C9D5000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
    return;
  }
  self->_upcomingResultHasSnippet = 0;
  [(SiriSharedUISAEViewState *)self _setState:1];

  id v7 = v19;
LABEL_7:
}

- (void)_setState:(int)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_int currentViewState = &self->_currentViewState;
  int currentViewState = self->_currentViewState;
  if (a3 == 3 || currentViewState != a3)
  {
    self->_previousViewState = currentViewState;
    self->_int currentViewState = a3;
    p_previousViewState = &self->_previousViewState;
    id v7 = (os_log_t *)MEMORY[0x263F28348];
    v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *p_previousViewState;
      int v10 = *p_currentViewState;
      int v21 = 136315650;
      uint64_t v22 = "-[SiriSharedUISAEViewState _setState:]";
      __int16 v23 = 1024;
      BOOL v24 = v9;
      __int16 v25 = 1024;
      int v26 = v10;
      _os_log_impl(&dword_20C9D5000, v8, OS_LOG_TYPE_DEFAULT, "%s #viewState: transiting state from %d to %d", (uint8_t *)&v21, 0x18u);
    }
    switch(*p_previousViewState)
    {
      case 0:
        if (*p_currentViewState == 1) {
          goto LABEL_20;
        }
        if (*p_currentViewState == 3) {
          goto LABEL_25;
        }
        goto LABEL_23;
      case 1:
        if (*p_currentViewState != 3) {
          goto LABEL_23;
        }
        os_log_t v11 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 136315138;
          uint64_t v22 = "-[SiriSharedUISAEViewState _setState:]";
          _os_log_impl(&dword_20C9D5000, v11, OS_LOG_TYPE_DEFAULT, "%s #viewState: performSinglePillExpandAnimation", (uint8_t *)&v21, 0xCu);
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained performSinglePillExpandAnimation];
        goto LABEL_31;
      case 2:
        if (*p_currentViewState != 3) {
          goto LABEL_23;
        }
        uint64_t v13 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 136315138;
          uint64_t v22 = "-[SiriSharedUISAEViewState _setState:]";
          _os_log_impl(&dword_20C9D5000, v13, OS_LOG_TYPE_DEFAULT, "%s #viewState: performPillMergeAndCrossfadeAnimation", (uint8_t *)&v21, 0xCu);
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained performPillMergeAndCrossfadeAnimation];
        goto LABEL_31;
      case 3:
        int v14 = *p_currentViewState;
        if (*p_currentViewState == 1)
        {
          id v20 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = 136315138;
            uint64_t v22 = "-[SiriSharedUISAEViewState _setState:]";
            _os_log_impl(&dword_20C9D5000, v20, OS_LOG_TYPE_DEFAULT, "%s #viewState: performPillCollapseAnimation", (uint8_t *)&v21, 0xCu);
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained performPillCollapseAnimation];
          goto LABEL_31;
        }
        if (v14 == 3)
        {
LABEL_25:
          v17 = [(SiriSharedUISAEViewState *)self containerView];
          v18 = [v17 resultContentView];

          id v19 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = 136315394;
            uint64_t v22 = "-[SiriSharedUISAEViewState _setState:]";
            __int16 v23 = 1024;
            BOOL v24 = v18 == 0;
            _os_log_impl(&dword_20C9D5000, v19, OS_LOG_TYPE_DEFAULT, "%s #viewState: presentResultAnimation(isFirstSnippet: %i)", (uint8_t *)&v21, 0x12u);
          }
          id WeakRetained = [(SiriSharedUISAEViewState *)self delegate];
          [WeakRetained presentResultAnimation:v18 == 0];
LABEL_31:

          return;
        }
        if (v14 == 2)
        {
LABEL_20:
          id v15 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = 136315138;
            uint64_t v22 = "-[SiriSharedUISAEViewState _setState:]";
            _os_log_impl(&dword_20C9D5000, v15, OS_LOG_TYPE_DEFAULT, "%s #viewState: presentLatencyPillAnimation", (uint8_t *)&v21, 0xCu);
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained presentLatencyPillAnimation];
          goto LABEL_31;
        }
LABEL_23:
        int v16 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
          [(SiriSharedUISAEViewState *)p_previousViewState _setState:v16];
        }
        break;
      default:
        goto LABEL_23;
    }
  }
}

- (BOOL)requireFinalSpeechHypothesisBeforeAppearance
{
  return !self->_isInAmbient;
}

- (void)_setIsPresentedWithSmartDialogText
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(SiriSharedUISAEViewState *)self activeConversationTranscriptItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) viewController];
        if (objc_opt_respondsToSelector()) {
          [v7 setIsPresentedWithSmartDialogText:1];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setSmartDialogAnimationInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SiriSharedUISAEViewState setSmartDialogAnimationInProgress:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_20C9D5000, v5, OS_LOG_TYPE_DEFAULT, "%s #sae: _BOOL animatingInActiveSmartDialogView = %d", (uint8_t *)&v6, 0x12u);
  }
  self->_BOOL animatingInActiveSmartDialogView = v3;
}

- (BOOL)activeSmartDialogIsLatencyPill
{
  return (self->_currentViewState - 1) < 2;
}

- (void)_setSmartDialogServerUtterances:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSArray *)[v4 copy];
  serverUtterances = self->_serverUtterances;
  self->_serverUtterances = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didSetServerUtterance:v4];
}

- (void)_setActiveConversationTranscriptItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSArray *)self->_activeConversationTranscriptItems isEqualToArray:v4]
    || !+[SiriSharedUIUtilities contentDiffersBetweenItems:v4 andItems:self->_activeConversationTranscriptItems])
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[SiriSharedUISAEViewState _setActiveConversationTranscriptItems:]";
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_20C9D5000, v5, OS_LOG_TYPE_DEFAULT, "%s #sae: Conversation Transcript has the same content, not updating our compact view for items: %@", buf, 0x16u);
    }
  }
  int v6 = (NSArray *)[v4 copy];
  activeConversationTranscriptItems = self->_activeConversationTranscriptItems;
  self->_activeConversationTranscriptItems = v6;

  if ([(NSArray *)self->_activeConversationTranscriptItems count])
  {
    __int16 v8 = (NSArray *)[(NSArray *)self->_activeConversationTranscriptItems copy];
    storedConversationTranscriptItems = self->_storedConversationTranscriptItems;
    self->_storedConversationTranscriptItems = v8;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_activeTranscriptItems;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "isHintItem", (void)v16) & 1) == 0) {
          self->_upcomingResultHasSnippet = 1;
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didSetTranscriptItems];
}

- (void)_setSmartDialogCard:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__SiriSharedUISAEViewState__setSmartDialogCard___block_invoke;
    v6[3] = &unk_2640E3698;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [WeakRetained setSmartDialogCardBlock:v6];

    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&location);
}

void __48__SiriSharedUISAEViewState__setSmartDialogCard___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained activeSmartDialogView];
  [v2 setSmartDialogCard:*(void *)(a1 + 32)];
}

- (void)_setSmartDialogPlugin:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__SiriSharedUISAEViewState__setSmartDialogPlugin___block_invoke;
    v6[3] = &unk_2640E3698;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [WeakRetained setSmartDialogPluginBlock:v6];

    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&location);
}

void __50__SiriSharedUISAEViewState__setSmartDialogPlugin___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained activeSmartDialogView];
  [v2 setSmartDialogPlugin:*(void *)(a1 + 32)];
}

- (void)_setSmartDialogUserUtterance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [SiriSharedUISAEUserUtteranceViewModel alloc];
  int v6 = [v4 speech];
  id v7 = (void *)[v6 copy];
  id v8 = [v4 latencySummary];
  uint64_t v9 = [v4 shouldShow];
  uint64_t v10 = [v4 taskIdentifier];

  uint64_t v11 = [(SiriSharedUISAEUserUtteranceViewModel *)v5 initWithSpeech:v7 latencySummary:v8 shouldShow:v9 taskIdentifier:v10];
  userUtterance = self->_userUtterance;
  self->_userUtterance = v11;

  activeSmartDialogView = self->_activeSmartDialogView;
  uint64_t v14 = self->_userUtterance;
  [(SiriSharedUISmartDialogView *)activeSmartDialogView setUserUtteranceViewModel:v14];
}

- (void)removeResponseElements:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      int currentViewState = self->_currentViewState;
      if (currentViewState == 3)
      {
        *(void *)&self->_previousViewState = 3;
        goto LABEL_13;
      }
      if (currentViewState != 2) {
        return;
      }
      uint64_t v5 = 0x100000002;
LABEL_16:
      *(void *)&self->_previousViewState = v5;
      return;
    case 1uLL:
      int v6 = self->_currentViewState;
      if (v6 == 2)
      {
        uint64_t v5 = 0x300000002;
      }
      else
      {
        if (v6 != 1) {
          return;
        }
        uint64_t v5 = 1;
      }
      goto LABEL_16;
    case 0xFFFFFFFFFFFFFFFFLL:
      int v3 = self->_currentViewState;
      if ((v3 - 1) <= 2)
      {
        self->_previousViewState = v3;
        self->_int currentViewState = 0;
LABEL_13:
        self->_BOOL animatingInActiveSmartDialogView = 0;
      }
      break;
  }
}

- (SiriSharedUISAEViewStateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUISAEViewStateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (void)setIsInAmbient:(BOOL)a3
{
  self->_isInAmbient = a3;
}

- (SiriSharedUISmartDialogView)activeSmartDialogView
{
  return self->_activeSmartDialogView;
}

- (void)setActiveSmartDialogView:(id)a3
{
}

- (NSMutableArray)finalAndDisplayedSmartDialogs
{
  return self->_finalAndDisplayedSmartDialogs;
}

- (BOOL)upcomingResultHasSnippet
{
  return self->_upcomingResultHasSnippet;
}

- (BOOL)hasSmartDialogSnippet
{
  return self->_hasSmartDialogSnippet;
}

- (void)setHasSmartDialogSnippet:(BOOL)a3
{
  self->_hasSmartDialogSnippet = a3;
}

- (NSArray)storedConversationTranscriptItems
{
  return self->_storedConversationTranscriptItems;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (NSArray)activeConversationTranscriptItems
{
  return self->_activeConversationTranscriptItems;
}

- (NSArray)serverUtterances
{
  return self->_serverUtterances;
}

- (SiriSharedUISAEUserUtteranceViewModel)userUtterance
{
  return self->_userUtterance;
}

- (NSArray)_activeTranscriptItems
{
  return self->_activeTranscriptItems;
}

- (void)_setActiveTranscriptItems:(id)a3
{
}

- (NSArray)previousConversationTranscriptItems
{
  return self->_previousConversationTranscriptItems;
}

- (void)setPreviousConversationTranscriptItems:(id)a3
{
}

- (SiriSharedUISystemAssistantExperienceContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_previousConversationTranscriptItems, 0);
  objc_storeStrong((id *)&self->_activeTranscriptItems, 0);
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_activeConversationTranscriptItems, 0);
  objc_storeStrong((id *)&self->_storedConversationTranscriptItems, 0);
  objc_storeStrong((id *)&self->_finalAndDisplayedSmartDialogs, 0);
  objc_storeStrong((id *)&self->_activeSmartDialogView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)saeViewModelDidChange:(os_log_t)log withDiff:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SiriSharedUISAEViewState saeViewModelDidChange:withDiff:]";
  _os_log_error_impl(&dword_20C9D5000, log, OS_LOG_TYPE_ERROR, "%s We have been sent both plugin AND a smart dialog card. This should never happen", (uint8_t *)&v1, 0xCu);
}

- (void)_setState:(os_log_t)log .cold.1(int *a1, int *a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  int v4 = *a2;
  int v5 = 136315650;
  int v6 = "-[SiriSharedUISAEViewState _setState:]";
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl(&dword_20C9D5000, log, OS_LOG_TYPE_ERROR, "%s #viewState: error transition from %d to %d", (uint8_t *)&v5, 0x18u);
}

@end