@interface AEHighlightColorEditorController
+ (id)highlightImageForContextMenuForStyle:(int64_t)a3 pageTheme:(int64_t)a4;
+ (id)highlightImageForContextMenuForStyle:(int64_t)a3 pageTheme:(int64_t)a4 size:(double)a5;
+ (id)localizedColorNameStringForStyle:(int64_t)a3;
+ (id)p_themeForStyle:(int64_t)a3 pageTheme:(int64_t)a4;
+ (id)p_underlineForegroundImageForContextMenu;
+ (id)p_underlineForegroundImageForPageTheme:(int64_t)a3;
- (BOOL)canPresentInPosition:(int)a3;
- (BOOL)p_shouldShowCompactMenu;
- (BOOL)p_shouldShowShareButton;
- (IMCalloutBar)calloutBar;
- (UIAlertController)alertController;
- (UIButton)addNoteButton;
- (UIButton)deleteButton;
- (UIButton)rightArrowButton;
- (UIButton)shareButton;
- (UIView)colorControls;
- (id)p_buildPaletteImageForFrontTag:(int64_t)a3 middleTag:(int64_t)a4 backTag:(int64_t)a5 pageTheme:(int64_t)a6;
- (id)p_colorControlImageForColor:(id)a3;
- (id)p_colorControlImageForColor:(id)a3 withForegroundImage:(id)a4;
- (id)p_colorControlImageForTag:(int64_t)a3 pageTheme:(int64_t)a4;
- (id)p_colorControlUnderlineImageForPageTheme:(int64_t)a3;
- (id)p_colorForTag:(int64_t)a3 pageTheme:(int64_t)a4;
- (id)p_monochromaticImageFromImage:(id)a3 withColor:(id)a4;
- (id)p_noteGlyphForTag:(int64_t)a3 pageTheme:(int64_t)a4;
- (id)p_paletteImageForTag:(int64_t)a3 pageTheme:(int64_t)a4;
- (id)p_paletteImageWithFrontColor:(id)a3 middleColor:(id)a4 backColor:(id)a5 frontForegroundImage:(id)a6;
- (id)p_themeForStyle:(int64_t)a3 pageTheme:(int64_t)a4;
- (int64_t)p_buttonTagForTheme:(id)a3;
- (int64_t)pageTheme;
- (void)didShow;
- (void)handleAddNoteButton:(id)a3;
- (void)handleDeleteButtonTap:(id)a3;
- (void)handleRightArrowButton:(id)a3;
- (void)handleShareButton:(id)a3;
- (void)loadView;
- (void)p_drawColorControlCircleWithFrame:(CGRect)a3 color:(id)a4;
- (void)p_drawCrescentWithCircleRect:(CGRect)a3 color:(id)a4 leftShift:(double)a5 addRadius:(double)a6;
- (void)p_postDeleteConfirmation;
- (void)p_removeAnnotation:(id)a3;
- (void)p_setStyle:(int64_t)a3 forAnnotation:(id)a4;
- (void)p_updateAppearance;
- (void)presentFromRect:(CGRect)a3 view:(id)a4;
- (void)releaseOutlets;
- (void)setAddNoteButton:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setCalloutBar:(id)a3;
- (void)setColorControls:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setPageTheme:(int64_t)a3;
- (void)setPosition:(int)a3;
- (void)setRightArrowButton:(id)a3;
- (void)setShareButton:(id)a3;
- (void)showColorControlsMenu:(id)a3;
- (void)useColorOf:(id)a3;
- (void)viewDidLoad;
- (void)willShow;
@end

@implementation AEHighlightColorEditorController

- (void)releaseOutlets
{
  v7.receiver = self;
  v7.super_class = (Class)AEHighlightColorEditorController;
  [(AEAnnotationPopoverViewController *)&v7 releaseOutlets];
  [(AEHighlightColorEditorController *)self setCalloutBar:0];
  [(AEHighlightColorEditorController *)self setColorControls:0];
  v3 = [(AEHighlightColorEditorController *)self addNoteButton];
  [v3 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(AEHighlightColorEditorController *)self setAddNoteButton:0];
  v4 = [(AEHighlightColorEditorController *)self deleteButton];
  [v4 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(AEHighlightColorEditorController *)self setDeleteButton:0];
  v5 = [(AEHighlightColorEditorController *)self rightArrowButton];
  [v5 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(AEHighlightColorEditorController *)self setRightArrowButton:0];
  v6 = [(AEHighlightColorEditorController *)self shareButton];
  [v6 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(AEHighlightColorEditorController *)self setShareButton:0];
  [(AEHighlightColorEditorController *)self setAlertController:0];
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 435.0, 55.0];
  [(AEHighlightColorEditorController *)self setView:v3];
}

- (void)viewDidLoad
{
  v55.receiver = self;
  v55.super_class = (Class)AEHighlightColorEditorController;
  [(AEAnnotationPopoverViewController *)&v55 viewDidLoad];
  id v3 = [IMCalloutBar alloc];
  v4 = [(AEHighlightColorEditorController *)self view];
  [v4 bounds];
  v5 = -[IMCalloutBar initWithFrame:](v3, "initWithFrame:");

  [(IMCalloutBar *)v5 setAutoresizingMask:18];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  objc_super v7 = [(AEAnnotationPopoverViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v8 = [(AEAnnotationPopoverViewController *)self annotation];
    unsigned int v54 = [v7 editorController:self isRightArrowEnabledForAnnotation:v8];
  }
  else
  {
    unsigned int v54 = 1;
  }
  if ([(AEHighlightColorEditorController *)self p_shouldShowCompactMenu])
  {
    v9 = [(AEAnnotationPopoverViewController *)self annotationTheme];
    int64_t v10 = [(AEHighlightColorEditorController *)self p_buttonTagForTheme:v9];

    v11 = [AEFingerPotView alloc];
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v16 = -[AEFingerPotView initWithFrame:](v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v17 = [(AEHighlightColorEditorController *)self p_paletteImageForTag:v10 pageTheme:[(AEHighlightColorEditorController *)self pageTheme]];
    [(AEFingerPotView *)v16 setImage:v17 forState:0];

    [(AEFingerPotView *)v16 addTarget:self action:"showColorControlsMenu:" forControlEvents:64];
    -[AEFingerPotView setFrame:](v16, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    v18 = IMCommonCoreBundle();
    v19 = [v18 localizedStringForKey:@"Colors\\U2026" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
    [(AEFingerPotView *)v16 setAccessibilityLabel:v19];
  }
  else
  {
    v16 = [(AEHighlightColorEditorController *)self colorControls];
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  [v6 addObject:v16];
  v20 = -[AEFingerPotView initWithFrame:]([AEFingerPotView alloc], "initWithFrame:", x, y, width, height);
  v21 = IMCommonCoreBundle();
  v22 = +[UIImage imageNamed:@"ib_text_pop_icon_trash" inBundle:v21];
  [(AEFingerPotView *)v20 setImage:v22 forState:0];

  [(AEFingerPotView *)v20 addTarget:self action:"handleDeleteButtonTap:" forControlEvents:64];
  -[AEFingerPotView setFrame:](v20, "setFrame:", 0.0, 0.0, 40.0, 38.0);
  v23 = IMCommonCoreBundle();
  v24 = [v23 localizedStringForKey:@"Remove Highlight" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  [(AEFingerPotView *)v20 setAccessibilityLabel:v24];

  [(AEHighlightColorEditorController *)self setDeleteButton:v20];
  [v6 addObject:v20];
  v25 = +[IMCalloutButton buttonWithType:0];
  mAddNoteButton = self->mAddNoteButton;
  self->mAddNoteButton = v25;

  v27 = self->mAddNoteButton;
  v28 = [(AEHighlightColorEditorController *)self p_noteGlyphForTag:1 pageTheme:[(AEHighlightColorEditorController *)self pageTheme]];
  [(UIButton *)v27 setImage:v28 forState:0];

  [(UIButton *)self->mAddNoteButton addTarget:self action:"handleAddNoteButton:" forControlEvents:64];
  -[UIButton setFrame:](self->mAddNoteButton, "setFrame:", 0.0, 0.0, 40.0, 38.0);
  v29 = IMCommonCoreBundle();
  v30 = [v29 localizedStringForKey:@"Note" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  [(UIButton *)self->mAddNoteButton setAccessibilityLabel:v30];

  [v6 addObject:self->mAddNoteButton];
  if ([(AEHighlightColorEditorController *)self p_shouldShowShareButton])
  {
    v31 = +[IMCalloutButton buttonWithType:0];
    mShareButton = self->mShareButton;
    self->mShareButton = v31;

    v33 = IMCommonCoreBundle();
    v34 = +[UIImage imageNamed:@"ib_text_pop_icon_actions" inBundle:v33];

    [(UIButton *)self->mShareButton setImage:v34 forState:0];
    [(UIButton *)self->mShareButton addTarget:self action:"handleShareButton:" forControlEvents:64];
    -[UIButton setFrame:](self->mShareButton, "setFrame:", 0.0, 0.0, 40.0, 38.0);
    v35 = IMCommonCoreBundle();
    v36 = [v35 localizedStringForKey:@"Share" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
    [(UIButton *)self->mShareButton setAccessibilityLabel:v36];

    [v6 addObject:self->mShareButton];
  }
  if (v54)
  {
    v37 = +[IMCalloutButton buttonWithType:0];
    v38 = IMCommonCoreBundle();
    v39 = +[UIImage imageNamed:@"ib_text_pop_icon_more" inBundle:v38];
    [v37 setImage:v39 forState:0];

    [v37 addTarget:self action:"handleRightArrowButton:" forControlEvents:64];
    [v37 setFrame:0.0, 0.0, 40.0, 38.0];
    v40 = IMCommonCoreBundle();
    v41 = [v40 localizedStringForKey:@"More" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
    [v37 setAccessibilityLabel:v41];

    [(AEHighlightColorEditorController *)self setRightArrowButton:v37];
    [v6 addObject:v37];
  }
  [(IMCalloutBar *)v5 setControls:v6];
  [(IMCalloutBar *)v5 sizeThatFitsControls:v6];
  double v43 = v42;
  double v45 = v44;
  if ([(AEHighlightColorEditorController *)self p_shouldShowCompactMenu])
  {
    id v46 = objc_alloc((Class)NSArray);
    v47 = [(AEHighlightColorEditorController *)self colorControls];
    id v48 = [v46 initWithObjects:v47];

    [(IMCalloutBar *)v5 sizeThatFitsControls:v48];
    if (v43 < v49) {
      double v43 = v49;
    }
  }
  -[IMCalloutBar setFrame:](v5, "setFrame:", 0.0, 0.0, v43, v45);
  [(IMCalloutBar *)v5 frame];
  double v50 = CGRectGetWidth(v56);
  [(IMCalloutBar *)v5 frame];
  double v51 = CGRectGetHeight(v57);
  v52 = [(AEHighlightColorEditorController *)self view];
  [v52 setFrame:0.0, 0.0, v50, v51];

  v53 = [(AEHighlightColorEditorController *)self view];
  [v53 addSubview:v5];

  [(AEHighlightColorEditorController *)self setCalloutBar:v5];
  [(AEHighlightColorEditorController *)self p_updateAppearance];
}

- (BOOL)p_shouldShowShareButton
{
  id v3 = [(AEAnnotationPopoverViewController *)self delegate];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v4 = [(AEAnnotationPopoverViewController *)self annotation];
    unsigned __int8 v5 = [v3 editorController:self isSharingEnabledForAnnotation:v4];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)p_shouldShowCompactMenu
{
  if ([(AEHighlightColorEditorController *)self im_isCompactWidth]) {
    return 1;
  }

  return [(AEHighlightColorEditorController *)self p_shouldShowShareButton];
}

- (UIView)colorControls
{
  mColorControls = self->mColorControls;
  if (!mColorControls)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    unsigned __int8 v5 = self->mColorControls;
    self->mColorControls = v4;

    id v6 = +[NSArray arrayWithObjects:@"Yellow", @"Green", @"Blue", @"Pink", @"Purple", @"Underline", 0];
    long long v21 = 0u;
    long long v22 = 0u;
    if ([(AEHighlightColorEditorController *)self p_shouldShowCompactMenu]) {
      double v7 = 0.0;
    }
    else {
      double v7 = 2.0;
    }
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v16 = (char *)[v8 indexOfObject:*(void *)(*((void *)&v21 + 1) + 8 * i)] + 1;
          v17 = -[AEFingerPotView initWithFrame:]([AEFingerPotView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
          v18 = [(AEHighlightColorEditorController *)self p_colorControlImageForTag:v16 pageTheme:[(AEHighlightColorEditorController *)self pageTheme]];
          [(AEFingerPotView *)v17 setMenuImage:v18];

          v19 = +[AEHighlightColorEditorController localizedColorNameStringForStyle:v16];
          [(AEFingerPotView *)v17 setAccessibilityLabel:v19];

          [(AEFingerPotView *)v17 addTarget:self action:"useColorOf:" forControlEvents:64];
          -[AEFingerPotView setFrame:](v17, "setFrame:", v7, 0.0, 38.0, 38.0);
          [(AEFingerPotView *)v17 setTag:v16];
          [(UIView *)self->mColorControls addSubview:v17];
          double v7 = v7 + 42.0;
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    -[UIView setFrame:](self->mColorControls, "setFrame:", 0.0, 0.0, v7 + -5.0, 38.0);
    mColorControls = self->mColorControls;
  }

  return mColorControls;
}

- (int64_t)p_buttonTagForTheme:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = 3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v4 = 2;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v4 = 1;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int64_t v4 = 4;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int64_t v4 = 5;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int64_t v4 = 6;
            }
            else {
              int64_t v4 = 0;
            }
          }
        }
      }
    }
  }

  return v4;
}

- (void)p_updateAppearance
{
  if ([(AEHighlightColorEditorController *)self isViewLoaded])
  {
    id v3 = [(AEAnnotationPopoverViewController *)self annotationTheme];
    int64_t v4 = [(AEHighlightColorEditorController *)self p_buttonTagForTheme:v3];

    for (uint64_t i = 1; i != 7; ++i)
    {
      id v6 = [(UIView *)self->mColorControls viewWithTag:i];
      [v6 setSelected:v4 == i];
    }
    mAddNoteButton = self->mAddNoteButton;
    id v8 = [(AEHighlightColorEditorController *)self p_noteGlyphForTag:v4 pageTheme:[(AEHighlightColorEditorController *)self pageTheme]];
    [(UIButton *)mAddNoteButton setImage:v8 forState:0];

    BOOL v9 = self->super.mPosition == 1;
    id v10 = [(AEHighlightColorEditorController *)self calloutBar];
    [v10 setUp:v9];
  }
}

- (BOOL)canPresentInPosition:(int)a3
{
  return a3 < 2;
}

- (void)willShow
{
  v4.receiver = self;
  v4.super_class = (Class)AEHighlightColorEditorController;
  [(AEAnnotationPopoverViewController *)&v4 willShow];
  id v3 = [(AEHighlightColorEditorController *)self calloutBar];
  [v3 setBlurDisabled:1];
}

- (void)didShow
{
  v4.receiver = self;
  v4.super_class = (Class)AEHighlightColorEditorController;
  [(AEAnnotationPopoverViewController *)&v4 didShow];
  id v3 = [(AEHighlightColorEditorController *)self calloutBar];
  [v3 setBlurDisabled:0];
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)AEHighlightColorEditorController;
  id v9 = a4;
  -[AEAnnotationPopoverViewController presentFromRect:view:](&v21, "presentFromRect:view:", v9, x, y, width, height);
  id v10 = [(AEHighlightColorEditorController *)self calloutBar];
  [v9 convertRect:v10 toView:x, y, width, height];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v22.origin.double x = v12;
  v22.origin.double y = v14;
  v22.size.double width = v16;
  v22.size.double height = v18;
  double MidX = CGRectGetMidX(v22);
  v20 = [(AEHighlightColorEditorController *)self calloutBar];
  [v20 setArrowX:MidX];
}

- (void)setPosition:(int)a3
{
  self->super.mPosition = a3;
  [(AEHighlightColorEditorController *)self p_updateAppearance];
}

+ (id)localizedColorNameStringForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = IMCommonCoreBundle();
      objc_super v4 = v3;
      CFStringRef v5 = @"Yellow";
      goto LABEL_9;
    case 2:
      id v3 = IMCommonCoreBundle();
      objc_super v4 = v3;
      CFStringRef v5 = @"Green";
      goto LABEL_9;
    case 3:
      id v3 = IMCommonCoreBundle();
      objc_super v4 = v3;
      CFStringRef v5 = @"Blue";
      goto LABEL_9;
    case 4:
      id v3 = IMCommonCoreBundle();
      objc_super v4 = v3;
      CFStringRef v5 = @"Pink";
      goto LABEL_9;
    case 5:
      id v3 = IMCommonCoreBundle();
      objc_super v4 = v3;
      CFStringRef v5 = @"Purple";
      goto LABEL_9;
    case 6:
      id v3 = IMCommonCoreBundle();
      objc_super v4 = v3;
      CFStringRef v5 = @"Underline";
LABEL_9:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

+ (id)p_themeForStyle:(int64_t)a3 pageTheme:(int64_t)a4
{
  switch(a3)
  {
    case 1:
      id v6 = +[AEAnnotationTheme yellowTheme:](AEAnnotationTheme, "yellowTheme:", a4, v4);
      goto LABEL_11;
    case 2:
      id v6 = +[AEAnnotationTheme greenTheme:](AEAnnotationTheme, "greenTheme:", a4, v4);
      goto LABEL_11;
    case 3:
      id v6 = +[AEAnnotationTheme blueTheme:](AEAnnotationTheme, "blueTheme:", a4, v4);
      goto LABEL_11;
    case 4:
      id v6 = +[AEAnnotationTheme pinkTheme:](AEAnnotationTheme, "pinkTheme:", a4, v4);
      goto LABEL_11;
    case 5:
      id v6 = +[AEAnnotationTheme purpleTheme:](AEAnnotationTheme, "purpleTheme:", a4, v4);
      goto LABEL_11;
    case 6:
      id v6 = +[AEAnnotationTheme underlineTheme:](AEAnnotationTheme, "underlineTheme:", a4, v4);
LABEL_11:
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

- (id)p_themeForStyle:(int64_t)a3 pageTheme:(int64_t)a4
{
  return +[AEHighlightColorEditorController p_themeForStyle:a3 pageTheme:a4];
}

- (void)p_setStyle:(int64_t)a3 forAnnotation:(id)a4
{
  id v6 = a4;
  double v7 = [(AEAnnotationPopoverViewController *)self annotationTheme];
  id v8 = [v7 pageTheme];

  id v10 = [(AEHighlightColorEditorController *)self p_themeForStyle:a3 pageTheme:v8];
  [(AEAnnotationPopoverViewController *)self setAnnotationTheme:v10];
  id v9 = [(AEAnnotationPopoverViewController *)self delegate];
  [v9 editorController:self setTheme:v10 forAnnotation:v6];
}

- (void)p_removeAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotationPopoverViewController *)self delegate];
  [v5 editorController:self deleteAnnotation:v4];
}

- (void)p_postDeleteConfirmation
{
  id v3 = IMCommonCoreBundle();
  id v4 = [v3 localizedStringForKey:@"Delete Highlight" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  id v5 = IMCommonCoreBundle();
  id v6 = [v5 localizedStringForKey:@"The associated note will also be deleted." value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  double v7 = IMCommonCoreBundle();
  id v8 = [v7 localizedStringForKey:@"Cancel" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  id v9 = IMCommonCoreBundle();
  id v10 = [v9 localizedStringForKey:@"Delete" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  double v11 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];
  [(AEHighlightColorEditorController *)self setAlertController:v11];
  CGFloat v12 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];
  [v11 addAction:v12];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1780BC;
  v14[3] = &unk_2CAB68;
  v14[4] = self;
  double v13 = +[UIAlertAction actionWithTitle:v10 style:2 handler:v14];
  [v11 addAction:v13];

  [(AEHighlightColorEditorController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(AEHighlightColorEditorController *)self alertController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  [(AEHighlightColorEditorController *)self setAlertController:0];
  v6.receiver = self;
  v6.super_class = (Class)AEHighlightColorEditorController;
  [(AEAnnotationPopoverViewController *)&v6 setDelegate:v4];
}

- (void)useColorOf:(id)a3
{
  id v4 = [a3 tag];
  id v5 = [(AEAnnotationPopoverViewController *)self annotation];
  [(AEHighlightColorEditorController *)self p_setStyle:v4 forAnnotation:v5];

  [(AEHighlightColorEditorController *)self p_updateAppearance];
}

- (void)showColorControlsMenu:(id)a3
{
  id v4 = objc_alloc((Class)NSArray);
  id v5 = [(AEHighlightColorEditorController *)self colorControls];
  id v7 = [v4 initWithObjects:v5, 0];

  objc_super v6 = [(AEHighlightColorEditorController *)self calloutBar];
  [v6 setControls:v7];
}

- (void)handleAddNoteButton:(id)a3
{
  [(AEAnnotationPopoverViewController *)self hide];
  id v5 = [(AEAnnotationPopoverViewController *)self delegate];
  id v4 = [(AEAnnotationPopoverViewController *)self annotation];
  [v5 editorController:self editNote:v4];
}

- (void)handleShareButton:(id)a3
{
  id v4 = [(AEAnnotationPopoverViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    objc_super v6 = [(AEAnnotationPopoverViewController *)self delegate];
    id v7 = [(AEAnnotationPopoverViewController *)self annotation];
    [v6 editorController:self shareAnnotation:v7];
  }

  [(AEAnnotationPopoverViewController *)self hide];
}

- (void)handleDeleteButtonTap:(id)a3
{
  id v4 = [(AEAnnotationPopoverViewController *)self annotation];
  char v5 = [v4 annotationNote];
  id v6 = [v5 length];

  if (v6)
  {
    [(AEHighlightColorEditorController *)self p_postDeleteConfirmation];
  }
  else
  {
    id v7 = [(AEAnnotationPopoverViewController *)self annotation];
    [(AEHighlightColorEditorController *)self p_removeAnnotation:v7];
  }

  [(AEAnnotationPopoverViewController *)self hide];
}

- (void)handleRightArrowButton:(id)a3
{
  id v5 = [(AEAnnotationPopoverViewController *)self delegate];
  [(AEAnnotationPopoverViewController *)self hide];
  id v4 = [(AEAnnotationPopoverViewController *)self annotation];
  [v5 editorController:self showEditMenuForAnnotation:v4];
}

+ (id)highlightImageForContextMenuForStyle:(int64_t)a3 pageTheme:(int64_t)a4
{
  return +[AEHighlightColorEditorController highlightImageForContextMenuForStyle:a3 pageTheme:a4 size:15.0];
}

+ (id)highlightImageForContextMenuForStyle:(int64_t)a3 pageTheme:(int64_t)a4 size:(double)a5
{
  id v8 = +[UIGraphicsImageRendererFormat preferredFormat];
  id v9 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v8 format:a5];
  if (a3 == 6)
  {
    id v10 = +[AEHighlightColorEditorController p_underlineForegroundImageForContextMenu];
  }
  else
  {
    BOOL v11 = (unint64_t)a4 < 2;
    CGFloat v12 = +[AEHighlightColorEditorController p_themeForStyle:a3 pageTheme:a4];
    double v13 = [v12 highlightColor];
    CGFloat v14 = [v13 bkaxAdjustedForIncreaseContrastAdjustingDarker:v11];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_178638;
    v17[3] = &unk_2CAB90;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    id v18 = v14;
    double v21 = a5;
    double v22 = a5;
    id v15 = v14;
    id v10 = [v9 imageWithActions:v17];
  }

  return v10;
}

- (id)p_colorForTag:(int64_t)a3 pageTheme:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1788D0;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_349510 != -1) {
    dispatch_once(&qword_349510, block);
  }
  id v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        id v7 = (void *)qword_349490;
        goto LABEL_24;
      case 1:
        id v7 = (void *)qword_349498;
        goto LABEL_24;
      case 2:
        id v7 = (void *)qword_3494A0;
        goto LABEL_24;
      case 3:
        id v7 = (void *)qword_3494A8;
        goto LABEL_24;
      case 4:
        id v7 = (void *)qword_349488;
        goto LABEL_24;
      case 5:
        id v7 = (void *)qword_3494B0;
        goto LABEL_24;
      case 6:
        id v7 = (void *)qword_3494C0;
        goto LABEL_24;
      case 7:
        id v7 = (void *)qword_3494D0;
        goto LABEL_24;
      case 8:
        id v7 = (void *)qword_3494E0;
        goto LABEL_24;
      case 9:
        id v7 = (void *)qword_3494F0;
        goto LABEL_24;
      case 10:
        id v7 = (void *)qword_349500;
        goto LABEL_24;
      case 11:
        id v7 = (void *)qword_3494B8;
        goto LABEL_24;
      case 12:
        id v7 = (void *)qword_3494C8;
        goto LABEL_24;
      case 13:
        id v7 = (void *)qword_3494D8;
        goto LABEL_24;
      case 14:
        id v7 = (void *)qword_3494E8;
        goto LABEL_24;
      case 15:
        id v7 = (void *)qword_3494F8;
        goto LABEL_24;
      case 16:
        id v7 = (void *)qword_349508;
LABEL_24:
        id v8 = +[NSNumber numberWithInteger:a3];
        id v6 = [v7 objectForKeyedSubscript:v8];

        break;
      default:
        id v6 = 0;
        break;
    }
  }

  return v6;
}

- (void)p_drawColorControlCircleWithFrame:(CGRect)a3 color:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v15);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v16);
  if (v9 >= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  [v8 setStroke];
  [v8 setFill];

  double v13 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", x, y, v11, v11);
  [v13 stroke];
  [v13 fill];

  CGContextRestoreGState(CurrentContext);
}

- (id)p_colorControlImageForColor:(id)a3 withForegroundImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11.CGFloat width = 38.0;
  v11.CGFloat height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  -[AEHighlightColorEditorController p_drawColorControlCircleWithFrame:color:](self, "p_drawColorControlCircleWithFrame:color:", v7, 6.0, 6.0, 26.0, 26.0);

  [v6 drawAtPoint:6.0, 6.0];
  id v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v8;
}

- (id)p_colorControlImageForColor:(id)a3
{
  return [(AEHighlightColorEditorController *)self p_colorControlImageForColor:a3 withForegroundImage:0];
}

+ (id)p_underlineForegroundImageForContextMenu
{
  v2 = +[UIColor systemRedColor];
  v10[0] = v2;
  id v3 = +[UIColor systemWhiteColor];
  v10[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v10 count:2];
  id v5 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v4];

  id v6 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:13.0];
  id v7 = [v5 configurationByApplyingConfiguration:v6];
  id v8 = +[UIImage systemImageNamed:@"underline" withConfiguration:v7];

  return v8;
}

+ (id)p_underlineForegroundImageForPageTheme:(int64_t)a3
{
  id v3 = @"ib_text_pop_icon_highlight_underline";
  if (a3 == 3) {
    id v3 = @"ib_text_pop_icon_highlight_underline_night";
  }
  id v4 = v3;
  id v5 = IMCommonCoreBundle();
  id v6 = +[UIImage imageNamed:v4 inBundle:v5];

  return v6;
}

- (id)p_colorControlUnderlineImageForPageTheme:(int64_t)a3
{
  id v5 = [(AEHighlightColorEditorController *)self p_colorForTag:6 pageTheme:a3];
  id v6 = +[AEHighlightColorEditorController p_underlineForegroundImageForPageTheme:a3];
  id v7 = [(AEHighlightColorEditorController *)self p_colorControlImageForColor:v5 withForegroundImage:v6];

  return v7;
}

- (id)p_colorControlImageForTag:(int64_t)a3 pageTheme:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_17933C;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_349540 != -1) {
    dispatch_once(&qword_349540, block);
  }
  id v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        id v7 = (void *)qword_349520;
        goto LABEL_12;
      case 1:
        id v7 = (void *)qword_349528;
        goto LABEL_12;
      case 2:
        id v7 = (void *)qword_349530;
        goto LABEL_12;
      case 3:
        id v7 = (void *)qword_349538;
        goto LABEL_12;
      case 4:
        id v7 = (void *)qword_349518;
LABEL_12:
        id v8 = +[NSNumber numberWithInteger:a3];
        id v6 = [v7 objectForKeyedSubscript:v8];

        break;
      default:
        id v6 = 0;
        break;
    }
  }

  return v6;
}

- (void)p_drawCrescentWithCircleRect:(CGRect)a3 color:(id)a4 leftShift:(double)a5 addRadius:(double)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v32.origin.double x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v28 = CGRectGetMidX(v32) - a5;
  v33.origin.double x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v33);
  v34.origin.double x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v27 = a6;
  double v29 = height;
  double v30 = CGRectGetHeight(v34) * 0.5 + a6;
  v35.origin.double x = x - a5;
  v35.origin.CGFloat y = y;
  double v14 = y;
  v35.size.CGFloat width = width;
  double v15 = width;
  v35.size.CGFloat height = height;
  CGRect v36 = CGRectInset(v35, -a6, -a6);
  CGFloat v16 = v36.origin.x;
  CGFloat v17 = v36.origin.y;
  CGFloat v18 = v36.size.height;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.double x = x;
  v37.origin.CGFloat y = v14;
  v37.size.CGFloat width = v15;
  v37.size.CGFloat height = height;
  double v20 = CGRectGetMaxX(v37);
  if (MaxX < v20) {
    double MaxX = v20;
  }
  double v21 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v28, MidY, v30, -1.57079633, 1.57079633, *(void *)&MidY);
  v38.origin.double x = v16;
  v38.origin.CGFloat y = v17;
  v38.size.CGFloat width = MaxX;
  v38.size.CGFloat height = v18;
  CGFloat v22 = CGRectGetMaxX(v38) + v27;
  v39.origin.double x = v16;
  v39.origin.CGFloat y = v17;
  v39.size.CGFloat width = MaxX;
  v39.size.CGFloat height = v18;
  [v21 addLineToPoint:v22, CGRectGetMaxY(v39)];
  v40.origin.double x = v16;
  v40.origin.CGFloat y = v17;
  v40.size.CGFloat width = MaxX;
  v40.size.CGFloat height = v18;
  CGFloat v23 = CGRectGetMaxX(v40) + v27;
  v41.origin.double x = v16;
  v41.origin.CGFloat y = v17;
  v41.size.CGFloat width = MaxX;
  v41.size.CGFloat height = v18;
  [v21 addLineToPoint:v23, CGRectGetMinY(v41)];
  v42.origin.double x = v16;
  v42.origin.CGFloat y = v17;
  v42.size.CGFloat width = MaxX;
  v42.size.CGFloat height = v18;
  double v24 = v30 + CGRectGetMinX(v42);
  v43.origin.double x = v16;
  v43.origin.CGFloat y = v17;
  v43.size.CGFloat width = MaxX;
  v43.size.CGFloat height = v18;
  [v21 addLineToPoint:v24, CGRectGetMinY(v43)];
  [v21 closePath];
  [v21 addClip];
  [v12 setStroke];
  [v12 setFill];

  v25 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", x, v14, v15, v29);
  [v25 stroke];
  [v25 fill];

  CGContextRestoreGState(CurrentContext);
}

- (id)p_paletteImageWithFrontColor:(id)a3 middleColor:(id)a4 backColor:(id)a5 frontForegroundImage:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  if (isRetina()) {
    double v14 = 1.5;
  }
  else {
    double v14 = 2.0;
  }
  v18.CGFloat width = 40.0;
  v18.CGFloat height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  -[AEHighlightColorEditorController p_drawCrescentWithCircleRect:color:leftShift:addRadius:](self, "p_drawCrescentWithCircleRect:color:leftShift:addRadius:", v11, 11.5, 5.0, 27.0, 27.0, 5.0, v14);

  -[AEHighlightColorEditorController p_drawCrescentWithCircleRect:color:leftShift:addRadius:](self, "p_drawCrescentWithCircleRect:color:leftShift:addRadius:", v12, 6.5, 5.0, 27.0, 27.0, 5.0, v14);
  -[AEHighlightColorEditorController p_drawColorControlCircleWithFrame:color:](self, "p_drawColorControlCircleWithFrame:color:", v13, 1.5, 5.0, 27.0, 27.0);

  [v10 drawInRect:CGRectMake(1.5, 5.0, 27.0, 27.0)];
  double v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)p_buildPaletteImageForFrontTag:(int64_t)a3 middleTag:(int64_t)a4 backTag:(int64_t)a5 pageTheme:(int64_t)a6
{
  id v11 = [(AEHighlightColorEditorController *)self p_colorForTag:a3 pageTheme:a6];
  id v12 = [(AEHighlightColorEditorController *)self p_colorForTag:a4 pageTheme:a6];
  id v13 = [(AEHighlightColorEditorController *)self p_colorForTag:a5 pageTheme:a6];
  if (a3 == 6)
  {
    double v14 = +[AEHighlightColorEditorController p_underlineForegroundImageForPageTheme:a6];
  }
  else
  {
    double v14 = 0;
  }
  double v15 = [(AEHighlightColorEditorController *)self p_paletteImageWithFrontColor:v11 middleColor:v12 backColor:v13 frontForegroundImage:v14];

  return v15;
}

- (id)p_paletteImageForTag:(int64_t)a3 pageTheme:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_179CDC;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_349570 != -1) {
    dispatch_once(&qword_349570, block);
  }
  id v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        id v7 = (void *)qword_349550;
        goto LABEL_12;
      case 1:
        id v7 = (void *)qword_349558;
        goto LABEL_12;
      case 2:
        id v7 = (void *)qword_349560;
        goto LABEL_12;
      case 3:
        id v7 = (void *)qword_349568;
        goto LABEL_12;
      case 4:
        id v7 = (void *)qword_349548;
LABEL_12:
        id v8 = +[NSNumber numberWithInteger:a3];
        id v6 = [v7 objectForKeyedSubscript:v8];

        break;
      default:
        id v6 = 0;
        break;
    }
  }

  return v6;
}

- (id)p_monochromaticImageFromImage:(id)a3 withColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 size];
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [v6 size];
  CGFloat v9 = v8;
  [v6 size];
  CGFloat v11 = v10;
  [v6 size];
  CGContextTranslateCTM(CurrentContext, 0.0, v12);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  id v13 = v6;
  double v14 = (CGImage *)[v13 CGImage];

  v19.origin.double x = 0.0;
  v19.origin.CGFloat y = 0.0;
  v19.size.CGFloat width = v9;
  v19.size.CGFloat height = v11;
  CGContextClipToMask(CurrentContext, v19, v14);
  [v5 setFill];

  v20.origin.double x = 0.0;
  v20.origin.CGFloat y = 0.0;
  v20.size.CGFloat width = v9;
  v20.size.CGFloat height = v11;
  CGContextFillRect(CurrentContext, v20);
  double v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)p_noteGlyphForTag:(int64_t)a3 pageTheme:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_17A270;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_3495A0 != -1) {
    dispatch_once(&qword_3495A0, block);
  }
  id v6 = 0;
  if (a3 && a3 <= 6)
  {
    switch(a4)
    {
      case 0:
        id v7 = (void *)qword_349580;
        goto LABEL_12;
      case 1:
        id v7 = (void *)qword_349588;
        goto LABEL_12;
      case 2:
        id v7 = (void *)qword_349590;
        goto LABEL_12;
      case 3:
        id v7 = (void *)qword_349598;
        goto LABEL_12;
      case 4:
        id v7 = (void *)qword_349578;
LABEL_12:
        double v8 = +[NSNumber numberWithInteger:a3];
        id v6 = [v7 objectForKeyedSubscript:v8];

        break;
      default:
        id v6 = 0;
        break;
    }
  }

  return v6;
}

- (IMCalloutBar)calloutBar
{
  return self->mCalloutBar;
}

- (void)setCalloutBar:(id)a3
{
}

- (void)setColorControls:(id)a3
{
}

- (UIButton)addNoteButton
{
  return self->mAddNoteButton;
}

- (void)setAddNoteButton:(id)a3
{
}

- (UIButton)deleteButton
{
  return self->mDeleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (UIButton)rightArrowButton
{
  return self->mRightArrowButton;
}

- (void)setRightArrowButton:(id)a3
{
}

- (UIButton)shareButton
{
  return self->mShareButton;
}

- (void)setShareButton:(id)a3
{
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int64_t)a3
{
  self->_pageTheme = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->mShareButton, 0);
  objc_storeStrong((id *)&self->mRightArrowButton, 0);
  objc_storeStrong((id *)&self->mDeleteButton, 0);
  objc_storeStrong((id *)&self->mAddNoteButton, 0);
  objc_storeStrong((id *)&self->mColorControls, 0);

  objc_storeStrong((id *)&self->mCalloutBar, 0);
}

@end