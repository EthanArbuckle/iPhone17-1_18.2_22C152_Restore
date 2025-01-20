@interface UIPrintFinishingsOption
- (BOOL)shouldShow;
- (NSArray)printerFinishingOptions;
- (UIPrintFinishingTemplatesOption)finishingTemplatesOption;
- (UIPrintFinishingsOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UITableView)finishingOptionsTableView;
- (id)summaryString;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)title;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)clearFinishingOptions;
- (void)currentPrinterChanged;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFinishingOptionsTableView:(id)a3;
- (void)setFinishingTemplatesOption:(id)a3;
- (void)setPrinterFinishingOptions:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintFinishingsOption

- (UIPrintFinishingsOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)UIPrintFinishingsOption;
  v4 = [(UIPrintOption *)&v17 initWithPrintInfo:a3 printPanelViewController:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(UIPrintOption *)v4 printInfo];
    [v6 addObserver:v5 forKeyPath:0x1F3C9DE58 options:0 context:0];

    v7 = [(UIPrintOption *)v5 printInfo];
    [v7 addObserver:v5 forKeyPath:0x1F3C9E0D8 options:0 context:0];

    v8 = [(UIPrintOption *)v5 printInfo];
    [v8 addObserver:v5 forKeyPath:0x1F3C9E0F8 options:0 context:0];

    v9 = [(UIPrintOption *)v5 printInfo];
    [v9 addObserver:v5 forKeyPath:0x1F3C9E118 options:0 context:0];

    v10 = [(UIPrintOption *)v5 printInfo];
    [v10 addObserver:v5 forKeyPath:0x1F3C9E138 options:0 context:0];

    v11 = [(UIPrintOption *)v5 printInfo];
    [v11 addObserver:v5 forKeyPath:0x1F3C9E158 options:0 context:0];

    v12 = [(UIPrintOption *)v5 printInfo];
    [v12 addObserver:v5 forKeyPath:0x1F3C9E178 options:0 context:0];

    v13 = [(UIPrintOption *)v5 printInfo];
    [v13 addObserver:v5 forKeyPath:0x1F3C9E198 options:0 context:0];

    v14 = [(UIPrintOption *)v5 printInfo];
    [v14 addObserver:v5 forKeyPath:0x1F3C9E1B8 options:0 context:0];

    v15 = [(UIPrintOption *)v5 printInfo];
    [v15 addObserver:v5 forKeyPath:0x1F3C9E1D8 options:0 context:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DE58];

  v4 = [(UIPrintOption *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9E0D8];

  v5 = [(UIPrintOption *)self printInfo];
  [v5 removeObserver:self forKeyPath:0x1F3C9E0F8];

  v6 = [(UIPrintOption *)self printInfo];
  [v6 removeObserver:self forKeyPath:0x1F3C9E118];

  v7 = [(UIPrintOption *)self printInfo];
  [v7 removeObserver:self forKeyPath:0x1F3C9E138];

  v8 = [(UIPrintOption *)self printInfo];
  [v8 removeObserver:self forKeyPath:0x1F3C9E158];

  v9 = [(UIPrintOption *)self printInfo];
  [v9 removeObserver:self forKeyPath:0x1F3C9E178];

  v10 = [(UIPrintOption *)self printInfo];
  [v10 removeObserver:self forKeyPath:0x1F3C9E198];

  v11 = [(UIPrintOption *)self printInfo];
  [v11 removeObserver:self forKeyPath:0x1F3C9E1B8];

  v12 = [(UIPrintOption *)self printInfo];
  [v12 removeObserver:self forKeyPath:0x1F3C9E1D8];

  v13.receiver = self;
  v13.super_class = (Class)UIPrintFinishingsOption;
  [(UIPrintFinishingsOption *)&v13 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__UIPrintFinishingsOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E6DA14F0;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __74__UIPrintFinishingsOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:0x1F3C9DE58]) {
    [*(id *)(a1 + 40) currentPrinterChanged];
  }
  [*(id *)(a1 + 40) updateFromPrintInfo];
  id v2 = [*(id *)(a1 + 40) summaryString];
  [*(id *)(a1 + 40) setSummary:v2];
}

- (BOOL)shouldShow
{
  v3 = [(UIPrintOption *)self printInfo];
  v4 = [v3 currentPrinter];
  v5 = [v4 printerInfoDict];
  if (v5)
  {
    v6 = [(UIPrintFinishingsOption *)self finishingTemplatesOption];
    if ([v6 shouldShow])
    {
      BOOL v7 = 1;
    }
    else
    {
      id v8 = [(UIPrintFinishingsOption *)self printerFinishingOptions];
      BOOL v7 = [v8 count] != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)currentPrinterChanged
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 setFinishingOption:0];

  [(UIPrintFinishingsOption *)self setPrinterFinishingOptions:0];
  v4 = [UIPrintFinishingTemplatesOption alloc];
  id v8 = [(UIPrintOption *)self printInfo];
  v5 = [(UIPrintOption *)self printPanelViewController];
  v6 = [(UIPrintFinishingsOption *)self finishingOptionsTableView];
  BOOL v7 = [(UIPrintFinishingTemplatesOption *)v4 initWithPrintInfo:v8 printPanelViewController:v5 finishingOptionsTableView:v6];
  [(UIPrintFinishingsOption *)self setFinishingTemplatesOption:v7];
}

- (void)updateFromPrintInfo
{
  v3 = [(UIPrintFinishingsOption *)self summaryString];
  [(UIPrintOption *)self setSummary:v3];

  id v4 = [(UIPrintFinishingsOption *)self finishingOptionsTableView];
  [v4 reloadData];
}

- (NSArray)printerFinishingOptions
{
  uint64_t v320 = *MEMORY[0x1E4F143B8];
  p_printerFinishingOptions = &self->_printerFinishingOptions;
  if (self->_printerFinishingOptions) {
    goto LABEL_118;
  }
  v3 = self;
  id v4 = [(UIPrintOption *)self printInfo];
  v5 = [v4 currentPrinter];
  v6 = [v5 printerInfoDict];

  if (!v6) {
    goto LABEL_118;
  }
  location = (id *)p_printerFinishingOptions;
  v312 = [MEMORY[0x1E4F1CA48] array];
  BOOL v7 = [(UIPrintOption *)v3 printInfo];
  id v8 = [v7 currentPrinter];
  v9 = [v8 printerFinishingOptions];

  v313 = v9;
  v311 = v3;
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:4];
    if ([v9 containsObject:v11])
    {
    }
    else
    {
      v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:20];
      int v13 = [v9 containsObject:v12];

      if (!v13) {
        goto LABEL_11;
      }
    }
    v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:20];
    int v15 = [v9 containsObject:v14];

    v16 = [UIPrintFinishingChoice alloc];
    objc_super v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = v17;
    if (v15)
    {
      v19 = [v17 localizedStringForKey:@"Single (Top-Left)" value:@"Single (Top-Left)" table:@"Localizable"];
      v20 = v16;
      v21 = v19;
      uint64_t v22 = 20;
    }
    else
    {
      v19 = [v17 localizedStringForKey:@"Automatic" value:@"Automatic" table:@"Localizable"];
      v20 = v16;
      v21 = v19;
      uint64_t v22 = 4;
    }
    v23 = [(UIPrintFinishingChoice *)v20 initWithTitle:v21 finishingChoiceID:v22 finishingChoiceInfo:0];
    [v10 addObject:v23];

    v9 = v313;
LABEL_11:
    v24 = [MEMORY[0x1E4F28ED0] numberWithInteger:21];
    int v25 = [v9 containsObject:v24];

    if (v25)
    {
      v26 = [UIPrintFinishingChoice alloc];
      v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"Single (Botttom-Left)" value:@"Single (Botttom-Left)" table:@"Localizable"];
      v29 = [(UIPrintFinishingChoice *)v26 initWithTitle:v28 finishingChoiceID:21 finishingChoiceInfo:0];
      [v10 addObject:v29];
    }
    v30 = [MEMORY[0x1E4F28ED0] numberWithInteger:28];
    int v31 = [v9 containsObject:v30];

    if (v31)
    {
      v32 = [UIPrintFinishingChoice alloc];
      v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v34 = [v33 localizedStringForKey:@"Double (Left)" value:@"Double (Left)" table:@"Localizable"];
      v35 = [(UIPrintFinishingChoice *)v32 initWithTitle:v34 finishingChoiceID:28 finishingChoiceInfo:0];
      [v10 addObject:v35];
    }
    v36 = [MEMORY[0x1E4F28ED0] numberWithInteger:29];
    int v37 = [v9 containsObject:v36];

    if (v37)
    {
      v38 = [UIPrintFinishingChoice alloc];
      v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v40 = [v39 localizedStringForKey:@"Double (Top)" value:@"Double (Top)" table:@"Localizable"];
      v41 = [(UIPrintFinishingChoice *)v38 initWithTitle:v40 finishingChoiceID:29 finishingChoiceInfo:0];
      [v10 addObject:v41];
    }
    v42 = [MEMORY[0x1E4F28ED0] numberWithInteger:31];
    int v43 = [v9 containsObject:v42];

    if (v43)
    {
      v44 = [UIPrintFinishingChoice alloc];
      v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v46 = [v45 localizedStringForKey:@"Double (Bottom)" value:@"Double (Bottom)" table:@"Localizable"];
      v47 = [(UIPrintFinishingChoice *)v44 initWithTitle:v46 finishingChoiceID:31 finishingChoiceInfo:0];
      [v10 addObject:v47];
    }
    v48 = [MEMORY[0x1E4F28ED0] numberWithInteger:32];
    int v49 = [v9 containsObject:v48];

    if (v49)
    {
      v50 = [UIPrintFinishingChoice alloc];
      v51 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v52 = [v51 localizedStringForKey:@"Triple (Left)" value:@"Triple (Left)" table:@"Localizable"];
      v53 = [(UIPrintFinishingChoice *)v50 initWithTitle:v52 finishingChoiceID:32 finishingChoiceInfo:0];
      [v10 addObject:v53];
    }
    v54 = [MEMORY[0x1E4F28ED0] numberWithInteger:33];
    int v55 = [v9 containsObject:v54];

    if (v55)
    {
      v56 = [UIPrintFinishingChoice alloc];
      v57 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v58 = [v57 localizedStringForKey:@"Triple (Top)" value:@"Triple (Top)" table:@"Localizable"];
      v59 = [(UIPrintFinishingChoice *)v56 initWithTitle:v58 finishingChoiceID:33 finishingChoiceInfo:0];
      [v10 addObject:v59];
    }
    v60 = [MEMORY[0x1E4F28ED0] numberWithInteger:35];
    int v61 = [v9 containsObject:v60];

    if (v61)
    {
      v62 = [UIPrintFinishingChoice alloc];
      v63 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v64 = [v63 localizedStringForKey:@"Triple (Bottom)" value:@"Triple (Bottom)" table:@"Localizable"];
      v65 = [(UIPrintFinishingChoice *)v62 initWithTitle:v64 finishingChoiceID:35 finishingChoiceInfo:0];
      [v10 addObject:v65];
    }
    v66 = [MEMORY[0x1E4F28ED0] numberWithInteger:7];
    if ([v9 containsObject:v66])
    {
    }
    else
    {
      v67 = [MEMORY[0x1E4F28ED0] numberWithInteger:50];
      int v68 = [v9 containsObject:v67];

      if (!v68) {
        goto LABEL_29;
      }
    }
    v69 = [UIPrintFinishingChoice alloc];
    v70 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v71 = [v70 localizedStringForKey:@"Bind (Left)" value:@"Bind (Left)" table:@"Localizable"];
    v72 = [(UIPrintFinishingChoice *)v69 initWithTitle:v71 finishingChoiceID:50 finishingChoiceInfo:0];
    [v10 addObject:v72];

LABEL_29:
    v73 = [MEMORY[0x1E4F28ED0] numberWithInteger:51];
    int v74 = [v9 containsObject:v73];

    if (v74)
    {
      v75 = [UIPrintFinishingChoice alloc];
      v76 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v77 = [v76 localizedStringForKey:@"Bind (Top)" value:@"Bind (Top)" table:@"Localizable"];
      v78 = [(UIPrintFinishingChoice *)v75 initWithTitle:v77 finishingChoiceID:51 finishingChoiceInfo:0];
      [v10 addObject:v78];
    }
    v79 = [MEMORY[0x1E4F28ED0] numberWithInteger:8];
    int v80 = [v9 containsObject:v79];

    if (v80)
    {
      v81 = [UIPrintFinishingChoice alloc];
      v82 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v83 = [v82 localizedStringForKey:@"Saddle Stitch" value:@"Saddle Stitch" table:@"Localizable"];
      v84 = [(UIPrintFinishingChoice *)v81 initWithTitle:v83 finishingChoiceID:8 finishingChoiceInfo:0];
      [v10 addObject:v84];
    }
    if ((unint64_t)[v10 count] >= 2)
    {
      v85 = [UIPrintFinishingChoice alloc];
      v86 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v87 = [v86 localizedStringForKey:@"No staple" value:@"No staple" table:@"Localizable"];
      v88 = [(UIPrintFinishingChoice *)v85 initWithTitle:v87 finishingChoiceID:0 finishingChoiceInfo:0];
      [v10 insertObject:v88 atIndex:0];
    }
    if ([v10 count])
    {
      BOOL v89 = (unint64_t)[v10 count] > 1;
      v90 = [UIPrinterFinishingOption alloc];
      v91 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v92 = [v91 localizedStringForKey:@"Staple" value:@"Staple" table:@"Localizable"];
      v93 = [(UIPrintOption *)v3 printPanelViewController];
      v94 = [(UIPrintFinishingsOption *)v3 finishingOptionsTableView];
      v95 = [(UIPrinterFinishingOption *)v90 initWithTitle:v92 finishingType:0 viewType:v89 optionChoices:v10 printPanelViewController:v93 finishingOptionsTableView:v94];
      [v312 addObject:v95];

      v9 = v313;
    }
    v96 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];

    v97 = [MEMORY[0x1E4F28ED0] numberWithInteger:5];
    if ([v9 containsObject:v97])
    {
    }
    else
    {
      v98 = [MEMORY[0x1E4F28ED0] numberWithInteger:70];
      int v99 = [v9 containsObject:v98];

      if (!v99)
      {
LABEL_44:
        v110 = [MEMORY[0x1E4F28ED0] numberWithInteger:71];
        int v111 = [v9 containsObject:v110];

        if (v111)
        {
          v112 = [UIPrintFinishingChoice alloc];
          v113 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v114 = [v113 localizedStringForKey:@"Single (Botttom-Left)" value:@"Single (Botttom-Left)" table:@"Localizable"];
          v115 = [(UIPrintFinishingChoice *)v112 initWithTitle:v114 finishingChoiceID:71 finishingChoiceInfo:0];
          [v96 addObject:v115];
        }
        v116 = [MEMORY[0x1E4F28ED0] numberWithInteger:74];
        int v117 = [v9 containsObject:v116];

        if (v117)
        {
          v118 = [UIPrintFinishingChoice alloc];
          v119 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v120 = [v119 localizedStringForKey:@"Double (Left)" value:@"Double (Left)" table:@"Localizable"];
          v121 = [(UIPrintFinishingChoice *)v118 initWithTitle:v120 finishingChoiceID:74 finishingChoiceInfo:0];
          [v96 addObject:v121];
        }
        v122 = [MEMORY[0x1E4F28ED0] numberWithInteger:75];
        int v123 = [v9 containsObject:v122];

        if (v123)
        {
          v124 = [UIPrintFinishingChoice alloc];
          v125 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v126 = [v125 localizedStringForKey:@"Double (Top)" value:@"Double (Top)" table:@"Localizable"];
          v127 = [(UIPrintFinishingChoice *)v124 initWithTitle:v126 finishingChoiceID:75 finishingChoiceInfo:0];
          [v96 addObject:v127];
        }
        v128 = [MEMORY[0x1E4F28ED0] numberWithInteger:77];
        int v129 = [v9 containsObject:v128];

        if (v129)
        {
          v130 = [UIPrintFinishingChoice alloc];
          v131 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v132 = [v131 localizedStringForKey:@"Double (Bottom)" value:@"Double (Bottom)" table:@"Localizable"];
          v133 = [(UIPrintFinishingChoice *)v130 initWithTitle:v132 finishingChoiceID:77 finishingChoiceInfo:0];
          [v96 addObject:v133];
        }
        v134 = [MEMORY[0x1E4F28ED0] numberWithInteger:78];
        int v135 = [v9 containsObject:v134];

        if (v135)
        {
          v136 = [UIPrintFinishingChoice alloc];
          v137 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v138 = [v137 localizedStringForKey:@"Triple (Left)" value:@"Triple (Left)" table:@"Localizable"];
          v139 = [(UIPrintFinishingChoice *)v136 initWithTitle:v138 finishingChoiceID:78 finishingChoiceInfo:0];
          [v96 addObject:v139];
        }
        v140 = [MEMORY[0x1E4F28ED0] numberWithInteger:79];
        int v141 = [v9 containsObject:v140];

        if (v141)
        {
          v142 = [UIPrintFinishingChoice alloc];
          v143 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v144 = [v143 localizedStringForKey:@"Triple (Top)" value:@"Triple (Top)" table:@"Localizable"];
          v145 = [(UIPrintFinishingChoice *)v142 initWithTitle:v144 finishingChoiceID:79 finishingChoiceInfo:0];
          [v96 addObject:v145];
        }
        v146 = [MEMORY[0x1E4F28ED0] numberWithInteger:81];
        int v147 = [v9 containsObject:v146];

        if (v147)
        {
          v148 = [UIPrintFinishingChoice alloc];
          v149 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v150 = [v149 localizedStringForKey:@"Triple (Bottom)" value:@"Triple (Bottom)" table:@"Localizable"];
          v151 = [(UIPrintFinishingChoice *)v148 initWithTitle:v150 finishingChoiceID:81 finishingChoiceInfo:0];
          [v96 addObject:v151];
        }
        v152 = [MEMORY[0x1E4F28ED0] numberWithInteger:82];
        int v153 = [v9 containsObject:v152];

        if (v153)
        {
          v154 = [UIPrintFinishingChoice alloc];
          v155 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v156 = [v155 localizedStringForKey:@"Quad (Left)" value:@"Quad (Left)" table:@"Localizable"];
          v157 = [(UIPrintFinishingChoice *)v154 initWithTitle:v156 finishingChoiceID:82 finishingChoiceInfo:0];
          [v96 addObject:v157];
        }
        v158 = [MEMORY[0x1E4F28ED0] numberWithInteger:83];
        int v159 = [v9 containsObject:v158];

        if (v159)
        {
          v160 = [UIPrintFinishingChoice alloc];
          v161 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v162 = [v161 localizedStringForKey:@"Quad (Top)" value:@"Quad (Top)" table:@"Localizable"];
          v163 = [(UIPrintFinishingChoice *)v160 initWithTitle:v162 finishingChoiceID:83 finishingChoiceInfo:0];
          [v96 addObject:v163];
        }
        v164 = [MEMORY[0x1E4F28ED0] numberWithInteger:85];
        int v165 = [v9 containsObject:v164];

        if (v165)
        {
          v166 = [UIPrintFinishingChoice alloc];
          v167 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v168 = [v167 localizedStringForKey:@"Quad (Bottom)" value:@"Quad (Bottom)" table:@"Localizable"];
          v169 = [(UIPrintFinishingChoice *)v166 initWithTitle:v168 finishingChoiceID:85 finishingChoiceInfo:0];
          [v96 addObject:v169];
        }
        if ((unint64_t)[v96 count] >= 2)
        {
          v170 = [UIPrintFinishingChoice alloc];
          v171 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v172 = [v171 localizedStringForKey:@"No punch" value:@"No punch" table:@"Localizable"];
          v173 = [(UIPrintFinishingChoice *)v170 initWithTitle:v172 finishingChoiceID:0 finishingChoiceInfo:0];
          [v96 insertObject:v173 atIndex:0];
        }
        if ([v96 count])
        {
          BOOL v174 = (unint64_t)[v96 count] > 1;
          v175 = [UIPrinterFinishingOption alloc];
          v176 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v177 = [v176 localizedStringForKey:@"Punch" value:@"Punch" table:@"Localizable"];
          v178 = [(UIPrintOption *)v311 printPanelViewController];
          v179 = [(UIPrintFinishingsOption *)v311 finishingOptionsTableView];
          v180 = [(UIPrinterFinishingOption *)v175 initWithTitle:v177 finishingType:1 viewType:v174 optionChoices:v96 printPanelViewController:v178 finishingOptionsTableView:v179];
          [v312 addObject:v180];

          v9 = v313;
        }
        v181 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];

        v182 = [MEMORY[0x1E4F28ED0] numberWithInteger:90];
        int v183 = [v9 containsObject:v182];

        if (v183)
        {
          v184 = [UIPrintFinishingChoice alloc];
          v185 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v186 = [v185 localizedStringForKey:@"Accordion" value:@"Accordion" table:@"Localizable"];
          v187 = [(UIPrintFinishingChoice *)v184 initWithTitle:v186 finishingChoiceID:90 finishingChoiceInfo:0];
          [v181 addObject:v187];
        }
        v188 = [MEMORY[0x1E4F28ED0] numberWithInteger:91];
        int v189 = [v9 containsObject:v188];

        if (v189)
        {
          v190 = [UIPrintFinishingChoice alloc];
          v191 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v192 = [v191 localizedStringForKey:@"Double Gate" value:@"Double Gate" table:@"Localizable"];
          v193 = [(UIPrintFinishingChoice *)v190 initWithTitle:v192 finishingChoiceID:91 finishingChoiceInfo:0];
          [v181 addObject:v193];
        }
        v194 = [MEMORY[0x1E4F28ED0] numberWithInteger:92];
        int v195 = [v9 containsObject:v194];

        if (v195)
        {
          v196 = [UIPrintFinishingChoice alloc];
          v197 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v198 = [v197 localizedStringForKey:@"Gate" value:@"Gate" table:@"Localizable"];
          v199 = [(UIPrintFinishingChoice *)v196 initWithTitle:v198 finishingChoiceID:92 finishingChoiceInfo:0];
          [v181 addObject:v199];
        }
        v200 = [MEMORY[0x1E4F28ED0] numberWithInteger:93];
        int v201 = [v9 containsObject:v200];

        if (v201)
        {
          v202 = [UIPrintFinishingChoice alloc];
          v203 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v204 = [v203 localizedStringForKey:@"Half" value:@"Half" table:@"Localizable"];
          v205 = [(UIPrintFinishingChoice *)v202 initWithTitle:v204 finishingChoiceID:93 finishingChoiceInfo:0];
          [v181 addObject:v205];
        }
        v206 = [MEMORY[0x1E4F28ED0] numberWithInteger:94];
        int v207 = [v9 containsObject:v206];

        if (v207)
        {
          v208 = [UIPrintFinishingChoice alloc];
          v209 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v210 = [v209 localizedStringForKey:@"Half Z" value:@"Half Z" table:@"Localizable"];
          v211 = [(UIPrintFinishingChoice *)v208 initWithTitle:v210 finishingChoiceID:94 finishingChoiceInfo:0];
          [v181 addObject:v211];
        }
        v212 = [MEMORY[0x1E4F28ED0] numberWithInteger:95];
        int v213 = [v9 containsObject:v212];

        if (v213)
        {
          v214 = [UIPrintFinishingChoice alloc];
          v215 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v216 = [v215 localizedStringForKey:@"Left Gate" value:@"Left Gate" table:@"Localizable"];
          v217 = [(UIPrintFinishingChoice *)v214 initWithTitle:v216 finishingChoiceID:95 finishingChoiceInfo:0];
          [v181 addObject:v217];
        }
        v218 = [MEMORY[0x1E4F28ED0] numberWithInteger:96];
        int v219 = [v9 containsObject:v218];

        if (v219)
        {
          v220 = [UIPrintFinishingChoice alloc];
          v221 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v222 = [v221 localizedStringForKey:@"Letter" value:@"Letter" table:@"Localizable"];
          v223 = [(UIPrintFinishingChoice *)v220 initWithTitle:v222 finishingChoiceID:96 finishingChoiceInfo:0];
          [v181 addObject:v223];
        }
        v224 = [MEMORY[0x1E4F28ED0] numberWithInteger:97];
        int v225 = [v9 containsObject:v224];

        if (v225)
        {
          v226 = [UIPrintFinishingChoice alloc];
          v227 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v228 = [v227 localizedStringForKey:@"Parallel" value:@"Parallel" table:@"Localizable"];
          v229 = [(UIPrintFinishingChoice *)v226 initWithTitle:v228 finishingChoiceID:97 finishingChoiceInfo:0];
          [v181 addObject:v229];
        }
        v230 = [MEMORY[0x1E4F28ED0] numberWithInteger:98];
        int v231 = [v9 containsObject:v230];

        if (v231)
        {
          v232 = [UIPrintFinishingChoice alloc];
          v233 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v234 = [v233 localizedStringForKey:@"Poster" value:@"Poster" table:@"Localizable"];
          v235 = [(UIPrintFinishingChoice *)v232 initWithTitle:v234 finishingChoiceID:98 finishingChoiceInfo:0];
          [v181 addObject:v235];
        }
        v236 = [MEMORY[0x1E4F28ED0] numberWithInteger:99];
        int v237 = [v9 containsObject:v236];

        if (v237)
        {
          v238 = [UIPrintFinishingChoice alloc];
          v239 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v240 = [v239 localizedStringForKey:@"Right Gate" value:@"Right Gate" table:@"Localizable"];
          v241 = [(UIPrintFinishingChoice *)v238 initWithTitle:v240 finishingChoiceID:99 finishingChoiceInfo:0];
          [v181 addObject:v241];
        }
        v242 = [MEMORY[0x1E4F28ED0] numberWithInteger:100];
        int v243 = [v9 containsObject:v242];

        if (v243)
        {
          v244 = [UIPrintFinishingChoice alloc];
          v245 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v246 = [v245 localizedStringForKey:@"Z-Fold" value:@"Z-Fold" table:@"Localizable"];
          v247 = [(UIPrintFinishingChoice *)v244 initWithTitle:v246 finishingChoiceID:100 finishingChoiceInfo:0];
          [v181 addObject:v247];
        }
        if ((unint64_t)[v181 count] >= 2)
        {
          v248 = [UIPrintFinishingChoice alloc];
          v249 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v250 = [v249 localizedStringForKey:@"No fold" value:@"No fold" table:@"Localizable"];
          v251 = [(UIPrintFinishingChoice *)v248 initWithTitle:v250 finishingChoiceID:0 finishingChoiceInfo:0];
          [v181 insertObject:v251 atIndex:0];
        }
        if ([v181 count])
        {
          BOOL v252 = (unint64_t)[v181 count] > 1;
          v253 = [UIPrinterFinishingOption alloc];
          v254 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v255 = [v254 localizedStringForKey:@"Fold" value:@"Fold" table:@"Localizable"];
          v256 = [(UIPrintOption *)v311 printPanelViewController];
          v257 = [(UIPrintFinishingsOption *)v311 finishingOptionsTableView];
          v258 = [(UIPrinterFinishingOption *)v253 initWithTitle:v255 finishingType:2 viewType:v252 optionChoices:v181 printPanelViewController:v256 finishingOptionsTableView:v257];
          [v312 addObject:v258];

          v9 = v313;
        }
        v259 = [MEMORY[0x1E4F28ED0] numberWithInteger:16];
        int v260 = [v9 containsObject:v259];

        if (v260)
        {
          v261 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];

          v262 = [UIPrintFinishingChoice alloc];
          v263 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v264 = [v263 localizedStringForKey:@"Laminate" value:@"Laminate" table:@"Localizable"];
          v265 = [(UIPrintFinishingChoice *)v262 initWithTitle:v264 finishingChoiceID:16 finishingChoiceInfo:0];
          [v261 addObject:v265];

          v266 = [UIPrinterFinishingOption alloc];
          v267 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v268 = [v267 localizedStringForKey:@"Laminate" value:@"Laminate" table:@"Localizable"];
          v269 = [(UIPrintOption *)v311 printPanelViewController];
          v270 = [(UIPrintFinishingsOption *)v311 finishingOptionsTableView];
          v271 = [(UIPrinterFinishingOption *)v266 initWithTitle:v268 finishingType:3 viewType:0 optionChoices:v261 printPanelViewController:v269 finishingOptionsTableView:v270];
          [v312 addObject:v271];

          v9 = v313;
          v181 = v261;
        }
        v272 = [MEMORY[0x1E4F28ED0] numberWithInteger:15];
        int v273 = [v9 containsObject:v272];

        if (v273)
        {
          v274 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];

          v275 = [UIPrintFinishingChoice alloc];
          v276 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v277 = [v276 localizedStringForKey:@"Coat" value:@"Coat" table:@"Localizable"];
          v278 = [(UIPrintFinishingChoice *)v275 initWithTitle:v277 finishingChoiceID:15 finishingChoiceInfo:0];
          [v274 addObject:v278];

          v279 = [UIPrinterFinishingOption alloc];
          v280 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v281 = [v280 localizedStringForKey:@"Coat" value:@"Coat" table:@"Localizable"];
          v3 = v311;
          v282 = [(UIPrintOption *)v311 printPanelViewController];
          v283 = [(UIPrintFinishingsOption *)v311 finishingOptionsTableView];
          v284 = [(UIPrinterFinishingOption *)v279 initWithTitle:v281 finishingType:4 viewType:0 optionChoices:v274 printPanelViewController:v282 finishingOptionsTableView:v283];
          [v312 addObject:v284];

          v181 = v274;
        }
        else
        {
          v3 = v311;
        }

        goto LABEL_100;
      }
    }
    v100 = [MEMORY[0x1E4F28ED0] numberWithInteger:70];
    int v101 = [v9 containsObject:v100];

    v102 = [UIPrintFinishingChoice alloc];
    v103 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v104 = v103;
    if (v101)
    {
      v105 = [v103 localizedStringForKey:@"Single (Top-Left)" value:@"Single (Top-Left)" table:@"Localizable"];
      v106 = v102;
      v107 = v105;
      uint64_t v108 = 70;
    }
    else
    {
      v105 = [v103 localizedStringForKey:@"Automatic" value:@"Automatic" table:@"Localizable"];
      v106 = v102;
      v107 = v105;
      uint64_t v108 = 5;
    }
    v109 = [(UIPrintFinishingChoice *)v106 initWithTitle:v107 finishingChoiceID:v108 finishingChoiceInfo:0];
    [v96 addObject:v109];

    v9 = v313;
    goto LABEL_44;
  }
LABEL_100:
  v285 = [(UIPrintOption *)v3 printInfo];
  v286 = [v285 currentPrinter];
  v287 = [v286 outputBins];

  if (v287)
  {
    v288 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    long long v315 = 0u;
    long long v316 = 0u;
    long long v317 = 0u;
    long long v318 = 0u;
    v309 = v287;
    id obj = v287;
    uint64_t v289 = [obj countByEnumeratingWithState:&v315 objects:v319 count:16];
    if (v289)
    {
      uint64_t v290 = v289;
      uint64_t v291 = *(void *)v316;
      do
      {
        for (uint64_t i = 0; i != v290; ++i)
        {
          if (*(void *)v316 != v291) {
            objc_enumerationMutation(obj);
          }
          v293 = *(void **)(*((void *)&v315 + 1) + 8 * i);
          v294 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v295 = [v293 objectForKeyedSubscript:@"OutputBinChoice"];
          v296 = [v293 objectForKeyedSubscript:@"OutputBinChoice"];
          v297 = [v294 localizedStringForKey:v295 value:v296 table:@"Localizable"];

          v298 = [[UIPrintFinishingChoice alloc] initWithTitle:v297 finishingChoiceID:3 finishingChoiceInfo:v293];
          v299 = [v293 objectForKey:@"DefaultOutputBin"];

          if (v299) {
            [v288 insertObject:v298 atIndex:0];
          }
          else {
            [v288 addObject:v298];
          }
        }
        uint64_t v290 = [obj countByEnumeratingWithState:&v315 objects:v319 count:16];
      }
      while (v290);
    }

    if ((unint64_t)[v288 count] >= 2)
    {
      v300 = [UIPrinterFinishingOption alloc];
      v301 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v302 = [v301 localizedStringForKey:@"Output Bins" value:@"Output Bins" table:@"Localizable"];
      v303 = [(UIPrintOption *)v311 printPanelViewController];
      v304 = [(UIPrintFinishingsOption *)v311 finishingOptionsTableView];
      v305 = [(UIPrinterFinishingOption *)v300 initWithTitle:v302 finishingType:6 viewType:1 optionChoices:v288 printPanelViewController:v303 finishingOptionsTableView:v304];
      [v312 addObject:v305];
    }
    v287 = v309;
  }
  if (objc_msgSend(v312, "count", v309)) {
    v306 = v312;
  }
  else {
    v306 = 0;
  }
  p_printerFinishingOptions = (NSArray **)location;
  objc_storeStrong(location, v306);

LABEL_118:
  v307 = *p_printerFinishingOptions;
  return v307;
}

- (void)clearFinishingOptions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(UIPrintOption *)self printInfo];
  [v3 setStaple:0];

  id v4 = [(UIPrintOption *)self printInfo];
  [v4 setPunch:0];

  v5 = [(UIPrintOption *)self printInfo];
  [v5 setFold:0];

  v6 = [(UIPrintOption *)self printInfo];
  [v6 setLaminate:0];

  BOOL v7 = [(UIPrintOption *)self printInfo];
  [v7 setCoat:0];

  id v8 = [(UIPrintOption *)self printInfo];
  [v8 setFinishingTemplate:0];

  v9 = [(UIPrintFinishingsOption *)self finishingTemplatesOption];
  [v9 setSelectedTemplate:0];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = [(UIPrintFinishingsOption *)self printerFinishingOptions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setSelectedChoice:0];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (UITableView)finishingOptionsTableView
{
  finishingOptionsTableView = self->_finishingOptionsTableView;
  if (!finishingOptionsTableView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1D00]);
    v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_finishingOptionsTableView;
    self->_finishingOptionsTableView = v5;

    [(UITableView *)self->_finishingOptionsTableView setDataSource:self];
    [(UITableView *)self->_finishingOptionsTableView setDelegate:self];
    [(UITableView *)self->_finishingOptionsTableView setEstimatedSectionHeaderHeight:8.0];
    finishingOptionsTableView = self->_finishingOptionsTableView;
  }
  return finishingOptionsTableView;
}

- (id)title
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"Finishing Options" value:@"Finishing Options" table:@"Localizable"];

  return v3;
}

- (id)summaryString
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(UIPrintOption *)self printInfo];
  uint64_t v4 = [v3 finishingOption];

  if (v4 == 1)
  {
    v5 = [(UIPrintFinishingsOption *)self finishingTemplatesOption];
    id v14 = [v5 summary];
    goto LABEL_18;
  }
  if (v4 != 2)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = [v5 localizedStringForKey:@"No finishing chosen" value:@"No finishing chosen" table:@"Localizable"];
    goto LABEL_18;
  }
  v5 = [MEMORY[0x1E4F28E78] stringWithCapacity:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = [(UIPrintFinishingsOption *)self printerFinishingOptions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
        uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) summary];
        if (v11)
        {
          if ([v5 length])
          {
            uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            uint64_t v13 = [v12 localizedStringForKey:@" • " value:@" • " table:@"Localizable"];
            [v5 appendString:v13];
          }
          [v5 appendString:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  if ([v5 length])
  {
    id v14 = v5;
LABEL_18:
    long long v15 = v14;
    goto LABEL_19;
  }
  long long v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v15 = [v17 localizedStringForKey:@"No finishing option summary" value:@"No finishing option summary" table:@"Localizable"];

LABEL_19:
  return v15;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(UIPrintOption *)self printInfo];
  if ([v3 finishingOption]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
  {
    v5 = [(UIPrintOption *)self printInfo];
    if ([v5 finishingOption] == 1)
    {
      int64_t v6 = 1;
    }
    else
    {
      uint64_t v12 = [(UIPrintFinishingsOption *)self printerFinishingOptions];
      int64_t v6 = [v12 count];
    }
  }
  else
  {
    uint64_t v7 = [(UIPrintFinishingsOption *)self finishingTemplatesOption];
    int v8 = [v7 shouldShow];

    if (v8) {
      int64_t v9 = 2;
    }
    else {
      int64_t v9 = 1;
    }
    id v10 = [(UIPrintFinishingsOption *)self printerFinishingOptions];
    uint64_t v11 = [v10 count];

    if (v11) {
      return v9 + 1;
    }
    else {
      return v9;
    }
  }
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    int v8 = [(UIPrintOption *)self printInfo];
    uint64_t v9 = [v8 finishingOption];

    if (v9 == 1)
    {
      id v10 = [v6 dequeueReusableCellWithIdentifier:@"UIPrintOptionListCell"];
      if (!v10) {
        id v10 = [[UIPrintOptionListCell alloc] initWithStyle:1 reuseIdentifier:@"UIPrintOptionListCell"];
      }
      uint64_t v11 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"Finishing Template" value:@"Finishing Template" table:@"Localizable"];
      [v11 setText:v13];

      id v14 = [(UIPrintFinishingsOption *)self finishingTemplatesOption];
      long long v15 = [v14 summary];
      [v11 setSecondaryText:v15];

      [(UIPrintOptionListCell *)v10 setContentConfiguration:v11];
      [(UIPrintOptionListCell *)v10 setAccessoryType:1];
      [(UIPrintOptionListCell *)v10 setSelectionStyle:3];
      long long v16 = [(UIPrintFinishingsOption *)self finishingTemplatesOption];
      [(UIPrintOptionListCell *)v10 setItemListDelegate:v16];

      long long v17 = [(UIPrintFinishingsOption *)self finishingTemplatesOption];
      [v17 setFinishingTemplatesCell:v10];
    }
    else
    {
      v26 = [(UIPrintFinishingsOption *)self printerFinishingOptions];
      uint64_t v11 = objc_msgSend(v26, "objectAtIndex:", objc_msgSend(v7, "row"));

      if ([v11 viewType])
      {
        id v10 = [v6 dequeueReusableCellWithIdentifier:@"UIPrintOptionListCell"];
        if (!v10) {
          id v10 = [[UIPrintOptionListCell alloc] initWithStyle:1 reuseIdentifier:@"UIPrintOptionListCell"];
        }
        [(UIPrintOptionListCell *)v10 setAccessoryType:1];
        [(UIPrintOptionListCell *)v10 setSelectionStyle:3];
        [(UIPrintOptionListCell *)v10 setItemListDelegate:v11];
        v27 = [v11 optionChoices];
        v28 = objc_msgSend(v27, "objectAtIndex:", objc_msgSend(v11, "selectedChoice"));

        v29 = [v28 title];
      }
      else
      {
        id v10 = [v6 dequeueReusableCellWithIdentifier:@"UIPrintOptionCell"];
        if (!v10) {
          id v10 = [[UIPrintOptionCell alloc] initWithStyle:1 reuseIdentifier:@"UIPrintOptionCell"];
        }
        [(UIPrintOptionListCell *)v10 setSelectionStyle:0];
        v28 = createPrintKitUISwitch(*MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        objc_msgSend(v28, "setOn:", objc_msgSend(v11, "selectedChoice") != 0);
        [v28 addTarget:v11 action:sel_updateSwitchValue_ forControlEvents:4096];
        [(UIPrintOptionListCell *)v10 setAccessoryView:v28];
        v29 = 0;
      }
      [v11 setPrinterFinishingOptionCell:v10];

      v32 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
      v33 = [v11 title];
      [v32 setText:v33];

      [v32 setSecondaryText:v29];
      [(UIPrintOptionListCell *)v10 setContentConfiguration:v32];
    }
  }
  else
  {
    id v10 = [v6 dequeueReusableCellWithIdentifier:@"UIPrintOptionCell"];
    if (!v10) {
      id v10 = [[UIPrintOptionCell alloc] initWithStyle:0 reuseIdentifier:@"UIPrintOptionCell"];
    }
    uint64_t v11 = [MEMORY[0x1E4FB1948] cellConfiguration];
    if ([v7 row])
    {
      if ([v7 row] == 1)
      {
        long long v18 = [(UIPrintFinishingsOption *)self finishingTemplatesOption];
        int v19 = [v18 shouldShow];

        long long v20 = [(UIPrintOption *)self printInfo];
        uint64_t v21 = [v20 finishingOption];

        uint64_t v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v23 = v22;
        if (v19)
        {
          BOOL v24 = v21 == 1;
          int v25 = @"Finishing Templates";
        }
        else
        {
          BOOL v24 = v21 == 2;
          int v25 = @"Printer Options";
        }
      }
      else
      {
        int v31 = [(UIPrintOption *)self printInfo];
        BOOL v24 = [v31 finishingOption] == 2;

        uint64_t v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v23 = v22;
        int v25 = @"Printer Options";
      }
    }
    else
    {
      v30 = [(UIPrintOption *)self printInfo];
      BOOL v24 = [v30 finishingOption] == 0;

      uint64_t v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v23 = v22;
      int v25 = @"No finishing option";
    }
    v34 = [v22 localizedStringForKey:v25 value:v25 table:@"Localizable"];
    [v11 setText:v34];

    [(UIPrintOptionListCell *)v10 setSelectionStyle:3];
    [(UIPrintOptionListCell *)v10 setContentConfiguration:v11];
    if (v24) {
      uint64_t v35 = 3;
    }
    else {
      uint64_t v35 = 0;
    }
    [(UIPrintOptionListCell *)v10 setAccessoryType:v35];
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v6 section])
  {
    id v7 = [v13 cellForRowAtIndexPath:v6];
    [v7 printOptionCellTapped];
    [v7 setSelected:0];
  }
  else
  {
    [(UIPrintFinishingsOption *)self clearFinishingOptions];
    if ([v6 row])
    {
      if ([v6 row] == 1)
      {
        id v7 = [(UIPrintFinishingsOption *)self finishingTemplatesOption];
        if ([v7 shouldShow]) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = 2;
        }
        uint64_t v9 = [(UIPrintOption *)self printInfo];
        [v9 setFinishingOption:v8];

        goto LABEL_12;
      }
      id v10 = [(UIPrintOption *)self printInfo];
      id v7 = v10;
      uint64_t v11 = 2;
    }
    else
    {
      id v10 = [(UIPrintOption *)self printInfo];
      id v7 = v10;
      uint64_t v11 = 0;
    }
    [v10 setFinishingOption:v11];
  }
LABEL_12:

  uint64_t v12 = [(UIPrintFinishingsOption *)self summaryString];
  [(UIPrintOption *)self setSummary:v12];
}

- (void)setPrinterFinishingOptions:(id)a3
{
}

- (void)setFinishingOptionsTableView:(id)a3
{
}

- (UIPrintFinishingTemplatesOption)finishingTemplatesOption
{
  return self->_finishingTemplatesOption;
}

- (void)setFinishingTemplatesOption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishingTemplatesOption, 0);
  objc_storeStrong((id *)&self->_finishingOptionsTableView, 0);
  objc_storeStrong((id *)&self->_printerFinishingOptions, 0);
}

@end