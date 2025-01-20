@interface OBScrollViewWeakLayoutObserver
- (OBScrollViewWeakLayoutObserver)initWithLayoutObserver:(id)a3;
- (void)_scrollViewDidLayoutSubviews:(id)a3;
@end

@implementation OBScrollViewWeakLayoutObserver

- (OBScrollViewWeakLayoutObserver)initWithLayoutObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OBScrollViewWeakLayoutObserver;
  v5 = [(OBScrollViewWeakLayoutObserver *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_selfReference, v5);
    objc_storeWeak((id *)&v6->_weakLayoutObserver, v4);
  }

  return v6;
}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakLayoutObserver);
  v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _scrollViewDidLayoutSubviews:v6];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakLayoutObserver);
  objc_storeStrong((id *)&self->_selfReference, 0);
}

@end