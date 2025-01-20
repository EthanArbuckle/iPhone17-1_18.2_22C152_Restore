@interface PRXScrollableContentView
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)scrollViewHeightConstraint;
- (PRXScrollableContentView)initWithCardStyle:(int64_t)a3;
- (PRXScrollableContentView)initWithCardStyle:(int64_t)a3 scrollView:(id)a4;
- (UIScrollView)scrollView;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setScrollViewHeightConstraint:(id)a3;
@end

@implementation PRXScrollableContentView

- (PRXScrollableContentView)initWithCardStyle:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F1C940]);
  v6 = [(PRXScrollableContentView *)self initWithCardStyle:a3 scrollView:v5];

  return v6;
}

- (PRXScrollableContentView)initWithCardStyle:(int64_t)a3 scrollView:(id)a4
{
  v39[6] = *MEMORY[0x263EF8340];
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PRXScrollableContentView;
  v8 = [(PRXCardContentView *)&v38 initWithCardStyle:a3];
  v9 = v8;
  if (v8)
  {
    p_scrollView = (id *)&v8->_scrollView;
    objc_storeStrong((id *)&v8->_scrollView, a4);
    [*p_scrollView setScrollEnabled:0];
    [*p_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [*p_scrollView setPreservesSuperviewLayoutMargins:1];
    [(PRXScrollableContentView *)v9 addSubview:*p_scrollView];
    v11 = [*p_scrollView heightAnchor];
    [*p_scrollView contentSize];
    uint64_t v13 = [v11 constraintEqualToConstant:v12];
    scrollViewHeightConstraint = v9->_scrollViewHeightConstraint;
    v9->_scrollViewHeightConstraint = (NSLayoutConstraint *)v13;

    v29 = (void *)MEMORY[0x263F08938];
    v37 = [*p_scrollView leadingAnchor];
    v36 = [(PRXScrollableContentView *)v9 leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v39[0] = v35;
    v34 = [*p_scrollView trailingAnchor];
    v33 = [(PRXScrollableContentView *)v9 trailingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v39[1] = v32;
    v30 = [*p_scrollView topAnchor];
    v31 = [(PRXCardContentView *)v9 mainContentGuide];
    v28 = [v31 topAnchor];
    v27 = [v30 constraintEqualToAnchor:v28];
    v39[2] = v27;
    v25 = [*p_scrollView bottomAnchor];
    v26 = [(PRXCardContentView *)v9 mainContentGuide];
    v24 = [v26 bottomAnchor];
    v15 = [v25 constraintEqualToAnchor:v24];
    v39[3] = v15;
    v16 = [*p_scrollView contentLayoutGuide];
    v17 = [v16 widthAnchor];
    v18 = [(PRXCardContentView *)v9 mainContentGuide];
    v19 = [v18 widthAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v39[4] = v20;
    v39[5] = v9->_scrollViewHeightConstraint;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:6];
    [v29 activateConstraints:v21];

    [*p_scrollView addObserver:v9 forKeyPath:@"contentSize" options:0 context:PRXScrollableContentViewObserverContentSizeContext];
    v22 = v9;
  }

  return v9;
}

- (void)dealloc
{
  [(UIScrollView *)self->_scrollView removeObserver:self forKeyPath:@"contentSize" context:PRXScrollableContentViewObserverContentSizeContext];
  v3.receiver = self;
  v3.super_class = (Class)PRXScrollableContentView;
  [(PRXScrollableContentView *)&v3 dealloc];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F1D7C8];
  [(UIScrollView *)self->_scrollView frame];
  double MaxY = CGRectGetMaxY(v6);
  double v4 = v2;
  result.height = MaxY;
  result.width = v4;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)PRXScrollableContentViewObserverContentSizeContext == a6)
  {
    id v7 = PRXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PRXScrollableContentView observeValueForKeyPath:ofObject:change:context:]((uint64_t)self, v7);
    }

    [(NSLayoutConstraint *)self->_scrollViewHeightConstraint constant];
    double v9 = v8;
    [(UIScrollView *)self->_scrollView contentSize];
    if (v9 != v10)
    {
      [(NSLayoutConstraint *)self->_scrollViewHeightConstraint setConstant:v10];
      [(PRXScrollableContentView *)self invalidateIntrinsicContentSize];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PRXScrollableContentView;
    -[PRXScrollableContentView observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (NSLayoutConstraint)scrollViewHeightConstraint
{
  return self->_scrollViewHeightConstraint;
}

- (void)setScrollViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:(NSObject *)a2 change:context:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 504) contentSize];
  objc_super v3 = NSStringFromCGSize(v7);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_21C6D2000, a2, OS_LOG_TYPE_DEBUG, "contentSize changed for scroll view: %@", (uint8_t *)&v4, 0xCu);
}

@end