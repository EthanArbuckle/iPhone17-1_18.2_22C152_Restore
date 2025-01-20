@interface THWIntroMediaController
- (BOOL)allowSelectionPopoverForAutosizedCanvasController:(id)a3;
- (BOOL)autosizedCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)autosizedCanvasController:(id)a3 allowsSelectionForRep:(id)a4;
- (BOOL)isMovie;
- (CGSize)size;
- (NSURL)url;
- (THDocumentRoot)documentRoot;
- (THWIntroMediaController)initWithDocumentRoot:(id)a3;
- (THWIntroMediaControllerDelegate)delegate;
- (TSDInfo)info;
- (UIView)controlsView;
- (id)autosizedCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5;
- (id)autosizedCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)layoutGeometryForLayout:(id)a3;
- (id)p_controlsCanvasController;
- (void)autosizedCanvasControllerDidResize:(id)a3;
- (void)dealloc;
- (void)hostViewSizeDidChange;
- (void)p_positionControlPanel;
- (void)setDelegate:(id)a3;
@end

@implementation THWIntroMediaController

- (THWIntroMediaController)initWithDocumentRoot:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)THWIntroMediaController;
  v4 = [(THWIntroMediaController *)&v9 init];
  if (v4)
  {
    id v5 = [a3 properties];
    if (![v5 introMediaUrl]) {
      goto LABEL_8;
    }
    v4->_documentRoot = (THDocumentRoot *)a3;
    v4->_url = (NSURL *)[v5 introMediaUrl];
    unsigned int v6 = [v5 introMediaIsVideo];
    v4->_isMovie = v6;
    if (v6)
    {
      v4->_imageData = 0;
    }
    else
    {
      v7 = (TSPData *)[(THBookDescription *)[(THDocumentRoot *)v4->_documentRoot bookDescription] dataForAbsoluteURL:v4->_url context:[(THDocumentRoot *)v4->_documentRoot context]];
      v4->_imageData = v7;
      if (v7) {
        [+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool") addInterestInProviderForData:v4->_imageData];
      }
    }
    if (![(THWIntroMediaController *)v4 info])
    {
LABEL_8:

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  if (self->_imageData) {
    [+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool") removeInterestInProviderForData:self->_imageData];
  }

  [(THWAutosizedCanvasController *)self->_controlsCanvasController setDelegate:0];
  [(THWAutosizedCanvasController *)self->_controlsCanvasController teardown];

  v3.receiver = self;
  v3.super_class = (Class)THWIntroMediaController;
  [(THWIntroMediaController *)&v3 dealloc];
}

- (NSURL)url
{
  return self->_url;
}

- (TSDInfo)info
{
  if (self->_info) {
    return self->_info;
  }
  if (!self->_isMovie)
  {
    +[TSDBitmapImageProvider naturalSizeForImageData:self->_imageData];
    if (v6 <= 0.0) {
      return self->_info;
    }
    double v8 = v7;
    if (v7 <= 0.0) {
      return self->_info;
    }
    double v9 = v6;
    id v10 = objc_alloc_init((Class)TSSPropertyMap);
    id v11 = [objc_alloc((Class)TSDMediaStyle) initWithContext:[self->_documentRoot context] name:0 overridePropertyMap:v10 isVariation:0];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1C2730;
    v15[3] = &unk_456E38;
    v15[4] = self;
    v15[5] = v11;
    [(-[THDocumentRoot accessController](-[THWIntroMediaController documentRoot](self, "documentRoot"), "accessController")) performWrite:v15];
    id v12 = [objc_alloc((Class)TSDInfoGeometry) initWithSize:v9, v8];
    self->_info = (TSDInfo *)[[THImageInfo alloc] initWithContext:[(THDocumentRoot *)self->_documentRoot context] geometry:v12 style:v11 imageData:self->_imageData originalImageData:0];

LABEL_13:
    return self->_info;
  }
  v4 = +[AVAsset assetWithURL:self->_url];
  id v5 = [(AVAsset *)v4 tracksWithMediaType:AVMediaTypeVideo];
  if ([(NSArray *)v5 count])
  {
    if (v4) {
      [(AVAsset *)v4 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    if (CMTimeGetSeconds(&time) > 0.0)
    {
      [v5 objectAtIndex:0].naturalSize;
      id v12 = [objc_alloc((Class)TSDInfoGeometry) initWithSize:v13, v14];
      id v10 = [objc_alloc((Class)TSDMediaStyle) initWithContext:[self->_documentRoot context] name:0 overridePropertyMap:0 isVariation:0];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1C26F0;
      v16[3] = &unk_456E38;
      v16[4] = self;
      v16[5] = v10;
      [(-[THDocumentRoot accessController](-[THWIntroMediaController documentRoot](self, "documentRoot"), "accessController")) performWrite:v16];
      self->_info = (TSDInfo *)[[THWMovieInfo alloc] initWithContext:[(THDocumentRoot *)self->_documentRoot context] geometry:v12 style:v10 movieRemoteURL:self->_url loadedAsset:v4];
      goto LABEL_13;
    }
  }
  return self->_info;
}

- (CGSize)size
{
  id v2 = [(TSDInfo *)[(THWIntroMediaController *)self info] geometry];

  [v2 size];
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIView)controlsView
{
  id v2 = [(THWIntroMediaController *)self p_controlsCanvasController];

  return (UIView *)[v2 canvasView];
}

- (void)hostViewSizeDidChange
{
  [(THWAutosizedCanvasController *)self->_controlsCanvasController invalidateLayoutsAndFrames];

  [(THWIntroMediaController *)self p_positionControlPanel];
}

- (id)layoutGeometryForLayout:(id)a3
{
  [(THWIntroMediaControllerDelegate *)self->_delegate hostViewSizeForIntroMediaController:self];
  double v4 = v3;
  id v5 = objc_alloc((Class)TSDLayoutGeometry);
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v5 initWithSize:v8 transform:v4];
}

- (id)autosizedCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  return 0;
}

- (void)autosizedCanvasControllerDidResize:(id)a3
{
  if (a3)
  {
    if (self->_controlsCanvasController == a3) {
      [(THWIntroMediaController *)self p_positionControlPanel];
    }
  }
}

- (BOOL)autosizedCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)autosizedCanvasController:(id)a3 allowsSelectionForRep:(id)a4
{
  return 0;
}

- (BOOL)allowSelectionPopoverForAutosizedCanvasController:(id)a3
{
  return 0;
}

- (id)autosizedCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  return 0;
}

- (id)p_controlsCanvasController
{
  if (!self->_controlsCanvasController && self->_isMovie)
  {
    double v3 = [[THWAutosizedCanvasController alloc] initWithDelegate:self documentRoot:[(THWIntroMediaController *)self documentRoot]];
    self->_controlsCanvasController = v3;
    [(TSDInteractiveCanvasController *)[(THWAutosizedCanvasController *)v3 interactiveCanvasController] setCreateRepsForOffscreenLayouts:1];
    id v4 = [(THWIntroMediaControllerDelegate *)self->_delegate controlsInfoForIntroMediaController:self];
    if (v4) {
      [(TSDInteractiveCanvasController *)[(THWAutosizedCanvasController *)self->_controlsCanvasController interactiveCanvasController] setInfosToDisplay:+[NSArray arrayWithObject:v4]];
    }
  }
  return self->_controlsCanvasController;
}

- (void)p_positionControlPanel
{
  if (self->_controlsCanvasController)
  {
    [(THWIntroMediaControllerDelegate *)self->_delegate hostViewSizeForIntroMediaController:self];
    double v4 = v3;
    double v6 = v5;
    [(TSDCanvasView *)[(THWAutosizedCanvasController *)self->_controlsCanvasController canvasView] frame];
    if (v7 >= 59.0) {
      double v8 = v7;
    }
    else {
      double v8 = 59.0;
    }
    double v9 = [(THWAutosizedCanvasController *)self->_controlsCanvasController canvasView];
    -[TSDCanvasView setFrame:](v9, "setFrame:", 0.0, v6 + -59.0 + -40.0, v4, v8);
  }
}

- (THWIntroMediaControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWIntroMediaControllerDelegate *)a3;
}

- (BOOL)isMovie
{
  return self->_isMovie;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

@end