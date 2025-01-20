@interface ICPencilKitTextFindingResult
- (CGSize)drawingSize;
- (PKSearchQueryItem)searchQueryItem;
- (double)cornerRadius;
- (id)framesForHighlightInTextView:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)order;
- (void)selectInTextView:(id)a3;
- (void)setDrawingSize:(CGSize)a3;
- (void)setOrder:(unint64_t)a3;
- (void)setSearchQueryItem:(id)a3;
@end

@implementation ICPencilKitTextFindingResult

- (double)cornerRadius
{
  return 5.0;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICPencilKitTextFindingResult;
  int64_t v5 = [(ICTextFindingResult *)&v10 compare:v4];
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      unint64_t v7 = [(ICPencilKitTextFindingResult *)self order];
      unint64_t v8 = [v6 order];

      if (v7 < v8) {
        int64_t v5 = -1;
      }
      else {
        int64_t v5 = v7 != v8;
      }
    }
    else
    {
      int64_t v5 = 0;
    }
  }

  return v5;
}

- (id)framesForHighlightInTextView:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [v4 textStorage];
  id v6 = objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x263F814A0], -[ICTextFindingResult range](self, "range"), 0);

  if (v6)
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      unint64_t v7 = objc_msgSend(v4, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v6, -[ICTextFindingResult range](self, "range"), 0);
    }
    else
    {
      objc_super v10 = [v4 layoutManager];
      unint64_t v7 = objc_msgSend(v10, "viewProviderForTextAttachment:characterIndex:", v6, -[ICTextFindingResult range](self, "range"));
    }
    os_log_t v8 = [v7 view];
    v11 = [v8 window];

    if (v11)
    {
      [v8 bounds];
      double v13 = v12;
      double v15 = v14;
      double Width = v16;
      double v19 = v18;
    }
    else
    {
      uint64_t v20 = [(ICTextFindingResult *)self range];
      objc_msgSend(v4, "ic_rectForRange:", v20, v21);
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      objc_msgSend(v4, "ic_textContainerOrigin");
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      v81.origin.double x = v23;
      v81.origin.double y = v25;
      v81.size.width = v27;
      v81.size.double height = v29;
      CGRect v82 = CGRectOffset(v81, v31, v33);
      double height = v82.size.height;
      double v13 = floor(v82.origin.x);
      double v15 = floor(v82.origin.y);
      [v4 bounds];
      double Width = CGRectGetWidth(v83);
      double v19 = ceil(height);
    }
    CGFloat v35 = v13;
    CGFloat v72 = v15;
    +[ICPaperKitTextFindingResult scaleForDrawingBounds:](ICPaperKitTextFindingResult, "scaleForDrawingBounds:", v13, v15, Width, v19);
    CGFloat v37 = v36;
    v38 = [(ICPencilKitTextFindingResult *)self searchQueryItem];
    [v38 bounds];
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;

    CGAffineTransformMakeScale(&v73, v37, v37);
    v84.origin.double x = v40;
    v84.origin.double y = v42;
    v84.size.width = v44;
    v84.size.double height = v46;
    CGRect v85 = CGRectApplyAffineTransform(v84, &v73);
    CGRect v86 = CGRectIntegral(v85);
    double x = v86.origin.x;
    double y = v86.origin.y;
    double v49 = v86.size.width;
    double v50 = v86.size.height;
    v51 = [v8 window];
    if (v51)
    {
      -[NSObject convertRect:toView:](v8, "convertRect:toView:", v4, x, y, v49, v50);
    }
    else
    {
      v87.origin.double x = v35;
      v87.origin.double y = v72;
      v87.size.width = Width;
      v87.size.double height = v19;
      ddouble x = CGRectGetMinX(v87);
      v88.origin.double x = v35;
      v88.origin.double y = v72;
      v88.size.width = Width;
      v88.size.double height = v19;
      CGFloat MinY = CGRectGetMinY(v88);
      v89.origin.double x = x;
      v89.origin.double y = y;
      v89.size.width = v49;
      v89.size.double height = v50;
      *(CGRect *)&CGFloat v52 = CGRectOffset(v89, dx, MinY);
    }
    CGFloat v57 = v52;
    CGFloat v58 = v53;
    CGFloat v59 = v54;
    CGFloat v60 = v55;

    v90.origin.double x = v57;
    v90.origin.double y = v58;
    v90.size.width = v59;
    v90.size.double height = v60;
    CGRect v91 = CGRectInset(v90, -8.0, -8.0);
    double v61 = v91.origin.x;
    double v62 = v91.origin.y;
    double v63 = v91.size.width;
    double v64 = v91.size.height;
    v65 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      v68 = [(ICPencilKitTextFindingResult *)self searchQueryItem];
      [v68 bounds];
      v69 = NSStringFromRect(v92);
      v93.origin.double x = v61;
      v93.origin.double y = v62;
      v93.size.width = v63;
      v93.size.double height = v64;
      v70 = NSStringFromRect(v93);
      *(_DWORD *)buf = 138412546;
      uint64_t v76 = (uint64_t)v69;
      __int16 v77 = 2112;
      v78 = v70;
      _os_log_debug_impl(&dword_20BE60000, v65, OS_LOG_TYPE_DEBUG, "Converted frame for PencilKit find result from %@ to %@", buf, 0x16u);
    }
    v66 = objc_msgSend(MEMORY[0x263F08D40], "ic_valueWithRect:", v61, v62, v63, v64);
    v74 = v66;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v74 count:1];
  }
  else
  {
    os_log_t v8 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v76 = [(ICTextFindingResult *)self range];
      _os_log_impl(&dword_20BE60000, v8, OS_LOG_TYPE_DEFAULT, "Couldn't find text attachment for PencilKit text finding result at %ld", buf, 0xCu);
    }
    v9 = (void *)MEMORY[0x263EFFA68];
    unint64_t v7 = v8;
  }

  return v9;
}

- (void)selectInTextView:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setSelectedRange:", -[ICTextFindingResult range](self, "range"), 0);
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (CGSize)drawingSize
{
  double width = self->_drawingSize.width;
  double height = self->_drawingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDrawingSize:(CGSize)a3
{
  self->_drawingSize = a3;
}

- (PKSearchQueryItem)searchQueryItem
{
  return self->_searchQueryItem;
}

- (void)setSearchQueryItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end