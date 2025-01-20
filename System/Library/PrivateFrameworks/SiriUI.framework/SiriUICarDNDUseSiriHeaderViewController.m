@interface SiriUICarDNDUseSiriHeaderViewController
+ (BOOL)shouldShowCarDNDUseSiriHeaderViewController;
- (BOOL)_canShowWhileLocked;
- (NSString)_localizedSubtitle;
- (NSString)_localizedTitle;
- (SiriUICarDNDContextProvider)_contextProvider;
- (SiriUICarDNDDelegate)delegate;
- (UIImageView)_siriOrbImageView;
- (UILabel)_subtitleLabel;
- (UILabel)_titleLabel;
- (id)_hintContext;
- (void)_addContextProvider;
- (void)_removeContextProvider;
- (void)_sendCardAppearedAnalyticsEvent;
- (void)_setContextProvider:(id)a3;
- (void)_setLocalizedSubtitle:(id)a3;
- (void)_setLocalizedTitle:(id)a3;
- (void)_setSiriOrbImageView:(id)a3;
- (void)_setSubtitleLabel:(id)a3;
- (void)_setTitleLabel:(id)a3;
- (void)_setupImageView;
- (void)_setupSubtitleLabel;
- (void)_setupTitleAndSubtitleConstraints;
- (void)_setupTitleLabel;
- (void)_setupView;
- (void)contextProvided:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SiriUICarDNDUseSiriHeaderViewController

+ (BOOL)shouldShowCarDNDUseSiriHeaderViewController
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = +[SiriUIPreferences sharedPreferences];
  if ([v2 voiceRequestMadeWhileInCarDND])
  {
    v3 = *MEMORY[0x263F28348];
    BOOL v4 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[SiriUICarDNDUseSiriHeaderViewController shouldShowCarDNDUseSiriHeaderViewController]";
      v5 = "%s Not showing SiriUICarDNDUseSiriHeaderViewController. User has tried Hey Siri in CarDND mode";
LABEL_13:
      _os_log_impl(&dword_2231EF000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&buf, 0xCu);
      BOOL v4 = 0;
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ([v2 numberOfTimesCarDNDSiriCardShown] < 10)
  {
    v6 = [MEMORY[0x263F285A0] sharedPreferences];
    if ([v6 assistantIsEnabled])
    {
      v7 = [MEMORY[0x263F285A0] sharedPreferences];
      if (![v7 disableAssistantWhilePasscodeLocked])
      {
        char v9 = AFAssistantRestricted();

        if ((v9 & 1) == 0)
        {
          uint64_t v16 = 0;
          v17 = &v16;
          uint64_t v18 = 0x2050000000;
          v10 = (void *)getSASSystemStateClass_softClass;
          uint64_t v19 = getSASSystemStateClass_softClass;
          if (!getSASSystemStateClass_softClass)
          {
            *(void *)&long long buf = MEMORY[0x263EF8330];
            *((void *)&buf + 1) = 3221225472;
            v21 = __getSASSystemStateClass_block_invoke;
            v22 = &unk_26469F170;
            v23 = &v16;
            __getSASSystemStateClass_block_invoke((uint64_t)&buf);
            v10 = (void *)v17[3];
          }
          id v11 = v10;
          _Block_object_dispose(&v16, 8);
          v12 = objc_msgSend(v11, "sharedSystemState", v16);
          int v13 = [v12 isConnectedToCarPlay];

          if (v13)
          {
            v3 = *MEMORY[0x263F28348];
            BOOL v4 = 0;
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "+[SiriUICarDNDUseSiriHeaderViewController shouldShowCarDNDUseSiriHeaderViewController]";
            v5 = "%s Not showing SiriUICarDNDUseSiriHeaderViewController. CarPlay Session is connected";
          }
          else
          {
            v14 = (void *)CFPreferencesCopyAppValue(@"VoiceTrigger Enabled", @"com.apple.voicetrigger");
            int v15 = [v14 BOOLValue];

            if (v15)
            {
              BOOL v4 = 1;
              goto LABEL_14;
            }
            v3 = *MEMORY[0x263F28348];
            BOOL v4 = 0;
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "+[SiriUICarDNDUseSiriHeaderViewController shouldShowCarDNDUseSiriHeaderViewController]";
            v5 = "%s Not showing SiriUICarDNDUseSiriHeaderViewController. Voice Trigger not enabled";
          }
          goto LABEL_13;
        }
LABEL_11:
        v3 = *MEMORY[0x263F28348];
        BOOL v4 = 0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "+[SiriUICarDNDUseSiriHeaderViewController shouldShowCarDNDUseSiriHeaderViewController]";
          v5 = "%s Not showing SiriUICarDNDUseSiriHeaderViewController. Siri not supported on lock screen";
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
    goto LABEL_11;
  }
  v3 = *MEMORY[0x263F28348];
  BOOL v4 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[SiriUICarDNDUseSiriHeaderViewController shouldShowCarDNDUseSiriHeaderViewController]";
    v5 = "%s Not showing SiriUICarDNDUseSiriHeaderViewController. Reached max appearances";
    goto LABEL_13;
  }
LABEL_14:

  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUICarDNDUseSiriHeaderViewController;
  [(SiriUICarDNDUseSiriHeaderViewController *)&v3 viewDidLoad];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _setupView];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _setupImageView];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _setupTitleLabel];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _setupSubtitleLabel];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _setupTitleAndSubtitleConstraints];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUICarDNDUseSiriHeaderViewController;
  [(SiriUICarDNDUseSiriHeaderViewController *)&v5 viewDidAppear:a3];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _addContextProvider];
  BOOL v4 = dispatch_get_global_queue(0, 0);
  dispatch_async(v4, &__block_literal_global_5);

  [(SiriUICarDNDUseSiriHeaderViewController *)self _sendCardAppearedAnalyticsEvent];
}

void __57__SiriUICarDNDUseSiriHeaderViewController_viewDidAppear___block_invoke()
{
  id v0 = +[SiriUIPreferences sharedPreferences];
  objc_msgSend(v0, "setNumberOfTimesCarDNDSiriCardShown:", objc_msgSend(v0, "numberOfTimesCarDNDSiriCardShown") + 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUICarDNDUseSiriHeaderViewController;
  [(SiriUICarDNDUseSiriHeaderViewController *)&v4 viewDidDisappear:a3];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _removeContextProvider];
}

- (void)_setupView
{
  objc_super v3 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  objc_super v4 = [MEMORY[0x263F1C550] clearColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x263F1CB98]);
  v6 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  [v6 frame];
  id v9 = (id)objc_msgSend(v5, "initWithFrame:");

  v7 = [MEMORY[0x263F1C480] effectWithStyle:1203];
  [v9 setEffect:v7];

  [v9 _setOverrideUserInterfaceStyle:2];
  v8 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  [v8 addSubview:v9];
}

- (void)_setupImageView
{
  v24[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  objc_super v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/Assistant/SiriUIAssets/SiriUIAssets.bundle"];
  id v5 = [MEMORY[0x263F1C6B0] imageNamed:@"SiriOrb-CarDND" inBundle:v4 compatibleWithTraitCollection:0];
  [v3 setImage:v5];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _setSiriOrbImageView:v3];
  v6 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v7 = [(SiriUICarDNDUseSiriHeaderViewController *)self _siriOrbImageView];
  [v6 addSubview:v7];

  v8 = [(SiriUICarDNDUseSiriHeaderViewController *)self _siriOrbImageView];
  id v9 = [v8 heightAnchor];
  v10 = [v9 constraintEqualToConstant:72.0];
  [v10 setActive:1];

  id v11 = [(SiriUICarDNDUseSiriHeaderViewController *)self _siriOrbImageView];
  v12 = [v11 widthAnchor];
  int v13 = [v12 constraintEqualToConstant:72.0];
  [v13 setActive:1];

  v14 = (void *)MEMORY[0x263F08938];
  int v15 = [(SiriUICarDNDUseSiriHeaderViewController *)self _siriOrbImageView];
  uint64_t v16 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v17 = [v14 constraintWithItem:v15 attribute:3 relatedBy:0 toItem:v16 attribute:3 multiplier:1.0 constant:44.0];

  uint64_t v18 = (void *)MEMORY[0x263F08938];
  uint64_t v19 = [(SiriUICarDNDUseSiriHeaderViewController *)self _siriOrbImageView];
  v20 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v21 = [v18 constraintWithItem:v19 attribute:9 relatedBy:0 toItem:v20 attribute:9 multiplier:1.0 constant:0.0];

  v22 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v24[0] = v17;
  v24[1] = v21;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  [v22 addConstraints:v23];
}

- (void)_setupTitleLabel
{
  id v3 = (void *)MEMORY[0x263F1C658];
  objc_super v4 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
  id v5 = [v4 fontDescriptor];
  v6 = [v5 fontDescriptorWithSymbolicTraits:2];
  id v13 = [v3 fontWithDescriptor:v6 size:34.0];

  v7 = [(SiriUICarDNDUseSiriHeaderViewController *)self _localizedTitle];
  id v8 = objc_alloc(MEMORY[0x263F1C768]);
  id v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v9 setTextAlignment:1];
  [v9 setFont:v13];
  [v9 setText:v7];
  [v9 setNumberOfLines:0];
  v10 = [MEMORY[0x263F1C550] whiteColor];
  [v9 setTextColor:v10];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _setTitleLabel:v9];
  id v11 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v12 = [(SiriUICarDNDUseSiriHeaderViewController *)self _titleLabel];
  [v11 addSubview:v12];
}

- (void)_setupSubtitleLabel
{
  id v3 = (void *)MEMORY[0x263F1C658];
  objc_super v4 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D308]];
  id v5 = [v4 fontDescriptor];
  id v12 = [v3 fontWithDescriptor:v5 size:22.0];

  v6 = [(SiriUICarDNDUseSiriHeaderViewController *)self _localizedSubtitle];
  id v7 = objc_alloc(MEMORY[0x263F1C768]);
  id v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v8 setTextAlignment:1];
  [v8 setFont:v12];
  [v8 setText:v6];
  [v8 setNumberOfLines:0];
  id v9 = [MEMORY[0x263F1C550] whiteColor];
  [v8 setTextColor:v9];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _setSubtitleLabel:v8];
  v10 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  id v11 = [(SiriUICarDNDUseSiriHeaderViewController *)self _subtitleLabel];
  [v10 addSubview:v11];
}

- (void)_setupTitleAndSubtitleConstraints
{
  v37[4] = *MEMORY[0x263EF8340];
  if (self->_localizedSubtitleDisplayedAboveTitle) {
    [(SiriUICarDNDUseSiriHeaderViewController *)self _subtitleLabel];
  }
  else {
  uint64_t v3 = [(SiriUICarDNDUseSiriHeaderViewController *)self _titleLabel];
  }
  if (self->_localizedSubtitleDisplayedAboveTitle) {
    [(SiriUICarDNDUseSiriHeaderViewController *)self _titleLabel];
  }
  else {
  objc_super v4 = [(SiriUICarDNDUseSiriHeaderViewController *)self _subtitleLabel];
  }
  id v5 = (void *)MEMORY[0x263F08938];
  v6 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v35 = [v5 constraintWithItem:v3 attribute:9 relatedBy:0 toItem:v6 attribute:9 multiplier:1.0 constant:0.0];

  id v7 = (void *)MEMORY[0x263F08938];
  [(SiriUICarDNDUseSiriHeaderViewController *)self _siriOrbImageView];
  id v9 = v8 = (void *)v3;
  v34 = [v7 constraintWithItem:v8 attribute:3 relatedBy:0 toItem:v9 attribute:4 multiplier:1.0 constant:24.0];

  v10 = (void *)MEMORY[0x263F08938];
  id v11 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v33 = [v10 constraintWithItem:v8 attribute:5 relatedBy:0 toItem:v11 attribute:5 multiplier:1.0 constant:28.0];

  id v12 = (void *)MEMORY[0x263F08938];
  id v13 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v32 = v8;
  v14 = [v12 constraintWithItem:v8 attribute:6 relatedBy:0 toItem:v13 attribute:6 multiplier:1.0 constant:-28.0];

  int v15 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v37[0] = v35;
  v37[1] = v34;
  v37[2] = v33;
  v37[3] = v14;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
  [v15 addConstraints:v16];

  v17 = (void *)MEMORY[0x263F08938];
  uint64_t v18 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  uint64_t v19 = [v17 constraintWithItem:v4 attribute:9 relatedBy:0 toItem:v18 attribute:9 multiplier:1.0 constant:0.0];

  v20 = [MEMORY[0x263F08938] constraintWithItem:v4 attribute:3 relatedBy:0 toItem:v8 attribute:4 multiplier:1.0 constant:4.0];
  v21 = (void *)MEMORY[0x263F08938];
  v22 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v23 = [v21 constraintWithItem:v4 attribute:4 relatedBy:0 toItem:v22 attribute:4 multiplier:1.0 constant:-40.0];

  uint64_t v24 = (void *)MEMORY[0x263F08938];
  v25 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v26 = [v24 constraintWithItem:v4 attribute:5 relatedBy:0 toItem:v25 attribute:5 multiplier:1.0 constant:28.0];

  v27 = (void *)MEMORY[0x263F08938];
  v28 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v29 = [v27 constraintWithItem:v4 attribute:6 relatedBy:0 toItem:v28 attribute:6 multiplier:1.0 constant:-28.0];

  v30 = [(SiriUICarDNDUseSiriHeaderViewController *)self view];
  v36[0] = v19;
  v36[1] = v20;
  v36[2] = v23;
  v36[3] = v26;
  v36[4] = v29;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:5];
  [v30 addConstraints:v31];
}

- (NSString)_localizedTitle
{
  localizedTitle = self->_localizedTitle;
  if (localizedTitle)
  {
    uint64_t v3 = localizedTitle;
  }
  else
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v6 = (void *)getVTPreferencesClass_softClass;
    uint64_t v18 = getVTPreferencesClass_softClass;
    if (!getVTPreferencesClass_softClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __getVTPreferencesClass_block_invoke;
      v14[3] = &unk_26469F170;
      v14[4] = &v15;
      __getVTPreferencesClass_block_invoke((uint64_t)v14);
      v6 = (void *)v16[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v15, 8);
    id v8 = [v7 sharedPreferences];
    id v9 = [MEMORY[0x263F285A0] sharedPreferences];
    v10 = [v9 languageCode];
    id v11 = [v8 localizedTriggerPhraseForLanguageCode:v10];

    id v12 = [v5 localizedStringForKey:@"CARDND_USE_SIRI_TITLE" value:@"Say “%@”" table:0];
    uint64_t v3 = [v12 stringByReplacingOccurrencesOfString:@"%@" withString:v11];

    [(SiriUICarDNDUseSiriHeaderViewController *)self _setLocalizedTitle:v3];
  }
  return v3;
}

- (NSString)_localizedSubtitle
{
  localizedSubtitle = self->_localizedSubtitle;
  if (localizedSubtitle)
  {
    uint64_t v3 = localizedSubtitle;
  }
  else
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v3 = [v5 localizedStringForKey:@"CARDND_USE_SIRI_SUBTITLE" value:0 table:0];
    v6 = [v5 localizedStringForKey:@"CARDND_USE_SIRI_TITLE_SUBTITLE_SWAP_ORDER" value:0 table:0];
    self->_localizedSubtitleDisplayedAboveTitle = [v6 isEqualToString:@"1"];

    [(SiriUICarDNDUseSiriHeaderViewController *)self _setLocalizedSubtitle:v3];
  }
  return v3;
}

- (void)_addContextProvider
{
  uint64_t v3 = [(SiriUICarDNDUseSiriHeaderViewController *)self _contextProvider];

  if (!v3)
  {
    objc_super v4 = objc_alloc_init(SiriUICarDNDContextProvider);
    [(SiriUICarDNDUseSiriHeaderViewController *)self _setContextProvider:v4];
  }
  id v9 = [(SiriUICarDNDUseSiriHeaderViewController *)self _hintContext];
  if (v9)
  {
    id v5 = [(SiriUICarDNDUseSiriHeaderViewController *)self _contextProvider];
    [v5 _setHintContext:v9];
  }
  v6 = [(SiriUICarDNDUseSiriHeaderViewController *)self _contextProvider];
  [v6 setDelegate:self];

  id v7 = [MEMORY[0x263F284A8] defaultContextManager];
  id v8 = [(SiriUICarDNDUseSiriHeaderViewController *)self _contextProvider];
  [v7 addContextProvider:v8];
}

- (id)_hintContext
{
  v2 = +[SiriUIPreferences sharedPreferences];
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  objc_super v4 = objc_msgSend(v3, "initWithObjects:", *MEMORY[0x263F65198], *MEMORY[0x263F651A0], *MEMORY[0x263F651B0], *MEMORY[0x263F651A8], 0);
  uint64_t v5 = [v2 integerForKey:@"carDNDSubtitleIndex"];
  v6 = [v4 objectAtIndexedSubscript:v5];
  [v2 setObject:v6 forKey:@"carDNDHintDomainKey"];
  objc_msgSend(v2, "setInteger:forKey:", (v5 + 1) % (unint64_t)objc_msgSend(v4, "count"), @"carDNDSubtitleIndex");
  id v7 = objc_alloc_init(MEMORY[0x263F64848]);
  [v7 setUtteranceDomainIdentifier:v6];

  return v7;
}

- (void)_removeContextProvider
{
  id v3 = [MEMORY[0x263F284A8] defaultContextManager];
  objc_super v4 = [(SiriUICarDNDUseSiriHeaderViewController *)self _contextProvider];
  [v3 removeContextProvider:v4];

  [(SiriUICarDNDUseSiriHeaderViewController *)self _setContextProvider:0];
}

- (void)_sendCardAppearedAnalyticsEvent
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "-[SiriUICarDNDUseSiriHeaderViewController _sendCardAppearedAnalyticsEvent]";
  __int16 v3 = 2112;
  objc_super v4 = @"com.apple.siri.carDNDUseSiriCardAppeared";
  _os_log_error_impl(&dword_2231EF000, log, OS_LOG_TYPE_ERROR, "%s CoreAnalytics eventName:%@ not sent. Event name must not be in current config", (uint8_t *)&v1, 0x16u);
}

void *__74__SiriUICarDNDUseSiriHeaderViewController__sendCardAppearedAnalyticsEvent__block_invoke()
{
  return &unk_26D658040;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)contextProvided:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controllerDidProvideContext:self];
}

- (SiriUICarDNDDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUICarDNDDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)_titleLabel
{
  return self->_titleLabel;
}

- (void)_setTitleLabel:(id)a3
{
}

- (UILabel)_subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)_setSubtitleLabel:(id)a3
{
}

- (void)_setLocalizedTitle:(id)a3
{
}

- (void)_setLocalizedSubtitle:(id)a3
{
}

- (UIImageView)_siriOrbImageView
{
  return self->_siriOrbImageView;
}

- (void)_setSiriOrbImageView:(id)a3
{
}

- (SiriUICarDNDContextProvider)_contextProvider
{
  return self->_contextProvider;
}

- (void)_setContextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextProvider, 0);
  objc_storeStrong((id *)&self->_siriOrbImageView, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end