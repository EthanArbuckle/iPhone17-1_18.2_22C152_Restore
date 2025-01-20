@interface UICreatePDFActivityPrintPaper
- (CGRect)printableRect;
- (CGSize)_paperSize;
- (UICreatePDFActivityPrintPaper)initWithPaperSize:(CGSize)a3;
- (id)_keywordForPDFMetadata;
- (void)set_paperSize:(CGSize)a3;
@end

@implementation UICreatePDFActivityPrintPaper

- (UICreatePDFActivityPrintPaper)initWithPaperSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)UICreatePDFActivityPrintPaper;
  v5 = [(UICreatePDFActivityPrintPaper *)&v7 init];
  -[UICreatePDFActivityPrintPaper set_paperSize:](v5, "set_paperSize:", width, height);
  return v5;
}

- (CGRect)printableRect
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(UICreatePDFActivityPrintPaper *)self paperSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  result.size.double height = v7;
  result.size.double width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (id)_keywordForPDFMetadata
{
  return @"com.apple.MarkupPDF";
}

- (CGSize)_paperSize
{
  double width = self->__paperSize.width;
  double height = self->__paperSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_paperSize:(CGSize)a3
{
  self->__paperSize = a3;
}

@end