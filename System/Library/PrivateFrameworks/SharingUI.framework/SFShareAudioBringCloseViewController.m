@interface SFShareAudioBringCloseViewController
- (UIButton)cancelButton;
- (UIImageView)shareImageView;
- (UILabel)infoLabel;
- (void)_cycleProductImage;
- (void)eventCancel:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setShareImageView:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFShareAudioBringCloseViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v11.receiver = self;
  v11.super_class = (Class)SFShareAudioBringCloseViewController;
  [(SFShareAudioBaseViewController *)&v11 viewWillAppear:v3];
  v5 = [(SFShareAudioViewController *)self->super._mainController mainBundle];
  v6 = SFLocalizedStringEx();
  [(UILabel *)self->super._titleLabel setText:v6];

  v7 = SFAddSuffixForCurrentDeviceClass();
  v8 = SFLocalizedStringEx();
  [(UILabel *)self->_infoLabel setText:v8];

  [(SFShareAudioBringCloseViewController *)self _cycleProductImage];
  cancelButton = self->_cancelButton;
  v10 = SFLocalizedStringForKey();
  [(UIButton *)cancelButton setTitle:v10 forState:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8.receiver = self;
  v8.super_class = (Class)SFShareAudioBringCloseViewController;
  [(SFShareAudioBaseViewController *)&v8 viewWillDisappear:v3];
  cycleImageTimer = self->_cycleImageTimer;
  if (cycleImageTimer)
  {
    v6 = cycleImageTimer;
    dispatch_source_cancel(v6);
    v7 = self->_cycleImageTimer;
    self->_cycleImageTimer = 0;
  }
}

- (void)eventCancel:(id)a3
{
  id v4 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFShareAudioViewController *)self->super._mainController reportUserCancelled];
}

- (void)_cycleProductImage
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!self->_cycleImageArray)
  {
    BOOL v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    cycleImageArray = self->_cycleImageArray;
    self->_cycleImageArray = v3;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [&unk_26CE7E2D8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(&unk_26CE7E2D8);
          }
          v9 = [MEMORY[0x263F827E8] systemImageNamed:*(void *)(*((void *)&v25 + 1) + 8 * v8)];
          [(NSMutableArray *)self->_cycleImageArray addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [&unk_26CE7E2D8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v6);
    }
    v10 = (void *)MEMORY[0x263F82818];
    objc_super v11 = [MEMORY[0x263F825C8] whiteColor];
    v12 = [v10 configurationWithHierarchicalColor:v11];

    v13 = [MEMORY[0x263F82818] configurationWithPointSize:3 weight:2 scale:120.0];
    v14 = [v12 configurationByApplyingConfiguration:v13];
    [(UIImageView *)self->_shareImageView setPreferredSymbolConfiguration:v14];
    v15 = [MEMORY[0x263F825C8] whiteColor];
    [(UIImageView *)self->_shareImageView setTintColor:v15];
  }
  if (self->_cycleImageTimer)
  {
    v16 = [MEMORY[0x263F15910] animation];
    [v16 setDuration:0.5];
    [v16 setType:*MEMORY[0x263F16008]];
    [v16 setSubtype:*MEMORY[0x263F15FF0]];
    v17 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v16 setTimingFunction:v17];

    v18 = [(UIImageView *)self->_shareImageView layer];
    [v18 addAnimation:v16 forKey:0];
  }
  else
  {
    v19 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    cycleImageTimer = self->_cycleImageTimer;
    self->_cycleImageTimer = v19;
    v16 = v19;

    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __58__SFShareAudioBringCloseViewController__cycleProductImage__block_invoke;
    handler[3] = &unk_264471EE0;
    handler[4] = self;
    dispatch_source_set_event_handler(v16, handler);
    CUDispatchTimerSet();
    dispatch_activate(v16);
  }

  unint64_t cycleNextIndex = self->_cycleNextIndex;
  if ([(NSMutableArray *)self->_cycleImageArray count] > cycleNextIndex)
  {
    v22 = self->_cycleImageArray;
    ++self->_cycleNextIndex;
    v23 = -[NSMutableArray objectAtIndexedSubscript:](v22, "objectAtIndexedSubscript:");
    [(UIImageView *)self->_shareImageView setImage:v23];

    self->_cycleNextIndex %= (unint64_t)[(NSMutableArray *)self->_cycleImageArray count];
  }
}

uint64_t __58__SFShareAudioBringCloseViewController__cycleProductImage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cycleProductImage];
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_cycleImageTimer, 0);
  objc_storeStrong((id *)&self->_cycleImageArray, 0);
}

@end