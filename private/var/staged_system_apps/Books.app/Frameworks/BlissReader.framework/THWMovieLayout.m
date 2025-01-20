@interface THWMovieLayout
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isIntroMedia;
- (BOOL)isReflowablePresentation;
- (BOOL)p_isAutoplayAllowed;
- (BOOL)usesTransportController;
- (BOOL)usesTransportControllerControls;
- (THWAVMediaListener)mediaListener;
- (THWWidgetLayoutDelegate)delegate;
- (double)aspectRatio;
- (id)layoutForPlayButton;
- (id)layoutGeometryForLayout:(id)a3;
- (id)layoutGeometryFromProvider;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setMediaListener:(id)a3;
- (void)updateChildrenFromInfo;
- (void)wasRemovedFromLayoutController:(id)a3;
@end

@implementation THWMovieLayout

- (void)dealloc
{
  [(THWMovieLayout *)self setMediaListener:0];
  v3.receiver = self;
  v3.super_class = (Class)THWMovieLayout;
  [(THWMovieLayout *)&v3 dealloc];
}

- (BOOL)usesTransportController
{
  return 1;
}

- (void)wasRemovedFromLayoutController:(id)a3
{
  objc_super v3 = [(THWMovieLayout *)self mediaListener];

  [(THWAVMediaListener *)v3 mediaWillBeRemoved];
}

- (BOOL)isIntroMedia
{
  unsigned int v3 = [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self];
  return self->_delegate && v3 == 2;
}

- (double)aspectRatio
{
  [self geometry].size
  return v2 / v3;
}

- (BOOL)isExpanded
{
  unsigned int v3 = [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self] - 1;
  if (self->_delegate) {
    BOOL v4 = v3 >= 2;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (BOOL)isCompactFlowPresentation
{
  unsigned int v3 = [(THWMovieLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  unsigned int v3 = [(THWMovieLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (id)layoutGeometryFromProvider
{
  if ([(THWMovieLayout *)self isExpanded] || [(THWMovieLayout *)self isIntroMedia])
  {
    [(THWWidgetLayoutDelegate *)[(THWMovieLayout *)self delegate] widgetLayoutBounds];
    id v7 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v3, v4, v5, v6];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)THWMovieLayout;
    id v7 = [(THWMovieLayout *)&v10 layoutGeometryFromProvider];
  }
  v8 = v7;
  if ([(THWMovieLayout *)self usesTransportController]
    && ![(THWMovieLayout *)self mediaListener])
  {
    +[THWAVTransportController createTransportControllerForLayouts:](THWAVTransportController, "createTransportControllerForLayouts:", +[NSArray arrayWithObject:self]);
  }
  return v8;
}

- (BOOL)p_isAutoplayAllowed
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![(THWWidgetLayoutDelegate *)[(THWMovieLayout *)self delegate] widgetLayoutIsCompact:self])
  {
    return 1;
  }
  delegate = self->_delegate;

  return [(THWWidgetLayoutDelegate *)delegate widgetLayoutIsReflowablePresentation:self];
}

- (void)updateChildrenFromInfo
{
  objc_opt_class();
  [(THWMovieLayout *)self info];
  double v3 = (void *)TSUDynamicCast();
  if ([(THWMovieLayout *)self usesTransportControllerControls])
  {
    if (![(THWMovieLayout *)self isExpanded] && ![(THWMovieLayout *)self isIntroMedia])
    {
      [(THWMovieLayout *)self setChildren:+[THWAVTransportController transportControllerLayoutsForLayouts:](THWAVTransportController, "transportControllerLayoutsForLayouts:", +[NSArray arrayWithObject:self])];
      [(THWMovieLayout *)self invalidate];
    }
  }
  else if (!v3 {
         || ![v3 autoplayConfig]
  }
         || !objc_msgSend(objc_msgSend(v3, "autoplayConfig"), "enabled")
         || ![(THWMovieLayout *)self p_isAutoplayAllowed])
  {
    double v4 = [(THWControlLayout *)[THWButtonControlLayout alloc] initWithTag:1000];
    [(THWButtonControlLayout *)v4 invalidateFrame];
    [(THWMovieLayout *)self setChildren:+[NSArray arrayWithObject:v4]];
  }
}

- (id)layoutForPlayButton
{
  [self geometry].size
  TSDRectWithSize();
  id v6 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v3 + (v2 + -86.0) * 0.5, v5 + (v4 + -86.0) * 0.5, 86.0, 86.0];

  return v6;
}

- (id)layoutGeometryForLayout:(id)a3
{
  id result = (id)TSUProtocolCast();
  if (result)
  {
    if ([(THWMovieLayout *)self usesTransportControllerControls])
    {
      double v5 = [(THWMovieLayout *)self mediaListener];
      return [(THWAVMediaListener *)v5 layoutGeometryForLayout:"layoutGeometryForLayout:"];
    }
    else
    {
      return [(THWMovieLayout *)self layoutForPlayButton];
    }
  }
  return result;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
}

- (THWAVMediaListener)mediaListener
{
  return self->_mediaListener;
}

- (void)setMediaListener:(id)a3
{
}

- (BOOL)usesTransportControllerControls
{
  return self->_usesTransportControllerControls;
}

@end