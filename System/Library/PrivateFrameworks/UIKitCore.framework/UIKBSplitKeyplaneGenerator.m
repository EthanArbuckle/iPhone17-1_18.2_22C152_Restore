@interface UIKBSplitKeyplaneGenerator
- (UIKBSplitKeyplaneGenerator)init;
- (id)finalizeSplitKeyplane;
- (id)generateRivenKeyplaneFromKeyplane:(id)a3 forKeyboard:(id)a4;
- (id)hintsForRow:(id)a3;
- (id)keysOrderedByPosition;
- (void)addKey:(id)a3 withShape:(id)a4 forRow:(id)a5 attribs:(id)a6 left:(BOOL)a7 force:(BOOL)a8 isDefaultWidth:(BOOL)a9;
- (void)addSliceStart:(CGRect)a3 end:(CGRect)a4 startToken:(id)a5 endToken:(id)a6 left:(BOOL)a7 normalization:(int)a8 isDefaultWidth:(BOOL)a9 row:(int)a10;
- (void)alignSpaceKeyEdges;
- (void)commitUncommittedSlices;
- (void)initializeGeneratorForKeyplane:(id)a3 name:(id)a4;
- (void)organizeKeyplaneIntoRows;
- (void)splitRow:(id)a3;
- (void)splitSpaceKey:(id)a3 leftSpace:(id)a4 left:(CGRect)a5 right:(CGRect)a6;
@end

@implementation UIKBSplitKeyplaneGenerator

- (UIKBSplitKeyplaneGenerator)init
{
  v11.receiver = self;
  v11.super_class = (Class)UIKBSplitKeyplaneGenerator;
  v2 = [(UIKBSplitKeyplaneGenerator *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    rows = v2->_rows;
    v2->_rows = (NSMutableArray *)v3;

    v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v6 = [v5 preferencesActions];
    [v6 rivenSizeFactor:1.0];
    CGFloat v8 = v7;

    v2->_splitKeySizeFactor.width = v8;
    v2->_splitKeySizeFactor.height = v8;
    v9 = v2;
  }

  return v2;
}

- (id)keysOrderedByPosition
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(UIKBTree *)self->_sourceKeyplane keysOrderedByPosition];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)addSliceStart:(CGRect)a3 end:(CGRect)a4 startToken:(id)a5 endToken:(id)a6 left:(BOOL)a7 normalization:(int)a8 isDefaultWidth:(BOOL)a9 row:(int)a10
{
  uint64_t v10 = *(void *)&a10;
  uint64_t v11 = *(void *)&a8;
  BOOL v12 = a7;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v18 = a3.size.height;
  double v19 = a3.size.width;
  double v20 = a3.origin.y;
  double v21 = a3.origin.x;
  id v54 = a5;
  id v23 = a6;
  p_leftSlice = &self->_leftSlice;
  if (!self->_leftSlice)
  {
    v25 = objc_alloc_init(UIKeyboardTransitionSlice);
    v26 = *p_leftSlice;
    *p_leftSlice = v25;
  }
  p_rightSlice = &self->_rightSlice;
  if (!self->_rightSlice)
  {
    v28 = objc_alloc_init(UIKeyboardTransitionSlice);
    v29 = *p_rightSlice;
    *p_rightSlice = v28;
  }
  if (v12) {
    uint64_t v30 = 104;
  }
  else {
    uint64_t v30 = 112;
  }
  if (v12) {
    v31 = &self->_leftSlice;
  }
  else {
    v31 = &self->_rightSlice;
  }
  v32 = *v31;
  BOOL v33 = [(UIKeyboardTransitionSlice *)v32 hasGeometry];
  if (v54) {
    BOOL v34 = v23 == 0;
  }
  else {
    BOOL v34 = 1;
  }
  int v35 = !v34;
  if (!v34 && !v33)
  {
    -[UIKeyboardTransitionSlice setStartRect:](v32, "setStartRect:", v21, v20, v19, v18);
    -[UIKeyboardTransitionSlice setEndRect:](v32, "setEndRect:", x, y, width, height);
    BOOL v33 = [(UIKeyboardTransitionSlice *)v32 hasGeometry];
  }
  double v53 = v21;
  v56.origin.double x = v21;
  double v36 = v20;
  v56.origin.double y = v20;
  double v37 = v19;
  v56.size.double width = v19;
  double v38 = v18;
  v56.size.double height = v18;
  double v39 = x;
  double v40 = y;
  double v41 = width;
  double v42 = height;
  double MinY = CGRectGetMinY(v56);
  [(UIKeyboardTransitionSlice *)v32 startRect];
  if (MinY == CGRectGetMinY(v57)) {
    int v44 = v35;
  }
  else {
    int v44 = 1;
  }
  if (v33) {
    int v45 = v44;
  }
  else {
    int v45 = 0;
  }
  if (v35)
  {
    v46 = +[UIKeyboardTransitionSlice sliceWithStart:end:](UIKeyboardTransitionSlice, "sliceWithStart:end:", v53, v36, v37, v38, v39, v40, v41, v42);
    [v54 setRowHint:v10];
    [v23 setRowHint:v10];
    [v46 setStartToken:v54];
    [v46 setEndToken:v23];
    [v46 setNormalization:v11];
    [v46 setDelayCrossfade:1];
    [(UIKeyboardSliceSet *)self->_sliceSet addSlice:v46];
    if (v11 != 2)
    {
      v47 = [v23 name];

      if (v47)
      {
        v48 = [(UIKeyboardSliceSet *)self->_sliceSet controlKeys];
        v49 = [v23 name];
        [v48 setObject:v46 forKey:v49];
      }
    }
  }
  if (v45)
  {
    [(UIKeyboardSliceSet *)self->_sliceSet addSlice:v32];
    v50 = objc_alloc_init(UIKeyboardTransitionSlice);
    v51 = *(Class *)((char *)&self->super.isa + v30);
    *(Class *)((char *)&self->super.isa + v30) = (Class)v50;

    v52 = (UIKeyboardTransitionSlice *)*(id *)((char *)&self->super.isa + v30);
    v32 = v52;
  }
  if ((v35 & 1) == 0) {
    -[UIKeyboardTransitionSlice addStartRect:end:](v32, "addStartRect:end:", v53, v36, v37, v38, v39, v40, v41, v42);
  }
}

- (void)splitSpaceKey:(id)a3 leftSpace:(id)a4 left:(CGRect)a5 right:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  double v10 = a5.size.height;
  double v11 = a5.size.width;
  double v12 = a5.origin.y;
  double v13 = a5.origin.x;
  id v56 = a3;
  id v16 = a4;
  v58.origin.CGFloat x = v13;
  v58.origin.CGFloat y = v12;
  v58.size.CGFloat width = v11;
  v58.size.CGFloat height = v10;
  BOOL IsNull = CGRectIsNull(v58);
  CGFloat v51 = x;
  CGFloat v52 = y;
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  double v53 = width;
  double v54 = height;
  v59.size.CGFloat width = width;
  v59.size.CGFloat height = height;
  BOOL v18 = CGRectIsNull(v59);
  [v56 paddedFrame];
  double v22 = v21;
  double v55 = v23;
  double v24 = v19;
  double v25 = v20;
  if (IsNull || v18)
  {
    BOOL v48 = !IsNull;
    if (IsNull)
    {
      double v13 = v51;
      double v49 = v52;
    }
    else
    {
      double v49 = v12;
    }
    if (IsNull)
    {
      double v11 = v53;
      double v50 = v54;
    }
    else
    {
      double v50 = v10;
    }
    v32 = +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v56, 102, v19, v20);
    BOOL v33 = +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v56, 106, v11, v50);
    uint64_t v34 = [(NSMutableArray *)self->_rows count];
    double v35 = v22;
    double v36 = v55;
    double v37 = v24;
    double v39 = v25;
    double v38 = v13;
    double v40 = v49;
    double v41 = v11;
    double v42 = v50;
    v43 = self;
    int v44 = v32;
    int v45 = v33;
    BOOL v46 = v48;
    uint64_t v47 = 0;
  }
  else
  {
    [(UIKBTree *)self->_sourceKeyplane frame];
    double v27 = v26 * 0.5 - v22;
    v28 = [v16 name];
    v29 = +[UIKBCacheToken tokenTemplateForKey:name:style:size:](UIKBCacheToken, "tokenTemplateForKey:name:style:size:", v56, v28, 102, v24, v25);

    uint64_t v30 = [v16 name];
    v31 = +[UIKBCacheToken tokenTemplateForKey:name:style:size:](UIKBCacheToken, "tokenTemplateForKey:name:style:size:", v56, v30, 106, v11, v10);

    -[UIKBSplitKeyplaneGenerator addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:](self, "addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:", v29, v31, 1, 1, 0, [(NSMutableArray *)self->_rows count], v22, v55, v27, v25, v13, v12, v11, v10);
    v32 = +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v56, 102, v24, v25);

    BOOL v33 = +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v56, 106, v53, v54);

    uint64_t v34 = [(NSMutableArray *)self->_rows count];
    double v35 = v22 + v27;
    double v36 = v55;
    double v37 = v24 - v27;
    double v38 = v51;
    double v39 = v25;
    double v40 = v52;
    double v41 = v53;
    double v42 = v54;
    v43 = self;
    int v44 = v32;
    int v45 = v33;
    BOOL v46 = 0;
    uint64_t v47 = 2;
  }
  -[UIKBSplitKeyplaneGenerator addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:](v43, "addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:", v44, v45, v46, v47, 0, v34, v35, v36, v37, v39, v38, v40, v41, v42);
}

- (void)commitUncommittedSlices
{
  if ([(UIKeyboardTransitionSlice *)self->_leftSlice hasGeometry])
  {
    uint64_t v3 = [(UIKeyboardSliceSet *)self->_sliceSet slices];
    char v4 = [v3 containsObject:self->_leftSlice];

    if ((v4 & 1) == 0)
    {
      [(UIKeyboardSliceSet *)self->_sliceSet addSlice:self->_leftSlice];
      leftSlice = self->_leftSlice;
      self->_leftSlice = 0;
    }
  }
  if ([(UIKeyboardTransitionSlice *)self->_rightSlice hasGeometry])
  {
    v6 = [(UIKeyboardSliceSet *)self->_sliceSet slices];
    char v7 = [v6 containsObject:self->_rightSlice];

    if ((v7 & 1) == 0)
    {
      [(UIKeyboardSliceSet *)self->_sliceSet addSlice:self->_rightSlice];
      rightSlice = self->_rightSlice;
      self->_rightSlice = 0;
    }
  }
}

- (void)addKey:(id)a3 withShape:(id)a4 forRow:(id)a5 attribs:(id)a6 left:(BOOL)a7 force:(BOOL)a8 isDefaultWidth:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v15 = a9;
  id v58 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  int v19 = [v58 interactionType];
  double v20 = [v18 valueForKey:@"KBghost"];
  char v21 = [v20 BOOLValue];

  if (v19 == 15) {
    char v22 = 1;
  }
  else {
    char v22 = v21;
  }
  if (v9 || (v22 & 1) == 0)
  {
    if ([v58 renderKeyInKeyplane:self->_sourceKeyplane])
    {
      double v23 = 0;
      double v24 = 0;
LABEL_14:
      [v58 paddedFrame];
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      [v16 paddedFrame];
      -[UIKBSplitKeyplaneGenerator addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:](self, "addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:", v24, v23, v10, 0, v15, [v17 rowIndex] + 1, v39, v41, v43, v45, v46, v47, v48, v49);

      goto LABEL_15;
    }
    [v58 paddedFrame];
    double v24 = +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v58, 102, v25, v26);
    [v16 paddedFrame];
    double v23 = +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v58, 106, v27, v28);
    id v29 = [(NSMutableArray *)self->_rows lastObject];
    if (v29 == v17)
    {
      BOOL v15 = a9;
      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      int v30 = [v58 displayType];

      if (!v30) {
        goto LABEL_14;
      }
      v31 = [v58 name];
      id v29 = +[UIKBTree mergeStringForKeyName:v31];

      v32 = [v58 name];
      id v56 = [(UIKeyboardSliceSet *)self->_sliceSet controlKeys];
      BOOL v33 = [v56 objectForKeyedSubscript:@"MoreIntlNames"];
      [v33 setObject:v32 forKeyedSubscript:v29];

      uint64_t v34 = [v58 shape];
      CGRect v57 = [(UIKeyboardSliceSet *)self->_sliceSet controlKeys];
      double v35 = [v57 objectForKeyedSubscript:@"MoreIntlStarts"];
      [v35 setObject:v34 forKeyedSubscript:v29];

      double v36 = [(UIKeyboardSliceSet *)self->_sliceSet controlKeys];
      double v37 = [v36 objectForKeyedSubscript:@"MoreIntlEnds"];
      [v37 setObject:v16 forKeyedSubscript:v29];
    }
    BOOL v15 = a9;
    goto LABEL_13;
  }
LABEL_15:
  double v50 = [v17 listOfType:0 left:v10];
  CGFloat v51 = [v17 listOfType:1 left:v10];
  CGFloat v52 = [v17 listOfType:2 left:v10];
  if (v58)
  {
    double v53 = [v50 subtrees];
    [v53 addObject:v58];
  }
  double v54 = [v51 subtrees];
  [v54 addObject:v16];

  double v55 = [v52 subtrees];
  [v55 addObject:v18];
}

- (void)alignSpaceKeyEdges
{
  id v100 = [(NSMutableArray *)self->_rows lastObject];
  uint64_t v3 = [v100 listOfType:0 left:1];
  char v4 = [v100 listOfType:0 left:0];
  v5 = [v100 listOfType:1 left:1];
  v99 = [v100 listOfType:1 left:0];
  v6 = [NSNumber numberWithInt:15];
  char v7 = [v3 subtreesWithProperty:@"KBinteractionType" value:v6];

  CGFloat v8 = [NSNumber numberWithInt:15];
  BOOL v9 = [v4 subtreesWithProperty:@"KBinteractionType" value:v8];

  if (![v7 count] && !objc_msgSend(v9, "count")) {
    goto LABEL_39;
  }
  v95 = v7;
  BOOL v10 = [v7 lastObject];
  v98 = v5;
  if (v10)
  {
    double v11 = [v3 subtrees];
    int v12 = [v11 indexOfObject:v10];

    double v13 = [v5 subtrees];
    uint64_t v93 = v12;
    v14 = objc_msgSend(v13, "objectAtIndex:");
  }
  else
  {
    v14 = 0;
    uint64_t v93 = 0;
  }
  BOOL v15 = [v9 lastObject];
  v97 = v14;
  v94 = v9;
  if (!v15)
  {
    double v24 = *MEMORY[0x1E4F1DB20];
    double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (!v14)
    {
      double v44 = *MEMORY[0x1E4F1DB20];
      double v48 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v46 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v40 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      int v19 = 0;
      goto LABEL_28;
    }
    int v91 = 0;
    BOOL v20 = 0;
    int v19 = 0;
    goto LABEL_18;
  }
  id v16 = [v4 subtrees];
  int v17 = [v16 indexOfObject:v15];

  id v18 = [v99 subtrees];
  int v91 = v17;
  int v19 = [v18 objectAtIndex:v17];

  BOOL v20 = v19 != 0;
  if (v14 && v19)
  {
    [v14 frame];
    double v22 = v21;
    [v19 frame];
    double v24 = *MEMORY[0x1E4F1DB20];
    double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (v22 <= v23) {
      double v28 = v10;
    }
    else {
      double v28 = v15;
    }
    if (v22 > v23) {
      BOOL v15 = v10;
    }
    BOOL v20 = 1;
    BOOL v10 = v28;
    goto LABEL_18;
  }
  double v24 = *MEMORY[0x1E4F1DB20];
  double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (v14)
  {
LABEL_18:
    id v29 = v19;
    [v14 frame];
    double v31 = v30;
    [v14 frame];
    double v33 = v31 + v32 - self->_leftSideWidestRow;
    uint64_t v34 = +[UIKeyboardPreferencesController sharedPreferencesController];
    [v34 preferencesActions];
    v36 = double v35 = v14;
    [v36 rivenSizeFactor:3.0];
    double v38 = v33 + v37;

    if (fabs(v38) > 0.00000011920929)
    {
      [v35 frame];
      double v40 = v39;
      double v42 = v41 + 0.0;
      double v43 = v38 + 0.0;
      double v44 = v42;
      double v46 = v45 - v43;
      double v48 = v47 + 0.0;
      double v49 = [v98 subtrees];
      double v50 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, v44, v48, v46, v40, v44, v48, v46, v40);
      [v49 replaceObjectAtIndex:v93 withObject:v50];

      int v19 = v29;
      if (!v20) {
        goto LABEL_28;
      }
LABEL_23:
      double v87 = v27;
      double v89 = v44;
      double v51 = v25;
      double v52 = v26;
      double v53 = v24;
      [(UIKBTree *)self->_sourceKeyplane frame];
      double v55 = v54;
      double rightSideWidestRow = self->_rightSideWidestRow;
      [v19 frame];
      double v58 = rightSideWidestRow - (v55 - v57);
      CGRect v59 = +[UIKeyboardPreferencesController sharedPreferencesController];
      v60 = [v59 preferencesActions];
      [v60 rivenSizeFactor:3.0];
      double v62 = v61;

      if (vabdd_f64(v58, v62) <= 0.00000011920929)
      {
        double v24 = v53;
        double v26 = v52;
        double v25 = v51;
        double v27 = v88;
      }
      else
      {
        double v63 = v58 - v62;
        [v19 frame];
        double v26 = v64;
        double v24 = v65 - v63;
        double v27 = v66 - (0.0 - v63);
        double v25 = v67 + 0.0;
        v68 = [v99 subtrees];
        v69 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, v24, v25, v27, v26, v24, v25, v27, v26);
        [v68 replaceObjectAtIndex:v91 withObject:v69];
      }
      double v44 = v89;
      goto LABEL_28;
    }
    int v19 = v29;
  }
  double v44 = v24;
  double v48 = v25;
  double v46 = v27;
  double v40 = v26;
  if (v20) {
    goto LABEL_23;
  }
LABEL_28:
  sourceKeyplane = self->_sourceKeyplane;
  v96 = v4;
  if (v10) {
    v71 = v10;
  }
  else {
    v71 = v15;
  }
  v72 = [v71 name];
  v73 = [(UIKBTree *)sourceKeyplane keysByKeyName:v72];

  v74 = v97;
  if ([v73 count])
  {
    v75 = [v73 lastObject];
    -[UIKBSplitKeyplaneGenerator splitSpaceKey:leftSpace:left:right:](self, "splitSpaceKey:leftSpace:left:right:", v75, v10, v44, v48, v46, v40, v24, v25, v27, v26);
    if (v10)
    {
      v90 = v19;
      v92 = v3;
      v76 = [v10 name];
      v77 = [(UIKeyboardSliceSet *)self->_sliceSet controlKeys];
      v78 = [v77 objectForKeyedSubscript:@"MoreIntlNames"];
      [v78 setObject:v76 forKeyedSubscript:@"Space"];

      v79 = [v10 shape];
      v80 = (void *)[v79 copy];

      v102.origin.CGFloat x = v44;
      v102.origin.CGFloat y = v48;
      v102.size.CGFloat width = v46;
      v102.size.CGFloat height = v40;
      if (!CGRectIsNull(v102))
      {
        v103.origin.CGFloat x = v24;
        v103.origin.CGFloat y = v25;
        v103.size.CGFloat width = v27;
        v103.size.CGFloat height = v26;
        if (!CGRectIsNull(v103)) {
          [v80 scaleWidth:0.5];
        }
      }
      v81 = [(UIKeyboardSliceSet *)self->_sliceSet controlKeys];
      v82 = [v81 objectForKeyedSubscript:@"MoreIntlStarts"];
      [v82 setObject:v80 forKeyedSubscript:@"Space"];

      v83 = [v98 subtrees];
      v84 = [v83 objectAtIndexedSubscript:v93];
      v85 = [(UIKeyboardSliceSet *)self->_sliceSet controlKeys];
      v86 = [v85 objectForKeyedSubscript:@"MoreIntlEnds"];
      [v86 setObject:v84 forKeyedSubscript:@"Space"];

      int v19 = v90;
      uint64_t v3 = v92;
      v74 = v97;
    }
  }
  char v7 = v95;
  char v4 = v96;
  v5 = v98;
  BOOL v9 = v94;
LABEL_39:
}

- (void)splitRow:(id)a3
{
  id v126 = a3;
  char v4 = [v126 hints];
  if (v4)
  {
    v117 = self;
    v5 = v4;
    v6 = [v4 valueForKey:@"LeftMargin"];
    [v6 floatValue];
    double v8 = v7;

    BOOL v9 = [v5 valueForKey:@"RightMargin"];
    [v9 floatValue];
    double v11 = v10;

    int v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v13 = [v12 preferencesActions];
    [v13 rivenSizeFactor:v8];
    long long rect = v14;

    BOOL v15 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v16 = [v15 preferencesActions];
    [v16 rivenSizeFactor:v11];
    long long rect_16 = v17;

    id v18 = +[UIKeyboardPreferencesController sharedPreferencesController];
    int v19 = [v18 preferencesActions];
    [v19 rivenSizeFactor:3.0];
    double v21 = v20;

    double v22 = (double *)MEMORY[0x1E4F1DB28];
    uint64_t v118 = [MEMORY[0x1E4F1CA60] dictionary];
    double v23 = [v5 valueForKey:@"WidthFactors"];
    double v24 = [v5 valueForKey:@"LeftCount"];
    uint64_t v25 = [v24 intValue];

    id v115 = v5;
    double v26 = [v5 valueForKey:@"RightCount"];
    int v27 = [v26 intValue];

    double v28 = [v126 keys];
    unint64_t v29 = [v28 count];

    int v114 = v27 + v25;
    uint64_t v122 = v25;
    if (v29 < v27 + (int)v25)
    {
      double v30 = [v126 keyAtIndex:(v25 - 1)];
      double v31 = (void *)[v30 copy];
      double v32 = (void *)MEMORY[0x1E4F1CA60];
      double v33 = [v30 cache];
      uint64_t v34 = [v32 dictionaryWithDictionary:v33];

      double v35 = [NSNumber numberWithInt:3];
      [v34 setObject:v35 forKey:@"KBsplitMode"];

      [v31 setCache:v34];
      [v31 setSplitMode:3];
      double v36 = [v126 keys];
      [v36 insertObject:v31 atIndex:(int)v122];

      uint64_t v25 = v122;
    }
    double v37 = *v22;
    double y = v22[1];
    double v39 = &off_1E52D3000;
    double v40 = v22[2];
    double height = v22[3];
    uint64_t v116 = (v25 - 1);
    double v123 = v21;
    double v119 = height;
    if ((int)v25 < 1)
    {
      char v44 = 0;
      double width = v22[2];
      double v42 = v22[1];
      double x = *v22;
    }
    else
    {
      int v112 = v27;
      double v42 = v22[1];
      uint64_t v43 = 0;
      char v44 = 0;
      uint64_t v121 = v25;
      do
      {
        double v45 = [v126 keyAtIndex:v43];
        BOOL v46 = [v45 interactionType] == 15;
        BOOL v47 = [v45 interactionType] == 15;
        BOOL v48 = v116 == v43 && v46;
        v44 |= v48;
        BOOL v49 = v116 != v43 && v47;
        double v50 = [v23 objectAtIndex:v43];
        [v50 floatValue];
        float v52 = v51;
        double v53 = v51;

        [v126 defaultKeySize];
        CGFloat v55 = v54 * v53;
        [v126 defaultKeySize];
        CGFloat v57 = v56;
        [v126 rowOffset];
        v128.origin.double y = v58;
        *(void *)&v128.origin.double x = rect;
        v128.size.double width = v55;
        v128.size.double height = v57;
        CGRect v129 = CGRectIntegral(v128);
        double x = v129.origin.x;
        double y = v129.origin.y;
        double width = v129.size.width;
        double height = v129.size.height;
        double v61 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, x, y, width, height, x, y, width, height);
        uint64_t v62 = [v45 cache];
        double v63 = (void *)v62;
        if (v62) {
          uint64_t v64 = v62;
        }
        else {
          uint64_t v64 = v118;
        }
        BOOL v71 = v52 == 1.0;
        double v21 = v123;
        char v65 = v71;
        LOBYTE(v109) = v65;
        [(UIKBSplitKeyplaneGenerator *)v117 addKey:v45 withShape:v61 forRow:v126 attribs:v64 left:1 force:v49 isDefaultWidth:v109];

        *((void *)&v66 + 1) = *((void *)&rect + 1);
        *(double *)&long long v66 = *(double *)&rect + v123 + width;
        long long rect = v66;

        ++v43;
      }
      while (v121 != v43);
      uint64_t v25 = v122;
      double v39 = &off_1E52D3000;
      int v27 = v112;
    }
    int v67 = v27 - 1;
    if (v27 < 1)
    {
      v69 = v117;
    }
    else
    {
      double v113 = height;
      uint64_t v68 = v114;
      uint64_t v120 = (int)v25;
      v69 = v117;
      do
      {
        --v68;
        v70 = [v126 keyAtIndex:(v25 + v67)];
        BOOL v71 = [v70 interactionType] == 15 && v67 == 0;
        char v72 = v71;
        v44 |= v72;
        BOOL v73 = [v70 interactionType] == 15;
        BOOL v75 = v67-- != 0 && v73;
        v76 = [v23 objectAtIndex:v68];
        [v76 floatValue];
        float v78 = v77;
        double v79 = v77;

        [v126 defaultKeySize];
        CGFloat v81 = v80 * v79;
        [v126 defaultKeySize];
        CGFloat v83 = v82;
        [v126 rowWidth];
        CGFloat v85 = v84 - *(double *)&rect_16 - v81;
        [v126 rowOffset];
        v130.origin.double y = v86;
        v130.origin.double x = v85;
        v130.size.double width = v81;
        v130.size.double height = v83;
        CGRect v131 = CGRectIntegral(v130);
        double v87 = v131.origin.x;
        double v42 = v131.origin.y;
        double v40 = v131.size.width;
        double v88 = v131.size.height;
        double v89 = objc_msgSend(objc_alloc((Class)v39[465]), "initWithGeometry:frame:paddedFrame:", 0, v87, v42, v40, v88, v87, v42, v40, v88);
        uint64_t v90 = [v70 cache];
        int v91 = v39;
        v92 = (void *)v90;
        if (v90) {
          uint64_t v93 = v90;
        }
        else {
          uint64_t v93 = v118;
        }
        BOOL v71 = v78 == 1.0;
        double v21 = v123;
        char v94 = v71;
        LOBYTE(v109) = v94;
        BOOL v95 = v75;
        uint64_t v25 = v122;
        [(UIKBSplitKeyplaneGenerator *)v117 addKey:v70 withShape:v89 forRow:v126 attribs:v93 left:0 force:v95 isDefaultWidth:v109];

        double v39 = v91;
        *((void *)&v96 + 1) = *((void *)&rect_16 + 1);
        *(double *)&long long v96 = *(double *)&rect_16 + v123 + v40;
        long long rect_16 = v96;
      }
      while (v68 > v120);
      double v119 = v88;
      double v37 = v87;
      double height = v113;
    }
    v97 = (void *)v118;
    *(void *)&v98.f64[0] = rect;
    if (v44)
    {
      [(UIKBSplitKeyplaneGenerator *)v69 commitUncommittedSlices];
      [(UIKBSplitKeyplaneGenerator *)v69 alignSpaceKeyEdges];
    }
    else
    {
      *(void *)&v98.f64[1] = rect_16;
      *(int8x16_t *)&v69->_leftSideWidestRow = vbslq_s8((int8x16_t)vcgtq_f64(v98, *(float64x2_t *)&v69->_leftSideWidestRow), (int8x16_t)v98, *(int8x16_t *)&v69->_leftSideWidestRow);
      [(UIKBSplitKeyplaneGenerator *)v69 commitUncommittedSlices];
    }
    id v99 = [(NSMutableArray *)v69->_rows lastObject];

    if (v99 != v126)
    {
      id v100 = (void *)MEMORY[0x1E4F1CA60];
      v101 = [NSNumber numberWithBool:1];
      CGRect v102 = objc_msgSend(v100, "dictionaryWithObjectsAndKeys:", v101, @"KBghost", 0);

      CGRect v103 = [v126 keyAtIndex:v25];
      v104 = [v126 keyAtIndex:v116];
      v105 = objc_msgSend(objc_alloc((Class)v39[465]), "initWithGeometry:frame:paddedFrame:", 0, v21 + width + x, y, width, height, v21 + width + x, y, width, height);
      v106 = (void *)[v103 copy];
      LOBYTE(v110) = 1;
      [(UIKBSplitKeyplaneGenerator *)v69 addKey:v106 withShape:v105 forRow:v126 attribs:v102 left:1 force:0 isDefaultWidth:v110];

      v107 = objc_msgSend(objc_alloc((Class)v39[465]), "initWithGeometry:frame:paddedFrame:", 0, v37 - (v123 + v40), v42, v40, v119, v37 - (v123 + v40), v42, v40, v119);
      v108 = (void *)[v104 copy];
      LOBYTE(v111) = 1;
      [(UIKBSplitKeyplaneGenerator *)v69 addKey:v108 withShape:v107 forRow:v126 attribs:v102 left:0 force:0 isDefaultWidth:v111];

      v97 = (void *)v118;
    }

    char v4 = v115;
  }
}

- (id)hintsForRow:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [v3 keys];
  v5 = [v4 objectAtIndex:0];

  double v39 = v5;
  v6 = [v5 shape];
  float v7 = [v6 originalShape];

  if (v7)
  {
    uint64_t v8 = [v6 originalShape];

    v6 = (void *)v8;
  }
  BOOL v9 = NSString;
  [v6 frame];
  double v11 = objc_msgSend(v9, "stringWithFormat:", @"%d-", (int)v10);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  int v12 = [v3 keys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      uint64_t v16 = 0;
      long long v17 = v11;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        id v18 = [*(id *)(*((void *)&v40 + 1) + 8 * v16) shape];
        int v19 = [v18 originalShape];

        if (v19)
        {
          uint64_t v20 = [v18 originalShape];

          id v18 = (void *)v20;
        }
        [v18 frame];
        double v11 = objc_msgSend(v17, "stringByAppendingFormat:", @"%d:", (int)v21);

        ++v16;
        long long v17 = v11;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v14);
  }

  double v22 = objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 1);

  double v23 = [(NSDictionary *)self->_splitLayoutHints valueForKey:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v24 = [(NSDictionary *)self->_splitLayoutHints valueForKey:v23];
  }
  else
  {
    if (v23) {
      goto LABEL_20;
    }
    double v24 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v25 = [v3 keys];
    unint64_t v26 = (unint64_t)[v25 count] >> 1;

    double v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v26);
    int v27 = NSString;
    double v28 = [v3 keys];
    uint64_t v29 = objc_msgSend(v27, "stringWithFormat:", @"%d", objc_msgSend(v28, "count") - v26);

    [v24 setObject:v23 forKeyedSubscript:@"LeftCount"];
    double v38 = (void *)v29;
    [v24 setObject:v29 forKeyedSubscript:@"RightCount"];
    [v24 setObject:@"10" forKeyedSubscript:@"LeftMargin"];
    [v24 setObject:@"10" forKeyedSubscript:@"RightMargin"];
    double v30 = [MEMORY[0x1E4F1CA48] array];
    double v31 = [v3 keys];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      unint64_t v33 = 0;
      do
      {
        [v30 addObject:@"1"];
        ++v33;
        uint64_t v34 = [v3 keys];
        unint64_t v35 = [v34 count];
      }
      while (v35 > v33);
    }
    [v24 setObject:v30 forKeyedSubscript:@"WidthFactors"];
  }
  double v23 = v24;
LABEL_20:

  return v23;
}

- (void)organizeKeyplaneIntoRows
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  rows = self->_rows;
  if (rows)
  {
    [(NSMutableArray *)rows removeAllObjects];
  }
  else
  {
    char v4 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    v5 = self->_rows;
    self->_rows = v4;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v6 = [(UIKBSplitKeyplaneGenerator *)self keysOrderedByPosition];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v7)
  {

    double v10 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = v7;
  unsigned __int8 v9 = 0;
  double v10 = 0;
  uint64_t v11 = *(void *)v24;
  CGFloat v12 = *MEMORY[0x1E4F1DB28];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v16 = 2147483650.0;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v6);
      }
      id v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      [v18 frame];
      double y = v29.origin.y;
      v30.origin.double x = v12;
      v30.origin.double y = v13;
      v30.size.double width = v14;
      v30.size.double height = v15;
      if (!CGRectEqualToRect(v29, v30))
      {
        if (v10)
        {
          if (vabdd_f64(v16, y) < 0.00000011920929)
          {
            [(UIKBSplitRow *)v10 addKey:v18];
            continue;
          }
          uint64_t v20 = [(UIKBSplitKeyplaneGenerator *)self hintsForRow:v10];
          [(UIKBSplitRow *)v10 setHints:v20];

          [(NSMutableArray *)self->_rows addObject:v10];
          ++v9;
        }
        double v21 = objc_alloc_init(UIKBSplitRow);

        [(UIKBSplitRow *)v21 setRowIndex:v9];
        [(UIKBSplitRow *)v21 addKey:v18];
        double v16 = y;
        double v10 = v21;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v8);

  if (v10 && ([(NSMutableArray *)self->_rows containsObject:v10] & 1) == 0)
  {
    double v22 = [(UIKBSplitKeyplaneGenerator *)self hintsForRow:v10];
    [(UIKBSplitRow *)v10 setHints:v22];

    [(NSMutableArray *)self->_rows addObject:v10];
  }
LABEL_21:
}

- (void)initializeGeneratorForKeyplane:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[UIKeyboardImpl activeInstance];
  unsigned __int8 v9 = [v8 textInputTraits];
  self->_keyboardType = [v9 keyboardType];

  [v7 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  self->_keyboardSize.double width = v11;
  self->_keyboardSize.double height = v13;
  CGFloat v14 = (void *)initializeGeneratorForKeyplane_name__hints;
  if (!initializeGeneratorForKeyplane_name__hints)
  {
    uint64_t v15 = +[UIRivenFactory _splitKeyboardLayoutHints];
    double v16 = (void *)initializeGeneratorForKeyplane_name__hints;
    initializeGeneratorForKeyplane_name__hints = v15;

    CGFloat v14 = (void *)initializeGeneratorForKeyplane_name__hints;
  }
  objc_storeStrong((id *)&self->_splitLayoutHints, v14);
  self->_leftSideWidestRow = 0.0;
  self->_double rightSideWidestRow = 0.0;
  if (self->_keyboardType == 1) {
    self->_keyboardType = 0;
  }
  +[UIKeyboardImpl defaultSizeForInterfaceOrientation:1];
  double v18 = v17;
  [(UIKBTree *)self->_sourceKeyboard frame];
  if (v19 == v18) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = 4;
  }
  id v23 = +[UIKeyboardSliceStore sliceSetIDForKeyplaneName:v6 type:self->_keyboardType orientation:v20];

  double v21 = [[UIKeyboardSliceSet alloc] initWithSliceID:v23];
  sliceSet = self->_sliceSet;
  self->_sliceSet = v21;
}

- (id)finalizeSplitKeyplane
{
  id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  char v4 = [v3 preferencesActions];
  [v4 rivenSizeFactor:7.0];
  double v6 = v5;

  double rightSideWidestRow = self->_rightSideWidestRow;
  double v8 = v6 + self->_leftSideWidestRow;
  double height = self->_keyboardSize.height;
  CGFloat v10 = self->_keyboardSize.width - rightSideWidestRow - v6;
  double v11 = v6 + rightSideWidestRow;
  double v12 = +[UIKBTree treeOfType:2];
  CGFloat v13 = NSString;
  CGFloat v14 = [(UIKBTree *)self->_sourceKeyplane name];
  uint64_t v15 = [v13 stringWithFormat:@"%@-split", v14];
  [v12 setName:v15];

  CGRect v59 = +[UIKBTree treeOfType:3];
  [v59 setName:@"split-left"];
  double v16 = [UIKBShape alloc];
  double v17 = +[UIKBGeometry geometryWithRect:](UIKBGeometry, "geometryWithRect:", 0.0, 0.0, v8, height);
  double v18 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v16, "initWithGeometry:frame:paddedFrame:", v17, 0.0, 0.0, v8, height, 0.0, 0.0, v8, height);
  [v59 setShape:v18];

  CGFloat v58 = +[UIKBTree treeOfType:3];
  [v58 setName:@"split-right"];
  double v19 = [UIKBShape alloc];
  uint64_t v20 = +[UIKBGeometry geometryWithRect:](UIKBGeometry, "geometryWithRect:", v10, 0.0, v11, height);
  double v21 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v19, "initWithGeometry:frame:paddedFrame:", v20, v10, 0.0, v11, height, v10, 0.0, v11, height);
  [v58 setShape:v21];

  double v22 = +[UIKBTree treeOfType:4];
  id v23 = +[UIKBTree treeOfType:5];
  long long v24 = +[UIKBTree treeOfType:6];
  long long v25 = +[UIKBTree treeOfType:4];
  long long v26 = +[UIKBTree treeOfType:5];
  int v27 = +[UIKBTree treeOfType:6];
  rows = self->_rows;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __51__UIKBSplitKeyplaneGenerator_finalizeSplitKeyplane__block_invoke;
  v62[3] = &unk_1E52FE7E0;
  id v63 = v22;
  id v64 = v23;
  id v65 = v24;
  id v66 = v25;
  id v67 = v26;
  id v68 = v27;
  id v57 = v12;
  id v69 = v57;
  id v60 = v27;
  id v29 = v26;
  id v30 = v25;
  id v61 = v24;
  id v31 = v23;
  id v32 = v22;
  [(NSMutableArray *)rows enumerateObjectsUsingBlock:v62];
  unint64_t v33 = [v59 subtrees];
  [v33 addObject:v32];

  uint64_t v34 = [v59 subtrees];
  [v34 addObject:v31];

  unint64_t v35 = [v59 subtrees];
  [v35 addObject:v61];

  double v36 = [v58 subtrees];
  [v36 addObject:v30];

  double v37 = [v58 subtrees];
  [v37 addObject:v29];

  double v38 = [v58 subtrees];
  [v38 addObject:v60];

  double v39 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v59, v58, 0);
  [v57 setSubtrees:v39];

  long long v40 = [(UIKBTree *)self->_sourceKeyplane properties];
  [v57 setProperties:v40];

  long long v41 = [v57 subtrees];
  long long v42 = [(UIKBTree *)self->_sourceKeyplane subtreeWithType:11];
  [v41 addObject:v42];

  long long v43 = [(UIKBTree *)self->_sourceKeyplane subtrees];
  char v44 = [v43 objectAtIndex:0];
  [v44 frame];
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;

  if (+[UIDevice _hasHomeButton]) {
    double v53 = v52;
  }
  else {
    double v53 = v52 + 20.0;
  }
  -[UIKeyboardSliceSet setStartRect:](self->_sliceSet, "setStartRect:", v46, v48, v50, v53);
  -[UIKeyboardSliceSet setEndRect:](self->_sliceSet, "setEndRect:", 0.0, 0.0, self->_keyboardSize.width, self->_keyboardSize.height);
  [(UIKeyboardSliceSet *)self->_sliceSet setLeftWidth:v8];
  [(UIKeyboardSliceSet *)self->_sliceSet setRightWidth:v11];
  +[UIKeyboardSliceStore archiveSet:self->_sliceSet];
  double v54 = v69;
  id v55 = v57;

  return v55;
}

void __51__UIKBSplitKeyplaneGenerator_finalizeSplitKeyplane__block_invoke(id *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 listOfType:0 left:1];
  double v5 = [a1[4] subtrees];
  [v5 addObject:v4];

  double v6 = [a1[5] subtrees];
  id v7 = [v3 listOfType:1 left:1];
  [v6 addObject:v7];

  double v8 = [a1[6] subtrees];
  unsigned __int8 v9 = [v3 listOfType:2 left:1];
  [v8 addObject:v9];

  CGFloat v10 = [v3 listOfType:0 left:0];
  double v11 = [a1[7] subtrees];
  [v11 addObject:v10];

  double v12 = [a1[8] subtrees];
  CGFloat v13 = [v3 listOfType:1 left:0];
  [v12 addObject:v13];

  CGFloat v14 = [a1[9] subtrees];
  uint64_t v15 = [v3 listOfType:2 left:0];
  [v14 addObject:v15];

  double v16 = [v4 subtrees];
  double v17 = [v10 subtrees];
  double v18 = [v16 arrayByAddingObjectsFromArray:v17];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v24, "shouldCacheKey", (void)v25)) {
          [a1[10] cacheKey:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v21);
  }
}

- (id)generateRivenKeyplaneFromKeyplane:(id)a3 forKeyboard:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_sourceKeyplane, a3);
    objc_storeStrong((id *)&self->_sourceKeyboard, a4);
    unsigned __int8 v9 = [v7 name];
    if ([v7 looksLikeShiftAlternate] && objc_msgSend(v7, "isShiftKeyplane"))
    {
      CGFloat v10 = [v7 shiftAlternateKeyplaneName];
      double v11 = [v8 subtreeWithName:v10];
      uint64_t v12 = [v11 name];

      unsigned __int8 v9 = (void *)v12;
    }
    [(UIKBSplitKeyplaneGenerator *)self initializeGeneratorForKeyplane:v7 name:v9];
    [(UIKBSplitKeyplaneGenerator *)self organizeKeyplaneIntoRows];
    CGFloat v13 = [(NSMutableArray *)self->_rows objectAtIndex:0];
    CGFloat v14 = [v13 hints];
    uint64_t v15 = [v14 valueForKey:@"RowPadding"];

    double v50 = v15;
    if (v15)
    {
      [v15 floatValue];
      double v17 = v16;
    }
    else
    {
      id v19 = +[UIKeyboardPreferencesController sharedPreferencesController];
      uint64_t v20 = [v19 preferencesActions];
      [v20 rivenSizeFactor:5.0];
      double v17 = v21;
    }
    id v53 = v7;
    if ((unint64_t)[(NSMutableArray *)self->_rows count] <= 4) {
      double v22 = v17;
    }
    else {
      double v22 = v17 + 1.0;
    }
    id v23 = +[UIKeyboardPreferencesController sharedPreferencesController];
    long long v24 = [v23 preferencesActions];
    [v24 rivenSizeFactor:9.0];
    double v26 = v25;

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obj = self->_rows;
    uint64_t v27 = [(NSMutableArray *)obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    double v51 = v9;
    id v52 = v8;
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v56 != v29) {
            objc_enumerationMutation(obj);
          }
          id v31 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          id v32 = [v31 hints];
          unint64_t v33 = [v32 valueForKey:@"KeySize"];

          if (v33)
          {
            CGSize v34 = CGSizeFromString(v33);
            double width = v34.width;
            double height = v34.height;
          }
          else
          {
            double height = 46.0;
            double width = 40.0;
          }
          double v37 = +[UIKeyboardPreferencesController sharedPreferencesController];
          double v38 = [v37 preferencesActions];
          [v38 rivenSizeFactor:width];
          double v40 = v39;

          long long v41 = +[UIKeyboardPreferencesController sharedPreferencesController];
          long long v42 = [v41 preferencesActions];
          [v42 rivenSizeFactor:height];
          double v44 = v43;

          [v31 setRowOffset:v26];
          [v31 setRowWidth:self->_keyboardSize.width];
          objc_msgSend(v31, "setDefaultKeySize:", v40, v44);
          [(UIKBSplitKeyplaneGenerator *)self splitRow:v31];
          [v31 defaultKeySize];
          double v26 = v26 + v22 + v45;
        }
        uint64_t v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v28);
    }

    double v46 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v47 = [v46 preferencesActions];
    [v47 rivenSizeFactor:3.0];
    self->_keyboardSize.double height = v26 + v48;

    double v18 = [(UIKBSplitKeyplaneGenerator *)self finalizeSplitKeyplane];

    id v8 = v52;
    id v7 = v53;
  }
  else
  {
    double v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSlice, 0);
  objc_storeStrong((id *)&self->_leftSlice, 0);
  objc_storeStrong((id *)&self->_sliceSet, 0);
  objc_storeStrong((id *)&self->_sourceKeyplane, 0);
  objc_storeStrong((id *)&self->_sourceKeyboard, 0);
  objc_storeStrong((id *)&self->_splitLayoutHints, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end