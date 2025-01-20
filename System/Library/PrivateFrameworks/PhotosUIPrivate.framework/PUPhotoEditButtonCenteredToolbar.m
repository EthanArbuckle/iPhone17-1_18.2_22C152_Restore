@interface PUPhotoEditButtonCenteredToolbar
- (NSArray)leadingViews;
- (NSArray)trailingViews;
- (UILayoutGuide)buttonAreaLayoutGuide;
- (UIView)centerView;
- (double)interItemSpacing;
- (void)_addCenterConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4;
- (void)_addLeadingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4;
- (void)_addTrailingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4;
- (void)_invalidateAllConstraints;
- (void)setButtonAreaLayoutGuide:(id)a3;
- (void)setCenterView:(id)a3 leadingViews:(id)a4 trailingViews:(id)a5;
@end

@implementation PUPhotoEditButtonCenteredToolbar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_trailingViews, 0);
  objc_storeStrong((id *)&self->_centerView, 0);
  objc_storeStrong((id *)&self->_leadingViews, 0);
  objc_storeStrong((id *)&self->_centerLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_trailingLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_leadingLayoutConstraints, 0);
}

- (void)setButtonAreaLayoutGuide:(id)a3
{
}

- (UILayoutGuide)buttonAreaLayoutGuide
{
  return self->_buttonAreaLayoutGuide;
}

- (NSArray)trailingViews
{
  return self->_trailingViews;
}

- (UIView)centerView
{
  return self->_centerView;
}

- (NSArray)leadingViews
{
  return self->_leadingViews;
}

- (void)_invalidateAllConstraints
{
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_centerLayoutConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_leadingLayoutConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_trailingLayoutConstraints];
  centerLayoutConstraints = self->_centerLayoutConstraints;
  self->_centerLayoutConstraints = 0;

  leadingLayoutConstraints = self->_leadingLayoutConstraints;
  self->_leadingLayoutConstraints = 0;

  trailingLayoutConstraints = self->_trailingLayoutConstraints;
  self->_trailingLayoutConstraints = 0;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditButtonCenteredToolbar;
  [(PUPhotoEditToolbar *)&v6 _invalidateAllConstraints];
}

- (void)_addCenterConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_centerView && !self->_centerLayoutConstraints)
  {
    id v42 = v6;
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(UIView *)self->_centerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(PUPhotoEditButtonCenteredToolbar *)self buttonAreaLayoutGuide];
    centerView = self->_centerView;
    if (v4)
    {
      v10 = [(UIView *)centerView centerYAnchor];
      v11 = [v8 centerYAnchor];
      v12 = [v10 constraintEqualToAnchor:v11];
      [v7 addObject:v12];

      v13 = [(UIView *)self->_centerView leadingAnchor];
      v14 = [v8 leadingAnchor];
      v15 = [v13 constraintGreaterThanOrEqualToAnchor:v14];
      [v7 addObject:v15];

      v16 = [(UIView *)self->_centerView trailingAnchor];
      v17 = [v8 trailingAnchor];
      v18 = [v16 constraintLessThanOrEqualToAnchor:v17];
      [v7 addObject:v18];

      v19 = [(UIView *)self->_centerView centerXAnchor];
      v20 = [v8 centerXAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      [v7 addObject:v21];
    }
    else
    {
      v22 = [(UIView *)centerView centerXAnchor];
      v23 = [v8 centerXAnchor];
      v19 = [v22 constraintEqualToAnchor:v23];

      LODWORD(v24) = 1132068864;
      [v19 setPriority:v24];
      [v7 addObject:v19];
      v25 = [(UIView *)self->_centerView topAnchor];
      v26 = [v8 topAnchor];
      v27 = [v25 constraintGreaterThanOrEqualToAnchor:v26];
      [v7 addObject:v27];

      v28 = [(UIView *)self->_centerView bottomAnchor];
      v29 = [v8 bottomAnchor];
      v30 = [v28 constraintLessThanOrEqualToAnchor:v29];
      [v7 addObject:v30];

      v31 = [(UIView *)self->_centerView centerYAnchor];
      v32 = [v8 centerYAnchor];
      v33 = [v31 constraintEqualToAnchor:v32];
      [v7 addObject:v33];

      if ([(NSArray *)self->_leadingViews count])
      {
        v34 = [(NSArray *)self->_leadingViews lastObject];
        v35 = [v34 trailingAnchor];
        v36 = [(UIView *)self->_centerView leadingAnchor];
        v37 = [v35 constraintLessThanOrEqualToAnchor:v36 constant:-5.0];
        [v7 addObject:v37];
      }
      if (![(NSArray *)self->_trailingViews count]) {
        goto LABEL_10;
      }
      v20 = [(NSArray *)self->_trailingViews firstObject];
      v21 = [v20 leadingAnchor];
      v38 = [(UIView *)self->_centerView trailingAnchor];
      v39 = [v21 constraintGreaterThanOrEqualToAnchor:v38 constant:5.0];
      [v7 addObject:v39];
    }
LABEL_10:

    [MEMORY[0x1E4F28DC8] activateConstraints:v7];
    v40 = (NSArray *)[v7 copy];
    centerLayoutConstraints = self->_centerLayoutConstraints;
    self->_centerLayoutConstraints = v40;

    id v6 = v42;
  }
}

- (void)_addTrailingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_trailingViews && !self->_trailingLayoutConstraints)
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    int64_t v74 = [(PUPhotoEditToolbar *)self layoutOrientation];
    [(PUPhotoEditButtonCenteredToolbar *)self buttonAreaLayoutGuide];
    v79 = v78 = self;
    if (v4)
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      obj = self->_trailingViews;
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v84 objects:v89 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        id v71 = v6;
        v10 = 0;
        uint64_t v11 = *(void *)v85;
        do
        {
          uint64_t v12 = 0;
          v13 = v10;
          do
          {
            if (*(void *)v85 != v11) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v84 + 1) + 8 * v12);
            v15 = [(NSArray *)v78->_trailingViews lastObject];

            [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
            if (v13)
            {
              v16 = [v14 topAnchor];
              v17 = [(NSArray *)v13 bottomAnchor];
              v18 = [v16 constraintEqualToAnchor:v17 constant:-15.0];
              [v7 addObject:v18];
            }
            if (v14 == v15)
            {
              v19 = [v14 bottomAnchor];
              v20 = [v79 bottomAnchor];
              v21 = [v19 constraintEqualToAnchor:v20 constant:-15.0];
              [v7 addObject:v21];
            }
            v22 = [v14 leadingAnchor];
            v23 = [v79 leadingAnchor];
            double v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23];
            [v7 addObject:v24];

            v25 = [v14 trailingAnchor];
            v26 = [v79 trailingAnchor];
            v27 = [v25 constraintLessThanOrEqualToAnchor:v26];
            [v7 addObject:v27];

            v28 = [v14 centerXAnchor];
            v29 = [v79 centerXAnchor];
            v30 = [v28 constraintEqualToAnchor:v29];
            [v7 addObject:v30];

            v10 = v14;
            ++v12;
            v13 = v10;
          }
          while (v9 != v12);
          uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v84 objects:v89 count:16];
        }
        while (v9);
        id v6 = v71;
      }
      else
      {
        v10 = 0;
      }
      v33 = obj;
    }
    else
    {
      v31 = [(NSArray *)self->_trailingViews reverseObjectEnumerator];
      v32 = [v31 allObjects];

      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      v33 = v32;
      uint64_t v75 = [(NSArray *)v33 countByEnumeratingWithState:&v80 objects:v88 count:16];
      if (v75)
      {
        id v72 = v6;
        id v34 = 0;
        uint64_t v73 = *(void *)v81;
        v35 = self;
        obja = v33;
        do
        {
          uint64_t v36 = 0;
          v37 = v34;
          do
          {
            if (*(void *)v81 != v73) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v80 + 1) + 8 * v36);
            [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
            [(PUPhotoEditButtonCenteredToolbar *)v35 interItemSpacing];
            double v40 = v39;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v41 = v38;
            }
            else {
              id v41 = 0;
            }
            id v42 = [v41 configuration];
            v43 = v42;
            if (v42) {
              [v42 contentInsets];
            }
            else {
              [v41 contentEdgeInsets];
            }
            double v48 = v44;
            double v49 = v45;
            double v50 = v46;
            double v51 = v47;
            if (v37)
            {
              uint64_t v52 = [(NSArray *)v33 indexOfObject:v37];
              if (v74 == 2 && v52 == 0) {
                double v54 = v40 * -0.5;
              }
              else {
                double v54 = 0.0;
              }
              v55 = [v38 trailingAnchor];
              v56 = [v37 leadingAnchor];
              v57 = [v55 constraintEqualToAnchor:v56 constant:v54];

              LODWORD(v58) = 1143930880;
              [v57 setPriority:v58];
              [v7 addObject:v57];
              v59 = [v38 trailingAnchor];
              v60 = [v37 leadingAnchor];
              v61 = [v59 constraintLessThanOrEqualToAnchor:v60];
              [v7 addObject:v61];

              v62 = [v38 centerYAnchor];
              v63 = [v79 centerYAnchor];
              v64 = [v62 constraintEqualToAnchor:v63];
              [v7 addObject:v64];

              v35 = v78;
            }
            else
            {
              if (v74 == 2)
              {
                LODWORD(v44) = 1148846080;
                [v38 setContentCompressionResistancePriority:0 forAxis:v44];
              }
              v65 = [v38 trailingAnchor];
              v66 = [v79 trailingAnchor];
              [(PUPhotoEditToolbar *)v35 longSideMargin];
              v68 = [v65 constraintEqualToAnchor:v66 constant:-v67];
              [v7 addObject:v68];

              v57 = [v38 centerYAnchor];
              v62 = [v79 centerYAnchor];
              v63 = [v57 constraintEqualToAnchor:v62];
              [v7 addObject:v63];
            }

            id v34 = v38;
            if (v43)
            {
              objc_msgSend(v43, "setContentInsets:", v48, v49, v50, v51);
              [v41 setConfiguration:v43];
            }
            else
            {
              objc_msgSend(v41, "setContentEdgeInsets:", v48, v49, v50, v51);
            }
            v33 = obja;

            ++v36;
            v37 = v34;
          }
          while (v75 != v36);
          uint64_t v75 = [(NSArray *)obja countByEnumeratingWithState:&v80 objects:v88 count:16];
        }
        while (v75);

        v10 = obja;
        id v6 = v72;
      }
      else
      {
        v10 = v33;
      }
    }

    [MEMORY[0x1E4F28DC8] activateConstraints:v7];
    uint64_t v69 = [v7 copy];
    trailingLayoutConstraints = v78->_trailingLayoutConstraints;
    v78->_trailingLayoutConstraints = (NSArray *)v69;
  }
}

- (void)_addLeadingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_leadingViews || self->_leadingLayoutConstraints) {
    goto LABEL_44;
  }
  v7 = [MEMORY[0x1E4F1CA48] array];
  int64_t v62 = [(PUPhotoEditToolbar *)self layoutOrientation];
  uint64_t v8 = [(PUPhotoEditButtonCenteredToolbar *)self buttonAreaLayoutGuide];
  v60 = self;
  if (!v4)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v59 = self->_leadingViews;
    uint64_t v64 = [(NSArray *)v59 countByEnumeratingWithState:&v66 objects:v74 count:16];
    id v11 = 0;
    if (!v64)
    {
      obj = 0;
      goto LABEL_42;
    }
    obj = 0;
    uint64_t v61 = *(void *)v67;
    while (1)
    {
      uint64_t v27 = 0;
      v28 = v11;
      do
      {
        if (*(void *)v67 != v61) {
          objc_enumerationMutation(v59);
        }
        v29 = *(void **)(*((void *)&v66 + 1) + 8 * v27);
        [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(PUPhotoEditButtonCenteredToolbar *)self interItemSpacing];
        double v31 = v30;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int isKindOfClass = 1;
          if (!v28) {
            goto LABEL_28;
          }
        }
        else
        {
          objc_opt_class();
          int isKindOfClass = objc_opt_isKindOfClass();
          if (!v28)
          {
LABEL_28:
            if (v62 == 2
              || !+[PUPhotoEditLayoutSupport isPhoneClassDevice])
            {
              LODWORD(v32) = 1148846080;
              [v29 setContentCompressionResistancePriority:0 forAxis:v32];
            }
            else
            {
              double v39 = v29;

              obj = v39;
            }
            v43 = [v29 leadingAnchor];
            double v44 = [v8 leadingAnchor];
            [(PUPhotoEditToolbar *)self longSideMargin];
            double v45 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44);
            [v7 addObject:v45];

            double v46 = [v29 centerYAnchor];
            double v47 = [v8 centerYAnchor];
            double v48 = [v46 constraintEqualToAnchor:v47];
            [v7 addObject:v48];
            goto LABEL_37;
          }
        }
        double v34 = v31 * 0.5;
        BOOL v35 = [(NSArray *)self->_leadingViews indexOfObject:v28] == 0 && v62 == 2;
        if (!v35) {
          double v34 = 0.0;
        }
        if (v35 || ((isKindOfClass ^ 1) & 1) != 0)
        {
          if (obj)
          {
            double v40 = [v29 firstBaselineAnchor];
            id v41 = [(NSArray *)obj firstBaselineAnchor];
            id v42 = [v40 constraintEqualToAnchor:v41];
            [v7 addObject:v42];
          }
          else
          {
            double v49 = [v29 centerYAnchor];
            double v50 = [v8 centerYAnchor];
            double v51 = [v49 constraintEqualToAnchor:v50];
            [v7 addObject:v51];

            obj = v29;
          }
        }
        else
        {
          uint64_t v36 = [v29 centerYAnchor];
          v37 = [v8 centerYAnchor];
          v38 = [v36 constraintEqualToAnchor:v37];
          [v7 addObject:v38];

          double v34 = 10.0;
        }
        uint64_t v52 = [v29 leadingAnchor];
        v53 = [v28 trailingAnchor];
        double v46 = [v52 constraintEqualToAnchor:v53 constant:v34];

        LODWORD(v54) = 1143930880;
        [v46 setPriority:v54];
        [v7 addObject:v46];
        double v47 = [v29 leadingAnchor];
        double v48 = [v28 trailingAnchor];
        v55 = [v47 constraintGreaterThanOrEqualToAnchor:v48];
        [v7 addObject:v55];

        self = v60;
LABEL_37:

        id v11 = v29;
        ++v27;
        v28 = v11;
      }
      while (v64 != v27);
      uint64_t v64 = [(NSArray *)v59 countByEnumeratingWithState:&v66 objects:v74 count:16];
      if (!v64)
      {
LABEL_42:

        goto LABEL_43;
      }
    }
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obj = self->_leadingViews;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v58 = v6;
    id v11 = 0;
    uint64_t v63 = *(void *)v71;
    do
    {
      uint64_t v12 = 0;
      v13 = v11;
      do
      {
        if (*(void *)v71 != v63) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v70 + 1) + 8 * v12);
        [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
        v15 = [v14 topAnchor];
        if (v13) {
          [v13 bottomAnchor];
        }
        else {
        v16 = [v8 topAnchor];
        }
        v17 = [v15 constraintEqualToAnchor:v16 constant:15.0];
        [v7 addObject:v17];

        v18 = [v14 leadingAnchor];
        v19 = [v8 leadingAnchor];
        v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19];
        [v7 addObject:v20];

        v21 = [v14 trailingAnchor];
        v22 = [v8 trailingAnchor];
        v23 = [v21 constraintLessThanOrEqualToAnchor:v22];
        [v7 addObject:v23];

        double v24 = [v14 centerXAnchor];
        v25 = [v8 centerXAnchor];
        v26 = [v24 constraintEqualToAnchor:v25];
        [v7 addObject:v26];

        id v11 = v14;
        ++v12;
        v13 = v11;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v70 objects:v75 count:16];
    }
    while (v10);
    id v6 = v58;
    self = v60;
  }
  else
  {
    id v11 = 0;
  }
LABEL_43:

  [MEMORY[0x1E4F28DC8] activateConstraints:v7];
  v56 = (NSArray *)[v7 copy];
  leadingLayoutConstraints = self->_leadingLayoutConstraints;
  self->_leadingLayoutConstraints = v56;

LABEL_44:
}

- (void)setCenterView:(id)a3 leadingViews:(id)a4 trailingViews:(id)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (UIView *)a3;
  id v10 = a4;
  id v11 = a5;
  v59 = v10;
  if (([v10 isEqualToArray:self->_leadingViews] & 1) == 0
    || ![v11 isEqualToArray:self->_trailingViews]
    || self->_centerView != v9)
  {
    v57 = v9;
    id v58 = v11;
    p_centerView = &self->_centerView;
    if ([(UIView *)self->_centerView isDescendantOfView:self]) {
      [(UIView *)*p_centerView removeFromSuperview];
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v13 = self->_leadingViews;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v73 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          if ([v18 isDescendantOfView:self]) {
            [v18 removeFromSuperview];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v72 objects:v80 count:16];
      }
      while (v15);
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v19 = self->_trailingViews;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v68 objects:v79 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v69 != v22) {
            objc_enumerationMutation(v19);
          }
          double v24 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          if ([v24 isDescendantOfView:self]) {
            [v24 removeFromSuperview];
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v68 objects:v79 count:16];
      }
      while (v21);
    }

    v25 = [(PUPhotoEditToolbar *)self mainToolbarContainer];
    objc_storeStrong((id *)p_centerView, a3);
    [v25 addSubview:*p_centerView];
    v26 = (NSArray *)[v59 copy];
    leadingViews = self->_leadingViews;
    self->_leadingViews = v26;

    v28 = (NSArray *)[v58 copy];
    trailingViews = self->_trailingViews;
    self->_trailingViews = v28;

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    double v30 = self->_leadingViews;
    uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v64 objects:v78 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v65;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v65 != v33) {
            objc_enumerationMutation(v30);
          }
          [v25 addSubview:*(void *)(*((void *)&v64 + 1) + 8 * k)];
        }
        uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v64 objects:v78 count:16];
      }
      while (v32);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    BOOL v35 = self->_trailingViews;
    uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v60 objects:v77 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v61;
      do
      {
        for (uint64_t m = 0; m != v37; ++m)
        {
          if (*(void *)v61 != v38) {
            objc_enumerationMutation(v35);
          }
          [v25 addSubview:*(void *)(*((void *)&v60 + 1) + 8 * m)];
        }
        uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v60 objects:v77 count:16];
      }
      while (v37);
    }

    double v40 = [(PUPhotoEditButtonCenteredToolbar *)self buttonAreaLayoutGuide];

    if (!v40)
    {
      id v41 = objc_alloc_init(MEMORY[0x1E4FB1940]);
      [(PUPhotoEditButtonCenteredToolbar *)self setButtonAreaLayoutGuide:v41];

      id v42 = [(PUPhotoEditButtonCenteredToolbar *)self buttonAreaLayoutGuide];
      [v25 addLayoutGuide:v42];
    }
    v43 = [(PUPhotoEditButtonCenteredToolbar *)self buttonAreaLayoutGuide];
    v56 = [v25 leftAnchor];
    v55 = [v43 leftAnchor];
    double v54 = [v56 constraintEqualToAnchor:v55];
    v76[0] = v54;
    v53 = [v25 rightAnchor];
    uint64_t v52 = [v43 rightAnchor];
    double v51 = [v53 constraintEqualToAnchor:v52];
    v76[1] = v51;
    double v44 = [v25 topAnchor];
    double v45 = [v43 topAnchor];
    double v46 = [v44 constraintEqualToAnchor:v45];
    v76[2] = v46;
    double v47 = [v25 bottomAnchor];
    double v48 = [v43 bottomAnchor];
    double v49 = [v47 constraintEqualToAnchor:v48];
    v76[3] = v49;
    double v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:4];
    [v25 addConstraints:v50];

    [(PUPhotoEditButtonCenteredToolbar *)self _invalidateAllConstraints];
    uint64_t v9 = v57;
    id v11 = v58;
  }
}

- (double)interItemSpacing
{
  int64_t v3 = [(PUPhotoEditToolbar *)self layoutOrientation];
  if (v3 == 2) {
    double v4 = 24.0;
  }
  else {
    double v4 = 18.0;
  }
  if (v3 == 2) {
    double v5 = 12.0;
  }
  else {
    double v5 = 8.0;
  }
  id v6 = [(PUPhotoEditToolbar *)self photoEditSpec];
  int v7 = [v6 shouldUseCompactToolbarSpacing];

  if (v7) {
    return v5;
  }
  else {
    return v4;
  }
}

@end