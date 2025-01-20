@interface ScrollViewContentOffsetObserver
- (ScrollViewContentOffsetObserver)initWithScrollView:(id)a3 changeHandler:(id)a4;
- (UIScrollView)scrollView;
- (id)changeHandler;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setChangeHandler:(id)a3;
- (void)setScrollView:(id)a3;
@end

@implementation ScrollViewContentOffsetObserver

- (ScrollViewContentOffsetObserver)initWithScrollView:(id)a3 changeHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ScrollViewContentOffsetObserver;
  v9 = [(ScrollViewContentOffsetObserver *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scrollView, a3);
    id v11 = [v8 copy];
    id changeHandler = v10->_changeHandler;
    v10->_id changeHandler = v11;

    [v7 addObserver:v10 forKeyPath:@"contentOffset" options:1 context:&off_100FC3490];
  }

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_100FC3490)
  {
    id v8 = [(ScrollViewContentOffsetObserver *)self changeHandler];
    if (v8)
    {
      scrollView = self->_scrollView;
      [(UIScrollView *)scrollView contentOffset];
      v8[2](v8, scrollView);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ScrollViewContentOffsetObserver;
    -[ScrollViewContentOffsetObserver observeValueForKeyPath:ofObject:change:context:](&v9, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)dealloc
{
  [(UIScrollView *)self->_scrollView removeObserver:self forKeyPath:@"contentOffset"];
  v3.receiver = self;
  v3.super_class = (Class)ScrollViewContentOffsetObserver;
  [(ScrollViewContentOffsetObserver *)&v3 dealloc];
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong(&self->_changeHandler, 0);
}

@end