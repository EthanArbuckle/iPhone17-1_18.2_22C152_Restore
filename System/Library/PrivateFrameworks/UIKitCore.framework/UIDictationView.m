@interface UIDictationView
+ (CGSize)layoutSize;
+ (CGSize)viewSize;
+ (Class)dictationViewClass;
+ (UIDictationView)sharedInstance;
+ (id)activeInstance;
- (BOOL)drawsOwnBackground;
- (BOOL)isShowing;
- (BOOL)showLanguageLabel;
- (BOOL)switchingLanguage;
- (BOOL)visible;
- (CGPoint)backgroundOffset;
- (CGPoint)contentOffset;
- (CGPoint)positionForShow;
- (CGSize)currentScreenSize;
- (UIDictationView)initWithFrame:(CGRect)a3;
- (UIDictationViewDisplayDelegate)displayDelegate;
- (float)audioLevelForFlamesView:(id)a3;
- (id)endpointButton;
- (void)applicationEnteredBackground;
- (void)dealloc;
- (void)endpointButtonPressed;
- (void)finishReturnToKeyboard;
- (void)highlightEndpointButton;
- (void)keyboardDidShow:(id)a3;
- (void)prepareForReturnToKeyboard;
- (void)removeBackgroundView;
- (void)returnToKeyboard;
- (void)setDisplayDelegate:(id)a3;
- (void)setShowLanguageLabel:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setSwitchingLanguage:(BOOL)a3;
@end

@implementation UIDictationView

+ (id)activeInstance
{
  return (id)gDictationViewSharedInstance;
}

+ (Class)dictationViewClass
{
  switch(+[UIDictationController viewMode])
  {
    case 2:
    case 3:
    case 4:
    case 7:
      +[UIDictationController viewMode];
      break;
    default:
      break;
  }
  v2 = objc_opt_class();
  return (Class)v2;
}

+ (CGSize)viewSize
{
  switch(+[UIDictationController viewMode])
  {
    case 0:
      v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v8 = [v7 scene];
      v9 = [v8 screen];
      [v9 bounds];
      double v4 = v10;
      double v12 = v11;

      double v6 = v12 + -200.0;
      break;
    case 1:
      v13 = +[UIKeyboardPreferencesController sharedPreferencesController];
      v14 = [v13 preferencesActions];
      [v14 rivenSizeFactor:118.0];
      double v4 = v15;
      v16 = +[UIKeyboardPreferencesController sharedPreferencesController];
      v17 = [v16 preferencesActions];
      [v17 rivenSizeFactor:118.0];
      double v6 = v18;

      break;
    case 2:
    case 3:
    case 4:
    case 7:
      v2 = +[UIKeyboard activeKeyboard];
      +[UIKeyboardImpl defaultSizeForInterfaceOrientation:](UIKeyboardImpl, "defaultSizeForInterfaceOrientation:", [v2 interfaceOrientation]);
      double v4 = v3;
      double v6 = v5;

      break;
    case 6:
      v19 = +[UIScreen mainScreen];
      [v19 bounds];
      double v4 = v20;

      double v6 = 100.0;
      break;
    default:
      double v4 = *MEMORY[0x1E4F1DB30];
      double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
  }
  double v21 = v4;
  double v22 = v6;
  result.height = v22;
  result.width = v21;
  return result;
}

+ (UIDictationView)sharedInstance
{
  if (MGGetBoolAnswer())
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = [a1 dictationViewClass];
    double v5 = (void *)gDictationViewSharedInstance;
    if (gDictationViewSharedInstance) {
      BOOL v6 = v3 == v4;
    }
    else {
      BOOL v6 = 0;
    }
    if (!v6)
    {
      uint64_t v7 = v4;
      v8 = (objc_class *)[a1 dictationViewClass];
      if (!v8) {
        goto LABEL_12;
      }
      v9 = v8;
      [(objc_class *)v8 layoutSize];
      double v11 = v10;
      double v13 = v12;
      if (v3 != v7) {
        [(id)gDictationViewSharedInstance removeFromSuperview];
      }
      uint64_t v14 = objc_msgSend([v9 alloc], "initWithFrame:", 0.0, 0.0, v11, v13);
      double v15 = (void *)gDictationViewSharedInstance;
      gDictationViewSharedInstance = v14;

      double v5 = (void *)gDictationViewSharedInstance;
    }
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }
LABEL_12:
  return (UIDictationView *)v8;
}

- (void)highlightEndpointButton
{
}

- (id)endpointButton
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v3 = self->_endpointButton;
  }
  else
  {
    uint64_t v4 = +[UIKeyboard activeKeyboard];
    uint64_t v5 = [v4 interfaceOrientation];
    uint64_t v6 = 3;
    if ((unint64_t)(v5 - 1) < 2) {
      uint64_t v6 = 2;
    }
    uint64_t v3 = (UIButton *)objc_retain(*(id *)((char *)&self->super.super.super.isa
                                       + OBJC_IVAR___UIKeyboardDicationBackground__gradient[v6]));
  }
  return v3;
}

- (CGSize)currentScreenSize
{
  v2 = +[UIScreen mainScreen];
  [v2 _referenceBounds];
  double v4 = v3;
  double v6 = v5;

  uint64_t v7 = +[UIKeyboard activeKeyboard];
  unint64_t v8 = [v7 interfaceOrientation] - 3;

  if (v8 >= 2) {
    double v9 = v4;
  }
  else {
    double v9 = v6;
  }
  if (v8 >= 2) {
    double v10 = v6;
  }
  else {
    double v10 = v4;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)applicationEnteredBackground
{
  [(UIView *)self removeFromSuperview];
  id v2 = +[UIPeripheralHost sharedInstance];
  [v2 disableInterfaceAutorotation:0];
}

- (CGPoint)positionForShow
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGSize)layoutSize
{
  +[UIDictationView viewSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGPoint)contentOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)backgroundOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)keyboardDidShow:(id)a3
{
  if (self->_keyboardInTransition)
  {
    double v4 = +[UIPeripheralHost sharedInstance];
    [v4 disableInterfaceAutorotation:0];

    self->_keyboardInTransition = 0;
  }
}

- (void)prepareForReturnToKeyboard
{
  id v3 = +[UIKeyboardImpl activeInstance];
  double v2 = [v3 textInteractionAssistant];
  [v2 selectionChanged];
}

- (void)finishReturnToKeyboard
{
  id v6 = +[UIDictationController sharedInstance];
  BOOL v2 = +[UIKeyboard isModelessActive];
  id v3 = +[UIKeyboardImpl activeInstance];
  double v4 = v3;
  if (v2)
  {
    if (![v3 isTrackpadMode]) {
      goto LABEL_6;
    }
    double v5 = [v4 _layout];
    [v5 didEndTrackpadModeForServerSideDictation];
  }
  else
  {
    double v5 = [v6 keyboardInputModeToReturn];
    [v4 setKeyboardInputMode:v5 userInitiated:0];
  }

LABEL_6:
  [v6 setKeyboardInputModeToReturn:0];
}

- (void)returnToKeyboard
{
  [(UIDictationView *)self prepareForReturnToKeyboard];
  [(UIDictationView *)self finishReturnToKeyboard];
}

- (BOOL)isShowing
{
  BOOL v2 = [(UIView *)self superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (UIDictationView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIDictationView;
  BOOL v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    if (![(UIDictationView *)v3 drawsOwnBackground])
    {
      double v5 = [UIKeyboardDicationBackground alloc];
      [(UIView *)v4 bounds];
      uint64_t v6 = -[UIKeyboardDicationBackground initWithFrame:](v5, "initWithFrame:");
      background = v4->_background;
      v4->_background = (UIKeyboardDicationBackground *)v6;

      unint64_t v8 = [(UIKeyboardDicationBackground *)v4->_background gradient];
      [v8 setDictationView:v4];

      [(UIView *)v4->_background setNeedsDisplay];
      [(UIView *)v4 addSubview:v4->_background];
    }
    double v9 = v4;
  }

  return v4;
}

- (void)removeBackgroundView
{
  [(UIView *)self->_background removeFromSuperview];
  BOOL v3 = [(UIKeyboardDicationBackground *)self->_background gradient];
  [v3 setDictationView:0];

  background = self->_background;
  self->_background = 0;
}

- (BOOL)drawsOwnBackground
{
  return 0;
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIApplicationDidEnterBackgroundNotification";
  v6[1] = @"UIKeyboardDidShowNotification";
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  [(UIDictationView *)self removeBackgroundView];
  v5.receiver = self;
  v5.super_class = (Class)UIDictationView;
  [(UIView *)&v5 dealloc];
}

- (void)endpointButtonPressed
{
  if (self->_displayDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    displayDelegate = self->_displayDelegate;
    [(UIDictationViewDisplayDelegate *)displayDelegate doneButtonPressed];
  }
  else
  {
    id v4 = +[UIDictationController sharedInstance];
    [v4 stopDictation];
  }
}

- (BOOL)visible
{
  BOOL v2 = [(UIView *)self window];
  BOOL v3 = v2 != 0;

  return v3;
}

- (float)audioLevelForFlamesView:(id)a3
{
  id v4 = a3;
  if (self->_displayDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(UIDictationViewDisplayDelegate *)self->_displayDelegate nextAudioLevel];
    float v6 = v5;
  }
  else
  {
    uint64_t v7 = +[UIDictationController sharedInstance];
    [v7 audioLevel];
    float v6 = v8;
  }
  return v6;
}

- (UIDictationViewDisplayDelegate)displayDelegate
{
  return self->_displayDelegate;
}

- (void)setDisplayDelegate:(id)a3
{
  self->_displayDelegate = (UIDictationViewDisplayDelegate *)a3;
}

- (BOOL)showLanguageLabel
{
  return self->_showLanguageLabel;
}

- (void)setShowLanguageLabel:(BOOL)a3
{
  self->_showLanguageLabel = a3;
}

- (BOOL)switchingLanguage
{
  return self->_switchingLanguage;
}

- (void)setSwitchingLanguage:(BOOL)a3
{
  self->_switchingLanguage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flamesView, 0);
  objc_storeStrong((id *)&self->_endpointButtonLandscape, 0);
  objc_storeStrong((id *)&self->_endpointButton, 0);
  objc_storeStrong((id *)&self->_background, 0);
}

@end