@interface SWPresentationManager
- (NSNumber)heightValue;
- (SWLogger)logger;
- (SWPresentationManager)initWithWebContentScriptsManager:(id)a3 messageHandlerManager:(id)a4 documentStateProvider:(id)a5 logger:(id)a6;
- (SWScriptsManager)scriptsManager;
- (double)height;
- (id)descriptionForPresentationState:(unint64_t)a3;
- (id)loadBlock;
- (id)presentableBlock;
- (unint64_t)presentationState;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
- (void)onLoad:(id)a3;
- (void)onPresentable:(id)a3;
- (void)prepareForLegacyResize;
- (void)refresh;
- (void)setHeightValue:(id)a3;
- (void)setPresentationState:(unint64_t)a3;
@end

@implementation SWPresentationManager

- (SWPresentationManager)initWithWebContentScriptsManager:(id)a3 messageHandlerManager:(id)a4 documentStateProvider:(id)a5 logger:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = 0;
  if (v11 && v12 && v13)
  {
    v25.receiver = self;
    v25.super_class = (Class)SWPresentationManager;
    v16 = [(SWPresentationManager *)&v25 init];
    p_isa = (id *)&v16->super.isa;
    if (v16)
    {
      heightValue = v16->_heightValue;
      v16->_heightValue = 0;

      objc_storeStrong(p_isa + 4, a3);
      objc_storeStrong(p_isa + 5, a6);
      v19 = +[SWWeakMessageHandler handlerWithMessageHandler:p_isa];
      [v12 addMessageHandler:v19 name:@"presentable"];

      v20 = +[SWWeakMessageHandler handlerWithMessageHandler:p_isa];
      [v12 addMessageHandler:v20 name:@"update"];

      objc_initWeak(&location, p_isa);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __109__SWPresentationManager_initWithWebContentScriptsManager_messageHandlerManager_documentStateProvider_logger___block_invoke;
      v22[3] = &unk_2646FF9C0;
      objc_copyWeak(&v23, &location);
      [v13 onLoad:v22];
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    self = p_isa;
    v15 = self;
  }

  return v15;
}

void __109__SWPresentationManager_initWithWebContentScriptsManager_messageHandlerManager_documentStateProvider_logger___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[6];
  WeakRetained[6] = 0;

  v2 = [WeakRetained loadBlock];

  if (v2)
  {
    v3 = [WeakRetained loadBlock];
    v3[2]();
  }
}

- (double)height
{
  heightValue = self->_heightValue;
  if (!heightValue) {
    return 0.0;
  }
  [(NSNumber *)heightValue floatValue];
  return v3;
}

- (void)refresh
{
  v4 = objc_alloc_init(SWRefreshScript);
  float v3 = [(SWPresentationManager *)self scriptsManager];
  [v3 executeScript:v4 completion:0];
}

- (void)setPresentationState:(unint64_t)a3
{
  if (self->_presentationState != a3)
  {
    v5 = [(SWPresentationManager *)self logger];
    v6 = NSString;
    v7 = [(SWPresentationManager *)self descriptionForPresentationState:a3];
    v8 = [(SWPresentationManager *)self descriptionForPresentationState:self->_presentationState];
    v9 = [v6 stringWithFormat:@"PresentationManager: Setting presentation state to %@ from %@", v7, v8];
    [v5 log:v9];

    self->_presentationState = a3;
    v10 = [[SWPresentationStateScript alloc] initWithPresentationState:a3];
    id v11 = [(SWPresentationManager *)self scriptsManager];
    [v11 executeScript:v10 completion:0];
  }
  if (a3 == 2)
  {
    heightValue = self->_heightValue;
    self->_heightValue = 0;
  }
}

- (void)prepareForLegacyResize
{
  self->_heightValue = 0;
  MEMORY[0x270F9A758]();
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v23 = a3;
  v5 = [v23 body];
  v6 = [v5 objectForKey:@"height"];

  v7 = [(SWPresentationManager *)self logger];
  v8 = NSString;
  v10 = v9 = [v23 name];
  [v7 log:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 floatValue];
    double v12 = roundf(v11);
    if (self->_heightValue)
    {
      [(SWPresentationManager *)self height];
      if (v13 == v12) {
        goto LABEL_10;
      }
    }
    id v14 = [NSNumber numberWithDouble:v12];
    heightValue = self->_heightValue;
    self->_heightValue = v14;

    v16 = [(SWPresentationManager *)self presentableBlock];

    if (!v16) {
      goto LABEL_10;
    }
    v17 = [(SWPresentationManager *)self presentableBlock];
    v18.n128_f64[0] = v12;
    v17[2](v18);
    goto LABEL_9;
  }
  v19 = [v23 name];
  int v20 = [v19 isEqualToString:@"presentable"];

  if (v20)
  {
    v21 = [(SWPresentationManager *)self presentableBlock];

    if (v21)
    {
      v17 = [(SWPresentationManager *)self presentableBlock];
      v22.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
      v17[2](v22);
LABEL_9:
    }
  }
LABEL_10:
}

- (id)descriptionForPresentationState:(unint64_t)a3
{
  float v3 = @"unknown";
  if (a3 == 1) {
    float v3 = @"presented";
  }
  if (a3 == 2) {
    return @"not presented";
  }
  else {
    return v3;
  }
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (id)loadBlock
{
  return self->loadBlock;
}

- (void)onLoad:(id)a3
{
}

- (id)presentableBlock
{
  return self->presentableBlock;
}

- (void)onPresentable:(id)a3
{
}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSNumber)heightValue
{
  return self->_heightValue;
}

- (void)setHeightValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightValue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_scriptsManager, 0);
  objc_storeStrong(&self->presentableBlock, 0);
  objc_storeStrong(&self->loadBlock, 0);
}

@end