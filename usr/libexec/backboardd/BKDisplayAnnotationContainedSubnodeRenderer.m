@interface BKDisplayAnnotationContainedSubnodeRenderer
- (BOOL)shouldRenderWithSupernode;
- (CALayer)backgroundLayer;
- (CGSize)_getFrames:(CGRect *)a3 ofAnnotations:(id)a4 fixSuperlayer:(id)a5 scale:(double)a6;
- (NSArray)subannotations;
- (NSMutableDictionary)sectionTitleAnnotations;
- (void)layoutAnnotationStack:(id)a3;
- (void)regenerateLayerTree;
- (void)setBackgroundLayer:(id)a3;
- (void)setSectionTitleAnnotations:(id)a3;
- (void)setSubannotations:(id)a3;
- (void)styleSheetDidChange;
@end

@implementation BKDisplayAnnotationContainedSubnodeRenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subannotations, 0);
  objc_storeStrong((id *)&self->_sectionTitleAnnotations, 0);

  objc_storeStrong((id *)&self->_backgroundLayer, 0);
}

- (void)setSubannotations:(id)a3
{
}

- (NSArray)subannotations
{
  return self->_subannotations;
}

- (void)setSectionTitleAnnotations:(id)a3
{
}

- (NSMutableDictionary)sectionTitleAnnotations
{
  return self->_sectionTitleAnnotations;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)layoutAnnotationStack:(id)a3
{
  id v4 = a3;
  id v104 = [(BKDisplayAnnotationRenderer *)self annotation];
  v5 = [v104 annotationController];
  v6 = [v5 rootLayer];
  id v108 = v5;
  v7 = [v5 transformLayer];
  id v103 = v6;
  [v6 rasterizationScale];
  v9 = v8;
  id v102 = v7;
  [v7 bounds];
  CGFloat v11 = v10;
  CGFloat v106 = v12;
  v100 = v13;
  CGFloat v15 = v14;
  v109 = self;
  id v105 = [(BKDisplayAnnotationRenderer *)self layer];
  [v105 frame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;
  CGFloat v23 = v22;
  v24 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v4 count]);
  id v111 = +[NSMutableDictionary dictionary];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v25 = v4;
  id v26 = [v25 countByEnumeratingWithState:&v120 objects:v126 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v121;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v121 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        uint64_t v31 = [v30 section];
        if (v31) {
          v32 = (__CFString *)v31;
        }
        else {
          v32 = &stru_1000FD108;
        }
        [v24 addObject:v32];
        v33 = [v111 objectForKey:v32];
        if (!v33)
        {
          v33 = +[NSMutableArray array];
          [v111 setObject:v33 forKey:v32];
        }
        [v33 addObject:v30];
      }
      id v27 = [v25 countByEnumeratingWithState:&v120 objects:v126 count:16];
    }
    while (v27);
  }

  v34 = +[NSMutableArray array];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v35 = v24;
  id v36 = [v35 countByEnumeratingWithState:&v116 objects:v125 count:16];
  p_isa = (id *)&v109->super.super.isa;
  id v107 = v35;
  if (v36)
  {
    id v38 = v36;
    double v110 = *(double *)v117;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v117 != *(void *)&v110) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v116 + 1) + 8 * (void)j);
        if ([v40 length])
        {
          v41 = [p_isa[5] objectForKey:v40];
          if (!v41)
          {
            id v42 = v25;
            v43 = v109;
            if (!v109->_sectionTitleAnnotations)
            {
              uint64_t v44 = +[NSMutableDictionary dictionary];
              sectionTitleAnnotations = v109->_sectionTitleAnnotations;
              v109->_sectionTitleAnnotations = (NSMutableDictionary *)v44;
            }
            v41 = +[BKDisplayAnnotation annotationWithString:v40];
            [v41 setAnnotationController:v108];
            v46 = +[BKDisplayAnnotationStyle emphasizedStyle];
            [v41 setStyleModifier:v46];

            [(NSMutableDictionary *)v43->_sectionTitleAnnotations setObject:v41 forKey:v40];
            id v25 = v42;
            id v35 = v107;
          }
          [v34 addObject:v41];

          p_isa = (id *)&v109->super.super.isa;
        }
        v47 = [v111 objectForKey:v40];
        [v34 addObjectsFromArray:v47];
      }
      id v38 = [v35 countByEnumeratingWithState:&v116 objects:v125 count:16];
    }
    while (v38);
  }

  [v34 count];
  v101 = &v96;
  v48 = &v96 - 4 * __chkstk_darwin();
  id v99 = v9;
  [p_isa _getFrames:v48 ofAnnotations:v34 fixSuperlayer:v105 scale:*(double *)&v9];
  double v110 = v49;
  double v51 = v50;
  id v52 = v104;
  id v53 = [v104 subnodeScreenEdgeTreatment];
  if (v53 == (id)2)
  {
    v127.origin.x = v11;
    CGFloat v98 = v11;
    CGFloat v54 = v106;
    v127.origin.double y = v106;
    CGFloat v55 = *(double *)&v100;
    *(void *)&v127.size.width = v100;
    v127.size.height = v15;
    CGFloat MaxX = CGRectGetMaxX(v127);
    CGFloat v97 = v15;
    CGFloat v57 = v23;
    double v58 = MaxX;
    v128.origin.x = v17;
    v128.origin.double y = v19;
    v128.size.width = v21;
    v128.size.height = v57;
    double v59 = v58 - (v110 + CGRectGetMaxX(v128));
    if (v59 >= 0.0) {
      double v59 = -0.0;
    }
    double v60 = v21 + v59;
    v129.size.height = v97;
    v129.origin.x = v98;
    v129.origin.double y = v54;
    v129.size.width = v55;
    double MaxY = CGRectGetMaxY(v129);
    v130.origin.x = v17;
    v130.origin.double y = v19;
    v130.size.width = v21;
    v130.size.height = v57;
    double v62 = MaxY - (v51 + CGRectGetMinY(v130));
    double v63 = 0.0;
    if (v62 >= 0.0) {
      double v64 = 0.0;
    }
    else {
      double v64 = v62 + 0.0;
    }
  }
  else
  {
    id v65 = v53;
    v131.origin.x = v17;
    v131.origin.double y = v19;
    v131.size.width = v21;
    v131.size.height = v23;
    CGFloat v66 = CGRectGetMaxX(v131);
    v132.size.height = v15;
    CGFloat v67 = v19;
    CGFloat v68 = v23;
    double v69 = v110;
    double v70 = v110 + v66;
    v132.origin.x = v11;
    v132.origin.double y = v106;
    *(void *)&v132.size.width = v100;
    CGFloat v71 = CGRectGetMaxX(v132);
    CGFloat v72 = v17;
    double v73 = v71;
    v133.origin.x = v72;
    v133.origin.double y = v67;
    v133.size.width = v21;
    v133.size.height = v68;
    BOOL v74 = CGRectGetMinX(v133) - v69 >= 0.0;
    if (v65 != (id)1) {
      BOOL v74 = (BOOL)v65;
    }
    uint64_t v76 = v70 > v73 && v65 == 0 || v74;
    double v64 = 0.0;
    if (v76 == 1) {
      double v60 = 0.0;
    }
    else {
      double v60 = v21;
    }
    if (v76 == 1) {
      double v63 = 1.0;
    }
    else {
      double v63 = 0.0;
    }
    [v52 setSubnodeScreenEdgeTreatment:];
  }
  v77 = p_isa + 4;
  id v78 = p_isa[4];
  v79 = objc_alloc_init(BKDisplayAnnotationStyleSheet);
  v80 = +[BKDisplayAnnotationStyle rectangleStyle];
  [(BKDisplayAnnotationStyleSheet *)v79 setBaseStyle:v80];

  v81 = +[BKDisplayAnnotationStyle textBackgroundStyle];
  [(BKDisplayAnnotationStyleSheet *)v79 setStyleModifier:v81];

  v82 = +[BKDisplayAnnotationShapeContent contentWithSize:](BKDisplayAnnotationShapeContent, "contentWithSize:", v110, v51);
  if (!v78) {
    id v78 = [(BKDisplayAnnotationStyleSheet *)v79 newLayerForContent:v82 scale:*(double *)&v99];
  }
  id v99 = v82;
  v100 = v79;
  [(BKDisplayAnnotationStyleSheet *)v79 applyToLayer:v78 forContent:v82];
  double v83 = 0.0;
  [v78 setAnchorPoint:v63];
  [v78 setPosition:v60, v64];
  [v105 insertSublayer:v78 atIndex:0];
  objc_storeStrong(v77, v78);
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  v84 = v34;
  id v85 = [(NSArray *)v84 countByEnumeratingWithState:&v112 objects:v124 count:16];
  if (v85)
  {
    id v86 = v85;
    double v87 = 0.0;
    uint64_t v88 = *(void *)v113;
    double y = CGPointZero.y;
    *(void *)&CGFloat v106 = v48 + 2;
    do
    {
      v90 = 0;
      double v110 = v87;
      uint64_t v91 = *(void *)&v106 + 32 * *(void *)&v87;
      do
      {
        if (*(void *)v113 != v88) {
          objc_enumerationMutation(v84);
        }
        v92 = [*(id *)(*((void *)&v112 + 1) + 8 * (void)v90) renderer];
        v93 = [v92 layer];

        [v78 addSublayer:v93];
        [v93 setAnchorPoint:CGPointZero.x, y];
        [v93 setPosition:0.0, v83];
        CGRect v134 = *(CGRect *)(v91 - 16);
        v91 += 32;
        double v83 = v83 + CGRectGetMaxY(v134);

        v90 = (char *)v90 + 1;
      }
      while (v86 != v90);
      *(void *)&double v87 = (char *)v90 + *(void *)&v110;
      id v86 = [(NSArray *)v84 countByEnumeratingWithState:&v112 objects:v124 count:16];
    }
    while (v86);
  }

  subannotations = v109->_subannotations;
  v109->_subannotations = v84;
  v95 = v84;
}

- (CGSize)_getFrames:(CGRect *)a3 ofAnnotations:(id)a4 fixSuperlayer:(id)a5 scale:(double)a6
{
  id v9 = a4;
  id v10 = a5;
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v32;
    p_size = &a3->size;
    do
    {
      CGFloat v17 = 0;
      p_double width = &p_size[2 * v15].width;
      do
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v9);
        }
        CGFloat v19 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v17);
        double v20 = [v19 renderer];
        double v21 = [v20 layer];

        id v22 = [v21 superlayer];

        if (v22 != v10)
        {
          [v21 removeFromSuperlayer];
          [v10 addSublayer:v21];
        }
        CGFloat v23 = [v19 renderer];
        [v23 sizeLayerToFitAtScale:a6];

        [v21 frame];
        *((void *)p_width - 2) = v26;
        *((void *)p_width - 1) = v27;
        *p_double width = v24;
        p_width[1] = v25;
        p_width += 4;
        if (v24 > width) {
          double width = v24;
        }
        double height = height + v25;

        CGFloat v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      v15 += (uint64_t)v17;
      id v14 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  double v28 = width;
  double v29 = height;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (void)regenerateLayerTree
{
  v8.receiver = self;
  v8.super_class = (Class)BKDisplayAnnotationContainedSubnodeRenderer;
  [(BKDisplayAnnotationRenderer *)&v8 regenerateLayerTree];
  v3 = [(BKDisplayAnnotationRenderer *)self annotation];
  id v4 = [v3 namespaceNode];
  +[NSMutableArray array];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007B93C;
  v6[3] = &unk_1000F7DE0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v5;
  [v4 enumerateNodesWithOptions:1 usingBlock:v6];
  if ([v5 count]) {
    [(BKDisplayAnnotationContainedSubnodeRenderer *)self layoutAnnotationStack:v5];
  }
}

- (void)styleSheetDidChange
{
  v20.receiver = self;
  v20.super_class = (Class)BKDisplayAnnotationContainedSubnodeRenderer;
  [(BKDisplayAnnotationRenderer *)&v20 styleSheetDidChange];
  v3 = [(BKDisplayAnnotationRenderer *)self annotation];
  id v4 = [v3 styleSheet];
  backgroundLayer = self->_backgroundLayer;
  v6 = +[BKDisplayAnnotationStringContent contentWithString:&stru_1000FD108];
  [v4 applyToLayer:backgroundLayer forContent:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = self->_subannotations;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 styleSheet:v16];
        id v14 = [v4 subnodeStyleModifier];
        [v13 setStyleModifier:v14];

        uint64_t v15 = [v12 renderer];
        [v15 styleSheetDidChange];
      }
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }
}

- (BOOL)shouldRenderWithSupernode
{
  return 0;
}

@end