@interface MFMailboxFilterPickerControl
- (CGSize)intrinsicContentSize;
- (MFMailboxFilterPickerControl)initWithFrame:(CGRect)a3;
- (NSString)filterDescription;
- (UILabel)filtersLabel;
- (UILabel)titleLabel;
- (UIPointerRegion)pointerRegion;
- (id)_fontForFilterLabels;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_fontMetricCacheDidInvalidate:(id)a3;
- (void)_handleTapGestureRecognizer;
- (void)_setupGestureRecognizer;
- (void)_setupSubviews;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setFilterDescription:(id)a3;
- (void)setFiltersLabel:(id)a3;
- (void)setPointerRegion:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation MFMailboxFilterPickerControl

- (id)_fontForFilterLabels
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  v3 = [v2 cachedPreferredFontForStyle:UIFontTextStyleCaption2 maximumContentSizeCategory:UIContentSizeCategoryExtraLarge];

  return v3;
}

- (MFMailboxFilterPickerControl)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilterPickerControl;
  v3 = -[MFMailboxFilterPickerControl initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFMailboxFilterPickerControl *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFMailboxFilterPickerControl *)v4 _setupSubviews];
    [(MFMailboxFilterPickerControl *)v4 _setupGestureRecognizer];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_fontMetricCacheDidInvalidate:" name:MFFontMetricCacheInvalidationNotification object:0];
  }
  return v4;
}

- (void)setFilterDescription:(id)a3
{
  v8 = (__CFString *)a3;
  v4 = [(MFMailboxFilterPickerControl *)self filtersLabel];
  if (v8) {
    CFStringRef v5 = v8;
  }
  else {
    CFStringRef v5 = &stru_100619928;
  }
  [v4 setText:v5];

  [(MFMailboxFilterPickerControl *)self invalidateIntrinsicContentSize];
  v6 = [(MFMailboxFilterPickerControl *)self titleLabel];
  [v6 sizeToFit];

  objc_super v7 = [(MFMailboxFilterPickerControl *)self filtersLabel];
  [v7 sizeToFit];

  [(MFMailboxFilterPickerControl *)self setPointerRegion:0];
}

- (UILabel)filtersLabel
{
  return self->_filtersLabel;
}

- (void)_setupSubviews
{
  id v10 = [(MFMailboxFilterPickerControl *)self _fontForFilterLabels];
  id v3 = objc_alloc_init((Class)UILabel);
  v4 = +[NSBundle mainBundle];
  CFStringRef v5 = [v4 localizedStringForKey:@"FILTERS_CHOOSE" value:&stru_100619928 table:@"Main"];
  [v3 setText:v5];

  v6 = +[UIColor labelColor];
  [v3 setTextColor:v6];

  [v3 setTextAlignment:1];
  [v3 setFont:v10];
  [(MFMailboxFilterPickerControl *)self setTitleLabel:v3];
  [(MFMailboxFilterPickerControl *)self addSubview:v3];
  id v7 = objc_alloc_init((Class)UILabel);
  v8 = +[UIColor mailInteractiveColor];
  [v7 setTextColor:v8];

  [v7 setTextAlignment:1];
  [v7 _setTextColorFollowsTintColor:1];
  [v7 setFont:v10];
  [(MFMailboxFilterPickerControl *)self setFiltersLabel:v7];
  [(MFMailboxFilterPickerControl *)self addSubview:v7];
  id v9 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:self];
  [(MFMailboxFilterPickerControl *)self addInteraction:v9];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setPointerRegion:(id)a3
{
}

- (void)setFiltersLabel:(id)a3
{
}

- (void)_setupGestureRecognizer
{
  id v3 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleTapGestureRecognizer"];
  -[MFMailboxFilterPickerControl addGestureRecognizer:](self, "addGestureRecognizer:");
}

- (void)_fontMetricCacheDidInvalidate:(id)a3
{
  id v6 = [(MFMailboxFilterPickerControl *)self _fontForFilterLabels];
  v4 = [(MFMailboxFilterPickerControl *)self titleLabel];
  CFStringRef v5 = [(MFMailboxFilterPickerControl *)self filtersLabel];
  [v4 setFont:v6];
  [v5 setFont:v6];
  [v4 sizeToFit];
  [v5 sizeToFit];
  [(MFMailboxFilterPickerControl *)self invalidateIntrinsicContentSize];
  [(MFMailboxFilterPickerControl *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)MFMailboxFilterPickerControl;
  [(MFMailboxFilterPickerControl *)&v19 layoutSubviews];
  [(MFMailboxFilterPickerControl *)self bounds];
  double Width = CGRectGetWidth(v20);
  v4 = [(MFMailboxFilterPickerControl *)self titleLabel];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  v11 = [(MFMailboxFilterPickerControl *)self titleLabel];
  [v11 setFrame:v6, v8, Width, v10];

  v12 = [(MFMailboxFilterPickerControl *)self filtersLabel];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;

  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = Width;
  v21.size.height = v10;
  double Height = CGRectGetHeight(v21);
  v18 = [(MFMailboxFilterPickerControl *)self filtersLabel];
  [v18 setFrame:v14 Height:Width:v16];
}

- (void)_handleTapGestureRecognizer
{
}

- (CGSize)intrinsicContentSize
{
  id v3 = [(MFMailboxFilterPickerControl *)self titleLabel];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(MFMailboxFilterPickerControl *)self filtersLabel];
  [v12 frame];
  CGFloat v28 = v14;
  CGFloat v29 = v13;
  CGFloat v26 = v16;
  CGFloat v27 = v15;

  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  CGFloat rect = v11;
  CGFloat v17 = v9;
  CGFloat v18 = v7;
  CGFloat v19 = v5;
  double Width = CGRectGetWidth(v31);
  v32.origin.x = v29;
  v32.origin.y = v28;
  v32.size.width = v27;
  v32.size.height = v26;
  double v21 = fmax(Width, CGRectGetWidth(v32));
  v33.origin.x = v19;
  v33.origin.y = v18;
  v33.size.width = v17;
  v33.size.height = rect;
  double Height = CGRectGetHeight(v33);
  v34.origin.x = v29;
  v34.origin.y = v28;
  v34.size.width = v27;
  v34.size.height = v26;
  double v23 = Height + CGRectGetHeight(v34);
  double v24 = v21;
  result.height = v23;
  result.width = v24;
  return result;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:MFFontMetricCacheInvalidationNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)MFMailboxFilterPickerControl;
  [(MFMailboxFilterPickerControl *)&v4 dealloc];
}

- (NSString)filterDescription
{
  v2 = [(MFMailboxFilterPickerControl *)self filtersLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  CGFloat v7 = [(MFMailboxFilterPickerControl *)self filtersLabel];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v6 location];
  v22.x = v16;
  v22.y = v17;
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  BOOL v18 = CGRectContainsPoint(v23, v22);

  if (v18)
  {
    CGFloat v19 = [(MFMailboxFilterPickerControl *)self pointerRegion];
  }
  else
  {
    CGFloat v19 = 0;
  }

  return v19;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc((Class)UITargetedPreview);
  id v6 = [(MFMailboxFilterPickerControl *)self filtersLabel];
  id v7 = [v5 initWithView:v6];

  double v8 = +[UIPointerEffect effectWithPreview:v7];
  CGFloat v9 = +[UIPointerStyle styleWithEffect:v8 shape:0];

  return v9;
}

- (UIPointerRegion)pointerRegion
{
  pointerRegion = self->_pointerRegion;
  if (!pointerRegion)
  {
    objc_super v4 = [(MFMailboxFilterPickerControl *)self filtersLabel];
    [v4 frame];
    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", @"MailboxFilterPickerControl");
    id v5 = (UIPointerRegion *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_pointerRegion;
    self->_pointerRegion = v5;

    pointerRegion = self->_pointerRegion;
  }

  return pointerRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerRegion, 0);
  objc_storeStrong((id *)&self->_filtersLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end