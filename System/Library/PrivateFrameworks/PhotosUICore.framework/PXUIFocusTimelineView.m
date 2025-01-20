@interface PXUIFocusTimelineView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (PXUIFocusTimelineView)init;
- (UIImage)autoFocusMarkerImage;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (id)autoFocusEventMarkerImage;
- (id)userInitiatedFocusEventMarkerImage;
- (int64_t)autoFocusImageInterfaceStyle;
- (void)_PXUIFocusTimelineView_commonInit;
- (void)_handleTap:(id)a3;
- (void)setAutoFocusImageInterfaceStyle:(int64_t)a3;
- (void)setAutoFocusMarkerImage:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
@end

@implementation PXUIFocusTimelineView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFocusMarkerImage, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

- (void)setAutoFocusImageInterfaceStyle:(int64_t)a3
{
  self->_autoFocusImageInterfaceStyle = a3;
}

- (int64_t)autoFocusImageInterfaceStyle
{
  return self->_autoFocusImageInterfaceStyle;
}

- (void)setAutoFocusMarkerImage:(id)a3
{
}

- (UIImage)autoFocusMarkerImage
{
  return self->_autoFocusMarkerImage;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (id)userInitiatedFocusEventMarkerImage
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"cinematic_focus_point_manual");
  v3 = [v2 imageWithRenderingMode:1];

  return v3;
}

- (id)autoFocusEventMarkerImage
{
  v3 = [(PXUIFocusTimelineView *)self traitCollection];
  v4 = [(PXUIFocusTimelineView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  uint64_t v6 = [(PXUIFocusTimelineView *)self autoFocusMarkerImage];
  if (!v6
    || (v7 = (void *)v6,
        int64_t v8 = [(PXUIFocusTimelineView *)self autoFocusImageInterfaceStyle],
        v7,
        v5 != v8))
  {
    v18.width = 14.0;
    v18.height = 14.0;
    UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v10 = [MEMORY[0x1E4FB1618] labelColor];
    id v11 = [v10 resolvedColorWithTraitCollection:v3];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v11 CGColor]);

    v12 = [MEMORY[0x1E4FB1618] systemGray5Color];
    id v13 = [v12 resolvedColorWithTraitCollection:v3];
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v13 CGColor]);

    CGContextSetLineWidth(CurrentContext, 1.0);
    v19.origin.x = 4.0;
    v19.origin.y = 4.0;
    v19.size.width = 6.0;
    v19.size.height = 6.0;
    CGContextAddEllipseInRect(CurrentContext, v19);
    CGContextDrawPath(CurrentContext, kCGPathFillStroke);
    CGContextRestoreGState(CurrentContext);
    v14 = UIGraphicsGetImageFromCurrentImageContext();
    [(PXUIFocusTimelineView *)self setAutoFocusMarkerImage:v14];

    UIGraphicsEndImageContext();
    [(PXUIFocusTimelineView *)self setAutoFocusImageInterfaceStyle:v5];
  }
  v15 = [(PXUIFocusTimelineView *)self autoFocusMarkerImage];

  return v15;
}

- (void)_handleTap:(id)a3
{
  [a3 locationInView:self];
  -[PXFocusTimelineView handleEventSelectedAtLocation:](self, "handleEventSelectedAtLocation:");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)_PXUIFocusTimelineView_commonInit
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
  [v3 setDelegate:self];
  [(PXUIFocusTimelineView *)self addGestureRecognizer:v3];
  [(PXUIFocusTimelineView *)self setTapGestureRecognizer:v3];
}

- (PXUIFocusTimelineView)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXUIFocusTimelineView;
  v2 = [(PXUIFocusTimelineView *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(PXUIFocusTimelineView *)v2 _PXUIFocusTimelineView_commonInit];
  }
  return v3;
}

@end