@interface TUIGridBoxLayout
- (TUIGridBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (id)defaultGuideSpecForLayout:(id)a3 edge:(unint64_t)a4;
- (id)guideForLayout:(id)a3 spec:(id)a4;
- (id)guideLayoutControllerForLayout:(id)a3;
- (void)computeLayout;
- (void)onChildInvalidate:(id)a3;
- (void)onChildrenUpdated;
@end

@implementation TUIGridBoxLayout

- (TUIGridBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)TUIGridBoxLayout;
  v5 = [(TUILayout *)&v11 initWithModel:a3 parent:a4 controller:a5];
  v6 = v5;
  if (v5)
  {
    [(TUILayout *)v5 specifiedWidth];
    if ((v7 & 0x6000000000000) == 0x2000000000000) {
      [(TUILayout *)v6 setSpecifiedWidthComputeInherited:1];
    }
    v8 = objc_alloc_init(TUIGuideLayoutController);
    guideLayoutController = v6->_guideLayoutController;
    v6->_guideLayoutController = v8;
  }
  return v6;
}

- (id)guideForLayout:(id)a3 spec:(id)a4
{
  return [(TUIGuideLayoutController *)self->_guideLayoutController guideForSpec:a4];
}

- (id)guideLayoutControllerForLayout:(id)a3
{
  return self->_guideLayoutController;
}

- (id)defaultGuideSpecForLayout:(id)a3 edge:(unint64_t)a4
{
  return 0;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  v5 = [(TUILayout *)self box];
  [v5 insets];
  double v7 = v6;
  double v9 = v8;
  double v125 = v10;
  double v12 = v11;

  double v13 = fmax(v4 - v9 - v12, 1.0);
  v14 = [(TUILayout *)self box];
  [v14 spacing];
  double v16 = v15;

  v17 = [(TUILayout *)self box];
  id v18 = [v17 columns];

  if ((unint64_t)v18 <= 1) {
    unint64_t v19 = 1;
  }
  else {
    unint64_t v19 = (unint64_t)v18;
  }
  double v20 = (v13 + v16) / (double)v19 - v16;
  double v129 = v4;
  unint64_t v126 = [(TUILayout *)self computedLayoutDirection];
  uint64_t v21 = 0;
  if (v126 == 2)
  {
    double v22 = v4 - v12;
    double v23 = v22;
    do
    {
      guideLayoutController = self->_guideLayoutController;
      v25 = +[TUIGuideSpec columnWithIndex:v21 edge:0];
      id v26 = [(TUIGuideLayoutController *)guideLayoutController guideForSpec:v25 withOffset:v23];

      double v27 = v23 - v20;
      v28 = self->_guideLayoutController;
      v29 = +[TUIGuideSpec columnWithIndex:v21 edge:1];
      id v30 = [(TUIGuideLayoutController *)v28 guideForSpec:v29 withOffset:v27];

      double v23 = v27 - v16;
      ++v21;
    }
    while (v19 != v21);
    double v31 = 0.0;
    double v32 = v9;
    double v33 = v129;
  }
  else
  {
    double v32 = v4 - v12;
    double v34 = v9;
    do
    {
      v35 = self->_guideLayoutController;
      v36 = +[TUIGuideSpec columnWithIndex:v21 edge:0];
      id v37 = [(TUIGuideLayoutController *)v35 guideForSpec:v36 withOffset:v34];

      double v38 = v20 + v34;
      v39 = self->_guideLayoutController;
      v40 = +[TUIGuideSpec columnWithIndex:v21 edge:1];
      id v41 = [(TUIGuideLayoutController *)v39 guideForSpec:v40 withOffset:v38];

      double v34 = v16 + v38;
      ++v21;
    }
    while (v19 != v21);
    double v33 = 0.0;
    double v22 = v9;
    double v31 = v129;
  }
  [(TUIGuideLayoutController *)self->_guideLayoutController reset];
  v42 = self->_guideLayoutController;
  v43 = +[TUIGuideSpec gridWithEdge:2];
  v128 = [(TUIGuideLayoutController *)v42 guideForSpec:v43];

  v44 = self->_guideLayoutController;
  v45 = +[TUIGuideSpec gridWithEdge:3];
  v127 = [(TUIGuideLayoutController *)v44 guideForSpec:v45];

  v46 = self->_guideLayoutController;
  v47 = +[TUIGuideSpec contentWithEdge:2];
  v132 = [(TUIGuideLayoutController *)v46 guideForSpec:v47];

  v48 = self->_guideLayoutController;
  v49 = +[TUIGuideSpec contentWithEdge:3];
  v131 = [(TUIGuideLayoutController *)v48 guideForSpec:v49];

  v50 = self->_guideLayoutController;
  v51 = +[TUIGuideSpec gridWithEdge:0];
  id v52 = [(TUIGuideLayoutController *)v50 guideForSpec:v51 withOffset:v33];

  v53 = self->_guideLayoutController;
  v54 = +[TUIGuideSpec gridWithEdge:1];
  id v55 = [(TUIGuideLayoutController *)v53 guideForSpec:v54 withOffset:v31];

  v56 = self->_guideLayoutController;
  v57 = +[TUIGuideSpec contentWithEdge:0];
  id v58 = [(TUIGuideLayoutController *)v56 guideForSpec:v57 withOffset:v22];

  v59 = self->_guideLayoutController;
  v60 = +[TUIGuideSpec contentWithEdge:1];
  id v61 = [(TUIGuideLayoutController *)v59 guideForSpec:v60 withOffset:v32];

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id obj = [(TUILayout *)self children];
  id v62 = [obj countByEnumeratingWithState:&v137 objects:v142 count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v138;
    do
    {
      for (i = 0; i != v63; i = (char *)i + 1)
      {
        if (*(void *)v138 != v64) {
          objc_enumerationMutation(obj);
        }
        v66 = *(void **)(*((void *)&v137 + 1) + 8 * i);
        uint64_t v67 = [v66 effectiveGuideLeading];
        double v68 = v13;
        if (v67)
        {
          v69 = (void *)v67;
          v70 = [v66 effectiveGuideTrailing];

          double v68 = v13;
          if (v70)
          {
            v71 = [v66 effectiveGuideTrailing];
            [v71 guideOffset];
            double v73 = v72;
            v74 = [v66 effectiveGuideLeading];
            [v74 guideOffset];
            double v68 = vabdd_f64(v73, v75);
          }
        }
        [v66 setContainingWidth:v68];
        [(TUILayout *)self containingHeight];
        [v66 setContainingHeight:];
        [v66 setFlexedHeight:NAN];
        [v66 validateLayout];
        uint64_t v76 = [v66 effectiveGuideTop];
        v77 = (void *)v76;
        v78 = v132;
        if (v76) {
          v78 = (void *)v76;
        }
        id v79 = v78;

        uint64_t v80 = [v66 effectiveGuideBottom];
        v81 = (void *)v80;
        v82 = v131;
        if (v80) {
          v82 = (void *)v80;
        }
        id v83 = v82;

        v84 = self->_guideLayoutController;
        id v85 = [v66 computedHeight];
        -[TUIGuideLayoutController addEdgeFrom:to:length:](v84, "addEdgeFrom:to:length:", v79, v83, v85, v86);
      }
      id v63 = [obj countByEnumeratingWithState:&v137 objects:v142 count:16];
    }
    while (v63);
  }
  uint64_t v87 = 0x7FC00000FF7FFFFFLL;

  uint64_t v88 = 0x7FC00000FF7FFFFFLL;
  if (v7 > -3.40282347e38)
  {
    if (v7 < 3.40282347e38)
    {
      *(float *)&unsigned int v89 = v7;
      uint64_t v88 = v89 | 0x7FC0000000000000;
    }
    else
    {
      uint64_t v88 = 0x7FC000007F7FFFFFLL;
    }
  }
  -[TUIGuideLayoutController addEdgeFrom:to:length:](self->_guideLayoutController, "addEdgeFrom:to:length:", v128, v132, v88, 2143289344);
  if (v125 > -3.40282347e38)
  {
    if (v125 < 3.40282347e38)
    {
      *(float *)&unsigned int v90 = v125;
      uint64_t v87 = v90 | 0x7FC0000000000000;
    }
    else
    {
      uint64_t v87 = 0x7FC000007F7FFFFFLL;
    }
  }
  -[TUIGuideLayoutController addEdgeFrom:to:length:](self->_guideLayoutController, "addEdgeFrom:to:length:", v131, v127, v87, 2143289344);
  [(TUIGuideLayoutController *)self->_guideLayoutController solve];
  [(TUIGuideLayoutController *)self->_guideLayoutController computeLength];
  double v92 = v91;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  v93 = [(TUILayout *)self children];
  id v94 = [v93 countByEnumeratingWithState:&v133 objects:v141 count:16];
  if (v94)
  {
    id v95 = v94;
    uint64_t v96 = *(void *)v134;
    do
    {
      for (j = 0; j != v95; j = (char *)j + 1)
      {
        if (*(void *)v134 != v96) {
          objc_enumerationMutation(v93);
        }
        v98 = *(void **)(*((void *)&v133 + 1) + 8 * (void)j);
        [v98 computedTransformedSize];
        double v100 = v99;
        double v102 = v101;
        v103 = [v98 effectiveGuideLeading];

        if (v103)
        {
          v104 = [v98 effectiveGuideLeading];
          [v104 guideOffset];
          double v106 = v105 - v100;
        }
        else
        {
          v107 = [v98 effectiveGuideTrailing];

          double v108 = v9;
          if (!v107) {
            goto LABEL_46;
          }
          v104 = [v98 effectiveGuideTrailing];
          [v104 guideOffset];
          double v106 = v109;
          double v105 = v109 - v100;
        }
        if (v126 == 2) {
          double v108 = v106;
        }
        else {
          double v108 = v105;
        }

LABEL_46:
        v110 = [v98 effectiveGuideTop];

        if (v110)
        {
          v111 = [v98 effectiveGuideTop];
          [v111 guideOffset];
          double v113 = v112;
        }
        else
        {
          v114 = [v98 effectiveGuideBottom];

          double v113 = v7;
          if (!v114) {
            goto LABEL_51;
          }
          v111 = [v98 effectiveGuideBottom];
          [v111 guideOffset];
          double v113 = v115 - v102;
        }

LABEL_51:
        uint64_t v116 = [v98 effectiveGuideTop];
        if (v116)
        {
          v117 = (void *)v116;
          v118 = [v98 effectiveGuideBottom];

          double v119 = v102;
          if (v118)
          {
            v120 = [v98 effectiveGuideBottom];
            [v120 guideOffset];
            double v122 = v121;
            v123 = [v98 effectiveGuideTop];
            [v123 guideOffset];
            double v119 = fmax(v122 - v124, 0.0);
          }
        }
        else
        {
          double v119 = v102;
        }
        if (v102 != v119)
        {
          [v98 setFlexedHeight:v119];
          [v98 validateLayout];
        }
        [v98 setComputedOrigin:v108, v113];
      }
      id v95 = [v93 countByEnumeratingWithState:&v133 objects:v141 count:16];
    }
    while (v95);
  }

  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v129, v92);
}

- (void)onChildInvalidate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUIGridBoxLayout;
  id v3 = a3;
  [(TUILayout *)&v4 onChildInvalidate:v3];
  [v3 setFlexedHeight:NAN];
}

- (void)onChildrenUpdated
{
  v3.receiver = self;
  v3.super_class = (Class)TUIGridBoxLayout;
  [(TUILayout *)&v3 onChildrenUpdated];
  [(TUILayout *)self validateGuides];
}

- (void).cxx_destruct
{
}

@end