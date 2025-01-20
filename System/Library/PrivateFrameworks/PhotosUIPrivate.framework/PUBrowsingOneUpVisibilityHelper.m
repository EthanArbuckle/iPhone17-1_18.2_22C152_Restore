@interface PUBrowsingOneUpVisibilityHelper
- (BOOL)isOneUpVisible;
- (BOOL)isPresentedForSecondScreen;
- (PUBrowsingOneUpVisibilityHelper)initWithBrowsingViewModel:(id)a3 isPresentedForSecondScreen:(BOOL)a4;
- (PUBrowsingViewModel)browsingViewModel;
- (void)dealloc;
- (void)setBrowsingViewModel:(id)a3;
- (void)setIsOneUpVisible:(BOOL)a3;
@end

@implementation PUBrowsingOneUpVisibilityHelper

- (void).cxx_destruct
{
}

- (void)setBrowsingViewModel:(id)a3
{
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (BOOL)isPresentedForSecondScreen
{
  return self->_isPresentedForSecondScreen;
}

- (BOOL)isOneUpVisible
{
  return self->_isOneUpVisible;
}

- (void)setIsOneUpVisible:(BOOL)a3
{
  if (self->_isOneUpVisible != a3) {
    self->_isOneUpVisible = a3;
  }
}

- (void)dealloc
{
  v3 = [(PUBrowsingOneUpVisibilityHelper *)self browsingViewModel];
  [v3 unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingOneUpVisibilityHelper;
  [(PUBrowsingOneUpVisibilityHelper *)&v4 dealloc];
}

- (PUBrowsingOneUpVisibilityHelper)initWithBrowsingViewModel:(id)a3 isPresentedForSecondScreen:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUBrowsingOneUpVisibilityHelper;
  v8 = [(PUBrowsingOneUpVisibilityHelper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_isOneUpVisible = 0;
    v8->_isPresentedForSecondScreen = a4;
    objc_storeStrong((id *)&v8->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)v9->_browsingViewModel registerChangeObserver:v9];
  }

  return v9;
}

@end