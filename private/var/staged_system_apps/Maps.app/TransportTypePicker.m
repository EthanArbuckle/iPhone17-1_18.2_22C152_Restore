@interface TransportTypePicker
- (NSArray)types;
- (NSMutableArray)segments;
- (TransportTypePicker)initWithCoder:(id)a3;
- (TransportTypePicker)initWithFrame:(CGRect)a3;
- (TransportTypePickerDelegate)delegate;
- (UISegmentedControl)segmentedControl;
- (UIStackView)segmentStackView;
- (id)_types;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)selectedType;
- (void)_customInit;
- (void)_didSelectSegment:(id)a3;
- (void)_didSelectSegmentInControl:(id)a3;
- (void)_didSelectType:(int64_t)a3;
- (void)_updateSegmentsForSelectedTransportType:(int64_t)a3;
- (void)_updateSubviews;
- (void)dealloc;
- (void)offlineStatusChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setSegments:(id)a3;
- (void)setSelectedType:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TransportTypePicker

- (void)dealloc
{
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  id authBlockListener = self->_authBlockListener;
  self->_id authBlockListener = 0;

  id featureBlockListener = self->_featureBlockListener;
  self->_id featureBlockListener = 0;

  v5.receiver = self;
  v5.super_class = (Class)TransportTypePicker;
  [(TransportTypePicker *)&v5 dealloc];
}

- (TransportTypePicker)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransportTypePicker;
  v3 = -[TransportTypePicker initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(TransportTypePicker *)v3 _customInit];
  }
  return v4;
}

- (TransportTypePicker)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransportTypePicker;
  v3 = [(TransportTypePicker *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(TransportTypePicker *)v3 _customInit];
  }
  return v4;
}

- (void)_customInit
{
  [(TransportTypePicker *)self _mapkit_addPointerInteractionWithDelegate:self];
  v3 = objc_opt_new();
  [(TransportTypePicker *)self addInteraction:v3];

  [(TransportTypePicker *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = +[UIColor clearColor];
  id v5 = [v4 CGColor];
  objc_super v6 = [(TransportTypePicker *)self layer];
  [v6 setBackgroundColor:v5];

  LODWORD(v7) = 1148846080;
  [(TransportTypePicker *)self setContentCompressionResistancePriority:1 forAxis:v7];
  self->_selectedType = 0;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [(TransportTypePicker *)self setAccessibilityIdentifier:v9];

  [(TransportTypePicker *)self _updateSubviews];
  [(TransportTypePicker *)self _updateSegmentsForSelectedTransportType:[(TransportTypePicker *)self selectedType]];
  if (sub_10008034C())
  {
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"offlineStatusChanged:" name:@"UsingOfflineMapsStateChangedNotification" object:0];
  }
}

- (void)_updateSubviews
{
  if (sub_1000BBB44(self) == 5)
  {
    segments = self->_segments;
    self->_segments = 0;

    [(UIStackView *)self->_segmentStackView removeFromSuperview];
    segmentStackView = self->_segmentStackView;
    self->_segmentStackView = 0;

    id v5 = [(TransportTypePicker *)self types];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100B1C00C;
    v34[3] = &unk_101318280;
    v34[4] = self;
    objc_super v6 = sub_100099700(v5, v34);

    segmentedControl = self->_segmentedControl;
    if (segmentedControl)
    {
      [(UISegmentedControl *)segmentedControl removeAllSegments];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100B1C28C;
      v33[3] = &unk_1013182A8;
      v33[4] = self;
      [v6 enumerateObjectsUsingBlock:v33];
    }
    else
    {
      v13 = (UISegmentedControl *)[objc_alloc((Class)UISegmentedControl) initWithItems:v6];
      v14 = self->_segmentedControl;
      self->_segmentedControl = v13;

      [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UISegmentedControl *)self->_segmentedControl setControlSize:2];
      LODWORD(v15) = 1148846080;
      [(UISegmentedControl *)self->_segmentedControl setContentCompressionResistancePriority:1 forAxis:v15];
      [(UISegmentedControl *)self->_segmentedControl addTarget:self action:"_didSelectSegmentInControl:" forControlEvents:4096];
      [(UISegmentedControl *)self->_segmentedControl setAccessibilityIdentifier:@"TransportTypePickerSegementedControl"];
      NSAttributedStringKey v35 = NSForegroundColorAttributeName;
      v16 = +[UIColor secondaryLabelColor];
      v36 = v16;
      v17 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];

      [(UISegmentedControl *)self->_segmentedControl setTitleTextAttributes:v17 forState:0];
      [(TransportTypePicker *)self addSubview:self->_segmentedControl];
      id v18 = objc_alloc_init((Class)NSMutableArray);
      LODWORD(v19) = 1148846080;
      v20 = [(UISegmentedControl *)self->_segmentedControl _maps_constraintsEqualToEdgesOfView:self priority:v19];
      v21 = [v20 allConstraints];
      [v18 addObjectsFromArray:v21];

      +[NSLayoutConstraint activateConstraints:v18];
    }
    [(TransportTypePicker *)self _updateSegmentsForSelectedTransportType:self->_selectedType];
  }
  else
  {
    [(UISegmentedControl *)self->_segmentedControl removeFromSuperview];
    v8 = self->_segmentedControl;
    self->_segmentedControl = 0;

    v9 = +[NSMutableArray array];
    id v10 = self->_segments;
    self->_segments = v9;

    v11 = [(TransportTypePicker *)self types];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100B1C2AC;
    v32[3] = &unk_1012F8B90;
    v32[4] = self;
    [v11 enumerateObjectsUsingBlock:v32];

    v12 = self->_segmentStackView;
    if (v12)
    {
      [(UIStackView *)v12 _maps_setArrangedSubviews:self->_segments];
    }
    else
    {
      v22 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:self->_segments];
      v23 = self->_segmentStackView;
      self->_segmentStackView = v22;

      [(UIStackView *)self->_segmentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIStackView *)self->_segmentStackView setAxis:0];
      [(UIStackView *)self->_segmentStackView setDistribution:1];
      [(UIStackView *)self->_segmentStackView setAlignment:0];
      [(UIStackView *)self->_segmentStackView setSpacing:10.0];
      LODWORD(v24) = 1144750080;
      [(UIStackView *)self->_segmentStackView setContentHuggingPriority:1 forAxis:v24];
      LODWORD(v25) = 1132068864;
      [(UIStackView *)self->_segmentStackView setContentHuggingPriority:0 forAxis:v25];
      LODWORD(v26) = 1148846080;
      [(UIStackView *)self->_segmentStackView setContentCompressionResistancePriority:1 forAxis:v26];
      LODWORD(v27) = 1132068864;
      [(UIStackView *)self->_segmentStackView setContentCompressionResistancePriority:0 forAxis:v27];
      [(TransportTypePicker *)self addSubview:self->_segmentStackView];
      id v28 = objc_alloc_init((Class)NSMutableArray);
      LODWORD(v29) = 1148846080;
      v30 = [(UIStackView *)self->_segmentStackView _maps_constraintsEqualToEdgesOfView:self priority:v29];
      v31 = [v30 allConstraints];
      [v28 addObjectsFromArray:v31];

      +[NSLayoutConstraint activateConstraints:v28];
    }
    [(TransportTypePicker *)self _updateSegmentsForSelectedTransportType:self->_selectedType];
  }
}

- (NSArray)types
{
  types = self->_types;
  if (!types)
  {
    id v4 = [(TransportTypePicker *)self _types];
    id v5 = self->_types;
    self->_types = v4;

    types = self->_types;
  }

  return types;
}

- (id)_types
{
  id v2 = [objc_alloc((Class)NSMutableArray) initWithObjects:&off_1013AA6A8, &off_1013AA6C0, &off_1013AA6D8, &off_1013AA6F0, 0];
  BOOL v3 = sub_10008034C();
  id v4 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v5 = [v4 isUsingOfflineMaps];

  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6) {
    [v2 addObject:&off_1013AA708];
  }
  id v7 = [v2 copy];

  return v7;
}

- (void)setSelectedType:(int64_t)a3
{
  if (self->_selectedType != a3)
  {
    self->_selectedType = a3;
    -[TransportTypePicker _updateSegmentsForSelectedTransportType:](self, "_updateSegmentsForSelectedTransportType:");
  }
}

- (void)offlineStatusChanged:(id)a3
{
  types = self->_types;
  self->_types = 0;

  [(TransportTypePicker *)self _updateSubviews];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TransportTypePicker;
  [(TransportTypePicker *)&v12 traitCollectionDidChange:v4];
  unsigned int v5 = [(TransportTypePicker *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];
  if (v6 == [v4 userInterfaceIdiom])
  {
    id v7 = [(TransportTypePicker *)self traitCollection];
    [v7 displayScale];
    double v9 = v8;
    [v4 displayScale];
    double v11 = v10;

    if (v9 == v11) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(TransportTypePicker *)self _updateSubviews];
LABEL_6:
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  id v7 = [(NSMutableArray *)self->_segments count];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      double v10 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:v9];
      [v10 frame];
      CGRect v23 = CGRectInset(v22, -2.5, -2.5);
      double x = v23.origin.x;
      double y = v23.origin.y;
      double width = v23.size.width;
      double height = v23.size.height;
      [v6 location];
      v21.double x = v15;
      v21.double y = v16;
      v24.origin.double x = x;
      v24.origin.double y = y;
      v24.size.double width = width;
      v24.size.double height = height;
      if (CGRectContainsPoint(v24, v21)) {
        break;
      }

      if (v8 == (id)++v9) {
        goto LABEL_5;
      }
    }
    id v18 = +[NSNumber numberWithUnsignedInteger:v9];
    v17 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v18, x, y, width, height);
  }
  else
  {
LABEL_5:
    v17 = 0;
  }

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  id v6 = [v5 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v5 identifier];
    id v9 = [v8 unsignedIntegerValue];
    if (v9 >= [(NSMutableArray *)self->_segments count])
    {
      v14 = 0;
    }
    else
    {
      double v10 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:v9];
      id v11 = [objc_alloc((Class)UITargetedPreview) initWithView:v10];
      objc_super v12 = +[UIPointerEffect effectWithPreview:v11];
      [v10 frame];
      v13 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
      v14 = +[UIPointerStyle styleWithEffect:v12 shape:v13];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_didSelectSegment:(id)a3
{
  id v4 = [a3 transportType];

  [(TransportTypePicker *)self _didSelectType:v4];
}

- (void)_didSelectSegmentInControl:(id)a3
{
  id v4 = [a3 selectedSegmentIndex];
  id v5 = [(TransportTypePicker *)self types];
  id v6 = [v5 objectAtIndexedSubscript:v4];
  id v7 = [v6 integerValue];

  [(TransportTypePicker *)self _didSelectType:v7];
}

- (void)_didSelectType:(int64_t)a3
{
  -[TransportTypePicker setSelectedType:](self, "setSelectedType:");
  id v5 = [(TransportTypePicker *)self delegate];
  [v5 transportTypePicker:self typeSelected:a3];
}

- (void)_updateSegmentsForSelectedTransportType:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(TransportTypePicker *)self segments];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) setSelected:[*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) transportType] == (id)a3];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  double v10 = [(TransportTypePicker *)self types];
  id v11 = +[NSNumber numberWithInteger:a3];
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", [v10 indexOfObject:v11]);
}

- (TransportTypePickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransportTypePickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)selectedType
{
  return self->_selectedType;
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (UIStackView)segmentStackView
{
  return self->_segmentStackView;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_segmentStackView, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong(&self->_authBlockListener, 0);

  objc_storeStrong(&self->_featureBlockListener, 0);
}

@end