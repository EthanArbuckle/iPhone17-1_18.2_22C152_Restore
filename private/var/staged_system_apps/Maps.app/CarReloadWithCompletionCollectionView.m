@interface CarReloadWithCompletionCollectionView
- (BOOL)_shouldRunCompletion;
- (id)reloadDataCompletion;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)reloadDataWithCompletion:(id)a3;
- (void)setReloadDataCompletion:(id)a3;
@end

@implementation CarReloadWithCompletionCollectionView

- (void)reloadDataWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100577F64();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarReloadWithCompletionCollectionView reloadDataWithCompletion", v6, 2u);
  }

  [(CarReloadWithCompletionCollectionView *)self setReloadDataCompletion:v4];
  [(CarReloadWithCompletionCollectionView *)self reloadData];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CarReloadWithCompletionCollectionView;
  [(CarReloadWithCompletionCollectionView *)&v7 layoutSubviews];
  v3 = sub_100577F64();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CarReloadWithCompletionCollectionView layoutSubviews", v6, 2u);
  }

  if ([(CarReloadWithCompletionCollectionView *)self _shouldRunCompletion])
  {
    id v4 = sub_100577F64();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarReloadWithCompletionCollectionView layoutSubviews reloadDataCompletionBlock", v6, 2u);
    }

    v5 = [(CarReloadWithCompletionCollectionView *)self reloadDataCompletion];
    v5[2]();

    [(CarReloadWithCompletionCollectionView *)self setReloadDataCompletion:0];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CarReloadWithCompletionCollectionView;
  [(CarReloadWithCompletionCollectionView *)&v3 didMoveToWindow];
  if ([(CarReloadWithCompletionCollectionView *)self _shouldRunCompletion])
  {
    [(CarReloadWithCompletionCollectionView *)self setNeedsLayout];
    [(CarReloadWithCompletionCollectionView *)self layoutIfNeeded];
  }
}

- (BOOL)_shouldRunCompletion
{
  objc_super v3 = [(CarReloadWithCompletionCollectionView *)self window];
  if (v3)
  {
    id v4 = [(CarReloadWithCompletionCollectionView *)self reloadDataCompletion];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)reloadDataCompletion
{
  return self->_reloadDataCompletion;
}

- (void)setReloadDataCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end