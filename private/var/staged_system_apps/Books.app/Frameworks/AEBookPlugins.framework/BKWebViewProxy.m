@interface BKWebViewProxy
- (BKWK2WebViewLoader)loader;
- (BOOL)hasWKWebView;
- (CGRect)contentRectForVisibleContent;
- (CGRect)frame;
- (CGRect)localFrame;
- (CGRect)rectForPageOffset:(unint64_t)a3;
- (double)scrollingPageHeightForPaginationMode:(unint64_t)a3 configuration:(id)a4;
- (double)scrollingPageWidthForPaginationMode:(unint64_t)a3 configuration:(id)a4;
- (id)currentLocationForOrdinal:(unint64_t)a3 pageOffset:(unint64_t)a4 contentInsets:(UIEdgeInsets)a5;
- (unint64_t)pageCount;
- (unint64_t)pageOffsetForLocation:(id)a3;
- (unint64_t)retryCount;
- (void)_butActually_wk2_scrollToPage:(int64_t)a3 paginationMode:(unint64_t)a4 pageProgressionDirection:(int)a5 configuration:(id)a6;
- (void)_wk2_scrollToPage:(int64_t)a3 paginationMode:(unint64_t)a4 pageProgressionDirection:(int)a5 configuration:(id)a6;
- (void)clientRectsForLocation:(id)a3 completion:(id)a4;
- (void)clientRectsForLocations:(id)a3 completion:(id)a4;
- (void)scrollToPage:(int64_t)a3 paginationMode:(unint64_t)a4 pageProgressionDirection:(int)a5 configuration:(id)a6;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasWKWebView:(BOOL)a3;
- (void)setLoader:(id)a3;
- (void)setLocalFrame:(CGRect)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setScrollViewClipsToBounds:(BOOL)a3;
@end

@implementation BKWebViewProxy

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[BKWebViewProxy setLocalFrame:](self, "setLocalFrame:");
  id v8 = [(BKWebViewProxy *)self loader];
  [v8 setDesiredWebViewFrame:x, y, width, height];
}

- (CGRect)frame
{
  [(BKWebViewProxy *)self loader];

  [(BKWebViewProxy *)self localFrame];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (unint64_t)pageCount
{
  v2 = [(BKWebViewProxy *)self loader];
  id v3 = [v2 pageCount];

  return (unint64_t)v3;
}

- (void)setClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKWebViewProxy *)self loader];
  double v4 = [v5 webView];
  [v4 setClipsToBounds:v3];
}

- (void)setScrollViewClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(BKWebViewProxy *)self loader];
  double v4 = [v6 webView];
  id v5 = [v4 scrollView];
  [v5 setClipsToBounds:v3];
}

- (void)clientRectsForLocations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v6;
  v11 = (char *)[v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_opt_class();
        v15 = BUDynamicCast();
        if (v15) {
          [v9 addObject:v15];
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  v16 = [(BKWebViewProxy *)self loader];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_8F528;
  v19[3] = &unk_1DC6A8;
  id v20 = v8;
  id v21 = v7;
  id v17 = v8;
  id v18 = v7;
  [v16 clientRectsForLocations:v9 completion:v19];
}

- (void)clientRectsForLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v15 = v6;
    id v8 = +[NSArray arrayWithObjects:&v15 count:1];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_8F744;
    v13[3] = &unk_1DCD78;
    id v14 = v7;
    [(BKWebViewProxy *)self clientRectsForLocations:v8 completion:v13];

    id v9 = v14;
  }
  else
  {
    id v10 = _AEWKProxyLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "clientRectsForLocation: nil location", v12, 2u);
    }

    id v11 = objc_retainBlock(v7);
    id v9 = v11;
    if (v11) {
      (*((void (**)(id, void, void, void))v11 + 2))(v11, 0, 0, 0);
    }
  }
}

- (CGRect)contentRectForVisibleContent
{
  if ([(BKWebViewProxy *)self hasWKWebView])
  {
    BOOL v3 = [(BKWebViewProxy *)self loader];
    [v3 contentRectForVisibleContent];
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)rectForPageOffset:(unint64_t)a3
{
  if ([(BKWebViewProxy *)self hasWKWebView])
  {
    id v5 = [(BKWebViewProxy *)self loader];
    [v5 rectForPageOffset:a3];
    CGFloat x = v6;
    CGFloat y = v8;
    CGFloat width = v10;
    CGFloat height = v12;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)currentLocationForOrdinal:(unint64_t)a3 pageOffset:(unint64_t)a4 contentInsets:(UIEdgeInsets)a5
{
  double v6 = [(BKWebViewProxy *)self loader];
  id v7 = [v6 currentFirstVisbleCFILocation];

  [v7 setWk1EpubLocation:0];
  if ([(BKWebViewProxy *)self hasWKWebView]) {
    double v8 = v7;
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (unint64_t)pageOffsetForLocation:(id)a3
{
  id v4 = a3;
  if ([(BKWebViewProxy *)self hasWKWebView])
  {
    id v5 = _AEWKProxyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v13 = 138412290;
      double v14 = v7;
    }
  }
  [(BKWebViewProxy *)self loader];

  [(BKWebViewProxy *)self hasWKWebView];
  if ([(BKWebViewProxy *)self hasWKWebView])
  {
    double v8 = _AEWKProxyLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Unable to determine current page offset.", (uint8_t *)&v13, 2u);
    }

    id v9 = _AERePaginationLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v13 = 138412290;
      double v14 = v11;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BKEPubCVC - pageOffsetForLocation: No Page Offset Found for location of type (%@)!", (uint8_t *)&v13, 0xCu);
    }
  }
  [(BKWebViewProxy *)self hasWKWebView];

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (double)scrollingPageWidthForPaginationMode:(unint64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [v6 contentLayoutSize];
    double Width = v8;
  }
  else
  {
    double Width = 0.0;
    if ([(BKWebViewProxy *)self hasWKWebView])
    {
      double v10 = [(BKWebViewProxy *)self loader];
      [v10 desiredWebViewFrame];
      double Width = CGRectGetWidth(v12);
    }
  }

  return Width;
}

- (double)scrollingPageHeightForPaginationMode:(unint64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 4)
  {
    [v6 contentLayoutSize];
    double Height = v8;
  }
  else
  {
    double Height = 0.0;
    if ([(BKWebViewProxy *)self hasWKWebView])
    {
      double v10 = [(BKWebViewProxy *)self loader];
      [v10 desiredWebViewFrame];
      double Height = CGRectGetHeight(v12);
    }
  }

  return Height;
}

- (void)scrollToPage:(int64_t)a3 paginationMode:(unint64_t)a4 pageProgressionDirection:(int)a5 configuration:(id)a6
{
}

- (void)_wk2_scrollToPage:(int64_t)a3 paginationMode:(unint64_t)a4 pageProgressionDirection:(int)a5 configuration:(id)a6
{
  id v10 = a6;
  id v11 = [(BKWebViewProxy *)self loader];
  CGRect v12 = [v11 webView];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_8FF2C;
  v32[3] = &unk_1DCDA0;
  v32[4] = self;
  int64_t v34 = a3;
  unint64_t v35 = a4;
  int v36 = a5;
  id v13 = v10;
  id v33 = v13;
  double v14 = objc_retainBlock(v32);
  double v15 = [v12 scrollView];
  [v15 contentSize];
  double v17 = v16;
  double v19 = v18;

  id v20 = [(BKWebViewProxy *)self loader];
  id v21 = [v20 pageCount];

  [v13 be_pageLength];
  double v23 = v22;
  if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 0) {
    double v24 = v17;
  }
  else {
    double v24 = v19;
  }
  double v25 = v24 / (double)(uint64_t)v21;
  if (v25 < v22 * 0.8)
  {
    v26 = _AEBookPluginsPageTurnLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = +[NSNumber numberWithDouble:v24];
      v28 = +[NSNumber numberWithDouble:v23 * (double)[(BKWebViewProxy *)self pageCount]];
      v29 = +[NSNumber numberWithDouble:v25];
      v30 = +[NSNumber numberWithDouble:v23 * 0.8];
      *(_DWORD *)buf = 138413058;
      v38 = v27;
      __int16 v39 = 2112;
      v40 = v28;
      __int16 v41 = 2112;
      v42 = v29;
      __int16 v43 = 2112;
      v44 = v30;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "contentLength is %@ but a size more like %@ seems more plausible. we compared %@ against %@", buf, 0x2Au);
    }
    goto LABEL_13;
  }
  if (v17 == CGSizeZero.width && v19 == CGSizeZero.height)
  {
LABEL_13:
    [v12 _doAfterNextPresentationUpdate:v14];
    goto LABEL_14;
  }
  ((void (*)(void *))v14[2])(v14);
LABEL_14:
}

- (void)_butActually_wk2_scrollToPage:(int64_t)a3 paginationMode:(unint64_t)a4 pageProgressionDirection:(int)a5 configuration:(id)a6
{
  id v10 = a6;
  if ((unint64_t)a3 <= 0x7FFFFFFFFFFFFFFELL)
  {
    if ([(BKWebViewProxy *)self hasWKWebView])
    {
      id v11 = [(BKWebViewProxy *)self loader];
      CGRect v12 = (char *)[v11 pageCount];
    }
    else
    {
      CGRect v12 = 0;
    }
    id v13 = [(BKWebViewProxy *)self loader];
    double v14 = [v13 webView];
    unsigned int v15 = [v14 isLoading];

    if (v15 && (uint64_t)v12 <= 0)
    {
      double v16 = _AEBookPluginsPageTurnLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        double v17 = [(BKWebViewProxy *)self loader];
        double v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 ordinal]);
        double v19 = +[NSNumber numberWithInteger:a3];
        *(_DWORD *)buf = 138412546;
        v127 = v18;
        __int16 v128 = 2112;
        v129 = v19;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Attempt to turn pages in:%@ to %@ when we are not loaded and have no known pagecount.", buf, 0x16u);

LABEL_12:
      }
    }
    else
    {
      if (v12 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        if ((uint64_t)v12 >= a3)
        {
          int64_t v21 = a3;
        }
        else
        {
          int64_t v21 = (int64_t)(v12 - 1);
          double v22 = _AEBookPluginsPageTurnLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            double v23 = +[NSNumber numberWithInteger:a3];
            double v24 = +[NSNumber numberWithInteger:v12];
            double v25 = +[NSNumber numberWithInteger:v12 - 1];
            *(_DWORD *)buf = 138412802;
            v127 = v23;
            __int16 v128 = 2112;
            v129 = v24;
            __int16 v130 = 2112;
            v131 = v25;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Attempt to turn to page %@ when we have %@ pages -- setting pageOffset to %@", buf, 0x20u);

            int64_t v21 = (int64_t)(v12 - 1);
          }
        }
        v26 = [(BKWebViewProxy *)self loader];
        double v16 = [v26 webView];

        [v16 frame];
        double v28 = v27;
        double v30 = v29;
        CGFloat v113 = v32;
        CGFloat v114 = v31;
        id v33 = [v16 scrollView];
        int64_t v34 = [v16 be_estimatedContentSizeValue];
        unint64_t v35 = [v16 be_requestedContentOffset];
        [v33 contentOffset];
        double v37 = v36;
        double v39 = v38;
        [v33 contentSize];
        double v41 = v40;
        double v43 = v42;
        if (v35)
        {
          [v35 CGPointValue];
          CGFloat v45 = v44;
          CGFloat v47 = v46;
          CGRectMakeWithSize();
          v138.CGFloat x = v45;
          v138.CGFloat y = v47;
          if (CGRectContainsPoint(v139, v138))
          {
            if (v37 == CGPointZero.x && v39 == CGPointZero.y)
            {
              double v39 = v47;
              double v37 = v45;
            }
          }
          else
          {
            int64_t v111 = v21;
            v48 = _AEBookPluginsPageTurnLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v115 = v35;
              *(CGFloat *)v125 = v45;
              *(CGFloat *)&v125[1] = v47;
              +[NSValue valueWithBytes:v125 objCType:"{CGPoint=dd}"];
              v118 = v33;
              v50 = v49 = v34;
              *(double *)v124 = v41;
              *(double *)&v124[1] = v43;
              v51 = +[NSValue valueWithBytes:v124 objCType:"{CGSize=dd}"];
              *(_DWORD *)buf = 138412546;
              v127 = v50;
              __int16 v128 = 2112;
              v129 = v51;
              _os_log_impl(&dword_0, v48, OS_LOG_TYPE_ERROR, "Requested content offset outside availabe content! offset: %@ contentSize: %@", buf, 0x16u);

              unint64_t v35 = v115;
              int64_t v34 = v49;
              id v33 = v118;
            }

            int64_t v21 = v111;
          }
        }
        if ([v10 isScroll])
        {
          if (v34)
          {
            double v116 = v37;
            double v119 = v39;
            [v34 CGSizeValue];
            CGRectMakeWithSize();
            CGFloat v53 = v52;
            CGFloat v55 = v54;
            double v110 = v43;
            double v112 = v41;
            double v56 = v28;
            CGFloat v58 = v57;
            CGFloat v59 = v30;
            CGFloat v61 = v60;
            CGRectMakeWithSize();
            v146.origin.CGFloat x = v62;
            v146.origin.CGFloat y = v63;
            v146.size.CGFloat width = v64;
            v146.size.CGFloat height = v65;
            v140.origin.CGFloat x = v53;
            v140.origin.CGFloat y = v55;
            v140.size.CGFloat width = v58;
            CGFloat v66 = v56;
            double v41 = v112;
            v140.size.CGFloat height = v61;
            CGRect v141 = CGRectUnion(v140, v146);
            CGFloat width = v141.size.width;
            CGFloat height = v141.size.height;
            v141.origin.CGFloat x = v66;
            v141.origin.CGFloat y = v59;
            v141.size.CGFloat width = v114;
            v141.size.CGFloat height = v113;
            if (v112 <= CGRectGetWidth(v141))
            {
              v142.origin.CGFloat x = v66;
              v142.origin.CGFloat y = v59;
              v142.size.CGFloat width = v114;
              v142.size.CGFloat height = v113;
              double v43 = v110;
              double v37 = v116;
              double v39 = v119;
              if (v110 <= CGRectGetHeight(v142))
              {
                double v43 = height;
                double v41 = width;
              }
            }
            else
            {
              double v37 = v116;
              double v39 = v119;
              double v43 = v110;
            }
          }
          if (objc_msgSend(v10, "layout", *(void *)&v110) == (char *)&dword_0 + 2)
          {
            [v10 contentLayoutSize];
            double v79 = v78;
            [v10 contentInsets];
            double v81 = -(v80 - v79 * (double)v21);
            [v33 bounds];
            double v82 = v43 - CGRectGetHeight(v143);
            if (v81 < v82) {
              double v82 = v81;
            }
            if (v82 >= 0.0) {
              double v39 = v82;
            }
            else {
              double v39 = 0.0;
            }
          }
          else if ([v10 layout] == (char *)&dword_0 + 3)
          {
            [(BKWebViewProxy *)self scrollingPageWidthForPaginationMode:a4 configuration:v10];
            double v84 = v83;
            [v10 contentInsets];
            if (a5 == 1) {
              double v87 = v41 - v84 * (double)(v21 + 1) + v86;
            }
            else {
              double v87 = -(v85 - v84 * (double)v21);
            }
            [v33 bounds];
            double v96 = v41 - CGRectGetWidth(v145);
            if (v87 < v96) {
              double v96 = v87;
            }
            if (v96 >= 0.0) {
              double v37 = v96;
            }
            else {
              double v37 = 0.0;
            }
          }
        }
        else
        {
          [v10 contentLayoutSize];
          double v70 = v69;
          [v10 gutterWidth];
          double v72 = v71;
          [v10 gutterWidth];
          if (v21)
          {
            float v74 = v70 + v72;
            int v75 = (int)((float)((float)(uint64_t)v12 * v74) - v73);
            double v76 = (float)((float)v21 * v74);
            if (v76 > (double)v75) {
              double v76 = (double)v75;
            }
          }
          else
          {
            double v76 = 0.0;
          }
          v77 = v35;
          if (a5 == 1)
          {
            if ([v10 layout] == (char *)&dword_0 + 2)
            {
              double v76 = -v76;
            }
            else
            {
              v88 = [(BKWebViewProxy *)self loader];
              v89 = [v88 webView];
              [v89 bounds];
              double v90 = CGRectGetWidth(v144);

              [v10 contentLayoutSize];
              double v76 = v90 - (v76 + v91);
            }
          }
          v92 = [(BKWebViewProxy *)self loader];
          v93 = [v92 webView];
          v94 = [v93 be_contentView];
          double v39 = 0.0;
          [v94 convertPoint:v33 toView:v76];
          double v37 = v95;

          unint64_t v35 = v77;
        }
        v97 = _AEBookPluginsLifeCycleLog();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          *(double *)v123 = v37;
          *(double *)&v123[1] = v39;
          v98 = +[NSValue valueWithBytes:v123 objCType:"{CGPoint=dd}"];
          v117 = v35;
          [v33 contentOffset];
          v122[0] = v99;
          v122[1] = v100;
          +[NSValue valueWithBytes:v122 objCType:"{CGPoint=dd}"];
          v120 = v33;
          v102 = v101 = v34;
          [v120 contentSize];
          v121[0] = v103;
          v121[1] = v104;
          v105 = +[NSValue valueWithBytes:v121 objCType:"{CGSize=dd}"];
          v106 = [(BKWebViewProxy *)self loader];
          v107 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v106 ordinal]);
          *(_DWORD *)buf = 138544642;
          v127 = v98;
          __int16 v128 = 2114;
          v129 = v102;
          __int16 v130 = 2114;
          v131 = v117;
          __int16 v132 = 2114;
          v133 = v105;
          __int16 v134 = 2114;
          v135 = v101;
          __int16 v136 = 2114;
          v137 = v107;
          _os_log_impl(&dword_0, v97, OS_LOG_TYPE_DEFAULT, "BKWVP scrollToPage contentOffset:%{public}@ currentScrollViewOffset:%{public}@ requestedContentOffset:%{public}@ scrollViewContentSize:%{public}@ estimatedContentSize:%{public}@ ordinal:%{public}@", buf, 0x3Eu);

          unint64_t v35 = v117;
          int64_t v34 = v101;
          id v33 = v120;
        }
        v108 = [(BKWebViewProxy *)self loader];
        v109 = [v108 webView];
        [v109 be_setContentOffset:v37, v39];

        goto LABEL_59;
      }
      double v16 = _AEBookPluginsPageTurnLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        double v17 = +[NSNumber numberWithInteger:0x7FFFFFFFFFFFFFFFLL];
        id v20 = +[NSNumber numberWithInteger:a3];
        *(_DWORD *)buf = 138543618;
        v127 = v17;
        __int16 v128 = 2114;
        v129 = v20;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Attempt to set invalid offset - totalPages:%{public}@ pageOffset:%{public}@", buf, 0x16u);

        goto LABEL_12;
      }
    }
LABEL_59:
  }
}

- (BKWK2WebViewLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
}

- (BOOL)hasWKWebView
{
  return self->_hasWKWebView;
}

- (void)setHasWKWebView:(BOOL)a3
{
  self->_hasWKWebView = a3;
}

- (CGRect)localFrame
{
  double x = self->_localFrame.origin.x;
  double y = self->_localFrame.origin.y;
  double width = self->_localFrame.size.width;
  double height = self->_localFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLocalFrame:(CGRect)a3
{
  self->_localFrame = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
}

@end