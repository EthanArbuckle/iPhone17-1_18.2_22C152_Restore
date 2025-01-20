@interface ICPDFGenerator
- (BOOL)startGenerating;
- (CGRect)pageRect;
- (ICPDFGenerator)init;
- (ICPDFGenerator)initWithMutableData:(id)a3 pageRect:(CGRect)a4 title:(id)a5;
- (ICPDFGenerator)initWithURL:(id)a3 pageRect:(CGRect)a4 title:(id)a5;
- (NSMutableData)data;
- (NSString)title;
- (NSURL)fileURL;
- (void)addPageWithPageRect:(CGRect)a3 renderBlock:(id)a4;
- (void)addPageWithRenderBlock:(id)a3;
- (void)dealloc;
- (void)finishGenerating;
- (void)setData:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setPageRect:(CGRect)a3;
- (void)setTitle:(id)a3;
- (void)startGenerating;
@end

@implementation ICPDFGenerator

- (ICPDFGenerator)init
{
  return 0;
}

- (ICPDFGenerator)initWithURL:(id)a3 pageRect:(CGRect)a4 title:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICPDFGenerator;
  v13 = [(ICPDFGenerator *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(ICPDFGenerator *)v13 setFileURL:v11];
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    if (CGRectEqualToRect(v17, *MEMORY[0x1E4F1DB20]))
    {
      double x = *(double *)&kICPDFGeneratorDefaultPageRect;
      double y = *(double *)algn_1EA384E18;
      double width = *(double *)&qword_1EA384E20;
      double height = unk_1EA384E28;
    }
    -[ICPDFGenerator setPageRect:](v14, "setPageRect:", x, y, width, height);
    [(ICPDFGenerator *)v14 setTitle:v12];
  }

  return v14;
}

- (ICPDFGenerator)initWithMutableData:(id)a3 pageRect:(CGRect)a4 title:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICPDFGenerator;
  v13 = [(ICPDFGenerator *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(ICPDFGenerator *)v13 setData:v11];
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    if (CGRectEqualToRect(v17, *MEMORY[0x1E4F1DB20]))
    {
      double x = *(double *)&kICPDFGeneratorDefaultPageRect;
      double y = *(double *)algn_1EA384E18;
      double width = *(double *)&qword_1EA384E20;
      double height = unk_1EA384E28;
    }
    -[ICPDFGenerator setPageRect:](v14, "setPageRect:", x, y, width, height);
    [(ICPDFGenerator *)v14 setTitle:v12];
  }

  return v14;
}

- (void)dealloc
{
  if (self->_pdfContext)
  {
    v3 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Forgot to call finishGenerating", buf, 2u);
    }

    [(ICPDFGenerator *)self finishGenerating];
  }
  v4.receiver = self;
  v4.super_class = (Class)ICPDFGenerator;
  [(ICPDFGenerator *)&v4 dealloc];
}

- (BOOL)startGenerating
{
  v28[2] = *MEMORY[0x1E4F143B8];
  if (self->_pdfContext)
  {
    v2 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(ICPDFGenerator *)v2 startGenerating];
    }
LABEL_13:
    BOOL v23 = 0;
    goto LABEL_14;
  }
  v27[0] = *MEMORY[0x1E4F1DE08];
  id v11 = [(ICPDFGenerator *)self title];
  v27[1] = *MEMORY[0x1E4F1DDC8];
  v28[0] = v11;
  v28[1] = @"Notes";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  [(ICPDFGenerator *)self pageRect];
  mediaBox.origin.double x = v12;
  mediaBox.origin.double y = v13;
  mediaBox.size.double width = v14;
  mediaBox.size.double height = v15;
  objc_super v16 = [(ICPDFGenerator *)self fileURL];

  if (v16)
  {
    CFURLRef v17 = [(ICPDFGenerator *)self fileURL];
    self->_pdfContext = CGPDFContextCreateWithURL(v17, &mediaBox, (CFDictionaryRef)v2);
  }
  else
  {
    v18 = [(ICPDFGenerator *)self data];

    if (!v18)
    {
LABEL_10:
      v24 = os_log_create("com.apple.notes", "Export");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        [(ICPDFGenerator *)self startGenerating];
      }

      goto LABEL_13;
    }
    v19 = [MEMORY[0x1E4F1C9B8] data];
    v20 = [(ICPDFGenerator *)self data];
    [v20 setData:v19];

    v21 = [(ICPDFGenerator *)self data];
    v22 = CGDataConsumerCreateWithCFData(v21);

    self->_pdfContext = CGPDFContextCreate(v22, &mediaBox, (CFDictionaryRef)v2);
    CGDataConsumerRelease(v22);
  }
  if (!self->_pdfContext) {
    goto LABEL_10;
  }
  BOOL v23 = 1;
LABEL_14:

  return v23;
}

- (void)addPageWithRenderBlock:(id)a3
{
  id v4 = a3;
  [(ICPDFGenerator *)self pageRect];
  -[ICPDFGenerator addPageWithPageRect:renderBlock:](self, "addPageWithPageRect:renderBlock:", v4);
}

- (void)addPageWithPageRect:(CGRect)a3 renderBlock:(id)a4
{
  CGRect v16 = a3;
  uint64_t v5 = (void (**)(id, CGContext *, double, double, double, double))a4;
  if (self->_pdfContext)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDataRef v7 = CFDataCreate(0, (const UInt8 *)&v16, 32);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1DDE0], v7);
    CGPDFContextBeginPage(self->_pdfContext, Mutable);
    v5[2](v5, self->_pdfContext, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    CGPDFContextEndPage(self->_pdfContext);
    CFRelease(Mutable);
    CFRelease(v7);
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ICPDFGenerator addPageWithPageRect:renderBlock:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)finishGenerating
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (CGRect)pageRect
{
  double x = self->_pageRect.origin.x;
  double y = self->_pageRect.origin.y;
  double width = self->_pageRect.size.width;
  double height = self->_pageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPageRect:(CGRect)a3
{
  self->_pageRect = a3;
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)startGenerating
{
}

- (void)addPageWithPageRect:(uint64_t)a3 renderBlock:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end