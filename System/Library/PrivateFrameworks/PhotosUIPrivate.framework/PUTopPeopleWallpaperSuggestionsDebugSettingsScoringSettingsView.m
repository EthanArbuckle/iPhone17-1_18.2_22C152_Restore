@interface PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView
- (PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView)initWithScoringContext:(id)a3;
- (UITextField)aestheticFactorTextField;
- (UITextField)atHomeOrWorkFactorTextField;
- (UITextField)favoriteFactorTextField;
- (UITextField)interactionFactorTextField;
- (UITextField)maximumFaceSizeTextField;
- (UITextField)meaningFactorTextField;
- (UITextField)peopleFactorTextField;
- (void)setAestheticFactor:(id)a3;
- (void)setAtHomeOrWorkFactor:(id)a3;
- (void)setFavoriteFactor:(id)a3;
- (void)setInteractionFactor:(id)a3;
- (void)setMaximumFaceSize:(id)a3;
- (void)setMeaningFactor:(id)a3;
- (void)setPeopleFactor:(id)a3;
@end

@implementation PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumFaceSizeTextField, 0);
  objc_storeStrong((id *)&self->_atHomeOrWorkFactorTextField, 0);
  objc_storeStrong((id *)&self->_meaningFactorTextField, 0);
  objc_storeStrong((id *)&self->_interactionFactorTextField, 0);
  objc_storeStrong((id *)&self->_peopleFactorTextField, 0);
  objc_storeStrong((id *)&self->_aestheticFactorTextField, 0);
  objc_storeStrong((id *)&self->_favoriteFactorTextField, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
}

- (UITextField)maximumFaceSizeTextField
{
  return (UITextField *)objc_getProperty(self, a2, 464, 1);
}

- (UITextField)atHomeOrWorkFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 456, 1);
}

- (UITextField)meaningFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 448, 1);
}

- (UITextField)interactionFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 440, 1);
}

- (UITextField)peopleFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 432, 1);
}

- (UITextField)aestheticFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 424, 1);
}

- (UITextField)favoriteFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 416, 1);
}

- (void)setMaximumFaceSize:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsScoringContext setMaximumSizeAllowedForFaces:](self->_scoringContext, "setMaximumSizeAllowedForFaces:");
}

- (void)setAtHomeOrWorkFactor:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsScoringContext setAtHomeOrWorkFactor:](self->_scoringContext, "setAtHomeOrWorkFactor:");
}

- (void)setMeaningFactor:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsScoringContext setMeaningFactor:](self->_scoringContext, "setMeaningFactor:");
}

- (void)setInteractionFactor:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsScoringContext setInteractionFactor:](self->_scoringContext, "setInteractionFactor:");
}

- (void)setPeopleFactor:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsScoringContext setPeopleFactor:](self->_scoringContext, "setPeopleFactor:");
}

- (void)setAestheticFactor:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsScoringContext setAestheticFactor:](self->_scoringContext, "setAestheticFactor:");
}

- (void)setFavoriteFactor:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsScoringContext setFavoriteFactor:](self->_scoringContext, "setFavoriteFactor:");
}

- (PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView)initWithScoringContext:(id)a3
{
  id v5 = a3;
  v102.receiver = self;
  v102.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView;
  v6 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)&v102 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scoringContext, a3);
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v8 setText:@"Favorite Factor:"];
    [v8 sizeToFit];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v8];
    v9 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v101 = v5;
    favoriteFactorTextField = v7->_favoriteFactorTextField;
    v7->_favoriteFactorTextField = v9;

    v11 = NSString;
    [(PUTopPeopleWallpaperSuggestionsScoringContext *)v7->_scoringContext favoriteFactor];
    v13 = [v11 stringWithFormat:@"%.2f", v12];
    [(UITextField *)v7->_favoriteFactorTextField setText:v13];

    [(UITextField *)v7->_favoriteFactorTextField sizeToFit];
    [(UITextField *)v7->_favoriteFactorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v7->_favoriteFactorTextField addTarget:v7 action:sel_setFavoriteFactor_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v7->_favoriteFactorTextField];
    v14 = [(UITextField *)v7->_favoriteFactorTextField centerYAnchor];
    id firstValue = v8;
    v15 = [v8 centerYAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
    [v16 setActive:1];

    v17 = (void *)MEMORY[0x1E4F28DC8];
    v18 = _NSDictionaryOfVariableBindings(&cfstr_Favoritefactor.isa, v8, v7->_favoriteFactorTextField, 0);
    v19 = [v17 constraintsWithVisualFormat:@"H:|-[favoriteFactorLabel]-10-[_favoriteFactorTextField]->=0-|" options:0 metrics:0 views:v18];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addConstraints:v19];

    id v20 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 bounds];
    v21 = objc_msgSend(v20, "initWithFrame:");
    [v21 setText:@"Aesthetic Factor:"];
    [v21 sizeToFit];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v21];
    v22 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    aestheticFactorTextField = v7->_aestheticFactorTextField;
    v7->_aestheticFactorTextField = v22;

    v24 = NSString;
    [(PUTopPeopleWallpaperSuggestionsScoringContext *)v7->_scoringContext aestheticFactor];
    v26 = [v24 stringWithFormat:@"%.2f", v25];
    [(UITextField *)v7->_aestheticFactorTextField setText:v26];

    [(UITextField *)v7->_aestheticFactorTextField sizeToFit];
    [(UITextField *)v7->_aestheticFactorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v7->_aestheticFactorTextField addTarget:v7 action:sel_setAestheticFactor_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v7->_aestheticFactorTextField];
    v27 = [(UITextField *)v7->_aestheticFactorTextField centerYAnchor];
    v28 = [v21 centerYAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:0.0];
    [v29 setActive:1];

    v30 = (void *)MEMORY[0x1E4F28DC8];
    v31 = _NSDictionaryOfVariableBindings(&cfstr_Aestheticfacto.isa, v21, v7->_aestheticFactorTextField, 0);
    v32 = [v30 constraintsWithVisualFormat:@"H:|-[aestheticFactorLabel]-10-[_aestheticFactorTextField]->=0-|" options:0 metrics:0 views:v31];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addConstraints:v32];

    id v33 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 bounds];
    v34 = objc_msgSend(v33, "initWithFrame:");
    [v34 setText:@"People Factor:"];
    [v34 sizeToFit];
    [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v34];
    v35 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    peopleFactorTextField = v7->_peopleFactorTextField;
    v7->_peopleFactorTextField = v35;

    v37 = NSString;
    [(PUTopPeopleWallpaperSuggestionsScoringContext *)v7->_scoringContext peopleFactor];
    v39 = [v37 stringWithFormat:@"%.2f", v38];
    [(UITextField *)v7->_peopleFactorTextField setText:v39];

    [(UITextField *)v7->_peopleFactorTextField sizeToFit];
    [(UITextField *)v7->_peopleFactorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v7->_peopleFactorTextField addTarget:v7 action:sel_setPeopleFactor_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v7->_peopleFactorTextField];
    v40 = [(UITextField *)v7->_peopleFactorTextField lastBaselineAnchor];
    v41 = [v34 lastBaselineAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:0.0];
    [v42 setActive:1];

    v43 = (void *)MEMORY[0x1E4F28DC8];
    v44 = _NSDictionaryOfVariableBindings(&cfstr_Peoplefactorla.isa, v34, v7->_peopleFactorTextField, 0);
    v45 = [v43 constraintsWithVisualFormat:@"H:|-[peopleFactorLabel]-10-[_peopleFactorTextField]->=0-|" options:0 metrics:0 views:v44];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addConstraints:v45];

    id v46 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 bounds];
    v47 = objc_msgSend(v46, "initWithFrame:");
    [v47 setText:@"Interaction Factor:"];
    [v47 sizeToFit];
    [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v47];
    v48 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    interactionFactorTextField = v7->_interactionFactorTextField;
    v7->_interactionFactorTextField = v48;

    v50 = NSString;
    [(PUTopPeopleWallpaperSuggestionsScoringContext *)v7->_scoringContext interactionFactor];
    v52 = [v50 stringWithFormat:@"%.2f", v51];
    [(UITextField *)v7->_interactionFactorTextField setText:v52];

    [(UITextField *)v7->_interactionFactorTextField sizeToFit];
    [(UITextField *)v7->_interactionFactorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v7->_interactionFactorTextField addTarget:v7 action:sel_setInteractionFactor_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v7->_interactionFactorTextField];
    v53 = [(UITextField *)v7->_interactionFactorTextField lastBaselineAnchor];
    v54 = [v47 lastBaselineAnchor];
    v55 = [v53 constraintEqualToAnchor:v54 constant:0.0];
    [v55 setActive:1];

    v56 = (void *)MEMORY[0x1E4F28DC8];
    v57 = _NSDictionaryOfVariableBindings(&cfstr_Interactionfac.isa, v47, v7->_interactionFactorTextField, 0);
    v58 = [v56 constraintsWithVisualFormat:@"H:|-[interactionFactorLabel]-10-[_interactionFactorTextField]->=0-|" options:0 metrics:0 views:v57];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addConstraints:v58];

    id v59 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v59 setText:@"Meaning Factor:"];
    [v59 sizeToFit];
    [v59 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v59];
    v60 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    meaningFactorTextField = v7->_meaningFactorTextField;
    v7->_meaningFactorTextField = v60;

    v62 = NSString;
    [(PUTopPeopleWallpaperSuggestionsScoringContext *)v7->_scoringContext meaningFactor];
    v64 = [v62 stringWithFormat:@"%.2f", v63];
    [(UITextField *)v7->_meaningFactorTextField setText:v64];

    [(UITextField *)v7->_meaningFactorTextField sizeToFit];
    [(UITextField *)v7->_meaningFactorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v7->_meaningFactorTextField addTarget:v7 action:sel_setMeaningFactor_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v7->_meaningFactorTextField];
    v65 = [(UITextField *)v7->_meaningFactorTextField centerYAnchor];
    v66 = [v59 centerYAnchor];
    v67 = [v65 constraintEqualToAnchor:v66 constant:0.0];
    [v67 setActive:1];

    v68 = (void *)MEMORY[0x1E4F28DC8];
    v69 = _NSDictionaryOfVariableBindings(&cfstr_Meaningfactorl.isa, v59, v7->_meaningFactorTextField, 0);
    v70 = [v68 constraintsWithVisualFormat:@"H:|-[meaningFactorLabel]-10-[_meaningFactorTextField]->=0-|" options:0 metrics:0 views:v69];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addConstraints:v70];

    id v71 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v71 setText:@"At Home or Work Factor:"];
    [v71 sizeToFit];
    [v71 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v71];
    v72 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    atHomeOrWorkFactorTextField = v7->_atHomeOrWorkFactorTextField;
    v7->_atHomeOrWorkFactorTextField = v72;

    v74 = NSString;
    [(PUTopPeopleWallpaperSuggestionsScoringContext *)v7->_scoringContext atHomeOrWorkFactor];
    v76 = [v74 stringWithFormat:@"%.2f", v75];
    [(UITextField *)v7->_atHomeOrWorkFactorTextField setText:v76];

    [(UITextField *)v7->_atHomeOrWorkFactorTextField sizeToFit];
    [(UITextField *)v7->_atHomeOrWorkFactorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v7->_atHomeOrWorkFactorTextField addTarget:v7 action:sel_setAtHomeOrWorkFactor_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v7->_atHomeOrWorkFactorTextField];
    v77 = [(UITextField *)v7->_atHomeOrWorkFactorTextField centerYAnchor];
    v78 = [v71 centerYAnchor];
    v79 = [v77 constraintEqualToAnchor:v78 constant:0.0];
    [v79 setActive:1];

    v80 = (void *)MEMORY[0x1E4F28DC8];
    v81 = _NSDictionaryOfVariableBindings(&cfstr_Athomeorworkfa.isa, v71, v7->_atHomeOrWorkFactorTextField, 0);
    v82 = [v80 constraintsWithVisualFormat:@"H:|-[atHomeOrWorkFactorLabel]-10-[_atHomeOrWorkFactorTextField]->=0-|" options:0 metrics:0 views:v81];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addConstraints:v82];

    id v83 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 bounds];
    v84 = objc_msgSend(v83, "initWithFrame:");
    [v84 setText:@"Maximum Face Size:"];
    [v84 sizeToFit];
    [v84 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v84];
    v85 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    maximumFaceSizeTextField = v7->_maximumFaceSizeTextField;
    v7->_maximumFaceSizeTextField = v85;

    v87 = NSString;
    [(PUTopPeopleWallpaperSuggestionsScoringContext *)v7->_scoringContext maximumSizeAllowedForFaces];
    v89 = [v87 stringWithFormat:@"%.2f", v88];
    [(UITextField *)v7->_maximumFaceSizeTextField setText:v89];

    [(UITextField *)v7->_maximumFaceSizeTextField sizeToFit];
    [(UITextField *)v7->_maximumFaceSizeTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v7->_maximumFaceSizeTextField addTarget:v7 action:sel_setMaximumFaceSize_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addSubview:v7->_maximumFaceSizeTextField];
    v90 = [(UITextField *)v7->_maximumFaceSizeTextField lastBaselineAnchor];
    v91 = [v84 lastBaselineAnchor];
    v92 = [v90 constraintEqualToAnchor:v91 constant:0.0];
    [v92 setActive:1];

    v93 = (void *)MEMORY[0x1E4F28DC8];
    v94 = _NSDictionaryOfVariableBindings(&cfstr_Maximumfacesiz.isa, v84, v7->_maximumFaceSizeTextField, 0);
    v95 = [v93 constraintsWithVisualFormat:@"H:|-[maximumFaceSizeLabel]-10-[_maximumFaceSizeTextField]->=0-|" options:0 metrics:0 views:v94];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addConstraints:v95];

    v96 = (void *)MEMORY[0x1E4F28DC8];
    v97 = _NSDictionaryOfVariableBindings(&cfstr_Favoritefactor_0.isa, firstValue, v21, v34, v47, v59, v71, v84, 0);
    v98 = [v96 constraintsWithVisualFormat:@"V:|-16-[favoriteFactorLabel(<=44)]-10-[aestheticFactorLabel(<=44)]-10-[peopleFactorLabel(<=44)]-10-[interactionFactorLabel(<=44)]-10-[meaningFactorLabel(<=44)]-10-[atHomeOrWorkFactorLabel(<=44)]-10-[maximumFaceSizeLabel(<=44)]->=0-|" options:0 metrics:0 views:v97];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *)v7 addConstraints:v98];

    id v5 = v101;
  }

  return v7;
}

@end