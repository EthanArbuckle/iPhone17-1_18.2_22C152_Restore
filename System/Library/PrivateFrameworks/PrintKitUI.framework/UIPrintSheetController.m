@interface UIPrintSheetController
- (CGSize)getNUpLayout;
- (CGSize)sizeForSheetNum:(int64_t)a3 showingPageView:(BOOL)a4;
- (UIPrintInfo)printInfo;
- (UIPrintPagesController)pagesController;
- (UIPrintSheetController)initWithPrintInfo:(id)a3 printPageImageDelegate:(id)a4;
- (id)imageForSheetNum:(int64_t)a3 showingPageView:(BOOL)a4;
- (int64_t)convertSelectionPageNumToPageNum:(int64_t)a3;
- (int64_t)numberOfPagesInSelection;
- (int64_t)numberOfSheets:(BOOL)a3;
- (int64_t)pageOffsetForRow:(int64_t)a3 column:(int64_t)a4 nUpLayout:(CGSize)a5;
- (void)clearPagesCache;
- (void)dealloc;
- (void)generateWebKitThumbnailsWithCompletionBlock:(id)a3;
- (void)recalculateWebKitPageCount;
- (void)setPagesController:(id)a3;
- (void)setPrintInfo:(id)a3;
- (void)updateSelectionPageMap;
@end

@implementation UIPrintSheetController

- (UIPrintSheetController)initWithPrintInfo:(id)a3 printPageImageDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIPrintSheetController;
  v8 = [(UIPrintSheetController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(UIPrintSheetController *)v8 setPrintInfo:v6];
    v10 = [[UIPrintPagesController alloc] initWithPrintInfo:v6 delegate:v7];
    [(UIPrintSheetController *)v9 setPagesController:v10];
  }
  return v9;
}

- (void)dealloc
{
  selectionPageMap = self->_selectionPageMap;
  if (selectionPageMap) {
    free(selectionPageMap);
  }
  v4.receiver = self;
  v4.super_class = (Class)UIPrintSheetController;
  [(UIPrintSheetController *)&v4 dealloc];
}

- (int64_t)numberOfPagesInSelection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(UIPrintSheetController *)self printInfo];
  v3 = [v2 pageRanges];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) rangeValue];
        v6 += v9;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)updateSelectionPageMap
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  selectionPageMap = self->_selectionPageMap;
  if (selectionPageMap) {
    free(selectionPageMap);
  }
  uint64_t v4 = (int64_t *)malloc_type_calloc([(UIPrintSheetController *)self numberOfPagesInSelection], 8uLL, 0x100004000313F17uLL);
  self->_selectionPageMap = v4;
  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [(UIPrintSheetController *)self printInfo];
    int64_t v6 = [v5 pageRanges];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = [*(id *)(*((void *)&v17 + 1) + 8 * v11) rangeValue];
          if (v13)
          {
            uint64_t v14 = v13 + v9;
            uint64_t v15 = v12 + 1;
            uint64_t v16 = &self->_selectionPageMap[v9];
            do
            {
              *v16++ = v15++;
              --v13;
            }
            while (v13);
            uint64_t v9 = v14;
          }
          ++v11;
        }
        while (v11 != v8);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

- (int64_t)numberOfSheets:(BOOL)a3
{
  uint64_t v5 = [(UIPrintSheetController *)self printInfo];
  int64_t v6 = [v5 pageCount];

  if (!a3)
  {
    uint64_t v7 = [(UIPrintSheetController *)self numberOfPagesInSelection];
    if (v7 >= 1)
    {
      float v8 = (float)v7;
      uint64_t v9 = [(UIPrintSheetController *)self printInfo];
      uint64_t v10 = [v9 numNUpColumns];
      uint64_t v11 = [(UIPrintSheetController *)self printInfo];
      int64_t v6 = vcvtps_s32_f32(v8 / (float)([v11 numNUpRows] * v10));
    }
  }
  return v6;
}

- (CGSize)sizeForSheetNum:(int64_t)a3 showingPageView:(BOOL)a4
{
  uint64_t v7 = [(UIPrintSheetController *)self pagesController];
  [v7 sizeForPageNum:a3];
  double v9 = v8;
  double v11 = v10;

  if (!a4)
  {
    uint64_t v12 = [(UIPrintSheetController *)self printInfo];
    uint64_t v13 = [v12 numNUpRows];
    uint64_t v14 = [(UIPrintSheetController *)self printInfo];
    uint64_t v15 = [v14 numNUpColumns];

    if (v13 != v15)
    {
      double v16 = v9 / v11;
      if (v9 / v11 <= 1.0) {
        double v9 = v11 / v16;
      }
      else {
        double v11 = v9 * v16;
      }
    }
  }
  double v17 = v9;
  double v18 = v11;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)imageForSheetNum:(int64_t)a3 showingPageView:(BOOL)a4
{
  if (a4)
  {
    int64_t v6 = [(UIPrintSheetController *)self pagesController];
    uint64_t v7 = v6;
    int64_t v8 = a3;
    uint64_t v9 = 1;
LABEL_20:
    uint64_t v14 = [v6 imageForPageNum:v8 showingPageView:v9];

    goto LABEL_21;
  }
  double v10 = [(UIPrintSheetController *)self printInfo];
  char v11 = [v10 nUpActive];

  if ((v11 & 1) == 0)
  {
    int64_t v34 = [(UIPrintSheetController *)self convertSelectionPageNumToPageNum:a3];
    int64_t v6 = [(UIPrintSheetController *)self pagesController];
    uint64_t v7 = v6;
    int64_t v8 = v34;
    uint64_t v9 = 0;
    goto LABEL_20;
  }
  [(UIPrintSheetController *)self sizeForSheetNum:a3 showingPageView:0];
  uint64_t v14 = 0;
  double v15 = ceil(v12);
  if (v15 > 0.0)
  {
    double v16 = v13;
    if (v13 > 0.0)
    {
      double v17 = v12;
      double v18 = [(UIPrintSheetController *)self printInfo];
      if ([v18 outputType] != 2)
      {
        long long v19 = [(UIPrintSheetController *)self printInfo];
        if ([v19 outputType] != 3)
        {
          v36 = [(UIPrintSheetController *)self printInfo];
          uint64_t v37 = [v36 currentPrinter];
          if (v37)
          {
            v38 = (void *)v37;
            v39 = [(UIPrintSheetController *)self printInfo];
            v40 = [v39 currentPrinter];
            char v41 = [v40 supportsColor];

            if ((v41 & 1) == 0) {
              goto LABEL_10;
            }
          }
          else
          {
          }
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
LABEL_11:
          v21 = DeviceRGB;
          uint64_t v14 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v16, 8uLL, vcvtd_n_u64_f64(v15, 2uLL), DeviceRGB, 1u);
          CGColorSpaceRelease(v21);
          if (v14)
          {
            eraseCGBitmapContext(v14);
            CGContextScaleCTM(v14, v15 / v17, v16 / v16);
            CGContextSaveGState(v14);
            uint64_t v22 = [(UIPrintSheetController *)self printInfo];
            int v23 = [v22 flipHorizontal];

            if (v23)
            {
              CGContextTranslateCTM(v14, v17, 0.0);
              CGContextScaleCTM(v14, -1.0, 1.0);
            }
            [(UIPrintSheetController *)self getNUpLayout];
            double v25 = v24;
            double v27 = v26;
            double v28 = v17 / v24;
            BOOL v29 = v26 == v25;
            double v30 = v16 / v26;
            if (v29)
            {
              double v42 = v28 / v17;
              double v43 = v30 / v16;
              if (v42 >= v43) {
                double v42 = v43;
              }
              double v58 = v17;
              double v59 = v42;
              double v57 = v16;
            }
            else
            {
              double v31 = v28 / v16;
              double v32 = v30 / v17;
              if (v31 >= v32) {
                double v33 = v32;
              }
              else {
                double v33 = v31;
              }
              double v59 = v33;
              CGContextTranslateCTM(v14, (v17 + -(v16 * v33) * v25) * 0.5, (v16 + -(v17 * v33) * v27) * 0.5);
              double v57 = v17;
              double v58 = v16;
            }
            v44 = [(UIPrintSheetController *)self printInfo];
            uint64_t v45 = [v44 pageCount];

            if (v27 > 0.0)
            {
              uint64_t v46 = (uint64_t)(v27 * v25 * (double)(a3 - 1));
              double v47 = 0.0;
              do
              {
                if (v25 <= 0.0)
                {
                  double v47 = v47 + 1.0;
                }
                else
                {
                  uint64_t v48 = (uint64_t)v47;
                  double v47 = v47 + 1.0;
                  double v49 = 0.0;
                  do
                  {
                    uint64_t v50 = -[UIPrintSheetController pageOffsetForRow:column:nUpLayout:](self, "pageOffsetForRow:column:nUpLayout:", v48, (uint64_t)v49, v25, v27)+ v46;
                    if (v50 < v45)
                    {
                      uint64_t v51 = v50 + 1;
                      if ([(UIPrintSheetController *)self convertSelectionPageNumToPageNum:v50 + 1] >= 1)
                      {
                        v52 = [(UIPrintSheetController *)self pagesController];
                        v53 = objc_msgSend(v52, "imageForPageNum:showingPageView:", -[UIPrintSheetController convertSelectionPageNumToPageNum:](self, "convertSelectionPageNumToPageNum:", v51), 0);

                        if (v53)
                        {
                          CGContextSaveGState(v14);
                          CGContextTranslateCTM(v14, v58 * (v59 * v49), v57 * (v59 * (v27 - v47)));
                          long long v62 = 0u;
                          long long v63 = 0u;
                          long long v61 = 0u;
                          CGContextGetBaseCTM();
                          CGContextGetCTM(&v60, v14);
                          CGContextSetBaseCTM();
                          id v54 = v53;
                          v55 = (CGImage *)[v54 CGImage];
                          v65.origin.x = 0.0;
                          v65.origin.y = 0.0;
                          v65.size.width = v59 * v58;
                          v65.size.height = v59 * v57;
                          CGContextDrawImage(v14, v65, v55);
                          CGContextSetBaseCTM();
                          CGContextRestoreGState(v14);
                        }
                      }
                    }
                    double v49 = v49 + 1.0;
                  }
                  while (v49 < v25);
                }
              }
              while (v47 < v27);
            }
            CGImageRef Image = CGBitmapContextCreateImage(v14);
            CGContextRelease(v14);
            if (Image)
            {
              uint64_t v14 = (CGContext *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:Image];
              CFRelease(Image);
            }
            else
            {
              uint64_t v14 = 0;
            }
          }
          goto LABEL_21;
        }
      }
LABEL_10:
      DeviceRGB = CGColorSpaceCreateDeviceGray();
      goto LABEL_11;
    }
  }
LABEL_21:
  return v14;
}

- (int64_t)convertSelectionPageNumToPageNum:(int64_t)a3
{
  if (!self->_selectionPageMap) {
    [(UIPrintSheetController *)self updateSelectionPageMap];
  }
  if ([(UIPrintSheetController *)self numberOfPagesInSelection] < a3) {
    return 0;
  }
  if (a3 <= 1) {
    int64_t v6 = 1;
  }
  else {
    int64_t v6 = a3;
  }
  return self->_selectionPageMap[v6 - 1];
}

- (CGSize)getNUpLayout
{
  v3 = [(UIPrintSheetController *)self printInfo];
  double v4 = (double)[v3 numNUpRows];

  uint64_t v5 = [(UIPrintSheetController *)self printInfo];
  double v6 = (double)[v5 numNUpColumns];

  uint64_t v7 = [(UIPrintSheetController *)self pagesController];
  [v7 sizeForPageNum:1];
  double v9 = v8;
  double v11 = v10;

  if (v6 >= v4) {
    double v12 = v6;
  }
  else {
    double v12 = v4;
  }
  if (v6 >= v4) {
    double v13 = v4;
  }
  else {
    double v13 = v6;
  }
  if (v11 <= v9) {
    double v14 = v13;
  }
  else {
    double v14 = v12;
  }
  if (v11 > v9) {
    double v12 = v13;
  }
  result.height = v12;
  result.width = v14;
  return result;
}

- (int64_t)pageOffsetForRow:(int64_t)a3 column:(int64_t)a4 nUpLayout:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v9 = [(UIPrintSheetController *)self printInfo];
  uint64_t v10 = [v9 nUpLayoutDirection];
  double v11 = width - (double)(a4 + 1);
  double v12 = v11 + (double)a3 * width;
  double v13 = (double)a3 + v11 * height;
  double v14 = (double)a4 + (double)a3 * width;
  if (v10 == 3) {
    double v14 = v13;
  }
  if (v10 == 2) {
    double v14 = (double)a3 + (double)a4 * height;
  }
  if (v10 == 1) {
    double v14 = v12;
  }
  int64_t v15 = (uint64_t)v14;

  return v15;
}

- (void)clearPagesCache
{
  id v2 = [(UIPrintSheetController *)self pagesController];
  [v2 clearPagesCache];
}

- (void)generateWebKitThumbnailsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPrintSheetController *)self pagesController];
  [v5 generateWebKitThumbnailsWithCompletionBlock:v4];
}

- (void)recalculateWebKitPageCount
{
  id v2 = [(UIPrintSheetController *)self pagesController];
  [v2 recalculateWebKitPageCount];
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
}

- (UIPrintPagesController)pagesController
{
  return self->_pagesController;
}

- (void)setPagesController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pagesController, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
}

@end