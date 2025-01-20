@interface UIImage(NCAdditions)
+ (CGPDFPage)nc_imageWithPDDocument:()NCAdditions size:;
+ (id)nc_imageFromPDFWithFileURL:()NCAdditions size:;
@end

@implementation UIImage(NCAdditions)

+ (id)nc_imageFromPDFWithFileURL:()NCAdditions size:
{
  v8 = CGPDFDocumentCreateWithURL(url);
  v9 = objc_msgSend(a1, "nc_imageWithPDDocument:size:", v8, a4, a5);
  CGPDFDocumentRelease(v8);

  return v9;
}

+ (CGPDFPage)nc_imageWithPDDocument:()NCAdditions size:
{
  if (document)
  {
    Page = CGPDFDocumentGetPage(document, 1uLL);
    v8 = Page;
    if (Page)
    {
      CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFArtBox);
      double width = BoxRect.size.width;
      double height = BoxRect.size.height;
      BoxRect.origin.x = a4;
      BoxRect.origin.y = a5;
      UIGraphicsBeginImageContextWithOptions((CGSize)BoxRect.origin, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextScaleCTM(CurrentContext, a4 / width, a5 / height);
      CGContextDrawPDFPage(CurrentContext, v8);
      UIGraphicsGetImageFromCurrentImageContext();
      v8 = (CGPDFPage *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end