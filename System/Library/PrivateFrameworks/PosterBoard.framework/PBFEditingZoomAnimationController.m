@interface PBFEditingZoomAnimationController
- (CGRect)previewFrame;
- (PBFEditingZoomAnimationController)initWithPreviewFrame:(CGRect)a3 previewCornerRadius:(double)a4 previewView:(id)a5 complicationsView:(id)a6;
- (UIView)complicationsView;
- (UIView)previewView;
- (double)previewCornerRadius;
- (id)buildDimmingView;
- (id)buildZoomingViewWithPreviewView:(id)a3 previewFrame:(CGRect)a4 editingView:(id)a5 complicationsView:(id)a6;
@end

@implementation PBFEditingZoomAnimationController

- (PBFEditingZoomAnimationController)initWithPreviewFrame:(CGRect)a3 previewCornerRadius:(double)a4 previewView:(id)a5 complicationsView:(id)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PBFEditingZoomAnimationController;
  v16 = [(PBFEditingZoomAnimationController *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_previewFrame.origin.CGFloat x = x;
    v16->_previewFrame.origin.CGFloat y = y;
    v16->_previewFrame.size.CGFloat width = width;
    v16->_previewFrame.size.CGFloat height = height;
    v16->_previewCornerRadius = a4;
    objc_storeStrong((id *)&v16->_previewView, a5);
    objc_storeStrong((id *)&v17->_complicationsView, a6);
  }

  return v17;
}

- (id)buildZoomingViewWithPreviewView:(id)a3 previewFrame:(CGRect)a4 editingView:(id)a5 complicationsView:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a5;
  id v13 = a6;
  id v14 = a3;
  objc_msgSend(v14, "setFrame:", x, y, width, height);
  id v15 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v15 setClipsToBounds:1];
  [v15 addSubview:v14];

  if (v13) {
    [v15 addSubview:v13];
  }
  [v15 addSubview:v12];
  [v15 setAccessibilityIgnoresInvertColors:1];

  return v15;
}

- (id)buildDimmingView
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.25];
  [v3 setBackgroundColor:v4];

  [v3 setAutoresizingMask:18];
  return v3;
}

- (CGRect)previewFrame
{
  double x = self->_previewFrame.origin.x;
  double y = self->_previewFrame.origin.y;
  double width = self->_previewFrame.size.width;
  double height = self->_previewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)previewCornerRadius
{
  return self->_previewCornerRadius;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (UIView)complicationsView
{
  return self->_complicationsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationsView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
}

@end