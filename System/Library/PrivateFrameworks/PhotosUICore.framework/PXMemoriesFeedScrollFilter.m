@interface PXMemoriesFeedScrollFilter
- (NSDate)_lastAdditionalContentRequestDate;
- (PXMemoriesFeedScrollFilter)initWithScrollViewController:(id)a3;
- (PXMemoriesFeedScrollFilterDelegate)delegate;
- (PXMemoriesSpec)spec;
- (PXScrollViewController)scrollViewController;
- (void)_setLastAdditionalContentRequestDate:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpec:(id)a3;
@end

@implementation PXMemoriesFeedScrollFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lastAdditionalContentRequestDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
}

- (void)_setLastAdditionalContentRequestDate:(id)a3
{
}

- (NSDate)_lastAdditionalContentRequestDate
{
  return self->__lastAdditionalContentRequestDate;
}

- (PXMemoriesFeedScrollFilterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXMemoriesFeedScrollFilterDelegate *)WeakRetained;
}

- (PXMemoriesSpec)spec
{
  return self->_spec;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v4 = a3;
  if (self->_delegateFlags.respondsToShouldRequestAdditionalContent)
  {
    id v23 = v4;
    [v4 visibleRect];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v23 scrollViewContentSize];
    double v14 = v13;
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    CGFloat MaxY = CGRectGetMaxY(v25);
    id v4 = v23;
    if (v14 - MaxY < self->_additionalContentThreshold)
    {
      v16 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v17 = [(PXMemoriesFeedScrollFilter *)self _lastAdditionalContentRequestDate];
      if (!v17
        || (v18 = (void *)v17,
            [(PXMemoriesFeedScrollFilter *)self _lastAdditionalContentRequestDate],
            v19 = objc_claimAutoreleasedReturnValue(),
            [v16 timeIntervalSinceDate:v19],
            double v21 = v20,
            v19,
            v18,
            v21 > 1.0))
      {
        [(PXMemoriesFeedScrollFilter *)self _setLastAdditionalContentRequestDate:v16];
        v22 = [(PXMemoriesFeedScrollFilter *)self delegate];
        [v22 scrollFilterShouldRequestAdditionalContent:self];
      }
      id v4 = v23;
    }
  }
}

- (void)setSpec:(id)a3
{
  CGFloat v6 = (PXMemoriesSpec *)a3;
  if (self->_spec != v6)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXMemoriesSpec *)v6 feedAdditionalContentThreshold];
    self->_additionalContentThreshold = v5;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToShouldRequestAdditionalContent = objc_opt_respondsToSelector() & 1;
  }
}

- (PXMemoriesFeedScrollFilter)initWithScrollViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMemoriesFeedScrollFilter;
  CGFloat v6 = [(PXMemoriesFeedScrollFilter *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollViewController, a3);
    [(PXScrollViewController *)v7->_scrollViewController registerObserver:v7];
  }

  return v7;
}

@end