@interface THWPopUpContentProvider
- (BOOL)allowSelectionPopover;
- (BOOL)deferViewCreationForScrollableCanvasController:(id)a3;
- (BOOL)infosChangeForViewportChangeInScrollableCanvasController:(id)a3;
- (BOOL)scrollableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)scrollableCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5;
- (BOOL)scrollableCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)scrollableCanvasControllerUseOverlayScrollerOnly:(id)a3;
- (CGSize)sizeOfCanvasForScrollableCanvasController:(id)a3;
- (CGSize)unscaledContentSizeForFillScreen;
- (THBookNavigation)bookNavigator;
- (THDocumentNavigator)documentNavigator;
- (THWPopUpContentProvider)initWithPopUpInfo:(id)a3 scale:(double)a4 documentRoot:(id)a5 scrollableCanvasHost:(id)a6 bookNavigator:(id)a7 documentNavigator:(id)a8;
- (THWScrollableCanvasController)scrollableCanvasController;
- (THWScrollableCanvasHosting)scrollableCanvasHost;
- (TSKDocumentRoot)documentRoot;
- (TSWPopUpInfo)popupInfo;
- (TSWPopoverTheme)popoverTheme;
- (UIEdgeInsets)contentInsetsForScrollableCanvasController:(id)a3;
- (UIEdgeInsets)p_scaledEdgeInsets:(UIEdgeInsets)a3;
- (UIEdgeInsets)scrollViewContentInsetForScrollableCanvasController:(id)a3;
- (UIView)popoverContentView;
- (double)scale;
- (id)bookNavigatorForScrollableCanvasController:(id)a3;
- (id)documentNavigatorForScrollableCanvasController:(id)a3;
- (id)maskLayerForScrollableCanvasController:(id)a3;
- (id)scrollableCanvasController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6;
- (id)scrollableCanvasController:(id)a3 geometryProviderForLayout:(id)a4;
- (id)scrollableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4;
- (id)scrollableCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)strokeLayerForScrollableCanvasController:(id)a3;
- (void)dealloc;
- (void)disableCanvasInteraction;
- (void)displayModeDidChange:(int)a3;
- (void)p_updateWithSettings:(id)a3;
- (void)teardown;
@end

@implementation THWPopUpContentProvider

- (THWPopUpContentProvider)initWithPopUpInfo:(id)a3 scale:(double)a4 documentRoot:(id)a5 scrollableCanvasHost:(id)a6 bookNavigator:(id)a7 documentNavigator:(id)a8
{
  v16.receiver = self;
  v16.super_class = (Class)THWPopUpContentProvider;
  v14 = [(THWPopUpContentProvider *)&v16 init];
  if (v14)
  {
    v14->_popupInfo = (TSWPopUpInfo *)a3;
    v14->_documentRoot = (TSKDocumentRoot *)a5;
    v14->_scrollableCanvasHost = (THWScrollableCanvasHosting *)a6;
    v14->_scale = a4;
    v14->_bookNavigator = (THBookNavigation *)a7;
    v14->_documentNavigator = (THDocumentNavigator *)a8;
    v14->_scrollableCanvasController = [[THWScrollableCanvasController alloc] initWithDocumentRoot:a5];
    [(THWScrollableCanvasController *)[(THWPopUpContentProvider *)v14 scrollableCanvasController] setDelegate:v14];
    [(THWPopUpContentProvider *)v14 p_updateWithSettings:[(TSWPopUpInfo *)[(THWPopUpContentProvider *)v14 popupInfo] frameViewSettings]];
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWPopUpContentProvider;
  [(THWPopUpContentProvider *)&v3 dealloc];
}

- (void)p_updateWithSettings:(id)a3
{
  -[THWScrollableCanvasController createViewIfNeededWithFrame:viewScale:](self->_scrollableCanvasController, "createViewIfNeededWithFrame:viewScale:", a3, 0.0, 0.0, 100.0, 100.0, 1.0);
  [(TSKScrollView *)[(THWScrollableCanvasController *)self->_scrollableCanvasController scrollView] setMayPassScrollEventsToNextResponder:0];
  if ([(THWScrollableCanvasController *)self->_scrollableCanvasController mainView])
  {
    [self popupInfo].frameViewSettings.frameViewSize
    [(THWPopUpContentProvider *)self scale];
    [(THWPopUpContentProvider *)self scale];
    TSDRectWithOriginAndSize();
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    scrollableCanvasController = self->_scrollableCanvasController;
    [(THWPopUpContentProvider *)self scale];
    -[THWScrollableCanvasController setFrame:scale:](scrollableCanvasController, "setFrame:scale:", v5, v7, v9, v11, v13);
  }
  [(-[THWPopUpContentProvider popupInfo](self, "popupInfo")) frameViewSettings frameCanvasContentInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(UIView *)[(THWScrollableCanvasController *)self->_scrollableCanvasController mainView] bounds];
  -[TSKScrollView setFrame:]([(THWScrollableCanvasController *)self->_scrollableCanvasController scrollView], "setFrame:", v17 + v22, v15 + v23, v24 - (v17 + v21), v25 - (v15 + v19));
  v26 = [(THWScrollableCanvasController *)self->_scrollableCanvasController scrollView];

  -[TSKScrollView setScrollIndicatorInsets:](v26, "setScrollIndicatorInsets:", 4.0, 0.0, 0.0, 2.0 - v21);
}

- (UIView)popoverContentView
{
  v2 = [(THWPopUpContentProvider *)self scrollableCanvasController];

  return [(THWScrollableCanvasController *)v2 mainView];
}

- (TSWPopoverTheme)popoverTheme
{
  v2 = [(THWPopUpContentProvider *)self popupInfo];

  return (TSWPopoverTheme *)[(TSWPopUpInfo *)v2 popoverTheme];
}

- (void)teardown
{
  [(THWScrollableCanvasController *)[(THWPopUpContentProvider *)self scrollableCanvasController] teardownController];
  [(THWScrollableCanvasController *)[(THWPopUpContentProvider *)self scrollableCanvasController] teardownView];
  objc_super v3 = [(THWPopUpContentProvider *)self scrollableCanvasController];

  [(THWScrollableCanvasController *)v3 setDelegate:0];
}

- (void)displayModeDidChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v4 = [(THWPopUpContentProvider *)self scrollableCanvasController];

  [(THWScrollableCanvasController *)v4 displayModeDidChange:v3];
}

- (CGSize)unscaledContentSizeForFillScreen
{
  v2 = [(THWPopUpContentProvider *)self scrollableCanvasController];

  [(THWScrollableCanvasController *)v2 unscaledContentSizeForFillScreen];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)disableCanvasInteraction
{
  v2 = [(THWPopUpContentProvider *)self scrollableCanvasController];

  [(THWScrollableCanvasController *)v2 disableCanvasInteraction];
}

- (CGSize)sizeOfCanvasForScrollableCanvasController:(id)a3
{
  id v3 = [(TSWPopUpInfo *)[(THWPopUpContentProvider *)self popupInfo] frameViewSettings];

  [v3 frameCanvasSize];
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)infosChangeForViewportChangeInScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)scrollableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4
{
  id v4 = [(TSWPopUpInfo *)[(THWPopUpContentProvider *)self popupInfo] frameViewSettings];

  return [v4 frameCanvasInfos];
}

- (UIEdgeInsets)p_scaledEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(THWPopUpContentProvider *)self scale];
  double v9 = top * v8;
  [(THWPopUpContentProvider *)self scale];
  double v11 = left * v10;
  [(THWPopUpContentProvider *)self scale];
  double v13 = bottom * v12;
  [(THWPopUpContentProvider *)self scale];
  double v15 = right * v14;
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  result.double right = v15;
  result.double bottom = v18;
  result.double left = v17;
  result.double top = v16;
  return result;
}

- (UIEdgeInsets)contentInsetsForScrollableCanvasController:(id)a3
{
  [(-[THWPopUpContentProvider popupInfo](self, "popupInfo", a3), "frameViewSettings") frameCanvasContentInsets];

  -[THWPopUpContentProvider p_scaledEdgeInsets:](self, "p_scaledEdgeInsets:");
  result.double right = v7;
  result.double bottom = v6;
  result.double left = v5;
  result.double top = v4;
  return result;
}

- (id)scrollableCanvasController:(id)a3 geometryProviderForLayout:(id)a4
{
  return 0;
}

- (id)scrollableCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  return 0;
}

- (THWScrollableCanvasHosting)scrollableCanvasHost
{
  return self->_scrollableCanvasHost;
}

- (id)strokeLayerForScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)maskLayerForScrollableCanvasController:(id)a3
{
  return 0;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  id v5 = [a4 gestureKind:a3];
  return v5 == (id)TSWPImmediateSingleTap;
}

- (BOOL)scrollableCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 1;
}

- (BOOL)allowSelectionPopover
{
  return 1;
}

- (id)scrollableCanvasController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6
{
  [(THWPopUpContentProvider *)self scrollableCanvasHost];
  double v9 = (void *)TSUProtocolCast();

  return [v9 actionForHyperlink:a4 inRep:a5 gesture:a6];
}

- (BOOL)deferViewCreationForScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)bookNavigatorForScrollableCanvasController:(id)a3
{
  return self->_bookNavigator;
}

- (id)documentNavigatorForScrollableCanvasController:(id)a3
{
  return self->_documentNavigator;
}

- (BOOL)scrollableCanvasControllerUseOverlayScrollerOnly:(id)a3
{
  return 1;
}

- (UIEdgeInsets)scrollViewContentInsetForScrollableCanvasController:(id)a3
{
  double v3 = 4.0;
  double v4 = 0.0;
  double v5 = 4.0;
  double v6 = 0.0;
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (THWScrollableCanvasController)scrollableCanvasController
{
  return self->_scrollableCanvasController;
}

- (TSWPopUpInfo)popupInfo
{
  return (TSWPopUpInfo *)objc_getProperty(self, a2, 16, 1);
}

- (TSKDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (double)scale
{
  return self->_scale;
}

- (THBookNavigation)bookNavigator
{
  return self->_bookNavigator;
}

- (THDocumentNavigator)documentNavigator
{
  return self->_documentNavigator;
}

@end