@interface TLKContentsContainerView
- (NSMutableArray)contentsViews;
- (TLKContentsContainerView)init;
- (void)setContentsViews:(id)a3;
- (void)updateWithContents:(id)a3;
@end

@implementation TLKContentsContainerView

- (TLKContentsContainerView)init
{
  v5.receiver = self;
  v5.super_class = (Class)TLKContentsContainerView;
  v2 = [(TLKContentsContainerView *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(TLKContentsContainerView *)v2 setContentsViews:v3];

    [(TLKStackView *)v2 setAxis:1];
    [(NUIContainerStackView *)v2 setSpacing:14.0];
  }
  return v2;
}

- (void)updateWithContents:(id)a3
{
  id v30 = a3;
  uint64_t v4 = [v30 count];
  objc_super v5 = [(TLKContentsContainerView *)self contentsViews];
  uint64_t v6 = [v5 count];

  if (v4 != v6)
  {
    unint64_t v14 = [v30 count];
    v15 = [(TLKContentsContainerView *)self contentsViews];
    unint64_t v16 = [v15 count];

    if (v14 <= v16)
    {
      for (unint64_t i = [v30 count]; ; ++i)
      {
        v26 = [(TLKContentsContainerView *)self contentsViews];
        unint64_t v27 = [v26 count];

        if (i >= v27) {
          break;
        }
        v28 = [(TLKContentsContainerView *)self contentsViews];
        v29 = [v28 objectAtIndexedSubscript:i];
        [v29 setHidden:1];
      }
    }
    else
    {
      v17 = [(TLKContentsContainerView *)self contentsViews];
      unint64_t v18 = [v17 count];
      unint64_t v19 = [v30 count];

      if (v18 < v19)
      {
        do
        {
          v20 = objc_opt_new();
          v21 = [(TLKContentsContainerView *)self contentsViews];
          [v21 addObject:v20];

          [(TLKStackView *)self addArrangedSubview:v20];
          v22 = [(TLKContentsContainerView *)self contentsViews];
          unint64_t v23 = [v22 count];
          unint64_t v24 = [v30 count];
        }
        while (v23 < v24);
      }
    }
  }
  if ([v30 count])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(TLKContentsContainerView *)self contentsViews];
      v9 = [v8 objectAtIndexedSubscript:v7];
      v10 = [v30 objectAtIndexedSubscript:v7];
      v11 = [v10 title];
      v12 = [v30 objectAtIndexedSubscript:v7];
      v13 = [v12 details];
      [v9 updateWithTitle:v11 contents:v13];

      ++v7;
    }
    while (v7 < [v30 count]);
  }
}

- (NSMutableArray)contentsViews
{
  return self->_contentsViews;
}

- (void)setContentsViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end