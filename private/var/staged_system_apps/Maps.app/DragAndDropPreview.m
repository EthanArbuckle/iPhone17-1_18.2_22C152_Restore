@interface DragAndDropPreview
- ($C79183323B9A0D5602617FF3BE5395AC)presentationMapRectForMapItem:(id)a3;
- (DragAndDropMapItem)item;
- (DragAndDropPreview)init;
- (DragAndDropPreview)initWithDragAndDropMapItem:(id)a3 traitCollection:(id)a4;
- (DragAndDropPreviewContentUpdateDelegate)contentUpdateDelegate;
- (DragAndDropPreviewImage)renderPreviewImage;
- (UITraitCollection)traitCollection;
- (id)dragFeatures;
- (id)imageRepresentation;
- (id)mapItem;
- (void)createSnapshot;
- (void)dragAndDropAnchorViewCellDidUpdateContent:(id)a3;
- (void)dragAndDropItem:(id)a3 didResolveMapItem:(id)a4;
- (void)setContentUpdateDelegate:(id)a3;
- (void)updateWithSnapshot:(id)a3;
@end

@implementation DragAndDropPreview

- (DragAndDropPreview)init
{
  return 0;
}

- (DragAndDropPreview)initWithDragAndDropMapItem:(id)a3 traitCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DragAndDropPreview;
  v9 = [(DragAndDropPreview *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dragItem, a3);
    [(DragAndDropMapItem *)v10->_dragItem setObserver:v10];
    objc_storeStrong((id *)&v10->_traitCollection, a4);
    v11 = [[DragAndDropAnchorView alloc] initWithDragAndDropMapItem:v7 previewTraitCollection:v8];
    anchorView = v10->_anchorView;
    v10->_anchorView = v11;

    [(DragAndDropAnchorView *)v10->_anchorView setContentUpdateDelegate:v10];
    [(DragAndDropPreview *)v10 createSnapshot];
  }

  return v10;
}

- (id)dragFeatures
{
  v2 = [(DragAndDropPreview *)self mapItem];
  v3 = +[_DragCustomFeature customFeatureForMapItem:v2];
  v6 = v3;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (id)mapItem
{
  resolvedMapItem = self->_resolvedMapItem;
  if (resolvedMapItem)
  {
    v3 = resolvedMapItem;
  }
  else
  {
    v3 = [(DragAndDropMapItem *)self->_dragItem originalMapItem];
  }

  return v3;
}

- (void)createSnapshot
{
  v3 = [(DragAndDropPreview *)self mapItem];
  if (v3 && !self->_snapshotStarted)
  {
    id v14 = v3;
    UIUserInterfaceIdiom v4 = [(UITraitCollection *)self->_traitCollection userInterfaceIdiom];

    if (v4 != UIUserInterfaceIdiomMac)
    {
      self->_snapshotStarted = 1;
      kdebug_trace();
      id v5 = objc_alloc_init((Class)MKMapSnapshotOptions);
      [v5 setMapType:0];
      [v5 setSize:206.0, 104.0];
      v6 = [(DragAndDropPreview *)self mapItem];
      [(DragAndDropPreview *)self presentationMapRectForMapItem:v6];
      [v5 setMapRect:];

      [v5 _setRendersInBackground:0];
      id v7 = [(DragAndDropPreview *)self dragFeatures];
      [v5 _setCustomFeatureAnnotations:v7];

      id v8 = +[MKPointOfInterestFilter filterIncludingAllCategories];
      [v5 setPointOfInterestFilter:v8];

      [v5 _setSearchResultsType:1];
      [v5 _setUseSnapshotService:0];
      [v5 _setShowsNightMode:[self->_traitCollection userInterfaceStyle] == 2];
      id v9 = [objc_alloc((Class)MKMapSnapshotter) initWithOptions:v5];
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INTERACTIVE, 0);

      v12 = dispatch_queue_create("dragPreviewRender", v11);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100DAB2C4;
      block[3] = &unk_1012E5D58;
      id v16 = v9;
      v17 = self;
      id v13 = v9;
      dispatch_async(v12, block);
    }
  }
  else
  {
  }
}

- (void)updateWithSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotImage, a3);
  id v4 = [(DragAndDropPreview *)self contentUpdateDelegate];
  [v4 dragAndDropPreviewDidUpdate:self];
}

- (id)imageRepresentation
{
  [(DragAndDropAnchorView *)self->_anchorView intrinsicContentSize];
  double v4 = v3;
  if ((id)[(UITraitCollection *)self->_traitCollection userInterfaceIdiom] == (id)5) {
    double v5 = 0.0;
  }
  else {
    double v5 = 104.0;
  }
  if ((id)[(UITraitCollection *)self->_traitCollection userInterfaceIdiom] == (id)5) {
    double v6 = 200.0;
  }
  else {
    double v6 = 206.0;
  }
  -[DragAndDropAnchorView setFrame:](self->_anchorView, "setFrame:", 0.0, v5, v6, v4);
  [(DragAndDropAnchorView *)self->_anchorView layoutIfNeeded];
  id v7 = objc_alloc((Class)UIGraphicsImageRenderer);
  id v8 = +[UIGraphicsImageRendererFormat formatForTraitCollection:self->_traitCollection];
  id v9 = [v7 initWithSize:v8 format:v6, v4 + v5];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100DAB668;
  v12[3] = &unk_101323F90;
  v12[5] = 0;
  v12[6] = 0;
  v12[4] = self;
  *(double *)&v12[7] = v6;
  *(double *)&v12[8] = v4 + v5;
  v12[9] = 0;
  *(double *)&v12[10] = v5;
  *(double *)&v12[11] = v6;
  *(double *)&v12[12] = v4;
  v12[13] = 0;
  v12[14] = 0;
  *(double *)&v12[15] = v6;
  *(double *)&v12[16] = v5;
  v10 = [v9 imageWithActions:v12];

  return v10;
}

- ($C79183323B9A0D5602617FF3BE5395AC)presentationMapRectForMapItem:(id)a3
{
  [a3 _coordinate];
  MKMapRectMakeWithRadialDistance();
  id v7 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v3, v4, v5, v6];
  GEOMapRectForMapRegion();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var1.var1 = v19;
  result.var1.var0 = v18;
  result.var0.var1 = v17;
  result.var0.var0 = v16;
  return result;
}

- (DragAndDropPreviewImage)renderPreviewImage
{
  v2 = [(DragAndDropPreview *)self imageRepresentation];
  [v2 size];
  double v5 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v3, v4, 13.0);
  double v6 = objc_alloc_init(DragAndDropPreviewImage);
  [(DragAndDropPreviewImage *)v6 setImage:v2];
  [(DragAndDropPreviewImage *)v6 setVisiblePath:v5];
  [(DragAndDropPreviewImage *)v6 setCornerRadius:13.0];

  return v6;
}

- (void)dragAndDropItem:(id)a3 didResolveMapItem:(id)a4
{
  objc_storeStrong((id *)&self->_resolvedMapItem, a4);
  id v6 = a4;
  [(DragAndDropAnchorView *)self->_anchorView updateWithResolvedMapItem:v6];

  [(DragAndDropPreview *)self createSnapshot];
}

- (void)dragAndDropAnchorViewCellDidUpdateContent:(id)a3
{
  id v4 = [(DragAndDropPreview *)self contentUpdateDelegate];
  [v4 dragAndDropPreviewDidUpdate:self];
}

- (DragAndDropMapItem)item
{
  return self->_dragItem;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (DragAndDropPreviewContentUpdateDelegate)contentUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentUpdateDelegate);

  return (DragAndDropPreviewContentUpdateDelegate *)WeakRetained;
}

- (void)setContentUpdateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentUpdateDelegate);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_resolvedMapItem, 0);
  objc_storeStrong((id *)&self->_anchorView, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);

  objc_storeStrong((id *)&self->_snapshotImage, 0);
}

@end