@interface _WTTextPreview
- (CGColor)backgroundColor;
- (CGImage)previewImage;
- (CGPath)clippingPath;
- (CGPath)contentPath;
- (CGRect)presentationFrame;
- (NSArray)candidateRects;
- (_WTTextPreview)initWithContentPath:(CGPath *)a3;
- (_WTTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4;
- (_WTTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4 backgroundColor:(CGColor *)a5 clippingPath:(CGPath *)a6 scale:(double)a7;
- (_WTTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4 backgroundColor:(CGColor *)a5 clippingPath:(CGPath *)a6 scale:(double)a7 candidateRects:(id)a8;
- (double)scale;
- (id)layerWithContents;
- (void)dealloc;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setCandidateRects:(id)a3;
- (void)setClippingPath:(CGPath *)a3;
- (void)setContentPath:(CGPath *)a3;
- (void)setPresentationFrame:(CGRect)a3;
- (void)setPreviewImage:(CGImage *)a3;
- (void)setScale:(double)a3;
@end

@implementation _WTTextPreview

- (_WTTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4
{
  return -[_WTTextPreview initWithSnapshotImage:presentationFrame:backgroundColor:clippingPath:scale:candidateRects:](self, "initWithSnapshotImage:presentationFrame:backgroundColor:clippingPath:scale:candidateRects:", a3, 0, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 1.0);
}

- (_WTTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4 backgroundColor:(CGColor *)a5 clippingPath:(CGPath *)a6 scale:(double)a7
{
  return -[_WTTextPreview initWithSnapshotImage:presentationFrame:backgroundColor:clippingPath:scale:candidateRects:](self, "initWithSnapshotImage:presentationFrame:backgroundColor:clippingPath:scale:candidateRects:", a3, a5, a6, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7);
}

- (_WTTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4 backgroundColor:(CGColor *)a5 clippingPath:(CGPath *)a6 scale:(double)a7 candidateRects:(id)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)_WTTextPreview;
  v18 = [(_WTTextPreview *)&v22 init];
  v19 = v18;
  if (v18)
  {
    [(_WTTextPreview *)v18 setPreviewImage:a3];
    -[_WTTextPreview setPresentationFrame:](v19, "setPresentationFrame:", x, y, width, height);
    [(_WTTextPreview *)v19 setBackgroundColor:a5];
    [(_WTTextPreview *)v19 setClippingPath:a6];
    [(_WTTextPreview *)v19 setScale:a7];
    [(_WTTextPreview *)v19 setCandidateRects:v17];
    v20 = v19;
  }

  return v19;
}

- (_WTTextPreview)initWithContentPath:(CGPath *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_WTTextPreview;
  v4 = [(_WTTextPreview *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(_WTTextPreview *)v4 setContentPath:a3];
    PathBoundingBodouble x = CGPathGetPathBoundingBox(a3);
    -[_WTTextPreview setPresentationFrame:](v5, "setPresentationFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), PathBoundingBox.size.width, PathBoundingBox.size.height);
    [(_WTTextPreview *)v5 setBackgroundColor:0];
    [(_WTTextPreview *)v5 setClippingPath:a3];
    [(_WTTextPreview *)v5 setScale:1.0];
    v6 = v5;
  }

  return v5;
}

- (id)layerWithContents
{
  if ([(_WTTextPreview *)self contentPath])
  {
    v3 = [MEMORY[0x263F15880] layer];
    objc_msgSend(v3, "setPath:", -[_WTTextPreview contentPath](self, "contentPath"));
    [v3 setFillColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x263F001C0])];
  }
  else
  {
    v3 = [MEMORY[0x263F157E8] layer];
    objc_msgSend(v3, "setContents:", -[_WTTextPreview previewImage](self, "previewImage"));
  }
  [(_WTTextPreview *)self presentationFrame];
  objc_msgSend(v3, "setFrame:");

  return v3;
}

- (void)dealloc
{
  if ([(_WTTextPreview *)self previewImage]) {
    CFRelease([(_WTTextPreview *)self previewImage]);
  }
  if ([(_WTTextPreview *)self contentPath]) {
    CFRelease([(_WTTextPreview *)self contentPath]);
  }
  if ([(_WTTextPreview *)self backgroundColor]) {
    CFRelease([(_WTTextPreview *)self backgroundColor]);
  }
  if ([(_WTTextPreview *)self clippingPath]) {
    CFRelease([(_WTTextPreview *)self clippingPath]);
  }
  v3.receiver = self;
  v3.super_class = (Class)_WTTextPreview;
  [(_WTTextPreview *)&v3 dealloc];
}

- (CGImage)previewImage
{
  return (CGImage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreviewImage:(CGImage *)a3
{
}

- (CGPath)contentPath
{
  return (CGPath *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentPath:(CGPath *)a3
{
}

- (CGRect)presentationFrame
{
  objc_copyStruct(v6, &self->_presentationFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setPresentationFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_presentationFrame, &v3, 32, 1, 0);
}

- (CGColor)backgroundColor
{
  return (CGColor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackgroundColor:(CGColor *)a3
{
}

- (CGPath)clippingPath
{
  return (CGPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClippingPath:(CGPath *)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSArray)candidateRects
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCandidateRects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end