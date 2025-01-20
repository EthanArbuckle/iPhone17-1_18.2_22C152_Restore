@interface SFBrowserMenuProvider
+ (SFBrowserMenuProvider)sharedProvider;
- (BOOL)alwaysAllowWebInterception;
- (BOOL)commandConflictsWithTextEditing:(id)a3;
- (SFBrowserMenuProvider)init;
- (SFWebExtensionsController)webExtensionsController;
- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 wantsPriorityOverSystemBehavior:(BOOL)a7 webInterceptable:(BOOL)a8 property:(unint64_t)a9 alternates:(id)a10;
- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 webInterceptable:(BOOL)a7;
- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 webInterceptable:(BOOL)a7 alternates:(id)a8;
- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 webInterceptable:(BOOL)a7 property:(unint64_t)a8 alternates:(id)a9;
- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 webInterceptable:(BOOL)a6 property:(unint64_t)a7;
- (id)_extensionsMenu;
- (id)_newDocumentCommands;
- (id)_placeholderCommandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6;
- (id)_switchToProfileCommands;
- (id)_switchToTabCommands;
- (void)_enabledExtensionsDidChange;
- (void)_setMenusForPersona:(int64_t)a3 withBuilder:(id)a4;
- (void)_setMenusIfNecessaryForPersona:(int64_t)a3;
- (void)clearCachedMenuForPersona:(int64_t)a3;
- (void)rebuildMenuIfNeededForPersona:(int64_t)a3;
- (void)setAlwaysAllowWebInterception:(BOOL)a3;
- (void)setMenusForSafariWithBuilder:(id)a3;
- (void)setMenusIfNecessaryForSafariViewServiceWithBuilder:(id)a3;
- (void)setWebExtensionsController:(id)a3;
@end

@implementation SFBrowserMenuProvider

- (void)setWebExtensionsController:(id)a3
{
}

+ (SFBrowserMenuProvider)sharedProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFBrowserMenuProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_once != -1) {
    dispatch_once(&sharedProvider_once, block);
  }
  v2 = (void *)sharedProvider_sharedProvider_0;

  return (SFBrowserMenuProvider *)v2;
}

void __39__SFBrowserMenuProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedProvider_sharedProvider_0;
  sharedProvider_sharedProvider_0 = (uint64_t)v1;
}

- (SFBrowserMenuProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFBrowserMenuProvider;
  v2 = [(SFBrowserMenuProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_persona = 0;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__enabledExtensionsDidChange name:*MEMORY[0x1E4F98568] object:0];
    [v4 addObserver:v3 selector:sel__enabledExtensionsDidChange name:*MEMORY[0x1E4F98570] object:0];
    [v4 addObserver:v3 selector:sel__enabledExtensionsDidChange name:*MEMORY[0x1E4F984D0] object:0];
    v5 = v3;
  }
  return v3;
}

- (void)setMenusForSafariWithBuilder:(id)a3
{
  id v4 = a3;
  [(SFBrowserMenuProvider *)self _setMenusIfNecessaryForPersona:0];
  [(SFBrowserMenuProvider *)self _setMenusForPersona:0 withBuilder:v4];
}

- (void)setMenusIfNecessaryForSafariViewServiceWithBuilder:(id)a3
{
  id v4 = a3;
  if ((self->_persona | 4) != 4)
  {
    id v5 = v4;
    -[SFBrowserMenuProvider _setMenusIfNecessaryForPersona:](self, "_setMenusIfNecessaryForPersona:");
    [(SFBrowserMenuProvider *)self _setMenusForPersona:self->_persona withBuilder:v5];
    id v4 = v5;
  }
}

- (void)rebuildMenuIfNeededForPersona:(int64_t)a3
{
  if (self->_persona != a3)
  {
    self->_persona = a3;
    id v3 = [MEMORY[0x1E4FB1998] mainSystem];
    [v3 setNeedsRebuild];
  }
}

- (void)clearCachedMenuForPersona:(int64_t)a3
{
  id v3 = &self->super.isa + a3;
  Class v4 = v3[1];
  v3[1] = 0;

  Class v5 = v3[5];
  v3[5] = 0;

  id v6 = [MEMORY[0x1E4FB1998] mainSystem];
  [v6 setNeedsRebuild];
}

- (void)_setMenusIfNecessaryForPersona:(int64_t)a3
{
  int64_t v3 = a3;
  v183[1] = *MEMORY[0x1E4F143B8];
  if (!self->_personaToMenusMap[a3] || !self->_personaToCommandSetMap[a3])
  {
    personaToMenusMap = self->_personaToMenusMap;
    Class v5 = [MEMORY[0x1E4F1CA80] set];
    v160 = _WBSLocalizedString();
    id v6 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v7 = 0x1E4F1C000;
    v164 = v5;
    v156 = v6;
    int64_t v159 = v3;
    if (!v3)
    {
      v8 = _WBSLocalizedString();
      v9 = (void *)MEMORY[0x1E4FB1640];
      v10 = _WBSLocalizedString();
      v11 = [v9 alternateWithTitle:v10 action:sel_newTabWithAlternativeOrderingKeyPressed modifierFlags:0x80000];
      v182 = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v182 count:1];
      v13 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_openNewTab_ input:@"T" modifierFlags:0x100000 discoverabilityTitle:v8 webInterceptable:0 alternates:v12];
      v183[0] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:1];
      [v6 addObjectsFromArray:v14];

      id v15 = [(SFBrowserMenuProvider *)self _newDocumentCommands];
      [v6 addObjectsFromArray:v15];

      v165 = _WBSLocalizedString();
      v161 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_newTabGroupKeyPressed input:@"N" modifierFlags:1310720 discoverabilityTitle:v165 webInterceptable:1];
      v181[0] = v161;
      v157 = _WBSLocalizedString();
      v153 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_focusAddressFieldKeyPressed input:@"L" modifierFlags:0x100000 discoverabilityTitle:v157 webInterceptable:0];
      v181[1] = v153;
      v16 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_focusAddressFieldKeyPressed input:@"F" modifierFlags:1572864 webInterceptable:0 property:1];
      v181[2] = v16;
      v17 = [(SFBrowserMenuProvider *)self _placeholderCommandWithAction:sel_emptySelectorForOpenInNewTabModifierLinkTap input:v160 modifierFlags:0x100000 discoverabilityTitle:&stru_1EDA07C28];
      v181[3] = v17;
      v18 = [(SFBrowserMenuProvider *)self _placeholderCommandWithAction:sel_emptySelectorForOpenInNewTabOppositePreferenceModifierLinkTap input:v160 modifierFlags:1179648 discoverabilityTitle:&stru_1EDA07C28];
      v181[4] = v18;
      v19 = _WBSLocalizedString();
      v20 = (void *)MEMORY[0x1E4FB1640];
      v21 = _WBSLocalizedString();
      v22 = [v20 alternateWithTitle:v21 action:sel_closeOtherTabsKeyPressed modifierFlags:0x80000];
      v180 = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v180 count:1];
      v24 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_closeActiveTab_ input:@"W" modifierFlags:0x100000 discoverabilityTitle:v19 webInterceptable:0 alternates:v23];
      v181[5] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v181 count:6];
      [v156 addObjectsFromArray:v25];

      unint64_t v7 = 0x1E4F1C000uLL;
      id v6 = v156;

      int64_t v3 = 0;
      Class v5 = v164;
    }
    v26 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_saveKeyPressed input:@"S" modifierFlags:0x100000 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
    v179[0] = v26;
    v27 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_saveKeyPressed input:@"S" modifierFlags:1179648 webInterceptable:1 property:1];
    v179[1] = v27;
    v28 = [*(id *)(v7 + 2424) arrayWithObjects:v179 count:2];
    [v6 addObjectsFromArray:v28];

    if (!v3)
    {
      v29 = _WBSLocalizedString();
      v30 = [(SFBrowserMenuProvider *)self _placeholderCommandWithAction:sel_emptySelectorForDownloadModifierLinkTap input:v160 modifierFlags:0x80000 discoverabilityTitle:v29];
      v178[0] = v30;
      v31 = _WBSLocalizedString();
      v32 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_emailCurrentPage input:@"I" modifierFlags:0x100000 discoverabilityTitle:v31 webInterceptable:1];
      v178[1] = v32;
      v33 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_printKeyPressed input:@"P" modifierFlags:0x100000 discoverabilityTitle:0 webInterceptable:1];
      v178[2] = v33;
      v34 = [*(id *)(v7 + 2424) arrayWithObjects:v178 count:3];
      [v6 addObjectsFromArray:v34];

      unint64_t v7 = 0x1E4F1C000uLL;
    }
    if ([MEMORY[0x1E4F97EA0] isScribbleEnabled])
    {
      v35 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_scribbleDoneKeyPressed input:@"\r" modifierFlags:0 discoverabilityTitle:0 webInterceptable:0];
      [v6 addObject:v35];
    }
    if (v3 == 1)
    {
      v36 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_dismissSFSafariViewControllerKeyPressed input:@"W" modifierFlags:0x100000 discoverabilityTitle:0 webInterceptable:0];
      [v6 addObject:v36];
    }
    v151 = [MEMORY[0x1E4FB1970] menuWithTitle:@"File" image:0 identifier:@"FileMenu" options:1 children:v6];
    [v6 count];
    [v5 addObjectsFromArray:v6];
    v37 = _WBSLocalizedString();
    v38 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_autoFillFormKeyPressed input:@"A" modifierFlags:1179648 discoverabilityTitle:v37 webInterceptable:1];
    v177 = v38;
    v39 = [*(id *)(v7 + 2424) arrayWithObjects:&v177 count:1];

    v149 = [MEMORY[0x1E4FB1970] menuWithTitle:@"Edit" image:0 identifier:@"EditMenu" options:1 children:v39];
    [v39 count];
    v150 = v39;
    [v5 addObjectsFromArray:v39];
    v40 = [MEMORY[0x1E4F1CA48] array];
    v158 = v40;
    if (v3)
    {
      v41 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_toggleReaderKeyPressed input:@"R" modifierFlags:1179648 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
      [v40 addObject:v41];
    }
    else
    {
      v42 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_toggleShowingFavoritesBarKeyPressed input:@"B" modifierFlags:1179648 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
      v176[0] = v42;
      v43 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_toggleBookmarksKeyPressed input:@"L" modifierFlags:1179648 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
      v176[1] = v43;
      v44 = [*(id *)(v7 + 2424) arrayWithObjects:v176 count:2];
      [v40 addObjectsFromArray:v44];

      v45 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_toggleReaderKeyPressed input:@"R" modifierFlags:1179648 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
      [v40 addObject:v45];

      v41 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_toggleTabViewKeyPressed input:@"\\"" modifierFlags:1179648 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
      v175[0] = v41;
      v46 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_toggleDownloadsKeyPressed input:@"L" modifierFlags:1572864 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
      v175[1] = v46;
      v47 = [*(id *)(v7 + 2424) arrayWithObjects:v175 count:2];
      [v40 addObjectsFromArray:v47];
    }
    v154 = _WBSLocalizedString();
    v48 = (void *)MEMORY[0x1E4FB1640];
    v166 = _WBSLocalizedString();
    v162 = [v48 alternateWithTitle:v166 action:sel_reloadFromOriginKeyPressed modifierFlags:0x80000];
    v173 = v162;
    v147 = [*(id *)(v7 + 2424) arrayWithObjects:&v173 count:1];
    v145 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_reloadKeyPressed input:@"R" modifierFlags:0x100000 discoverabilityTitle:v154 webInterceptable:0 alternates:v147];
    v174[0] = v145;
    uint64_t v49 = MEMORY[0x1E4F1CBF0];
    v142 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_cancelKeyPressed input:*MEMORY[0x1E4FB2B08] modifierFlags:0 discoverabilityTitle:0 wantsPriorityOverSystemBehavior:1 webInterceptable:1 property:0 alternates:MEMORY[0x1E4F1CBF0]];
    v174[1] = v142;
    v139 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_cancelKeyPressed input:@"." modifierFlags:0x100000 discoverabilityTitle:0 wantsPriorityOverSystemBehavior:1 webInterceptable:1 property:1 alternates:v49];
    v174[2] = v139;
    v136 = _WBSLocalizedString();
    v132 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_resetPageZoomLevelAndFontSize input:@"0" modifierFlags:0x100000 discoverabilityTitle:v136 webInterceptable:1];
    v174[3] = v132;
    v50 = _WBSLocalizedString();
    [(SFBrowserMenuProvider *)self _commandWithAction:sel_increaseSize_ input:@"+" modifierFlags:0x100000 discoverabilityTitle:v50 webInterceptable:1];
    v52 = unint64_t v51 = v7;
    v174[4] = v52;
    v53 = _WBSLocalizedString();
    v54 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_decreaseSize_ input:@"-" modifierFlags:0x100000 discoverabilityTitle:v53 webInterceptable:1];
    v174[5] = v54;
    v55 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_increaseSize_ input:@"=" modifierFlags:0x100000 webInterceptable:1 property:1];
    v174[6] = v55;
    v56 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_decreaseSize_ input:@"_" modifierFlags:0x100000 webInterceptable:1 property:1];
    v174[7] = v56;
    v57 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_toggleShowWebpageStatusBar input:@"/" modifierFlags:0x100000 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
    v174[8] = v57;
    v58 = [*(id *)(v51 + 2424) arrayWithObjects:v174 count:9];
    [v158 addObjectsFromArray:v58];

    v148 = [MEMORY[0x1E4FB1970] menuWithTitle:@"View" image:0 identifier:@"ViewMenu" options:1 children:v158];
    [v158 count];
    [v164 addObjectsFromArray:v158];
    v163 = [MEMORY[0x1E4F1CA48] array];
    v59 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_showHistoryCollectionKeyPressed input:@"3" modifierFlags:1310720 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
    v172[0] = v59;
    v60 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_showHistoryCollectionKeyPressed input:@"Y" modifierFlags:0x100000 webInterceptable:1 property:1];
    v172[1] = v60;
    v61 = _WBSLocalizedString();
    v62 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_navigateBackKeyPressed input:@"[" modifierFlags:0x100000 discoverabilityTitle:v61 webInterceptable:1];
    v172[2] = v62;
    v63 = _WBSLocalizedString();
    v64 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_navigateForwardKeyPressed input:@"]" modifierFlags:0x100000 discoverabilityTitle:v63 webInterceptable:1];
    v172[3] = v64;
    uint64_t v140 = *MEMORY[0x1E4FB2B78];
    v65 = -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_navigateBackKeyPressed);
    v172[4] = v65;
    uint64_t v137 = *MEMORY[0x1E4FB2B90];
    v66 = -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_navigateForwardKeyPressed);
    v172[5] = v66;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:6];
    [v163 addObjectsFromArray:v67];

    int64_t v68 = v159;
    if (!v159)
    {
      v69 = _WBSLocalizedString();
      v70 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_reopenLastClosedTabPressed input:@"T" modifierFlags:1179648 discoverabilityTitle:v69 webInterceptable:1];
      [v163 addObject:v70];
    }
    v71 = (void *)MEMORY[0x1E4FB1970];
    v72 = _WBSLocalizedString();
    v146 = [v71 menuWithTitle:v72 image:0 identifier:@"HistoryMenu" options:1 children:v163];

    [v163 count];
    v73 = v164;
    [v164 addObjectsFromArray:v163];
    v74 = [MEMORY[0x1E4F1CA48] array];
    v155 = v74;
    if (!v159)
    {
      v143 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_showBookmarksCollectionKeyPressed input:@"1" modifierFlags:1310720 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
      v171[0] = v143;
      v133 = _WBSLocalizedString();
      v129 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_editBookmarksKeyPressed input:@"B" modifierFlags:1572864 discoverabilityTitle:v133 webInterceptable:1];
      v171[1] = v129;
      v126 = _WBSLocalizedString();
      v123 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_addToBookmarks_ input:@"D" modifierFlags:0x100000 discoverabilityTitle:v126 webInterceptable:1];
      v171[2] = v123;
      v120 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_showReadingListCollectionKeyPressed input:@"2" modifierFlags:1310720 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
      v171[3] = v120;
      v118 = _WBSLocalizedString();
      v75 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_addToReadingList_ input:@"D" modifierFlags:1179648 discoverabilityTitle:v118 webInterceptable:1];
      v171[4] = v75;
      v76 = _WBSLocalizedString();
      v77 = [(SFBrowserMenuProvider *)self _placeholderCommandWithAction:sel_emptySelectorForAddLinkToReadingListModifierLinkTap input:v160 modifierFlags:0x20000 discoverabilityTitle:v76];
      v171[5] = v77;
      uint64_t v78 = *MEMORY[0x1E4FB2B98];
      v79 = _WBSLocalizedString();
      v80 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_previousReadingListItemKeyPressed input:v78 modifierFlags:0x100000 discoverabilityTitle:v79 webInterceptable:1];
      v171[6] = v80;
      uint64_t v81 = *MEMORY[0x1E4FB2AF8];
      v82 = _WBSLocalizedString();
      v83 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_nextReadingListItemKeyPressed input:v81 modifierFlags:0x100000 discoverabilityTitle:v82 webInterceptable:1];
      v171[7] = v83;
      v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:8];
      [v74 addObjectsFromArray:v84];

      v73 = v164;
      int64_t v68 = 0;

      v85 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_showCloudTabsCollectionKeyPressed input:@"I" modifierFlags:1310720 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
      [v74 addObject:v85];

      v86 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_showSharedWithYouCollectionKeyPressed input:@"S" modifierFlags:1310720 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:1];
      [v74 addObject:v86];
    }
    v87 = (void *)MEMORY[0x1E4FB1970];
    v88 = _WBSLocalizedString();
    v144 = [v87 menuWithTitle:v88 image:0 identifier:@"BookmarksMenu" options:1 children:v74];

    [v74 count];
    [v73 addObjectsFromArray:v74];
    v89 = [MEMORY[0x1E4F1CA48] array];
    if (!v68)
    {
      v134 = _WBSLocalizedString();
      uint64_t v90 = MEMORY[0x1E4F1CBF0];
      v130 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_previousTabKeyPressed_ input:@"\t" modifierFlags:393216 discoverabilityTitle:v134 wantsPriorityOverSystemBehavior:1 webInterceptable:0 property:0 alternates:MEMORY[0x1E4F1CBF0]];
      v170[0] = v130;
      v127 = _WBSLocalizedString();
      v124 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_nextTabKeyPressed_ input:@"\t" modifierFlags:0x40000 discoverabilityTitle:v127 wantsPriorityOverSystemBehavior:1 webInterceptable:0 property:0 alternates:v90];
      v170[1] = v124;
      v121 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_previousTabKeyPressed_ input:@"[" modifierFlags:1179648 webInterceptable:0 property:1];
      v170[2] = v121;
      v91 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_nextTabKeyPressed_ input:@"]" modifierFlags:1179648 webInterceptable:0 property:1];
      v170[3] = v91;
      v92 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_previousTabKeyPressed_ input:v140 modifierFlags:1179648 webInterceptable:0 property:2];
      v170[4] = v92;
      v93 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_nextTabKeyPressed_ input:v137 modifierFlags:1179648 webInterceptable:0 property:2];
      v170[5] = v93;
      v94 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_previousTabKeyPressed_ input:v140 modifierFlags:1572864 discoverabilityTitle:0 wantsPriorityOverSystemBehavior:1 webInterceptable:1 property:3 alternates:v90];
      v170[6] = v94;
      v95 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_nextTabKeyPressed_ input:v137 modifierFlags:1572864 discoverabilityTitle:0 wantsPriorityOverSystemBehavior:1 webInterceptable:1 property:3 alternates:v90];
      v170[7] = v95;
      v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:8];
      [v89 addObjectsFromArray:v96];

      v97 = [(SFBrowserMenuProvider *)self _switchToTabCommands];
      [v89 addObjectsFromArray:v97];

      v141 = _WBSLocalizedString();
      v138 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_closeTabGroupKeyPressed input:@"W" modifierFlags:1703936 discoverabilityTitle:v141 webInterceptable:1];
      v169[0] = v138;
      v135 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_closeTabGroupKeyPressed input:@"\b" modifierFlags:1703936 webInterceptable:1 property:1];
      v169[1] = v135;
      v131 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_closeTabGroupKeyPressed input:@"W" modifierFlags:1310720 webInterceptable:1 property:2];
      v169[2] = v131;
      v128 = _WBSLocalizedString();
      v125 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_renameTabGroupKeyPressed input:@"\r" modifierFlags:1572864 discoverabilityTitle:v128 webInterceptable:1];
      v169[3] = v125;
      v122 = _WBSLocalizedString();
      v119 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_previousTabGroupKeyPressed input:@"[" modifierFlags:1572864 discoverabilityTitle:v122 webInterceptable:1];
      v169[4] = v119;
      uint64_t v98 = *MEMORY[0x1E4FB2B98];
      v117 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_previousTabGroupKeyPressed input:*MEMORY[0x1E4FB2B98] modifierFlags:1179648 webInterceptable:1 property:1];
      v169[5] = v117;
      v99 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_previousTabGroupKeyPressed input:v98 modifierFlags:1572864 webInterceptable:1 property:2];
      v169[6] = v99;
      v100 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_previousTabGroupKeyPressed input:@"[" modifierFlags:1310720 webInterceptable:1 property:3];
      v169[7] = v100;
      v101 = _WBSLocalizedString();
      v102 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_nextTabGroupKeyPressed input:@"]" modifierFlags:1572864 discoverabilityTitle:v101 webInterceptable:1];
      v169[8] = v102;
      uint64_t v103 = *MEMORY[0x1E4FB2AF8];
      v104 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_nextTabGroupKeyPressed input:*MEMORY[0x1E4FB2AF8] modifierFlags:1179648 webInterceptable:1 property:1];
      v169[9] = v104;
      v105 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_nextTabGroupKeyPressed input:v103 modifierFlags:1572864 webInterceptable:1 property:2];
      v169[10] = v105;
      v106 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_nextTabGroupKeyPressed input:@"]" modifierFlags:1310720 webInterceptable:1 property:3];
      v169[11] = v106;
      v107 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:12];
      [v89 addObjectsFromArray:v107];

      v73 = v164;
      int64_t v68 = v159;

      if ([MEMORY[0x1E4F97EA0] isSafariProfilesEnabled])
      {
        v108 = [(SFBrowserMenuProvider *)self _switchToProfileCommands];
        [v89 addObjectsFromArray:v108];
      }
    }
    v109 = [MEMORY[0x1E4FB1970] menuWithTitle:@"Window" image:0 identifier:@"WindowMenu" options:1 children:v89];
    [v89 count];
    [v73 addObjectsFromArray:v89];
    uint64_t v110 = *MEMORY[0x1E4FB2CC8];
    v167[0] = *MEMORY[0x1E4FB2CD0];
    v167[1] = v110;
    v168[0] = v151;
    v168[1] = v149;
    v167[2] = *MEMORY[0x1E4FB2DF0];
    v167[3] = @"HistoryMenu";
    v168[2] = v148;
    v168[3] = v146;
    uint64_t v111 = *MEMORY[0x1E4FB2DF8];
    v167[4] = @"BookmarksMenu";
    v167[5] = v111;
    v168[4] = v144;
    v168[5] = v109;
    uint64_t v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v167 count:6];
    v113 = personaToMenusMap[v68];
    personaToMenusMap[v68] = (NSDictionary *)v112;

    uint64_t v114 = [v73 copy];
    v115 = &self->super.isa + v68;
    Class v116 = v115[5];
    v115[5] = (Class)v114;
  }
}

- (void)_setMenusForPersona:(int64_t)a3 withBuilder:(id)a4
{
  id v18 = a4;
  uint64_t v6 = *MEMORY[0x1E4FB2CD0];
  unint64_t v7 = self->_personaToMenusMap[a3];
  v8 = [(NSDictionary *)v7 objectForKeyedSubscript:v6];
  [v18 insertChildMenu:v8 atEndOfMenuForIdentifier:v6];

  uint64_t v9 = *MEMORY[0x1E4FB2CC8];
  v10 = [(NSDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2CC8]];
  [v18 insertChildMenu:v10 atEndOfMenuForIdentifier:v9];

  [v18 removeMenuForIdentifier:*MEMORY[0x1E4FB2DC0]];
  uint64_t v11 = *MEMORY[0x1E4FB2DF0];
  v12 = [(NSDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2DF0]];
  [v18 insertChildMenu:v12 atEndOfMenuForIdentifier:v11];

  v13 = [(NSDictionary *)v7 objectForKeyedSubscript:@"HistoryMenu"];
  [v18 insertSiblingMenu:v13 afterMenuForIdentifier:v11];

  v14 = [(NSDictionary *)v7 objectForKeyedSubscript:@"BookmarksMenu"];
  [v18 insertSiblingMenu:v14 afterMenuForIdentifier:@"HistoryMenu"];

  uint64_t v15 = *MEMORY[0x1E4FB2DF8];
  v16 = [(NSDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4FB2DF8]];

  [v18 insertChildMenu:v16 atEndOfMenuForIdentifier:v15];
  v17 = [(SFBrowserMenuProvider *)self _extensionsMenu];
  if (v17) {
    [v18 insertChildMenu:v17 atEndOfMenuForIdentifier:*MEMORY[0x1E4FB2D50]];
  }
}

- (id)_newDocumentCommands
{
  v15[4] = *MEMORY[0x1E4F143B8];
  Class v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v5 = [v4 integerForKey:@"NewDocumentShortcutBehavior"];

  if (v5 == 1)
  {
    uint64_t v6 = _WBSLocalizedString();
    unint64_t v7 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_openNewWindowInFrontmostProfile_ input:@"N" modifierFlags:0x100000 discoverabilityTitle:v6 webInterceptable:0];
    v14[0] = v7;
    v8 = _WBSLocalizedString();
    uint64_t v9 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_openNewPrivateWindow_ input:@"N" modifierFlags:1179648 discoverabilityTitle:v8 webInterceptable:0];
    v14[1] = v9;
    v10 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_openNewWindowInFrontmostProfile_ input:@"N" modifierFlags:1572864 webInterceptable:0 property:1];
    v14[2] = v10;
    uint64_t v11 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_openNewPrivateWindow_ input:@"N" modifierFlags:1703936 webInterceptable:0 property:1];
    v14[3] = v11;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
    goto LABEL_5;
  }
  if (!v5)
  {
    uint64_t v6 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_openNewTab_ input:@"N" modifierFlags:0x100000 webInterceptable:0 property:1];
    v15[0] = v6;
    unint64_t v7 = _WBSLocalizedString();
    v8 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_openNewPrivateTab_ input:@"N" modifierFlags:1179648 discoverabilityTitle:v7 webInterceptable:0];
    v15[1] = v8;
    uint64_t v9 = _WBSLocalizedString();
    v10 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_openNewWindowInFrontmostProfile_ input:@"N" modifierFlags:1572864 discoverabilityTitle:v9 webInterceptable:0];
    v15[2] = v10;
    uint64_t v11 = _WBSLocalizedString();
    v12 = [(SFBrowserMenuProvider *)self _commandWithAction:sel_openNewPrivateWindow_ input:@"N" modifierFlags:1703936 discoverabilityTitle:v11 webInterceptable:0];
    v15[3] = v12;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];

LABEL_5:
  }
  return v2;
}

- (id)_switchToTabCommands
{
  int64_t v3 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, 9);
  Class v4 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__SFBrowserMenuProvider__switchToTabCommands__block_invoke;
  v8[3] = &unk_1E54EA2A8;
  id v5 = v4;
  id v9 = v5;
  v10 = self;
  [v3 enumerateIndexesUsingBlock:v8];
  id v6 = v5;

  return v6;
}

void __45__SFBrowserMenuProvider__switchToTabCommands__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 9 || a2 == 1)
  {
    _WBSLocalizedString();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  Class v4 = objc_msgSend(NSString, "stringWithFormat:", @"%i", a2);
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) _commandWithAction:sel_switchToTabKeyPressed_ input:v4 modifierFlags:0x100000 discoverabilityTitle:v7 webInterceptable:0 property:a2 alternates:MEMORY[0x1E4F1CBF0]];
  [v5 addObject:v6];
}

- (id)_switchToProfileCommands
{
  int64_t v3 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, 10);
  Class v4 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SFBrowserMenuProvider__switchToProfileCommands__block_invoke;
  v8[3] = &unk_1E54EA2A8;
  id v5 = v4;
  id v9 = v5;
  v10 = self;
  [v3 enumerateIndexesUsingBlock:v8];
  id v6 = v5;

  return v6;
}

void __49__SFBrowserMenuProvider__switchToProfileCommands__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(NSString, "stringWithFormat:", @"%i", a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  Class v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) _commandWithAction:sel_switchToProfileKeyPressed_ input:v6 modifierFlags:1703936 discoverabilityTitle:&stru_1EDA07C28 webInterceptable:0 property:a2 alternates:MEMORY[0x1E4F1CBF0]];
  [v4 addObject:v5];
}

- (BOOL)commandConflictsWithTextEditing:(id)a3
{
  int64_t v3 = [a3 propertyList];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = ((unint64_t)[v3 integerValue] >> 20) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_placeholderCommandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6
{
  id v6 = [(SFBrowserMenuProvider *)self _commandWithAction:a3 input:a4 modifierFlags:a5 discoverabilityTitle:a6 webInterceptable:1 property:0 alternates:MEMORY[0x1E4F1CBF0]];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 _placeholderKeyCommand];

    id v6 = (void *)v7;
  }

  return v6;
}

- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 webInterceptable:(BOOL)a6 property:(unint64_t)a7
{
  return [(SFBrowserMenuProvider *)self _commandWithAction:a3 input:a4 modifierFlags:a5 discoverabilityTitle:0 wantsPriorityOverSystemBehavior:0 webInterceptable:a6 property:a7 alternates:MEMORY[0x1E4F1CBF0]];
}

- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 webInterceptable:(BOOL)a7
{
  return [(SFBrowserMenuProvider *)self _commandWithAction:a3 input:a4 modifierFlags:a5 discoverabilityTitle:a6 wantsPriorityOverSystemBehavior:0 webInterceptable:a7 property:0 alternates:MEMORY[0x1E4F1CBF0]];
}

- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 webInterceptable:(BOOL)a7 alternates:(id)a8
{
  return [(SFBrowserMenuProvider *)self _commandWithAction:a3 input:a4 modifierFlags:a5 discoverabilityTitle:a6 wantsPriorityOverSystemBehavior:0 webInterceptable:a7 property:0 alternates:a8];
}

- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 webInterceptable:(BOOL)a7 property:(unint64_t)a8 alternates:(id)a9
{
  return [(SFBrowserMenuProvider *)self _commandWithAction:a3 input:a4 modifierFlags:a5 discoverabilityTitle:a6 wantsPriorityOverSystemBehavior:0 webInterceptable:a7 property:a8 alternates:a9];
}

- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 wantsPriorityOverSystemBehavior:(BOOL)a7 webInterceptable:(BOOL)a8 property:(unint64_t)a9 alternates:(id)a10
{
  BOOL v24 = a8;
  BOOL v10 = a7;
  v14 = (__CFString *)a6;
  uint64_t v15 = v14;
  v16 = (void *)MEMORY[0x1E4FB18D0];
  if (v14) {
    v17 = v14;
  }
  else {
    v17 = &stru_1EDA07C28;
  }
  id v18 = NSNumber;
  id v19 = a10;
  id v20 = a4;
  v21 = [v18 numberWithUnsignedInteger:a9];
  v22 = [v16 commandWithTitle:v17 image:0 action:a3 input:v20 modifierFlags:a5 propertyList:v21 alternates:v19];

  if (v15) {
    [v22 setDiscoverabilityTitle:v15];
  }
  else {
    [v22 setAttributes:4];
  }
  [v22 setWantsPriorityOverSystemBehavior:v10];
  if (v24) {
    [v22 _markHandleAfterKeyEvent];
  }
  if (self->_alwaysAllowWebInterception) {
    [v22 _markHandleAfterKeyEvent];
  }

  return v22;
}

- (id)_extensionsMenu
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int64_t v3 = (void *)[(NSSet *)self->_personaToCommandSetMap[self->_persona] mutableCopy];
  unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = self->_webExtensionsController;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v17 = v5;
  id v6 = [(WBSWebExtensionsController *)v5 webExtensionKeyCommands];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([v3 containsObject:v11])
        {
          v12 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v11;
            _os_log_impl(&dword_18C354000, v12, OS_LOG_TYPE_INFO, "Discarding conflicting key command: %@", buf, 0xCu);
          }
        }
        else
        {
          [v3 addObject:v11];
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  if ([v4 count])
  {
    v13 = (void *)MEMORY[0x1E4FB1970];
    v14 = _WBSLocalizedString();
    uint64_t v15 = [v13 menuWithTitle:v14 image:0 identifier:@"ExtensionsMenu" options:1 children:v4];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)_enabledExtensionsDidChange
{
  id v2 = [MEMORY[0x1E4FB1998] mainSystem];
  [v2 setNeedsRebuild];
}

- (BOOL)alwaysAllowWebInterception
{
  return self->_alwaysAllowWebInterception;
}

- (void)setAlwaysAllowWebInterception:(BOOL)a3
{
  self->_alwaysAllowWebInterception = a3;
}

- (SFWebExtensionsController)webExtensionsController
{
  return self->_webExtensionsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webExtensionsController, 0);
  for (uint64_t i = 64; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end