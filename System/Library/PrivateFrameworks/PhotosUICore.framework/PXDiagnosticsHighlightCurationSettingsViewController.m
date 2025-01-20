@interface PXDiagnosticsHighlightCurationSettingsViewController
- (NSDictionary)options;
- (PXDiagnosticsHighlightCurationSettingsViewController)initWithDelegate:(id)a3;
- (void)_applySettingsGlobally:(id)a3;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)_resetSettings:(id)a3;
- (void)loadView;
- (void)setOptions:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXDiagnosticsHighlightCurationSettingsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_finalPassDedupingThresholdTextField, 0);
  objc_storeStrong((id *)&self->_finalPassMaximumTimeGroupExtensionTextField, 0);
  objc_storeStrong((id *)&self->_finalPassTimeIntervalTextField, 0);
  objc_storeStrong((id *)&self->_doFinalPassSwitch, 0);
  objc_storeStrong((id *)&self->_returnDedupedJunkIfOnlyJunkSwitch, 0);
  objc_storeStrong((id *)&self->_doDejunkSwitch, 0);
  objc_storeStrong((id *)&self->_onlyDedupeContiguousItemsSwitch, 0);
  objc_storeStrong((id *)&self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch, 0);
  objc_storeStrong((id *)&self->_doNotDedupeVideosSwitch, 0);
  objc_storeStrong((id *)&self->_useFaceQualityForElectionSwitch, 0);
  objc_storeStrong((id *)&self->_useAllPersonsForDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_useOnlyScenesForDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_allowAdaptiveForSemanticalDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_doNotSemanticallyDedupePersonsSwitch, 0);
  objc_storeStrong((id *)&self->_doNotSemanticallyDedupePeopleSwitch, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingThresholdForPersonsTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingThresholdForPeopleTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingThresholdTextField, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfItemsPerSemanticalClusterTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingMaximumTimeGroupExtensionTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingTimeIntervalForPersonsTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingTimeIntervalForPeopleTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingTimeIntervalTextField, 0);
  objc_storeStrong((id *)&self->_doSemanticalDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_identicalDedupingFaceprintDistanceTextField, 0);
  objc_storeStrong((id *)&self->_useFaceprintsForIdenticalDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_identicalDedupingThresholdForBestItemsTextField, 0);
  objc_storeStrong((id *)&self->_identicalDedupingThresholdForPeopleTextField, 0);
  objc_storeStrong((id *)&self->_identicalDedupingThresholdTextField, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfItemsPerIdenticalClusterTextField, 0);
  objc_storeStrong((id *)&self->_identicalDedupingMaximumTimeGroupExtensionTextField, 0);
  objc_storeStrong((id *)&self->_identicalDedupingTimeIntervalForPeopleTextField, 0);
  objc_storeStrong((id *)&self->_identicalDedupingTimeIntervalTextField, 0);
  objc_storeStrong((id *)&self->_doIdenticalDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)_done:(id)a3
{
  delegate = self->_delegate;
  v5 = [(PXDiagnosticsHighlightCurationSettingsViewController *)self options];
  [(PXDiagnosticsHighlightCurationSettingsViewControllerDelegate *)delegate applySettings:v5 globally:0];

  id v7 = [(PXDiagnosticsHighlightCurationSettingsViewController *)self navigationController];
  id v6 = (id)[v7 popViewControllerAnimated:1];
}

- (void)_cancel:(id)a3
{
  id v4 = [(PXDiagnosticsHighlightCurationSettingsViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)_resetSettings:(id)a3
{
}

- (void)_applySettingsGlobally:(id)a3
{
  delegate = self->_delegate;
  id v4 = [(PXDiagnosticsHighlightCurationSettingsViewController *)self options];
  [(PXDiagnosticsHighlightCurationSettingsViewControllerDelegate *)delegate applySettings:v4 globally:1];
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"doIdenticalDeduping"];
  -[UISwitch setOn:](self->_doIdenticalDedupingSwitch, "setOn:", [v6 BOOLValue]);

  id v7 = [v5 objectForKeyedSubscript:@"identicalDedupingTimeInterval"];
  v8 = [v7 stringValue];
  [(UITextField *)self->_identicalDedupingTimeIntervalTextField setText:v8];

  v9 = [v5 objectForKeyedSubscript:@"identicalDedupingTimeIntervalForPeople"];
  v10 = [v9 stringValue];
  [(UITextField *)self->_identicalDedupingTimeIntervalForPeopleTextField setText:v10];

  v11 = [v5 objectForKeyedSubscript:@"identicalDedupingMaximumTimeGroupExtension"];
  v12 = [v11 stringValue];
  [(UITextField *)self->_identicalDedupingMaximumTimeGroupExtensionTextField setText:v12];

  v13 = [v5 objectForKeyedSubscript:@"maximumNumberOfItemsPerIdenticalCluster"];
  v14 = [v13 stringValue];
  [(UITextField *)self->_maximumNumberOfItemsPerIdenticalClusterTextField setText:v14];

  v15 = [v5 objectForKeyedSubscript:@"identicalDedupingThreshold"];
  v16 = [v15 stringValue];
  [(UITextField *)self->_identicalDedupingThresholdTextField setText:v16];

  v17 = [v5 objectForKeyedSubscript:@"identicalDedupingThresholdForPeople"];
  v18 = [v17 stringValue];
  [(UITextField *)self->_identicalDedupingThresholdForPeopleTextField setText:v18];

  v19 = [v5 objectForKeyedSubscript:@"identicalDedupingThresholdForBestItems"];
  v20 = [v19 stringValue];
  [(UITextField *)self->_identicalDedupingThresholdForBestItemsTextField setText:v20];

  v21 = [v5 objectForKeyedSubscript:@"useFaceprintsForIdenticalDeduping"];
  -[UISwitch setOn:](self->_useFaceprintsForIdenticalDedupingSwitch, "setOn:", [v21 BOOLValue]);

  v22 = [v5 objectForKeyedSubscript:@"identicalDedupingFaceprintDistance"];
  v23 = [v22 stringValue];
  [(UITextField *)self->_identicalDedupingFaceprintDistanceTextField setText:v23];

  v24 = [v5 objectForKeyedSubscript:@"doSemanticalDeduping"];
  -[UISwitch setOn:](self->_doSemanticalDedupingSwitch, "setOn:", [v24 BOOLValue]);

  v25 = [v5 objectForKeyedSubscript:@"semanticalDedupingTimeInterval"];
  v26 = [v25 stringValue];
  [(UITextField *)self->_semanticalDedupingTimeIntervalTextField setText:v26];

  v27 = [v5 objectForKeyedSubscript:@"semanticalDedupingTimeIntervalForPeople"];
  v28 = [v27 stringValue];
  [(UITextField *)self->_semanticalDedupingTimeIntervalForPeopleTextField setText:v28];

  v29 = [v5 objectForKeyedSubscript:@"semanticalDedupingTimeIntervalForPersons"];
  v30 = [v29 stringValue];
  [(UITextField *)self->_semanticalDedupingTimeIntervalForPersonsTextField setText:v30];

  v31 = [v5 objectForKeyedSubscript:@"semanticalDedupingMaximumTimeGroupExtension"];
  v32 = [v31 stringValue];
  [(UITextField *)self->_semanticalDedupingMaximumTimeGroupExtensionTextField setText:v32];

  v33 = [v5 objectForKeyedSubscript:@"maximumNumberOfItemsPerSemanticalCluster"];
  v34 = [v33 stringValue];
  [(UITextField *)self->_maximumNumberOfItemsPerSemanticalClusterTextField setText:v34];

  v35 = [v5 objectForKeyedSubscript:@"semanticalDedupingThreshold"];
  v36 = [v35 stringValue];
  [(UITextField *)self->_semanticalDedupingThresholdTextField setText:v36];

  v37 = [v5 objectForKeyedSubscript:@"semanticalDedupingThresholdForPeople"];
  v38 = [v37 stringValue];
  [(UITextField *)self->_semanticalDedupingThresholdForPeopleTextField setText:v38];

  v39 = [v5 objectForKeyedSubscript:@"semanticalDedupingThresholdForPersons"];
  v40 = [v39 stringValue];
  [(UITextField *)self->_semanticalDedupingThresholdForPersonsTextField setText:v40];

  v41 = [v5 objectForKeyedSubscript:@"dontSemanticallyDedupePeople"];
  -[UISwitch setOn:](self->_doNotSemanticallyDedupePeopleSwitch, "setOn:", [v41 BOOLValue]);

  v42 = [v5 objectForKeyedSubscript:@"dontSemanticallyDedupePersons"];
  -[UISwitch setOn:](self->_doNotSemanticallyDedupePersonsSwitch, "setOn:", [v42 BOOLValue]);

  v43 = [v5 objectForKeyedSubscript:@"allowAdaptiveForSemanticalDeduping"];
  -[UISwitch setOn:](self->_allowAdaptiveForSemanticalDedupingSwitch, "setOn:", [v43 BOOLValue]);

  v44 = [v5 objectForKeyedSubscript:@"useOnlyScenesForDeduping"];
  -[UISwitch setOn:](self->_useOnlyScenesForDedupingSwitch, "setOn:", [v44 BOOLValue]);

  v45 = [v5 objectForKeyedSubscript:@"useAllPersonsForDeduping"];
  -[UISwitch setOn:](self->_useAllPersonsForDedupingSwitch, "setOn:", [v45 BOOLValue]);

  v46 = [v5 objectForKeyedSubscript:@"useFaceQualityForElection"];
  -[UISwitch setOn:](self->_useFaceQualityForElectionSwitch, "setOn:", [v46 BOOLValue]);

  v47 = [v5 objectForKeyedSubscript:@"doNotDedupeVideos"];
  -[UISwitch setOn:](self->_doNotDedupeVideosSwitch, "setOn:", [v47 BOOLValue]);

  v48 = [v5 objectForKeyedSubscript:@"doNotDedupeInterestingPortraitsAndLivePictures"];
  -[UISwitch setOn:](self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch, "setOn:", [v48 BOOLValue]);

  v49 = [v5 objectForKeyedSubscript:@"onlyDedupeContiguousItems"];
  -[UISwitch setOn:](self->_onlyDedupeContiguousItemsSwitch, "setOn:", [v49 BOOLValue]);

  v50 = [v5 objectForKeyedSubscript:@"doDejunk"];
  -[UISwitch setOn:](self->_doDejunkSwitch, "setOn:", [v50 BOOLValue]);

  v51 = [v5 objectForKeyedSubscript:@"returnDedupedJunkIfOnlyJunk"];
  -[UISwitch setOn:](self->_returnDedupedJunkIfOnlyJunkSwitch, "setOn:", [v51 BOOLValue]);

  v52 = [v5 objectForKeyedSubscript:@"doFinalPass"];
  -[UISwitch setOn:](self->_doFinalPassSwitch, "setOn:", [v52 BOOLValue]);

  v53 = [v5 objectForKeyedSubscript:@"finalPassTimeInterval"];
  v54 = [v53 stringValue];
  [(UITextField *)self->_finalPassTimeIntervalTextField setText:v54];

  v55 = [v5 objectForKeyedSubscript:@"finalPassMaximumTimeGroupExtension"];
  v56 = [v55 stringValue];
  [(UITextField *)self->_finalPassMaximumTimeGroupExtensionTextField setText:v56];

  id v58 = [v5 objectForKeyedSubscript:@"finalPassDedupingThreshold"];
  v57 = [v58 stringValue];
  [(UITextField *)self->_finalPassDedupingThresholdTextField setText:v57];
}

- (NSDictionary)options
{
  v78[34] = *MEMORY[0x1E4F143B8];
  v77[0] = @"doIdenticalDeduping";
  v76 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_doIdenticalDedupingSwitch, "isOn"));
  v78[0] = v76;
  v77[1] = @"identicalDedupingTimeInterval";
  id v3 = NSNumber;
  v75 = [(UITextField *)self->_identicalDedupingTimeIntervalTextField text];
  [v75 doubleValue];
  v74 = objc_msgSend(v3, "numberWithDouble:");
  v78[1] = v74;
  v77[2] = @"identicalDedupingTimeIntervalForPeople";
  id v4 = NSNumber;
  v73 = [(UITextField *)self->_identicalDedupingTimeIntervalForPeopleTextField text];
  [v73 doubleValue];
  v72 = objc_msgSend(v4, "numberWithDouble:");
  v78[2] = v72;
  v77[3] = @"identicalDedupingMaximumTimeGroupExtension";
  id v5 = NSNumber;
  v71 = [(UITextField *)self->_identicalDedupingMaximumTimeGroupExtensionTextField text];
  [v71 doubleValue];
  v70 = objc_msgSend(v5, "numberWithDouble:");
  v78[3] = v70;
  v77[4] = @"maximumNumberOfItemsPerIdenticalCluster";
  id v6 = NSNumber;
  v69 = [(UITextField *)self->_maximumNumberOfItemsPerIdenticalClusterTextField text];
  v68 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v69, "integerValue"));
  v78[4] = v68;
  v77[5] = @"identicalDedupingThreshold";
  id v7 = NSNumber;
  v67 = [(UITextField *)self->_identicalDedupingThresholdTextField text];
  [v67 doubleValue];
  v66 = objc_msgSend(v7, "numberWithDouble:");
  v78[5] = v66;
  v77[6] = @"identicalDedupingThresholdForPeople";
  v8 = NSNumber;
  v65 = [(UITextField *)self->_identicalDedupingThresholdForPeopleTextField text];
  [v65 doubleValue];
  v64 = objc_msgSend(v8, "numberWithDouble:");
  v78[6] = v64;
  v77[7] = @"identicalDedupingThresholdForBestItems";
  v9 = NSNumber;
  v63 = [(UITextField *)self->_identicalDedupingThresholdForBestItemsTextField text];
  [v63 doubleValue];
  v62 = objc_msgSend(v9, "numberWithDouble:");
  v78[7] = v62;
  v77[8] = @"useFaceprintsForIdenticalDeduping";
  v61 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_useFaceprintsForIdenticalDedupingSwitch, "isOn"));
  v78[8] = v61;
  v77[9] = @"identicalDedupingFaceprintDistance";
  v10 = NSNumber;
  v60 = [(UITextField *)self->_identicalDedupingFaceprintDistanceTextField text];
  [v60 doubleValue];
  v59 = objc_msgSend(v10, "numberWithDouble:");
  v78[9] = v59;
  v77[10] = @"doSemanticalDeduping";
  id v58 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_doSemanticalDedupingSwitch, "isOn"));
  v78[10] = v58;
  v77[11] = @"semanticalDedupingTimeInterval";
  v11 = NSNumber;
  v57 = [(UITextField *)self->_semanticalDedupingTimeIntervalTextField text];
  [v57 doubleValue];
  v56 = objc_msgSend(v11, "numberWithDouble:");
  v78[11] = v56;
  v77[12] = @"semanticalDedupingTimeIntervalForPeople";
  v12 = NSNumber;
  v55 = [(UITextField *)self->_semanticalDedupingTimeIntervalForPeopleTextField text];
  [v55 doubleValue];
  v54 = objc_msgSend(v12, "numberWithDouble:");
  v78[12] = v54;
  v77[13] = @"semanticalDedupingTimeIntervalForPersons";
  v13 = NSNumber;
  v53 = [(UITextField *)self->_semanticalDedupingTimeIntervalForPersonsTextField text];
  [v53 doubleValue];
  v52 = objc_msgSend(v13, "numberWithDouble:");
  v78[13] = v52;
  v77[14] = @"semanticalDedupingMaximumTimeGroupExtension";
  v14 = NSNumber;
  v51 = [(UITextField *)self->_semanticalDedupingMaximumTimeGroupExtensionTextField text];
  [v51 doubleValue];
  v50 = objc_msgSend(v14, "numberWithDouble:");
  v78[14] = v50;
  v77[15] = @"maximumNumberOfItemsPerSemanticalCluster";
  v15 = NSNumber;
  v49 = [(UITextField *)self->_maximumNumberOfItemsPerSemanticalClusterTextField text];
  v48 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v49, "integerValue"));
  v78[15] = v48;
  v77[16] = @"semanticalDedupingThreshold";
  v16 = NSNumber;
  v47 = [(UITextField *)self->_semanticalDedupingThresholdTextField text];
  [v47 doubleValue];
  v46 = objc_msgSend(v16, "numberWithDouble:");
  v78[16] = v46;
  v77[17] = @"semanticalDedupingThresholdForPeople";
  v17 = NSNumber;
  v45 = [(UITextField *)self->_semanticalDedupingThresholdForPeopleTextField text];
  [v45 doubleValue];
  v44 = objc_msgSend(v17, "numberWithDouble:");
  v78[17] = v44;
  v77[18] = @"semanticalDedupingThresholdForPersons";
  v18 = NSNumber;
  v43 = [(UITextField *)self->_semanticalDedupingThresholdForPersonsTextField text];
  [v43 doubleValue];
  v42 = objc_msgSend(v18, "numberWithDouble:");
  v78[18] = v42;
  v77[19] = @"dontSemanticallyDedupePeople";
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_doNotSemanticallyDedupePeopleSwitch, "isOn"));
  v78[19] = v41;
  v77[20] = @"dontSemanticallyDedupePersons";
  v40 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_doNotSemanticallyDedupePersonsSwitch, "isOn"));
  v78[20] = v40;
  v77[21] = @"allowAdaptiveForSemanticalDeduping";
  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_allowAdaptiveForSemanticalDedupingSwitch, "isOn"));
  v78[21] = v39;
  v77[22] = @"useOnlyScenesForDeduping";
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_useOnlyScenesForDedupingSwitch, "isOn"));
  v78[22] = v38;
  v77[23] = @"useAllPersonsForDeduping";
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_useAllPersonsForDedupingSwitch, "isOn"));
  v78[23] = v37;
  v77[24] = @"useFaceQualityForElection";
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_useFaceQualityForElectionSwitch, "isOn"));
  v78[24] = v36;
  v77[25] = @"doNotDedupeVideos";
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_doNotDedupeVideosSwitch, "isOn"));
  v78[25] = v35;
  v77[26] = @"doNotDedupeInterestingPortraitsAndLivePictures";
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch, "isOn"));
  v78[26] = v34;
  v77[27] = @"onlyDedupeContiguousItems";
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_onlyDedupeContiguousItemsSwitch, "isOn"));
  v78[27] = v19;
  v77[28] = @"doDejunk";
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_doDejunkSwitch, "isOn"));
  v78[28] = v20;
  v77[29] = @"returnDedupedJunkIfOnlyJunk";
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_returnDedupedJunkIfOnlyJunkSwitch, "isOn"));
  v78[29] = v21;
  v77[30] = @"doFinalPass";
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[UISwitch isOn](self->_doFinalPassSwitch, "isOn"));
  v78[30] = v22;
  v77[31] = @"finalPassTimeInterval";
  v23 = NSNumber;
  v24 = [(UITextField *)self->_finalPassTimeIntervalTextField text];
  [v24 doubleValue];
  v25 = objc_msgSend(v23, "numberWithDouble:");
  v78[31] = v25;
  v77[32] = @"finalPassMaximumTimeGroupExtension";
  v26 = NSNumber;
  v27 = [(UITextField *)self->_finalPassMaximumTimeGroupExtensionTextField text];
  [v27 doubleValue];
  v28 = objc_msgSend(v26, "numberWithDouble:");
  v78[32] = v28;
  v77[33] = @"finalPassDedupingThreshold";
  v29 = NSNumber;
  v30 = [(UITextField *)self->_finalPassDedupingThresholdTextField text];
  [v30 doubleValue];
  v31 = objc_msgSend(v29, "numberWithDouble:");
  v78[33] = v31;
  id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:34];

  return (NSDictionary *)v33;
}

- (void)viewDidLoad
{
  v13[5] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PXDiagnosticsHighlightCurationSettingsViewController;
  [(PXDiagnosticsHighlightCurationSettingsViewController *)&v12 viewDidLoad];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
  id v4 = [(PXDiagnosticsHighlightCurationSettingsViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  id v6 = [(PXDiagnosticsHighlightCurationSettingsViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Apply Globally" style:0 target:self action:sel__applySettingsGlobally_];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Restore Defaults" style:0 target:self action:sel__resetSettings_];
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v7;
  v13[3] = v9;
  v13[4] = v7;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  [(PXDiagnosticsHighlightCurationSettingsViewController *)self setToolbarItems:v10];

  v11 = [(PXDiagnosticsHighlightCurationSettingsViewController *)self navigationController];
  [v11 setToolbarHidden:0 animated:1];
}

- (void)loadView
{
  UISwitch *returnDedupedJunkIfOnlyJunkSwitch;
  void *v106;
  UISwitch *v107;
  UISwitch *doFinalPassSwitch;
  void *v109;
  UITextField *v110;
  UITextField *finalPassTimeIntervalTextField;
  void *v112;
  UITextField *v113;
  UITextField *finalPassMaximumTimeGroupExtensionTextField;
  void *v115;
  UITextField *v116;
  UITextField *finalPassDedupingThresholdTextField;
  double v118;
  id v119;
  void v120[4];
  id v121;
  uint64_t *v122;
  double v123;
  void v124[4];
  id v125;
  uint64_t *v126;
  double v127;
  void aBlock[4];
  id v129;
  uint64_t *v130;
  double v131;
  uint64_t v132;
  double *v133;
  uint64_t v134;
  uint64_t v135;

  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 320.0, 480.0);
  [(PXDiagnosticsHighlightCurationSettingsViewController *)self setView:v3];
  id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = v3;
  [v5 frame];
  double v7 = v6;
  [v5 frame];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", 0.0, 10.0, v7, v8 + -10.0 + -20.0 + -26.0 + -10.0);
  [v9 setAutoresizingMask:18];
  [v9 setKeyboardDismissMode:1];
  [v5 addSubview:v9];
  v132 = 0;
  v133 = (double *)&v132;
  v134 = 0x2020000000;
  v135 = 0x4000000000000000;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke;
  aBlock[3] = &unk_1E5DC3210;
  v131 = v7;
  v130 = &v132;
  id v10 = v9;
  v129 = v10;
  v11 = (void (**)(void *, __CFString *, void *))_Block_copy(aBlock);
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke_2;
  v124[3] = &unk_1E5DC3238;
  v127 = v7;
  v126 = &v132;
  id v12 = v10;
  v125 = v12;
  v13 = (void (**)(void *, __CFString *, void *))_Block_copy(v124);
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke_3;
  v120[3] = &unk_1E5DC3260;
  v122 = &v132;
  v123 = v7;
  v119 = v12;
  v121 = v119;
  v14 = (void (**)(void *, __CFString *))_Block_copy(v120);
  v15 = self->_options;
  v14[2](v14, @"Identical Deduping");
  v16 = [(NSDictionary *)v15 objectForKeyedSubscript:@"doIdenticalDeduping"];
  v11[2](v11, @"Do Identical Deduping:", v16);
  v17 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doIdenticalDedupingSwitch = self->_doIdenticalDedupingSwitch;
  self->_doIdenticalDedupingSwitch = v17;

  v19 = [(NSDictionary *)v15 objectForKeyedSubscript:@"identicalDedupingTimeInterval"];
  v13[2](v13, @"Time Interval (s):", v19);
  v20 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingTimeIntervalTextField = self->_identicalDedupingTimeIntervalTextField;
  self->_identicalDedupingTimeIntervalTextField = v20;

  v22 = [(NSDictionary *)v15 objectForKeyedSubscript:@"identicalDedupingTimeIntervalForPeople"];
  v13[2](v13, @"People Time Interval (s):", v22);
  v23 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingTimeIntervalForPeopleTextField = self->_identicalDedupingTimeIntervalForPeopleTextField;
  self->_identicalDedupingTimeIntervalForPeopleTextField = v23;

  v25 = [(NSDictionary *)v15 objectForKeyedSubscript:@"identicalDedupingMaximumTimeGroupExtension"];
  v13[2](v13, @"Maximum Time Group Extension:", v25);
  v26 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingMaximumTimeGroupExtensionTextField = self->_identicalDedupingMaximumTimeGroupExtensionTextField;
  self->_identicalDedupingMaximumTimeGroupExtensionTextField = v26;

  v28 = [(NSDictionary *)v15 objectForKeyedSubscript:@"maximumNumberOfItemsPerIdenticalCluster"];
  v13[2](v13, @"Max Identical Cluster Size:", v28);
  v29 = (UITextField *)objc_claimAutoreleasedReturnValue();
  maximumNumberOfItemsPerIdenticalClusterTextField = self->_maximumNumberOfItemsPerIdenticalClusterTextField;
  self->_maximumNumberOfItemsPerIdenticalClusterTextField = v29;

  v31 = [(NSDictionary *)v15 objectForKeyedSubscript:@"identicalDedupingThreshold"];
  v13[2](v13, @"Threshold:", v31);
  v32 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingThresholdTextField = self->_identicalDedupingThresholdTextField;
  self->_identicalDedupingThresholdTextField = v32;

  v34 = [(NSDictionary *)v15 objectForKeyedSubscript:@"identicalDedupingThresholdForPeople"];
  v13[2](v13, @"People Threshold:", v34);
  v35 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingThresholdForPeopleTextField = self->_identicalDedupingThresholdForPeopleTextField;
  self->_identicalDedupingThresholdForPeopleTextField = v35;

  v37 = [(NSDictionary *)v15 objectForKeyedSubscript:@"identicalDedupingThresholdForBestItems"];
  v13[2](v13, @"Best Items Threshold:", v37);
  v38 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingThresholdForBestItemsTextField = self->_identicalDedupingThresholdForBestItemsTextField;
  self->_identicalDedupingThresholdForBestItemsTextField = v38;

  v40 = [(NSDictionary *)v15 objectForKeyedSubscript:@"useFaceprintsForIdenticalDeduping"];
  v11[2](v11, @"Use Faceprints:", v40);
  v41 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  useFaceprintsForIdenticalDedupingSwitch = self->_useFaceprintsForIdenticalDedupingSwitch;
  self->_useFaceprintsForIdenticalDedupingSwitch = v41;

  v43 = [(NSDictionary *)v15 objectForKeyedSubscript:@"identicalDedupingFaceprintDistance"];
  v13[2](v13, @"Faceprint Distance:", v43);
  v44 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingFaceprintDistanceTextField = self->_identicalDedupingFaceprintDistanceTextField;
  self->_identicalDedupingFaceprintDistanceTextField = v44;

  v14[2](v14, @"Semantical Deduping");
  v46 = [(NSDictionary *)v15 objectForKeyedSubscript:@"doSemanticalDeduping"];
  v11[2](v11, @"Do Semantical Deduping:", v46);
  v47 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doSemanticalDedupingSwitch = self->_doSemanticalDedupingSwitch;
  self->_doSemanticalDedupingSwitch = v47;

  v49 = [(NSDictionary *)v15 objectForKeyedSubscript:@"dontSemanticallyDedupePeople"];
  v11[2](v11, @"Disable People Deduping:", v49);
  v50 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doNotSemanticallyDedupePeopleSwitch = self->_doNotSemanticallyDedupePeopleSwitch;
  self->_doNotSemanticallyDedupePeopleSwitch = v50;

  v52 = [(NSDictionary *)v15 objectForKeyedSubscript:@"dontSemanticallyDedupePersons"];
  v11[2](v11, @"Disable Persons Deduping:", v52);
  v53 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doNotSemanticallyDedupePersonsSwitch = self->_doNotSemanticallyDedupePersonsSwitch;
  self->_doNotSemanticallyDedupePersonsSwitch = v53;

  v55 = [(NSDictionary *)v15 objectForKeyedSubscript:@"semanticalDedupingTimeInterval"];
  v13[2](v13, @"Time Interval (s):", v55);
  v56 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingTimeIntervalTextField = self->_semanticalDedupingTimeIntervalTextField;
  self->_semanticalDedupingTimeIntervalTextField = v56;

  id v58 = [(NSDictionary *)v15 objectForKeyedSubscript:@"semanticalDedupingTimeIntervalForPeople"];
  v13[2](v13, @"People Time Interval (s):", v58);
  v59 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingTimeIntervalForPeopleTextField = self->_semanticalDedupingTimeIntervalForPeopleTextField;
  self->_semanticalDedupingTimeIntervalForPeopleTextField = v59;

  v61 = [(NSDictionary *)v15 objectForKeyedSubscript:@"semanticalDedupingTimeIntervalForPersons"];
  v13[2](v13, @"Persons Time Interval (s):", v61);
  v62 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingTimeIntervalForPersonsTextField = self->_semanticalDedupingTimeIntervalForPersonsTextField;
  self->_semanticalDedupingTimeIntervalForPersonsTextField = v62;

  v64 = [(NSDictionary *)v15 objectForKeyedSubscript:@"semanticalDedupingMaximumTimeGroupExtension"];
  v13[2](v13, @"Maximum Time Group Extension:", v64);
  v65 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingMaximumTimeGroupExtensionTextField = self->_semanticalDedupingMaximumTimeGroupExtensionTextField;
  self->_semanticalDedupingMaximumTimeGroupExtensionTextField = v65;

  v67 = [(NSDictionary *)v15 objectForKeyedSubscript:@"maximumNumberOfItemsPerSemanticalCluster"];
  v13[2](v13, @"Max Semantical Cluster Size:", v67);
  v68 = (UITextField *)objc_claimAutoreleasedReturnValue();
  maximumNumberOfItemsPerSemanticalClusterTextField = self->_maximumNumberOfItemsPerSemanticalClusterTextField;
  self->_maximumNumberOfItemsPerSemanticalClusterTextField = v68;

  v70 = [(NSDictionary *)v15 objectForKeyedSubscript:@"semanticalDedupingThreshold"];
  v13[2](v13, @"Threshold:", v70);
  v71 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingThresholdTextField = self->_semanticalDedupingThresholdTextField;
  self->_semanticalDedupingThresholdTextField = v71;

  v73 = [(NSDictionary *)v15 objectForKeyedSubscript:@"semanticalDedupingThresholdForPeople"];
  v13[2](v13, @"People Threshold:", v73);
  v74 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingThresholdForPeopleTextField = self->_semanticalDedupingThresholdForPeopleTextField;
  self->_semanticalDedupingThresholdForPeopleTextField = v74;

  v76 = [(NSDictionary *)v15 objectForKeyedSubscript:@"semanticalDedupingThresholdForPersons"];
  v13[2](v13, @"Persons Threshold:", v76);
  v77 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingThresholdForPersonsTextField = self->_semanticalDedupingThresholdForPersonsTextField;
  self->_semanticalDedupingThresholdForPersonsTextField = v77;

  v79 = [(NSDictionary *)v15 objectForKeyedSubscript:@"allowAdaptiveForSemanticalDeduping"];
  v11[2](v11, @"Allow Adaptive For Semantical:", v79);
  v80 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  allowAdaptiveForSemanticalDedupingSwitch = self->_allowAdaptiveForSemanticalDedupingSwitch;
  self->_allowAdaptiveForSemanticalDedupingSwitch = v80;

  [(UISwitch *)self->_allowAdaptiveForSemanticalDedupingSwitch setEnabled:0];
  v14[2](v14, @"Misc. Deduping");
  v82 = [(NSDictionary *)v15 objectForKeyedSubscript:@"useOnlyScenesForDeduping"];
  v11[2](v11, @"Use Only Scenes:", v82);
  v83 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  useOnlyScenesForDedupingSwitch = self->_useOnlyScenesForDedupingSwitch;
  self->_useOnlyScenesForDedupingSwitch = v83;

  v85 = [(NSDictionary *)v15 objectForKeyedSubscript:@"useAllPersonsForDeduping"];
  v11[2](v11, @"Use All Persons:", v85);
  v86 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  useAllPersonsForDedupingSwitch = self->_useAllPersonsForDedupingSwitch;
  self->_useAllPersonsForDedupingSwitch = v86;

  v88 = [(NSDictionary *)v15 objectForKeyedSubscript:@"useFaceQualityForElection"];
  v11[2](v11, @"Use Face Quality for Election:", v88);
  v89 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  useFaceQualityForElectionSwitch = self->_useFaceQualityForElectionSwitch;
  self->_useFaceQualityForElectionSwitch = v89;

  v91 = [(NSDictionary *)v15 objectForKeyedSubscript:@"doNotDedupeVideos"];
  v11[2](v11, @"Don't Dedupe Videos:", v91);
  v92 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doNotDedupeVideosSwitch = self->_doNotDedupeVideosSwitch;
  self->_doNotDedupeVideosSwitch = v92;

  [(UISwitch *)self->_doNotDedupeVideosSwitch setEnabled:0];
  v94 = [(NSDictionary *)v15 objectForKeyedSubscript:@"doNotDedupeInterestingPortraitsAndLivePictures"];
  v11[2](v11, @"Don't Dedupe Portraits with Live:", v94);
  v95 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doNotDedupeInterestingPortraitsAndLivePicturesSwitch = self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch;
  self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch = v95;

  [(UISwitch *)self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch setEnabled:0];
  v97 = [(NSDictionary *)v15 objectForKeyedSubscript:@"onlyDedupeContiguousItems"];
  v11[2](v11, @"Only Contiguous Items:", v97);
  v98 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  onlyDedupeContiguousItemsSwitch = self->_onlyDedupeContiguousItemsSwitch;
  self->_onlyDedupeContiguousItemsSwitch = v98;

  [(UISwitch *)self->_onlyDedupeContiguousItemsSwitch setEnabled:0];
  v14[2](v14, @"Dejunking");
  v100 = [(NSDictionary *)v15 objectForKeyedSubscript:@"doDejunk"];
  v11[2](v11, @"Do Dejunking:", v100);
  v101 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doDejunkSwitch = self->_doDejunkSwitch;
  self->_doDejunkSwitch = v101;

  v103 = [(NSDictionary *)v15 objectForKeyedSubscript:@"returnDedupedJunkIfOnlyJunk"];
  v11[2](v11, @"Return Deduped Junk:", v103);
  v104 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  returnDedupedJunkIfOnlyJunkSwitch = self->_returnDedupedJunkIfOnlyJunkSwitch;
  self->_returnDedupedJunkIfOnlyJunkSwitch = v104;

  v14[2](v14, @"Final Pass");
  v106 = [(NSDictionary *)v15 objectForKeyedSubscript:@"doFinalPass"];
  v11[2](v11, @"Do Final Pass:", v106);
  v107 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doFinalPassSwitch = self->_doFinalPassSwitch;
  self->_doFinalPassSwitch = v107;

  v109 = [(NSDictionary *)v15 objectForKeyedSubscript:@"finalPassTimeInterval"];
  v13[2](v13, @"Final Pass Time Interval:", v109);
  v110 = (UITextField *)objc_claimAutoreleasedReturnValue();
  finalPassTimeIntervalTextField = self->_finalPassTimeIntervalTextField;
  self->_finalPassTimeIntervalTextField = v110;

  v112 = [(NSDictionary *)v15 objectForKeyedSubscript:@"finalPassMaximumTimeGroupExtension"];
  v13[2](v13, @"Maximum Time Group Extension:", v112);
  v113 = (UITextField *)objc_claimAutoreleasedReturnValue();
  finalPassMaximumTimeGroupExtensionTextField = self->_finalPassMaximumTimeGroupExtensionTextField;
  self->_finalPassMaximumTimeGroupExtensionTextField = v113;

  v115 = [(NSDictionary *)v15 objectForKeyedSubscript:@"finalPassDedupingThreshold"];
  v13[2](v13, @"Final Pass Deduping Threshold:", v115);
  v116 = (UITextField *)objc_claimAutoreleasedReturnValue();
  finalPassDedupingThresholdTextField = self->_finalPassDedupingThresholdTextField;
  self->_finalPassDedupingThresholdTextField = v116;

  [v119 frame];
  objc_msgSend(v119, "setContentSize:", v118, v133[3]);

  _Block_object_dispose(&v132, 8);
}

void __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1CD0];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 alloc];
  double v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v8 setAutoresizingMask:33];
  uint64_t v9 = [v5 BOOLValue];

  [v8 setOn:v9];
  [v8 frame];
  [v8 frame];
  PXRectWithOriginAndSize();
}

void __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1D70];
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_msgSend([v4 alloc], "initWithFrame:", 0.0, 0.0, 60.0, 26.0);
  [v7 setAutoresizingMask:33];
  double v8 = [v5 stringValue];

  [v7 setText:v8];
  [v7 setKeyboardType:8];
  [v7 frame];
  [v7 frame];
  PXRectWithOriginAndSize();
}

void __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke_3(uint64_t a1, void *a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + 8.0;
  id v3 = (objc_class *)MEMORY[0x1E4FB1930];
  id v4 = a2;
  id v11 = (id)objc_msgSend([v3 alloc], "initWithFrame:", 20.0, *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(double *)(a1 + 48) + -20.0 + -20.0, 26.0);
  [v11 setAutoresizingMask:34];
  id v5 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] systemFontSize];
  id v7 = [v5 boldSystemFontOfSize:v6 + 2.0];
  [v11 setFont:v7];

  double v8 = NSString;
  uint64_t v9 = [v4 uppercaseString];

  id v10 = [v8 stringWithFormat:@"-- %@ --", v9];
  [v11 setText:v10];

  [v11 setTextAlignment:1];
  [*(id *)(a1 + 32) addSubview:v11];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + 34.0;
}

- (PXDiagnosticsHighlightCurationSettingsViewController)initWithDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDiagnosticsHighlightCurationSettingsViewController;
  double v6 = [(PXDiagnosticsHighlightCurationSettingsViewController *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

@end