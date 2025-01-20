@interface UIStackView
+ (id)_maps_HStack;
+ (id)_maps_Spacer:(double)a3;
+ (id)_maps_Spacer:(double)a3 visibilityModel:(id)a4;
+ (id)_maps_StackWithAxis:(int64_t)a3;
+ (id)_maps_VStack;
- (id)_maps_deepArrangedSubviews;
- (id)_maps_deepArrangedSubviewsExcluding:(id)a3;
- (void)_addArrangedSubview:(id)a3 layoutPriority:(unint64_t)a4;
- (void)_addArrangedSubview:(id)a3 layoutPriority:(unint64_t)a4 padding:(BannerContentPadding)a5;
- (void)_configureSpacerIfNeeded:(id)a3 layoutPriority:(unint64_t)a4;
- (void)_maps_addArrangedContentHuggingSubview:(id)a3;
- (void)_maps_addArrangedContentHuggingSubview:(id)a3 padding:(BannerContentPadding)a4;
- (void)_maps_addArrangedExpandingSubview:(id)a3;
- (void)_maps_addArrangedExpandingSubview:(id)a3 padding:(BannerContentPadding)a4;
- (void)_maps_removeArrangedSubview:(id)a3;
- (void)_maps_setArrangedSubviews:(id)a3;
- (void)_maps_setArrangedSubviews:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation UIStackView

- (void)_maps_setArrangedSubviews:(id)a3
{
  id v4 = a3;
  v5 = [(UIStackView *)self arrangedSubviews];
  v6 = +[NSMutableArray arrayWithArray:v5];

  [v6 removeObjectsInArray:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [(UIStackView *)self _maps_removeArrangedSubview:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * (void)j);
        -[UIStackView removeArrangedSubview:](self, "removeArrangedSubview:", v17, (void)v18);
        [(UIStackView *)self addArrangedSubview:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)_maps_setArrangedSubviews:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (a4)
  {
    uint64_t v10 = [(UIStackView *)self arrangedSubviews];
    v11 = [v9 differenceFromArray:v10];

    if ([v11 hasChanges])
    {
      id v12 = +[GroupAnimation animation];
      [v12 setDuration:UINavigationControllerHideShowBarDuration];
      id v13 = [v11 removals];
      id v14 = [v13 count];

      if (v14)
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1003E76F8;
        v29[3] = &unk_1012E5D58;
        id v30 = v11;
        v31 = self;
        [v12 addAnimations:v29];
      }
      uint64_t v15 = +[GroupAnimation animation];
      [v15 setDuration:UINavigationControllerHideShowBarDuration];
      [v15 setPreventsAnimationDuringPreparation:1];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1003E7824;
      v26[3] = &unk_1012E5D58;
      id v9 = v11;
      id v27 = v9;
      v28 = self;
      [v15 addPreparation:v26];
      v16 = [v9 insertions];
      id v17 = [v16 count];

      if (v17)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1003E7A28;
        v24[3] = &unk_1012E5D08;
        id v25 = v9;
        [v15 addAnimations:v24];
      }
      if (v8) {
        [v15 addCompletion:v8];
      }
      long long v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      long long v21 = sub_1003E7B38;
      long long v22 = &unk_1012E7D28;
      id v23 = v15;
      id v18 = v15;
      [v12 addCompletion:&v19];
      [v12 runWithCurrentOptions:v19, v20, v21, v22];
    }
    else
    {
      id v9 = v11;
    }
  }
  else
  {
    [(UIStackView *)self _maps_setArrangedSubviews:v9];
  }
}

- (void)_maps_removeArrangedSubview:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = [(UIStackView *)self subviews];
    unsigned int v5 = [v4 containsObject:v6];

    if (v5)
    {
      [(UIStackView *)self removeArrangedSubview:v6];
      [v6 removeFromSuperview];
    }
  }
}

+ (id)_maps_StackWithAxis:(int64_t)a3
{
  id v4 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setDistribution:0];
  [v4 setAlignment:0];
  [v4 setAxis:a3];

  return v4;
}

+ (id)_maps_VStack
{
  return +[UIStackView _maps_StackWithAxis:1];
}

+ (id)_maps_HStack
{
  return +[UIStackView _maps_StackWithAxis:0];
}

+ (id)_maps_Spacer:(double)a3 visibilityModel:(id)a4
{
  id v5 = a4;
  id v6 = -[BannerContentSpacerView initWithFrame:]([BannerContentSpacerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(BannerContentSpacerView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BannerContentSpacerView *)v6 setMinLength:a3];
  [(BannerContentVisibilityProxyView *)v6 setVisibilityModel:v5];

  return v6;
}

+ (id)_maps_Spacer:(double)a3
{
  return [a1 _maps_Spacer:0 visibilityModel:a3];
}

- (void)_configureSpacerIfNeeded:(id)a3 layoutPriority:(unint64_t)a4
{
  id v9 = a3;
  if ([v9 axis] == (id)-1)
  {
    [v9 setAxis:[self axis]];
    if ((id)[(UIStackView *)self axis] == (id)1) {
      [v9 heightAnchor];
    }
    else {
    id v6 = [v9 widthAnchor];
    }
    if (a4 == 1)
    {
      [v9 minLength];
      id v7 = [v6 constraintGreaterThanOrEqualToConstant:];
    }
    else
    {
      if (a4)
      {
LABEL_10:

        goto LABEL_11;
      }
      [v9 minLength];
      id v7 = [v6 constraintEqualToConstant:];
    }
    id v8 = v7;
    [v7 setActive:1];

    goto LABEL_10;
  }
LABEL_11:
}

- (void)_addArrangedSubview:(id)a3 layoutPriority:(unint64_t)a4
{
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIStackView *)self _configureSpacerIfNeeded:v14 layoutPriority:a4];
  }
  if (a4 == 1)
  {
    float v7 = 250.0;
  }
  else
  {
    if (a4) {
      goto LABEL_10;
    }
    [v14 contentHuggingPriorityForAxis:[self axis]];
    if (v6 >= 750.0) {
      float v7 = v6;
    }
    else {
      float v7 = 750.0;
    }
  }
  UILayoutConstraintAxis v8 = [(UIStackView *)self axis];
  *(float *)&double v9 = v7;
  [v14 setContentHuggingPriority:v8 forAxis:v9];
LABEL_10:
  [v14 contentCompressionResistancePriorityForAxis:[self axis]];
  if (v10 >= 750.0) {
    float v11 = v10;
  }
  else {
    float v11 = 750.0;
  }
  UILayoutConstraintAxis v12 = [(UIStackView *)self axis];
  *(float *)&double v13 = v11;
  [v14 setContentCompressionResistancePriority:v12 forAxis:v13];
  [(UIStackView *)self addArrangedSubview:v14];
}

- (void)_maps_addArrangedContentHuggingSubview:(id)a3
{
}

- (void)_maps_addArrangedExpandingSubview:(id)a3
{
}

- (void)_addArrangedSubview:(id)a3 layoutPriority:(unint64_t)a4 padding:(BannerContentPadding)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v11 = a3;
  if (var0 != 0.0)
  {
    double v9 = +[UIStackView _maps_Spacer:v11 visibilityModel:var0];
    [(UIStackView *)self _maps_addArrangedContentHuggingSubview:v9];
  }
  [(UIStackView *)self _addArrangedSubview:v11 layoutPriority:a4];
  if (var1 != 0.0)
  {
    float v10 = +[UIStackView _maps_Spacer:v11 visibilityModel:var1];
    [(UIStackView *)self _maps_addArrangedContentHuggingSubview:v10];
  }
}

- (void)_maps_addArrangedContentHuggingSubview:(id)a3 padding:(BannerContentPadding)a4
{
}

- (void)_maps_addArrangedExpandingSubview:(id)a3 padding:(BannerContentPadding)a4
{
}

- (id)_maps_deepArrangedSubviews
{
  return [(UIStackView *)self _maps_deepArrangedSubviewsExcluding:0];
}

- (id)_maps_deepArrangedSubviewsExcluding:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  float v6 = [(UIStackView *)self arrangedSubviews];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v4 containsObject:v11] & 1) == 0)
        {
          UILayoutConstraintAxis v12 = [v11 _maps_deepArrangedSubviews];
          [v5 addObjectsFromArray:v12];
        }
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [v5 copy];

  return v13;
}

@end