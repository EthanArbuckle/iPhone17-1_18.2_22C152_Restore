@interface MTLineCountLayoutGroup
- (BOOL)_hasLabelWithPriority:(int64_t)a3;
- (MTLineCountLayoutGroup)initWithTotalLineCount:(unint64_t)a3;
- (NSArray)priorityOrderedItems;
- (unint64_t)totalLineCount;
- (void)addLabel:(id)a3 maxLineCount:(unint64_t)a4 sharingPriority:(int64_t)a5;
- (void)layout;
- (void)layoutWithSize:(CGSize)a3;
@end

@implementation MTLineCountLayoutGroup

- (MTLineCountLayoutGroup)initWithTotalLineCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTLineCountLayoutGroup;
  v4 = [(MTLineCountLayoutGroup *)&v8 init];
  v5 = v4;
  if (v4)
  {
    priorityOrderedItems = v4->_priorityOrderedItems;
    v4->_totalLineCount = a3;
    v4->_priorityOrderedItems = (NSArray *)&__NSArray0__struct;
  }
  return v5;
}

- (void)addLabel:(id)a3 maxLineCount:(unint64_t)a4 sharingPriority:(int64_t)a5
{
  id v8 = a3;
  if ([(MTLineCountLayoutGroup *)self _hasLabelWithPriority:a5])
  {
    v9 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109120;
      v15[1] = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "A label with priority %d already exists", (uint8_t *)v15, 8u);
    }
  }
  v10 = objc_opt_new();
  [v10 setLabel:v8];

  [v10 setMaxLineCount:a4];
  [v10 setSharingPriority:a5];
  v11 = [(MTLineCountLayoutGroup *)self priorityOrderedItems];
  v12 = [v11 arrayByAddingObject:v10];
  v13 = [v12 sortedArrayUsingComparator:&stru_10002CD38];

  priorityOrderedItems = self->_priorityOrderedItems;
  self->_priorityOrderedItems = v13;
}

- (void)layout
{
}

- (void)layoutWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t v6 = [(MTLineCountLayoutGroup *)self totalLineCount];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v7 = [(MTLineCountLayoutGroup *)self priorityOrderedItems];
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v13 = [v12 label];
        v14 = [v13 font];
        [v14 lineHeight];
        double v16 = v15;

        int64_t v17 = vcvtmd_u64_f64(height / v16);
        id v18 = [v12 maxLineCount];
        if ((uint64_t)v18 >= v6) {
          int64_t v19 = v6;
        }
        else {
          int64_t v19 = (int64_t)v18;
        }
        if (v19 >= v17) {
          unint64_t v20 = v17;
        }
        else {
          unint64_t v20 = v19;
        }
        id v21 = [v12 label];
        v22 = v21;
        if (v20)
        {
          double v23 = width;
          if (width < 0.00000011920929)
          {
            [v21 bounds];
            double v23 = v24;
          }
          [v22 setNumberOfLines:0];
          [v22 textRectForBounds:v20 limitedToNumberOfLines:0.0, 0.0, v23, 3.40282347e38];
          double v26 = v25;
          v27 = [v22 font];
          [v27 lineHeight];
          unint64_t v20 = 0;
          if (v26 > 0.0)
          {
            double v29 = v28;
            [v27 lineHeight];
            unint64_t v20 = vcvtad_u64_f64((v26 - v30) / v29) + 1;
          }
        }
        v31 = [v12 label];
        [v31 setNumberOfLines:v20];

        v6 -= v20;
        double height = height - (double)v20 * v16;
      }
      id v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }
}

- (BOOL)_hasLabelWithPriority:(int64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(MTLineCountLayoutGroup *)self priorityOrderedItems];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) sharingPriority] == (id)a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)totalLineCount
{
  return self->_totalLineCount;
}

- (NSArray)priorityOrderedItems
{
  return self->_priorityOrderedItems;
}

- (void).cxx_destruct
{
}

@end