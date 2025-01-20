@interface VUILibraryProductInfoView
- (BOOL)useNormalizedGroupLayout;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)groupedInfos;
- (NSArray)infos;
- (NSArray)normalizedGroupedInfos;
- (UIEdgeInsets)footerMargin;
- (UIEdgeInsets)headerMargin;
- (UIEdgeInsets)padding;
- (UIView)footerView;
- (UIView)headerView;
- (VUILibraryProductInfoView)initWithFrame:(CGRect)a3;
- (double)_sectionInfoWidth;
- (double)interitemSpacing;
- (double)lineSpacing;
- (id)_getNormalizedGroupedInfos;
- (int64_t)maxLineCount;
- (unint64_t)_columnCount;
- (void)_layouCellContentView:(id)a3 inCellBounds:(CGRect)a4;
- (void)layoutSubviews;
- (void)setFooterMargin:(UIEdgeInsets)a3;
- (void)setFooterView:(id)a3;
- (void)setGroupedInfos:(id)a3;
- (void)setHeaderMargin:(UIEdgeInsets)a3;
- (void)setHeaderView:(id)a3;
- (void)setInfos:(id)a3;
- (void)setNormalizedGroupedInfos:(id)a3;
@end

@implementation VUILibraryProductInfoView

- (VUILibraryProductInfoView)initWithFrame:(CGRect)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VUILibraryProductInfoView;
  v3 = -[VUILibraryProductInfoView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v11[2] = objc_opt_class();
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__VUILibraryProductInfoView_initWithFrame___block_invoke;
    v7[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v8, &location);
    id v5 = (id)[(VUILibraryProductInfoView *)v3 registerForTraitChanges:v4 withHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__VUILibraryProductInfoView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (void)setHeaderView:(id)a3
{
  id v5 = (UIView *)a3;
  headerView = self->_headerView;
  v7 = v5;
  if (headerView != v5)
  {
    [(UIView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    if (self->_headerView) {
      -[VUILibraryProductInfoView addSubview:](self, "addSubview:");
    }
  }
  [(VUILibraryProductInfoView *)self setNeedsLayout];
}

- (void)setFooterView:(id)a3
{
  id v5 = (UIView *)a3;
  footerView = self->_footerView;
  v7 = v5;
  if (footerView != v5)
  {
    [(UIView *)footerView removeFromSuperview];
    objc_storeStrong((id *)&self->_footerView, a3);
    if (self->_footerView) {
      -[VUILibraryProductInfoView addSubview:](self, "addSubview:");
    }
  }
  [(VUILibraryProductInfoView *)self setNeedsLayout];
}

- (void)setInfos:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v5 = [(VUILibraryProductInfoView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v61 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v11 = [(VUILibraryProductInfoView *)self headerView];
        if (v10 == (void *)v11)
        {
        }
        else
        {
          v12 = (void *)v11;
          v13 = [(VUILibraryProductInfoView *)self footerView];

          if (v10 != v13) {
            [v10 removeFromSuperview];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v7);
  }

  v14 = (NSArray *)[v4 copy];
  infos = self->_infos;
  self->_infos = v14;

  v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v47 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v4;
  uint64_t v17 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v19 = 0;
    uint64_t v20 = *(void *)v57;
    do
    {
      uint64_t v21 = 0;
      v22 = v19;
      do
      {
        if (*(void *)v57 != v20) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v56 + 1) + 8 * v21);
        v19 = [v23 groupName];
        if (v22 && ([v22 isEqualToString:v19] & 1) == 0)
        {
          v24 = (void *)[v16 copy];
          [v46 addObject:v24];

          [v16 removeAllObjects];
        }

        if (v19)
        {
          [v16 addObject:v23];
        }
        else
        {
          v67 = v23;
          v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
          [v46 addObject:v25];
        }
        v66 = v23;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
        [v47 addObject:v26];

        ++v21;
        v22 = v19;
      }
      while (v18 != v21);
      uint64_t v18 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
    }
    while (v18);
  }
  v27 = (void *)[v16 copy];
  [v46 addObject:v27];

  v28 = (NSArray *)[v46 copy];
  groupedInfos = self->_groupedInfos;
  self->_groupedInfos = v28;

  v30 = (NSArray *)[v47 copy];
  normalizedGroupedInfos = self->_normalizedGroupedInfos;
  self->_normalizedGroupedInfos = v30;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v32 = obj;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v53 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        v38 = [v37 headerContentView];

        if (v38)
        {
          v39 = [v37 headerContentView];
          [(VUILibraryProductInfoView *)self addSubview:v39];
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v40 = [v37 dataViews];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v48 objects:v64 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v49;
          do
          {
            for (uint64_t k = 0; k != v42; ++k)
            {
              if (*(void *)v49 != v43) {
                objc_enumerationMutation(v40);
              }
              [(VUILibraryProductInfoView *)self addSubview:*(void *)(*((void *)&v48 + 1) + 8 * k)];
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v48 objects:v64 count:16];
          }
          while (v42);
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v34);
  }
}

- (CGSize)intrinsicContentSize
{
  [(VUILibraryProductInfoView *)self bounds];
  double Width = CGRectGetWidth(v8);
  -[VUILibraryProductInfoView sizeThatFits:](self, "sizeThatFits:", Width, 0.0);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  [(VUILibraryProductInfoView *)self padding];
  double v105 = v6;
  double v106 = v5;
  double v8 = v7;
  double v10 = v9;
  [(VUILibraryProductInfoView *)self interitemSpacing];
  double v12 = v11;
  [(VUILibraryProductInfoView *)self lineSpacing];
  double v111 = v13;
  int64_t v14 = [(VUILibraryProductInfoView *)self maxLineCount];
  uint64_t v15 = 0x7FFFFFFFLL;
  if (v14) {
    uint64_t v15 = v14;
  }
  uint64_t v137 = v15;
  double v108 = v8;
  double v109 = width;
  double v107 = v10;
  double v16 = fmax(width - v8 - v10, 0.0);
  [(VUILibraryProductInfoView *)self headerMargin];
  double v103 = v18;
  double v104 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(VUILibraryProductInfoView *)self headerView];
  objc_msgSend(v23, "vui_sizeThatFits:", v16 - (v20 + v22), 0.0);
  double v102 = v24;

  [(VUILibraryProductInfoView *)self footerMargin];
  double v100 = v26;
  double v101 = v25;
  double v28 = v27;
  double v30 = v29;
  v31 = [(VUILibraryProductInfoView *)self footerView];
  double v126 = v16;
  objc_msgSend(v31, "vui_sizeThatFits:", v16 - (v28 + v30), 0.0);
  double v99 = v32;

  double v33 = *MEMORY[0x1E4F1DB30];
  double v34 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v122 = self;
  [(VUILibraryProductInfoView *)self _getNormalizedGroupedInfos];
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v119 = [obj countByEnumeratingWithState:&v146 objects:v152 count:16];
  if (!v119)
  {
    double v116 = 0.0;
    double v114 = 0.0;
    double v36 = v33;
    double v37 = v34;
    goto LABEL_57;
  }
  uint64_t v35 = 0;
  uint64_t v117 = *(void *)v147;
  double v116 = 0.0;
  double v113 = v33;
  double v114 = 0.0;
  double v36 = v33;
  double v37 = v34;
  uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
  double v118 = v12;
  double v112 = v34;
  do
  {
    for (uint64_t i = 0; i != v119; uint64_t i = v89 + 1)
    {
      uint64_t v129 = v38;
      if (*(void *)v147 != v117) {
        objc_enumerationMutation(obj);
      }
      double v130 = v36;
      double v131 = v37;
      uint64_t v128 = i;
      v40 = *(void **)(*((void *)&v146 + 1) + 8 * i);
      -[VUILibraryProductInfoView _maxWidthForGroupInfos:](v122, "_maxWidthForGroupInfos:", v40, *(void *)&v99);
      double v42 = v41;
      uint64_t v136 = [v40 count];
      long long v142 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      id v43 = v40;
      uint64_t v121 = [v43 countByEnumeratingWithState:&v142 objects:v151 count:16];
      double v127 = v42;
      if (v121)
      {
        uint64_t v44 = 0;
        uint64_t v45 = *(void *)v143;
        if (v42 <= 0.0) {
          double v46 = v126;
        }
        else {
          double v46 = v42;
        }
        double v47 = fmin(v46, fmax(v126, v42));
        double v48 = 0.0;
        double v49 = 0.0;
        double v50 = 0.0;
        double v51 = 0.0;
        double v132 = 0.0;
        v123 = v43;
        uint64_t v120 = *(void *)v143;
        while (2)
        {
          uint64_t v52 = 0;
          do
          {
            double v124 = v49;
            double v125 = v48;
            if (*(void *)v143 != v45) {
              objc_enumerationMutation(v43);
            }
            long long v53 = *(void **)(*((void *)&v142 + 1) + 8 * v52);
            [v53 lineSpacing];
            double v55 = v54;
            [v53 headerMargin];
            double v133 = v56;
            double v134 = v57;
            [v53 headerPadding];
            double v59 = v58;
            double v61 = v60;
            long long v62 = [v53 headerContentView];
            objc_msgSend(v62, "vui_sizeThatFits:", v47, 0.0);
            double v64 = v63;
            double v66 = v65;

            v67 = [v43 firstObject];

            if (v53 == v67)
            {
              double v48 = v61 + v59 + v66;
              BOOL v68 = [(VUILibraryProductInfoView *)v122 useNormalizedGroupLayout];
              double v69 = v132;
              if (v68) {
                double v69 = v133;
              }
              double v132 = v69;
              double v49 = v134;
            }
            else
            {
              double v51 = v51 + v134 + v61 + v133 + v59 + v66;
              double v49 = v124;
              double v48 = v125;
            }
            uint64_t v135 = v52;
            long long v140 = 0u;
            long long v141 = 0u;
            long long v138 = 0u;
            long long v139 = 0u;
            uint64_t v70 = [v53 dataViews];
            uint64_t v71 = [v70 countByEnumeratingWithState:&v138 objects:v150 count:16];
            if (v71)
            {
              uint64_t v72 = v71;
              uint64_t v73 = *(void *)v139;
              while (2)
              {
                for (uint64_t j = 0; j != v72; ++j)
                {
                  if (*(void *)v139 != v73) {
                    objc_enumerationMutation(v70);
                  }
                  v75 = *(void **)(*((void *)&v138 + 1) + 8 * j);
                  if (v44 == v137)
                  {
                    double v50 = fmax(v50, v51);
                    if (v136 != 1)
                    {

                      goto LABEL_38;
                    }
                    uint64_t v44 = 0;
                    ++v35;
                    double v51 = 0.0;
                  }
                  v76 = [v53 dataViews];
                  v77 = [v76 firstObject];

                  double v78 = -0.0;
                  if (v75 != v77) {
                    double v78 = v55;
                  }
                  double v79 = v51 + v78;
                  objc_msgSend(v75, "vui_sizeThatFits:", v47, 0.0);
                  double v51 = v79 + v80;
                  ++v44;
                  double v64 = fmax(v64, v81);
                }
                uint64_t v72 = [v70 countByEnumeratingWithState:&v138 objects:v150 count:16];
                if (v72) {
                  continue;
                }
                break;
              }
            }

            double v50 = fmax(v50, v51);
            if (v44 == v137)
            {
LABEL_38:
              id v43 = v123;
              goto LABEL_40;
            }
            uint64_t v52 = v135 + 1;
            uint64_t v45 = v120;
            id v43 = v123;
          }
          while (v135 + 1 != v121);
          uint64_t v121 = [v123 countByEnumeratingWithState:&v142 objects:v151 count:16];
          if (v121) {
            continue;
          }
          break;
        }
      }
      else
      {
        double v48 = 0.0;
        double v49 = 0.0;
        double v64 = 0.0;
        double v50 = 0.0;
        double v132 = 0.0;
      }
LABEL_40:

      double v82 = v127;
      if (v127 == 0.0) {
        double v82 = v64;
      }
      double v83 = v48 + v49 + v50;
      uint64_t v84 = 1;
      if (v129 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v84 = -v129;
      }
      uint64_t v85 = v35 + v84;
      double v86 = v118 * (float)((float)v85 + -1.0) + (double)v85 * v82;
      if (v129 == 0x7FFFFFFFFFFFFFFFLL || v126 <= 0.0)
      {
        double v92 = v118;
        uint64_t v38 = v35;
        double v88 = v130;
        double v87 = v131;
        uint64_t v89 = v128;
        if (v129 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_53;
        }
        goto LABEL_51;
      }
      double v88 = v130;
      double v87 = v131;
      uint64_t v89 = v128;
      if (v118 + v130 + v86 > v126)
      {
        double v116 = fmax(v116, v130);
        double v114 = v114 + v111 + v131;
        uint64_t v35 = v85 - 1;
        BOOL v90 = [(VUILibraryProductInfoView *)v122 useNormalizedGroupLayout];
        double v91 = -0.0;
        if (v90) {
          double v91 = v132;
        }
        double v83 = v83 + v91;
        double v87 = v112;
        double v88 = v113;
LABEL_51:
        double v92 = 0.0;
        uint64_t v38 = v35;
        goto LABEL_53;
      }
      uint64_t v38 = v35;
      double v92 = v118;
LABEL_53:
      double v36 = v88 + v86 + v92;
      double v37 = fmax(v87, v83);
      uint64_t v35 = v38 + 1;
    }
    uint64_t v119 = [obj countByEnumeratingWithState:&v146 objects:v152 count:16];
  }
  while (v119);
LABEL_57:
  double v93 = v107 + v108 + fmax(v116, v36);
  double v94 = fmin(v93, v109);
  if (v109 <= 0.0) {
    double v95 = v93;
  }
  else {
    double v95 = v94;
  }
  if (height <= 0.0) {
    double v96 = 1.79769313e308;
  }
  else {
    double v96 = height;
  }

  double v97 = fmin(v96, v105 + v106 + v100 + v103 + v104 + v102 + v101 + v99 + v114 + v37);
  double v98 = v95;
  result.double height = v97;
  result.double width = v98;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  v195.receiver = self;
  v195.super_class = (Class)VUILibraryProductInfoView;
  [(VUILibraryProductInfoView *)&v195 layoutSubviews];
  [(VUILibraryProductInfoView *)self bounds];
  double v4 = v3;
  [(VUILibraryProductInfoView *)self padding];
  double v164 = v5;
  double v165 = v6;
  double v7 = v6;
  double v9 = v8;
  [(VUILibraryProductInfoView *)self interitemSpacing];
  double v142 = v10;
  [(VUILibraryProductInfoView *)self lineSpacing];
  double v136 = v11;
  int64_t v12 = [(VUILibraryProductInfoView *)self maxLineCount];
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0x7FFFFFFFLL;
  }
  double v147 = 0.0;
  double v14 = fmax(v4 - v7 - v9, 0.0);
  [(VUILibraryProductInfoView *)self headerMargin];
  double v169 = v15;
  double v17 = v16;
  double v173 = v18;
  double v20 = v19;
  double v21 = [(VUILibraryProductInfoView *)self headerView];
  double v22 = v14 - (v17 + v20);
  objc_msgSend(v21, "vui_sizeThatFits:", v22, 0.0);
  double v171 = v23;

  [(VUILibraryProductInfoView *)self footerMargin];
  double v133 = v24;
  double v26 = v25;
  double v28 = v27;
  double v29 = [(VUILibraryProductInfoView *)self footerView];
  double v132 = v26;
  double v141 = v14;
  objc_msgSend(v29, "vui_sizeThatFits:", v14 - (v26 + v28), 0.0);
  double v134 = v30;

  double v31 = v165 + v17;
  uint64_t v32 = [(VUILibraryProductInfoView *)self effectiveUserInterfaceLayoutDirection];
  v167 = self;
  double v33 = [(VUILibraryProductInfoView *)self headerView];
  double v135 = v22;
  if (v32 == 1)
  {
    double v34 = v171;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v31 = v38;
  }
  else
  {
    double v35 = v164 + v169;
    double v36 = v22;
    double v34 = v171;
    double v37 = v171;
  }
  objc_msgSend(v33, "setFrame:", v31, v35, v36, v37);

  double v146 = v173 + v164 + v169 + v34;
  [(VUILibraryProductInfoView *)self _getNormalizedGroupedInfos];
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v139 = [obj countByEnumeratingWithState:&v191 objects:v200 count:16];
  if (v139)
  {
    uint64_t v39 = 0;
    double v152 = *MEMORY[0x1E4F1DAD8];
    uint64_t v138 = *(void *)v192;
    double v147 = 0.0;
    uint64_t v166 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v174 = v13;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v192 != v138)
        {
          uint64_t v41 = v40;
          objc_enumerationMutation(obj);
          uint64_t v40 = v41;
        }
        uint64_t v140 = v39;
        uint64_t v145 = v40;
        double v42 = *(void **)(*((void *)&v191 + 1) + 8 * v40);
        [(VUILibraryProductInfoView *)v167 _maxWidthForGroupInfos:v42];
        double v44 = v43;
        uint64_t v172 = [v42 count];
        long long v187 = 0u;
        long long v188 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        id v154 = v42;
        uint64_t v150 = [v154 countByEnumeratingWithState:&v187 objects:v199 count:16];
        double v143 = v44;
        if (v150)
        {
          uint64_t v45 = 0;
          uint64_t v148 = *(void *)v188;
          if (v44 <= 0.0) {
            double v46 = v141;
          }
          else {
            double v46 = v44;
          }
          double v47 = fmin(v46, fmax(v141, v44));
          double v168 = 0.0;
          double v170 = 0.0;
          double v48 = 0.0;
          double v49 = 0.0;
          uint64_t v50 = 1;
LABEL_17:
          uint64_t v51 = 0;
          while (1)
          {
            if (*(void *)v188 != v148) {
              objc_enumerationMutation(v154);
            }
            uint64_t v156 = v51;
            uint64_t v52 = *(void **)(*((void *)&v187 + 1) + 8 * v51);
            [v52 lineSpacing];
            double v54 = v53;
            [v52 headerMargin];
            double v158 = v55;
            double v160 = v56;
            [v52 headerPadding];
            double v58 = v57;
            double v60 = v59;
            double v61 = [v52 headerContentView];
            long long v62 = [v52 headerContentView];
            objc_msgSend(v62, "vui_sizeThatFits:", v47, 0.0);
            double v64 = v63;
            double v66 = v65;

            v162 = v61;
            objc_msgSend(v61, "setBounds:", 0.0, 0.0, v64, v66);
            v67 = [v154 firstObject];

            if (v52 == v67) {
              double v68 = v160;
            }
            else {
              double v68 = v170;
            }
            if (v52 != v67) {
              double v48 = v48 + v160 + v60 + v158 + v58 + v66;
            }
            long long v185 = 0u;
            long long v186 = 0u;
            double v69 = v168;
            if (v52 == v67) {
              double v69 = v60 + v58 + v66;
            }
            double v168 = v69;
            double v170 = v68;
            long long v183 = 0uLL;
            long long v184 = 0uLL;
            uint64_t v70 = [v52 dataViews];
            uint64_t v71 = [v70 countByEnumeratingWithState:&v183 objects:v198 count:16];
            if (v71)
            {
              uint64_t v72 = v71;
              uint64_t v73 = *(void *)v184;
              double v74 = v152;
              while (2)
              {
                for (uint64_t i = 0; i != v72; ++i)
                {
                  if (*(void *)v184 != v73) {
                    objc_enumerationMutation(v70);
                  }
                  v76 = *(void **)(*((void *)&v183 + 1) + 8 * i);
                  if (v13 >= 1 && v45 == v13)
                  {
                    double v49 = fmax(v49, v48);
                    if (v172 != 1)
                    {
                      uint64_t v45 = v13;
                      goto LABEL_43;
                    }
                    uint64_t v45 = 0;
                    ++v50;
                    double v48 = 0.0;
                  }
                  v77 = [v52 dataViews];
                  double v78 = [v77 firstObject];

                  double v79 = -0.0;
                  if (v76 != v78) {
                    double v79 = v54;
                  }
                  double v80 = v48 + v79;
                  objc_msgSend(v76, "vui_sizeThatFits:", v47, 0.0);
                  double v82 = v81;
                  double v84 = v83;
                  objc_msgSend(v76, "setBounds:", 0.0, 0.0, v81, v83);
                  double v48 = v80 + v84;
                  double v64 = fmax(v64, v82);
                  ++v45;
                  uint64_t v13 = v174;
                }
                uint64_t v72 = [v70 countByEnumeratingWithState:&v183 objects:v198 count:16];
                if (v72) {
                  continue;
                }
                break;
              }
            }
            else
            {
              double v74 = v152;
            }
LABEL_43:

            double v49 = fmax(v49, v48);
            if (v45 == v13) {
              break;
            }
            uint64_t v51 = v156 + 1;
            if (v156 + 1 == v150)
            {
              uint64_t v150 = [v154 countByEnumeratingWithState:&v187 objects:v199 count:16];
              if (v150) {
                goto LABEL_17;
              }
              break;
            }
          }
        }
        else
        {
          double v168 = 0.0;
          double v170 = 0.0;
          double v64 = 0.0;
          double v49 = 0.0;
          uint64_t v50 = 1;
          double v74 = v152;
        }

        if (v143 == 0.0) {
          double v85 = v64;
        }
        else {
          double v85 = v143;
        }
        double v86 = [MEMORY[0x1E4F28ED0] numberWithLong:v50];
        [v86 floatValue];
        float v88 = v87;

        if (v166 == 0x7FFFFFFFFFFFFFFFLL || v141 <= 0.0 || v74 + v142 * (v88 + -1.0) + v88 * v85 <= v141)
        {
          uint64_t v166 = v140;
          double v89 = v146;
        }
        else
        {
          double v89 = v146 + v136 + v147;
          uint64_t v166 = v50 - 1;
          double v74 = 0.0;
          double v147 = 0.0;
        }
        double v146 = v89;
        int v90 = v89 > 0.0 && [(VUILibraryProductInfoView *)v167 useNormalizedGroupLayout];
        long long v181 = 0u;
        long long v182 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        id v91 = v154;
        uint64_t v151 = [v91 countByEnumeratingWithState:&v179 objects:v197 count:16];
        if (v151)
        {
          uint64_t v92 = 0;
          uint64_t v93 = *(void *)v180;
          double v94 = v142 + v85;
          double v95 = v146;
          v157 = v91;
          int v149 = v90;
          uint64_t v144 = *(void *)v180;
          while (2)
          {
            double v96 = 0;
            do
            {
              double v153 = v74;
              if (*(void *)v180 != v93) {
                objc_enumerationMutation(v91);
              }
              v155 = v96;
              double v97 = *(void **)(*((void *)&v179 + 1) + 8 * (void)v96);
              [v97 lineSpacing];
              double v99 = v98;
              [v97 headerMargin];
              double v159 = v100;
              double v163 = v101;
              [v97 headerPadding];
              double v103 = v102;
              double v161 = v104;
              double v105 = [v97 headerContentView];
              [v105 bounds];
              double v107 = v106;
              double v108 = [v91 firstObject];
              if (v97 == v108) {
                int v109 = v90;
              }
              else {
                int v109 = 1;
              }

              double v110 = -0.0;
              if (v109) {
                double v110 = v159;
              }
              double v111 = v95 + v110;
              -[VUILibraryProductInfoView _layouCellContentView:inCellBounds:](v167, "_layouCellContentView:inCellBounds:", v105, v165 + v153, v103 + v164 + v111, v85, v107);
              long long v177 = 0u;
              long long v178 = 0u;
              double v95 = v111 + v163 + v161 + v103 + v107;
              long long v175 = 0u;
              long long v176 = 0u;
              double v112 = [v97 dataViews];
              uint64_t v113 = [v112 countByEnumeratingWithState:&v175 objects:v196 count:16];
              if (v113)
              {
                uint64_t v114 = v113;
                uint64_t v115 = *(void *)v176;
                double v74 = v153;
                while (2)
                {
                  for (uint64_t j = 0; j != v114; ++j)
                  {
                    if (*(void *)v176 != v115) {
                      objc_enumerationMutation(v112);
                    }
                    uint64_t v117 = *(void **)(*((void *)&v175 + 1) + 8 * j);
                    if (v92 == v174)
                    {
                      if (v172 != 1)
                      {

                        uint64_t v13 = v174;
                        goto LABEL_88;
                      }
                      uint64_t v92 = 0;
                      ++v166;
                      double v74 = v94 + v74;
                      double v95 = v170 + v168 + v146;
                    }
                    double v118 = [v97 dataViews];
                    uint64_t v119 = [v118 firstObject];

                    double v120 = -0.0;
                    if (v117 != v119) {
                      double v120 = v99;
                    }
                    double v121 = v95 + v120;
                    [v117 bounds];
                    double v123 = v122;
                    -[VUILibraryProductInfoView _layouCellContentView:inCellBounds:](v167, "_layouCellContentView:inCellBounds:", v117, v165 + v74, v164 + v121, v85);
                    double v95 = v121 + v123;
                    ++v92;
                  }
                  uint64_t v114 = [v112 countByEnumeratingWithState:&v175 objects:v196 count:16];
                  if (v114) {
                    continue;
                  }
                  break;
                }
              }
              else
              {
                double v74 = v153;
              }

              uint64_t v13 = v174;
              if (v92 == v174)
              {
LABEL_88:
                id v91 = v157;
                goto LABEL_90;
              }
              id v91 = v157;
              double v96 = v155 + 1;
              int v90 = v149;
              uint64_t v93 = v144;
            }
            while (v155 + 1 != (char *)v151);
            uint64_t v151 = [v157 countByEnumeratingWithState:&v179 objects:v197 count:16];
            if (v151) {
              continue;
            }
            break;
          }
        }
        else
        {
          double v94 = v142 + v85;
        }
LABEL_90:

        double v152 = v94 + v74;
        double v147 = fmax(v147, v49 + v170 + v168);
        uint64_t v39 = v166 + 1;
        uint64_t v40 = v145 + 1;
      }
      while (v145 + 1 != v139);
      uint64_t v139 = [obj countByEnumeratingWithState:&v191 objects:v200 count:16];
    }
    while (v139);
  }
  double v124 = v165 + v132;
  double v125 = v133 + v146 + v147;
  uint64_t v126 = [(VUILibraryProductInfoView *)v167 effectiveUserInterfaceLayoutDirection];
  double v127 = [(VUILibraryProductInfoView *)v167 footerView];
  if (v126 == 1)
  {
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v124 = v130;
    double v125 = v131;
  }
  else
  {
    double v129 = v134;
    double v128 = v135;
  }
  objc_msgSend(v127, "setFrame:", v124, v125, v128, v129);

  [(VUILibraryProductInfoView *)v167 invalidateIntrinsicContentSize];
}

- (id)_getNormalizedGroupedInfos
{
  if ([(VUILibraryProductInfoView *)self _columnCount] == 2) {
    [(VUILibraryProductInfoView *)self groupedInfos];
  }
  else {
  double v3 = [(VUILibraryProductInfoView *)self normalizedGroupedInfos];
  }
  return v3;
}

- (BOOL)useNormalizedGroupLayout
{
  return [(VUILibraryProductInfoView *)self _columnCount] != 2;
}

- (void)_layouCellContentView:(id)a3 inCellBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v22 = a3;
  [v22 bounds];
  if (v9 > width)
  {
    [v22 frame];
    double v11 = v10;
    [v22 frame];
    double v13 = v12;
    [v22 bounds];
    objc_msgSend(v22, "setFrame:", v11, v13, width);
  }
  [v22 bounds];
  double v15 = v14;
  if ([(VUILibraryProductInfoView *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    [(VUILibraryProductInfoView *)self bounds];
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v18 = v16 + v17 + v15 * -0.5;
    double v21 = v19 + v20 * 0.5;
  }
  else
  {
    double v18 = x + v15 * 0.5;
    double v21 = y + height * 0.5;
  }
  objc_msgSend(v22, "setCenter:", v18, v21);
}

- (double)_sectionInfoWidth
{
  double v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", -[VUILibraryProductInfoView _columnCount](self, "_columnCount"));
  [v3 floatValue];
  double v5 = v4;

  [(VUILibraryProductInfoView *)self interitemSpacing];
  double v7 = v6;
  double v8 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  [v8 bounds];
  double Width = CGRectGetWidth(v13);

  [(VUILibraryProductInfoView *)self padding];
  return (Width - (v10 + v11) - (v5 + -1.0) * v7) / v5;
}

- (double)interitemSpacing
{
  v2 = [(VUILibraryProductInfoView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  BOOL v4 = (unint64_t)(objc_msgSend(MEMORY[0x1E4FB1F48], "vui_interfaceOrientation") - 3) < 2 && v3 == 1;
  double result = 20.0;
  if (v4) {
    return 30.0;
  }
  return result;
}

- (int64_t)maxLineCount
{
  uint64_t v3 = [(VUILibraryProductInfoView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_interfaceOrientation");
  double v6 = [(VUILibraryProductInfoView *)self traitCollection];
  int v7 = [v6 isAXEnabled];

  if (v4 == 1) {
    int v8 = v7;
  }
  else {
    int v8 = 1;
  }
  int64_t v9 = 5;
  if ((unint64_t)(v5 - 3) >= 2) {
    int64_t v9 = 0;
  }
  if (v8) {
    return 0;
  }
  else {
    return v9;
  }
}

- (UIEdgeInsets)padding
{
  v2 = (void *)MEMORY[0x1E4FB1F48];
  [(VUILibraryProductInfoView *)self bounds];
  double Width = CGRectGetWidth(v9);
  objc_msgSend(v2, "vui_paddingForWindowWidth:", Width);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (unint64_t)_columnCount
{
  uint64_t v3 = [(VUILibraryProductInfoView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_interfaceOrientation");
  double v6 = [(VUILibraryProductInfoView *)self traitCollection];
  char v7 = [v6 isAXEnabled];

  if (v7) {
    return 1;
  }
  if (v4 != 1) {
    return 2;
  }
  if ((unint64_t)(v5 - 1) < 2) {
    return 4;
  }
  if ((unint64_t)(v5 - 3) >= 2) {
    return 2;
  }
  return 5;
}

- (NSArray)infos
{
  return self->_infos;
}

- (NSArray)groupedInfos
{
  return self->_groupedInfos;
}

- (void)setGroupedInfos:(id)a3
{
}

- (NSArray)normalizedGroupedInfos
{
  return self->_normalizedGroupedInfos;
}

- (void)setNormalizedGroupedInfos:(id)a3
{
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIEdgeInsets)headerMargin
{
  double top = self->_headerMargin.top;
  double left = self->_headerMargin.left;
  double bottom = self->_headerMargin.bottom;
  double right = self->_headerMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHeaderMargin:(UIEdgeInsets)a3
{
  self->_headerMargin = a3;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (UIEdgeInsets)footerMargin
{
  double top = self->_footerMargin.top;
  double left = self->_footerMargin.left;
  double bottom = self->_footerMargin.bottom;
  double right = self->_footerMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFooterMargin:(UIEdgeInsets)a3
{
  self->_footerMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_normalizedGroupedInfos, 0);
  objc_storeStrong((id *)&self->_groupedInfos, 0);
  objc_storeStrong((id *)&self->_infos, 0);
}

@end