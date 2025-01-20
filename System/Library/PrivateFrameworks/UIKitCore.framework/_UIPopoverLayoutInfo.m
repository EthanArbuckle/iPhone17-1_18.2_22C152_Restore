@interface _UIPopoverLayoutInfo
+ (id)_observationKeys;
- (BOOL)_updatesEnabled;
- (BOOL)canOverlapSourceViewRect;
- (BOOL)isRTL;
- (BOOL)preferLandscapeOrientations;
- (CGRect)_effectiveViewSourceRect;
- (CGRect)containingFrame;
- (CGRect)frame;
- (CGRect)sourceViewRect;
- (CGSize)_popoverViewSizeForContentSize:(CGSize)a3 arrowDirection:(unint64_t)a4;
- (CGSize)preferredContentSize;
- (UIEdgeInsets)containingFrameInsets;
- (UIEdgeInsets)contentInset;
- (_UIPopoverLayoutInfo)init;
- (double)arrowHeight;
- (double)arrowOffset;
- (double)offset;
- (id)candidates;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)preferredHorizontalAlignment;
- (unint64_t)arrowDirection;
- (unint64_t)preferredArrowDirections;
- (void)_setUpdatesEnabled:(BOOL)a3;
- (void)_updateOutputs;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setArrowHeight:(double)a3;
- (void)setArrowOffset:(double)a3;
- (void)setCanOverlapSourceViewRect:(BOOL)a3;
- (void)setContainingFrame:(CGRect)a3;
- (void)setContainingFrameInsets:(UIEdgeInsets)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setPreferLandscapeOrientations:(BOOL)a3;
- (void)setPreferredArrowDirections:(unint64_t)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPreferredHorizontalAlignment:(int64_t)a3;
- (void)setSourceViewRect:(CGRect)a3;
- (void)updateProperties:(id)a3;
@end

@implementation _UIPopoverLayoutInfo

- (void)updateProperties:(id)a3
{
  v4 = (void (**)(void))a3;
  [(_UIPopoverLayoutInfo *)self _setUpdatesEnabled:0];
  v4[2](v4);

  [(_UIPopoverLayoutInfo *)self _setUpdatesEnabled:1];
  [(_UIPopoverLayoutInfo *)self _updateOutputs];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 _setUpdatesEnabled:0];
  objc_msgSend(v4, "setContentInset:", self->_contentInset.top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
  [v4 setArrowHeight:self->_arrowHeight];
  [v4 setArrowOffset:self->_arrowOffset];
  objc_msgSend(v4, "setPreferredContentSize:", self->_preferredContentSize.width, self->_preferredContentSize.height);
  [v4 setPreferredArrowDirections:self->_preferredArrowDirections];
  objc_msgSend(v4, "setContainingFrame:", self->_containingFrame.origin.x, self->_containingFrame.origin.y, self->_containingFrame.size.width, self->_containingFrame.size.height);
  objc_msgSend(v4, "setContainingFrameInsets:", self->_containingFrameInsets.top, self->_containingFrameInsets.left, self->_containingFrameInsets.bottom, self->_containingFrameInsets.right);
  objc_msgSend(v4, "setSourceViewRect:", self->_sourceViewRect.origin.x, self->_sourceViewRect.origin.y, self->_sourceViewRect.size.width, self->_sourceViewRect.size.height);
  [v4 setCanOverlapSourceViewRect:self->_canOverlapSourceViewRect];
  [v4 setPreferLandscapeOrientations:self->_preferLandscapeOrientations];
  [v4 setPreferredHorizontalAlignment:self->_preferredHorizontalAlignment];
  [v4 setIsRTL:self->_isRTL];
  [v4 _setUpdatesEnabled:1];
  [v4 _updateOutputs];
  return v4;
}

- (void)_setUpdatesEnabled:(BOOL)a3
{
  self->_updatesEnabled = a3;
}

- (void)_updateOutputs
{
  v156[14] = *MEMORY[0x1E4F143B8];
  [(_UIPopoverLayoutInfo *)self _effectiveViewSourceRect];
  CGFloat v5 = v4;
  CGFloat v6 = v3;
  CGFloat v8 = v7;
  double v10 = v9;
  double width = self->_containingFrame.size.width;
  double height = self->_containingFrame.size.height;
  double top = self->_containingFrameInsets.top;
  double left = self->_containingFrameInsets.left;
  double bottom = self->_containingFrameInsets.bottom;
  double right = self->_containingFrameInsets.right;
  double v17 = width - (left + right);
  double v18 = height - (top + bottom);
  double v138 = v8;
  double v139 = v10;
  double v140 = v3;
  double rect = v4;
  double v152 = self->_containingFrame.origin.x + left;
  double v153 = self->_containingFrame.origin.y + top;
  if (self->_preferredArrowDirections)
  {
    double v149 = width - (left + right);
    double v150 = height - (top + bottom);
    double v19 = v3 + floor(v10 * 0.5);
    double v20 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    *(void *)&v148[16] = *(void *)(MEMORY[0x1E4F1DB28] + 16);
    *(void *)&v148[24] = *(void *)(MEMORY[0x1E4F1DB28] + 24);
    -[_UIPopoverLayoutInfo _popoverViewSizeForContentSize:arrowDirection:](self, "_popoverViewSizeForContentSize:arrowDirection:", 4, self->_preferredContentSize.width, self->_preferredContentSize.height);
    double v146 = v22;
    double v24 = v23;
    -[_UIPopoverLayoutInfo _popoverViewSizeForContentSize:arrowDirection:](self, "_popoverViewSizeForContentSize:arrowDirection:", 1, self->_preferredContentSize.width, self->_preferredContentSize.height);
    double v25 = v8;
    double v27 = v26;
    double v28 = v5;
    double v30 = v29;
    unint64_t preferredArrowDirections = self->_preferredArrowDirections;
    double v32 = v28 + v25;
    double v33 = v19 - floor(v24 * 0.5);
    *(double *)v148 = v20;
    *(double *)&v148[8] = v21;
    if ((preferredArrowDirections & 4) != 0) {
      double v34 = v28 + v25;
    }
    else {
      double v34 = v20;
    }
    if ((preferredArrowDirections & 4) == 0) {
      double v33 = v21;
    }
    CGFloat v127 = v33;
    CGFloat v128 = v34;
    if ((preferredArrowDirections & 4) != 0) {
      double v35 = v146;
    }
    else {
      double v35 = *(double *)&v148[16];
    }
    double v36 = *(double *)&v148[24];
    if ((preferredArrowDirections & 4) != 0) {
      double v36 = v24;
    }
    CGFloat v125 = v36;
    CGFloat v126 = v35;
    int64_t preferredHorizontalAlignment = self->_preferredHorizontalAlignment;
    if (preferredHorizontalAlignment == 1)
    {
      BOOL v38 = [(_UIPopoverLayoutInfo *)self isRTL];
      double v39 = v32 - v27;
      double v40 = v28;
    }
    else
    {
      if (preferredHorizontalAlignment != 2)
      {
        double v40 = rect + floor(v138 * 0.5) - floor(v27 * 0.5);
        double v54 = v153;
LABEL_29:
        double v64 = v20;
        double v63 = v21;
        double v65 = *(double *)&v148[16];
        double v66 = *(double *)&v148[24];
        if (preferredArrowDirections)
        {
          double v63 = v140 + v139;
          double v64 = v40;
          double v65 = v27;
          double v66 = v30;
        }
        uint64_t v67 = 0;
        unsigned int v68 = 0;
        double v69 = v19 - floor(v24 * 0.5);
        if ((preferredArrowDirections & 8) != 0) {
          double v70 = rect - v146;
        }
        else {
          double v70 = v20;
        }
        if ((preferredArrowDirections & 8) != 0) {
          double v71 = v69;
        }
        else {
          double v71 = v21;
        }
        if ((preferredArrowDirections & 8) != 0) {
          double v72 = v146;
        }
        else {
          double v72 = *(double *)&v148[16];
        }
        if ((preferredArrowDirections & 8) != 0) {
          double v73 = v24;
        }
        else {
          double v73 = *(double *)&v148[24];
        }
        BOOL v74 = (preferredArrowDirections & 2) == 0;
        BOOL preferLandscapeOrientations = self->_preferLandscapeOrientations;
        if (v74) {
          double v76 = v20;
        }
        else {
          double v76 = v40;
        }
        if (v74) {
          double v77 = v21;
        }
        else {
          double v77 = v140 - v30;
        }
        if (v74) {
          double v78 = *(double *)&v148[16];
        }
        else {
          double v78 = v27;
        }
        if (v74) {
          double v79 = *(double *)&v148[24];
        }
        else {
          double v79 = v30;
        }
        if (self->_preferLandscapeOrientations) {
          double v80 = v128;
        }
        else {
          double v80 = v76;
        }
        if (self->_preferLandscapeOrientations) {
          double v81 = v127;
        }
        else {
          double v81 = v77;
        }
        *(double *)v155 = v80;
        *(double *)&v155[1] = v81;
        if (preferLandscapeOrientations) {
          double v82 = v126;
        }
        else {
          double v82 = v78;
        }
        if (preferLandscapeOrientations) {
          double v83 = v125;
        }
        else {
          double v83 = v79;
        }
        *(double *)v156 = v82;
        *(double *)&v156[1] = v83;
        if (preferLandscapeOrientations) {
          double v84 = v70;
        }
        else {
          double v84 = v128;
        }
        if (preferLandscapeOrientations) {
          double v85 = v71;
        }
        else {
          double v85 = v127;
        }
        *(double *)&v156[2] = v84;
        *(double *)&v156[3] = v85;
        v86 = (double *)v156;
        if (preferLandscapeOrientations) {
          double v87 = v72;
        }
        else {
          double v87 = v126;
        }
        if (preferLandscapeOrientations) {
          double v88 = v73;
        }
        else {
          double v88 = v125;
        }
        rect_8.origin.CGFloat x = v76;
        rect_8.origin.CGFloat y = v77;
        if (preferLandscapeOrientations) {
          double v89 = v76;
        }
        else {
          double v89 = v64;
        }
        if (preferLandscapeOrientations) {
          double v90 = v77;
        }
        else {
          double v90 = v63;
        }
        rect_8.size.double width = v78;
        rect_8.size.double height = v79;
        if (preferLandscapeOrientations) {
          double v91 = v78;
        }
        else {
          double v91 = v65;
        }
        if (preferLandscapeOrientations) {
          double v92 = v79;
        }
        else {
          double v92 = v66;
        }
        *(double *)&v156[4] = v87;
        *(double *)&v156[5] = v88;
        CGFloat v131 = v71;
        CGFloat v132 = v70;
        CGFloat v136 = v64;
        CGFloat v137 = v63;
        if (preferLandscapeOrientations) {
          double v93 = v64;
        }
        else {
          double v93 = v70;
        }
        if (preferLandscapeOrientations) {
          double v94 = v63;
        }
        else {
          double v94 = v71;
        }
        *(double *)&v156[6] = v89;
        *(double *)&v156[7] = v90;
        CGFloat v129 = v73;
        CGFloat v130 = v72;
        CGFloat v134 = v66;
        CGFloat v135 = v65;
        if (preferLandscapeOrientations) {
          double v95 = v65;
        }
        else {
          double v95 = v72;
        }
        if (preferLandscapeOrientations) {
          double v96 = v66;
        }
        else {
          double v96 = v73;
        }
        *(double *)&v156[8] = v91;
        *(double *)&v156[9] = v92;
        *(double *)&v156[10] = v93;
        *(double *)&v156[11] = v94;
        *(double *)&v156[12] = v95;
        *(double *)&v156[13] = v96;
        double r1 = v140 - v54;
        double v154 = 0.0;
        double v143 = v20;
        double v144 = v21;
        double v145 = *(double *)&v148[16];
        double v147 = *(double *)&v148[24];
        do
        {
          CGFloat v97 = *(v86 - 2);
          if (self->_canOverlapSourceViewRect)
          {
            CGFloat v98 = *(v86 - 1);
            CGFloat v99 = *v86;
            CGFloat y = v54;
            double v101 = v149;
            double v103 = v150;
            CGFloat x = v152;
            CGFloat v104 = v86[1];
          }
          else
          {
            CGFloat v98 = *(v86 - 1);
            CGFloat v99 = *v86;
            CGFloat v104 = v86[1];
            v169.origin.CGFloat x = *(v86 - 2);
            v169.origin.CGFloat y = v98;
            v169.size.double width = *v86;
            v169.size.double height = v104;
            if (CGRectEqualToRect(v169, rect_8))
            {
              v191.size.double height = v150;
              v170.origin.CGFloat x = v152;
              v170.origin.CGFloat y = v54;
              v170.size.double width = v149;
              v170.size.double height = r1;
              v191.origin.CGFloat x = v152;
              v191.origin.CGFloat y = v54;
              v191.size.double width = v149;
              CGRect v171 = CGRectIntersection(v170, v191);
              CGFloat x = v171.origin.x;
              CGFloat y = v171.origin.y;
              double v101 = v171.size.width;
              double v103 = v171.size.height;
            }
            else
            {
              v172.origin.CGFloat x = v97;
              v172.origin.CGFloat y = v98;
              v172.size.double width = v99;
              v172.size.double height = v104;
              v192.origin.CGFloat x = v136;
              v192.origin.CGFloat y = v137;
              v192.size.double height = v134;
              v192.size.double width = v135;
              if (CGRectEqualToRect(v172, v192))
              {
                v173.origin.CGFloat x = rect;
                v173.origin.CGFloat y = v140;
                v173.size.double width = v138;
                v173.size.double height = v139;
                double v103 = v150 - (CGRectGetMaxY(v173) - v54);
                v174.origin.CGFloat x = rect;
                v174.origin.CGFloat y = v140;
                v174.size.double width = v138;
                v174.size.double height = v139;
                CGFloat y = CGRectGetMaxY(v174);
                CGFloat x = v152;
                double v101 = v149;
              }
              else
              {
                v175.origin.CGFloat x = v97;
                v175.origin.CGFloat y = v98;
                v175.size.double width = v99;
                v175.size.double height = v104;
                v193.origin.CGFloat y = v131;
                v193.origin.CGFloat x = v132;
                v193.size.double height = v129;
                v193.size.double width = v130;
                if (CGRectEqualToRect(v175, v193))
                {
                  v176.origin.CGFloat y = v140;
                  v176.origin.CGFloat x = rect;
                  v176.size.double width = v138;
                  v176.size.double height = v139;
                  CGFloat x = v152;
                  double v101 = CGRectGetMidX(v176) - v152;
                  CGFloat y = v54;
                }
                else
                {
                  v177.origin.CGFloat x = v97;
                  v177.origin.CGFloat y = v98;
                  v177.size.double width = v99;
                  v177.size.double height = v104;
                  v194.origin.CGFloat y = v127;
                  v194.origin.CGFloat x = v128;
                  v194.size.double height = v125;
                  v194.size.double width = v126;
                  if (CGRectEqualToRect(v177, v194))
                  {
                    v178.origin.CGFloat x = rect;
                    v178.origin.CGFloat y = v140;
                    v178.size.double width = v138;
                    v178.size.double height = v139;
                    double v101 = v149 - (CGRectGetMidX(v178) - v152);
                    v179.origin.CGFloat x = rect;
                    v179.origin.CGFloat y = v140;
                    v179.size.double width = v138;
                    v179.size.double height = v139;
                    CGFloat x = CGRectGetMidX(v179);
                    CGFloat y = v153;
                  }
                  else
                  {
                    CGFloat x = v152;
                    CGFloat y = v54;
                    double v101 = v149;
                  }
                }
                double v103 = v150;
              }
            }
          }
          v180.origin.CGFloat x = v97;
          v180.origin.CGFloat y = v98;
          v180.size.double width = v99;
          v180.size.double height = v104;
          v195.origin.CGFloat x = x;
          v195.origin.CGFloat y = y;
          v195.size.double width = v101;
          v195.size.double height = v103;
          CGRect v181 = CGRectIntersection(v180, v195);
          if (round(v181.size.width * v181.size.height) > round(v154))
          {
            double v145 = v101;
            double v147 = v103;
            double v143 = x;
            double v144 = y;
            double v154 = v181.size.width * v181.size.height;
            unsigned int v68 = v67;
            *(CGRect *)v148 = v181;
          }
          ++v67;
          v86 += 4;
          double v54 = v153;
        }
        while (v67 != 4);
        v105 = (CGFloat *)&v155[4 * v68];
        double v107 = *v105;
        double v106 = v105[1];
        double v53 = v105[2];
        double v57 = v105[3];
        v182.origin.CGFloat x = *v105;
        v182.origin.CGFloat y = v106;
        v182.size.double width = v53;
        v182.size.double height = v57;
        v196.origin.CGFloat x = v136;
        v196.origin.CGFloat y = v137;
        v196.size.double height = v134;
        v196.size.double width = v135;
        if (CGRectEqualToRect(v182, v196))
        {
          unint64_t v108 = 1;
        }
        else
        {
          v183.origin.CGFloat x = v107;
          v183.origin.CGFloat y = v106;
          v183.size.double width = v53;
          v183.size.double height = v57;
          if (CGRectEqualToRect(v183, rect_8))
          {
            unint64_t v108 = 2;
          }
          else
          {
            v184.origin.CGFloat x = v107;
            v184.origin.CGFloat y = v106;
            v184.size.double width = v53;
            v184.size.double height = v57;
            v197.origin.CGFloat y = v131;
            v197.origin.CGFloat x = v132;
            v197.size.double height = v129;
            v197.size.double width = v130;
            if (CGRectEqualToRect(v184, v197))
            {
              unint64_t v108 = 8;
            }
            else
            {
              v185.origin.CGFloat x = v107;
              v185.origin.CGFloat y = v106;
              v185.size.double width = v53;
              v185.size.double height = v57;
              v198.origin.CGFloat y = v127;
              v198.origin.CGFloat x = v128;
              v198.size.double height = v125;
              v198.size.double width = v126;
              BOOL v109 = CGRectEqualToRect(v185, v198);
              unint64_t v108 = 4;
              if (!v109) {
                unint64_t v108 = 1;
              }
            }
          }
        }
        self->_unint64_t arrowDirection = v108;
        CGFloat v51 = v147;
        if (*(double *)v148 <= v107) {
          double v61 = v107 - (v53 - *(double *)&v148[16]);
        }
        else {
          double v61 = *(double *)v148;
        }
        if (*(double *)&v148[8] <= v106) {
          double v48 = v106 - (v57 - *(double *)&v148[24]);
        }
        else {
          double v48 = *(double *)&v148[8];
        }
        double v62 = v143;
        double v49 = v144;
        double v17 = v145;
        goto LABEL_134;
      }
      BOOL v38 = [(_UIPopoverLayoutInfo *)self isRTL];
      double v40 = v32 - v27;
      double v39 = rect;
    }
    double v54 = v153;
    if (v38) {
      double v40 = v39;
    }
    unint64_t preferredArrowDirections = self->_preferredArrowDirections;
    goto LABEL_29;
  }
  self->_unint64_t arrowDirection = 0;
  -[_UIPopoverLayoutInfo _popoverViewSizeForContentSize:arrowDirection:](self, "_popoverViewSizeForContentSize:arrowDirection:", 0, self->_preferredContentSize.width, self->_preferredContentSize.height);
  double v42 = v41;
  double v44 = v43;
  v157.origin.CGFloat x = v5;
  v157.origin.CGFloat y = v6;
  v157.size.double width = v8;
  v157.size.double height = v10;
  CGFloat MidX = CGRectGetMidX(v157);
  v158.origin.CGFloat y = v6;
  double v46 = MidX;
  v158.origin.CGFloat x = v5;
  v158.size.double width = v8;
  v158.size.double height = v10;
  double v47 = floor(v46 - v42 * 0.5);
  double v48 = floor(CGRectGetMidY(v158) - v44 * 0.5);
  v159.origin.CGFloat x = v47;
  v159.origin.CGFloat y = v48;
  CGFloat v151 = v42;
  v159.size.double width = v42;
  double v49 = v153;
  v159.size.double height = v44;
  double MinY = CGRectGetMinY(v159);
  v160.origin.CGFloat x = v152;
  v160.origin.CGFloat y = v153;
  v160.size.double width = v17;
  v160.size.double height = v18;
  CGFloat v51 = v18;
  if (MinY >= CGRectGetMinY(v160))
  {
    double v53 = v151;
  }
  else
  {
    v161.origin.CGFloat x = v152;
    v161.origin.CGFloat y = v153;
    v161.size.double width = v17;
    v161.size.double height = v18;
    double v52 = CGRectGetMinY(v161);
    v162.origin.CGFloat x = v47;
    v162.origin.CGFloat y = v48;
    double v53 = v151;
    v162.size.double width = v151;
    v162.size.double height = v44;
    double v48 = v48 + v52 - CGRectGetMinY(v162);
  }
  v163.origin.CGFloat x = v47;
  v163.origin.CGFloat y = v48;
  v163.size.double width = v53;
  v163.size.double height = v44;
  double MaxY = CGRectGetMaxY(v163);
  v164.origin.CGFloat x = v152;
  v164.origin.CGFloat y = v153;
  v164.size.double width = v17;
  v164.size.double height = v51;
  if (MaxY > CGRectGetMaxY(v164))
  {
    v165.origin.CGFloat x = v47;
    v165.origin.CGFloat y = v48;
    v165.size.double width = v53;
    v165.size.double height = v44;
    double v56 = CGRectGetMaxY(v165);
    v166.origin.CGFloat x = v152;
    v166.origin.CGFloat y = v153;
    v166.size.double width = v17;
    v166.size.double height = v51;
    double v48 = v48 - (v56 - CGRectGetMaxY(v166));
  }
  v167.origin.CGFloat x = v47;
  v167.origin.CGFloat y = v48;
  v167.size.double width = v53;
  double v57 = v44;
  v167.size.double height = v44;
  v190.origin.CGFloat x = v152;
  v190.origin.CGFloat y = v153;
  v190.size.double width = v17;
  v190.size.double height = v51;
  CGRect v168 = CGRectIntersection(v167, v190);
  double v58 = v53 - v168.size.width;
  double v59 = -(v53 - v168.size.width);
  if (v168.origin.x == v47) {
    double v60 = v59;
  }
  else {
    double v60 = v58;
  }
  double v61 = v47 + v60;
  double v62 = v152;
LABEL_134:
  double v110 = v49;
  double v111 = v17;
  CGFloat v112 = v51;
  double v113 = v48;
  double v114 = v53;
  double v115 = v57;
  CGRect v186 = CGRectIntersection(*(CGRect *)&v62, *(CGRect *)&v61);
  double v116 = v186.origin.x;
  double v117 = v186.origin.y;
  CGFloat v118 = v186.size.width;
  CGFloat v119 = v186.size.height;
  unint64_t arrowDirection = self->_arrowDirection;
  if (arrowDirection - 1 < 2)
  {
    v188.origin.CGFloat y = v140;
    v188.origin.CGFloat x = rect;
    v188.size.double width = v138;
    v188.size.double height = v139;
    double v123 = CGRectGetMidX(v188);
    v189.origin.CGFloat x = v116;
    v189.origin.CGFloat y = v117;
    v189.size.double width = v118;
    v189.size.double height = v119;
    double offset = v123 - CGRectGetMidX(v189);
  }
  else if (arrowDirection == 4 || arrowDirection == 8)
  {
    double MidY = CGRectGetMidY(v186);
    v187.origin.CGFloat y = v140;
    v187.origin.CGFloat x = rect;
    v187.size.double width = v138;
    v187.size.double height = v139;
    double offset = -(MidY - CGRectGetMidY(v187));
  }
  else
  {
    double offset = self->_offset;
  }
  double v124 = round(offset + self->_arrowOffset);
  self->_frame.size.double height = v119;
  self->_double offset = v124;
  self->_frame.origin.CGFloat x = round(v116);
  self->_frame.origin.CGFloat y = round(v117);
  self->_frame.size.double width = v118;
}

- (CGSize)_popoverViewSizeForContentSize:(CGSize)a3 arrowDirection:(unint64_t)a4
{
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v8 = v7;
  double v9 = *MEMORY[0x1E4F1DB30];
  switch(a4)
  {
    case 0uLL:
      double v9 = a3.width + self->_contentInset.left + self->_contentInset.right;
      double height = a3.height + self->_contentInset.top;
      p_double bottom = (UIEdgeInsets *)&self->_contentInset.bottom;
      uint64_t v12 = 40;
      goto LABEL_5;
    case 1uLL:
    case 2uLL:
      p_double bottom = &self->_contentInset;
      double v9 = a3.width + self->_contentInset.left + self->_contentInset.right;
      double height = a3.height + self->_arrowHeight;
      uint64_t v12 = 24;
      goto LABEL_5;
    case 4uLL:
    case 8uLL:
      p_double bottom = &self->_contentInset;
      double v9 = a3.width + self->_arrowHeight + self->_contentInset.left + self->_contentInset.right;
      uint64_t v12 = 24;
      double height = a3.height;
LABEL_5:
      double v8 = height + p_bottom->top + *(double *)((char *)&self->super.isa + v12);
      break;
    default:
      break;
  }
  if ((a3.width != v6 || a3.height != v7) && v9 == v6 && v8 == v7)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"_UIPopoverLayoutInfo.m" lineNumber:198 description:@"Unknown direction passed to _popoverViewSizeForContentSize:arrowDirection:"];
  }
  double v16 = v9;
  double v17 = v8;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGRect)_effectiveViewSourceRect
{
  double x = self->_sourceViewRect.origin.x;
  double y = self->_sourceViewRect.origin.y;
  double width = self->_sourceViewRect.size.width;
  double height = self->_sourceViewRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreferredHorizontalAlignment:(int64_t)a3
{
  self->_int64_t preferredHorizontalAlignment = a3;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = [(id)objc_opt_class() _observationKeys];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(_UIPopoverLayoutInfo *)self removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_UIPopoverLayoutInfo;
  [(_UIPopoverLayoutInfo *)&v8 dealloc];
}

- (_UIPopoverLayoutInfo)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)_UIPopoverLayoutInfo;
  v2 = [(_UIPopoverLayoutInfo *)&v19 init];
  double v3 = (_UIPopoverLayoutInfo *)v2;
  if (v2)
  {
    v2[176] = 1;
    v2[233] = 1;
    __asm { FMOV            V0.2D, #8.0 }
    *(_OWORD *)(v2 + 8) = _Q0;
    *(_OWORD *)(v2 + 24) = _Q0;
    *((void *)v2 + 5) = 0x4032000000000000;
    long long v9 = [(id)objc_opt_class() _observationKeys];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [(_UIPopoverLayoutInfo *)v3 addObserver:v3 forKeyPath:*(void *)(*((void *)&v15 + 1) + 8 * v13++) options:1 context:0];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }
  }
  return v3;
}

+ (id)_observationKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"preferredContentSize", @"preferredArrowDirections", @"containingFrame", @"containingFrameInsets", @"sourceViewRect", @"canOverlapSourceViewRect", @"contentInset", @"arrowHeight", @"arrowOffset", @"preferLandscapeOrientations", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_updatesEnabled) {
    [(_UIPopoverLayoutInfo *)self _updateOutputs];
  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (void)setPreferredArrowDirections:(unint64_t)a3
{
  self->_unint64_t preferredArrowDirections = a3;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)preferredArrowDirections
{
  return self->_preferredArrowDirections;
}

- (CGRect)sourceViewRect
{
  double x = self->_sourceViewRect.origin.x;
  double y = self->_sourceViewRect.origin.y;
  double width = self->_sourceViewRect.size.width;
  double height = self->_sourceViewRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceViewRect:(CGRect)a3
{
  self->_sourceViewRect = a3;
}

- (void)setContainingFrame:(CGRect)a3
{
  self->_containingFrame = a3;
}

- (CGRect)containingFrame
{
  double x = self->_containingFrame.origin.x;
  double y = self->_containingFrame.origin.y;
  double width = self->_containingFrame.size.width;
  double height = self->_containingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreferLandscapeOrientations:(BOOL)a3
{
  self->_BOOL preferLandscapeOrientations = a3;
}

- (void)setCanOverlapSourceViewRect:(BOOL)a3
{
  self->_canOverlapSourceViewRect = a3;
}

- (void)setArrowOffset:(double)a3
{
  self->_arrowOffset = a3;
}

- (void)setArrowHeight:(double)a3
{
  self->_arrowHeight = a3;
}

- (BOOL)preferLandscapeOrientations
{
  return self->_preferLandscapeOrientations;
}

- (BOOL)canOverlapSourceViewRect
{
  return self->_canOverlapSourceViewRect;
}

- (double)arrowOffset
{
  return self->_arrowOffset;
}

- (double)arrowHeight
{
  return self->_arrowHeight;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void)setContainingFrameInsets:(UIEdgeInsets)a3
{
  self->_containingFrameInsets = a3;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)containingFrameInsets
{
  double top = self->_containingFrameInsets.top;
  double left = self->_containingFrameInsets.left;
  double bottom = self->_containingFrameInsets.bottom;
  double right = self->_containingFrameInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

- (double)offset
{
  return self->_offset;
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)description
{
  double v20 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  objc_super v19 = NSStringFromClass(v4);
  long long v18 = NSStringFromSelector(a2);
  [(_UIPopoverLayoutInfo *)self preferredContentSize];
  uint64_t v5 = NSStringFromCGSize(v22);
  uint64_t v6 = NSStringFromPopoverArrowDirection([(_UIPopoverLayoutInfo *)self preferredArrowDirections]);
  [(_UIPopoverLayoutInfo *)self containingFrame];
  uint64_t v7 = NSStringFromCGRect(v23);
  [(_UIPopoverLayoutInfo *)self containingFrameInsets];
  objc_super v8 = NSStringFromUIEdgeInsets(v24);
  [(_UIPopoverLayoutInfo *)self sourceViewRect];
  long long v9 = NSStringFromCGRect(v25);
  if ([(_UIPopoverLayoutInfo *)self canOverlapSourceViewRect]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if ([(_UIPopoverLayoutInfo *)self preferLandscapeOrientations]) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  [(_UIPopoverLayoutInfo *)self frame];
  uint64_t v12 = NSStringFromCGRect(v26);
  [(_UIPopoverLayoutInfo *)self offset];
  uint64_t v14 = v13;
  long long v15 = NSStringFromPopoverArrowDirection([(_UIPopoverLayoutInfo *)self arrowDirection]);
  long long v16 = [v20 stringWithFormat:@"[<%@ %p> %@]: INPUTS: preferredContentSize: %@, preferredArrowDirections: %@, containingFrame: %@, containingFrameInsets: %@, targetRect: %@, canOverlapSourceViewRect: %@, preferLandscapeOrientations: %@     OUTPUTS: frame: %@, offset: %f, arrowDirection: %@, candidates: %@", v19, self, v18, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, self->_candidates];

  return v16;
}

- (id)candidates
{
  return self->_candidates;
}

- (BOOL)_updatesEnabled
{
  return self->_updatesEnabled;
}

- (int64_t)preferredHorizontalAlignment
{
  return self->_preferredHorizontalAlignment;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

@end