@interface COSAppearanceController
+ (void)setupAppearanceOverrides;
@end

@implementation COSAppearanceController

+ (void)setupAppearanceOverrides
{
  v2 = +[PSListController appearance];
  [v2 setExtendedLayoutIncludesOpaqueBars:1];

  v3 = +[PSListController appearance];
  [v3 setUsesDarkTheme:1];

  v4 = +[PSListController appearance];
  v5 = BPSBackgroundColor();
  [v4 setBackgroundColor:v5];

  v6 = +[PSListController appearance];
  v7 = BPSForegroundColor();
  [v6 setForegroundColor:v7];

  v8 = +[PSListController appearance];
  v9 = BPSTextColor();
  [v8 setTextColor:v9];

  v10 = +[PSListController appearance];
  v11 = BPSDetailTextColor();
  [v10 setAltTextColor:v11];

  v12 = +[PSListController appearance];
  v13 = BPSSeparatorColor();
  [v12 setSeparatorColor:v13];

  v14 = +[PSListController appearance];
  v15 = BPSEditablePlaceholderColor();
  [v14 setEditablePlaceholderTextColor:v15];

  v16 = +[PSListController appearance];
  v17 = BPSTextColor();
  [v16 setEditableTextColor:v17];

  v18 = +[PSListController appearance];
  v19 = BPSBridgeTintColor();
  [v18 setEditableInsertionPointColor:v19];

  v20 = +[PSListController appearance];
  v21 = BPSBridgeTintColor();
  [v20 setEditableSelectionBarColor:v21];

  v22 = +[PSListController appearance];
  v23 = BPSBridgeTintColor();
  v24 = [v23 colorWithAlphaComponent:0.2];
  [v22 setEditableSelectionHighlightColor:v24];

  v25 = +[PSListController appearance];
  v26 = BPSAccessoryColor();
  [v25 setCellAccessoryColor:v26];

  v27 = +[PSListController appearance];
  v28 = BPSCellHightlightColor();
  [v27 setCellHighlightColor:v28];

  v29 = +[PSListController appearance];
  v30 = BPSBridgeTintColor();
  [v29 setButtonTextColor:v30];

  v31 = +[PSListController appearance];
  v32 = BPSBridgeTintColor();
  [v31 setFooterHyperlinkColor:v32];

  uint64_t v162 = objc_opt_class();
  v33 = +[NSArray arrayWithObjects:&v162 count:1];
  v34 = +[UIButton appearanceWhenContainedInInstancesOfClasses:v33];
  v35 = BPSBridgeTintColor();
  [v34 setTintColor:v35];

  v161[0] = objc_opt_class();
  v161[1] = objc_opt_class();
  v36 = +[NSArray arrayWithObjects:v161 count:2];
  v37 = +[UILabel appearanceWhenContainedInInstancesOfClasses:v36];
  v38 = BPSDetailTextColor();
  [v37 setTextColor:v38];

  v39 = +[COSPairedDeviceListViewController appearance];
  v40 = BPSDevicePickerCellHighlightColor();
  [v39 setCellHighlightColor:v40];

  uint64_t v160 = objc_opt_class();
  v41 = +[NSArray arrayWithObjects:&v160 count:1];
  v42 = +[UISwitch appearanceWhenContainedInInstancesOfClasses:v41];
  v43 = BPSOffSwitchBorderColor();
  [v42 setTintColor:v43];

  v44 = +[PSListController appearance];
  v45 = BPSProgressBarTrackTintColor();
  v46 = [v45 colorWithAlphaComponent:1.0];
  [v44 setSegmentedSliderTrackColor:v46];

  uint64_t v159 = objc_opt_class();
  v47 = +[NSArray arrayWithObjects:&v159 count:1];
  v48 = +[UISlider appearanceWhenContainedInInstancesOfClasses:v47];
  v49 = BPSBridgeTintColor();
  [v48 setMinimumTrackTintColor:v49];

  uint64_t v158 = objc_opt_class();
  v50 = +[NSArray arrayWithObjects:&v158 count:1];
  v51 = +[UISlider appearanceWhenContainedInInstancesOfClasses:v50];
  v52 = BPSAccessoryColor();
  [v51 setMaximumTrackTintColor:v52];

  uint64_t v157 = objc_opt_class();
  v53 = +[NSArray arrayWithObjects:&v157 count:1];
  v54 = +[UITableViewCell appearanceWhenContainedInInstancesOfClasses:v53];
  v55 = BPSForegroundColor();
  [v54 setBackgroundColor:v55];

  uint64_t v156 = objc_opt_class();
  v56 = +[NSArray arrayWithObjects:&v156 count:1];
  v57 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v56];
  v58 = BPSBackgroundColor();
  [v57 setBackgroundColor:v58];

  uint64_t v155 = objc_opt_class();
  v59 = +[NSArray arrayWithObjects:&v155 count:1];
  v60 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v59];
  v61 = BPSSeparatorColor();
  [v60 setSeparatorColor:v61];

  uint64_t v154 = objc_opt_class();
  v62 = +[NSArray arrayWithObjects:&v154 count:1];
  v63 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v62];
  v64 = BPSTextColor();
  [v63 setSectionIndexColor:v64];

  uint64_t v153 = objc_opt_class();
  v65 = +[NSArray arrayWithObjects:&v153 count:1];
  v66 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v65];
  v67 = BPSForegroundColor();
  [v66 setSectionIndexBackgroundColor:v67];

  uint64_t v152 = objc_opt_class();
  v68 = +[NSArray arrayWithObjects:&v152 count:1];
  v69 = +[UITableViewCell appearanceWhenContainedInInstancesOfClasses:v68];
  v70 = BPSForegroundColor();
  [v69 setBackgroundColor:v70];

  uint64_t v151 = objc_opt_class();
  v71 = +[NSArray arrayWithObjects:&v151 count:1];
  v72 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v71];
  v73 = BPSBackgroundColor();
  [v72 setBackgroundColor:v73];

  uint64_t v150 = objc_opt_class();
  v74 = +[NSArray arrayWithObjects:&v150 count:1];
  v75 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v74];
  v76 = BPSSeparatorColor();
  [v75 setSeparatorColor:v76];

  uint64_t v149 = objc_opt_class();
  v77 = +[NSArray arrayWithObjects:&v149 count:1];
  v78 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v77];
  v79 = BPSTextColor();
  [v78 setSectionIndexColor:v79];

  uint64_t v148 = objc_opt_class();
  v80 = +[NSArray arrayWithObjects:&v148 count:1];
  v81 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v80];
  v82 = BPSForegroundColor();
  [v81 setSectionIndexBackgroundColor:v82];

  v83 = +[BPSMultipleWatchMigrationViewCell appearanceWhenContainedInInstancesOfClasses:&__NSArray0__struct];
  v84 = BPSForegroundColor();
  [v83 setBackgroundColor:v84];

  v85 = +[BPSMultipleWatchMigrationPickerTableView appearanceWhenContainedInInstancesOfClasses:&__NSArray0__struct];
  v86 = BPSBackgroundColor();
  [v85 setBackgroundColor:v86];

  v87 = +[BPSMultipleWatchMigrationPickerTableView appearanceWhenContainedInInstancesOfClasses:&__NSArray0__struct];
  v88 = BPSSeparatorColor();
  [v87 setSeparatorColor:v88];

  v89 = +[BPSMultipleWatchMigrationPickerTableView appearanceWhenContainedInInstancesOfClasses:&__NSArray0__struct];
  v90 = BPSTextColor();
  [v89 setSectionIndexColor:v90];

  v91 = +[BPSMultipleWatchMigrationPickerTableView appearanceWhenContainedInInstancesOfClasses:&__NSArray0__struct];
  v92 = BPSForegroundColor();
  [v91 setSectionIndexBackgroundColor:v92];

  uint64_t v147 = objc_opt_class();
  v93 = +[NSArray arrayWithObjects:&v147 count:1];
  v94 = +[UITableViewCell appearanceWhenContainedInInstancesOfClasses:v93];
  v95 = BPSForegroundColor();
  [v94 setBackgroundColor:v95];

  uint64_t v146 = objc_opt_class();
  v96 = +[NSArray arrayWithObjects:&v146 count:1];
  v97 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v96];
  v98 = BPSBackgroundColor();
  [v97 setBackgroundColor:v98];

  uint64_t v145 = objc_opt_class();
  v99 = +[NSArray arrayWithObjects:&v145 count:1];
  v100 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v99];
  v101 = BPSSeparatorColor();
  [v100 setSeparatorColor:v101];

  uint64_t v144 = objc_opt_class();
  v102 = +[NSArray arrayWithObjects:&v144 count:1];
  v103 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v102];
  v104 = BPSTextColor();
  [v103 setSectionIndexColor:v104];

  uint64_t v143 = objc_opt_class();
  v105 = +[NSArray arrayWithObjects:&v143 count:1];
  v106 = +[UITableView appearanceWhenContainedInInstancesOfClasses:v105];
  v107 = BPSForegroundColor();
  [v106 setSectionIndexBackgroundColor:v107];

  uint64_t v142 = objc_opt_class();
  v108 = +[NSArray arrayWithObjects:&v142 count:1];
  v109 = +[UITextField appearanceWhenContainedInInstancesOfClasses:v108];
  [v109 setKeyboardAppearance:1];

  uint64_t v141 = objc_opt_class();
  v110 = +[NSArray arrayWithObjects:&v141 count:1];
  v111 = +[UITextField appearanceWhenContainedInInstancesOfClasses:v110];
  [v111 setKeyboardAppearance:1];

  uint64_t v140 = objc_opt_class();
  v112 = +[NSArray arrayWithObjects:&v140 count:1];
  v113 = +[UITextField appearanceWhenContainedInInstancesOfClasses:v112];
  [v113 setKeyboardAppearance:1];

  uint64_t v139 = objc_opt_class();
  v114 = +[NSArray arrayWithObjects:&v139 count:1];
  v115 = +[UITextField appearanceWhenContainedInInstancesOfClasses:v114];
  [v115 setKeyboardAppearance:1];

  uint64_t v138 = objc_opt_class();
  v116 = +[NSArray arrayWithObjects:&v138 count:1];
  v117 = +[UIProgressView appearanceWhenContainedInInstancesOfClasses:v116];
  v118 = BPSProgressBarTintColor();
  [v117 setTintColor:v118];

  uint64_t v137 = objc_opt_class();
  v119 = +[NSArray arrayWithObjects:&v137 count:1];
  v120 = +[UIProgressView appearanceWhenContainedInInstancesOfClasses:v119];
  v121 = BPSProgressBarTintColor();
  [v120 setProgressTintColor:v121];

  uint64_t v136 = objc_opt_class();
  v122 = +[NSArray arrayWithObjects:&v136 count:1];
  v123 = +[UIProgressView appearanceWhenContainedInInstancesOfClasses:v122];
  v124 = BPSProgressBarTrackTintColor();
  [v123 setTrackTintColor:v124];

  uint64_t v135 = objc_opt_class();
  v125 = +[NSArray arrayWithObjects:&v135 count:1];
  v126 = +[UIButton appearanceWhenContainedInInstancesOfClasses:v125];
  v127 = BPSSetupTintColor();
  [v126 setTintColor:v127];

  uint64_t v134 = objc_opt_class();
  v128 = +[NSArray arrayWithObjects:&v134 count:1];
  v129 = +[UISearchBar appearanceWhenContainedInInstancesOfClasses:v128];
  v130 = BPSBridgeTintColor();
  [v129 setTintColor:v130];

  v133[0] = objc_opt_class();
  v133[1] = objc_opt_class();
  v131 = +[NSArray arrayWithObjects:v133 count:2];
  v132 = +[UITextField appearanceWhenContainedInInstancesOfClasses:](UITextField, "appearanceWhenContainedInInstancesOfClasses:", v131, v133[0]);
  [v132 setKeyboardAppearance:1];
}

@end