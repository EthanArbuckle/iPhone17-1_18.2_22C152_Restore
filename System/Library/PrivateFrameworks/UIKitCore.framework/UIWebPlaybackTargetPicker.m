@interface UIWebPlaybackTargetPicker
- (void)_dismissAirPlayRoutePickerIPad;
- (void)_presentAirPlayPopoverAnimated:(BOOL)a3 fromRect:(CGRect)a4;
- (void)_windowWillRotate:(id)a3;
- (void)dealloc;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)setDelegate:(id)a3;
- (void)show:(BOOL)a3 fromRect:(CGRect)a4;
- (void)showAirPlayPickerIPad:(int64_t)a3 fromRect:(CGRect)a4;
- (void)showAirPlayPickerIPhone:(int64_t)a3;
@end

@implementation UIWebPlaybackTargetPicker

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  [(MPAVRoutingSheet *)self->_actionSheet dismiss];
  [(UIWebPlaybackTargetPicker *)self _dismissAirPlayRoutePickerIPad];
  v3.receiver = self;
  v3.super_class = (Class)UIWebPlaybackTargetPicker;
  [(UIView *)&v3 dealloc];
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  if (self->_popoverController == a3) {
    [(UIWebPlaybackTargetPicker *)self _dismissAirPlayRoutePickerIPad];
  }
}

- (void)_presentAirPlayPopoverAnimated:(BOOL)a3 fromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  popoverController = self->_popoverController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[MPAudioVideoRoutingPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](popoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", WeakRetained, 15, v8, x, y, width, height);
}

- (void)_windowWillRotate:(id)a3
{
}

- (void)_dismissAirPlayRoutePickerIPad
{
  routingController = self->_routingController;
  self->_routingController = 0;

  if (self->_popoverController)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:@"UIWindowWillRotateNotification" object:0];
    [v5 removeObserver:self name:@"UIWindowDidRotateNotification" object:0];
    [(MPAudioVideoRoutingPopoverController *)self->_popoverController dismissPopoverAnimated:0];
    [(MPAudioVideoRoutingPopoverController *)self->_popoverController setDelegate:0];
    popoverController = self->_popoverController;
    self->_popoverController = 0;
  }
}

- (void)showAirPlayPickerIPad:(int64_t)a3 fromRect:(CGRect)a4
{
  if (!self->_popoverController)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v10 = (void *)getMPAudioVideoRoutingPopoverControllerClass_softClass;
    uint64_t v19 = getMPAudioVideoRoutingPopoverControllerClass_softClass;
    if (!getMPAudioVideoRoutingPopoverControllerClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getMPAudioVideoRoutingPopoverControllerClass_block_invoke;
      v15[3] = &unk_1E52D9900;
      v15[4] = &v16;
      __getMPAudioVideoRoutingPopoverControllerClass_block_invoke((uint64_t)v15);
      v10 = (void *)v17[3];
    }
    v11 = v10;
    _Block_object_dispose(&v16, 8);
    v12 = (MPAudioVideoRoutingPopoverController *)[[v11 alloc] initWithType:a3];
    popoverController = self->_popoverController;
    self->_popoverController = v12;

    [(MPAudioVideoRoutingPopoverController *)self->_popoverController setDelegate:self];
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:self selector:sel__windowWillRotate_ name:@"UIWindowWillRotateNotification" object:0];
    [v14 addObserver:self selector:sel__windowDidRotate_ name:@"UIWindowDidRotateNotification" object:0];
    -[UIWebPlaybackTargetPicker _presentAirPlayPopoverAnimated:fromRect:](self, "_presentAirPlayPopoverAnimated:fromRect:", 1, x, y, width, height);
  }
}

- (void)showAirPlayPickerIPhone:(int64_t)a3
{
  if (!self->_actionSheet)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v5 = (void *)getMPAVRoutingSheetClass_softClass;
    uint64_t v16 = getMPAVRoutingSheetClass_softClass;
    if (!getMPAVRoutingSheetClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getMPAVRoutingSheetClass_block_invoke;
      v12[3] = &unk_1E52D9900;
      v12[4] = &v13;
      __getMPAVRoutingSheetClass_block_invoke((uint64_t)v12);
      id v5 = (void *)v14[3];
    }
    v6 = v5;
    _Block_object_dispose(&v13, 8);
    v7 = (MPAVRoutingSheet *)[[v6 alloc] initWithAVItemType:a3];
    actionSheet = self->_actionSheet;
    self->_actionSheet = v7;

    v9 = self->_actionSheet;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__UIWebPlaybackTargetPicker_showAirPlayPickerIPhone___block_invoke;
    v11[3] = &unk_1E52D9F70;
    v11[4] = self;
    [(MPAVRoutingSheet *)v9 showInView:WeakRetained withCompletionHandler:v11];
  }
}

void __53__UIWebPlaybackTargetPicker_showAirPlayPickerIPhone___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 408);
  *(void *)(v2 + 408) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 424);
  *(void *)(v4 + 424) = 0;
}

- (void)show:(BOOL)a3 fromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v10 = (void *)getMPAVRoutingControllerClass_softClass;
  uint64_t v19 = getMPAVRoutingControllerClass_softClass;
  if (!getMPAVRoutingControllerClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getMPAVRoutingControllerClass_block_invoke;
    v15[3] = &unk_1E52D9900;
    v15[4] = &v16;
    __getMPAVRoutingControllerClass_block_invoke((uint64_t)v15);
    v10 = (void *)v17[3];
  }
  v11 = v10;
  _Block_object_dispose(&v16, 8);
  v12 = (MPAVRoutingController *)[[v11 alloc] initWithName:@"WebKit - HTML media element showing AirPlay route picker"];
  routingController = self->_routingController;
  self->_routingController = v12;

  [(MPAVRoutingController *)self->_routingController setDiscoveryMode:3];
  if (v8) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  if (UIWebCurrentUserInterfaceIdiomIsSmallScreen()) {
    [(UIWebPlaybackTargetPicker *)self showAirPlayPickerIPhone:v14];
  }
  else {
    -[UIWebPlaybackTargetPicker showAirPlayPickerIPad:fromRect:](self, "showAirPlayPickerIPad:fromRect:", v14, x, y, width, height);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionSheet, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
}

@end