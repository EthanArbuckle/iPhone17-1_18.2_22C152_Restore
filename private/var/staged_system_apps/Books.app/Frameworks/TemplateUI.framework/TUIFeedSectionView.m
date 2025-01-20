@interface TUIFeedSectionView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSDictionary)tui_hostedSubviewsMap;
- (NSString)tui_querySectionUID;
- (NSUUID)tui_querySectionUUID;
- (TUIHoverController)hoverController;
- (TUIRenderModelSection)renderModel;
- (void)_updateClippingState;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setRenderModel:(id)a3;
- (void)setTui_hostedSubviewsMap:(id)a3;
- (void)setTui_querySectionUID:(id)a3;
- (void)setTui_querySectionUUID:(id)a3;
@end

@implementation TUIFeedSectionView

- (TUIHoverController)hoverController
{
  hoverController = self->_hoverController;
  if (!hoverController)
  {
    v4 = objc_alloc_init(TUIHoverController);
    v5 = self->_hoverController;
    self->_hoverController = v4;

    [(TUIHoverController *)self->_hoverController updateHoverInteractionWithView:self];
    hoverController = self->_hoverController;
  }

  return hoverController;
}

- (void)setRenderModel:(id)a3
{
  v5 = (TUIRenderModelSection *)a3;
  if (self->_renderModel != v5)
  {
    objc_storeStrong((id *)&self->_renderModel, a3);
    v6 = [(TUIRenderModelSection *)self->_renderModel hoverRegions];
    id v7 = [v6 count];

    if (v7)
    {
      long long v15 = 0uLL;
      uint64_t v16 = 0;
      if (v5) {
        [(TUIRenderModelSection *)v5 config];
      }
      v8 = [(TUIFeedSectionView *)self hoverController];
      v9 = [v8 hoverInteraction];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_37E30;
      v12[3] = &unk_252808;
      v12[4] = self;
      long long v13 = v15;
      uint64_t v14 = v16;
      [v9 rebuildAllRegionsWithBlock:v12];
    }
    else
    {
      hoverController = self->_hoverController;
      if (hoverController)
      {
        [(TUIHoverController *)hoverController reset];
        v11 = self->_hoverController;
        self->_hoverController = 0;
      }
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUIFeedSectionView;
  -[TUIFeedSectionView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TUIFeedSectionView *)self _updateClippingState];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUIFeedSectionView;
  -[TUIFeedSectionView setBounds:](&v4, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TUIFeedSectionView *)self _updateClippingState];
}

- (void)_updateClippingState
{
  [(TUIFeedSectionView *)self bounds];
  BOOL IsEmpty = CGRectIsEmpty(v5);

  [(TUIFeedSectionView *)self setClipsToBounds:IsEmpty];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  unsigned __int8 v20 = 0;
  v16.receiver = self;
  v16.super_class = (Class)TUIFeedSectionView;
  unsigned __int8 v20 = -[TUIFeedSectionView pointInside:withEvent:](&v16, "pointInside:withEvent:", v7, x, y);
  if (*((unsigned char *)v18 + 24))
  {
    char v8 = 1;
  }
  else
  {
    v9 = [(TUIFeedSectionView *)self subviews];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_381E4;
    v11[3] = &unk_252830;
    v11[4] = self;
    double v14 = x;
    double v15 = y;
    id v12 = v7;
    long long v13 = &v17;
    [v9 enumerateObjectsUsingBlock:v11];

    char v8 = *((unsigned char *)v18 + 24) != 0;
  }
  _Block_object_dispose(&v17, 8);

  return v8;
}

- (NSDictionary)tui_hostedSubviewsMap
{
  return self->_hostedSubviewsMap;
}

- (void)setTui_hostedSubviewsMap:(id)a3
{
}

- (NSUUID)tui_querySectionUUID
{
  return self->_tui_querySectionUUID;
}

- (void)setTui_querySectionUUID:(id)a3
{
}

- (NSString)tui_querySectionUID
{
  return self->_tui_querySectionUID;
}

- (void)setTui_querySectionUID:(id)a3
{
}

- (TUIRenderModelSection)renderModel
{
  return self->_renderModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_tui_querySectionUID, 0);
  objc_storeStrong((id *)&self->_tui_querySectionUUID, 0);
  objc_storeStrong((id *)&self->_hostedSubviewsMap, 0);

  objc_storeStrong((id *)&self->_hoverController, 0);
}

@end