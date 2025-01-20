@interface CRLRealTimeSyncDecorator
+ (BOOL)shouldShowForICC:(id)a3;
- (CRLRealTimeSyncDecorator)initWithInteractiveCanvasController:(id)a3;
- (NSArray)decoratorOverlayRenderables;
- (id)p_imageForStyle:(int64_t)a3;
- (int64_t)p_styleForEditingCoordinator:(id)a3;
- (void)p_updateLayerContentIfNeeded;
- (void)p_updateLayerFrame;
- (void)p_updateRenderable;
@end

@implementation CRLRealTimeSyncDecorator

+ (BOOL)shouldShowForICC:(id)a3
{
  v3 = [a3 editingCoordinator];
  if ([v3 isInRealTimeSyncSession]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 realTimeSessionNeedsAccountUpgrade];
  }

  return v4;
}

- (CRLRealTimeSyncDecorator)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLRealTimeSyncDecorator;
  v5 = [(CRLRealTimeSyncDecorator *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    uint64_t v7 = +[CRLNoDefaultImplicitActionRenderable renderable];
    renderable = v6->_renderable;
    v6->_renderable = (CRLCanvasRenderable *)v7;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_icc);
    v10 = [WeakRetained editingCoordinator];
    v6->_style = [(CRLRealTimeSyncDecorator *)v6 p_styleForEditingCoordinator:v10];

    v6->_shouldDisplayContent = 0;
    [(CRLRealTimeSyncDecorator *)v6 p_updateRenderable];
  }

  return v6;
}

- (int64_t)p_styleForEditingCoordinator:(id)a3
{
  id v3 = a3;
  if ([v3 realTimeSessionUsesEncryption])
  {
    int64_t v4 = 1;
  }
  else if ([v3 realTimeSessionNeedsAccountUpgrade])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)p_imageForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      CFStringRef v3 = @"exclamationmark.icloud";
LABEL_7:
      self = +[CRLImage imageWithSystemImageNamed:v3 pointSize:12.0];
      break;
    case 1:
      CFStringRef v3 = @"lock.icloud";
      goto LABEL_7;
    case 0:
      self = +[CRLImage imageNamed:@"AppIcon"];
      break;
  }

  return self;
}

- (void)p_updateLayerContentIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  int64_t v4 = [WeakRetained editingCoordinator];
  int64_t v5 = [(CRLRealTimeSyncDecorator *)self p_styleForEditingCoordinator:v4];

  if (self->_style != v5)
  {
    self->_style = v5;
    [(CRLRealTimeSyncDecorator *)self p_updateRenderable];
  }
}

- (void)p_updateRenderable
{
  id v3 = [(CRLRealTimeSyncDecorator *)self p_imageForStyle:self->_style];
  [v3 size];
  [(CRLCanvasRenderable *)self->_renderable setFrame:sub_100064070()];
  -[CRLCanvasRenderable setContents:](self->_renderable, "setContents:", [v3 CGImage]);
}

- (NSArray)decoratorOverlayRenderables
{
  if (self->_shouldDisplayContent)
  {
    [(CRLRealTimeSyncDecorator *)self p_updateLayerContentIfNeeded];
    [(CRLRealTimeSyncDecorator *)self p_updateLayerFrame];
    renderable = self->_renderable;
    id v3 = +[NSArray arrayWithObjects:&renderable count:1];
  }
  else
  {
    id v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (void)p_updateLayerFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  [WeakRetained visibleBoundsRect];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  double MinY = CGRectGetMinY(v20);
  [(CRLCanvasRenderable *)self->_renderable frame];
  sub_100064680(MaxX, MinY, v14 + 5.0);
  id v15 = [(CRLCanvasRenderable *)self->_renderable frame];
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v17 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v15, v16);
  v17.recordID.super.isa = (Class)self->_renderable;

  [(objc_class *)v17.recordID.super.isa setFrame:v17.recordType._object];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderable, 0);

  objc_destroyWeak((id *)&self->_icc);
}

@end