@interface _UIVectorLabelLayer
+ (void)initialize;
- (BOOL)_isPathCompatible:(CGPath *)a3 with:(CGPath *)a4;
- (_UIVectorLabelLayer)init;
- (id)_findSimilarLayer:(id)a3 inLayers:(id)a4;
- (id)_layersForTextLayout:(id)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (unint64_t)maxRenderedMoveDistance;
- (void)_applyTextLayoutChangeFrom:(id)a3 to:(id)a4;
- (void)_cleanupUnusedLayers;
- (void)_transitionWithSetup:(id)a3 target:(id)a4;
- (void)didChangeValueForKey:(id)a3;
- (void)setMaxRenderedMoveDistance:(unint64_t)a3;
- (void)willChangeValueForKey:(id)a3;
@end

@implementation _UIVectorLabelLayer

+ (void)initialize
{
  uint64_t v2 = NSStringFromSelector(sel_textLayout);
  v3 = (void *)_textLayoutKey;
  _textLayoutKey = v2;
}

- (_UIVectorLabelLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIVectorLabelLayer;
  uint64_t v2 = [(_UIVectorLabelLayer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_UIVectorLabelLayer *)v2 setMaxRenderedMoveDistance:5];
  }
  return v3;
}

- (void)willChangeValueForKey:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIVectorLabelLayer;
  id v4 = a3;
  [(_UIVectorLabelLayer *)&v8 willChangeValueForKey:v4];
  int v5 = objc_msgSend(v4, "isEqualToString:", _textLayoutKey, v8.receiver, v8.super_class);

  if (v5)
  {
    v6 = [(_UIVectorLabelLayer *)self textLayout];
    currentTextLayout = self->_currentTextLayout;
    self->_currentTextLayout = v6;
  }
}

- (void)didChangeValueForKey:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIVectorLabelLayer;
  id v4 = a3;
  [(_UIVectorLabelLayer *)&v9 didChangeValueForKey:v4];
  int v5 = objc_msgSend(v4, "isEqualToString:", _textLayoutKey, v9.receiver, v9.super_class);

  if (v5)
  {
    currentTextLayout = self->_currentTextLayout;
    v7 = [(_UIVectorLabelLayer *)self textLayout];
    [(_UIVectorLabelLayer *)self _applyTextLayoutChangeFrom:currentTextLayout to:v7];

    objc_super v8 = self->_currentTextLayout;
    self->_currentTextLayout = 0;
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    objc_super v8 = [(_UIVectorLabelLayer *)self delegate];
    objc_super v9 = +[UIView _currentViewAnimationState];
    v10 = [v9 actionForLayer:v6 forKey:v7 forView:v8];

    if (v10 && +[UIView _isAnimationTracking])
    {
      v11 = +[UIView _currentViewAnimationState];
      [v11 _trackAnimation:v10 withAnimationKey:v7 forKeyPath:v7 inLayer:v6];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_cleanupUnusedLayers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(_UIVectorLabelLayer *)self sublayers];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "_ui_layoutRun");
        if (v10)
        {
          v11 = (void *)v10;
          BOOL v12 = [(NSArray *)self->_currentLayers containsObject:v9];

          if (!v12) {
            [v9 removeFromSuperlayer];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_applyTextLayoutChangeFrom:(id)a3 to:(id)a4
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(_UIVectorLabelLayer *)self _cleanupUnusedLayers];
  v102 = v7;
  objc_super v8 = [(_UIVectorLabelLayer *)self _layersForTextLayout:v7];
  p_currentLayers = &self->_currentLayers;
  [(NSArray *)self->_currentLayers makeObjectsPerformSelector:sel_removeAllAnimations];
  if ([v8 count])
  {
    if (![(NSArray *)*p_currentLayers count]) {
      goto LABEL_48;
    }
    uint64_t v10 = [v8 objectAtIndexedSubscript:0];
    v11 = [(NSArray *)*p_currentLayers objectAtIndexedSubscript:0];
    [v10 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    CFTypeRef v20 = CFRetain((CFTypeRef)[v10 path]);
    uint64_t v21 = [v10 fillColor];
    if (-[_UIVectorLabelLayer _isPathCompatible:with:](self, "_isPathCompatible:with:", [v10 path], -[NSArray path](v11, "path")))
    {
      [v10 anchorPoint];
      -[NSArray setAnchorPoint:](v11, "setAnchorPoint:");
      -[NSArray setFrame:](v11, "setFrame:", v13, v15, v17, v19);
      [(NSArray *)v11 setPath:v20];
      [(NSArray *)v11 setFillColor:v21];
      [v8 replaceObjectAtIndex:0 withObject:v11];
    }
    else
    {
      v133[0] = MEMORY[0x1E4F143A8];
      v133[1] = 3221225472;
      v133[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke;
      v133[3] = &unk_1E530EE88;
      id v134 = v10;
      v135 = v11;
      v125[0] = MEMORY[0x1E4F143A8];
      v125[1] = 3221225472;
      v125[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_2;
      v125[3] = &unk_1E530EEB0;
      double v127 = v13;
      double v128 = v15;
      double v129 = v17;
      double v130 = v19;
      CFTypeRef v131 = v20;
      uint64_t v132 = v21;
      v126 = v135;
      [(_UIVectorLabelLayer *)self _transitionWithSetup:v133 target:v125];
    }
    CFRelease(v20);
    if ([(NSArray *)*p_currentLayers count] >= 2 && [(NSArray *)*p_currentLayers count] >= 2)
    {
      v99 = v10;
      v100 = v122;
      unint64_t v50 = 1;
      do
      {
        v51 = -[NSArray objectAtIndexedSubscript:](*p_currentLayers, "objectAtIndexedSubscript:", v50, v99, v100);
        v52 = [(_UIVectorLabelLayer *)self _findSimilarLayer:v51 inLayers:v8];
        v53 = v52;
        if (v52)
        {
          [v52 frame];
          uint64_t v55 = v54;
          uint64_t v57 = v56;
          uint64_t v59 = v58;
          uint64_t v61 = v60;
          v121[0] = MEMORY[0x1E4F143A8];
          v121[1] = 3221225472;
          v122[0] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_3;
          v122[1] = &unk_1E530EED8;
          id v123 = v53;
          id v124 = v51;
          v115[0] = MEMORY[0x1E4F143A8];
          v115[1] = 3221225472;
          v115[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_4;
          v115[3] = &unk_1E530EF00;
          uint64_t v117 = v55;
          uint64_t v118 = v57;
          uint64_t v119 = v59;
          uint64_t v120 = v61;
          id v116 = v124;
          [(_UIVectorLabelLayer *)self _transitionWithSetup:v121 target:v115];
        }
        else
        {
          [v51 setOpacity:0.0];
          [v51 frame];
          double v63 = v62;
          double v65 = v64;
          double v67 = v66;
          double v69 = v68;
          [v6 size];
          double v71 = v70;
          double v73 = v72;
          [v102 size];
          double v76 = v74 / v71;
          if (v71 == 0.0) {
            double v76 = 1.0;
          }
          double v77 = v75 / v73;
          if (v73 == 0.0) {
            double v77 = 1.0;
          }
          double v78 = v75 - v73;
          if (v73 >= 0.01) {
            double v79 = v73;
          }
          else {
            double v79 = 0.01;
          }
          double v80 = v65 + v78 * (v65 / v79);
          double v81 = v74 - v71;
          if (v71 >= 0.01) {
            double v82 = v71;
          }
          else {
            double v82 = 0.01;
          }
          double v83 = v63 + v81 * (v63 / v82);
          if (v76 < v77) {
            double v77 = v76;
          }
          objc_msgSend(v51, "setFrame:", v83, v80, v67 * v77, v69 * v77);
        }

        ++v50;
      }
      while (v50 < [(NSArray *)*p_currentLayers count]);
      uint64_t v10 = v99;
    }
  }
  else
  {
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    v11 = *p_currentLayers;
    uint64_t v22 = [(NSArray *)v11 countByEnumeratingWithState:&v136 objects:v141 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v24 = v8;
      uint64_t v25 = *(void *)v137;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v137 != v25) {
            objc_enumerationMutation(v11);
          }
          v27 = *(void **)(*((void *)&v136 + 1) + 8 * i);
          [v27 setOpacity:0.0];
          [v27 frame];
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;
          [v6 size];
          double v37 = v36;
          double v39 = v38;
          [v102 size];
          double v42 = v40 / v37;
          if (v37 == 0.0) {
            double v42 = 1.0;
          }
          double v43 = v41 / v39;
          if (v39 == 0.0) {
            double v43 = 1.0;
          }
          double v44 = v41 - v39;
          if (v39 >= 0.01) {
            double v45 = v39;
          }
          else {
            double v45 = 0.01;
          }
          double v46 = v31 + v44 * (v31 / v45);
          double v47 = v40 - v37;
          if (v37 >= 0.01) {
            double v48 = v37;
          }
          else {
            double v48 = 0.01;
          }
          double v49 = v29 + v47 * (v29 / v48);
          if (v42 < v43) {
            double v43 = v42;
          }
          objc_msgSend(v27, "setFrame:", v49, v46, v33 * v43, v35 * v43);
        }
        uint64_t v23 = [(NSArray *)v11 countByEnumeratingWithState:&v136 objects:v141 count:16];
      }
      while (v23);
      uint64_t v10 = v24;
      objc_super v8 = 0;
    }
    else
    {
      uint64_t v10 = v8;
      objc_super v8 = 0;
    }
  }

LABEL_48:
  objc_storeStrong((id *)&self->_currentLayers, v8);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v101 = v8;
  v84 = [v8 reverseObjectEnumerator];
  uint64_t v85 = [v84 countByEnumeratingWithState:&v111 objects:v140 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v112;
    do
    {
      for (uint64_t j = 0; j != v86; ++j)
      {
        if (*(void *)v112 != v87) {
          objc_enumerationMutation(v84);
        }
        v89 = *(void **)(*((void *)&v111 + 1) + 8 * j);
        v90 = [v89 superlayer];

        if (!v6 || v90)
        {
          [v89 setDelegate:self];
          [(_UIVectorLabelLayer *)self insertSublayer:v89 atIndex:0];
        }
        else
        {
          [v89 frame];
          uint64_t v92 = v91;
          uint64_t v94 = v93;
          uint64_t v96 = v95;
          uint64_t v98 = v97;
          v104[0] = MEMORY[0x1E4F143A8];
          v104[1] = 3221225472;
          v104[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_5;
          v104[3] = &unk_1E530EF28;
          v104[4] = v89;
          uint64_t v107 = v91;
          uint64_t v108 = v93;
          uint64_t v109 = v95;
          uint64_t v110 = v97;
          id v105 = v102;
          id v106 = v6;
          v103[0] = MEMORY[0x1E4F143A8];
          v103[1] = 3221225472;
          v103[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_6;
          v103[3] = &__block_descriptor_64_e17_v16__0__CALayer_8l;
          v103[4] = v92;
          v103[5] = v94;
          v103[6] = v96;
          v103[7] = v98;
          [(_UIVectorLabelLayer *)self _transitionWithSetup:v104 target:v103];
        }
      }
      uint64_t v86 = [v84 countByEnumeratingWithState:&v111 objects:v140 count:16];
    }
    while (v86);
  }
}

- (void)_transitionWithSetup:(id)a3 target:(id)a4
{
  objc_super v9 = (void (**)(void))a3;
  id v6 = (void (**)(id, void *))a4;
  char v7 = [MEMORY[0x1E4F39CF8] disableActions];
  objc_super v8 = 0;
  if (v9)
  {
    if ((v7 & 1) == 0)
    {
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      objc_super v8 = v9[2]();
      [MEMORY[0x1E4F39CF8] setDisableActions:0];
      if (v8)
      {
        [v8 setDelegate:self];
        [(_UIVectorLabelLayer *)self insertSublayer:v8 atIndex:0];
        if (v6) {
          v6[2](v6, v8);
        }
      }
    }
  }
}

- (BOOL)_isPathCompatible:(CGPath *)a3 with:(CGPath *)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    if (CGPathEqualToPath(a3, a4))
    {
      return 1;
    }
    else
    {
      uint64_t v14 = 0;
      double v15 = &v14;
      uint64_t v16 = 0x2020000000;
      uint64_t v17 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46___UIVectorLabelLayer__isPathCompatible_with___block_invoke;
      block[3] = &unk_1E530EF70;
      block[4] = &v14;
      CGPathApplyWithBlock(a3, block);
      uint64_t v9 = 0;
      uint64_t v10 = &v9;
      uint64_t v11 = 0x2020000000;
      uint64_t v12 = 0;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __46___UIVectorLabelLayer__isPathCompatible_with___block_invoke_2;
      v8[3] = &unk_1E530EF70;
      v8[4] = &v9;
      CGPathApplyWithBlock(a4, v8);
      BOOL v4 = v15[3] == v10[3];
      _Block_object_dispose(&v9, 8);
      _Block_object_dispose(&v14, 8);
    }
  }
  return v4;
}

- (id)_findSimilarLayer:(id)a3 inLayers:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = objc_msgSend(v5, "_ui_layoutRun");
  objc_super v8 = v7;
  if (v7)
  {
    id v50 = v5;
    [v7 stringRange];
    uint64_t v10 = v9;
    [v8 usedRunRect];
    double v12 = v11;
    double v14 = v13;
    double v15 = [v8 font];
    v53 = [v8 string];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v49 = v6;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      v51 = v15;
      v52 = 0;
      double v19 = v12 + v14 * 0.5;
      uint64_t v20 = *(void *)v57;
      double v21 = 1.79769313e308;
      uint64_t v54 = v10;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v57 != v20) {
            objc_enumerationMutation(v16);
          }
          uint64_t v23 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v24 = objc_msgSend(v23, "_ui_layoutRun");
          [v24 stringRange];
          if (v25 == v10)
          {
            [v24 usedRunRect];
            double v28 = v27 + v26 * 0.5;
            uint64_t v29 = [v8 lineIndex];
            uint64_t v30 = [v24 lineIndex];
            unint64_t v31 = v29 - v30;
            if (v29 - v30 < 0) {
              unint64_t v31 = v30 - v29;
            }
            double v32 = v19 - v28;
            if (v19 - v28 < 0.0) {
              double v32 = -(v19 - v28);
            }
            double v33 = v31 >= 2 ? 1.79769313e308 : v32;
            if (v33 < v21)
            {
              id v34 = v16;
              [v24 font];
              v36 = double v35 = v15;
              [v35 pointSize];
              double v37 = objc_msgSend(v36, "fontWithSize:");

              [v35 lineHeight];
              double v39 = v38;
              double v40 = [v24 font];
              [v40 lineHeight];
              double v42 = v41;

              if (v39 < v42) {
                double v39 = v42;
              }
              if (v33 < v39 * (double)[(_UIVectorLabelLayer *)self maxRenderedMoveDistance]
                && [v37 isEqual:v35])
              {
                double v43 = v8;
                double v44 = [v24 string];
                int v45 = [v44 isEqualToString:v53];

                if (v45)
                {
                  id v46 = v23;

                  objc_super v8 = v43;
                  if (v33 == 0.0)
                  {

                    v52 = v46;
                    double v15 = v51;
                    id v16 = v34;
                    goto LABEL_33;
                  }
                  double v21 = v33;
                  v52 = v46;
                }
                else
                {
                  objc_super v8 = v43;
                }
                double v15 = v51;
              }
              else
              {
                double v15 = v35;
              }
              id v16 = v34;

              uint64_t v10 = v54;
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    else
    {
      v52 = 0;
    }
LABEL_33:

    id v6 = v49;
    id v5 = v50;
    double v47 = v52;
  }
  else
  {
    double v47 = 0;
  }

  return v47;
}

- (id)_layersForTextLayout:(id)a3
{
  id v3 = a3;
  if ([v3 numberOfRuns])
  {
    BOOL v4 = [v3 parameters];
    id v5 = [v4 traitCollection];
    id v6 = +[UIGraphicsImageRendererFormat formatForTraitCollection:v5];

    char v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "numberOfRuns"));
    [v3 lastLineBaseline];
    double v9 = v8;
    [v3 size];
    double v11 = v9 / v10;
    CGMutablePathRef Mutable = CGPathCreateMutable();
    CFAutorelease(Mutable);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __44___UIVectorLabelLayer__layersForTextLayout___block_invoke;
    v27[3] = &unk_1E530EFB8;
    id v13 = v6;
    id v28 = v13;
    uint64_t v30 = 0;
    double v31 = v11;
    id v14 = v7;
    id v29 = v14;
    CGMutablePathRef v32 = Mutable;
    [v3 enumerateRunsUsingBlock:v27];
    if (!CGPathIsEmpty(Mutable))
    {
      double v15 = objc_opt_new();
      [v15 setPath:Mutable];
      id v16 = [v3 parameters];
      uint64_t v17 = [v16 attributedText];
      uint64_t v18 = [v17 length];

      if (!v18) {
        goto LABEL_7;
      }
      double v19 = [v3 parameters];
      uint64_t v20 = [v19 attributedText];
      double v21 = [v20 attribute:*(void *)off_1E52D2048 atIndex:0 effectiveRange:0];

      if (v21)
      {
        int v22 = 0;
        uint64_t v23 = v21;
      }
      else
      {
LABEL_7:
        uint64_t v23 = +[UIColor blackColor];
        double v21 = 0;
        int v22 = 1;
      }
      objc_msgSend(v15, "setFillColor:", objc_msgSend(v23, "CGColor"));
      if (v22) {

      }
      objc_msgSend(v15, "setAnchorPoint:", 0.0, v11);
      [v3 usedBoundingRect];
      objc_msgSend(v15, "setFrame:");
      [v14 insertObject:v15 atIndex:0];
    }
    uint64_t v25 = v29;
    id v24 = v14;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (unint64_t)maxRenderedMoveDistance
{
  return self->_maxRenderedMoveDistance;
}

- (void)setMaxRenderedMoveDistance:(unint64_t)a3
{
  self->_maxRenderedMoveDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTextLayout, 0);
  objc_storeStrong((id *)&self->_currentLayers, 0);
}

@end