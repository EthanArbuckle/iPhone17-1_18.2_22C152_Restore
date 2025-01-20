@interface ICPaperKitTextFindingResult
+ (double)scaleForDrawingBounds:(CGRect)a3;
- (CGRect)frameForHighlightInTextView:(id)a3;
- (CGRect)searchResultRect;
- (id)framesForHighlightInTextView:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)order;
- (void)generateFindPreviewImageForPaperKitAttachment:(id)a3 completion:(id)a4;
- (void)selectInTextView:(id)a3;
- (void)setOrder:(unint64_t)a3;
- (void)setSearchResultRect:(CGRect)a3;
@end

@implementation ICPaperKitTextFindingResult

+ (double)scaleForDrawingBounds:(CGRect)a3
{
  double v3 = *MEMORY[0x263F14CE0];
  return CGRectGetWidth(a3) / v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICPaperKitTextFindingResult;
  int64_t v5 = [(ICTextFindingResult *)&v10 compare:v4];
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      unint64_t v7 = [(ICPaperKitTextFindingResult *)self order];
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

- (CGRect)frameForHighlightInTextView:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [v4 textStorage];
  id v6 = objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x263F814A0], -[ICTextFindingResult range](self, "range"), 0);

  if (v6)
  {
    unint64_t v7 = objc_msgSend(v4, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v6, -[ICTextFindingResult range](self, "range"), 0);
    os_log_t v8 = [v7 view];
    v9 = [v8 window];

    if (v9)
    {
      [v8 bounds];
      double v11 = v10;
      double v13 = v12;
      double Width = v14;
      double v17 = v16;
    }
    else
    {
      uint64_t v22 = [(ICTextFindingResult *)self range];
      objc_msgSend(v4, "ic_rectForRange:", v22, v23);
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      objc_msgSend(v4, "ic_textContainerOrigin");
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      v71.origin.double x = v25;
      v71.origin.double y = v27;
      v71.size.width = v29;
      v71.size.double height = v31;
      CGRect v72 = CGRectOffset(v71, v33, v35);
      double height = v72.size.height;
      double v11 = floor(v72.origin.x);
      double v13 = floor(v72.origin.y);
      [v4 bounds];
      double Width = CGRectGetWidth(v73);
      double v17 = ceil(height);
    }
    CGFloat v66 = v11;
    +[ICPaperKitTextFindingResult scaleForDrawingBounds:](ICPaperKitTextFindingResult, "scaleForDrawingBounds:", v11, v13, Width, v17);
    CGFloat v38 = v37;
    [(ICPaperKitTextFindingResult *)self searchResultRect];
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    CGAffineTransformMakeScale(&v67, v38, v38);
    v74.origin.double x = v40;
    v74.origin.double y = v42;
    v74.size.width = v44;
    v74.size.double height = v46;
    CGRect v75 = CGRectApplyAffineTransform(v74, &v67);
    CGRect v76 = CGRectIntegral(v75);
    double x = v76.origin.x;
    double y = v76.origin.y;
    double v49 = v76.size.width;
    double v50 = v76.size.height;
    v51 = [v8 window];
    if (v51)
    {
      objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v8, x, y, v49, v50);
    }
    else
    {
      v77.origin.double x = v66;
      v77.origin.double y = v13;
      v77.size.width = Width;
      v77.size.double height = v17;
      ddouble x = CGRectGetMinX(v77);
      v78.origin.double x = v66;
      v78.origin.double y = v13;
      v78.size.width = Width;
      v78.size.double height = v17;
      CGFloat MinY = CGRectGetMinY(v78);
      v79.origin.double x = x;
      v79.origin.double y = y;
      v79.size.width = v49;
      v79.size.double height = v50;
      *(CGRect *)&CGFloat v52 = CGRectOffset(v79, dx, MinY);
    }
    CGFloat v57 = v52;
    CGFloat v58 = v53;
    CGFloat v59 = v54;
    CGFloat v60 = v55;

    v80.origin.double x = v57;
    v80.origin.double y = v58;
    v80.size.width = v59;
    v80.size.double height = v60;
    CGRect v81 = CGRectInset(v80, -8.0, -8.0);
    CGFloat v18 = v81.origin.x;
    CGFloat v19 = v81.origin.y;
    CGFloat v20 = v81.size.width;
    CGFloat v21 = v81.size.height;
  }
  else
  {
    CGFloat v18 = *MEMORY[0x263F001A8];
    CGFloat v19 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v20 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v21 = *(double *)(MEMORY[0x263F001A8] + 24);
    os_log_t v8 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v69 = [(ICTextFindingResult *)self range];
      _os_log_impl(&dword_20BE60000, v8, OS_LOG_TYPE_DEFAULT, "Couldn't find text attachment for PaperKit text finding result at %ld", buf, 0xCu);
    }
    unint64_t v7 = v8;
  }

  double v61 = v18;
  double v62 = v19;
  double v63 = v20;
  double v64 = v21;
  result.size.double height = v64;
  result.size.width = v63;
  result.origin.double y = v62;
  result.origin.double x = v61;
  return result;
}

- (id)framesForHighlightInTextView:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  [(ICPaperKitTextFindingResult *)self frameForHighlightInTextView:a3];
  double v3 = objc_msgSend(MEMORY[0x263F08D40], "ic_valueWithRect:");
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)generateFindPreviewImageForPaperKitAttachment:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICPaperKitTextFindingResult *)self searchResultRect];
  CGRect v21 = CGRectInset(v20, -100.0, -100.0);
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  double v12 = [MEMORY[0x263F5B460] imageGeneratorWithPaperAttachment:v7 useActivePaper:1];

  [v12 setSixChannelBlendingEnabled:0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__ICPaperKitTextFindingResult_generateFindPreviewImageForPaperKitAttachment_completion___block_invoke;
  v14[3] = &unk_2640BA560;
  id v15 = v6;
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  id v13 = v6;
  objc_msgSend(v12, "imageWithBounds:completion:", v14, x, y, width, height);
}

uint64_t __88__ICPaperKitTextFindingResult_generateFindPreviewImageForPaperKitAttachment_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(double, double, double, double))(result + 16))(*(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  return result;
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

- (CGRect)searchResultRect
{
  double x = self->_searchResultRect.origin.x;
  double y = self->_searchResultRect.origin.y;
  double width = self->_searchResultRect.size.width;
  double height = self->_searchResultRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSearchResultRect:(CGRect)a3
{
  self->_searchResultRect = a3;
}

@end