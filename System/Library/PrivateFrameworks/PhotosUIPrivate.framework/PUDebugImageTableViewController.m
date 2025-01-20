@interface PUDebugImageTableViewController
- (NSArray)tableData;
- (id)jobNumberFromPath:(id)a3;
- (id)pidFromPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setTableData:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUDebugImageTableViewController

- (void).cxx_destruct
{
}

- (void)setTableData:(id)a3
{
}

- (NSArray)tableData
{
  return (NSArray *)objc_getProperty(self, a2, 1024, 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v5 = -[NSArray objectAtIndex:](self->_tableData, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [v5 objectForKeyedSubscript:@"path"];
  v8 = [v6 fileURLWithPath:v7];

  v9 = [v8 pathExtension];
  v10 = [v9 lowercaseString];
  int v11 = [v10 isEqual:@"pdf"];

  if (v11)
  {
    v12 = CGPDFDocumentCreateWithURL((CFURLRef)v8);
    Page = CGPDFDocumentGetPage(v12, 1uLL);
    CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
    unsigned int width = BoxRect.size.width;
    unsigned int height = BoxRect.size.height;
    unsigned int v16 = BoxRect.size.width * BoxRect.size.height;
    if (v16 >= 0x8F0D181)
    {
      double v17 = 150000000.0 / (double)v16;
      unsigned int width = (v17 * (double)width);
      unsigned int height = (v17 * (double)height);
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v19 = CGBitmapContextCreate(0, width, height, 8uLL, 0, DeviceRGB, 2u);
    CGContextScaleCTM(v19, 1.0, 1.0);
    v53.size.unsigned int width = (double)width;
    v53.size.unsigned int height = (double)height;
    memset(&v51, 0, sizeof(v51));
    v53.origin.x = 0.0;
    v53.origin.y = 0.0;
    CGPDFPageGetDrawingTransform(&v51, Page, kCGPDFCropBox, v53, 0, 1);
    CGAffineTransform transform = v51;
    CGContextConcatCTM(v19, &transform);
    CGContextDrawPDFPage(v19, Page);
    CGPDFDocumentRelease(v12);
    Image = CGBitmapContextCreateImage(v19);
    v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:Image scale:0 orientation:1.0];
    CGImageRelease(Image);
    CGContextRelease(v19);
    CGColorSpaceRelease(DeviceRGB);
    v22 = [(PUDebugImageTableViewController *)self view];
    [v22 bounds];
    double v24 = v23;
    [v21 size];
    double v26 = v24 / v25;

    v27 = [(PUDebugImageTableViewController *)self view];
    [v27 bounds];
    double v29 = v28;
    [v21 size];
    double v31 = v29 / v30;

    [v21 size];
    double v33 = v32;
    [v21 size];
    v35 = -[PUScrollImageView initWithFrame:image:]([PUScrollImageView alloc], "initWithFrame:image:", v21, 0.0, 0.0, v33, v34);
    v36 = v35;
    if (v26 >= v31) {
      double v37 = v31;
    }
    else {
      double v37 = v26;
    }
    [(PUScrollImageView *)v35 setMinimumZoomScale:v37];
    [(PUScrollImageView *)v36 setMaximumZoomScale:6.0];
    [(PUScrollImageView *)v36 setZoomScale:1 animated:v37];
    id v38 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    [v38 setView:v36];
    [(PUDebugImageTableViewController *)self presentViewController:v38 animated:1 completion:0];
  }
  else
  {
    v39 = [v8 pathExtension];
    v40 = [v39 lowercaseString];
    int v41 = [v40 isEqual:@"txt"];

    if (v41)
    {
      v42 = NSString;
      v43 = [v8 path];
      id v49 = 0;
      v44 = [v42 stringWithContentsOfFile:v43 encoding:4 error:&v49];
      id v45 = v49;

      if (v45)
      {
        NSLog(&cfstr_Purenderdebugc.isa, v45);
      }
      else
      {
        v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DD8]), "initWithFrame:", 0.0, 0.0, 1024.0, 1024.0);
        [v46 setText:v44];
        [v46 setMinimumZoomScale:0.5];
        [v46 setMaximumZoomScale:1.5];
        v47 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09E8]];
        [v46 setFont:v47];

        id v48 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
        [v48 setView:v46];
        [(PUDebugImageTableViewController *)self presentViewController:v48 animated:1 completion:0];
      }
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"SimpleTableItem"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"SimpleTableItem"];
  }
  v8 = -[NSArray objectAtIndex:](self->_tableData, "objectAtIndex:", [v6 row]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v9 setDateFormat:@"MMM dd, HH:mm:ss"];
  v10 = [v8 objectForKeyedSubscript:@"date"];
  uint64_t v11 = [v9 stringFromDate:v10];

  v12 = (void *)MEMORY[0x1E4F28B68];
  v13 = [v8 objectForKeyedSubscript:@"size"];
  uint64_t v14 = objc_msgSend(v12, "stringFromByteCount:countStyle:", objc_msgSend(v13, "unsignedLongLongValue"), 0);

  v15 = [v8 objectForKeyedSubscript:@"filename"];
  uint64_t v16 = [v15 rangeOfString:@"_"];
  v40 = (void *)v14;
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = [v15 substringFromIndex:v16 + 1];

    v15 = (void *)v17;
  }
  v18 = [v8 objectForKeyedSubscript:@"jobNumber"];
  if (v18)
  {
    v19 = NSString;
    v20 = [v8 objectForKeyedSubscript:@"jobNumber"];
    v39 = [v19 stringWithFormat:@"job #%@, ", v20];
  }
  else
  {
    v39 = &stru_1F06BE7B8;
  }

  v21 = [v8 objectForKeyedSubscript:@"pid"];
  id v38 = (void *)v11;
  v22 = v6;
  if (v21)
  {
    double v23 = NSString;
    double v24 = [v8 objectForKeyedSubscript:@"pid"];
    double v25 = [v23 stringWithFormat:@"pid %@, ", v24];
  }
  else
  {
    double v25 = &stru_1F06BE7B8;
  }

  double v26 = (void *)MEMORY[0x1E4F1CB10];
  v27 = [v8 objectForKeyedSubscript:@"filename"];
  double v28 = [v26 fileURLWithPath:v27];

  double v29 = [v28 pathExtension];
  double v30 = [v29 lowercaseString];
  int v31 = [v30 isEqual:@"pdf"];

  double v32 = [v7 textLabel];
  [v32 setText:v15];

  if (v31) {
    [MEMORY[0x1E4FB1618] blueColor];
  }
  else {
  double v33 = [MEMORY[0x1E4FB1618] blackColor];
  }
  double v34 = [v7 textLabel];
  [v34 setTextColor:v33];

  v35 = [NSString stringWithFormat:@"%@%@%@ (%@)", v25, v39, v38, v40];
  v36 = [v7 detailTextLabel];
  [v36 setText:v35];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_tableData count];
}

- (void)viewDidLoad
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v62.receiver = self;
  v62.super_class = (Class)PUDebugImageTableViewController;
  [(PUDebugImageTableViewController *)&v62 viewDidLoad];
  v2 = +[PURenderDebugController getDebugFiles];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v2;
  uint64_t v55 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v55)
  {
    char v4 = 0;
    char v5 = 0;
    uint64_t v52 = *MEMORY[0x1E4F282C0];
    uint64_t v53 = *(void *)v59;
    uint64_t v51 = *MEMORY[0x1E4F28390];
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        v7 = v3;
        if (*(void *)v59 != v53) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v9 = [v8 pathExtension];
        uint64_t v10 = [v9 lowercaseString];
        char v11 = [(id)v10 isEqual:@"txt"];

        v4 |= v11;
        v12 = [v8 pathExtension];
        v13 = [v12 lowercaseString];
        LOBYTE(v10) = [v13 isEqual:@"pdf"];

        v5 |= v10;
        uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
        v15 = [v8 path];
        uint64_t v16 = [v14 attributesOfItemAtPath:v15 error:0];

        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v18 = [v16 objectForKey:v52];
        [v17 setObject:v18 forKeyedSubscript:@"date"];

        v19 = [v16 objectForKey:v51];
        [v17 setObject:v19 forKeyedSubscript:@"size"];

        v20 = [v8 path];
        [v17 setObject:v20 forKeyedSubscript:@"path"];

        v21 = [v8 path];
        v22 = [(PUDebugImageTableViewController *)self pidFromPath:v21];
        [v17 setObject:v22 forKeyedSubscript:@"pid"];

        double v23 = [v8 path];
        double v24 = [(PUDebugImageTableViewController *)self jobNumberFromPath:v23];
        [v17 setObject:v24 forKeyedSubscript:@"jobNumber"];

        double v25 = [v8 lastPathComponent];
        [v17 setObject:v25 forKeyedSubscript:@"filename"];

        id v3 = v7;
        [v7 addObject:v17];
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v55);
    char v26 = v5 & v4;
  }
  else
  {
    char v26 = 0;
  }

  v27 = [v3 sortedArrayUsingComparator:&__block_literal_global_608];
  double v28 = v27;
  if (v26)
  {
    double v29 = v3;
    if ([(NSArray *)v27 count])
    {
      unint64_t v30 = 0;
      double v31 = 100000.0;
      do
      {
        double v32 = [(NSArray *)v28 objectAtIndexedSubscript:v30];
        double v33 = [v32 objectForKeyedSubscript:@"jobNumber"];

        if (v33)
        {
          double v34 = [(NSArray *)v28 objectAtIndexedSubscript:v30];
          v35 = [v34 objectForKeyedSubscript:@"jobNumber"];
          [v35 doubleValue];
          double v31 = v36;
        }
        else
        {
          double v31 = v31 + -0.0001;
        }
        double v37 = [NSNumber numberWithDouble:v31];
        id v38 = [(NSArray *)v28 objectAtIndexedSubscript:v30];
        [v38 setObject:v37 forKeyedSubscript:@"jobNumberSimulated"];

        ++v30;
      }
      while ([(NSArray *)v28 count] > v30);
    }
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([(NSArray *)v28 count])
    {
      unint64_t v40 = 0;
      do
      {
        int v41 = [(NSArray *)v28 objectAtIndexedSubscript:v40];
        v42 = [v41 objectForKeyedSubscript:@"pid"];

        if (v42)
        {
          v43 = [(NSArray *)v28 objectAtIndexedSubscript:v40];
          v44 = [v43 objectForKeyedSubscript:@"pid"];

          id v45 = [(NSArray *)v28 objectAtIndexedSubscript:v40];
          v46 = [v45 objectForKeyedSubscript:@"date"];

          [v39 setObject:v46 forKeyedSubscript:v44];
        }
        ++v40;
      }
      while ([(NSArray *)v28 count] > v40);
    }
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __46__PUDebugImageTableViewController_viewDidLoad__block_invoke_2;
    v56[3] = &unk_1E5F222A8;
    id v57 = v39;
    id v47 = v39;
    id v3 = v29;
    uint64_t v48 = [v29 sortedArrayUsingComparator:v56];

    double v28 = (NSArray *)v48;
  }
  tableData = self->_tableData;
  self->_tableData = v28;
}

uint64_t __46__PUDebugImageTableViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = [v5 objectForKeyedSubscript:@"pid"];
  id v9 = [v7 objectForKeyedSubscript:v8];

  uint64_t v10 = *(void **)(a1 + 32);
  char v11 = [v6 objectForKeyedSubscript:@"pid"];
  v12 = [v10 objectForKeyedSubscript:v11];

  if (!v9 || !v12)
  {
    uint64_t v13 = [v5 objectForKeyedSubscript:@"date"];

    uint64_t v14 = [v6 objectForKeyedSubscript:@"date"];

    id v9 = (void *)v13;
    v12 = (void *)v14;
  }
  uint64_t v15 = [v9 compare:v12];
  if (!v15)
  {
    uint64_t v16 = [v5 objectForKeyedSubscript:@"jobNumberSimulated"];
    id v17 = [v6 objectForKeyedSubscript:@"jobNumberSimulated"];
    uint64_t v15 = [v16 compare:v17];
  }
  if (v15 == 1) {
    uint64_t v18 = -1;
  }
  else {
    uint64_t v18 = 1;
  }

  return v18;
}

uint64_t __46__PUDebugImageTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"date"];
  id v6 = [v4 objectForKeyedSubscript:@"date"];

  uint64_t v7 = [v5 compare:v6];
  if (v7 == 1) {
    return -1;
  }
  else {
    return 1;
  }
}

- (id)pidFromPath:(id)a3
{
  id v3 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  id v4 = [v3 lastPathComponent];

  uint64_t v5 = [v4 rangeOfString:@"_"];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = [v4 substringToIndex:v5];
    id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "intValue"));
  }
  return v6;
}

- (id)jobNumberFromPath:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  id v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"-j[0-9]+(_|.)" options:0 error:&v12];
  id v5 = v12;
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    id v9 = 0;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = objc_msgSend(v3, "substringWithRange:", v7 + 2, v8 - 3);
      id v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "intValue"));
    }
  }
  else
  {
    NSLog(&cfstr_Purenderdebugc.isa, v5);
    id v9 = 0;
  }

  return v9;
}

@end