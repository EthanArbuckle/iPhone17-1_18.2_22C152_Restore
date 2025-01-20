@interface TUIKeyplaneRow
+ (id)emptyRowForKeyplane:(id)a3 rowNumber:(int64_t)a4;
+ (id)rowForKeyplane:(id)a3 keys:(id)a4 letterKeyGuide:(id)a5;
- (BOOL)_userInteractionStateDeterminesLayerHitTestState;
- (BOOL)edgeToEdge;
- (BOOL)keyIsControlType:(id)a3;
- (BOOL)keyIsSpaceType:(id)a3;
- (BOOL)keyIsStringType:(id)a3;
- (BOOL)rowHasDoubleHeightKeys;
- (NSArray)currentKeys;
- (NSLayoutConstraint)middlePaddingWidthConstraint;
- (NSMutableArray)constraintsForSplitRow;
- (NSMutableArray)constraintsForUnsplitRow;
- (NSMutableArray)doubleHeightKeys;
- (NSMutableArray)keyViews;
- (NSMutableArray)layoutGuidesForRow;
- (NSMutableArray)letterKeyConstraints;
- (TUIKBKeyView)extraSpaceBar;
- (TUIKeyplaneRow)init;
- (TUIKeyplaneView)hostView;
- (UILayoutGuide)keySizingGuide;
- (UILayoutGuide)splitSpacingGuide;
- (double)middlePaddingConstantFromInsets:(UIEdgeInsets)a3;
- (id)constraintsForStringKeys:(id)a3 inRowGuide:(id)a4 matchingSizingGuide:(id)a5 splitIndex:(int64_t)a6;
- (id)description;
- (id)doubleHeightKeysForRow;
- (id)splitLayoutGuide;
- (int64_t)rowNumberInKeyplane;
- (int64_t)rowType;
- (unint64_t)leftControlKeyCount;
- (unint64_t)rightControlKeyCount;
- (void)layoutRowWithKeys:(id)a3 guide:(id)a4 type:(int64_t)a5;
- (void)removeFromSuperview;
- (void)resetRow;
- (void)setConstraintsForSplitRow:(id)a3;
- (void)setConstraintsForUnsplitRow:(id)a3;
- (void)setCurrentKeys:(id)a3;
- (void)setDoubleHeightKeys:(id)a3;
- (void)setEdgeToEdge:(BOOL)a3;
- (void)setExtraSpaceBar:(id)a3;
- (void)setHostView:(id)a3;
- (void)setKeySizingGuide:(id)a3;
- (void)setKeyViews:(id)a3;
- (void)setLayoutGuidesForRow:(id)a3;
- (void)setLeftControlKeyCount:(unint64_t)a3;
- (void)setLetterKeyConstraints:(id)a3;
- (void)setMiddlePaddingWidthConstraint:(id)a3;
- (void)setRenderConfig:(id)a3;
- (void)setRightControlKeyCount:(unint64_t)a3;
- (void)setRowNumberInKeyplane:(int64_t)a3;
- (void)setRowType:(int64_t)a3;
- (void)setSplitSpacingGuide:(id)a3;
- (void)toggleConstraintsForSplit:(BOOL)a3;
- (void)updateKeysForTransition:(BOOL)a3;
- (void)updateKeysInRowWithData:(id)a3;
- (void)updateKeysInRowWithStyle:(int64_t)a3 factory:(id)a4;
@end

@implementation TUIKeyplaneRow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middlePaddingWidthConstraint, 0);
  objc_storeStrong((id *)&self->_splitSpacingGuide, 0);
  objc_storeStrong((id *)&self->_keySizingGuide, 0);
  objc_storeStrong((id *)&self->_currentKeys, 0);
  objc_storeStrong((id *)&self->_extraSpaceBar, 0);
  objc_storeStrong((id *)&self->_constraintsForUnsplitRow, 0);
  objc_storeStrong((id *)&self->_constraintsForSplitRow, 0);
  objc_storeStrong((id *)&self->_doubleHeightKeys, 0);
  objc_storeStrong((id *)&self->_layoutGuidesForRow, 0);
  objc_storeStrong((id *)&self->_keyViews, 0);
  objc_storeStrong((id *)&self->_letterKeyConstraints, 0);
  objc_destroyWeak((id *)&self->_hostView);
}

- (void)setMiddlePaddingWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)middlePaddingWidthConstraint
{
  return self->_middlePaddingWidthConstraint;
}

- (void)setSplitSpacingGuide:(id)a3
{
}

- (UILayoutGuide)splitSpacingGuide
{
  return self->_splitSpacingGuide;
}

- (void)setRowNumberInKeyplane:(int64_t)a3
{
  self->_rowNumberInKeyplane = a3;
}

- (int64_t)rowNumberInKeyplane
{
  return self->_rowNumberInKeyplane;
}

- (void)setKeySizingGuide:(id)a3
{
}

- (UILayoutGuide)keySizingGuide
{
  return self->_keySizingGuide;
}

- (void)setCurrentKeys:(id)a3
{
}

- (NSArray)currentKeys
{
  return self->_currentKeys;
}

- (void)setExtraSpaceBar:(id)a3
{
}

- (TUIKBKeyView)extraSpaceBar
{
  return self->_extraSpaceBar;
}

- (void)setConstraintsForUnsplitRow:(id)a3
{
}

- (NSMutableArray)constraintsForUnsplitRow
{
  return self->_constraintsForUnsplitRow;
}

- (void)setConstraintsForSplitRow:(id)a3
{
}

- (NSMutableArray)constraintsForSplitRow
{
  return self->_constraintsForSplitRow;
}

- (void)setDoubleHeightKeys:(id)a3
{
}

- (NSMutableArray)doubleHeightKeys
{
  return self->_doubleHeightKeys;
}

- (void)setLayoutGuidesForRow:(id)a3
{
}

- (NSMutableArray)layoutGuidesForRow
{
  return self->_layoutGuidesForRow;
}

- (void)setKeyViews:(id)a3
{
}

- (NSMutableArray)keyViews
{
  return self->_keyViews;
}

- (void)setLetterKeyConstraints:(id)a3
{
}

- (NSMutableArray)letterKeyConstraints
{
  return self->_letterKeyConstraints;
}

- (void)setRightControlKeyCount:(unint64_t)a3
{
  self->_rightControlKeyCount = a3;
}

- (unint64_t)rightControlKeyCount
{
  return self->_rightControlKeyCount;
}

- (void)setLeftControlKeyCount:(unint64_t)a3
{
  self->_leftControlKeyCount = a3;
}

- (unint64_t)leftControlKeyCount
{
  return self->_leftControlKeyCount;
}

- (void)setHostView:(id)a3
{
}

- (TUIKeyplaneView)hostView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
  return (TUIKeyplaneView *)WeakRetained;
}

- (void)setEdgeToEdge:(BOOL)a3
{
  self->_edgeToEdge = a3;
}

- (BOOL)edgeToEdge
{
  return self->_edgeToEdge;
}

- (void)setRowType:(int64_t)a3
{
  self->_rowType = a3;
}

- (int64_t)rowType
{
  return self->_rowType;
}

- (double)middlePaddingConstantFromInsets:(UIEdgeInsets)a3
{
  return a3.left + a3.right + a3.left + a3.right;
}

- (BOOL)_userInteractionStateDeterminesLayerHitTestState
{
  return 1;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(TUIKeyplaneRow *)self currentKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) backingTree];
        v10 = [v9 name];
        [v3 appendFormat:@"[%@]", v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v11 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)TUIKeyplaneRow;
  v12 = [(TUIKeyplaneRow *)&v15 description];
  v13 = [v11 stringWithFormat:@"<%@ %@>", v12, v3];

  return v13;
}

- (BOOL)keyIsControlType:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 interactionType] == 4
    || [v3 interactionType] == 5
    || [v3 interactionType] == 6
    || [v3 interactionType] == 9
    || [v3 interactionType] == 10
    || [v3 interactionType] == 11
    || [v3 interactionType] == 13
    || [v3 interactionType] == 14
    || [v3 interactionType] == 37
    || [v3 interactionType] == 38
    || [v3 interactionType] == 17;

  return v4;
}

- (BOOL)keyIsSpaceType:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 interactionType] == 15 || objc_msgSend(v3, "displayType") == 25;

  return v4;
}

- (BOOL)keyIsStringType:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 interactionType] == 1
    || [v3 interactionType] == 2
    || [v3 interactionType] == 16;

  return v4;
}

- (id)constraintsForStringKeys:(id)a3 inRowGuide:(id)a4 matchingSizingGuide:(id)a5 splitIndex:(int64_t)a6
{
  v109[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v93 = a4;
  id v91 = a5;
  id v95 = [MEMORY[0x1E4F1CA48] array];
  id v92 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  v10 = 0;
  if (![v9 count]) {
    goto LABEL_48;
  }
  unint64_t v11 = 0;
  id v90 = v9;
  v94 = self;
  do
  {
    v12 = [v9 objectAtIndex:v11];
    v13 = [(TUIKeyplaneRow *)self hostView];
    v14 = [v13 keyViewForKey:v12];

    if (!v14) {
      goto LABEL_42;
    }
    v96 = v12;
    unint64_t v97 = v11;
    if ([v14 layoutType] != 1)
    {
      if (v10 && [v10 layoutType] == 1)
      {
        v29 = [v92 rightAnchor];
        v30 = [v14 leftAnchor];
        v31 = [v29 constraintEqualToAnchor:v30];
        [v95 addObject:v31];
      }
      objc_msgSend(v14, "setRowNumber:", -[TUIKeyplaneRow rowNumberInKeyplane](self, "rowNumberInKeyplane"));
      v32 = [(TUIKeyplaneRow *)self keyViews];
      [v32 addObject:v14];

      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      if (-[TUIKeyplaneRow rowType](self, "rowType") == 7 && [v14 layoutType] != 4)
      {
        if ([v14 layoutShape] == 2) {
          goto LABEL_13;
        }
        uint64_t v33 = 1;
      }
      else
      {
        uint64_t v33 = 0;
      }
      [v14 setLayoutShape:v33];
LABEL_13:
      [(TUIKeyplaneRow *)self addSubview:v14];
      if ([v14 layoutType] == 4)
      {
        v34 = [(TUIKeyplaneRow *)self hostView];
        int v35 = [v34 supportsSplit];

        if (v35)
        {
          if ([v10 layoutType] == 4)
          {
            [(TUIKeyplaneRow *)self setExtraSpaceBar:v14];
            v36 = [(TUIKeyplaneRow *)self constraintsForSplitRow];
            v37 = [(TUIKeyplaneRow *)self splitLayoutGuide];
            v89 = [v37 leftAnchor];
            v86 = [v10 rightAnchor];
            v85 = [v89 constraintEqualToAnchor:v86 constant:0.0];
            v108[0] = v85;
            v38 = [v14 leftAnchor];
            v39 = [(TUIKeyplaneRow *)self splitLayoutGuide];
            v40 = [v39 rightAnchor];
            v41 = [v38 constraintEqualToAnchor:v40 constant:0.0];
            v108[1] = v41;
            v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
            [v36 addObjectsFromArray:v42];

            uint64_t v43 = [(TUIKeyplaneRow *)v94 constraintsForUnsplitRow];
            v44 = [v14 rightAnchor];
            v45 = [v10 rightAnchor];
            v46 = [v44 constraintEqualToAnchor:v45];
            v107[0] = v46;
            v47 = [v10 leftAnchor];
            v48 = [v14 leftAnchor];
            v49 = [v47 constraintEqualToAnchor:v48];
            v107[1] = v49;
            v50 = (void *)v43;
            v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:2];
            [v50 addObjectsFromArray:v51];
          }
          else
          {
            if (v10)
            {
LABEL_39:
              v63 = [v14 widthAnchor];
              v64 = [v91 widthAnchor];
              v65 = [v63 constraintGreaterThanOrEqualToAnchor:v64 multiplier:1.0];
              v105 = v65;
              a6 = -1;
              v66 = &v105;
LABEL_40:
              v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
              [v95 addObjectsFromArray:v72];

              v73 = [v14 topAnchor];
              v74 = [v93 topAnchor];
              v75 = [v73 constraintEqualToAnchor:v74];
              v98[0] = v75;
              v76 = [v93 bottomAnchor];
              v77 = [v14 bottomAnchor];
              v78 = [v76 constraintEqualToAnchor:v77];
              v98[1] = v78;
              v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
              [v95 addObjectsFromArray:v79];

              id v80 = v14;
              id v9 = v90;
              v23 = v10;
              self = v94;
              goto LABEL_41;
            }
            v50 = [v14 leftAnchor];
            v44 = [v93 leftAnchor];
            v45 = [v50 constraintEqualToAnchor:v44];
            v106 = v45;
            v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
            [v95 addObjectsFromArray:v46];
          }

          goto LABEL_39;
        }
      }
      if (v10)
      {
        if ([v10 layoutType] == 1) {
          goto LABEL_28;
        }
        if (v11 == a6)
        {
          v52 = [(TUIKeyplaneRow *)self hostView];
          int v53 = [v52 supportsSplit];

          if (v53)
          {
            v54 = [(TUIKeyplaneRow *)self splitSpacingGuide];
            v55 = [v54 leftAnchor];
            v56 = [v10 rightAnchor];
            v87 = [v55 constraintEqualToAnchor:v56];
            v104[0] = v87;
            v57 = [v14 leftAnchor];
            v58 = [(TUIKeyplaneRow *)self splitSpacingGuide];
            v59 = [v58 rightAnchor];
            v60 = [v57 constraintEqualToAnchor:v59];
            v104[1] = v60;
            v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
            [v95 addObjectsFromArray:v61];

            self = v94;
LABEL_27:

LABEL_28:
            if ([v14 layoutType] == 4)
            {
              v63 = [v14 widthAnchor];
              v64 = [v91 widthAnchor];
              v65 = [v63 constraintGreaterThanOrEqualToAnchor:v64 multiplier:1.0];
              v103 = v65;
              v66 = &v103;
            }
            else if (-[TUIKeyplaneRow rowType](self, "rowType") == 2 && ([v14 multiplier], v67 > 1.0))
            {
              if (v10)
              {
                [v14 multiplier];
                double v69 = v68;
                [v10 multiplier];
                double v71 = v70;
                v63 = [v14 widthAnchor];
                if (v69 == v71)
                {
                  v64 = [v10 widthAnchor];
                  v65 = [v63 constraintEqualToAnchor:v64 multiplier:1.0];
                  v102 = v65;
                  v66 = &v102;
                }
                else
                {
                  v64 = [v91 widthAnchor];
                  [v14 multiplier];
                  v65 = objc_msgSend(v63, "constraintEqualToAnchor:multiplier:", v64);
                  v100 = v65;
                  v66 = &v100;
                }
              }
              else
              {
                v63 = [v14 widthAnchor];
                v64 = [v91 widthAnchor];
                [v14 multiplier];
                v65 = objc_msgSend(v63, "constraintGreaterThanOrEqualToAnchor:multiplier:", v64);
                v101 = v65;
                v66 = &v101;
              }
            }
            else
            {
              v63 = [v14 widthAnchor];
              v64 = [v91 widthAnchor];
              [v14 multiplier];
              v65 = objc_msgSend(v63, "constraintEqualToAnchor:multiplier:", v64);
              v99 = v65;
              v66 = &v99;
            }
            goto LABEL_40;
          }
        }
        v54 = [v14 leftAnchor];
        v55 = [v10 rightAnchor];
        uint64_t v62 = [v54 constraintEqualToAnchor:v55 constant:0.0];
      }
      else
      {
        v54 = [v14 leftAnchor];
        v55 = [v93 leftAnchor];
        uint64_t v62 = [v54 constraintEqualToAnchor:v55];
      }
      v56 = (void *)v62;
      [v95 addObject:v62];
      goto LABEL_27;
    }
    objc_super v15 = [v14 key];
    long long v16 = [v15 name];
    [v92 setIdentifier:v16];

    [(TUIKeyplaneRow *)self addLayoutGuide:v92];
    long long v17 = [(TUIKeyplaneRow *)self layoutGuidesForRow];
    [v17 addObject:v92];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
    long long v19 = [WeakRetained factory];
    [v19 dynamicInsets];
    -[TUIKeyplaneRow middlePaddingConstantFromInsets:](self, "middlePaddingConstantFromInsets:");
    double v21 = v20;

    v22 = [v92 widthAnchor];
    v23 = [v22 constraintEqualToConstant:v21];

    v109[0] = v23;
    v24 = [v92 leftAnchor];
    v25 = [v10 rightAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v109[1] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
    [v95 addObjectsFromArray:v27];

    self = v94;
    [(TUIKeyplaneRow *)v94 setMiddlePaddingWidthConstraint:v23];
    id v28 = v14;

LABEL_41:
    v10 = v14;
    v12 = v96;
    unint64_t v11 = v97;
LABEL_42:

    ++v11;
  }
  while (v11 < [v9 count]);
  if (v10)
  {
    v81 = [v93 rightAnchor];
    v82 = [v10 rightAnchor];
    v83 = [v81 constraintEqualToAnchor:v82];
    [v95 addObject:v83];
  }
LABEL_48:

  return v95;
}

- (void)layoutRowWithKeys:(id)a3 guide:(id)a4 type:(int64_t)a5
{
  v319[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v298 = v8;
  [(TUIKeyplaneRow *)self setCurrentKeys:v8];
  v10 = [(TUIKeyplaneRow *)self keyViews];

  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(TUIKeyplaneRow *)self setKeyViews:v11];
  }
  v12 = [(TUIKeyplaneRow *)self layoutGuidesForRow];

  if (!v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(TUIKeyplaneRow *)self setLayoutGuidesForRow:v13];
  }
  v280 = v9;
  if ((unint64_t)[v8 count] > 1)
  {
    [(TUIKeyplaneRow *)self setKeySizingGuide:v9];
    [(TUIKeyplaneRow *)self setRowType:a5];
    v32 = [(TUIKeyplaneRow *)self hostView];
    uint64_t v33 = [v8 firstObject];
    v34 = [v32 keyViewForKey:v33];

    int v35 = [(TUIKeyplaneRow *)self hostView];
    v36 = [v298 lastObject];
    v277 = [v35 keyViewForKey:v36];

    if (!a5)
    {
      uint64_t v37 = [v34 layoutType];
      uint64_t v38 = [v277 layoutType];
      if (v37 == 3)
      {
        if (v38 == 3) {
          a5 = 5;
        }
        else {
          a5 = 3;
        }
      }
      else if (v38 == 3)
      {
        a5 = 4;
      }
      else if (([v34 layoutType] == 2 || !objc_msgSend(v34, "layoutType")) {
             && ([v277 layoutType] == 2 || !objc_msgSend(v277, "layoutType")))
      }
      {
        a5 = 6;
      }
      else
      {
        a5 = 0;
      }
    }
    int64_t v278 = a5;
    v279 = v34;
    id v39 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    v40 = objc_msgSend(NSString, "stringWithFormat:", @"Keyplane_Row_%li", -[TUIKeyplaneRow rowNumberInKeyplane](self, "rowNumberInKeyplane"));
    [v39 setIdentifier:v40];

    [(TUIKeyplaneRow *)self addLayoutGuide:v39];
    v41 = [(TUIKeyplaneRow *)self layoutGuidesForRow];
    [v41 addObject:v39];

    v42 = [(TUIKeyplaneRow *)self hostView];
    int v43 = [v42 supportsSplit];

    if (v43)
    {
      v44 = [MEMORY[0x1E4F1CA48] array];
      [(TUIKeyplaneRow *)self setConstraintsForUnsplitRow:v44];

      v45 = [MEMORY[0x1E4F1CA48] array];
      [(TUIKeyplaneRow *)self setConstraintsForSplitRow:v45];
    }
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v47 = [v39 topAnchor];
    v48 = [(TUIKeyplaneRow *)self topAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    v318[0] = v49;
    v50 = [(TUIKeyplaneRow *)self bottomAnchor];
    v51 = [v39 bottomAnchor];
    [v50 constraintEqualToAnchor:v51];
    int v53 = v52 = self;
    v318[1] = v53;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v318 count:2];
    [v46 addObjectsFromArray:v54];

    v55 = v279;
    v288 = v52;
    v290 = v39;
    v292 = v46;
    if ([v279 layoutType] == 3)
    {
      [v279 setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_msgSend(v279, "setRowNumber:", -[TUIKeyplaneRow rowNumberInKeyplane](v52, "rowNumberInKeyplane"));
      if ([v279 layoutShape] == 2)
      {
        v56 = [(TUIKeyplaneRow *)v52 superview];
        [v56 addSubview:v279];

        v57 = [(TUIKeyplaneRow *)v52 doubleHeightKeys];

        if (!v57)
        {
          v58 = [MEMORY[0x1E4F1CA48] array];
          [(TUIKeyplaneRow *)v52 setDoubleHeightKeys:v58];
        }
        v59 = [(TUIKeyplaneRow *)v52 doubleHeightKeys];
        [v59 addObject:v279];

        unint64_t v60 = v278;
        v61 = v46;
        unint64_t v62 = 0x1E4F1C000;
        if (v278 == 7) {
          goto LABEL_35;
        }
        v63 = [(TUIKeyplaneRow *)v52 bottomAnchor];
        v64 = [v279 bottomAnchor];
        v65 = [v63 constraintEqualToAnchor:v64 constant:0.0];
        v317[0] = v65;
        v66 = [v279 topAnchor];
        double v67 = [(TUIKeyplaneRow *)v52 topAnchor];
        double v68 = [v66 constraintEqualToAnchor:v67 constant:0.0];
        v317[1] = v68;
        double v69 = v317;
      }
      else
      {
        [(TUIKeyplaneRow *)v52 addSubview:v279];
        v63 = [(TUIKeyplaneRow *)v52 bottomAnchor];
        v64 = [v279 bottomAnchor];
        v65 = [v63 constraintEqualToAnchor:v64 constant:0.0];
        v316[0] = v65;
        v66 = [v279 topAnchor];
        double v67 = [(TUIKeyplaneRow *)v52 topAnchor];
        double v68 = [v66 constraintEqualToAnchor:v67 constant:0.0];
        v316[1] = v68;
        double v69 = v316;
      }
      unint64_t v62 = 0x1E4F1C000uLL;
      id v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
      v61 = v292;
      [v292 addObjectsFromArray:v95];

      unint64_t v60 = v278;
      v55 = v279;
LABEL_35:
      v96 = [(TUIKeyplaneRow *)v52 keyViews];
      [v96 addObject:v55];

      [v55 updateLabelWeight:1];
      unint64_t v97 = [v55 leftAnchor];
      v98 = [(TUIKeyplaneRow *)v52 leftAnchor];
      v99 = [v97 constraintEqualToAnchor:v98 constant:0.0];
      v315 = v99;
      v100 = [*(id *)(v62 + 2424) arrayWithObjects:&v315 count:1];
      [v61 addObjectsFromArray:v100];

      v101 = [v298 objectAtIndex:1];
      id v70 = v101;
      unint64_t v102 = v62;
      if (v101 && ([v101 layoutType] == 2 || objc_msgSend(v70, "layoutType") == 4))
      {
        v103 = [v290 leftAnchor];
        v104 = [v55 rightAnchor];
        v105 = [v103 constraintEqualToAnchor:v104 constant:0.0];
        v314 = v105;
        v106 = *(void **)(v62 + 2424);
        char v107 = 1;
        v108 = [v106 arrayWithObjects:&v314 count:1];
        [v61 addObjectsFromArray:v108];

        v55 = v279;
      }
      else
      {
        char v107 = 0;
      }
      [v55 multiplier];
      double v110 = v109;
      v111 = [v70 backingTree];
      v112 = [v111 name];
      if ([v112 isEqualToString:@"Dictation-Key"]) {
        BOOL v113 = [v70 layoutType] == 3;
      }
      else {
        BOOL v113 = 0;
      }

      if (v60 == 7 && !v113)
      {
        if ([v55 keyStyle] == 1) {
          double v110 = 1.0;
        }
        else {
          double v110 = 1.5;
        }
      }
      v115 = [v55 widthAnchor];
      v116 = [v280 widthAnchor];
      [v115 constraintEqualToAnchor:v116 multiplier:v110];
      v117 = v55;
      id v83 = (id)objc_claimAutoreleasedReturnValue();

      id v313 = v83;
      unint64_t v94 = 1;
      v118 = [*(id *)(v102 + 2424) arrayWithObjects:&v313 count:1];
      [v61 addObjectsFromArray:v118];

      id v119 = v117;
      goto LABEL_66;
    }
    id v70 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    double v71 = objc_msgSend(NSString, "stringWithFormat:", @"Keyplane_Row_%li_Left_Padding", -[TUIKeyplaneRow rowNumberInKeyplane](v52, "rowNumberInKeyplane"));
    [v70 setIdentifier:v71];

    [(TUIKeyplaneRow *)v52 addLayoutGuide:v70];
    v72 = [(TUIKeyplaneRow *)v52 layoutGuidesForRow];
    [v72 addObject:v70];

    v73 = [v70 leftAnchor];
    v74 = [(TUIKeyplaneRow *)v52 leftAnchor];
    v75 = [v73 constraintEqualToAnchor:v74];
    v312[0] = v75;
    v76 = [v39 leftAnchor];
    v77 = [v70 rightAnchor];
    v78 = [v76 constraintEqualToAnchor:v77 constant:0.0];
    v312[1] = v78;
    v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v312 count:2];
    [v292 addObjectsFromArray:v79];

    id v80 = v52;
    if ([(TUIKeyplaneRow *)v52 edgeToEdge])
    {
      v81 = [v70 widthAnchor];
      v82 = [v81 constraintEqualToConstant:0.0];
      [v292 addObject:v82];

      unint64_t v60 = v278;
      if (v278 == 6)
      {
        id v83 = objc_alloc_init(MEMORY[0x1E4FB1940]);
        [(TUIKeyplaneRow *)v52 addLayoutGuide:v83];
        v84 = [(TUIKeyplaneRow *)v52 layoutGuidesForRow];
        [v84 addObject:v83];

        v85 = [v83 leftAnchor];
        uint64_t v86 = [v290 rightAnchor];
        v294 = [v85 constraintEqualToAnchor:v86];
        v311[0] = v294;
        v87 = [(TUIKeyplaneRow *)v52 rightAnchor];
        v88 = [v83 rightAnchor];
        v89 = [v87 constraintEqualToAnchor:v88];
        v311[1] = v89;
        id v90 = [v83 widthAnchor];
        id v91 = [v90 constraintEqualToConstant:0.0];
        v311[2] = v91;
        id v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v311 count:3];
        [v292 addObjectsFromArray:v92];

        id v93 = (void *)v86;
        unint64_t v60 = 6;

        unint64_t v94 = 0;
LABEL_65:

        id v119 = 0;
        char v107 = 1;
LABEL_66:

        char v295 = v107;
        id v80 = v288;
        goto LABEL_67;
      }
    }
    else
    {
      unint64_t v60 = v278;
      if (v278 == 6)
      {
        id v83 = objc_alloc_init(MEMORY[0x1E4FB1940]);
        v120 = objc_msgSend(NSString, "stringWithFormat:", @"Keyplane_Row_%li_Right_Padding", -[TUIKeyplaneRow rowNumberInKeyplane](v52, "rowNumberInKeyplane"));
        [v83 setIdentifier:v120];

        [(TUIKeyplaneRow *)v52 addLayoutGuide:v83];
        v121 = [(TUIKeyplaneRow *)v52 layoutGuidesForRow];
        [v121 addObject:v83];

        if ([v279 layoutType])
        {
          uint64_t v122 = 0;
          double v123 = 0.0;
        }
        else
        {
          [v279 multiplier];
          double v123 = v127;
          v128 = [v279 key];
          v129 = [v128 name];
          [v70 setIdentifier:v129];

          uint64_t v122 = 1;
        }
        unint64_t v285 = v122;
        if ([v277 layoutType]) {
          goto LABEL_60;
        }
        v133 = [v277 key];
        v134 = [v133 name];
        [v83 setIdentifier:v134];

        [v279 multiplier];
        double v136 = v135;
        [v277 multiplier];
        if (v136 != v137) {
          goto LABEL_63;
        }
        [v277 multiplier];
        if (v138 != 0.0)
        {
LABEL_60:
          v130 = [v83 widthAnchor];
          v131 = [v70 widthAnchor];
          uint64_t v132 = [v130 constraintEqualToAnchor:v131];
        }
        else
        {
LABEL_63:
          v130 = [v83 widthAnchor];
          v131 = [v280 widthAnchor];
          [v277 multiplier];
          double v140 = v139;
          [v277 multiplier];
          uint64_t v132 = [v130 constraintEqualToAnchor:v131 multiplier:v140 constant:v141 * 0.0];
        }
        v142 = (void *)v132;
        [v292 addObject:v132];

        v85 = [v70 widthAnchor];
        uint64_t v282 = [v280 widthAnchor];
        v296 = [v85 constraintEqualToAnchor:v282 multiplier:v123 constant:v123 * 0.0];
        v310[0] = v296;
        v143 = [v83 leftAnchor];
        v144 = [v290 rightAnchor];
        v145 = [v143 constraintEqualToAnchor:v144];
        v310[1] = v145;
        v146 = [(TUIKeyplaneRow *)v288 rightAnchor];
        v147 = [v83 rightAnchor];
        v148 = [v146 constraintEqualToAnchor:v147];
        v310[2] = v148;
        v149 = [MEMORY[0x1E4F1C978] arrayWithObjects:v310 count:3];
        [v292 addObjectsFromArray:v149];

        id v93 = (void *)v282;
        unint64_t v60 = 6;
        unint64_t v94 = v285;
        goto LABEL_65;
      }
      if (v278 == 4)
      {
        if ([v279 layoutType])
        {
          unint64_t v94 = 0;
          double v114 = 0.0;
        }
        else
        {
          [v279 multiplier];
          double v114 = v124;
          v125 = [v279 key];
          v126 = [v125 name];
          [v70 setIdentifier:v126];

          unint64_t v94 = 1;
        }
        id v83 = [v70 widthAnchor];
        v85 = [v280 widthAnchor];
        id v93 = [v83 constraintEqualToAnchor:v85 multiplier:v114 constant:v114 * 0.0];
        [v292 addObject:v93];
        goto LABEL_65;
      }
    }
    unint64_t v94 = 0;
    id v119 = 0;
    char v295 = 1;
LABEL_67:

    unint64_t v286 = v94;
    if (v60 == 3)
    {
      id v150 = objc_alloc_init(MEMORY[0x1E4FB1940]);
      v151 = objc_msgSend(NSString, "stringWithFormat:", @"Keyplane_Row_%li_Right_Padding", -[TUIKeyplaneRow rowNumberInKeyplane](v80, "rowNumberInKeyplane"));
      [v150 setIdentifier:v151];

      [(TUIKeyplaneRow *)v80 addLayoutGuide:v150];
      v152 = [(TUIKeyplaneRow *)v80 layoutGuidesForRow];
      [v152 addObject:v150];

      v153 = [v150 leftAnchor];
      v154 = [v290 rightAnchor];
      [v153 constraintEqualToAnchor:v154];
      v156 = v155 = v80;
      v309[0] = v156;
      v157 = [(TUIKeyplaneRow *)v155 rightAnchor];
      v158 = [v150 rightAnchor];
      v159 = [v157 constraintEqualToAnchor:v158];
      v309[1] = v159;
      v160 = [MEMORY[0x1E4F1C978] arrayWithObjects:v309 count:2];
      [v292 addObjectsFromArray:v160];

      if ([v277 layoutType])
      {
        [(TUIKeyplaneRow *)v155 edgeToEdge];
        double v161 = 0.0;
      }
      else
      {
        [v277 multiplier];
        double v161 = v162;
        v163 = [v277 key];
        v164 = [v163 name];
        [v150 setIdentifier:v164];
      }
      id v80 = v155;
      v165 = [v150 widthAnchor];
      v166 = [v280 widthAnchor];
      v167 = [v165 constraintEqualToAnchor:v166 multiplier:v161 constant:v161 * 0.0];
      [v292 addObject:v167];

      unint64_t v60 = v278;
      unint64_t v94 = v286;
    }
    unint64_t v168 = (unint64_t)[v298 count] >> 1;
    unint64_t v272 = v168 - (v168 != [v298 count]);
    v169 = [MEMORY[0x1E4F1CA48] array];
    v283 = v169;
    if (v94 >= [v298 count])
    {
      v273 = 0;
      v274 = 0;
      v276 = 0;
LABEL_136:
      v29 = v279;
      v255 = v276;
      if ([v169 count])
      {
        v256 = [(TUIKeyplaneRow *)v80 hostView];
        int v257 = [v256 supportsSplit];

        if (v257)
        {
          uint64_t v258 = v272;
          if (v60 == 4)
          {
            [v277 multiplier];
            if (v259 > 1.5) {
              uint64_t v258 = v272 + 1;
            }
          }
        }
        else
        {
          uint64_t v258 = -1;
        }
        v260 = [(TUIKeyplaneRow *)v80 constraintsForStringKeys:v169 inRowGuide:v290 matchingSizingGuide:v280 splitIndex:v258];
        [v292 addObjectsFromArray:v260];
      }
      v31 = v277;
      if (v60 <= 7 && ((1 << v60) & 0xB6) != 0)
      {
        v261 = [(TUIKeyplaneRow *)v80 subviews];
        char v262 = [v261 containsObject:v277];

        if ((v262 & 1) == 0)
        {
          [v277 setTranslatesAutoresizingMaskIntoConstraints:0];
          if ([v277 layoutShape] == 2)
          {
            v263 = [(TUIKeyplaneRow *)v80 superview];
            [v263 addSubview:v277];

            v264 = [(TUIKeyplaneRow *)v80 doubleHeightKeys];

            if (!v264)
            {
              v265 = [MEMORY[0x1E4F1CA48] array];
              [(TUIKeyplaneRow *)v80 setDoubleHeightKeys:v265];
            }
            v266 = [(TUIKeyplaneRow *)v80 doubleHeightKeys];
            [v266 addObject:v277];
          }
          else
          {
            [(TUIKeyplaneRow *)v80 addSubview:v277];
          }
        }
        v267 = [(TUIKeyplaneRow *)v80 rightAnchor];
        v268 = [v277 rightAnchor];
        v269 = [v267 constraintEqualToAnchor:v268 constant:0.0];
        [v292 addObject:v269];

        v31 = v277;
        v169 = v283;
        v255 = v276;
      }
      [(TUIKeyplaneRow *)v80 setLetterKeyConstraints:v292];
      [MEMORY[0x1E4F28DC8] activateConstraints:v292];

      id v9 = v280;
      goto LABEL_154;
    }
    v274 = 0;
    v276 = 0;
    v273 = 0;
    unint64_t v170 = v94;
    while (1)
    {
      v171 = [v298 objectAtIndex:v170];
      if ([v171 layoutType] != 2
        && [v171 layoutType] != 4
        && [v171 layoutType] != 1)
      {
        break;
      }
      [v169 addObject:v171];
      if (v170 > v94 && !(([v119 layoutType] != 3) | v295 & 1))
      {
        v173 = [v290 leftAnchor];
        v174 = [v119 rightAnchor];
        v175 = [v173 constraintEqualToAnchor:v174 constant:0.0];
        v308 = v175;
        char v295 = 1;
        v176 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v308 count:1];
        [v292 addObjectsFromArray:v176];

        v169 = v283;
        unint64_t v94 = v286;

        id v172 = v119;
        id v119 = 0;
LABEL_81:

        id v80 = v288;
        goto LABEL_82;
      }
      id v172 = v119;
      id v119 = 0;
LABEL_82:

LABEL_83:
      if (++v170 >= [v298 count]) {
        goto LABEL_136;
      }
    }
    if (![v171 layoutType])
    {
      [v171 multiplier];
      if (v190 == 0.0 || !v170) {
        goto LABEL_83;
      }
      v191 = [v298 lastObject];
      char v192 = [v171 isEqual:v191];

      if (v192) {
        goto LABEL_134;
      }
      uint64_t v193 = [v169 count];
      if (!v119)
      {
        if (!v193)
        {
          id v119 = 0;
LABEL_134:
          unint64_t v94 = v286;
          goto LABEL_83;
        }
        id v229 = objc_alloc_init(MEMORY[0x1E4FB1940]);

        v230 = [v171 backingTree];
        v231 = [v230 name];
        [v229 setIdentifier:v231];

        [(TUIKeyplaneRow *)v80 addLayoutGuide:v229];
        v232 = [(TUIKeyplaneRow *)v80 layoutGuidesForRow];
        [v232 addObject:v229];

        if (v274
          && v273
          && ([v171 multiplier], double v234 = v233, objc_msgSend(v274, "multiplier"), v234 == v235))
        {
          v236 = [v229 widthAnchor];
          v237 = [v273 widthAnchor];
          v238 = [v236 constraintEqualToAnchor:v237];
          v239 = v292;
          [v292 addObject:v238];
        }
        else
        {
          v247 = [v229 widthAnchor];
          v248 = [v280 widthAnchor];
          [v171 multiplier];
          double v250 = v249;
          [v171 multiplier];
          v236 = [v247 constraintEqualToAnchor:v248 multiplier:v250 constant:v251 * 0.0];

          LODWORD(v252) = 1144750080;
          [v236 setPriority:v252];
          v306 = v236;
          v237 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v306 count:1];
          v239 = v292;
          [v292 addObjectsFromArray:v237];
        }

        id v172 = [v229 leftAnchor];
        v173 = [v290 rightAnchor];
        v253 = [v172 constraintEqualToAnchor:v173];
        v305 = v253;
        v254 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v305 count:1];
        [v239 addObjectsFromArray:v254];

        id v119 = 0;
        v276 = v229;
        v169 = v283;
        unint64_t v94 = v286;
        goto LABEL_81;
      }
      if (v193) {
        goto LABEL_134;
      }
      id v194 = v171;

      id v195 = objc_alloc_init(MEMORY[0x1E4FB1940]);
      v196 = [v194 backingTree];
      v197 = [v196 name];
      [v195 setIdentifier:v197];

      [(TUIKeyplaneRow *)v80 addLayoutGuide:v195];
      v198 = [(TUIKeyplaneRow *)v80 layoutGuidesForRow];
      [v198 addObject:v195];

      v199 = v195;
      v200 = [v195 widthAnchor];
      v201 = [v280 widthAnchor];
      id v271 = v194;
      [v194 multiplier];
      double v203 = v202;
      [v194 multiplier];
      id v172 = [v200 constraintEqualToAnchor:v201 multiplier:v203 constant:v204 * 0.0];

      LODWORD(v205) = 1148813312;
      [v172 setPriority:v205];
      v206 = v199;
      v173 = [v199 leftAnchor];
      v297 = [v119 rightAnchor];
      v275 = [v173 constraintEqualToAnchor:v297];
      v307[0] = v275;
      v307[1] = v172;
      v207 = [v290 leftAnchor];
      v208 = [v206 rightAnchor];
      v209 = [v207 constraintEqualToAnchor:v208];
      v307[2] = v209;
      v210 = [MEMORY[0x1E4F1C978] arrayWithObjects:v307 count:3];
      [v292 addObjectsFromArray:v210];

      v169 = v283;
      unint64_t v60 = v278;

      char v295 = 1;
      v273 = v206;
      v274 = v271;
      goto LABEL_130;
    }
    v177 = [(TUIKeyplaneRow *)v80 hostView];
    id v172 = [v177 keyViewForKey:v171];

    if (!v172) {
      goto LABEL_82;
    }
    objc_msgSend(v172, "setRowNumber:", -[TUIKeyplaneRow rowNumberInKeyplane](v80, "rowNumberInKeyplane"));
    v178 = [(TUIKeyplaneRow *)v80 keyViews];
    [v178 addObject:v172];

    [v172 setTranslatesAutoresizingMaskIntoConstraints:0];
    if ([v172 layoutShape] == 2)
    {
      v179 = [(TUIKeyplaneRow *)v80 superview];
      [v179 addSubview:v172];

      v180 = [(TUIKeyplaneRow *)v80 doubleHeightKeys];

      if (!v180)
      {
        v181 = [MEMORY[0x1E4F1CA48] array];
        [(TUIKeyplaneRow *)v80 setDoubleHeightKeys:v181];
      }
      v182 = [(TUIKeyplaneRow *)v80 doubleHeightKeys];
      [v182 addObject:v172];

      if (v60 == 7)
      {
LABEL_100:
        objc_msgSend(v172, "setLayoutShape:", objc_msgSend(v171, "layoutShape"));
        if ([v172 layoutType] != 3)
        {
          id v172 = v172;
          v173 = v119;
          id v119 = v172;
          goto LABEL_81;
        }
        if (v60 == 7 && [v172 layoutShape] != 2) {
          [v172 setLayoutShape:0];
        }
        [v172 multiplier];
        double v214 = v213;
        v215 = [v172 widthAnchor];
        v216 = [v280 widthAnchor];
        v173 = [v215 constraintEqualToAnchor:v216 multiplier:v214];

        [v292 addObject:v173];
        if (v119)
        {
          if ([v119 layoutType] != 4)
          {
            if ([v119 layoutType] == 3)
            {
              v222 = [v172 leftAnchor];
              v223 = [v119 rightAnchor];
              v224 = [v222 constraintEqualToAnchor:v223 constant:0.0];
              v301 = v224;
              v225 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v301 count:1];
              [v292 addObjectsFromArray:v225];

              unint64_t v60 = v278;
              v169 = v283;

              if (v278 == 2)
              {
                if ([v283 count])
                {
                  LODWORD(v221) = 1148829696;
                  [v173 setPriority:v221];
                  v226 = [v172 widthAnchor];
                  v227 = [v119 widthAnchor];
                  v228 = [v226 constraintEqualToAnchor:v227 multiplier:1.0];
                  [v292 addObject:v228];
                }
                goto LABEL_123;
              }
LABEL_126:
              if (v170 < v272) {
                uint64_t v246 = 1;
              }
              else {
                uint64_t v246 = 2;
              }
              [v172 updateLabelWeight:v246];
              id v172 = v172;

              id v119 = v172;
LABEL_130:
              unint64_t v94 = v286;
              goto LABEL_81;
            }
LABEL_122:
            if (v60 == 2)
            {
LABEL_123:
              LODWORD(v221) = 1148829696;
              [v173 setPriority:v221];
              [v172 multiplier];
              double v242 = v241;
              v243 = [v172 widthAnchor];
              v244 = [v280 widthAnchor];
              if (v242 <= 1.0) {
                [v172 multiplier];
              }
              v245 = objc_msgSend(v243, "constraintGreaterThanOrEqualToAnchor:multiplier:", v244);
              [v292 addObject:v245];

              v169 = v283;
              goto LABEL_126;
            }
            goto LABEL_126;
          }
          v217 = [v172 leftAnchor];
          v218 = [v290 rightAnchor];
          v219 = [v217 constraintEqualToAnchor:v218 constant:0.0];
          v302 = v219;
          v220 = &v302;
        }
        else if (v276)
        {
          v217 = [v172 leftAnchor];
          v218 = [v276 rightAnchor];
          v219 = [v217 constraintEqualToAnchor:v218];
          v300 = v219;
          v220 = &v300;
        }
        else
        {
          if (![v169 count]) {
            goto LABEL_122;
          }
          v217 = [v172 leftAnchor];
          v218 = [v290 rightAnchor];
          v219 = [v217 constraintEqualToAnchor:v218 constant:0.0];
          v299 = v219;
          v220 = &v299;
        }
        v240 = [MEMORY[0x1E4F1C978] arrayWithObjects:v220 count:1];
        [v292 addObjectsFromArray:v240];

        unint64_t v60 = v278;
        v169 = v283;
        goto LABEL_122;
      }
      v183 = [v172 topAnchor];
      v184 = [v290 topAnchor];
      v270 = v183;
      v185 = [v183 constraintEqualToAnchor:v184];
      v304[0] = v185;
      v186 = [v172 bottomAnchor];
      v187 = [v290 bottomAnchor];
      v188 = [v186 constraintEqualToAnchor:v187];
      v304[1] = v188;
      v189 = v304;
    }
    else
    {
      [(TUIKeyplaneRow *)v80 addSubview:v172];
      v211 = [v172 topAnchor];
      v184 = [v290 topAnchor];
      v270 = v211;
      v185 = [v211 constraintEqualToAnchor:v184];
      v303[0] = v185;
      v186 = [v172 bottomAnchor];
      v187 = [v290 bottomAnchor];
      v188 = [v186 constraintEqualToAnchor:v187];
      v303[1] = v188;
      v189 = v303;
    }
    v212 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:2];
    [v292 addObjectsFromArray:v212];

    unint64_t v60 = v278;
    v169 = v283;
    unint64_t v94 = v286;
    goto LABEL_100;
  }
  v14 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v15 = [(TUIKeyplaneRow *)self letterKeyConstraints];
  [v14 deactivateConstraints:v15];

  long long v16 = [(TUIKeyplaneRow *)self hostView];
  long long v17 = [v298 firstObject];
  long long v18 = [v16 keyViewForKey:v17];

  [(TUIKeyplaneRow *)self addSubview:v18];
  objc_msgSend(v18, "setRowNumber:", -[TUIKeyplaneRow rowNumberInKeyplane](self, "rowNumberInKeyplane"));
  long long v19 = [(TUIKeyplaneRow *)self keyViews];
  [v19 addObject:v18];

  if (v18)
  {
    v293 = [v18 leadingAnchor];
    v291 = [(TUIKeyplaneRow *)self leadingAnchor];
    v289 = [v293 constraintEqualToAnchor:v291];
    v319[0] = v289;
    v287 = [v18 topAnchor];
    v284 = [(TUIKeyplaneRow *)self topAnchor];
    v281 = [v287 constraintEqualToAnchor:v284];
    v319[1] = v281;
    double v20 = [(TUIKeyplaneRow *)self trailingAnchor];
    double v21 = [v18 trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v319[2] = v22;
    v23 = [(TUIKeyplaneRow *)self bottomAnchor];
    v24 = [v18 bottomAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v319[3] = v25;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v319 count:4];
    v27 = v26 = self;
    id v28 = (void *)[v27 mutableCopy];
    [(TUIKeyplaneRow *)v26 setLetterKeyConstraints:v28];

    v29 = v18;
    id v9 = v280;

    v30 = (void *)MEMORY[0x1E4F28DC8];
    v31 = [(TUIKeyplaneRow *)v26 letterKeyConstraints];
    [v30 activateConstraints:v31];
LABEL_154:

    goto LABEL_155;
  }
  v29 = 0;
LABEL_155:
}

- (id)doubleHeightKeysForRow
{
  id v3 = [(TUIKeyplaneRow *)self doubleHeightKeys];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(TUIKeyplaneRow *)self doubleHeightKeys];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)rowHasDoubleHeightKeys
{
  v2 = [(TUIKeyplaneRow *)self doubleHeightKeys];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)splitLayoutGuide
{
  BOOL v3 = [(TUIKeyplaneRow *)self splitSpacingGuide];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    [(TUIKeyplaneRow *)self setSplitSpacingGuide:v4];

    uint64_t v5 = [(TUIKeyplaneRow *)self splitSpacingGuide];
    [(TUIKeyplaneRow *)self addLayoutGuide:v5];
  }
  return [(TUIKeyplaneRow *)self splitSpacingGuide];
}

- (void)resetRow
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28DC8];
  id v4 = [(TUIKeyplaneRow *)self letterKeyConstraints];
  [v3 deactivateConstraints:v4];

  [(TUIKeyplaneRow *)self setLetterKeyConstraints:0];
  uint64_t v5 = [(TUIKeyplaneRow *)self constraintsForSplitRow];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v7 = [(TUIKeyplaneRow *)self constraintsForSplitRow];
    [v6 deactivateConstraints:v7];

    id v8 = (void *)MEMORY[0x1E4F28DC8];
    id v9 = [(TUIKeyplaneRow *)self constraintsForUnsplitRow];
    [v8 deactivateConstraints:v9];

    [(TUIKeyplaneRow *)self setConstraintsForSplitRow:0];
    [(TUIKeyplaneRow *)self setConstraintsForUnsplitRow:0];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v10 = [(TUIKeyplaneRow *)self keyViews];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v14++) removeFromSuperview];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  objc_super v15 = [(TUIKeyplaneRow *)self layoutGuidesForRow];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        [(TUIKeyplaneRow *)self removeLayoutGuide:*(void *)(*((void *)&v22 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  double v20 = [(TUIKeyplaneRow *)self layoutGuidesForRow];
  [v20 removeAllObjects];

  double v21 = [(TUIKeyplaneRow *)self keyViews];
  [v21 removeAllObjects];
}

- (void)updateKeysInRowWithData:(id)a3
{
  id v4 = a3;
  [(TUIKeyplaneRow *)self resetRow];
  id v5 = [(TUIKeyplaneRow *)self keySizingGuide];
  [(TUIKeyplaneRow *)self layoutRowWithKeys:v4 guide:v5 type:[(TUIKeyplaneRow *)self rowType]];
}

- (void)updateKeysInRowWithStyle:(int64_t)a3 factory:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [(TUIKeyplaneRow *)self keyViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        if (v6) {
          [*(id *)(*((void *)&v17 + 1) + 8 * v11) setFactory:v6];
        }
        [v12 updateStyle:a3];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(TUIKeyplaneRow *)self middlePaddingWidthConstraint];

  if (v13)
  {
    [v6 dynamicInsets];
    -[TUIKeyplaneRow middlePaddingConstantFromInsets:](self, "middlePaddingConstantFromInsets:");
    double v15 = v14;
    uint64_t v16 = [(TUIKeyplaneRow *)self middlePaddingWidthConstraint];
    [v16 setConstant:v15];
  }
}

- (void)updateKeysForTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(TUIKeyplaneRow *)self keyViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (v3) {
          [v9 prepareForTransition];
        }
        else {
          [v9 finishTransition];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)toggleConstraintsForSplit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(TUIKeyplaneRow *)self extraSpaceBar];
  uint64_t v6 = v5;
  if (v3)
  {
    [v5 setHidden:0];

    uint64_t v7 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v8 = [(TUIKeyplaneRow *)self constraintsForUnsplitRow];
    [v7 deactivateConstraints:v8];

    uint64_t v9 = (void *)MEMORY[0x1E4F28DC8];
    [(TUIKeyplaneRow *)self constraintsForSplitRow];
  }
  else
  {
    [v5 setHidden:1];

    long long v10 = (void *)MEMORY[0x1E4F28DC8];
    long long v11 = [(TUIKeyplaneRow *)self constraintsForSplitRow];
    [v10 deactivateConstraints:v11];

    uint64_t v9 = (void *)MEMORY[0x1E4F28DC8];
    [(TUIKeyplaneRow *)self constraintsForUnsplitRow];
  long long v12 = };
  [v9 activateConstraints:v12];

  [(TUIKeyplaneRow *)self setNeedsLayout];
}

- (void)setRenderConfig:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(TUIKeyplaneRow *)self keyViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setRenderConfig:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeFromSuperview
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(TUIKeyplaneRow *)self keyViews];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)TUIKeyplaneRow;
  [(TUIKeyplaneRow *)&v8 removeFromSuperview];
}

- (TUIKeyplaneRow)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUIKeyplaneRow;
  v2 = [(TUIKeyplaneRow *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    [(TUIKeyplaneRow *)v2 setUserInteractionEnabled:0];
  }
  return v3;
}

+ (id)emptyRowForKeyplane:(id)a3 rowNumber:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(TUIKeyplaneRow);
  [(TUIKeyplaneRow *)v6 setHostView:v5];

  [(TUIKeyplaneRow *)v6 setRowNumberInKeyplane:a4];
  return v6;
}

+ (id)rowForKeyplane:(id)a3 keys:(id)a4 letterKeyGuide:(id)a5
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(TUIKeyplaneRow);
  [(TUIKeyplaneRow *)v6 setHostView:v5];

  return v6;
}

@end