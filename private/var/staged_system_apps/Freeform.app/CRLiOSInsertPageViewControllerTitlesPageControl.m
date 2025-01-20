@interface CRLiOSInsertPageViewControllerTitlesPageControl
- (CRLiOSInsertPageViewControllerTitlesPageControl)initWithTitles:(id)a3;
- (UIButton)selectedButton;
- (UIStackView)p_stackView;
- (id)p_buttonAtIndex:(unint64_t)a3;
- (unint64_t)p_buttonCount;
- (unint64_t)p_indexOfButton:(id)a3;
- (unint64_t)selectedTitleIndex;
- (void)p_didTapButton:(id)a3;
- (void)setSelectedTitleIndex:(unint64_t)a3;
@end

@implementation CRLiOSInsertPageViewControllerTitlesPageControl

- (CRLiOSInsertPageViewControllerTitlesPageControl)initWithTitles:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CRLiOSInsertPageViewControllerTitlesPageControl;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[CRLiOSInsertPageViewControllerTitlesPageControl initWithFrame:](&v33, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    id v9 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setAxis:0];
    [v9 setLayoutMarginsRelativeArrangement:1];
    if (sub_1003E86EC()) {
      double v11 = 8.0;
    }
    else {
      double v11 = 0.0;
    }
    [v9 setLayoutMargins:8.0, v11];
    [(CRLiOSInsertPageViewControllerTitlesPageControl *)v8 addSubview:v9];
    v12 = [v9 topAnchor];
    v13 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)v8 topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    v15 = [v9 leadingAnchor];
    v16 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)v8 leadingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [v9 bottomAnchor];
    v19 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)v8 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [v9 trailingAnchor];
    v22 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)v8 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    objc_storeWeak((id *)&v8->_stackView, v9);
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = sub_10014B74C;
    v30 = &unk_1014D97E8;
    v31 = v8;
    id v32 = v9;
    id v24 = v9;
    [v4 enumerateObjectsUsingBlock:&v27];
    id v25 = objc_alloc_init((Class)UILargeContentViewerInteraction);
    [v24 addInteraction:v25, v27, v28, v29, v30];
  }
  return v8;
}

- (void)setSelectedTitleIndex:(unint64_t)a3
{
  unint64_t v5 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)self p_buttonCount];
  if (v5 <= a3)
  {
    unint64_t v8 = v5;
    unsigned int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D9808);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      v14 = v10;
      *(_DWORD *)buf = 67110658;
      unsigned int v16 = v9;
      __int16 v17 = 2082;
      v18 = "-[CRLiOSInsertPageViewControllerTitlesPageControl setSelectedTitleIndex:]";
      __int16 v19 = 2082;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m";
      __int16 v21 = 1024;
      int v22 = 184;
      __int16 v23 = 2112;
      uint64_t v24 = objc_opt_class();
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      __int16 v27 = 2048;
      unint64_t v28 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d %@: Attempted to set a selected title index of %lu but there are only %lu buttons.", buf, 0x40u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D9828);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInsertPageViewControllerTitlesPageControl setSelectedTitleIndex:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSInsertPageViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12, v13, 184, 0, "%@: Attempted to set a selected title index of %lu but there are only %lu buttons.", objc_opt_class(), a3, v8 file lineNumber isFatal description];
  }
  else
  {
    v6 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)self selectedButton];
    [v6 setSelected:0];
    v7 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)self p_buttonAtIndex:a3];
    [v7 setSelected:1];
  }
  self->_selectedTitleIndex = a3;
}

- (UIButton)selectedButton
{
  unint64_t v3 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)self selectedTitleIndex];

  return (UIButton *)[(CRLiOSInsertPageViewControllerTitlesPageControl *)self p_buttonAtIndex:v3];
}

- (id)p_buttonAtIndex:(unint64_t)a3
{
  unint64_t v5 = (objc_class *)objc_opt_class();
  v6 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)self p_stackView];
  v7 = [v6 arrangedSubviews];
  unint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  unsigned int v9 = sub_10024715C(v5, v8);

  return v9;
}

- (unint64_t)p_indexOfButton:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)self p_stackView];
  v6 = [v5 arrangedSubviews];
  id v7 = [v6 indexOfObject:v4];

  return (unint64_t)v7;
}

- (unint64_t)p_buttonCount
{
  v2 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)self p_stackView];
  unint64_t v3 = [v2 arrangedSubviews];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (void)p_didTapButton:(id)a3
{
  unint64_t v4 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)self p_indexOfButton:a3];
  unint64_t v5 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)self selectedTitleIndex];
  [(CRLiOSInsertPageViewControllerTitlesPageControl *)self setSelectedTitleIndex:v4];
  if (v5 != v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v6 = [(CRLiOSInsertPageViewControllerTitlesPageControl *)self allTargets];
    id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v10);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          v12 = -[CRLiOSInsertPageViewControllerTitlesPageControl actionsForTarget:forControlEvent:](self, "actionsForTarget:forControlEvent:", v11, 4096, 0);
          id v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v18;
            do
            {
              unsigned int v16 = 0;
              do
              {
                if (*(void *)v18 != v15) {
                  objc_enumerationMutation(v12);
                }
                [(CRLiOSInsertPageViewControllerTitlesPageControl *)self sendAction:NSSelectorFromString(*(NSString **)(*((void *)&v17 + 1) + 8 * (void)v16)) to:v11 forEvent:0];
                unsigned int v16 = (char *)v16 + 1;
              }
              while (v14 != v16);
              id v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v14);
          }

          v10 = (char *)v10 + 1;
        }
        while (v10 != v8);
        id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }
  }
}

- (unint64_t)selectedTitleIndex
{
  return self->_selectedTitleIndex;
}

- (UIStackView)p_stackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackView);

  return (UIStackView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end