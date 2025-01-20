@interface PXUISlowMotionEditor
+ (id)createSnappingControllerWithSnappingTarget:(double)a3;
+ (id)handleImage;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (PXUISlowMotionEditor)init;
- (UIImpactFeedbackGenerator)impactGenerator;
- (UIPanGestureRecognizer)panGesture;
- (UITapGestureRecognizer)tapGesture;
- (void)_PXUISlowMotionEditor_commonInit;
- (void)_handleBeginPanGesture:(id)a3;
- (void)_handleChangePanGesture:(id)a3;
- (void)_handleEndPanGesture:(id)a3;
- (void)_handlePan:(id)a3;
- (void)impactOccured;
- (void)prepareForImpact;
- (void)setImpactGenerator:(id)a3;
- (void)setPanGesture:(id)a3;
- (void)setTapGesture:(id)a3;
@end

@implementation PXUISlowMotionEditor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactGenerator, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
}

- (void)setImpactGenerator:(id)a3
{
}

- (UIImpactFeedbackGenerator)impactGenerator
{
  return self->_impactGenerator;
}

- (void)setTapGesture:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setPanGesture:(id)a3
{
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)impactOccured
{
  id v2 = [(PXUISlowMotionEditor *)self impactGenerator];
  [v2 impactOccurred];
}

- (void)prepareForImpact
{
  id v2 = [(PXUISlowMotionEditor *)self impactGenerator];
  [v2 prepare];
}

- (void)_handleEndPanGesture:(id)a3
{
  [a3 locationInView:self];
  -[PXSlowMotionEditor handleEndTrackingAtLocation:](self, "handleEndTrackingAtLocation:");
}

- (void)_handleChangePanGesture:(id)a3
{
  id v6 = a3;
  if ([v6 state] != 2)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXUISlowMotionEditor.m" lineNumber:94 description:@"_handleChangePanGesture: called with a recognizer whose state is not .Changed"];
  }
  [v6 locationInView:self];
  -[PXSlowMotionEditor handleChangeTrackingAtLocation:](self, "handleChangeTrackingAtLocation:");
}

- (void)_handleBeginPanGesture:(id)a3
{
  id v6 = a3;
  if ([v6 state] != 1)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXUISlowMotionEditor.m" lineNumber:85 description:@"_handleBeginPanGesture: called with a recognizer whose state is not .Began"];
  }
  [v6 locationInView:self];
  -[PXSlowMotionEditor handleBeginTrackingAtLocation:](self, "handleBeginTrackingAtLocation:");
}

- (void)_handlePan:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    [(PXUISlowMotionEditor *)self _handleEndPanGesture:v7];
LABEL_8:
    id v6 = v7;
    goto LABEL_9;
  }
  if (v4 == 2)
  {
    [(PXUISlowMotionEditor *)self _handleChangePanGesture:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == 1;
  id v6 = v7;
  if (v5)
  {
    [(PXUISlowMotionEditor *)self _handleBeginPanGesture:v7];
    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_PXUISlowMotionEditor_commonInit
{
  v3 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__handlePan_];
  [(UIPanGestureRecognizer *)v3 setDelegate:self];
  [(PXUISlowMotionEditor *)self addGestureRecognizer:v3];
  panGesture = self->_panGesture;
  self->_panGesture = v3;
  v10 = v3;

  BOOL v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
  [(UITapGestureRecognizer *)v5 setDelegate:self];
  [(UITapGestureRecognizer *)v5 requireGestureRecognizerToFail:self->_panGesture];
  [(PXUISlowMotionEditor *)self addGestureRecognizer:v5];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v5;
  id v7 = v5;

  v8 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:0];
  impactGenerator = self->_impactGenerator;
  self->_impactGenerator = v8;
}

- (PXUISlowMotionEditor)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXUISlowMotionEditor;
  id v2 = [(PXUISlowMotionEditor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PXUISlowMotionEditor *)v2 _PXUISlowMotionEditor_commonInit];
  }
  return v3;
}

+ (id)createSnappingControllerWithSnappingTarget:(double)a3
{
  v3 = [[PXUISnappingController alloc] initWithSnappingTarget:a3];
  return v3;
}

+ (id)handleImage
{
  id v2 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"UISlowMotionGrabberHandle.png");
  v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

@end