@interface MFConverter
+ (BOOL)mapToPdf:(id)a3;
+ (CGRect)boundsInLogicalUnits:(id)a3;
+ (CGRect)boundsInPoints:(id)a3;
+ (id)play:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6;
+ (id)playToBitmap:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6;
+ (id)playToPDF:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6;
+ (void)fromBinary:(id)a3 toXml:(id)a4;
+ (void)playInCurrentContext:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6;
@end

@implementation MFConverter

+ (id)play:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (width != 0.0 && height != 0.0)
  {
LABEL_6:
    v25 = (void *)MEMORY[0x23EC9A170]();
    if ([a1 mapToPdf:v13]) {
      objc_msgSend(a1, "playToPDF:frame:colorMap:fillMap:", v13, v14, v15, x, y, width, height);
    }
    else {
    v24 = objc_msgSend(a1, "playToBitmap:frame:colorMap:fillMap:", v13, v14, v15, x, y, width, height);
    }
    goto LABEL_10;
  }
  [a1 boundsInPoints:v13];
  double v20 = NSNonNegativeSizeRect(v16, v17, v18, v19);
  double width = v23;
  v24 = 0;
  if (v23 != 0.0)
  {
    double height = v22;
    if (v22 != 0.0)
    {
      double x = v20;
      double y = v21;
      goto LABEL_6;
    }
  }
LABEL_10:

  return v24;
}

+ (BOOL)mapToPdf:(id)a3
{
  return 1;
}

+ (id)playToPDF:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (width > 1024.0)
  {
    double height = height * (1024.0 / width);
    double width = 1024.0;
  }
  if (height > 1024.0)
  {
    double width = width * (1024.0 / height);
    double height = 1024.0;
  }
  CGFloat v16 = (__CFData *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:0];
  if (!v16) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Failed to create target data"];
  }
  CGFloat v17 = CGDataConsumerCreateWithCFData(v16);
  if (!v17) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Failed to create data consumer"];
  }
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  CGFloat v18 = CGPDFContextCreate(v17, &v22, 0);
  if (!v18) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Failed to create PDF context"];
  }
  CGPDFContextBeginPage(v18, 0);
  CGFloat MidY = CGRectGetMidY(v22);
  CGContextTranslateCTM(v18, 0.0, MidY);
  CGContextScaleCTM(v18, 1.0, -1.0);
  CGFloat v20 = CGRectGetMidY(v22);
  CGContextTranslateCTM(v18, 0.0, -v20);
  TCGraphicsPushContext(v18);
  objc_msgSend(a1, "playInCurrentContext:frame:colorMap:fillMap:", v13, v14, v15, x, y, width, height);
  if (v18)
  {
    TCGraphicsPopContext();
    CGPDFContextEndPage(v18);
    CGPDFContextClose(v18);
    CFRelease(v18);
  }
  if (v17) {
    CFRelease(v17);
  }

  return v16;
}

+ (void)playInCurrentContext:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v21 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = -[MFGraphicsDevice initWithCanvas:]([MFGraphicsDevice alloc], "initWithCanvas:", x, y, width, height);
  [(MFGraphicsDevice *)v14 setColorMap:v12 fillMap:v13];
  int v15 = +[MFSniffer fileType:v21];
  if (!v15)
  {
    CGFloat v16 = [[WMFPlayer alloc] initWithGraphicsDevice:v14];
    CGFloat v17 = [[WMFReader alloc] initWithWMFPlayer:v16];
    goto LABEL_5;
  }
  if (v15 == 1)
  {
    CGFloat v16 = [[EMFPlayer alloc] initWithGraphicsDevice:v14];
    CGFloat v17 = [[EMFReader alloc] initWithEMFPlayer:v16];
LABEL_5:
    CGFloat v18 = v17;

    goto LABEL_7;
  }
  CGFloat v18 = 0;
LABEL_7:
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  [(WMFReader *)v18 play:v21];
  CGFloat v20 = UIGraphicsGetCurrentContext();
  CGContextRestoreGState(v20);
}

+ (CGRect)boundsInPoints:(id)a3
{
  id v3 = a3;
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  int v8 = +[MFSniffer fileType:v3];
  if (!v8)
  {
    +[WMFPlayer boundsInPoints:v3];
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    +[EMFPlayer boundsInPoints:v3];
LABEL_5:
    double v4 = v9;
    double v5 = v10;
    double v6 = v11;
    double v7 = v12;
  }

  double v13 = v4;
  double v14 = v5;
  double v15 = v6;
  double v16 = v7;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

+ (id)playToBitmap:(id)a3 frame:(CGRect)a4 colorMap:(id)a5 fillMap:(id)a6
{
  return 0;
}

+ (CGRect)boundsInLogicalUnits:(id)a3
{
  id v3 = a3;
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  int v8 = +[MFSniffer fileType:v3];
  if (!v8)
  {
    +[WMFPlayer boundsInLogicalUnits:v3];
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    +[EMFPlayer boundsInLogicalUnits:v3];
LABEL_5:
    double v4 = v9;
    double v5 = v10;
    double v6 = v11;
    double v7 = v12;
  }

  double v13 = v4;
  double v14 = v5;
  double v15 = v6;
  double v16 = v7;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

+ (void)fromBinary:(id)a3 toXml:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  double v6 = [v9 pathExtension];
  double v7 = [v6 lowercaseString];
  int v8 = [v7 isEqualToString:@"emf"];

  if (v8) {
    +[EMFPlayer fromBinary:v9 toXml:v5];
  }
}

@end