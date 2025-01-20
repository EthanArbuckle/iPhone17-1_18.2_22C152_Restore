@interface _TVInfoListView
+ (id)infoListViewWithElement:(id)a3 existingView:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)groupedInfos;
- (NSArray)infos;
- (UIView)footerView;
- (UIView)headerView;
- (_TVInfoListView)initWithFrame:(CGRect)a3;
- (double)_maxWidthForGroupInfos:(id)a3;
- (double)interitemSpacing;
- (double)lineSpacing;
- (int64_t)maxLineCount;
- (void)_layouCellContentView:(id)a3 inCellBounds:(CGRect)a4;
- (void)layoutSubviews;
- (void)setFooterView:(id)a3;
- (void)setGroupedInfos:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setInfos:(id)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setLineSpacing:(double)a3;
- (void)setMaxLineCount:(int64_t)a3;
@end

@implementation _TVInfoListView

+ (id)infoListViewWithElement:(id)a3 existingView:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v44 = v7;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    id v9 = objc_alloc((Class)a1);
    id v8 = (id)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), v7);
  }
  v10 = v8;
  v11 = objc_msgSend(v6, "style", v44);
  objc_msgSend(v10, "setMaxLineCount:", objc_msgSend(v11, "tv_maxLines"));

  v12 = [v6 style];
  objc_msgSend(v12, "tv_lineSpacing");
  objc_msgSend(v10, "setLineSpacing:");

  v13 = [v6 style];
  objc_msgSend(v13, "tv_interitemSpacing");
  objc_msgSend(v10, "setInteritemSpacing:");

  v50 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v46 = v6;
  v14 = [v6 children];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v58;
    v48 = v14;
    v49 = v10;
    uint64_t v47 = *(void *)v58;
    do
    {
      uint64_t v18 = 0;
      uint64_t v51 = v16;
      do
      {
        if (*(void *)v58 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v57 + 1) + 8 * v18);
        if (objc_msgSend(v19, "tv_elementType") == 15)
        {
          v20 = +[TVInterfaceFactory sharedInterfaceFactory];
          v21 = [v10 headerView];
          v22 = [(_TVInfoListInfo *)v20 _viewFromElement:v19 existingView:v21];
          [v10 setHeaderView:v22];
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        if (objc_msgSend(v19, "tv_elementType") == 13)
        {
          v20 = +[TVInterfaceFactory sharedInterfaceFactory];
          v21 = [v10 footerView];
          v22 = [(_TVInfoListInfo *)v20 _viewFromElement:v19 existingView:v21];
          [v10 setFooterView:v22];
          goto LABEL_13;
        }
        if (objc_msgSend(v19, "tv_elementType") == 18)
        {
          uint64_t v52 = v18;
          v20 = objc_alloc_init(_TVInfoListInfo);
          v23 = [v19 style];
          v24 = objc_msgSend(v23, "tv_group");
          [(_TVInfoListInfo *)v20 setGroup:v24];

          v25 = [v19 style];
          objc_msgSend(v25, "tv_width");
          -[_TVInfoListInfo setWidth:](v20, "setWidth:");

          v26 = [v19 style];
          objc_msgSend(v26, "tv_lineSpacing");
          -[_TVInfoListInfo setLineSpacing:](v20, "setLineSpacing:");

          v21 = [MEMORY[0x263EFF980] array];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          v27 = [v19 children];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v53 objects:v61 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v54;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v54 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                if (objc_msgSend(v32, "tv_elementType") == 15)
                {
                  v33 = [v32 style];
                  objc_msgSend(v33, "tv_margin");
                  -[_TVInfoListInfo setHeaderMargin:](v20, "setHeaderMargin:");

                  v34 = [v32 style];
                  objc_msgSend(v34, "tv_padding");
                  -[_TVInfoListInfo setHeaderPadding:](v20, "setHeaderPadding:");

                  v35 = [v32 children];
                  v36 = [v35 firstObject];

                  v37 = +[TVInterfaceFactory sharedInterfaceFactory];
                  v38 = [v37 _viewFromElement:v36 existingView:0];
                  [(_TVInfoListInfo *)v20 setHeaderContentView:v38];
                }
                else
                {
                  v39 = +[TVInterfaceFactory sharedInterfaceFactory];
                  v36 = [v39 _viewFromElement:v32 existingView:0];

                  if (v36) {
                    [v21 addObject:v36];
                  }
                }
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v53 objects:v61 count:16];
            }
            while (v29);
          }

          v40 = (void *)[v21 copy];
          [(_TVInfoListInfo *)v20 setDataViews:v40];

          [v50 addObject:v20];
          v14 = v48;
          v10 = v49;
          uint64_t v17 = v47;
          uint64_t v16 = v51;
          uint64_t v18 = v52;
          goto LABEL_14;
        }
LABEL_15:
        ++v18;
      }
      while (v18 != v16);
      uint64_t v41 = [v14 countByEnumeratingWithState:&v57 objects:v62 count:16];
      uint64_t v16 = v41;
    }
    while (v41);
  }

  v42 = (void *)[v50 copy];
  [v10 setInfos:v42];

  return v10;
}

- (_TVInfoListView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVInfoListView;
  return -[_TVInfoListView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setHeaderView:(id)a3
{
  v5 = (UIView *)a3;
  headerView = self->_headerView;
  id v7 = v5;
  if (headerView != v5)
  {
    [(UIView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    if (self->_headerView) {
      -[_TVInfoListView addSubview:](self, "addSubview:");
    }
  }
  [(_TVInfoListView *)self setNeedsLayout];
}

- (void)setFooterView:(id)a3
{
  v5 = (UIView *)a3;
  footerView = self->_footerView;
  id v7 = v5;
  if (footerView != v5)
  {
    [(UIView *)footerView removeFromSuperview];
    objc_storeStrong((id *)&self->_footerView, a3);
    if (self->_footerView) {
      -[_TVInfoListView addSubview:](self, "addSubview:");
    }
  }
  [(_TVInfoListView *)self setNeedsLayout];
}

- (void)setInfos:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v5 = [(_TVInfoListView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v11 = [(_TVInfoListView *)self headerView];
        if (v10 == (void *)v11)
        {
        }
        else
        {
          v12 = (void *)v11;
          v13 = [(_TVInfoListView *)self footerView];

          if (v10 != v13) {
            [v10 removeFromSuperview];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v7);
  }

  v14 = (NSArray *)[v4 copy];
  infos = self->_infos;
  self->_infos = v14;

  v43 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v17 = v4;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    v20 = 0;
    uint64_t v21 = *(void *)v53;
    do
    {
      uint64_t v22 = 0;
      v23 = v20;
      do
      {
        if (*(void *)v53 != v21) {
          objc_enumerationMutation(v17);
        }
        v24 = *(void **)(*((void *)&v52 + 1) + 8 * v22);
        v20 = [v24 group];
        if (v23 && ([v23 isEqualToString:v20] & 1) == 0)
        {
          v25 = (void *)[v16 copy];
          [v43 addObject:v25];

          [v16 removeAllObjects];
        }

        if (v20)
        {
          [v16 addObject:v24];
        }
        else
        {
          v62 = v24;
          v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
          [v43 addObject:v26];
        }
        ++v22;
        v23 = v20;
      }
      while (v19 != v22);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v19);
  }
  v27 = (void *)[v16 copy];
  [v43 addObject:v27];

  uint64_t v28 = (NSArray *)[v43 copy];
  groupedInfos = self->_groupedInfos;
  self->_groupedInfos = v28;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v30 = v17;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v49 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v36 = [v35 headerContentView];

        if (v36)
        {
          v37 = [v35 headerContentView];
          [(_TVInfoListView *)self addSubview:v37];
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v38 = [v35 dataViews];
        uint64_t v39 = [v38 countByEnumeratingWithState:&v44 objects:v60 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v45;
          do
          {
            for (uint64_t k = 0; k != v40; ++k)
            {
              if (*(void *)v45 != v41) {
                objc_enumerationMutation(v38);
              }
              [(_TVInfoListView *)self addSubview:*(void *)(*((void *)&v44 + 1) + 8 * k)];
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v44 objects:v60 count:16];
          }
          while (v40);
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v32);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v152 = *MEMORY[0x263EF8340];
  [(UIView *)self tv_padding];
  double v105 = v6;
  double v106 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_TVInfoListView *)self interitemSpacing];
  double v12 = v11;
  [(_TVInfoListView *)self lineSpacing];
  double v111 = v13;
  int64_t v14 = [(_TVInfoListView *)self maxLineCount];
  uint64_t v15 = 0x7FFFFFFFLL;
  if (v14) {
    uint64_t v15 = v14;
  }
  uint64_t v136 = v15;
  double v108 = v8;
  double v109 = width;
  double v107 = v10;
  double v16 = width - v8 - v10;
  double v17 = 0.0;
  double v18 = fmax(v16, 0.0);
  uint64_t v19 = [(_TVInfoListView *)self headerView];
  objc_msgSend(v19, "tv_margin");
  double v103 = v21;
  double v104 = v20;
  double v23 = v22;
  double v25 = v24;

  v26 = [(_TVInfoListView *)self headerView];
  objc_msgSend(v26, "tv_sizeThatFits:", v18 - (v23 + v25), 0.0);
  double v102 = v27;

  uint64_t v28 = [(_TVInfoListView *)self footerView];
  objc_msgSend(v28, "tv_margin");
  double v100 = v30;
  double v101 = v29;
  double v32 = v31;
  double v34 = v33;

  v35 = [(_TVInfoListView *)self footerView];
  double v124 = v18;
  objc_msgSend(v35, "tv_sizeThatFits:", v18 - (v32 + v34), 0.0);
  double v99 = v36;

  double v37 = *MEMORY[0x263F001B0];
  double v38 = *(double *)(MEMORY[0x263F001B0] + 8);
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  v118 = self;
  obuint64_t j = [(_TVInfoListView *)self groupedInfos];
  uint64_t v119 = [obj countByEnumeratingWithState:&v145 objects:v151 count:16];
  if (!v119)
  {
    double v114 = 0.0;
    double v40 = v37;
    double v41 = v38;
    goto LABEL_56;
  }
  uint64_t v39 = 0;
  uint64_t v116 = *(void *)v146;
  double v113 = v37;
  double v114 = 0.0;
  double v40 = v37;
  double v41 = v38;
  uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
  double v117 = v12;
  double v112 = v38;
  do
  {
    for (uint64_t i = 0; i != v119; uint64_t i = v93 + 1)
    {
      uint64_t v127 = v42;
      if (*(void *)v146 != v116) {
        objc_enumerationMutation(obj);
      }
      double v128 = v40;
      double v129 = v41;
      double v130 = v17;
      uint64_t v126 = i;
      long long v44 = *(void **)(*((void *)&v145 + 1) + 8 * i);
      -[_TVInfoListView _maxWidthForGroupInfos:](v118, "_maxWidthForGroupInfos:", v44, *(void *)&v99);
      double v46 = v45;
      uint64_t v135 = [v44 count];
      long long v141 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      id v47 = v44;
      uint64_t v121 = [v47 countByEnumeratingWithState:&v141 objects:v150 count:16];
      double v125 = v46;
      if (v121)
      {
        uint64_t v48 = 0;
        uint64_t v49 = *(void *)v142;
        if (v46 <= 0.0) {
          double v50 = v124;
        }
        else {
          double v50 = v46;
        }
        double v51 = fmin(v50, fmax(v124, v46));
        double v52 = 0.0;
        double v134 = 0.0;
        double v53 = 0.0;
        double v54 = 0.0;
        v123 = v47;
        uint64_t v120 = *(void *)v142;
        while (2)
        {
          uint64_t v55 = 0;
          do
          {
            double v133 = v52;
            if (*(void *)v142 != v49) {
              objc_enumerationMutation(v47);
            }
            uint64_t v122 = v55;
            long long v56 = *(void **)(*((void *)&v141 + 1) + 8 * v55);
            [v56 lineSpacing];
            double v58 = v57;
            [v56 headerMargin];
            double v131 = v59;
            double v132 = v60;
            [v56 headerPadding];
            double v62 = v61;
            double v64 = v63;
            uint64_t v65 = [v56 headerContentView];
            objc_msgSend(v65, "tv_sizeThatFits:", v51, 0.0);
            double v67 = v66;
            double v69 = v68;

            v70 = [v47 firstObject];

            double v71 = v54 + v132 + v64 + v131 + v62 + v69;
            double v72 = v64 + v62 + v69;
            double v52 = v133;
            if (v56 == v70) {
              double v52 = v72;
            }
            double v73 = v134;
            if (v56 == v70) {
              double v73 = v132;
            }
            double v134 = v73;
            long long v139 = 0u;
            long long v140 = 0u;
            if (v56 != v70) {
              double v54 = v71;
            }
            long long v137 = 0uLL;
            long long v138 = 0uLL;
            v74 = [v56 dataViews];
            uint64_t v75 = [v74 countByEnumeratingWithState:&v137 objects:v149 count:16];
            if (v75)
            {
              uint64_t v76 = v75;
              uint64_t v77 = *(void *)v138;
              while (2)
              {
                for (uint64_t j = 0; j != v76; ++j)
                {
                  if (*(void *)v138 != v77) {
                    objc_enumerationMutation(v74);
                  }
                  v79 = *(void **)(*((void *)&v137 + 1) + 8 * j);
                  if (v48 == v136)
                  {
                    double v53 = fmax(v53, v54);
                    if (v135 != 1)
                    {

                      goto LABEL_39;
                    }
                    uint64_t v48 = 0;
                    ++v39;
                    double v54 = 0.0;
                  }
                  v80 = [v56 dataViews];
                  v81 = [v80 firstObject];

                  double v82 = -0.0;
                  if (v79 != v81) {
                    double v82 = v58;
                  }
                  double v83 = v54 + v82;
                  objc_msgSend(v79, "tv_sizeThatFits:", v51, 0.0);
                  double v54 = v83 + v84;
                  ++v48;
                  double v67 = fmax(v67, v85);
                }
                uint64_t v76 = [v74 countByEnumeratingWithState:&v137 objects:v149 count:16];
                if (v76) {
                  continue;
                }
                break;
              }
            }

            double v53 = fmax(v53, v54);
            if (v48 == v136)
            {
LABEL_39:
              id v47 = v123;
              goto LABEL_41;
            }
            uint64_t v55 = v122 + 1;
            id v47 = v123;
            uint64_t v49 = v120;
          }
          while (v122 + 1 != v121);
          uint64_t v121 = [v123 countByEnumeratingWithState:&v141 objects:v150 count:16];
          if (v121) {
            continue;
          }
          break;
        }
      }
      else
      {
        double v52 = 0.0;
        double v134 = 0.0;
        double v67 = 0.0;
        double v53 = 0.0;
      }
LABEL_41:

      double v86 = v125;
      if (v125 == 0.0) {
        double v86 = v67;
      }
      uint64_t v87 = 1;
      if (v127 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v87 = -v127;
      }
      uint64_t v88 = v39 + v87;
      uint64_t v89 = v39 + v87 - 1;
      double v90 = v117 * (double)v89 + (double)v88 * v86;
      if (v127 == 0x7FFFFFFFFFFFFFFFLL || v124 <= 0.0)
      {
        double v94 = v117;
        uint64_t v42 = v39;
        double v91 = v129;
        double v17 = v130;
        double v92 = v128;
        uint64_t v93 = v126;
        if (v127 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_52;
        }
        goto LABEL_50;
      }
      double v92 = v128;
      double v91 = v129;
      double v17 = v130;
      uint64_t v93 = v126;
      if (v117 + v128 + v90 > v124)
      {
        double v17 = fmax(v130, v128);
        double v114 = v114 + v111 + v129;
        uint64_t v39 = v89;
        double v91 = v112;
        double v92 = v113;
LABEL_50:
        double v94 = 0.0;
        uint64_t v42 = v39;
        goto LABEL_52;
      }
      uint64_t v42 = v39;
      double v94 = v117;
LABEL_52:
      double v40 = v92 + v90 + v94;
      double v41 = fmax(v91, v52 + v134 + v53);
      uint64_t v39 = v42 + 1;
    }
    uint64_t v119 = [obj countByEnumeratingWithState:&v145 objects:v151 count:16];
  }
  while (v119);
LABEL_56:

  double v95 = v107 + v108 + fmax(v17, v40);
  double v96 = fmin(v95, v109);
  if (v109 > 0.0) {
    double v95 = v96;
  }
  double v97 = 1.79769313e308;
  if (height > 0.0) {
    double v97 = height;
  }
  double v98 = fmin(v97, v105 + v106 + v100 + v103 + v104 + v102 + v101 + v99 + v114 + v41);
  result.double height = v98;
  result.double width = v95;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v187 = *MEMORY[0x263EF8340];
  v181.receiver = self;
  v181.super_class = (Class)_TVInfoListView;
  [(_TVInfoListView *)&v181 layoutSubviews];
  [(_TVInfoListView *)self bounds];
  double v4 = v3;
  [(UIView *)self tv_padding];
  double v152 = v5;
  double v7 = v6;
  double v9 = v8;
  [(_TVInfoListView *)self interitemSpacing];
  double v132 = v10;
  [(_TVInfoListView *)self lineSpacing];
  double v125 = v11;
  int64_t v12 = [(_TVInfoListView *)self maxLineCount];
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0x7FFFFFFFLL;
  }
  double v14 = 0.0;
  double v15 = fmax(v4 - v7 - v9, 0.0);
  double v16 = [(_TVInfoListView *)self headerView];
  objc_msgSend(v16, "tv_margin");
  double v157 = v17;
  double v159 = v18;
  double v20 = v19;
  double v22 = v21;

  double v23 = [(_TVInfoListView *)self headerView];
  double v24 = v15 - (v20 + v22);
  objc_msgSend(v23, "tv_sizeThatFits:", v24, 0.0);
  double v26 = v25;

  double v27 = [(_TVInfoListView *)self footerView];
  objc_msgSend(v27, "tv_margin");
  double v123 = v28;
  double v30 = v29;
  double v32 = v31;

  double v33 = [(_TVInfoListView *)self footerView];
  double v122 = v30;
  double v130 = v15;
  objc_msgSend(v33, "tv_sizeThatFits:", v15 - (v30 + v32), 0.0);
  double v121 = v34;

  v35 = [(_TVInfoListView *)self headerView];
  double v153 = v7;
  double v124 = v24;
  objc_msgSend(v35, "setFrame:", v7 + v20, v152 + v157, v24, v26);

  double v131 = v159 + v152 + v157 + v26;
  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  v154 = self;
  obuint64_t j = [(_TVInfoListView *)self groupedInfos];
  uint64_t v128 = [obj countByEnumeratingWithState:&v177 objects:v186 count:16];
  if (v128)
  {
    uint64_t v129 = 0;
    double v36 = *MEMORY[0x263F00148];
    uint64_t v127 = *(void *)v178;
    uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v160 = v13;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v178 != v127)
        {
          uint64_t v39 = v38;
          objc_enumerationMutation(obj);
          uint64_t v38 = v39;
        }
        uint64_t v134 = v38;
        uint64_t v135 = v37;
        double v136 = v36;
        double v138 = v14;
        double v40 = *(void **)(*((void *)&v177 + 1) + 8 * v38);
        [(_TVInfoListView *)v154 _maxWidthForGroupInfos:v40];
        double v42 = v41;
        uint64_t v158 = [v40 count];
        long long v173 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        long long v176 = 0u;
        id v143 = v40;
        uint64_t v141 = [v143 countByEnumeratingWithState:&v173 objects:v185 count:16];
        double v133 = v42;
        if (v141)
        {
          uint64_t v43 = 0;
          uint64_t v139 = *(void *)v174;
          if (v42 <= 0.0) {
            double v44 = v130;
          }
          else {
            double v44 = v42;
          }
          double v45 = fmin(v44, fmax(v130, v42));
          double v46 = 0.0;
          double v47 = 0.0;
          uint64_t v48 = 1;
          double v155 = 0.0;
          double v156 = 0.0;
LABEL_14:
          uint64_t v49 = 0;
          while (1)
          {
            if (*(void *)v174 != v139) {
              objc_enumerationMutation(v143);
            }
            uint64_t v145 = v49;
            double v50 = *(void **)(*((void *)&v173 + 1) + 8 * v49);
            [v50 lineSpacing];
            double v52 = v51;
            [v50 headerMargin];
            double v147 = v53;
            double v150 = v54;
            [v50 headerPadding];
            double v56 = v55;
            double v58 = v57;
            double v59 = [v50 headerContentView];
            double v60 = [v50 headerContentView];
            objc_msgSend(v60, "tv_sizeThatFits:", v45, 0.0);
            double v62 = v61;
            double v64 = v63;

            v151 = v59;
            objc_msgSend(v59, "setBounds:", 0.0, 0.0, v62, v64);
            uint64_t v65 = [v143 firstObject];

            if (v50 == v65)
            {
              double v66 = v150;
            }
            else
            {
              double v46 = v46 + v150 + v58 + v147 + v56 + v64;
              double v66 = v156;
            }
            long long v171 = 0u;
            long long v172 = 0u;
            double v67 = v155;
            if (v50 == v65) {
              double v67 = v58 + v56 + v64;
            }
            double v155 = v67;
            double v156 = v66;
            long long v169 = 0uLL;
            long long v170 = 0uLL;
            double v68 = [v50 dataViews];
            uint64_t v69 = [v68 countByEnumeratingWithState:&v169 objects:v184 count:16];
            if (v69)
            {
              uint64_t v70 = v69;
              uint64_t v71 = *(void *)v170;
              while (2)
              {
                for (uint64_t i = 0; i != v70; ++i)
                {
                  if (*(void *)v170 != v71) {
                    objc_enumerationMutation(v68);
                  }
                  double v73 = *(void **)(*((void *)&v169 + 1) + 8 * i);
                  if (v13 >= 1 && v43 == v13)
                  {
                    double v47 = fmax(v47, v46);
                    if (v158 != 1)
                    {
                      uint64_t v43 = v13;
                      goto LABEL_37;
                    }
                    uint64_t v43 = 0;
                    ++v48;
                    double v46 = 0.0;
                  }
                  v74 = [v50 dataViews];
                  uint64_t v75 = [v74 firstObject];

                  double v76 = -0.0;
                  if (v73 != v75) {
                    double v76 = v52;
                  }
                  double v77 = v46 + v76;
                  objc_msgSend(v73, "tv_sizeThatFits:", v45, 0.0);
                  double v79 = v78;
                  double v81 = v80;
                  objc_msgSend(v73, "setBounds:", 0.0, 0.0, v78, v80);
                  double v46 = v77 + v81;
                  double v62 = fmax(v62, v79);
                  ++v43;
                  uint64_t v13 = v160;
                }
                uint64_t v70 = [v68 countByEnumeratingWithState:&v169 objects:v184 count:16];
                if (v70) {
                  continue;
                }
                break;
              }
            }
LABEL_37:

            double v47 = fmax(v47, v46);
            if (v43 == v13) {
              break;
            }
            uint64_t v49 = v145 + 1;
            if (v145 + 1 == v141)
            {
              uint64_t v141 = [v143 countByEnumeratingWithState:&v173 objects:v185 count:16];
              if (v141) {
                goto LABEL_14;
              }
              break;
            }
          }
        }
        else
        {
          double v47 = 0.0;
          uint64_t v48 = 1;
          double v62 = 0.0;
          double v155 = 0.0;
          double v156 = 0.0;
        }

        if (v133 == 0.0) {
          double v82 = v62;
        }
        else {
          double v82 = v133;
        }
        if (v135 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v37 = v129;
          double v83 = v136;
        }
        else
        {
          double v83 = v136;
          if (v130 <= 0.0 || (v84 = (double)v48, uint64_t v37 = v48 - 1, v136 + v132 * (double)v37 + v84 * v82 <= v130))
          {
            uint64_t v37 = v129;
          }
          else
          {
            double v131 = v131 + v125 + v138;
            double v83 = 0.0;
            double v138 = 0.0;
          }
        }
        long long v167 = 0u;
        long long v168 = 0u;
        long long v165 = 0u;
        long long v166 = 0u;
        id v85 = v143;
        uint64_t v140 = [v85 countByEnumeratingWithState:&v165 objects:v183 count:16];
        if (v140)
        {
          double v86 = v83;
          uint64_t v87 = 0;
          uint64_t v88 = *(void *)v166;
          double v89 = v131;
          id v144 = v85;
          uint64_t v137 = *(void *)v166;
          while (2)
          {
            uint64_t v90 = 0;
            do
            {
              if (*(void *)v166 != v88) {
                objc_enumerationMutation(v85);
              }
              uint64_t v142 = v90;
              double v91 = *(void **)(*((void *)&v165 + 1) + 8 * v90);
              [v91 lineSpacing];
              double v93 = v92;
              [v91 headerMargin];
              double v148 = v94;
              double v96 = v95;
              [v91 headerPadding];
              double v98 = v97;
              double v146 = v99;
              double v100 = [v91 headerContentView];
              [v100 bounds];
              double v102 = v101;
              double v103 = [v85 firstObject];

              double v104 = -0.0;
              if (v91 != v103) {
                double v104 = v148;
              }
              double v105 = v89 + v104;
              v149 = v100;
              -[_TVInfoListView _layouCellContentView:inCellBounds:](v154, "_layouCellContentView:inCellBounds:", v100, v153 + v86, v98 + v152 + v105, v82, v102);
              long long v163 = 0u;
              long long v164 = 0u;
              double v89 = v105 + v96 + v146 + v98 + v102;
              long long v161 = 0u;
              long long v162 = 0u;
              double v106 = [v91 dataViews];
              uint64_t v107 = [v106 countByEnumeratingWithState:&v161 objects:v182 count:16];
              if (v107)
              {
                uint64_t v108 = v107;
                uint64_t v109 = *(void *)v162;
                while (2)
                {
                  for (uint64_t j = 0; j != v108; ++j)
                  {
                    if (*(void *)v162 != v109) {
                      objc_enumerationMutation(v106);
                    }
                    double v111 = *(void **)(*((void *)&v161 + 1) + 8 * j);
                    if (v87 == v13)
                    {
                      if (v158 != 1)
                      {

                        goto LABEL_76;
                      }
                      uint64_t v87 = 0;
                      ++v37;
                      double v89 = v156 + v155 + v131;
                      double v112 = v132 + v82 + v86;
                    }
                    else
                    {
                      double v112 = v86;
                    }
                    double v113 = [v91 dataViews];
                    double v114 = [v113 firstObject];

                    double v115 = -0.0;
                    if (v111 != v114) {
                      double v115 = v93;
                    }
                    double v116 = v89 + v115;
                    [v111 bounds];
                    double v118 = v117;
                    double v86 = v112;
                    -[_TVInfoListView _layouCellContentView:inCellBounds:](v154, "_layouCellContentView:inCellBounds:", v111, v153 + v112, v152 + v116, v82);
                    double v89 = v116 + v118;
                    ++v87;
                    uint64_t v13 = v160;
                  }
                  uint64_t v108 = [v106 countByEnumeratingWithState:&v161 objects:v182 count:16];
                  if (v108) {
                    continue;
                  }
                  break;
                }
              }

              if (v87 == v13)
              {
LABEL_76:
                double v83 = v86;
                id v85 = v144;
                goto LABEL_77;
              }
              uint64_t v90 = v142 + 1;
              id v85 = v144;
              uint64_t v88 = v137;
            }
            while (v142 + 1 != v140);
            uint64_t v140 = [v144 countByEnumeratingWithState:&v165 objects:v183 count:16];
            if (v140) {
              continue;
            }
            break;
          }
          double v83 = v86;
LABEL_77:
          double v119 = v132 + v82;
        }
        else
        {
          double v119 = v132 + v82;
        }

        double v36 = v119 + v83;
        double v14 = fmax(v138, v47 + v156 + v155);
        uint64_t v129 = v37 + 1;
        uint64_t v38 = v134 + 1;
      }
      while (v134 + 1 != v128);
      uint64_t v128 = [obj countByEnumeratingWithState:&v177 objects:v186 count:16];
    }
    while (v128);
  }

  uint64_t v120 = [(_TVInfoListView *)v154 footerView];
  objc_msgSend(v120, "setFrame:", v153 + v122, v123 + v131 + v14, v124, v121);
}

- (double)_maxWidthForGroupInfos:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        double v9 = v7;
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v10 width];
        if (v11 != 0.0)
        {
          [v10 width];
          double v7 = v12;
          if (v9 != 0.0) {
            double v7 = fmin(v9, v12);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (void)_layouCellContentView:(id)a3 inCellBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  [v13 bounds];
  double v9 = v8;
  uint64_t v10 = objc_msgSend(v13, "tv_alignment");
  double v11 = x + width * 0.5;
  double v12 = x + v9 * 0.5;
  if (v10 == 3) {
    double v12 = x + width + v9 * -0.5;
  }
  if (v10 != 2) {
    double v11 = v12;
  }
  objc_msgSend(v13, "setCenter:", v11, y + height * 0.5);
}

- (int64_t)maxLineCount
{
  return self->_maxLineCount;
}

- (void)setMaxLineCount:(int64_t)a3
{
  self->_maxLineCount = a3;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedInfos, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end