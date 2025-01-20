@interface UIKBScreenTraits
+ (UIKBScreenTraits)traitsWithScreen:(id)a3 orientation:(int64_t)a4;
+ (UIKBScreenTraits)traitsWithScreen:(id)a3 orientation:(int64_t)a4 ignoreRemoteKeyboard:(BOOL)a5;
+ (id)_activeKeyboardWindowForScreen:(id)a3;
+ (id)_activeUCBWindowForScreen:(id)a3;
+ (id)fullScreenTraitsWithScreen:(id)a3 orientation:(int64_t)a4;
+ (id)traitsForInputModeWithScreen:(id)a3;
+ (id)traitsForPopoverEmulatingWidth:(double)a3 minorEdge:(BOOL)a4 orientation:(int64_t)a5 idiom:(int64_t)a6;
+ (id)traitsForRemoteEmojiKeyboardForHostWidth:(double)a3 clientWidth:(double)a4 minorEdge:(BOOL)a5 orientation:(int64_t)a6 idiom:(int64_t)a7 isPopover:(BOOL)a8;
+ (void)setMockIdiom:(int64_t)a3;
- (BOOL)centerFilled;
- (BOOL)isEmojiScrollingDirectionVertical;
- (BOOL)isFloating;
- (BOOL)isInPopover;
- (BOOL)isKeyboardMinorEdgeWidth;
- (BOOL)isLinear;
- (BOOL)isSplit;
- (BOOL)knobInput;
- (BOOL)resizeKeyboardHeight;
- (BOOL)supportsSplit;
- (BOOL)touchInput;
- (BOOL)touchpadInput;
- (CGRect)assistantViewWindowBounds;
- (CGRect)bounds;
- (CGSize)keyboardScreenReferenceSize;
- (CGSize)preferredContentSizeInPopover;
- (CGSize)stretchFactor;
- (UIKBScreenTraits)initWithScreen:(id)a3 orientation:(int64_t)a4 allowFloating:(BOOL)a5 ignoreRemoteKeyboard:(BOOL)a6;
- (UIScreen)screen;
- (double)assistantViewWidth;
- (double)keyboardBarHeight;
- (double)keyboardHeightAdjustment;
- (double)keyboardWidth;
- (double)screenToNativeScaleRatio;
- (id)description;
- (id)initForInputModeWithScreen:(id)a3;
- (int64_t)idiom;
- (int64_t)orientation;
- (int64_t)preferredEmojiScrollingDirection;
- (void)setAssistantViewWidth:(double)a3;
- (void)setAssistantViewWindowBounds:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenterFilled:(BOOL)a3;
- (void)setIsSplit:(BOOL)a3;
- (void)setKeyboardBarHeight:(double)a3;
- (void)setKeyboardHeightAdjustment:(double)a3;
- (void)setKeyboardWidth:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPreferredContentSizeInPopover:(CGSize)a3;
- (void)setPreferredEmojiScrollingDirection:(int64_t)a3;
- (void)setResizeKeyboardHeight:(BOOL)a3;
- (void)setScreenToNativeScaleRatio:(double)a3;
- (void)setStretchFactor:(CGSize)a3;
- (void)setSupportsSplit:(BOOL)a3;
- (void)updateForLinearLayout:(BOOL)a3;
- (void)updateForTextInputTraits:(id)a3 supportedInteractionModel:(unint64_t)a4;
@end

@implementation UIKBScreenTraits

+ (id)_activeUCBWindowForScreen:(id)a3
{
  v3 = [a1 _activeKeyboardWindowForScreen:a3];
  v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v5 = [v4 visualModeManager];
  int v6 = [v5 shouldShowWithinAppWindow];

  if (v6)
  {
    v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v8 = [v7 containerWindow];

    v3 = (void *)v8;
  }
  return v3;
}

- (UIKBScreenTraits)initWithScreen:(id)a3 orientation:(int64_t)a4 allowFloating:(BOOL)a5 ignoreRemoteKeyboard:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v65.receiver = self;
  v65.super_class = (Class)UIKBScreenTraits;
  v11 = [(UIKBScreenTraits *)&v65 init];
  if (v11)
  {
    if (!v10 || [v10 _userInterfaceIdiom] == -1)
    {
      uint64_t v12 = +[UIScreen mainScreen];

      id v10 = (id)v12;
    }
    v13 = [(id)objc_opt_class() _activeKeyboardWindowForScreen:v10];
    v14 = [(id)objc_opt_class() _activeUCBWindowForScreen:v10];
    objc_storeStrong((id *)&v11->_screen, v10);
    uint64_t v15 = [v13 _keyboardOrientation];
    if ((!a4 || v15 == a4) && v13)
    {
      [v13 bounds];
      v11->_bounds.origin.x = v16;
      v11->_bounds.origin.y = v17;
      v11->_bounds.size.width = v18;
      v11->_bounds.size.height = v19;
      int64_t v20 = [v13 _keyboardOrientation];
    }
    else
    {
      [(UIScreen *)v11->_screen _boundsForInterfaceOrientation:a4];
      v11->_bounds.origin.x = v21;
      v11->_bounds.origin.y = v22;
      v11->_bounds.size.width = v23;
      v11->_bounds.size.height = v24;
      int64_t v20 = a4;
    }
    v11->_orientation = v20;
    [v14 bounds];
    v11->_assistantViewWindowBounds.origin.x = v25;
    v11->_assistantViewWindowBounds.origin.y = v26;
    v11->_assistantViewWindowBounds.size.width = v27;
    v11->_assistantViewWindowBounds.size.height = v28;
    v29 = [(UIScreen *)v11->_screen traitCollection];
    v11->_touchInput = [v29 primaryInteractionModel] == 1;

    v30 = [(UIScreen *)v11->_screen traitCollection];
    v11->_knobInput = [v30 primaryInteractionModel] == 2;

    v31 = [(UIScreen *)v11->_screen traitCollection];
    v11->_touchpadInput = [v31 primaryInteractionModel] == 8;

    v11->_isLinear = 0;
    v11->_isFirstPartyStickers = _UIApplicationIsFirstPartyStickers();
    int IsEmojiPoster = _UIApplicationIsEmojiPoster();
    BOOL v33 = 0;
    if (IsEmojiPoster) {
      BOOL v33 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
    }
    v11->_isEmojiPosterOniPad = v33;
    v11->_isStickerPickerService = _UIApplicationIsStickerPickerService();
    [v10 scale];
    double v35 = v34;
    [v10 nativeScale];
    v11->_screenToNativeScaleRatio = v35 / v36;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__UIKBScreenTraits_initWithScreen_orientation_allowFloating_ignoreRemoteKeyboard___block_invoke;
    block[3] = &unk_1E52D9F70;
    v37 = v11;
    v64 = v37;
    if (qword_1EB261C20 != -1) {
      dispatch_once(&qword_1EB261C20, block);
    }
    if (_MergedGlobals_1144) {
      *((void *)v37 + 9) = 1;
    }
    if (v7 && +[UIKeyboardImpl isFloating])
    {
      +[UIKeyboardImpl floatingScreenWidthToEmulate];
      *((void *)v37 + 7) = v38;
      *((void *)v37 + 10) = v38;
      *((unsigned char *)v37 + 27) = 1;
      *((unsigned char *)v37 + 32) = 1;
    }
    else if (v11->_isFirstPartyStickers)
    {
      id v39 = +[UIWindow _applicationKeyWindow];
      if (!v39)
      {
        +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        id v39 = (id)[v40 countByEnumeratingWithState:&v59 objects:v66 count:16];
        if (v39)
        {
          uint64_t v41 = *(void *)v60;
          while (2)
          {
            for (i = 0; i != v39; i = (char *)i + 1)
            {
              if (*(void *)v60 != v41) {
                objc_enumerationMutation(v40);
              }
              v43 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              if ((objc_msgSend(v43, "_isTextEffectsWindow", (void)v59) & 1) == 0)
              {
                id v39 = v43;
                goto LABEL_33;
              }
            }
            id v39 = (id)[v40 countByEnumeratingWithState:&v59 objects:v66 count:16];
            if (v39) {
              continue;
            }
            break;
          }
        }
LABEL_33:
      }
      v45 = objc_msgSend(v39, "rootViewController", (void)v59);
      v46 = [v45 view];
      [v46 bounds];
      *((void *)v37 + 7) = v47;

      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        double v48 = v37[7];
        if (v48 > 767.0) {
          double v48 = 767.0;
        }
        v37[7] = v48;
      }
      *((unsigned char *)v37 + 27) = 1;
      *((unsigned char *)v37 + 8) = 1;
      v37[2] = 0.0;
    }
    else if (v11->_isEmojiPosterOniPad)
    {
      *((unsigned char *)v37 + 27) = 1;
      +[UIKeyboardImpl floatingScreenWidthToEmulate];
      *((void *)v37 + 7) = v44;
      *((void *)v37 + 10) = v44;
      *((unsigned char *)v37 + 8) = 1;
      v37[2] = 0.0;
    }
    else
    {
      if (!v13 || a6) {
        [(UIScreen *)v11->_screen _boundsForInterfaceOrientation:a4];
      }
      else {
        [v13 bounds];
      }
      *((void *)v37 + 7) = v55;
      v37[10] = v11->_assistantViewWindowBounds.size.width;
      [(UIScreen *)v11->_screen _referenceBounds];
      if (v56 >= v57) {
        double v58 = v57;
      }
      else {
        double v58 = v56;
      }
      *((unsigned char *)v37 + 27) = v58 == v37[7];
      if ([v10 _userInterfaceIdiom] == 2 || objc_msgSend(v10, "_userInterfaceIdiom") == 8)
      {
        v11->_isLinear = 1;
        if ([v10 _userInterfaceIdiom] == 8)
        {
          *((unsigned char *)v37 + 8) = 1;
          *((void *)v37 + 2) = 2;
        }
      }
    }
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)v37 + 7) = _Q0;
  }
  return v11;
}

+ (id)_activeKeyboardWindowForScreen:(id)a3
{
  id v3 = a3;
  v4 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  int v5 = [v4 oldPathForSnapshot];

  int v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v7 = v6;
  if (v5) {
    [v6 containerWindow];
  }
  else {
  uint64_t v8 = [v6 keyboardWindow];
  }

  uint64_t v9 = [v3 _userInterfaceIdiom];
  if (v9 == 3)
  {
    id v10 = +[UIKeyboard activeKeyboard];
    uint64_t v11 = [v10 window];

    uint64_t v8 = (void *)v11;
  }
  return v8;
}

- (void).cxx_destruct
{
}

- (int64_t)idiom
{
  int64_t result = _mockIdiom;
  if (_mockIdiom == -1)
  {
    if (self->_isEmulatingIdiom)
    {
      return self->_idiomToEmulate;
    }
    else
    {
      int64_t result = [(UIScreen *)self->_screen _userInterfaceIdiom];
      if (result == 1)
      {
        if (+[UIKeyboard isInputSystemUI])
        {
          [(UIScreen *)self->_screen bounds];
          if (v4 >= v5) {
            double v6 = v5;
          }
          else {
            double v6 = v4;
          }
          double v7 = _UIScreenReferenceBoundsSizeForType(0xFuLL);
          return v6 >= (v7 + _UIScreenReferenceBoundsSizeForType(0x27uLL)) * 0.5;
        }
        else
        {
          return 1;
        }
      }
    }
  }
  return result;
}

+ (UIKBScreenTraits)traitsWithScreen:(id)a3 orientation:(int64_t)a4
{
  id v5 = a3;
  double v6 = [[UIKBScreenTraits alloc] initWithScreen:v5 orientation:a4 allowFloating:1 ignoreRemoteKeyboard:0];

  return v6;
}

+ (id)traitsForInputModeWithScreen:(id)a3
{
  id v3 = a3;
  id v4 = [[UIKBScreenTraits alloc] initForInputModeWithScreen:v3];

  return v4;
}

+ (UIKBScreenTraits)traitsWithScreen:(id)a3 orientation:(int64_t)a4 ignoreRemoteKeyboard:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  uint64_t v8 = [[UIKBScreenTraits alloc] initWithScreen:v7 orientation:a4 allowFloating:1 ignoreRemoteKeyboard:v5];

  return v8;
}

+ (id)fullScreenTraitsWithScreen:(id)a3 orientation:(int64_t)a4
{
  id v5 = a3;
  double v6 = [[UIKBScreenTraits alloc] initWithScreen:v5 orientation:a4 allowFloating:0 ignoreRemoteKeyboard:0];

  return v6;
}

+ (id)traitsForPopoverEmulatingWidth:(double)a3 minorEdge:(BOOL)a4 orientation:(int64_t)a5 idiom:(int64_t)a6
{
  uint64_t v9 = [[UIKBScreenTraits alloc] initWithScreen:0 orientation:a5 allowFloating:0 ignoreRemoteKeyboard:0];
  v9->_keyboardWidth = a3;
  v9->_assistantViewWidth = a3;
  *(_WORD *)&v9->_isKeyboardMinorEdgeWidth = 257;
  v9->_orientation = a5;
  v9->_isEmulatingIdiom = 1;
  v9->_idiomToEmulate = a6;
  return v9;
}

+ (id)traitsForRemoteEmojiKeyboardForHostWidth:(double)a3 clientWidth:(double)a4 minorEdge:(BOOL)a5 orientation:(int64_t)a6 idiom:(int64_t)a7 isPopover:(BOOL)a8
{
  BOOL v8 = a8;
  v14 = [[UIKBScreenTraits alloc] initWithScreen:0 orientation:a6 allowFloating:0 ignoreRemoteKeyboard:0];
  v14->_keyboardWidth = a4;
  v14->_assistantViewWidth = a4;
  v14->_hostKeyboardWidth = a3;
  v14->_isKeyboardMinorEdgeWidth = a5;
  v14->_orientation = a6;
  v14->_isEmulatingIdiom = 1;
  v14->_idiomToEmulate = a7;
  v14->_isInPopover = v8;
  if (v8) {
    v14->_preferredEmojiScrollingDirection = 1;
  }
  v14->_isStickerPickerServiceCollectionView = 1;
  return v14;
}

+ (void)setMockIdiom:(int64_t)a3
{
  _mockIdiom = a3;
}

- (id)initForInputModeWithScreen:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIKBScreenTraits;
  id v5 = [(UIKBScreenTraits *)&v8 init];
  if (v5)
  {
    if (!v4)
    {
      id v4 = +[UIScreen mainScreen];
    }
    if ([v4 _userInterfaceIdiom] == -1)
    {
      uint64_t v6 = +[UIScreen mainScreen];

      id v4 = (id)v6;
    }
    objc_storeStrong((id *)&v5->_screen, v4);
  }

  return v5;
}

void __82__UIKBScreenTraits_initWithScreen_orientation_allowFloating_ignoreRemoteKeyboard___block_invoke(uint64_t a1)
{
  if (qword_1EB261C28 != -1) {
    dispatch_once(&qword_1EB261C28, &__block_literal_global_359);
  }
  v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  id v4 = [v2 valueForPreferenceKey:@"VerticalScrollingInEmojiKeyboard"];

  BOOL v3 = ([v4 BOOLValue] & 1) != 0 || *(unsigned char *)(*(void *)(a1 + 32) + 35) != 0;
  _MergedGlobals_1144 = v3;
}

- (CGSize)keyboardScreenReferenceSize
{
  BOOL v3 = [(id)objc_opt_class() _activeKeyboardWindowForScreen:self->_screen];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 keyboardScreenReferenceSize];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    [(UIScreen *)self->_screen _referenceBounds];
    double v5 = v8;
    double v7 = v9;
  }

  double v10 = v5;
  double v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)updateForTextInputTraits:(id)a3 supportedInteractionModel:(unint64_t)a4
{
  if ([(UIScreen *)self->_screen _userInterfaceIdiom] == 3)
  {
    if (UIKeyboardCarPlayRequiresTouch()) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = a4;
    }
    switch(v6)
    {
      case 1uLL:
        uint64_t v7 = 26;
        uint64_t v8 = 24;
        uint64_t v9 = 25;
        break;
      case 8uLL:
        uint64_t v7 = 24;
        uint64_t v8 = 25;
        uint64_t v9 = 26;
        break;
      case 2uLL:
        uint64_t v7 = 26;
        uint64_t v8 = 25;
        uint64_t v9 = 24;
        break;
      default:
        return;
    }
    *((unsigned char *)&self->super.isa + v9) = 1;
    *((unsigned char *)&self->super.isa + v8) = 0;
    *((unsigned char *)&self->super.isa + v7) = 0;
  }
}

- (void)updateForLinearLayout:(BOOL)a3
{
  self->_isLinear = a3;
}

- (BOOL)isEmojiScrollingDirectionVertical
{
  return self->_preferredEmojiScrollingDirection == 1;
}

- (id)description
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; idiom = %d", -[UIKBScreenTraits idiom](self, "idiom"));
  objc_msgSend(v3, "appendFormat:", @"; isFloating = %d", -[UIKBScreenTraits isFloating](self, "isFloating"));
  objc_msgSend(v3, "appendFormat:", @"; touchInput = %d", -[UIKBScreenTraits touchInput](self, "touchInput"));
  objc_msgSend(v3, "appendFormat:", @"; knobInput = %d", -[UIKBScreenTraits knobInput](self, "knobInput"));
  objc_msgSend(v3, "appendFormat:", @"; touchpadInput = %d",
    [(UIKBScreenTraits *)self touchpadInput]);
  [(UIKBScreenTraits *)self keyboardWidth];
  objc_msgSend(v3, "appendFormat:", @"; keyboardWidth = %f", v4);
  objc_msgSend(v3, "appendFormat:", @"; isKeyboardMinorEdgeWidth = %d",
    [(UIKBScreenTraits *)self isKeyboardMinorEdgeWidth]);
  if (self->_keyboardBarHeight > 0.0)
  {
    [(UIKBScreenTraits *)self keyboardBarHeight];
    objc_msgSend(v3, "appendFormat:", @"; keyboardBarHeight = %f", v5);
  }
  [v3 appendString:@">"];
  return v3;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)knobInput
{
  return self->_knobInput;
}

- (BOOL)touchInput
{
  return self->_touchInput;
}

- (BOOL)touchpadInput
{
  return self->_touchpadInput;
}

- (double)keyboardWidth
{
  return self->_keyboardWidth;
}

- (void)setKeyboardWidth:(double)a3
{
  self->_keyboardWidth = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (BOOL)isKeyboardMinorEdgeWidth
{
  return self->_isKeyboardMinorEdgeWidth;
}

- (double)keyboardBarHeight
{
  return self->_keyboardBarHeight;
}

- (void)setKeyboardBarHeight:(double)a3
{
  self->_keyboardBarHeight = a3;
}

- (BOOL)isInPopover
{
  return self->_isInPopover;
}

- (CGSize)stretchFactor
{
  double width = self->_stretchFactor.width;
  double height = self->_stretchFactor.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setStretchFactor:(CGSize)a3
{
  self->_stretchFactor = a3;
}

- (BOOL)isSplit
{
  return self->_isSplit;
}

- (void)setIsSplit:(BOOL)a3
{
  self->_isSplit = a3;
}

- (BOOL)supportsSplit
{
  return self->_supportsSplit;
}

- (void)setSupportsSplit:(BOOL)a3
{
  self->_supportsSplit = a3;
}

- (BOOL)centerFilled
{
  return self->_centerFilled;
}

- (void)setCenterFilled:(BOOL)a3
{
  self->_centerFilled = a3;
}

- (int64_t)preferredEmojiScrollingDirection
{
  return self->_preferredEmojiScrollingDirection;
}

- (void)setPreferredEmojiScrollingDirection:(int64_t)a3
{
  self->_preferredEmojiScrollingDirection = a3;
}

- (double)assistantViewWidth
{
  return self->_assistantViewWidth;
}

- (void)setAssistantViewWidth:(double)a3
{
  self->_assistantViewWidth = a3;
}

- (CGRect)assistantViewWindowBounds
{
  double x = self->_assistantViewWindowBounds.origin.x;
  double y = self->_assistantViewWindowBounds.origin.y;
  double width = self->_assistantViewWindowBounds.size.width;
  double height = self->_assistantViewWindowBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAssistantViewWindowBounds:(CGRect)a3
{
  self->_assistantViewWindowBounds = a3;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (BOOL)isLinear
{
  return self->_isLinear;
}

- (BOOL)resizeKeyboardHeight
{
  return self->_resizeKeyboardHeight;
}

- (void)setResizeKeyboardHeight:(BOOL)a3
{
  self->_resizeKeyboardHeight = a3;
}

- (double)keyboardHeightAdjustment
{
  return self->_keyboardHeightAdjustment;
}

- (void)setKeyboardHeightAdjustment:(double)a3
{
  self->_keyboardHeightAdjustment = a3;
}

- (double)screenToNativeScaleRatio
{
  return self->_screenToNativeScaleRatio;
}

- (void)setScreenToNativeScaleRatio:(double)a3
{
  self->_screenToNativeScaleRatio = a3;
}

- (CGSize)preferredContentSizeInPopover
{
  double width = self->_preferredContentSizeInPopover.width;
  double height = self->_preferredContentSizeInPopover.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSizeInPopover:(CGSize)a3
{
  self->_preferredContentSizeInPopover = a3;
}

@end