@interface SBLogWindowController
+ (UIWindowScene)windowScene;
+ (id)sharedInstance;
+ (id)sharedInstanceIfAvailable;
+ (void)setWindowScene:(id)a3;
- (SBLogWindowController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBWindow)logWindow;
- (UITextView)logTextView;
- (void)_createAndUpdateWindowIfNecessary;
- (void)hide;
- (void)setLogTextView:(id)a3;
- (void)setLogWindow:(id)a3;
- (void)show;
@end

@implementation SBLogWindowController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_47 != -1) {
    dispatch_once(&sharedInstance_onceToken_47, &__block_literal_global_331);
  }
  v2 = (void *)gSharedInstance;
  return v2;
}

void __39__SBLogWindowController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBLogWindowController);
  v1 = (void *)gSharedInstance;
  gSharedInstance = (uint64_t)v0;
}

+ (id)sharedInstanceIfAvailable
{
  return (id)gSharedInstance;
}

+ (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained(&_windowScene);
  return (UIWindowScene *)WeakRetained;
}

+ (void)setWindowScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&_windowScene);

  v4 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&_windowScene, obj);
    v5 = +[SBLogWindowController sharedInstanceIfAvailable];
    [v5 _createAndUpdateWindowIfNecessary];

    v4 = obj;
  }
}

- (SBLogWindowController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBLogWindowController;
  v4 = [(SBLogWindowController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(SBLogWindowController *)v4 _createAndUpdateWindowIfNecessary];
  }
  return v5;
}

- (void)_createAndUpdateWindowIfNecessary
{
  id v16 = [(id)objc_opt_class() windowScene];
  logWindow = self->_logWindow;
  if (logWindow)
  {
    id v4 = [(SBWindow *)logWindow windowScene];

    if (v4 != v16) {
      [(SBWindow *)self->_logWindow setWindowScene:v16];
    }
  }
  else
  {
    v5 = [[SBWindow alloc] initWithWindowScene:v16 role:@"SBTraitsParticipantRoleLogWindowRecipe" debugName:@"LogWindow"];
    v6 = self->_logWindow;
    self->_logWindow = v5;

    objc_super v7 = self->_logWindow;
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F42FF8]) initWithNibName:0 bundle:0];
    [(SBWindow *)v7 setRootViewController:v8];

    v9 = [(SBWindow *)self->_logWindow rootViewController];
    v10 = [v9 view];

    [(SBWindow *)self->_logWindow setWindowLevel:*MEMORY[0x1E4F43CF8] + 250.0 + -1.0];
    [(SBWindow *)self->_logWindow setHidden:1];
    v11 = (UITextView *)objc_alloc_init(MEMORY[0x1E4F42F58]);
    logTextView = self->_logTextView;
    self->_logTextView = v11;

    [(UITextView *)self->_logTextView setAutoresizingMask:18];
    v13 = self->_logTextView;
    v14 = [(SBWindow *)self->_logWindow rootViewController];
    v15 = [v14 view];
    [v15 bounds];
    -[UITextView setFrame:](v13, "setFrame:");

    [v10 addSubview:self->_logTextView];
  }
}

- (void)show
{
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(SBWindow *)self->_logWindow setHidden:0];
  logWindow = self->_logWindow;
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  double v13 = CGRectGetMaxX(v15) + -300.0;
  -[SBWindow setFrame:](logWindow, "setFrame:", v13, 0.0, 300.0, 300.0);
}

- (void)hide
{
}

- (UITextView)logTextView
{
  return self->_logTextView;
}

- (void)setLogTextView:(id)a3
{
}

- (SBWindow)logWindow
{
  return self->_logWindow;
}

- (void)setLogWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logWindow, 0);
  objc_storeStrong((id *)&self->_logTextView, 0);
}

@end