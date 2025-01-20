@interface PXUILivePhotoTrimScrubber
+ (id)_stretchableImageNamed:(id)a3 withCapInsets:(UIEdgeInsets)a4;
+ (id)createSnappingControllerWithSnappingTarget:(double)a3;
+ (id)trimEndHighlightedImage;
+ (id)trimEndHighlightedImageMini;
+ (id)trimEndImage;
+ (id)trimEndImageMini;
+ (id)trimStartHighlightedImage;
+ (id)trimStartHighlightedImageMini;
+ (id)trimStartImage;
+ (id)trimStartImageMini;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)intrinsicContentSize;
- (PXUILivePhotoTrimScrubber)initWithFilmStripViewClass:(Class)a3 spec:(id)a4 traitCollection:(id)a5;
- (UIImpactFeedbackGenerator)impactGenerator;
- (UILongPressGestureRecognizer)longPressGesture;
- (UIPanGestureRecognizer)panGesture;
- (UITapGestureRecognizer)tapGesture;
- (void)_PXUILivePhotoTrimScrubber_commonInit;
- (void)_handleBeginPanGesture:(id)a3;
- (void)_handleChangePanGesture:(id)a3;
- (void)_handleLongPress:(id)a3;
- (void)_handlePan:(id)a3;
- (void)_handleTap:(id)a3;
- (void)impactOccured;
- (void)prepareForImpact;
- (void)setDisabled:(BOOL)a3;
- (void)setImpactGenerator:(id)a3;
- (void)setLongPressGesture:(id)a3;
- (void)setPanGesture:(id)a3;
- (void)setTapGesture:(id)a3;
@end

@implementation PXUILivePhotoTrimScrubber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactGenerator, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
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

- (void)setLongPressGesture:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
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

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  v3 = [(PXLivePhotoTrimScrubber *)self spec];
  [v3 handleHeight];
  double v5 = v4;

  double v6 = v2;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)impactOccured
{
  id v2 = [(PXUILivePhotoTrimScrubber *)self impactGenerator];
  [v2 impactOccurred];
}

- (void)prepareForImpact
{
  id v2 = [(PXUILivePhotoTrimScrubber *)self impactGenerator];
  [v2 prepare];
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXUILivePhotoTrimScrubber;
  -[PXLivePhotoTrimScrubber setDisabled:](&v8, sel_setDisabled_);
  BOOL v5 = !v3;
  double v6 = [(PXUILivePhotoTrimScrubber *)self panGesture];
  [v6 setEnabled:v5];

  double v7 = [(PXUILivePhotoTrimScrubber *)self tapGesture];
  [v7 setEnabled:v5];
}

- (void)_handleChangePanGesture:(id)a3
{
  id v14 = a3;
  if ([v14 state] != 2)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXUILivePhotoTrimScrubber.m" lineNumber:162 description:@"_handleChangePanGesture: called with a recognizer whose state is not .Changed"];
  }
  int64_t v5 = [(PXLivePhotoTrimScrubber *)self currentlyInteractingElement];
  double v6 = v14;
  if (v5)
  {
    [v14 locationInView:self];
    double v8 = v7;
    double v10 = v9;
    [v14 velocityInView:self];
    -[PXLivePhotoTrimScrubber handleChangeTrackingAtLocation:withVelocity:](self, "handleChangeTrackingAtLocation:withVelocity:", v8, v10, v11, v12);
    double v6 = v14;
  }
}

- (void)_handleBeginPanGesture:(id)a3
{
  id v7 = a3;
  if ([v7 state] != 1)
  {
    int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXUILivePhotoTrimScrubber.m" lineNumber:153 description:@"_handleBeginPanGesture: called with a recognizer whose state is not .Began"];
  }
  if ([(PXLivePhotoTrimScrubber *)self currentlyInteractingElement])
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXUILivePhotoTrimScrubber.m", 154, @"A new tracking gesture began, but we are already tracking one." object file lineNumber description];
  }
  [v7 locationInView:self];
  -[PXLivePhotoTrimScrubber handleBeginTrackingAtLocation:](self, "handleBeginTrackingAtLocation:");
}

- (void)_handleLongPress:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [v17 state];
  if ((unint64_t)(v4 - 4) < 2)
  {
    v15 = self;
    uint64_t v16 = 0;
LABEL_8:
    [(PXLivePhotoTrimScrubber *)v15 handleEndTracking:v16];
    goto LABEL_9;
  }
  if (v4 == 3)
  {
    v15 = self;
    uint64_t v16 = 1;
    goto LABEL_8;
  }
  if (v4 == 1)
  {
    int64_t v5 = [(PXLivePhotoTrimScrubber *)self photoLoupe];
    [v17 locationInView:v5];
    CGFloat v7 = v6;
    CGFloat v9 = v8;

    double v10 = [(PXLivePhotoTrimScrubber *)self photoLoupe];
    [v10 bounds];
    CGRect v21 = CGRectInset(v20, -10.0, -10.0);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;

    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    v19.CGFloat x = v7;
    v19.CGFloat y = v9;
    if (CGRectContainsPoint(v22, v19))
    {
      [(PXUILivePhotoTrimScrubber *)self prepareForImpact];
      [(PXLivePhotoTrimScrubber *)self handleLongPressWithElement:4];
    }
  }
LABEL_9:
}

- (void)_handlePan:(id)a3
{
  id v6 = a3;
  switch([v6 state])
  {
    case 1:
      [(PXUILivePhotoTrimScrubber *)self _handleBeginPanGesture:v6];
      break;
    case 2:
      [(PXUILivePhotoTrimScrubber *)self _handleChangePanGesture:v6];
      break;
    case 3:
      uint64_t v4 = self;
      uint64_t v5 = 1;
      goto LABEL_6;
    case 4:
    case 5:
      uint64_t v4 = self;
      uint64_t v5 = 0;
LABEL_6:
      [(PXLivePhotoTrimScrubber *)v4 handleEndTracking:v5];
      break;
    default:
      break;
  }
}

- (void)_handleTap:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    if ([(PXLivePhotoTrimScrubber *)self playheadStyle] == 1)
    {
      [v4 locationInView:self];
      long long v20 = 0uLL;
      uint64_t v21 = 0;
      -[PXLivePhotoTrimScrubber timeAtPoint:](self, "timeAtPoint:");
      uint64_t v5 = [(PXLivePhotoTrimScrubber *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        CGFloat v7 = [(PXLivePhotoTrimScrubber *)self delegate];
        long long v18 = v20;
        uint64_t v19 = v21;
        [v7 trimScrubber:self didTapTimelineAtTime:&v18];
      }
    }
    else if ([(PXLivePhotoTrimScrubber *)self playheadStyle] == 2)
    {
      double v8 = [(PXLivePhotoTrimScrubber *)self photoLoupe];
      [v4 locationInView:v8];
      CGFloat v10 = v9;
      CGFloat v12 = v11;

      v13 = [(PXLivePhotoTrimScrubber *)self photoLoupe];
      [v13 bounds];
      CGRect v24 = CGRectInset(v23, -10.0, -10.0);
      CGFloat x = v24.origin.x;
      CGFloat y = v24.origin.y;
      CGFloat width = v24.size.width;
      CGFloat height = v24.size.height;

      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      v22.CGFloat x = v10;
      v22.CGFloat y = v12;
      if (CGRectContainsPoint(v25, v22))
      {
        [(PXLivePhotoTrimScrubber *)self handleTapWithElement:3];
      }
      else
      {
        [v4 locationInView:self];
        long long v20 = 0uLL;
        uint64_t v21 = 0;
        -[PXLivePhotoTrimScrubber timeAtPoint:](self, "timeAtPoint:");
        long long v18 = v20;
        uint64_t v19 = v21;
        [(PXLivePhotoTrimScrubber *)self handleSetKeyTime:&v18];
      }
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  [(PXLivePhotoTrimScrubber *)self untrimmedDuration];
  return (v4 & 0x1D) == 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_PXUILivePhotoTrimScrubber_commonInit
{
  BOOL v3 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__handlePan_];
  [(UIPanGestureRecognizer *)v3 setDelegate:self];
  [(PXUILivePhotoTrimScrubber *)self addGestureRecognizer:v3];
  panGesture = self->_panGesture;
  self->_panGesture = v3;
  v13 = v3;

  uint64_t v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
  [(UITapGestureRecognizer *)v5 setDelegate:self];
  [(UITapGestureRecognizer *)v5 requireGestureRecognizerToFail:self->_panGesture];
  [(PXUILivePhotoTrimScrubber *)self addGestureRecognizer:v5];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v5;
  CGFloat v7 = v5;

  double v8 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleLongPress_];
  [(UILongPressGestureRecognizer *)v8 setDelegate:self];
  [(UILongPressGestureRecognizer *)v8 setMinimumPressDuration:0.5];
  [(PXUILivePhotoTrimScrubber *)self addGestureRecognizer:v8];
  longPressGesture = self->_longPressGesture;
  self->_longPressGesture = v8;
  CGFloat v10 = v8;

  double v11 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:0];
  impactGenerator = self->_impactGenerator;
  self->_impactGenerator = v11;
}

- (PXUILivePhotoTrimScrubber)initWithFilmStripViewClass:(Class)a3 spec:(id)a4 traitCollection:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PXUILivePhotoTrimScrubber;
  uint64_t v5 = [(PXLivePhotoTrimScrubber *)&v8 initWithFilmStripViewClass:a3 spec:a4 traitCollection:a5];
  char v6 = v5;
  if (v5) {
    [(PXUILivePhotoTrimScrubber *)v5 _PXUILivePhotoTrimScrubber_commonInit];
  }
  return v6;
}

+ (id)trimEndHighlightedImageMini
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", @"PXMovieScrubberEditingRight_Mini", 0.0, 0.0, 0.0, 24.0);
}

+ (id)trimEndImageMini
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", @"PXMovieScrubberEditingGlassRight_Mini", 0.0, 0.0, 0.0, 24.0);
}

+ (id)trimStartHighlightedImageMini
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", @"PXMovieScrubberEditingLeft_Mini", 0.0, 24.0, 0.0, 0.0);
}

+ (id)trimStartImageMini
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", @"PXMovieScrubberEditingGlassLeft_Mini", 0.0, 24.0, 0.0, 0.0);
}

+ (id)trimEndHighlightedImage
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", @"PXMovieScrubberEditingRight", 0.0, 0.0, 0.0, 24.0);
}

+ (id)trimEndImage
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", @"PXMovieScrubberEditingGlassRight", 0.0, 0.0, 0.0, 24.0);
}

+ (id)trimStartHighlightedImage
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", @"PXMovieScrubberEditingLeft", 0.0, 24.0, 0.0, 0.0);
}

+ (id)trimStartImage
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", @"PXMovieScrubberEditingGlassLeft", 0.0, 24.0, 0.0, 0.0);
}

+ (id)_stretchableImageNamed:(id)a3 withCapInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  objc_super v8 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", a3);
  double v9 = objc_msgSend(v8, "resizableImageWithCapInsets:", top, left, bottom, right);

  return v9;
}

+ (id)createSnappingControllerWithSnappingTarget:(double)a3
{
  BOOL v3 = [[PXUISnappingController alloc] initWithSnappingTarget:a3];
  return v3;
}

@end