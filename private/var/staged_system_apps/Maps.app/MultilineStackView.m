@interface MultilineStackView
- (BOOL)_justifiedLayoutWouldCrushWhenAddingView:(id)a3 toRowViews:(id)a4 availableRowWidth:(double)a5;
- (CGSize)intrinsicContentSize;
- (MultilineStackView)initWithHorizontalArrangement:(unint64_t)a3 verticalArrangement:(unint64_t)a4;
- (NSArray)arrangedSubviews;
- (UIEdgeInsets)edgeInsets;
- (double)calculatedHeight;
- (double)interItemHorizontalPadding;
- (double)interItemVerticalPadding;
- (id)_appendRowViewWithViews:(id)a3 topAnchor:(id)a4 topInset:(double)a5 rowContentWidth:(double)a6 availableRowWidth:(double)a7 rowHeight:(double)a8 constraints:(id)a9;
- (id)customizationBlock;
- (id)rowHeightBlock;
- (unint64_t)horizontalArrangement;
- (unint64_t)verticalArrangement;
- (void)_computeJustifiedRowWithViews:(id)a3 itemWidth:(double)a4 rowView:(id)a5 constraints:(id)a6;
- (void)_computeLayout;
- (void)_computeLayoutIfNeeded;
- (void)_computeLeadingRowWithViews:(id)a3 rowView:(id)a4 constraints:(id)a5;
- (void)_computeMaximumRowWithViews:(id)a3 interItemSpace:(double)a4 rowView:(id)a5 constraints:(id)a6;
- (void)_computeTrailingRowWithViews:(id)a3 rowView:(id)a4 constraints:(id)a5;
- (void)_prepareSubviewsForReuse:(id)a3;
- (void)addArrangedSubview:(id)a3;
- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4;
- (void)removeArrangedSubview:(id)a3;
- (void)setArrangedSubviews:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCalculatedHeight:(double)a3;
- (void)setCustomizationBlock:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInterItemHorizontalPadding:(double)a3;
- (void)setInterItemVerticalPadding:(double)a3;
- (void)setRowHeightBlock:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MultilineStackView

- (MultilineStackView)initWithHorizontalArrangement:(unint64_t)a3 verticalArrangement:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MultilineStackView;
  v6 = -[MultilineStackView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_horizontalArrangement = a3;
    v6->_verticalArrangement = a4;
    uint64_t v8 = objc_opt_new();
    arrangedSubviews = v7->_arrangedSubviews;
    v7->_arrangedSubviews = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)setInterItemHorizontalPadding:(double)a3
{
  if (vabdd_f64(self->_interItemHorizontalPadding, a3) >= 2.22044605e-16)
  {
    self->_interItemHorizontalPadding = a3;
    [(MultilineStackView *)self invalidateLayout];
  }
}

- (void)setInterItemVerticalPadding:(double)a3
{
  if (vabdd_f64(self->_interItemVerticalPadding, a3) >= 2.22044605e-16)
  {
    self->_interItemVerticalPadding = a3;
    [(MultilineStackView *)self invalidateLayout];
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    [(MultilineStackView *)self invalidateLayout];
  }
}

- (void)setCalculatedHeight:(double)a3
{
  if (vabdd_f64(self->_calculatedHeight, a3) > 2.22044605e-16)
  {
    self->_calculatedHeight = a3;
    [(MultilineStackView *)self invalidateIntrinsicContentSize];
  }
}

- (NSArray)arrangedSubviews
{
  return (NSArray *)self->_arrangedSubviews;
}

- (void)setArrangedSubviews:(id)a3
{
  id v4 = a3;
  v5 = (NSMutableArray *)[v4 mutableCopy];
  arrangedSubviews = self->_arrangedSubviews;
  self->_arrangedSubviews = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      objc_super v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) setTranslatesAutoresizingMaskIntoConstraints:0, (void)v12];
        objc_super v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [(MultilineStackView *)self _computeLayout];
}

- (void)addArrangedSubview:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_arrangedSubviews, "containsObject:") & 1) == 0)
  {
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NSMutableArray *)self->_arrangedSubviews addObject:v4];
    [(MultilineStackView *)self _computeLayout];
  }
}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NSMutableArray *)self->_arrangedSubviews removeObject:v6];
  [(NSMutableArray *)self->_arrangedSubviews insertObject:v6 atIndex:a4];

  [(MultilineStackView *)self _computeLayout];
}

- (void)removeArrangedSubview:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_arrangedSubviews, "containsObject:"))
  {
    [(NSMutableArray *)self->_arrangedSubviews removeObject:v4];
    [(MultilineStackView *)self _computeLayout];
  }
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MultilineStackView;
  -[MultilineStackView setBounds:](&v4, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MultilineStackView *)self _computeLayoutIfNeeded];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MultilineStackView;
  -[MultilineStackView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MultilineStackView *)self _computeLayoutIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MultilineStackView;
  [(MultilineStackView *)&v4 traitCollectionDidChange:a3];
  [(MultilineStackView *)self _computeLayout];
}

- (CGSize)intrinsicContentSize
{
  [(MultilineStackView *)self frame];
  double Width = CGRectGetWidth(v6);
  double calculatedHeight = self->_calculatedHeight;
  result.height = calculatedHeight;
  result.width = Width;
  return result;
}

- (void)_computeLayoutIfNeeded
{
  computeddouble Width = self->_computedWidth;
  if (!computedWidth
    || ([(NSNumber *)computedWidth cgFloatValue],
        double v5 = v4,
        [(MultilineStackView *)self frame],
        vabdd_f64(v5, v6) > 2.22044605e-16))
  {
    [(MultilineStackView *)self _computeLayout];
  }
}

- (BOOL)_justifiedLayoutWouldCrushWhenAddingView:(id)a3 toRowViews:(id)a4 availableRowWidth:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (double)(unint64_t)[v9 count];
  [(MultilineStackView *)self interItemHorizontalPadding];
  long long v22 = 0u;
  long long v23 = 0u;
  double v12 = (a5 - v10 * v11) / (double)((unint64_t)[v9 count] + 1);
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) _maps_intrinsicContentSize:v22];
        if (v18 > v12)
        {

          BOOL v20 = 1;
          goto LABEL_11;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  [v8 _maps_intrinsicContentSize];
  BOOL v20 = v19 > v12;
LABEL_11:

  return v20;
}

- (void)_prepareSubviewsForReuse:(id)a3
{
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v8 removeFromSuperview];
        id v9 = [v8 constraints];
        id v10 = [v9 count];

        if (v10)
        {
          unint64_t v11 = 0;
          do
          {
            double v12 = [v8 constraints];
            id v13 = [v12 objectAtIndexedSubscript:v11];

            id v14 = [v13 identifier];
            unsigned int v15 = [v14 isEqualToString:@"MapsWidthConstraint"];

            if (v15) {
              [v8 removeConstraint:v13];
            }
            else {
              ++v11;
            }

            uint64_t v16 = [v8 constraints];
            id v17 = [v16 count];
          }
          while (v11 < (unint64_t)v17);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

- (void)_computeLayout
{
  id v3 = [(MultilineStackView *)self subviews];
  [(MultilineStackView *)self _prepareSubviewsForReuse:v3];

  [(MultilineStackView *)self _prepareSubviewsForReuse:self->_arrangedSubviews];
  [(MultilineStackView *)self frame];
  double v5 = v4;
  [(MultilineStackView *)self edgeInsets];
  double v7 = v5 - v6;
  [(MultilineStackView *)self edgeInsets];
  double v9 = v7 - v8;
  if (v7 - v8 <= 2.22044605e-16)
  {
    v40 = +[NSNumber numberWithDouble:v5];
    computeddouble Width = self->_computedWidth;
    self->_computeddouble Width = v40;

    [(MultilineStackView *)self setCalculatedHeight:0.0];
  }
  else
  {
    double v60 = v5;
    [(MultilineStackView *)self edgeInsets];
    double v11 = v10;
    [(MultilineStackView *)self edgeInsets];
    double v66 = v11 + v12;
    id v13 = objc_opt_new();
    uint64_t v61 = objc_opt_new();
    v62 = +[NSMapTable strongToStrongObjectsMapTable];
    id v14 = [(MultilineStackView *)self topAnchor];
    [(MultilineStackView *)self edgeInsets];
    double v16 = v15;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obj = self->_arrangedSubviews;
    id v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v74 objects:v79 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v64 = 0;
      uint64_t v19 = *(void *)v75;
      double v20 = 0.0;
      double v21 = 0.0;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v75 != v19) {
            objc_enumerationMutation(obj);
          }
          long long v23 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472;
          v73[2] = sub_100360C00;
          v73[3] = &unk_1012E5D08;
          v73[4] = v23;
          +[UIView performWithoutAnimation:v73];
          [v23 _maps_intrinsicContentSize];
          double v26 = v25;
          double v27 = v24;
          if (v20 < v24) {
            double v20 = v24;
          }
          if ([v13 count])
          {
            [(MultilineStackView *)self interItemHorizontalPadding];
            double v29 = v28;
          }
          else
          {
            double v29 = 0.0;
          }
          if ((id)[(MultilineStackView *)self horizontalArrangement] == (id)3) {
            unsigned int v30 = [(MultilineStackView *)self _justifiedLayoutWouldCrushWhenAddingView:v23 toRowViews:v13 availableRowWidth:v9];
          }
          else {
            unsigned int v30 = 0;
          }
          double v31 = v21 + v26 + v29;
          id v32 = [v13 count];
          if (v31 >= v9) {
            int v33 = 1;
          }
          else {
            int v33 = v30;
          }
          if (v32 && v33)
          {
            v34 = [(MultilineStackView *)self rowHeightBlock];

            if (v34)
            {
              v35 = [(MultilineStackView *)self rowHeightBlock];
              double v20 = ((double (**)(void, void *, double))v35)[2](v35, v13, v20);
            }
            double v66 = v66 + v20;
            v36 = [(MultilineStackView *)self _appendRowViewWithViews:v13 topAnchor:v14 topInset:v61 rowContentWidth:v16 availableRowWidth:v21 rowHeight:v9 constraints:v20];
            ++v64;
            v37 = v14;
            id v38 = [v13 copy];
            [v62 setObject:v38 forKey:v36];

            [v13 removeAllObjects];
            id v14 = [v36 bottomAnchor];

            [(MultilineStackView *)self interItemVerticalPadding];
            double v16 = v39;
            [v13 addObject:v23];

            double v20 = v27;
            double v21 = v26;
          }
          else
          {
            [v13 addObject:v23];
            double v21 = v31;
          }
        }
        id v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v74 objects:v79 count:16];
      }
      while (v18);
    }
    else
    {
      uint64_t v64 = 0;
      double v20 = 0.0;
      double v21 = 0.0;
    }

    if ([v13 count])
    {
      v42 = [(MultilineStackView *)self rowHeightBlock];

      v43 = (void *)v61;
      if (v42)
      {
        v44 = [(MultilineStackView *)self rowHeightBlock];
        double v20 = ((double (**)(void, void *, double))v44)[2](v44, v13, v20);
      }
      double v66 = v66 + v20;
      v45 = [(MultilineStackView *)self _appendRowViewWithViews:v13 topAnchor:v14 topInset:v61 rowContentWidth:v16 availableRowWidth:v21 rowHeight:v9 constraints:v20];
      id v46 = [v13 copy];
      [v62 setObject:v46 forKey:v45];

      uint64_t v47 = v64 + 1;
    }
    else
    {
      uint64_t v47 = v64;
      v43 = (void *)v61;
    }
    +[NSLayoutConstraint activateConstraints:v43];
    v48 = +[NSNumber numberWithDouble:v60];
    v49 = self->_computedWidth;
    self->_computeddouble Width = v48;

    v50 = [(MultilineStackView *)self customizationBlock];

    if (v50)
    {
      uint64_t v65 = v47;
      long long v72 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v69 = 0u;
      id v51 = v62;
      id v52 = [v51 countByEnumeratingWithState:&v69 objects:v78 count:16];
      if (v52)
      {
        id v53 = v52;
        uint64_t v54 = *(void *)v70;
        do
        {
          for (j = 0; j != v53; j = (char *)j + 1)
          {
            if (*(void *)v70 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = [v51 objectForKey:*(void *)(*((void *)&v69 + 1) + 8 * (void)j)];
            id v57 = [v56 count];
            v68[0] = _NSConcreteStackBlock;
            v68[1] = 3221225472;
            v68[2] = sub_100360C08;
            v68[3] = &unk_1012E5DA0;
            v68[4] = self;
            v68[5] = v57;
            [v56 enumerateObjectsUsingBlock:v68];
          }
          id v53 = [v51 countByEnumeratingWithState:&v69 objects:v78 count:16];
        }
        while (v53);
      }

      v43 = (void *)v61;
      uint64_t v47 = v65;
    }
    if (v47)
    {
      [(MultilineStackView *)self interItemVerticalPadding];
      double v59 = v66 + (double)(unint64_t)(v47 - 1) * v58;
    }
    else
    {
      double v59 = v66;
    }
    [(MultilineStackView *)self setCalculatedHeight:v59];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_100360C88;
    v67[3] = &unk_1012E5D08;
    v67[4] = self;
    +[UIView performWithoutAnimation:v67];
  }
}

- (id)_appendRowViewWithViews:(id)a3 topAnchor:(id)a4 topInset:(double)a5 rowContentWidth:(double)a6 availableRowWidth:(double)a7 rowHeight:(double)a8 constraints:(id)a9
{
  id v16 = a3;
  id v17 = a9;
  id v18 = a4;
  uint64_t v19 = objc_opt_new();
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MultilineStackView *)self addSubview:v19];
  switch([(MultilineStackView *)self horizontalArrangement])
  {
    case 0uLL:
      [(MultilineStackView *)self _computeLeadingRowWithViews:v16 rowView:v19 constraints:v17];
      break;
    case 1uLL:
      [(MultilineStackView *)self _computeTrailingRowWithViews:v16 rowView:v19 constraints:v17];
      break;
    case 2uLL:
      -[MultilineStackView _computeMaximumRowWithViews:interItemSpace:rowView:constraints:](self, "_computeMaximumRowWithViews:interItemSpace:rowView:constraints:", v16, v19, v17, (a7 - a6) / (double)((unint64_t)[v16 count] - 1));
      break;
    case 3uLL:
      double v20 = (double)((unint64_t)[v16 count] - 1);
      [(MultilineStackView *)self interItemHorizontalPadding];
      -[MultilineStackView _computeJustifiedRowWithViews:itemWidth:rowView:constraints:](self, "_computeJustifiedRowWithViews:itemWidth:rowView:constraints:", v16, v19, v17, (a7 - v20 * v21) / (double)(unint64_t)[v16 count]);
      break;
    default:
      break;
  }
  long long v22 = [v19 leadingAnchor];
  long long v23 = [(MultilineStackView *)self leadingAnchor];
  [(MultilineStackView *)self edgeInsets];
  double v25 = [v22 constraintEqualToAnchor:v23 constant:v24];
  [v17 addObject:v25];

  double v26 = [v19 trailingAnchor];
  double v27 = [(MultilineStackView *)self trailingAnchor];
  [(MultilineStackView *)self edgeInsets];
  double v29 = [v26 constraintEqualToAnchor:v27 constant:v28];
  [v17 addObject:v29];

  unsigned int v30 = [v19 topAnchor];
  double v31 = [v30 constraintEqualToAnchor:v18 constant:a5];

  [v17 addObject:v31];
  id v32 = [v19 heightAnchor];
  int v33 = [v32 constraintEqualToConstant:a8];
  [v17 addObject:v33];

  return v19;
}

- (void)_computeLeadingRowWithViews:(id)a3 rowView:(id)a4 constraints:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v8 leadingAnchor];
  if ([v24 count])
  {
    double v11 = 0;
    double v12 = 0.0;
    do
    {
      id v13 = [v24 objectAtIndexedSubscript:v11];
      [v8 addSubview:v13];
      id v14 = [v13 leadingAnchor];
      double v15 = [v14 constraintEqualToAnchor:v10 constant:v12];
      [v9 addObject:v15];

      if ([(MultilineStackView *)self verticalArrangement])
      {
        id v16 = [v13 centerYAnchor];
        [v8 centerYAnchor];
      }
      else
      {
        id v16 = [v13 topAnchor];
        [v8 topAnchor];
      id v17 = };
      id v18 = [v16 constraintEqualToAnchor:v17];
      [v9 addObject:v18];

      if (v11 == (char *)[v24 count] - 1)
      {
        uint64_t v19 = [v13 trailingAnchor];
        double v20 = [v8 trailingAnchor];
        double v21 = [v19 constraintLessThanOrEqualToAnchor:v20];
        [v9 addObject:v21];
      }
      long long v22 = [v13 trailingAnchor];

      [(MultilineStackView *)self interItemHorizontalPadding];
      double v12 = v23;

      ++v11;
      double v10 = v22;
    }
    while (v11 < [v24 count]);
  }
  else
  {
    long long v22 = v10;
  }
}

- (void)_computeTrailingRowWithViews:(id)a3 rowView:(id)a4 constraints:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_100103ACC;
  v24[4] = sub_1001045F0;
  id v25 = [v9 trailingAnchor];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  double v11 = [v8 reverseObjectEnumerator];
  double v12 = [v11 allObjects];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100361340;
  v16[3] = &unk_1012E5DC8;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  double v21 = v24;
  long long v22 = v23;
  id v18 = v14;
  uint64_t v19 = self;
  id v15 = v8;
  id v20 = v15;
  [v12 enumerateObjectsUsingBlock:v16];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
}

- (void)_computeMaximumRowWithViews:(id)a3 interItemSpace:(double)a4 rowView:(id)a5 constraints:(id)a6
{
  id v39 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v39 count];
  id v13 = v39;
  if (v12)
  {
    id v14 = [v39 firstObject];
    [v10 addSubview:v14];
    id v15 = [v14 leadingAnchor];
    id v16 = [v10 leadingAnchor];
    id v17 = [v15 constraintEqualToAnchor:v16];
    [v11 addObject:v17];

    if ([(MultilineStackView *)self verticalArrangement])
    {
      id v18 = [v14 centerYAnchor];
      [v10 centerYAnchor];
    }
    else
    {
      id v18 = [v14 topAnchor];
      [v10 topAnchor];
    uint64_t v19 = };
    id v20 = [v18 constraintEqualToAnchor:v19];
    [v11 addObject:v20];

    id v13 = v39;
  }
  id v21 = [v13 count];
  long long v22 = v39;
  if ((unint64_t)v21 >= 2)
  {
    double v23 = [v39 lastObject];
    [v10 addSubview:v23];
    id v24 = [v23 trailingAnchor];
    id v25 = [v10 trailingAnchor];
    double v26 = [v24 constraintEqualToAnchor:v25];
    [v11 addObject:v26];

    if ([(MultilineStackView *)self verticalArrangement])
    {
      double v27 = [v23 centerYAnchor];
      [v10 centerYAnchor];
    }
    else
    {
      double v27 = [v23 topAnchor];
      [v10 topAnchor];
    double v28 = };
    double v29 = [v27 constraintEqualToAnchor:v28];
    [v11 addObject:v29];

    long long v22 = v39;
  }
  if ((unint64_t)[v22 count] >= 3)
  {
    unsigned int v30 = [v39 firstObject];
    double v31 = [v30 trailingAnchor];

    if ((char *)[v39 count] - 3 <= (char *)0xFFFFFFFFFFFFFFFDLL)
    {
      unint64_t v32 = 1;
      do
      {
        int v33 = [v39 objectAtIndexedSubscript:v32];
        [v10 addSubview:v33];
        v34 = [v33 leadingAnchor];
        v35 = [v34 constraintEqualToAnchor:v31 constant:a4];
        [v11 addObject:v35];

        if ([(MultilineStackView *)self verticalArrangement])
        {
          v36 = [v33 centerYAnchor];
          [v10 centerYAnchor];
        }
        else
        {
          v36 = [v33 topAnchor];
          [v10 topAnchor];
        v37 = };
        id v38 = [v36 constraintEqualToAnchor:v37];
        [v11 addObject:v38];

        ++v32;
      }
      while ((char *)v32 < (char *)[v39 count] - 1);
    }
  }
}

- (void)_computeJustifiedRowWithViews:(id)a3 itemWidth:(double)a4 rowView:(id)a5 constraints:(id)a6
{
  id v33 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v10 leadingAnchor];
  if ([v33 count])
  {
    id v13 = 0;
    double v14 = 0.0;
    CFStringRef v15 = @"MapsWidthConstraint";
    do
    {
      id v16 = [v33 objectAtIndexedSubscript:v13];
      [v10 addSubview:v16];
      id v17 = [v16 leadingAnchor];
      id v18 = [v17 constraintEqualToAnchor:v12 constant:v14];
      [v11 addObject:v18];

      if ([(MultilineStackView *)self verticalArrangement])
      {
        uint64_t v19 = [v16 centerYAnchor];
        [v10 centerYAnchor];
      }
      else
      {
        uint64_t v19 = [v16 topAnchor];
        [v10 topAnchor];
      id v20 = };
      id v21 = [v19 constraintEqualToAnchor:v20];
      [v11 addObject:v21];

      long long v22 = [v16 widthAnchor];
      double v23 = [v22 constraintEqualToConstant:a4];

      [v23 setIdentifier:v15];
      [v11 addObject:v23];
      if (v13 == (char *)[v33 count] - 1)
      {
        id v24 = [v16 trailingAnchor];
        id v25 = [v10 trailingAnchor];
        [v24 constraintEqualToAnchor:v25];
        unint64_t v32 = v12;
        id v26 = v10;
        double v27 = self;
        v29 = CFStringRef v28 = v15;
        [v11 addObject:v29];

        CFStringRef v15 = v28;
        self = v27;
        id v10 = v26;
        id v12 = v32;
      }
      unsigned int v30 = [v16 trailingAnchor];

      [(MultilineStackView *)self interItemHorizontalPadding];
      double v14 = v31;

      ++v13;
      id v12 = v30;
    }
    while (v13 < [v33 count]);
  }
  else
  {
    unsigned int v30 = v12;
  }
}

- (unint64_t)horizontalArrangement
{
  return self->_horizontalArrangement;
}

- (unint64_t)verticalArrangement
{
  return self->_verticalArrangement;
}

- (double)interItemHorizontalPadding
{
  return self->_interItemHorizontalPadding;
}

- (double)interItemVerticalPadding
{
  return self->_interItemVerticalPadding;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)customizationBlock
{
  return self->_customizationBlock;
}

- (void)setCustomizationBlock:(id)a3
{
}

- (id)rowHeightBlock
{
  return self->_rowHeightBlock;
}

- (void)setRowHeightBlock:(id)a3
{
}

- (double)calculatedHeight
{
  return self->_calculatedHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rowHeightBlock, 0);
  objc_storeStrong(&self->_customizationBlock, 0);
  objc_storeStrong((id *)&self->_arrangedSubviews, 0);

  objc_storeStrong((id *)&self->_computedWidth, 0);
}

@end