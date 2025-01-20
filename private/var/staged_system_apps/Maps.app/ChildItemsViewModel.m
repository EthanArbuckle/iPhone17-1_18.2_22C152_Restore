@interface ChildItemsViewModel
- (BOOL)isEqual:(id)a3;
- (ChildItemsViewModel)initWithChildItems:(id)a3 childItemsSpacing:(double)a4 font:(id)a5 maxWidth:(double)a6 buttonContentEdgeInsets:(UIEdgeInsets)a7;
- (NSArray)childItems;
- (unint64_t)childItemsCount;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)calculateModelWithChildItemsSpacing:(double)a3 font:(id)a4 maxWidth:(double)a5 buttonContentEdgeInsets:(UIEdgeInsets)a6;
- (void)setNumberOfColumns:(unint64_t)a3;
- (void)setNumberOfRows:(unint64_t)a3;
@end

@implementation ChildItemsViewModel

- (ChildItemsViewModel)initWithChildItems:(id)a3 childItemsSpacing:(double)a4 font:(id)a5 maxWidth:(double)a6 buttonContentEdgeInsets:(UIEdgeInsets)a7
{
  double right = a7.right;
  double bottom = a7.bottom;
  double left = a7.left;
  double top = a7.top;
  id v15 = a3;
  id v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ChildItemsViewModel;
  v17 = [(ChildItemsViewModel *)&v21 init];
  if (v17)
  {
    v18 = (NSArray *)[v15 copy];
    childItems = v17->_childItems;
    v17->_childItems = v18;

    -[ChildItemsViewModel calculateModelWithChildItemsSpacing:font:maxWidth:buttonContentEdgeInsets:](v17, "calculateModelWithChildItemsSpacing:font:maxWidth:buttonContentEdgeInsets:", v16, a4, a6, top, left, bottom, right);
  }

  return v17;
}

- (unint64_t)childItemsCount
{
  return [(NSArray *)self->_childItems count];
}

- (void)calculateModelWithChildItemsSpacing:(double)a3 font:(id)a4 maxWidth:(double)a5 buttonContentEdgeInsets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double left = a6.left;
  id v11 = a4;
  v12 = +[NSMutableArray arrayWithCapacity:[(ChildItemsViewModel *)self childItemsCount]];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v13 = [(ChildItemsViewModel *)self childItems];
  id v14 = [v13 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = +[ChildItemButton buttonTitleWithChildItem:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        if (v18) {
          [v12 addObject:v18];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v15);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v12;
  id v20 = [v19 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    double v23 = 0.0;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
        NSAttributedStringKey v40 = NSFontAttributeName;
        id v41 = v11;
        v26 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1, (void)v32);
        [v25 sizeWithAttributes:v26];
        double v28 = ceil(v27);

        if (v23 <= v28) {
          double v23 = v28;
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v21);
  }
  else
  {
    double v23 = 0.0;
  }

  double v29 = left + right + v23;
  if (((id)[(ChildItemsViewModel *)self childItemsCount] == (id)3
     || (id)[(ChildItemsViewModel *)self childItemsCount] == (id)5
     || (id)[(ChildItemsViewModel *)self childItemsCount] == (id)6)
    && a3 + a3 + v29 * 3.0 < a5)
  {
    [(ChildItemsViewModel *)self setNumberOfColumns:3];
    if ([(ChildItemsViewModel *)self childItemsCount] <= 3) {
      unint64_t v30 = 1;
    }
    else {
      unint64_t v30 = 2;
    }
  }
  else if (([(ChildItemsViewModel *)self childItemsCount] & 1) != 0 {
         || a3 + v29 * 2.0 >= a5)
  }
  {
    [(ChildItemsViewModel *)self setNumberOfColumns:1];
    unint64_t v30 = [(ChildItemsViewModel *)self childItemsCount];
  }
  else
  {
    [(ChildItemsViewModel *)self setNumberOfColumns:2];
    unint64_t v31 = [(ChildItemsViewModel *)self childItemsCount];
    unint64_t v30 = ([(ChildItemsViewModel *)self childItemsCount] & 1) + (v31 >> 1);
  }
  -[ChildItemsViewModel setNumberOfRows:](self, "setNumberOfRows:", v30, (void)v32);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ChildItemsViewModel *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(ChildItemsViewModel *)self numberOfRows];
      if (v6 == (id)[(ChildItemsViewModel *)v5 numberOfRows]
        && (id v7 = [(ChildItemsViewModel *)self numberOfColumns],
            v7 == (id)[(ChildItemsViewModel *)v5 numberOfColumns]))
      {
        id v8 = [(ChildItemsViewModel *)self childItemsCount];
        BOOL v9 = v8 == (id)[(ChildItemsViewModel *)v5 childItemsCount];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (NSArray)childItems
{
  return self->_childItems;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  self->_numberOfRows = a3;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (void).cxx_destruct
{
}

@end