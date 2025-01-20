@interface MapViewModeGridView
- (MapViewModeGridView)initWithFrame:(CGRect)a3;
- (NSArray)buttonViewModels;
- (id)_constraintsForStackingButtonViews:(id)a3 inRowLayoutGuide:(id)a4;
- (id)_constraintsForStackingRows;
- (void)_addOrRemoveObjectsInMutableArray:(id)a3 toMatchCount:(unint64_t)a4 addBlock:(id)a5 removeBlock:(id)a6;
- (void)_rebuildGrid;
- (void)setButtonViewModels:(id)a3;
@end

@implementation MapViewModeGridView

- (MapViewModeGridView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MapViewModeGridView;
  v3 = -[MapViewModeGridView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[NSMutableArray array];
    buttonViews = v3->_buttonViews;
    v3->_buttonViews = (NSMutableArray *)v4;

    buttonViewModels = v3->_buttonViewModels;
    v3->_buttonViewModels = (NSArray *)&__NSArray0__struct;

    uint64_t v7 = +[NSMutableArray array];
    rowLayoutGuides = v3->_rowLayoutGuides;
    v3->_rowLayoutGuides = (NSMutableArray *)v7;

    [(MapViewModeGridView *)v3 setAccessibilityIdentifier:@"MapViewModeGridView"];
  }
  return v3;
}

- (void)setButtonViewModels:(id)a3
{
  v5 = (NSArray *)a3;
  v6 = v5;
  p_buttonViewModels = &self->_buttonViewModels;
  if (self->_buttonViewModels != v5 && (-[NSArray isEqual:](v5, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_buttonViewModels, a3);
    id v8 = [(NSMutableArray *)self->_buttonViews count];
    if (v8 != (id)[(NSArray *)*p_buttonViewModels count]) {
      [(MapViewModeGridView *)self _rebuildGrid];
    }
    v9 = *p_buttonViewModels;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1009A3770;
    v10[3] = &unk_101312AC8;
    v10[4] = self;
    [(NSArray *)v9 enumerateObjectsUsingBlock:v10];
  }
}

- (void)_rebuildGrid
{
  v2 = self;
  if (self->_constraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    constraints = v2->_constraints;
    v2->_constraints = 0;
  }
  uint64_t v4 = 8;
  buttonViews = v2->_buttonViews;
  id v6 = [(NSArray *)v2->_buttonViewModels count];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1009A3BA4;
  v30[3] = &unk_101312AF0;
  v30[4] = v2;
  [(MapViewModeGridView *)v2 _addOrRemoveObjectsInMutableArray:buttonViews toMatchCount:v6 addBlock:v30 removeBlock:&stru_101312B10];
  unint64_t v25 = (unint64_t)[(NSMutableArray *)v2->_buttonViews count] & 1;
  unint64_t v7 = v25 + ((unint64_t)[(NSMutableArray *)v2->_buttonViews count] >> 1);
  rowLayoutGuides = v2->_rowLayoutGuides;
  v28[4] = v2;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1009A3C18;
  v29[3] = &unk_101312AF0;
  v29[4] = v2;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1009A3C68;
  v28[3] = &unk_101312B38;
  [(MapViewModeGridView *)v2 _addOrRemoveObjectsInMutableArray:rowLayoutGuides toMatchCount:v7 addBlock:v29 removeBlock:v28];
  v9 = +[NSMutableArray array];
  objc_super v10 = [(MapViewModeGridView *)v2 _constraintsForStackingRows];
  v27 = v9;
  [v9 addObjectsFromArray:v10];

  if (v7)
  {
    uint64_t v11 = 0;
    uint64_t v12 = -(uint64_t)v25;
    v13 = GEOResultRefinementSort_ptr;
    do
    {
      if (v11 || !v25)
      {
        uint64_t v26 = [*(id *)((char *)&v2->super.super.super.isa + v4) objectAtIndexedSubscript:v12];
        v31[0] = v26;
        v15 = [*(id *)((char *)&v2->super.super.super.isa + v4) objectAtIndexedSubscript:v12 + 1];
        v31[1] = v15;
        v16 = [v13[501] arrayWithObjects:v31 count:2];
        v17 = [(NSMutableArray *)v2->_rowLayoutGuides objectAtIndexedSubscript:v11];
        [(MapViewModeGridView *)v2 _constraintsForStackingButtonViews:v16 inRowLayoutGuide:v17];
        v18 = v2;
        uint64_t v19 = v4;
        v20 = v13;
        v22 = unint64_t v21 = v7;
        [v27 addObjectsFromArray:v22];

        unint64_t v7 = v21;
        v13 = v20;
        uint64_t v4 = v19;
        v2 = v18;
        v14 = (void *)v26;
      }
      else
      {
        v14 = [*(id *)((char *)&v2->super.super.super.isa + v4) firstObject];
        v32 = v14;
        v15 = [v13[501] arrayWithObjects:&v32 count:1];
        v16 = [(NSMutableArray *)v2->_rowLayoutGuides firstObject];
        v17 = [(MapViewModeGridView *)v2 _constraintsForStackingButtonViews:v15 inRowLayoutGuide:v16];
        [v27 addObjectsFromArray:v17];
      }

      ++v11;
      v12 += 2;
    }
    while (v7 != v11);
  }
  if (sub_1000BBB44(v2) == 5) {
    -[MapViewModeGridView setLayoutMargins:](v2, "setLayoutMargins:", 16.0, 14.0, 16.0, 14.0);
  }
  +[NSLayoutConstraint activateConstraints:v27];
  v23 = (NSArray *)[v27 copy];
  v24 = v2->_constraints;
  v2->_constraints = v23;
}

- (void)_addOrRemoveObjectsInMutableArray:(id)a3 toMatchCount:(unint64_t)a4 addBlock:(id)a5 removeBlock:(id)a6
{
  id v15 = a3;
  v9 = (void (**)(void))a5;
  objc_super v10 = (void (**)(id, void *))a6;
  id v11 = [v15 count];
  id v12 = [v15 count];
  if ((unint64_t)v11 >= a4)
  {
    if ((unint64_t)v12 > a4 && (unint64_t)[v15 count] > a4)
    {
      do
      {
        v14 = [v15 lastObject];
        [v15 removeLastObject];
        v10[2](v10, v14);
      }
      while ((unint64_t)[v15 count] > a4);
    }
  }
  else if ((unint64_t)v12 < a4)
  {
    do
    {
      v13 = v9[2](v9);
      [v15 addObject:v13];
    }
    while ((unint64_t)[v15 count] < a4);
  }
}

- (id)_constraintsForStackingRows
{
  v3 = +[NSMutableArray array];
  if (sub_1000BBB44(self) == 5) {
    double v4 = 14.0;
  }
  else {
    double v4 = 20.0;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obj = self->_rowLayoutGuides;
  id v34 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  id v5 = 0;
  if (v34)
  {
    v32 = v3;
    uint64_t v33 = *(void *)v40;
    v35 = self;
    do
    {
      uint64_t v6 = 0;
      unint64_t v7 = v5;
      do
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v39 + 1) + 8 * v6);
        v9 = [v8 topAnchor];
        v37 = v7;
        uint64_t v38 = v6;
        if (v7)
        {
          objc_super v10 = [v7 bottomAnchor];
          id v11 = [v9 constraintEqualToAnchor:v10 constant:v4];
          [v3 addObject:v11];
        }
        else
        {
          objc_super v10 = [(MapViewModeGridView *)self layoutMarginsGuide];
          id v11 = [v10 topAnchor];
          id v12 = [v9 constraintEqualToAnchor:v11];
          [v3 addObject:v12];
        }
        v36 = [v8 leadingAnchor];
        v13 = [(MapViewModeGridView *)self layoutMarginsGuide];
        v14 = [v13 leadingAnchor];
        [v36 constraintEqualToAnchor:v14];
        v16 = id v15 = v8;
        v43[0] = v16;
        v17 = [v8 trailingAnchor];
        v18 = [(MapViewModeGridView *)self layoutMarginsGuide];
        uint64_t v19 = [v18 trailingAnchor];
        v20 = [v17 constraintEqualToAnchor:v19];
        v43[1] = v20;
        unint64_t v21 = +[NSArray arrayWithObjects:v43 count:2];
        [v32 addObjectsFromArray:v21];

        self = v35;
        v22 = [(NSMutableArray *)v35->_rowLayoutGuides lastObject];

        v3 = v32;
        if (v15 == v22)
        {
          v23 = [v15 bottomAnchor];
          v24 = [(MapViewModeGridView *)v35 layoutMarginsGuide];
          unint64_t v25 = [v24 bottomAnchor];
          uint64_t v26 = [v23 constraintEqualToAnchor:v25];
          [v32 addObject:v26];

          self = v35;
        }
        if (v37)
        {
          v27 = [v15 heightAnchor];
          v28 = [v37 heightAnchor];
          v29 = [v27 constraintEqualToAnchor:v28];
          [v32 addObject:v29];
        }
        id v5 = v15;

        uint64_t v6 = v38 + 1;
        unint64_t v7 = v5;
      }
      while (v34 != (id)(v38 + 1));
      id v34 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v34);
  }

  return v3;
}

- (id)_constraintsForStackingButtonViews:(id)a3 inRowLayoutGuide:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  long long v41 = self;
  long long v45 = 0u;
  long long v46 = 0u;
  if (sub_1000BBB44(self) == 5) {
    double v9 = 14.0;
  }
  else {
    double v9 = 20.0;
  }
  long long v47 = 0uLL;
  long long v48 = 0uLL;
  id v10 = v6;
  id v42 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v42)
  {
    id v11 = 0;
    uint64_t v39 = *(void *)v46;
    long long v40 = v10;
    v43 = v7;
    do
    {
      id v12 = 0;
      v13 = v11;
      do
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v12);
        id v15 = [v14 leadingAnchor];
        v44 = v13;
        if (v13)
        {
          v16 = [v13 trailingAnchor];
          [v15 constraintEqualToAnchor:v16 constant:v9];
        }
        else
        {
          v16 = [v7 leadingAnchor];
          [v15 constraintEqualToAnchor:v16];
        v17 = };
        [v8 addObject:v17];

        v18 = [v14 topAnchor];
        uint64_t v19 = [v7 topAnchor];
        v20 = [v18 constraintEqualToAnchor:v19];
        v49[0] = v20;
        unint64_t v21 = [v14 bottomAnchor];
        [v7 bottomAnchor];
        v23 = v22 = v8;
        v24 = [v21 constraintEqualToAnchor:v23];
        v49[1] = v24;
        unint64_t v25 = +[NSArray arrayWithObjects:v49 count:2];
        [v22 addObjectsFromArray:v25];

        id v8 = v22;
        id v10 = v40;
        uint64_t v26 = [v40 lastObject];

        if (v14 == v26)
        {
          v27 = [v14 trailingAnchor];
          v28 = [v43 trailingAnchor];
          v29 = [v27 constraintEqualToAnchor:v28];
          [v8 addObject:v29];
        }
        if (v44)
        {
          v30 = [v14 widthAnchor];
          v31 = [v44 widthAnchor];
          v32 = [v30 constraintEqualToAnchor:v31];
          [v8 addObject:v32];
        }
        if ((unint64_t)[v40 count] >= 2)
        {
          uint64_t v33 = [v14 widthAnchor];
          id v34 = [v14 heightAnchor];
          v35 = [v33 constraintEqualToAnchor:v34 multiplier:1.42105263];
          [v8 addObject:v35];
        }
        if (sub_1000BBB44(v41) == 5)
        {
          v36 = [v14 widthAnchor];
          v37 = [v36 constraintEqualToConstant:152.0];
          [v8 addObject:v37];
        }
        id v11 = v14;

        id v12 = (char *)v12 + 1;
        v13 = v11;
        id v7 = v43;
      }
      while (v42 != v12);
      id v42 = [v40 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v42);
  }

  return v8;
}

- (NSArray)buttonViewModels
{
  return self->_buttonViewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonViewModels, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_rowLayoutGuides, 0);

  objc_storeStrong((id *)&self->_buttonViews, 0);
}

@end