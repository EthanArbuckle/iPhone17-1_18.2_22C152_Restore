@interface ICInkPaletteController
+ (id)sharedToolPickerForWindow:(id)a3;
- (BOOL)didTapDoneButton;
- (BOOL)isCanvasGenerationToolSelected;
- (BOOL)isHandwritingToolSelected;
- (BOOL)isInkPaletteShowing;
- (BOOL)isSystemPaperUI;
- (CGRect)_colorPickerPopoverPresentationSourceRect:(id)a3;
- (ICInkPaletteController)init;
- (ICInkPaletteController)initWithParentView:(id)a3 responder:(id)a4 delegate:(id)a5 isSystemPaperUI:(BOOL)a6;
- (ICInkPaletteControllerDelegate)delegate;
- (ICInkToolPickerResponder)responder;
- (PKTool)colorCorrectedTool;
- (PKTool)selectedTool;
- (PKTool)storedSelectedTool;
- (PKToolPicker)toolPicker;
- (UIView)parentView;
- (id)_colorPickerPopoverPresentationSourceView:(id)a3;
- (id)_toolPickerUndoManager:(id)a3;
- (int64_t)colorUserInterfaceStyle;
- (int64_t)palettePosition;
- (int64_t)storedColorUserInterfaceStyle;
- (void)_toolPicker:(id)a3 didChangeColor:(id)a4;
- (void)_toolPicker:(id)a3 shouldSetVisible:(BOOL)a4;
- (void)_toolPickerDidChangePosition:(id)a3;
- (void)_toolPickerDidInvokeDoneAction:(id)a3;
- (void)_toolPickerVisibilityDidChange:(id)a3 isAnimationFinished:(BOOL)a4;
- (void)dealloc;
- (void)hideInkPaletteAnimated:(BOOL)a3;
- (void)resetToPencilKitCompatibleInk;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDidTapDoneButton:(BOOL)a3;
- (void)setIsSystemPaperUI:(BOOL)a3;
- (void)setPalettePosition:(int64_t)a3;
- (void)setParentView:(id)a3;
- (void)setResponder:(id)a3;
- (void)setSelectedTool:(id)a3;
- (void)setStoredColorUserInterfaceStyle:(int64_t)a3;
- (void)setStoredSelectedTool:(id)a3;
- (void)setToolPicker:(id)a3;
- (void)showInkPalette:(BOOL)a3 animated:(BOOL)a4;
- (void)showInkPaletteAnimated:(BOOL)a3;
- (void)toolPickerIsRulerActiveDidChange:(id)a3;
- (void)toolPickerSelectedToolDidChange:(id)a3;
- (void)updateUserInterfaceStyle:(int64_t)a3;
@end

@implementation ICInkPaletteController

- (ICInkPaletteController)init
{
  return 0;
}

- (ICInkPaletteController)initWithParentView:(id)a3 responder:(id)a4 delegate:(id)a5 isSystemPaperUI:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ICInkPaletteController;
  v13 = [(ICInkPaletteController *)&v29 init];
  v14 = v13;
  if (!v13)
  {
LABEL_15:
    v19 = v14;
    goto LABEL_16;
  }
  objc_storeWeak((id *)&v13->_parentView, v10);
  objc_storeWeak((id *)&v14->_responder, v11);
  objc_storeWeak((id *)&v14->_delegate, v12);
  if (a6)
  {
    v15 = [v10 traitCollection];
    v14->_isSystemPaperUI = [v15 userInterfaceIdiom] == 1;
  }
  else
  {
    v14->_isSystemPaperUI = 0;
  }
  v16 = objc_opt_class();
  v17 = [(ICInkPaletteController *)v14 parentView];
  v18 = [v17 window];
  v19 = [v16 sharedToolPickerForWindow:v18];

  if (v19)
  {
    v20 = [(ICInkPaletteController *)v14 parentView];
    v21 = [v20 window];
    [(ICInkPaletteController *)v19 _enableTapInteractionForWindow:v21];

    [(ICInkPaletteController *)v19 _setShowsHandwritingTool:1];
    [(ICInkPaletteController *)v19 _setShowsRuler:[(ICInkPaletteController *)v14 isSystemPaperUI] ^ 1];
    [(ICInkPaletteController *)v19 _setWantsBottomLineDividerVisibleInCompactSize:[(ICInkPaletteController *)v14 isSystemPaperUI] ^ 1];
    [(ICInkPaletteController *)v19 _setWantsEllipsisButtonVisibleInCompactSize:[(ICInkPaletteController *)v14 isSystemPaperUI] ^ 1];
    [(ICInkPaletteController *)v19 _setWantsUndoRedoButtonsVisibleInCompactSize:[(ICInkPaletteController *)v14 isSystemPaperUI]];
    [(ICInkPaletteController *)v19 _setIgnoresSafeAreaInsetsInCompactSize:[(ICInkPaletteController *)v14 isSystemPaperUI]];
    [(ICInkPaletteController *)v19 _setUseEqualSpacingLayoutInCompactSize:[(ICInkPaletteController *)v14 isSystemPaperUI]];
    if ([(ICInkPaletteController *)v14 isSystemPaperUI])
    {
      -[ICInkPaletteController _setEdgeInsetsInCompactSize:](v19, "_setEdgeInsetsInCompactSize:", 0.0, 20.0, 0.0, 70.0);
      [(ICInkPaletteController *)v19 _setInterItemUndoRedoButtonsSpacingInCompactSize:20.0];
    }
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      [(ICInkPaletteController *)v19 setColorUserInterfaceStyle:1];
    }
    [(ICInkPaletteController *)v19 _setWantsClearBackgroundColorInCompactSize:[(ICInkPaletteController *)v14 isSystemPaperUI]];
    [(ICInkPaletteController *)v19 set_delegate:v14];
    [(ICInkPaletteController *)v19 addObserver:v14];
    v22 = [(ICInkPaletteController *)v14 responder];
    [(ICInkPaletteController *)v19 setVisible:1 forFirstResponder:v22];

    v23 = [(ICInkPaletteController *)v14 storedSelectedTool];

    if (v23)
    {
      v24 = [(ICInkPaletteController *)v14 storedSelectedTool];
      [(ICInkPaletteController *)v14 setSelectedTool:v24];

      [(ICInkPaletteController *)v14 setStoredSelectedTool:0];
    }
    if ([(ICInkPaletteController *)v14 storedColorUserInterfaceStyle]) {
      [(ICInkPaletteController *)v14 setColorUserInterfaceStyle:[(ICInkPaletteController *)v14 storedColorUserInterfaceStyle]];
    }
    v25 = [(ICInkPaletteController *)v19 _paletteHostView];
    v26 = [v25 paletteView];
    -[ICInkPaletteController setPalettePosition:](v14, "setPalettePosition:", [v26 palettePosition]);

    v27 = [(ICInkPaletteController *)v14 colorCorrectedTool];
    [(ICInkPaletteController *)v19 setSelectedTool:v27];

    [(ICInkPaletteController *)v14 setToolPicker:v19];
    goto LABEL_15;
  }
LABEL_16:

  return v19;
}

- (void)dealloc
{
  v3 = [(ICInkPaletteController *)self toolPicker];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICInkPaletteController;
  [(ICInkPaletteController *)&v4 dealloc];
}

+ (id)sharedToolPickerForWindow:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!_UIApplicationIsExtension())
  {
    v5 = [v3 windowScene];
    if (!v5)
    {
      v6 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[ICInkPaletteController sharedToolPickerForWindow:]((uint64_t)v3, v6);
      }
      id v4 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    v6 = ICCheckedDynamicCast();
    v7 = [v6 toolPickerIdentifier];
    if (v7
      || ([v6 windowIdentifier], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (void *)sharedToolPickerForWindow___perCanvasToolPickers;
      if (!sharedToolPickerForWindow___perCanvasToolPickers)
      {
        uint64_t v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        id v10 = (void *)sharedToolPickerForWindow___perCanvasToolPickers;
        sharedToolPickerForWindow___perCanvasToolPickers = v9;

        v8 = (void *)sharedToolPickerForWindow___perCanvasToolPickers;
      }
      uint64_t v11 = [v8 objectForKey:v5];
      if (v11)
      {
        id v4 = (id)v11;
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      id v4 = objc_alloc_init(MEMORY[0x1E4F38E68]);
      [v4 setStateAutosaveName:v7];
      [(id)sharedToolPickerForWindow___perCanvasToolPickers setObject:v4 forKey:v5];
      id v12 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138413058;
        id v15 = v4;
        __int16 v16 = 2112;
        v17 = v7;
        __int16 v18 = 2112;
        v19 = v6;
        __int16 v20 = 2112;
        v21 = v5;
        _os_log_debug_impl(&dword_1B08EB000, v12, OS_LOG_TYPE_DEBUG, "created toolPicker: %@, with stateAutosaveName: %@, for window: %@, scene: %@", (uint8_t *)&v14, 0x2Au);
      }
    }
    else
    {
      id v12 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[ICInkPaletteController sharedToolPickerForWindow:](v6, v12);
      }
      id v4 = 0;
      v7 = v12;
    }

    goto LABEL_21;
  }
  if (sharedToolPickerForWindow__onceToken != -1) {
    dispatch_once(&sharedToolPickerForWindow__onceToken, &__block_literal_global_76);
  }
  id v4 = (id)sharedToolPickerForWindow__toolPicker;
LABEL_23:

  return v4;
}

void __52__ICInkPaletteController_sharedToolPickerForWindow___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F38E68]);
  v1 = (void *)sharedToolPickerForWindow__toolPicker;
  sharedToolPickerForWindow__toolPicker = (uint64_t)v0;

  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v3 bundleIdentifier];
  [(id)sharedToolPickerForWindow__toolPicker setStateAutosaveName:v2];
}

- (BOOL)isHandwritingToolSelected
{
  v2 = [(ICInkPaletteController *)self toolPicker];
  char v3 = [v2 _isHandwritingToolSelected];

  return v3;
}

- (BOOL)isCanvasGenerationToolSelected
{
  char v3 = [(ICInkPaletteController *)self toolPicker];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  v5 = [(ICInkPaletteController *)self toolPicker];
  char v6 = [v5 _isCanvasGenerationToolSelected];

  return v6;
}

- (BOOL)isInkPaletteShowing
{
  v2 = [(ICInkPaletteController *)self toolPicker];
  char v3 = [v2 isVisible];

  return v3;
}

- (void)showInkPalette:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    [(ICInkPaletteController *)self showInkPaletteAnimated:a4];
  }
  else {
    [(ICInkPaletteController *)self hideInkPaletteAnimated:a4];
  }
}

- (void)showInkPaletteAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICInkPaletteController showInkPaletteAnimated:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = [(ICInkPaletteController *)self responder];
  [v13 setPreventFirstResponder:0];

  int v14 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ICInkPaletteController showInkPaletteAnimated:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

  uint64_t v22 = [(ICInkPaletteController *)self delegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    v24 = [(ICInkPaletteController *)self delegate];
    [v24 inkPalette:self willShowAnimated:v3];
  }
  v25 = [(ICInkPaletteController *)self responder];
  [v25 becomeFirstResponder];

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    v26 = [(ICInkPaletteController *)self parentView];
    [v26 layoutIfNeeded];
  }
  v27 = [(ICInkPaletteController *)self delegate];
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    objc_super v29 = [(ICInkPaletteController *)self delegate];
    [v29 inkPalette:self didShowAnimated:v3];
  }
}

- (void)hideInkPaletteAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICInkPaletteController hideInkPaletteAnimated:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = [(ICInkPaletteController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(ICInkPaletteController *)self delegate];
    [v15 inkPalette:self willHideAnimated:v3];
  }
  uint64_t v16 = [(ICInkPaletteController *)self responder];
  int v17 = [v16 isFirstResponder];

  if (v17)
  {
    uint64_t v18 = [(ICInkPaletteController *)self responder];
    [v18 resignFirstResponder];
  }
  else
  {
    uint64_t v19 = [(ICInkPaletteController *)self toolPicker];
    int v20 = [v19 isVisible];

    if (!v20) {
      goto LABEL_19;
    }
    uint64_t v18 = 0;
    while (1)
    {
      uint64_t v21 = v18;
      uint64_t v22 = [(ICInkPaletteController *)self parentView];
      uint64_t v18 = [v22 firstResponder];

      if (!v18) {
        break;
      }
      char v23 = [(ICInkPaletteController *)self toolPicker];
      if (![v23 isVisible]) {
        goto LABEL_16;
      }
      v24 = [(ICInkPaletteController *)self delegate];
      if (([v24 inkPalette:self shouldResignFirstResponder:v18] & 1) == 0)
      {

LABEL_16:
        break;
      }
      int v25 = [v18 canResignFirstResponder];

      if (!v25 || ([v18 resignFirstResponder] & 1) == 0) {
        goto LABEL_18;
      }
    }
  }
LABEL_18:

LABEL_19:
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    v26 = [(ICInkPaletteController *)self parentView];
    [v26 layoutIfNeeded];
  }
  v27 = [(ICInkPaletteController *)self delegate];
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    objc_super v29 = [(ICInkPaletteController *)self delegate];
    [v29 inkPalette:self didHideAnimated:v3];
  }
}

- (void)updateUserInterfaceStyle:(int64_t)a3
{
  id v4 = [(ICInkPaletteController *)self toolPicker];
  [v4 _updatePaletteUserInterfaceStyle:a3];
}

- (void)setSelectedTool:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICInkPaletteController setSelectedTool:]((uint64_t)v4, self);
  }

  uint64_t v6 = [(ICInkPaletteController *)self toolPicker];

  if (v6)
  {
    uint64_t v7 = [(ICInkPaletteController *)self toolPicker];
    [v7 setSelectedTool:v4];
  }
  else
  {
    [(ICInkPaletteController *)self setStoredSelectedTool:v4];
  }
}

- (PKTool)selectedTool
{
  BOOL v3 = [(ICInkPaletteController *)self toolPicker];
  if (v3)
  {
    id v4 = [(ICInkPaletteController *)self toolPicker];
    v5 = [v4 selectedTool];
  }
  else
  {
    v5 = [(ICInkPaletteController *)self storedSelectedTool];
  }

  return (PKTool *)v5;
}

- (PKTool)colorCorrectedTool
{
  v2 = [(ICInkPaletteController *)self selectedTool];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    BOOL v3 = ICDynamicCast();
    id v4 = [v3 color];
    int v5 = objc_msgSend(v4, "ic_isWhite");

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F38E18]);
      uint64_t v7 = [v3 inkType];
      uint64_t v8 = [MEMORY[0x1E4FB1618] blackColor];
      [v3 width];
      uint64_t v9 = objc_msgSend(v6, "initWithInkType:color:width:", v7, v8);

      v2 = (void *)v9;
    }
  }
  return (PKTool *)v2;
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  int v5 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICInkPaletteController setColorUserInterfaceStyle:](self);
  }

  id v6 = [(ICInkPaletteController *)self toolPicker];

  if (v6)
  {
    uint64_t v7 = [(ICInkPaletteController *)self toolPicker];
    [v7 setColorUserInterfaceStyle:a3];

    a3 = 0;
  }
  [(ICInkPaletteController *)self setStoredColorUserInterfaceStyle:a3];
}

- (int64_t)colorUserInterfaceStyle
{
  BOOL v3 = [(ICInkPaletteController *)self toolPicker];
  if (v3)
  {
    id v4 = [(ICInkPaletteController *)self toolPicker];
    int64_t v5 = [v4 colorUserInterfaceStyle];
  }
  else
  {
    int64_t v5 = [(ICInkPaletteController *)self storedColorUserInterfaceStyle];
  }

  return v5;
}

- (void)resetToPencilKitCompatibleInk
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  BOOL v3 = [(ICInkPaletteController *)self selectedTool];
  id v4 = ICDynamicCast();

  int64_t v5 = [v4 ink];
  uint64_t v6 = [v5 inkFormatVersion];

  if (v6 == 1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(ICInkPaletteController *)self toolPicker];
    uint64_t v8 = [v7 _tools];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      uint64_t v12 = (void *)*MEMORY[0x1E4F38E90];
      while (2)
      {
        uint64_t v13 = 0;
        char v14 = v4;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_opt_class();
          id v4 = ICDynamicCast();

          uint64_t v15 = [v4 ink];
          if ([v15 inkFormatVersion])
          {
          }
          else
          {
            uint64_t v16 = [v4 inkType];

            if (v16 == v12)
            {
              [(ICInkPaletteController *)self setSelectedTool:v4];
              int v17 = [(ICInkPaletteController *)self toolPicker];
              [v17 setSelectedTool:v4];

              goto LABEL_14;
            }
          }
          ++v13;
          char v14 = v4;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  id v4 = a3;
  id v6 = [(ICInkPaletteController *)self delegate];
  int64_t v5 = [v4 selectedTool];

  [v6 inkPalette:self didPickTool:v5];
}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  id v4 = a3;
  id v6 = [(ICInkPaletteController *)self delegate];
  uint64_t v5 = [v4 isRulerActive];

  [v6 inkPaletteDidToggleRuler:self isRulerActive:v5];
}

- (void)_toolPickerVisibilityDidChange:(id)a3 isAnimationFinished:(BOOL)a4
{
  if (([a3 isVisible] & 1) == 0 && -[ICInkPaletteController didTapDoneButton](self, "didTapDoneButton"))
  {
    uint64_t v5 = [(ICInkPaletteController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [(ICInkPaletteController *)self delegate];
      [v7 inkPaletteDidHideWithDoneButton:self];
    }
    [(ICInkPaletteController *)self setDidTapDoneButton:0];
  }
}

- (void)_toolPickerDidInvokeDoneAction:(id)a3
{
}

- (void)_toolPicker:(id)a3 didChangeColor:(id)a4
{
  id v5 = a4;
  id v6 = [(ICInkPaletteController *)self delegate];
  [v6 inkPalette:self didChangeColor:v5];
}

- (void)_toolPickerDidChangePosition:(id)a3
{
  id v4 = [a3 _paletteHostView];
  id v5 = [v4 paletteView];
  uint64_t v6 = [v5 palettePosition];

  if (v6 && [(ICInkPaletteController *)self palettePosition] != v6)
  {
    int64_t v7 = [(ICInkPaletteController *)self palettePosition];
    [(ICInkPaletteController *)self setPalettePosition:v6];
    id v8 = [(ICInkPaletteController *)self delegate];
    [v8 inkPalette:self didChangePalettePositionStart:v7 end:v6];
  }
}

- (CGRect)_colorPickerPopoverPresentationSourceRect:(id)a3
{
  id v4 = [(ICInkPaletteController *)self delegate];
  id v5 = [v4 inkPaletteButtonView:self];

  [v5 frame];
  CGRect v15 = CGRectOffset(v14, -0.1, 0.0);
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;

  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (id)_colorPickerPopoverPresentationSourceView:(id)a3
{
  id v4 = [(ICInkPaletteController *)self delegate];
  id v5 = [v4 inkPaletteButtonView:self];

  uint64_t v6 = [v5 superview];

  return v6;
}

- (void)_toolPicker:(id)a3 shouldSetVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ICInkPaletteController _toolPicker:shouldSetVisible:]((uint64_t)v6, v4, v7);
  }

  id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v9 = [v8 BOOLForKey:*MEMORY[0x1E4F83870]];

  if (v9) {
    BOOL v10 = !v4;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10) {
    [(ICInkPaletteController *)self showInkPalette:v4 animated:1];
  }
}

- (id)_toolPickerUndoManager:(id)a3
{
  BOOL v4 = [(ICInkPaletteController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICInkPaletteController *)self delegate];
    int64_t v7 = [v6 inkPaletteUndoManager:self];
  }
  else
  {
    id v6 = [(ICInkPaletteController *)self responder];
    id v8 = [v6 window];
    int v9 = [v8 firstResponder];
    int64_t v7 = [v9 undoManager];
  }
  return v7;
}

- (UIView)parentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  return (UIView *)WeakRetained;
}

- (void)setParentView:(id)a3
{
}

- (ICInkToolPickerResponder)responder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  return (ICInkToolPickerResponder *)WeakRetained;
}

- (void)setResponder:(id)a3
{
}

- (ICInkPaletteControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICInkPaletteControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKToolPicker)toolPicker
{
  return self->_toolPicker;
}

- (void)setToolPicker:(id)a3
{
}

- (PKTool)storedSelectedTool
{
  return self->_storedSelectedTool;
}

- (void)setStoredSelectedTool:(id)a3
{
}

- (int64_t)palettePosition
{
  return self->_palettePosition;
}

- (void)setPalettePosition:(int64_t)a3
{
  self->_palettePosition = a3;
}

- (int64_t)storedColorUserInterfaceStyle
{
  return self->_storedColorUserInterfaceStyle;
}

- (void)setStoredColorUserInterfaceStyle:(int64_t)a3
{
  self->_storedColorUserInterfaceStyle = a3;
}

- (BOOL)isSystemPaperUI
{
  return self->_isSystemPaperUI;
}

- (void)setIsSystemPaperUI:(BOOL)a3
{
  self->_isSystemPaperUI = a3;
}

- (BOOL)didTapDoneButton
{
  return self->_didTapDoneButton;
}

- (void)setDidTapDoneButton:(BOOL)a3
{
  self->_didTapDoneButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedSelectedTool, 0);
  objc_storeStrong((id *)&self->_toolPicker, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_responder);
  objc_destroyWeak((id *)&self->_parentView);
}

+ (void)sharedToolPickerForWindow:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "toolPicker can't be created for window: %@, windowScene: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)sharedToolPickerForWindow:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  __int16 v4 = [a1 toolPickerIdentifier];
  uint64_t v5 = [a1 windowIdentifier];
  int v6 = 138412802;
  int64_t v7 = a1;
  __int16 v8 = 2112;
  int v9 = v4;
  __int16 v10 = 2112;
  double v11 = v5;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "toolPicker can't be created for window: %@, with tool picker identifier: %@, window identifier: %@", (uint8_t *)&v6, 0x20u);
}

- (void)showInkPaletteAnimated:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)showInkPaletteAnimated:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, a1, a3, "Setting tool picker responder preventFirstResponder = NO", a5, a6, a7, a8, 0);
}

- (void)hideInkPaletteAnimated:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSelectedTool:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  int v2 = [a2 toolPicker];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v3, v4, "set selected tool: %@, toolPicker: %@", v5, v6, v7, v8, v9);
}

- (void)setColorUserInterfaceStyle:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 toolPicker];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v2, v3, "set color UI style: %ld, toolPicker: %@", v4, v5, v6, v7, v8);
}

- (void)_toolPicker:(os_log_t)log shouldSetVisible:.cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "toolPicker: %@, should set visible: %d", (uint8_t *)&v3, 0x12u);
}

@end