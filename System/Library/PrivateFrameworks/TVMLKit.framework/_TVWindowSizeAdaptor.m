@interface _TVWindowSizeAdaptor
- (BOOL)_shouldSwapDimensions;
- (BOOL)update;
- (CGSize)adjustedWindowSize;
- (UIWindow)window;
- (_TVWindowSizeAdaptor)initWithWindow:(id)a3;
- (unint64_t)_supportedOrientations;
@end

@implementation _TVWindowSizeAdaptor

- (_TVWindowSizeAdaptor)initWithWindow:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TVWindowSizeAdaptor;
  v5 = [(_TVWindowSizeAdaptor *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_window, v4);
    v6->_allowedInterfaceOrientations = [(_TVWindowSizeAdaptor *)v6 _supportedOrientations];
  }

  return v6;
}

- (CGSize)adjustedWindowSize
{
  v3 = [(_TVWindowSizeAdaptor *)self window];
  if (v3) {
    [(_TVWindowSizeAdaptor *)self window];
  }
  else {
  id v4 = [MEMORY[0x263F1C920] mainScreen];
  }
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  BOOL v9 = [(_TVWindowSizeAdaptor *)self _shouldSwapDimensions];
  if (v9) {
    double v10 = v8;
  }
  else {
    double v10 = v6;
  }
  if (v9) {
    double v11 = v6;
  }
  else {
    double v11 = v8;
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)update
{
  unint64_t v3 = [(_TVWindowSizeAdaptor *)self _supportedOrientations];
  unint64_t allowedInterfaceOrientations = self->_allowedInterfaceOrientations;
  if (v3 != allowedInterfaceOrientations) {
    self->_unint64_t allowedInterfaceOrientations = v3;
  }
  return v3 != allowedInterfaceOrientations;
}

- (BOOL)_shouldSwapDimensions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  id v4 = [WeakRetained traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5) {
    return 0;
  }
  uint64_t v7 = [(id)*MEMORY[0x263F1D020] statusBarOrientation];
  if ((unint64_t)(v7 - 1) > 3) {
    LOBYTE(v8) = 0;
  }
  else {
    int v8 = dword_230C384A0[v7 - 1];
  }
  return (self->_allowedInterfaceOrientations & ((1 << v7) | (unint64_t)(1 << v8))) == 0;
}

- (unint64_t)_supportedOrientations
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  unint64_t v3 = [WeakRetained rootViewController];

  id v4 = [v3 presentedViewController];
  uint64_t v5 = v4;
  if (!v4) {
    id v4 = v3;
  }
  unint64_t v6 = [v4 supportedInterfaceOrientations];

  return v6;
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end