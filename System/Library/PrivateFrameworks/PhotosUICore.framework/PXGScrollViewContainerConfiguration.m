@interface PXGScrollViewContainerConfiguration
- (BOOL)isEqual:(id)a3;
- (PXGScrollViewContainerDelegate)delegate;
- (PXGScrollViewModel)scrollViewModel;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setDelegate:(id)a3;
- (void)setScrollViewModel:(id)a3;
@end

@implementation PXGScrollViewContainerConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollViewModel, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXGScrollViewContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGScrollViewContainerDelegate *)WeakRetained;
}

- (void)setScrollViewModel:(id)a3
{
}

- (PXGScrollViewModel)scrollViewModel
{
  return self->_scrollViewModel;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 scrollViewModel];
    id v7 = [(PXGScrollViewContainerConfiguration *)self scrollViewModel];
    if (v6 == v7)
    {
    }
    else
    {
      int v8 = [v6 isEqual:v7];

      if (!v8)
      {
        char v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v10 = [v5 delegate];
    v11 = [(PXGScrollViewContainerConfiguration *)self delegate];
    if (v10 == v11) {
      char v9 = 1;
    }
    else {
      char v9 = [v10 isEqual:v11];
    }

    goto LABEL_11;
  }
  char v9 = 0;
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  return [(PXGScrollViewModel *)self->_scrollViewModel hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_scrollViewModel);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak(v4 + 2, WeakRetained);

  return v4;
}

@end