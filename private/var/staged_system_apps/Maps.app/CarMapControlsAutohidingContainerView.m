@interface CarMapControlsAutohidingContainerView
- (CGSize)intrinsicContentSize;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (void)addSubview:(id)a3;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
@end

@implementation CarMapControlsAutohidingContainerView

- (CGSize)intrinsicContentSize
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(CarMapControlsAutohidingContainerView *)self subviews];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) intrinsicContentSize];
        double v7 = v7 + v9;
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  v10 = [(CarMapControlsAutohidingContainerView *)self subviews];
  id v11 = [v10 count];

  if ((unint64_t)v11 >= 2)
  {
    v12 = [(CarMapControlsAutohidingContainerView *)self subviews];
    [v12 count];
  }
  UIRoundToViewScale();
  double v14 = v13;
  double v15 = 28.0;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CarMapControlsAutohidingContainerView;
  [(CarMapControlsAutohidingContainerView *)&v7 layoutSubviews];
  [(CarMapControlsAutohidingContainerView *)self frame];
  double v4 = ceil(v3);
  [(CarMapControlsAutohidingContainerView *)self intrinsicContentSize];
  double v6 = 0.0;
  if (v4 >= floor(v5)) {
    double v6 = 1.0;
  }
  [(CarMapControlsAutohidingContainerView *)self setAlpha:v6];
}

- (void)setAlpha:(double)a3
{
  [(CarMapControlsAutohidingContainerView *)self alpha];
  double v6 = v5;
  v10.receiver = self;
  v10.super_class = (Class)CarMapControlsAutohidingContainerView;
  [(CarMapControlsAutohidingContainerView *)&v10 setAlpha:a3];
  [(CarMapControlsAutohidingContainerView *)self alpha];
  if (v6 != v7)
  {
    v8 = sub_1005774B4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      [(CarMapControlsAutohidingContainerView *)self alpha];
      *(_DWORD *)buf = 134218240;
      double v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Changing alpha from %f to %f", buf, 0x16u);
    }

    [(CarMapControlsAutohidingContainerView *)self setNeedsFocusUpdate];
  }
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)addSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarMapControlsAutohidingContainerView;
  [(CarMapControlsAutohidingContainerView *)&v4 addSubview:a3];
  [(CarMapControlsAutohidingContainerView *)self invalidateIntrinsicContentSize];
}

- (NSArray)focusOrderSubItems
{
  [(CarMapControlsAutohidingContainerView *)self alpha];
  if (v3 == 0.0)
  {
    id v4 = &__NSArray0__struct;
  }
  else
  {
    double v5 = self;
    double v6 = +[NSMutableArray array];
    double v7 = [(CarMapControlsAutohidingContainerView *)v5 subviews];
    v8 = [v7 sortedArrayUsingComparator:&stru_1012F9F80];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___CarFocusOrderCollection, (void)v17))
          {
            double v15 = [v14 focusOrderSubItems];
            [v6 addObjectsFromArray:v15];
          }
          else
          {
            [v6 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    id v4 = [v6 copy];
  }

  return (NSArray *)v4;
}

- (NSArray)preferredFocusEnvironments
{
  [(CarMapControlsAutohidingContainerView *)self alpha];
  if (v3 == 0.0)
  {
    id v4 = &__NSArray0__struct;
  }
  else
  {
    double v5 = self;
    double v6 = +[NSMutableArray array];
    double v7 = [(CarMapControlsAutohidingContainerView *)v5 subviews];
    v8 = [v7 sortedArrayUsingComparator:&stru_1012F9F80];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___CarFocusOrderCollection, (void)v19))
          {
            double v15 = [v14 focusOrderSubItems];
            [v6 addObjectsFromArray:v15];
          }
          else
          {
            [v6 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }

    id v16 = [v6 copy];
    if ([v16 count])
    {
      long long v17 = [v16 firstObject];
      v23 = v17;
      id v4 = +[NSArray arrayWithObjects:&v23 count:1];
    }
    else
    {
      id v4 = &__NSArray0__struct;
    }
  }

  return (NSArray *)v4;
}

@end