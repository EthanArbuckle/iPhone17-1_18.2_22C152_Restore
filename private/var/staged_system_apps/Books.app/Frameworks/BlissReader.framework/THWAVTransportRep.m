@interface THWAVTransportRep
- (BOOL)containerManagesChildView;
- (id)childViewSuperview;
- (id)transportLayout;
- (void)addChildViewsToArray:(id)a3;
- (void)setChildViewSuperview:(id)a3;
- (void)viewScaleDidChange;
- (void)willAddChildView:(id)a3 toView:(id)a4;
- (void)willBeRemoved;
- (void)willRemoveChildView:(id)a3;
@end

@implementation THWAVTransportRep

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportRep;
  [(THWAVTransportRep *)&v3 willBeRemoved];
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (id)transportLayout
{
  objc_opt_class();
  [(THWAVTransportRep *)self layout];

  return (id)TSUDynamicCast();
}

- (void)addChildViewsToArray:(id)a3
{
  objc_opt_class();
  [(THWAVTransportRep *)self layout];
  v5 = (void *)TSUDynamicCast();
  objc_msgSend(objc_msgSend(v5, "transportController"), "createTransportUI");
  [v5 layoutTransportUI];
  id v6 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "transportController"), "transportUI"), "onCanvasViews");
  if (v6)
  {
    id v7 = v6;
    if ([v6 count])
    {
      [a3 addObjectsFromArray:v7];
    }
  }
}

- (BOOL)containerManagesChildView
{
  return 1;
}

- (void)willAddChildView:(id)a3 toView:(id)a4
{
  [a4 addSubview:a3];

  [(THWAVTransportRep *)self setChildViewSuperview:a4];
}

- (void)willRemoveChildView:(id)a3
{
  objc_opt_class();
  [(THWAVTransportRep *)self layout];
  if ((objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "transportController"), "transportUI"), "onCanvasViews"), "containsObject:", a3) & 1) != 0|| (id v5 = -[THWAVTransportRep childViewSuperview](self, "childViewSuperview"), v5 == objc_msgSend(a3, "superview")))
  {
    [a3 removeFromSuperview];
  }
}

- (void)viewScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportRep;
  [(THWAVTransportRep *)&v3 viewScaleDidChange];
  objc_opt_class();
  [(THWAVTransportRep *)self layout];
  objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "transportController"), "viewScaleDidChange");
}

- (id)childViewSuperview
{
  return self->_childViewSuperview;
}

- (void)setChildViewSuperview:(id)a3
{
  self->_childViewSuperview = a3;
}

@end