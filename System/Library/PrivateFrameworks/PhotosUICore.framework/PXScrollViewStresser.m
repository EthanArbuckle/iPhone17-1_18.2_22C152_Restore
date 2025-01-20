@interface PXScrollViewStresser
+ (PXScrollViewStresser)sharedInstance;
- (BOOL)isScrolling;
- (CADisplayLink)displayLink;
- (UIScrollView)scrollView;
- (int64_t)scrollCount;
- (unsigned)scrollDirection;
- (void)_handleDisplayLink:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setScrollCount:(int64_t)a3;
- (void)setScrollDirection:(unsigned int)a3;
- (void)setScrollView:(id)a3;
- (void)startScrollingScrollView:(id)a3 axis:(int64_t)a4;
- (void)stopScrolling;
@end

@implementation PXScrollViewStresser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)setScrollCount:(int64_t)a3
{
  self->_scrollCount = a3;
}

- (int64_t)scrollCount
{
  return self->_scrollCount;
}

- (void)setScrollDirection:(unsigned int)a3
{
  self->_scrollDirection = a3;
}

- (unsigned)scrollDirection
{
  return self->_scrollDirection;
}

- (void)setScrollView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setDisplayLink:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)stopScrolling
{
  v3 = [(PXScrollViewStresser *)self displayLink];
  [v3 invalidate];

  [(PXScrollViewStresser *)self setDisplayLink:0];
  [(PXScrollViewStresser *)self setScrollView:0];
}

- (BOOL)isScrolling
{
  v2 = [(PXScrollViewStresser *)self displayLink];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_handleDisplayLink:(id)a3
{
  id v12 = [(PXScrollViewStresser *)self scrollView];
  uint64_t v4 = [(PXScrollViewStresser *)self scrollDirection];
  if (objc_msgSend(v12, "px_isScrolledAtEdge:", v4)) {
    PXRectEdgeOpposite();
  }
  [v12 contentOffset];
  double v6 = v5;
  double v8 = v7;
  v9 = +[PXDiagnosticsSettings sharedInstance];
  [v9 scrollSpeed];
  double v11 = v10;

  switch((int)v4)
  {
    case 0:
      double v6 = v6 - v11;
      break;
    case 1:
      double v8 = v8 - v11;
      break;
    case 2:
      double v6 = v6 + v11;
      break;
    case 3:
      double v8 = v8 + v11;
      break;
    default:
      break;
  }
  objc_msgSend(v12, "px_scrollToContentOffset:animated:", 0, v6, v8);
}

- (void)startScrollingScrollView:(id)a3 axis:(int64_t)a4
{
  id v9 = a3;
  if (![(PXScrollViewStresser *)self isScrolling])
  {
    if (a4 == 2) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 3;
    }
    if (objc_msgSend(v9, "px_isScrolledAtEdge:", v6)) {
      PXRectEdgeOpposite();
    }
    double v7 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__handleDisplayLink_];
    double v8 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v7 addToRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

    [(PXScrollViewStresser *)self setDisplayLink:v7];
    [(PXScrollViewStresser *)self setScrollView:v9];
    [(PXScrollViewStresser *)self setScrollDirection:v6];
    [(PXScrollViewStresser *)self setScrollCount:0];
  }
}

+ (PXScrollViewStresser)sharedInstance
{
  if (sharedInstance_onceToken_254602 != -1) {
    dispatch_once(&sharedInstance_onceToken_254602, &__block_literal_global_254603);
  }
  v2 = (void *)sharedInstance_sharedInstance_254604;
  return (PXScrollViewStresser *)v2;
}

void __38__PXScrollViewStresser_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PXScrollViewStresser);
  v1 = (void *)sharedInstance_sharedInstance_254604;
  sharedInstance_sharedInstance_254604 = (uint64_t)v0;
}

@end