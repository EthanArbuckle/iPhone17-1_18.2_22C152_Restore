@interface WGWidgetListHeaderView
- (UIView)contentView;
- (WGWidgetListHeaderView)initWithContentView:(id)a3;
- (void)setContentView:(id)a3;
@end

@implementation WGWidgetListHeaderView

- (WGWidgetListHeaderView)initWithContentView:(id)a3
{
  v100[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v99.receiver = self;
  v99.super_class = (Class)WGWidgetListHeaderView;
  v8 = [(WGWidgetListHeaderView *)&v99 init];

  if (!v8) {
    goto LABEL_96;
  }
  id v98 = v7;
  p_contentView = (id *)&v8->_contentView;
  objc_storeStrong((id *)&v8->_contentView, a3);
  int v10 = [(WGWidgetListHeaderView *)v8 _shouldReverseLayoutDirection];
  if (v10) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.0;
  }
  v12 = [*p_contentView layer];
  objc_msgSend(v12, "setAnchorPoint:", v11, 0.5);

  [*p_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WGWidgetListHeaderView *)v8 addSubview:*p_contentView];
  v97 = [MEMORY[0x263F29CA0] sharedInstance];
  int v96 = [v97 deviceClass];
  if (v96 == 2)
  {
    v92 = [MEMORY[0x263F1C920] mainScreen];
    [v92 _referenceBounds];
    if (CGRectGetHeight(v101) <= 1194.0)
    {
      int v15 = 0;
    }
    else
    {
      v13 = [MEMORY[0x263F29CA0] sharedInstance];
      if ([v13 homeButtonType] == 2)
      {

        double v14 = 0.5;
LABEL_86:

        goto LABEL_87;
      }
      v88 = v13;
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  v16 = [MEMORY[0x263F29CA0] sharedInstance];
  int v95 = [v16 deviceClass];
  if (v95 == 2)
  {
    v3 = [MEMORY[0x263F1C920] mainScreen];
    [v3 _referenceBounds];
    if (CGRectGetHeight(v102) <= 1024.0)
    {
      int v94 = v10;
      int v18 = 0;
    }
    else
    {
      v17 = [MEMORY[0x263F29CA0] sharedInstance];
      if ([v17 homeButtonType] == 2)
      {

        double v14 = 8.0;
        if ((v15 & 1) == 0) {
          goto LABEL_85;
        }
LABEL_84:

        goto LABEL_85;
      }
      v87 = v17;
      int v94 = v10;
      int v18 = 1;
    }
  }
  else
  {
    int v94 = v10;
    int v18 = 0;
  }
  v19 = [MEMORY[0x263F29CA0] sharedInstance];
  uint64_t v20 = [v19 deviceClass];
  int v21 = v20;
  if (v20 == 2)
  {
    v4 = (void *)v20;
    v22 = [MEMORY[0x263F1C920] mainScreen];
    [v22 _referenceBounds];
    if (CGRectGetHeight(v103) > 1194.0)
    {

      double v14 = 0.5;
      if ((v18 & 1) == 0) {
        goto LABEL_81;
      }
LABEL_80:

      goto LABEL_81;
    }
    v86 = v22;
    int v21 = (int)v4;
  }
  v93 = [MEMORY[0x263F29CA0] sharedInstance];
  int v91 = [v93 deviceClass];
  if (v91 != 2)
  {
LABEL_32:
    v90 = [MEMORY[0x263F29CA0] sharedInstance];
    int v89 = [v90 deviceClass];
    if (v89 == 2)
    {
      v4 = [MEMORY[0x263F1C920] mainScreen];
      [v4 _referenceBounds];
      if (CGRectGetHeight(v105) > 1024.0)
      {

        if (v91 == 2) {
        if (v21 == 2)
        }

        double v14 = 2.5;
        if (v18) {
          goto LABEL_80;
        }
        goto LABEL_81;
      }
      v75 = v4;
    }
    v4 = v3;
    v23 = [MEMORY[0x263F29CA0] sharedInstance];
    if ([v23 deviceClass] == 2)
    {
LABEL_73:

      if (v89 == 2) {
      v3 = v4;
      }
      if (v91 == 2) {

      }
      if (v21 == 2) {
      double v14 = 0.0;
      }
      if (v18) {
        goto LABEL_80;
      }
      goto LABEL_81;
    }
    v84 = v23;
    int v79 = v18;
    v80 = v4;
    int v81 = v15;
    v83 = [MEMORY[0x263F29CA0] sharedInstance];
    v24 = &off_222E98000;
    int v82 = [v83 deviceClass];
    if (!v82
      || ([MEMORY[0x263F29CA0] sharedInstance],
          v74 = objc_claimAutoreleasedReturnValue(),
          [v74 deviceClass] == 1))
    {
      v64 = [MEMORY[0x263F1C920] mainScreen];
      [v64 _referenceBounds];
      if (CGRectGetHeight(v106) <= 812.0)
      {
        int v26 = 0;
        int v25 = 1;
      }
      else
      {
        v59 = [MEMORY[0x263F29CA0] sharedInstance];
        if ([v59 homeButtonType] == 2 && _BSUI_Private_IsN84())
        {

          if (v82) {
          int v15 = v81;
          }
          v3 = v4;
          if (v89 == 2) {

          }
          if (v91 == 2) {
          if (v21 == 2)
          }

          double v14 = 0.0;
          if (v18) {
            goto LABEL_80;
          }
          goto LABEL_81;
        }
        int v25 = 1;
        int v26 = 1;
      }
    }
    else
    {
      int v25 = 0;
      int v26 = 0;
    }
    v77 = [MEMORY[0x263F29CA0] sharedInstance];
    int v76 = [v77 deviceClass];
    int v78 = v26;
    if (!v76
      || ([MEMORY[0x263F29CA0] sharedInstance],
          v69 = objc_claimAutoreleasedReturnValue(),
          [v69 deviceClass] == 1))
    {
      v62 = [MEMORY[0x263F1C920] mainScreen];
      [v62 _referenceBounds];
      if (CGRectGetHeight(v107) <= 812.0)
      {
        int v72 = 0;
        int v70 = 1;
      }
      else
      {
        v24 = [MEMORY[0x263F29CA0] sharedInstance];
        if ([v24 homeButtonType] == 2)
        {
          int v27 = v25;

          if (v76) {
          int v15 = v81;
          }
          v4 = v80;
          if (v78)
          {
LABEL_112:

            if ((v27 & 1) == 0) {
              goto LABEL_70;
            }
            goto LABEL_69;
          }
LABEL_68:
          if (!v27)
          {
LABEL_70:
            if (v82) {

            }
            v23 = v84;
            goto LABEL_73;
          }
LABEL_69:

          goto LABEL_70;
        }
        int v70 = 1;
        int v72 = 1;
      }
    }
    else
    {
      int v70 = 0;
      int v72 = 0;
    }
    v73 = [MEMORY[0x263F29CA0] sharedInstance];
    int v71 = [v73 deviceClass];
    v61 = v24;
    if (!v71
      || ([MEMORY[0x263F29CA0] sharedInstance],
          v63 = objc_claimAutoreleasedReturnValue(),
          [v63 deviceClass] == 1))
    {
      v60 = [MEMORY[0x263F1C920] mainScreen];
      [v60 _referenceBounds];
      if (CGRectGetHeight(v108) <= 736.0)
      {
        int v68 = 0;
        int v65 = 1;
      }
      else
      {
        v49 = [MEMORY[0x263F29CA0] sharedInstance];
        if ([v49 homeButtonType] == 2)
        {
          int v27 = v25;

          if (v71) {
          int v15 = v81;
          }
          v4 = v80;
          int v18 = v79;
          if (v72)
          {
LABEL_140:

            if ((v70 & 1) == 0)
            {
LABEL_109:
              if (v76) {

              }
              if (v78) {
                goto LABEL_112;
              }
              goto LABEL_68;
            }
LABEL_108:

            goto LABEL_109;
          }
LABEL_107:
          if (!v70) {
            goto LABEL_109;
          }
          goto LABEL_108;
        }
        v53 = v49;
        int v65 = 1;
        int v68 = 1;
      }
    }
    else
    {
      int v65 = 0;
      int v68 = 0;
    }
    v67 = [MEMORY[0x263F29CA0] sharedInstance];
    int v66 = [v67 deviceClass];
    if (!v66
      || ([MEMORY[0x263F29CA0] sharedInstance],
          v55 = objc_claimAutoreleasedReturnValue(),
          [v55 deviceClass] == 1))
    {
      v58 = [MEMORY[0x263F1C920] mainScreen];
      [v58 _referenceBounds];
      if (CGRectGetHeight(v109) > 667.0)
      {
        int v27 = v25;
        int v15 = v81;
        v4 = v80;
        int v18 = v79;
LABEL_127:

        goto LABEL_130;
      }
      int v56 = 1;
      int v57 = v21;
    }
    else
    {
      int v56 = 0;
      int v57 = v21;
    }
    v50 = [MEMORY[0x263F29CA0] sharedInstance];
    int v51 = [v50 deviceClass];
    if (v51
      && ([MEMORY[0x263F29CA0] sharedInstance],
          v54 = objc_claimAutoreleasedReturnValue(),
          [v54 deviceClass] != 1)
      || ([MEMORY[0x263F1C920] mainScreen],
          v52 = objc_claimAutoreleasedReturnValue(),
          [v52 _referenceBounds],
          CGRectGetHeight(v110),
          v52,
          v51))
    {
      int v27 = v25;

      if (v56)
      {
LABEL_126:
        int v15 = v81;
        v4 = v80;
        int v18 = v79;
        int v21 = v57;
        goto LABEL_127;
      }
    }
    else
    {
      int v27 = v25;

      if (v56) {
        goto LABEL_126;
      }
    }
    int v15 = v81;
    v4 = v80;
    int v18 = v79;
    int v21 = v57;
LABEL_130:
    if (v66) {

    }
    if (v68)
    {

      if ((v65 & 1) == 0)
      {
LABEL_137:
        if (v71) {

        }
        if (v72) {
          goto LABEL_140;
        }
        goto LABEL_107;
      }
    }
    else if (!v65)
    {
      goto LABEL_137;
    }

    goto LABEL_137;
  }
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 _referenceBounds];
  if (CGRectGetHeight(v104) <= 1080.0)
  {
    v85 = v4;
    goto LABEL_32;
  }

  if (v21 == 2) {
  double v14 = 8.0;
  }
  if (v18) {
    goto LABEL_80;
  }
LABEL_81:
  int v10 = v94;
  if (v95 == 2) {

  }
  if (v15) {
    goto LABEL_84;
  }
LABEL_85:
  if (v96 == 2) {
    goto LABEL_86;
  }
LABEL_87:

  v28 = [MEMORY[0x263F29CA0] sharedInstance];
  int v29 = [v28 deviceClass];
  if (v29)
  {
    v4 = [MEMORY[0x263F29CA0] sharedInstance];
    if ([v4 deviceClass] != 1)
    {
      v30 = [*p_contentView layoutMarginsGuide];
      v31 = [v30 topAnchor];
      v32 = [(WGWidgetListHeaderView *)v8 topAnchor];
      id v33 = [v31 constraintEqualToAnchor:v32 constant:v14];

LABEL_91:
      goto LABEL_92;
    }
  }
  v34 = [*p_contentView topAnchor];
  v35 = [(WGWidgetListHeaderView *)v8 topAnchor];
  id v33 = [v34 constraintEqualToAnchor:v35];

  if (v29) {
    goto LABEL_91;
  }
LABEL_92:

  [*p_contentView layoutMargins];
  if (v10) {
    double v38 = v37;
  }
  else {
    double v38 = v36;
  }
  v39 = (void *)MEMORY[0x263F08938];
  v40 = [*p_contentView centerXAnchor];
  v41 = [(WGWidgetListHeaderView *)v8 leadingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41 constant:v38];
  v100[0] = v42;
  v100[1] = v33;
  v43 = [(WGWidgetListHeaderView *)v8 bottomAnchor];
  v44 = [*p_contentView bottomAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  v100[2] = v45;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:3];
  [v39 activateConstraints:v46];

  id v7 = v98;
LABEL_96:
  v47 = v8;

  return v47;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end