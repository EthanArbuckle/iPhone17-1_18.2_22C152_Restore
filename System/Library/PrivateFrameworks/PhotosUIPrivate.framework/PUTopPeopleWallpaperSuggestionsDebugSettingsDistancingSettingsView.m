@interface PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView
- (PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView)initWithDistancingContext:(id)a3;
- (UITextField)locationFactorTextField;
- (UITextField)locationPivotTextField;
- (UITextField)maximumNumberOfSuggestionsWithPeopleTextField;
- (UITextField)maximumNumberOfSuggestionsWithoutPeopleTextField;
- (UITextField)peopleFactorTextField;
- (UITextField)peoplePivotTextField;
- (UITextField)sceneprintFactorTextField;
- (UITextField)sceneprintPivotTextField;
- (UITextField)timeFactorTextField;
- (UITextField)timePivotTextField;
- (void)setLocationFactor:(id)a3;
- (void)setLocationPivot:(id)a3;
- (void)setMaximumNumberOfSuggestionsWithPeople:(id)a3;
- (void)setMaximumNumberOfSuggestionsWithoutPeople:(id)a3;
- (void)setPeopleFactor:(id)a3;
- (void)setPeoplePivot:(id)a3;
- (void)setSceneprintFactor:(id)a3;
- (void)setSceneprintPivot:(id)a3;
- (void)setTimeFactor:(id)a3;
- (void)setTimePivot:(id)a3;
@end

@implementation PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumNumberOfSuggestionsWithoutPeopleTextField, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfSuggestionsWithPeopleTextField, 0);
  objc_storeStrong((id *)&self->_sceneprintFactorTextField, 0);
  objc_storeStrong((id *)&self->_peopleFactorTextField, 0);
  objc_storeStrong((id *)&self->_locationFactorTextField, 0);
  objc_storeStrong((id *)&self->_timeFactorTextField, 0);
  objc_storeStrong((id *)&self->_sceneprintPivotTextField, 0);
  objc_storeStrong((id *)&self->_peoplePivotTextField, 0);
  objc_storeStrong((id *)&self->_locationPivotTextField, 0);
  objc_storeStrong((id *)&self->_timePivotTextField, 0);
  objc_storeStrong((id *)&self->_distancingContext, 0);
}

- (UITextField)maximumNumberOfSuggestionsWithoutPeopleTextField
{
  return (UITextField *)objc_getProperty(self, a2, 488, 1);
}

- (UITextField)maximumNumberOfSuggestionsWithPeopleTextField
{
  return (UITextField *)objc_getProperty(self, a2, 480, 1);
}

- (UITextField)sceneprintFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 472, 1);
}

- (UITextField)peopleFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 464, 1);
}

- (UITextField)locationFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 456, 1);
}

- (UITextField)timeFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 448, 1);
}

- (UITextField)sceneprintPivotTextField
{
  return (UITextField *)objc_getProperty(self, a2, 440, 1);
}

- (UITextField)peoplePivotTextField
{
  return (UITextField *)objc_getProperty(self, a2, 432, 1);
}

- (UITextField)locationPivotTextField
{
  return (UITextField *)objc_getProperty(self, a2, 424, 1);
}

- (UITextField)timePivotTextField
{
  return (UITextField *)objc_getProperty(self, a2, 416, 1);
}

- (void)setMaximumNumberOfSuggestionsWithoutPeople:(id)a3
{
  id v4 = [a3 text];
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setMaximumNumberOfSuggestionsWithoutPeople:](self->_distancingContext, "setMaximumNumberOfSuggestionsWithoutPeople:", [v4 integerValue]);
}

- (void)setMaximumNumberOfSuggestionsWithPeople:(id)a3
{
  id v4 = [a3 text];
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setMaximumNumberOfSuggestionsWithPeople:](self->_distancingContext, "setMaximumNumberOfSuggestionsWithPeople:", [v4 integerValue]);
}

- (void)setSceneprintFactor:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setSceneprintFactor:](self->_distancingContext, "setSceneprintFactor:");
}

- (void)setPeopleFactor:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setPeopleFactor:](self->_distancingContext, "setPeopleFactor:");
}

- (void)setLocationFactor:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setLocationFactor:](self->_distancingContext, "setLocationFactor:");
}

- (void)setTimeFactor:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setTimeFactor:](self->_distancingContext, "setTimeFactor:");
}

- (void)setSceneprintPivot:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setSceneprintPivot:](self->_distancingContext, "setSceneprintPivot:");
}

- (void)setPeoplePivot:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setPeoplePivot:](self->_distancingContext, "setPeoplePivot:");
}

- (void)setLocationPivot:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setLocationPivot:](self->_distancingContext, "setLocationPivot:");
}

- (void)setTimePivot:(id)a3
{
  id v5 = [a3 text];
  [v5 doubleValue];
  [(PUTopPeopleWallpaperSuggestionsDistancingContext *)self->_distancingContext setTimePivot:v4 * 86400.0];
}

- (PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView)initWithDistancingContext:(id)a3
{
  id v146 = a3;
  v147.receiver = self;
  v147.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView;
  id v5 = [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)&v147 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_distancingContext, a3);
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v7 setText:@"Time Pivot (days):"];
    [v7 sizeToFit];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v7];
    v8 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    timePivotTextField = v6->_timePivotTextField;
    v6->_timePivotTextField = v8;

    v10 = NSString;
    [(PUTopPeopleWallpaperSuggestionsDistancingContext *)v6->_distancingContext timePivot];
    v12 = [v10 stringWithFormat:@"%.2f", v11 / 86400.0];
    [(UITextField *)v6->_timePivotTextField setText:v12];

    [(UITextField *)v6->_timePivotTextField sizeToFit];
    [(UITextField *)v6->_timePivotTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v6->_timePivotTextField addTarget:v6 action:sel_setTimePivot_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v6->_timePivotTextField];
    v13 = [(UITextField *)v6->_timePivotTextField centerYAnchor];
    v14 = v7;
    v145 = v7;
    v15 = [v7 centerYAnchor];
    v16 = [v13 constraintEqualToAnchor:v15 constant:0.0];
    [v16 setActive:1];

    v17 = (void *)MEMORY[0x1E4F28DC8];
    v18 = _NSDictionaryOfVariableBindings(&cfstr_Timepivotlabel.isa, v14, v6->_timePivotTextField, 0);
    v19 = [v17 constraintsWithVisualFormat:@"H:|-[timePivotLabel]-10-[_timePivotTextField]->=0-|" options:0 metrics:0 views:v18];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v19];

    id v20 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 bounds];
    v21 = objc_msgSend(v20, "initWithFrame:");
    [v21 setText:@"Location Pivot (m):"];
    [v21 sizeToFit];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    v144 = v21;
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v21];
    v22 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    locationPivotTextField = v6->_locationPivotTextField;
    v6->_locationPivotTextField = v22;

    v24 = NSString;
    [(PUTopPeopleWallpaperSuggestionsDistancingContext *)v6->_distancingContext locationPivot];
    v26 = [v24 stringWithFormat:@"%.2f", v25];
    [(UITextField *)v6->_locationPivotTextField setText:v26];

    [(UITextField *)v6->_locationPivotTextField sizeToFit];
    [(UITextField *)v6->_locationPivotTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v6->_locationPivotTextField addTarget:v6 action:sel_setLocationPivot_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v6->_locationPivotTextField];
    v27 = [(UITextField *)v6->_locationPivotTextField centerYAnchor];
    v28 = [v21 centerYAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:0.0];
    [v29 setActive:1];

    v30 = (void *)MEMORY[0x1E4F28DC8];
    v31 = _NSDictionaryOfVariableBindings(&cfstr_Locationpivotl.isa, v21, v6->_locationPivotTextField, 0);
    v32 = [v30 constraintsWithVisualFormat:@"H:|-[locationPivotLabel]-10-[_locationPivotTextField]->=0-|" options:0 metrics:0 views:v31];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v32];

    id v33 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 bounds];
    v34 = objc_msgSend(v33, "initWithFrame:");
    [v34 setText:@"People Pivot:"];
    [v34 sizeToFit];
    [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
    v143 = v34;
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v34];
    v35 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    peoplePivotTextField = v6->_peoplePivotTextField;
    v6->_peoplePivotTextField = v35;

    v37 = NSString;
    [(PUTopPeopleWallpaperSuggestionsDistancingContext *)v6->_distancingContext peoplePivot];
    v39 = [v37 stringWithFormat:@"%.2f", v38];
    [(UITextField *)v6->_peoplePivotTextField setText:v39];

    [(UITextField *)v6->_peoplePivotTextField sizeToFit];
    [(UITextField *)v6->_peoplePivotTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v6->_peoplePivotTextField addTarget:v6 action:sel_setPeoplePivot_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v6->_peoplePivotTextField];
    v40 = [(UITextField *)v6->_peoplePivotTextField lastBaselineAnchor];
    v41 = [v34 lastBaselineAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:0.0];
    [v42 setActive:1];

    v43 = (void *)MEMORY[0x1E4F28DC8];
    v44 = _NSDictionaryOfVariableBindings(&cfstr_Peoplepivotlab.isa, v34, v6->_peoplePivotTextField, 0);
    v45 = [v43 constraintsWithVisualFormat:@"H:|-[peoplePivotLabel]-10-[_peoplePivotTextField]->=0-|" options:0 metrics:0 views:v44];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v45];

    id v46 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 bounds];
    v47 = objc_msgSend(v46, "initWithFrame:");
    [v47 setText:@"Sceneprint Pivot:"];
    [v47 sizeToFit];
    [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
    v142 = v47;
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v47];
    v48 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    sceneprintPivotTextField = v6->_sceneprintPivotTextField;
    v6->_sceneprintPivotTextField = v48;

    v50 = NSString;
    [(PUTopPeopleWallpaperSuggestionsDistancingContext *)v6->_distancingContext sceneprintPivot];
    v52 = [v50 stringWithFormat:@"%.2f", v51];
    [(UITextField *)v6->_sceneprintPivotTextField setText:v52];

    [(UITextField *)v6->_sceneprintPivotTextField sizeToFit];
    [(UITextField *)v6->_sceneprintPivotTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v6->_sceneprintPivotTextField addTarget:v6 action:sel_setSceneprintPivot_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v6->_sceneprintPivotTextField];
    v53 = [(UITextField *)v6->_sceneprintPivotTextField lastBaselineAnchor];
    v54 = [v47 lastBaselineAnchor];
    v55 = [v53 constraintEqualToAnchor:v54 constant:0.0];
    [v55 setActive:1];

    v56 = (void *)MEMORY[0x1E4F28DC8];
    v57 = _NSDictionaryOfVariableBindings(&cfstr_Sceneprintpivo.isa, v47, v6->_sceneprintPivotTextField, 0);
    v58 = [v56 constraintsWithVisualFormat:@"H:|-[sceneprintPivotLabel]-10-[_sceneprintPivotTextField]->=0-|" options:0 metrics:0 views:v57];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v58];

    id v59 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v59 setText:@"Time Factor:"];
    [v59 sizeToFit];
    [v59 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v59];
    v60 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    timeFactorTextField = v6->_timeFactorTextField;
    v6->_timeFactorTextField = v60;

    v62 = NSString;
    [(PUTopPeopleWallpaperSuggestionsDistancingContext *)v6->_distancingContext timeFactor];
    v64 = [v62 stringWithFormat:@"%.2f", v63];
    [(UITextField *)v6->_timeFactorTextField setText:v64];

    [(UITextField *)v6->_timeFactorTextField sizeToFit];
    [(UITextField *)v6->_timeFactorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v6->_timeFactorTextField addTarget:v6 action:sel_setTimeFactor_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v6->_timeFactorTextField];
    v65 = [(UITextField *)v6->_timeFactorTextField centerYAnchor];
    v66 = v59;
    v141 = v59;
    v67 = [v59 centerYAnchor];
    v68 = [v65 constraintEqualToAnchor:v67 constant:0.0];
    [v68 setActive:1];

    v69 = (void *)MEMORY[0x1E4F28DC8];
    v70 = _NSDictionaryOfVariableBindings(&cfstr_Timefactorlabe.isa, v66, v6->_timeFactorTextField, 0);
    v71 = [v69 constraintsWithVisualFormat:@"H:|-[timeFactorLabel]-10-[_timeFactorTextField]->=0-|" options:0 metrics:0 views:v70];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v71];

    id v72 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 bounds];
    v73 = objc_msgSend(v72, "initWithFrame:");
    [v73 setText:@"Location Factor:"];
    [v73 sizeToFit];
    [v73 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v73];
    v74 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    locationFactorTextField = v6->_locationFactorTextField;
    v6->_locationFactorTextField = v74;

    v76 = NSString;
    [(PUTopPeopleWallpaperSuggestionsDistancingContext *)v6->_distancingContext locationFactor];
    v78 = [v76 stringWithFormat:@"%.2f", v77];
    [(UITextField *)v6->_locationFactorTextField setText:v78];

    [(UITextField *)v6->_locationFactorTextField sizeToFit];
    [(UITextField *)v6->_locationFactorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v6->_locationFactorTextField addTarget:v6 action:sel_setLocationFactor_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v6->_locationFactorTextField];
    v79 = [(UITextField *)v6->_locationFactorTextField centerYAnchor];
    v80 = v73;
    v140 = v73;
    v81 = [v73 centerYAnchor];
    v82 = [v79 constraintEqualToAnchor:v81 constant:0.0];
    [v82 setActive:1];

    v83 = (void *)MEMORY[0x1E4F28DC8];
    v84 = _NSDictionaryOfVariableBindings(&cfstr_Locationfactor.isa, v80, v6->_locationFactorTextField, 0);
    v85 = [v83 constraintsWithVisualFormat:@"H:|-[locationFactorLabel]-10-[_locationFactorTextField]->=0-|" options:0 metrics:0 views:v84];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v85];

    id v86 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 bounds];
    v87 = objc_msgSend(v86, "initWithFrame:");
    [v87 setText:@"People Factor:"];
    [v87 sizeToFit];
    [v87 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v87];
    v88 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    peopleFactorTextField = v6->_peopleFactorTextField;
    v6->_peopleFactorTextField = v88;

    v90 = NSString;
    [(PUTopPeopleWallpaperSuggestionsDistancingContext *)v6->_distancingContext peopleFactor];
    v92 = [v90 stringWithFormat:@"%.2f", v91];
    [(UITextField *)v6->_peopleFactorTextField setText:v92];

    [(UITextField *)v6->_peopleFactorTextField sizeToFit];
    [(UITextField *)v6->_peopleFactorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v6->_peopleFactorTextField addTarget:v6 action:sel_setPeopleFactor_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v6->_peopleFactorTextField];
    v93 = [(UITextField *)v6->_peopleFactorTextField lastBaselineAnchor];
    v94 = [v87 lastBaselineAnchor];
    v95 = [v93 constraintEqualToAnchor:v94 constant:0.0];
    [v95 setActive:1];

    v96 = (void *)MEMORY[0x1E4F28DC8];
    v97 = _NSDictionaryOfVariableBindings(&cfstr_Peoplefactorla.isa, v87, v6->_peopleFactorTextField, 0);
    v98 = [v96 constraintsWithVisualFormat:@"H:|-[peopleFactorLabel]-10-[_peopleFactorTextField]->=0-|" options:0 metrics:0 views:v97];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v98];

    id v99 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 bounds];
    v100 = objc_msgSend(v99, "initWithFrame:");
    [v100 setText:@"Sceneprint Factor:"];
    [v100 sizeToFit];
    [v100 setTranslatesAutoresizingMaskIntoConstraints:0];
    v139 = v100;
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v100];
    v101 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    sceneprintFactorTextField = v6->_sceneprintFactorTextField;
    v6->_sceneprintFactorTextField = v101;

    v103 = NSString;
    [(PUTopPeopleWallpaperSuggestionsDistancingContext *)v6->_distancingContext sceneprintFactor];
    v105 = [v103 stringWithFormat:@"%.2f", v104];
    [(UITextField *)v6->_sceneprintFactorTextField setText:v105];

    [(UITextField *)v6->_sceneprintFactorTextField sizeToFit];
    [(UITextField *)v6->_sceneprintFactorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v6->_sceneprintFactorTextField addTarget:v6 action:sel_setSceneprintFactor_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v6->_sceneprintFactorTextField];
    v106 = [(UITextField *)v6->_sceneprintFactorTextField lastBaselineAnchor];
    v107 = [v100 lastBaselineAnchor];
    v108 = [v106 constraintEqualToAnchor:v107 constant:0.0];
    [v108 setActive:1];

    v109 = (void *)MEMORY[0x1E4F28DC8];
    v110 = _NSDictionaryOfVariableBindings(&cfstr_Sceneprintfact.isa, v100, v6->_sceneprintFactorTextField, 0);
    v111 = [v109 constraintsWithVisualFormat:@"H:|-[sceneprintFactorLabel]-10-[_sceneprintFactorTextField]->=0-|" options:0 metrics:0 views:v110];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v111];

    id v112 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 bounds];
    v113 = objc_msgSend(v112, "initWithFrame:");
    [v113 setText:@"Maximum Number of Suggestions With People:"];
    [v113 sizeToFit];
    [v113 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v113];
    v114 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    maximumNumberOfSuggestionsWithPeopleTextField = v6->_maximumNumberOfSuggestionsWithPeopleTextField;
    v6->_maximumNumberOfSuggestionsWithPeopleTextField = v114;

    v116 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[PUTopPeopleWallpaperSuggestionsDistancingContext maximumNumberOfSuggestionsWithPeople](v6->_distancingContext, "maximumNumberOfSuggestionsWithPeople"));
    [(UITextField *)v6->_maximumNumberOfSuggestionsWithPeopleTextField setText:v116];

    [(UITextField *)v6->_maximumNumberOfSuggestionsWithPeopleTextField sizeToFit];
    [(UITextField *)v6->_maximumNumberOfSuggestionsWithPeopleTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v6->_maximumNumberOfSuggestionsWithPeopleTextField addTarget:v6 action:sel_setMaximumNumberOfSuggestionsWithPeople_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v6->_maximumNumberOfSuggestionsWithPeopleTextField];
    v117 = [(UITextField *)v6->_maximumNumberOfSuggestionsWithPeopleTextField lastBaselineAnchor];
    v118 = v113;
    v119 = [v113 lastBaselineAnchor];
    v120 = [v117 constraintEqualToAnchor:v119 constant:0.0];
    [v120 setActive:1];

    v121 = (void *)MEMORY[0x1E4F28DC8];
    v122 = _NSDictionaryOfVariableBindings(&cfstr_Maximumnumbero.isa, v118, v6->_maximumNumberOfSuggestionsWithPeopleTextField, 0);
    v123 = [v121 constraintsWithVisualFormat:@"H:|-[maximumNumberOfSuggestionsWithPeopleLabel]-10-[_maximumNumberOfSuggestionsWithPeopleTextField]->=0-|" options:0 metrics:0 views:v122];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v123];

    id v124 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 bounds];
    v125 = objc_msgSend(v124, "initWithFrame:");
    [v125 setText:@"Maximum Number of Suggestions Without People:"];
    [v125 sizeToFit];
    [v125 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v125];
    v126 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    maximumNumberOfSuggestionsWithoutPeopleTextField = v6->_maximumNumberOfSuggestionsWithoutPeopleTextField;
    v6->_maximumNumberOfSuggestionsWithoutPeopleTextField = v126;

    v128 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[PUTopPeopleWallpaperSuggestionsDistancingContext maximumNumberOfSuggestionsWithoutPeople](v6->_distancingContext, "maximumNumberOfSuggestionsWithoutPeople"));
    [(UITextField *)v6->_maximumNumberOfSuggestionsWithoutPeopleTextField setText:v128];

    [(UITextField *)v6->_maximumNumberOfSuggestionsWithoutPeopleTextField sizeToFit];
    [(UITextField *)v6->_maximumNumberOfSuggestionsWithoutPeopleTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v6->_maximumNumberOfSuggestionsWithoutPeopleTextField addTarget:v6 action:sel_setMaximumNumberOfSuggestionsWithoutPeople_ forControlEvents:0x40000];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addSubview:v6->_maximumNumberOfSuggestionsWithoutPeopleTextField];
    v129 = [(UITextField *)v6->_maximumNumberOfSuggestionsWithoutPeopleTextField lastBaselineAnchor];
    v130 = [v125 lastBaselineAnchor];
    v131 = [v129 constraintEqualToAnchor:v130 constant:0.0];
    [v131 setActive:1];

    v132 = (void *)MEMORY[0x1E4F28DC8];
    v133 = _NSDictionaryOfVariableBindings(&cfstr_Maximumnumbero_0.isa, v125, v6->_maximumNumberOfSuggestionsWithoutPeopleTextField, 0);
    v134 = [v132 constraintsWithVisualFormat:@"H:|-[maximumNumberOfSuggestionsWithoutPeopleLabel]-10-[_maximumNumberOfSuggestionsWithoutPeopleTextField]->=0-|" options:0 metrics:0 views:v133];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v134];

    v135 = (void *)MEMORY[0x1E4F28DC8];
    v136 = _NSDictionaryOfVariableBindings(&cfstr_Timepivotlabel_0.isa, v145, v144, v143, v142, v141, v140, v87, v139, v118, v125, 0);
    v137 = [v135 constraintsWithVisualFormat:@"V:|-16-[timePivotLabel(<=44)]-10-[locationPivotLabel(<=44)]-10-[peoplePivotLabel(<=44)]-10-[sceneprintPivotLabel(<=44)]-10-[timeFactorLabel(<=44)]-10-[locationFactorLabel(<=44)]-10-[peopleFactorLabel(<=44)]-10-[sceneprintFactorLabel(<=44)]-10-[maximumNumberOfSuggestionsWithPeopleLabel(<=44)]-10-[maximumNumberOfSuggestionsWithoutPeopleLabel(<=44)]->=0-|" options:0 metrics:0 views:v136];
    [(PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *)v6 addConstraints:v137];
  }
  return v6;
}

@end