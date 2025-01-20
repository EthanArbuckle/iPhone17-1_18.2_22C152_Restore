@interface UIWebTiledView
- (BOOL)allowsPaintingAndScriptsWhilePanning;
- (BOOL)drawsGrid;
- (BOOL)editingTilingModeEnabled;
- (BOOL)isTilingEnabled;
- (BOOL)keepsZoomedOutTiles;
- (BOOL)layoutTilesInMainThread;
- (BOOL)logsTilingChanges;
- (BOOL)tileDrawingEnabled;
- (BOOL)tilesOpaque;
- (CGRect)visibleRect;
- (CGSize)tileSize;
- (UIWebTiledView)initWithFrame:(CGRect)a3;
- (id)wakWindow;
- (int)tilingArea;
- (unsigned)adjustedMaxTileCount;
- (unsigned)maxTileCount;
- (void)_didScroll;
- (void)_screenChanged:(id)a3;
- (void)_updateForScreen:(id)a3;
- (void)dealloc;
- (void)drawImageIntoTiles:(CGImage *)a3;
- (void)dumpTiles;
- (void)layoutSubviews;
- (void)layoutTilesNow;
- (void)layoutTilesNowForRect:(CGRect)a3;
- (void)layoutTilesNowOnWebThread;
- (void)lockTilingMode;
- (void)removeAllNonVisibleTiles;
- (void)removeAllTiles;
- (void)removeForegroundTiles;
- (void)setAllowsPaintingAndScriptsWhilePanning:(BOOL)a3;
- (void)setEditingTilingModeEnabled:(BOOL)a3;
- (void)setInGesture:(int)a3;
- (void)setKeepsZoomedOutTiles:(BOOL)a3;
- (void)setLayoutTilesInMainThread:(BOOL)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNeedsLayout;
- (void)setTileDrawingEnabled:(BOOL)a3;
- (void)setTilesOpaque:(BOOL)a3;
- (void)setTilingArea:(int)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setWAKWindow:(id)a3;
- (void)unlockTilingMode;
- (void)updateTilingMode;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIWebTiledView

- (void)_updateForScreen:(id)a3
{
  if (a3)
  {
    wakWindow = self->_wakWindow;
    [a3 _referenceBounds];
    -[WAKWindow setScreenSize:](wakWindow, "setScreenSize:", v6, v7);
    if ([(id)UIApp _appAdoptsUISceneLifecycle])
    {
      v8 = [(UIView *)self window];
      if (v8)
      {
        v9 = v8;
        if ([__UIStatusBarManagerForWindow(v8) isStatusBarHidden])
        {
          BOOL v10 = 1;
        }
        else
        {
          objc_msgSend(__UIStatusBarManagerForWindow(v9), "defaultStatusBarHeightInOrientation:", -[UIWindowScene interfaceOrientation](-[UIWindow windowScene](v9, "windowScene"), "interfaceOrientation"));
          BOOL v10 = v13 == 0.0;
        }
        [(UIWindow *)v9 _referenceFrameFromSceneUsingScreenBounds:v10];
      }
      else
      {
        [a3 _mainSceneFrame];
      }
    }
    else
    {
      [a3 _applicationFrame];
    }
    -[WAKWindow setAvailableScreenSize:](self->_wakWindow, "setAvailableScreenSize:", v11, v12);
    [(WAKWindow *)self->_wakWindow screenScale];
    double v15 = v14;
    [a3 scale];
    double v17 = v16;
    -[WAKWindow setScreenScale:](self->_wakWindow, "setScreenScale:");
    if (v17 != v15)
    {
      [(UIWebTiledView *)self removeAllTiles];
      [(UIWebTiledView *)self layoutTilesNow];
    }
  }
}

- (UIWebTiledView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self;
  char v8 = __invalidatesViewUponCreation;
  self;
  __invalidatesViewUponCreation = 0;
  v11.receiver = self;
  v11.super_class = (Class)UIWebTiledView;
  v9 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  self;
  __invalidatesViewUponCreation = v8;
  if (v9)
  {
    v9->_wakWindow = (WAKWindow *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB6D80]), "initWithLayer:", -[UIView layer](v9, "layer"));
    [(UIWebTiledView *)v9 _updateForScreen:[(UIView *)v9 _screen]];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v9, sel__screenChanged_, @"UIWindowDidMoveToScreenNotification", 0);
  return v9;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"UIWindowDidMoveToScreenNotification", 0);

  v3.receiver = self;
  v3.super_class = (Class)UIWebTiledView;
  [(UIView *)&v3 dealloc];
}

- (void)setWAKWindow:(id)a3
{
  id v5 = a3;

  self->_wakWindow = (WAKWindow *)a3;
}

- (CGRect)visibleRect
{
  [(WAKWindow *)self->_wakWindow visibleRect];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)layoutTilesNow
{
  WebThreadLock();
  wakWindow = self->_wakWindow;
  [(WAKWindow *)wakWindow layoutTilesNow];
}

- (void)layoutTilesNowOnWebThread
{
}

- (void)layoutTilesNowForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  WebThreadLock();
  wakWindow = self->_wakWindow;
  -[WAKWindow layoutTilesNowForRect:](wakWindow, "layoutTilesNowForRect:", x, y, width, height);
}

- (void)drawImageIntoTiles:(CGImage *)a3
{
  WebThreadLock();
  [(WAKWindow *)self->_wakWindow setContentReplacementImage:a3];
  [(WAKWindow *)self->_wakWindow removeAllTiles];
  [(WAKWindow *)self->_wakWindow layoutTilesNow];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__UIWebTiledView_drawImageIntoTiles___block_invoke;
  v5[3] = &unk_1E52DC580;
  v5[4] = self;
  [(id)UIApp _performBlockAfterCATransactionCommits:v5];
}

uint64_t __37__UIWebTiledView_drawImageIntoTiles___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setContentReplacementImage:0];
}

- (void)layoutSubviews
{
  if (self->_didFirstTileLayout && !self->_layoutTilesInMainThread)
  {
    wakWindow = self->_wakWindow;
    [(WAKWindow *)wakWindow layoutTiles];
  }
  else
  {
    WebThreadLock();
    [(WAKWindow *)self->_wakWindow layoutTilesNow];
    self->_didFirstTileLayout = 1;
  }
}

- (void)_screenChanged:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "object"), "isEqual:", -[UIView window](self, "window")))
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"UIWindowNewScreenUserInfoKey");
    [(UIWebTiledView *)self _updateForScreen:v5];
  }
}

- (void)willMoveToWindow:(id)a3
{
  uint64_t v5 = [(WAKWindow *)self->_wakWindow rootLayer];
  if (a3 && !v5) {
    [(UIWebTiledView *)self setNeedsLayout];
  }
  -[UIWebTiledView _updateForScreen:](self, "_updateForScreen:", [a3 screen]);
  wakWindow = self->_wakWindow;
  [(WAKWindow *)wakWindow setVisible:a3 != 0];
}

- (void)updateTilingMode
{
  int tilingArea = self->_tilingArea;
  if (tilingArea == 2)
  {
    unsigned int v3 = 4;
  }
  else if (tilingArea == 3)
  {
    unsigned int v3 = 5;
  }
  else
  {
    int inGestureType = self->_inGestureType;
    unsigned int v3 = tilingArea == 1;
    if (inGestureType == 8) {
      unsigned int v3 = 2;
    }
    if (inGestureType == 2) {
      unsigned int v3 = 3;
    }
  }
  if (self->_allowsPaintingAndScriptsWhilePanning && v3 != 4 && v3 != 1) {
    unsigned int v3 = 0;
  }
  if (v3) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !self->_editingTilingModeEnabled;
  }
  if (v7) {
    uint64_t v8 = v3;
  }
  else {
    uint64_t v8 = 1;
  }
  [(WAKWindow *)self->_wakWindow setTilingMode:v8];
}

- (void)setInGesture:(int)a3
{
  if (self->_inGestureType != a3)
  {
    self->_int inGestureType = a3;
    [(UIWebTiledView *)self updateTilingMode];
  }
}

- (void)setTilingArea:(int)a3
{
  if (self->_tilingArea != a3)
  {
    self->_int tilingArea = a3;
    if (!self->_tilingModeIsLocked) {
      [(UIWebTiledView *)self updateTilingMode];
    }
  }
}

- (int)tilingArea
{
  return self->_tilingArea;
}

- (void)lockTilingMode
{
  self->_tilingModeIsLocked = 1;
}

- (void)unlockTilingMode
{
  self->_tilingModeIsLocked = 0;
  [(UIWebTiledView *)self updateTilingMode];
}

- (BOOL)allowsPaintingAndScriptsWhilePanning
{
  return self->_allowsPaintingAndScriptsWhilePanning;
}

- (void)setAllowsPaintingAndScriptsWhilePanning:(BOOL)a3
{
  if (self->_allowsPaintingAndScriptsWhilePanning != a3)
  {
    self->_allowsPaintingAndScriptsWhilePanning = a3;
    [(UIWebTiledView *)self updateTilingMode];
  }
}

- (void)setNeedsLayout
{
  v2.receiver = self;
  v2.super_class = (Class)UIWebTiledView;
  [(UIView *)&v2 setNeedsLayout];
}

- (void)_didScroll
{
  v2.receiver = self;
  v2.super_class = (Class)UIWebTiledView;
  [(UIView *)&v2 setNeedsLayout];
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
}

- (void)setNeedsDisplay
{
}

- (void)setTransform:(CGAffineTransform *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebTiledView;
  long long v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  [(UIView *)&v5 setTransform:v4];
}

- (CGSize)tileSize
{
  double v2 = 512.0;
  double v3 = 512.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)drawsGrid
{
  return 0;
}

- (unsigned)maxTileCount
{
  return 1;
}

- (unsigned)adjustedMaxTileCount
{
  return 1;
}

- (BOOL)isTilingEnabled
{
  return 1;
}

- (BOOL)logsTilingChanges
{
  return 0;
}

- (void)setTileDrawingEnabled:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 4;
  }
  [(WAKWindow *)self->_wakWindow setTilingMode:v3];
}

- (BOOL)editingTilingModeEnabled
{
  return self->_editingTilingModeEnabled;
}

- (void)setEditingTilingModeEnabled:(BOOL)a3
{
  if (self->_editingTilingModeEnabled != a3)
  {
    self->_editingTilingModeEnabled = a3;
    [(UIWebTiledView *)self updateTilingMode];
  }
}

- (BOOL)tileDrawingEnabled
{
  return 1;
}

- (void)setTilesOpaque:(BOOL)a3
{
}

- (BOOL)tilesOpaque
{
  return [(WAKWindow *)self->_wakWindow tilesOpaque];
}

- (void)setKeepsZoomedOutTiles:(BOOL)a3
{
}

- (BOOL)keepsZoomedOutTiles
{
  return [(WAKWindow *)self->_wakWindow keepsZoomedOutTiles];
}

- (void)removeAllNonVisibleTiles
{
}

- (void)removeAllTiles
{
}

- (void)removeForegroundTiles
{
}

- (void)dumpTiles
{
}

- (BOOL)layoutTilesInMainThread
{
  return self->_layoutTilesInMainThread;
}

- (void)setLayoutTilesInMainThread:(BOOL)a3
{
  self->_layoutTilesInMainThread = a3;
}

- (id)wakWindow
{
  return self->_wakWindow;
}

@end