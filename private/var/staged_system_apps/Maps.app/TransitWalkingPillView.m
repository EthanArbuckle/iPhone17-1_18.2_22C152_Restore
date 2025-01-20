@interface TransitWalkingPillView
- (CGSize)intrinsicContentSize;
- (NSString)text;
- (TransitWalkingPillView)init;
- (id)_textArtwork;
- (id)_walkingArtwork;
- (void)_configureViews;
- (void)_updateListView;
- (void)setText:(id)a3;
@end

@implementation TransitWalkingPillView

- (TransitWalkingPillView)init
{
  v5.receiver = self;
  v5.super_class = (Class)TransitWalkingPillView;
  v2 = [(TransitWalkingPillView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TransitWalkingPillView *)v2 _configureViews];
  }
  return v3;
}

- (void)_configureViews
{
  v3 = objc_alloc_init(TransitArtworkListView);
  artwortListView = self->_artwortListView;
  self->_artwortListView = v3;

  [(TransitArtworkListView *)self->_artwortListView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TransitWalkingPillView *)self addSubview:self->_artwortListView];
  v20 = [(TransitArtworkListView *)self->_artwortListView topAnchor];
  v19 = [(TransitWalkingPillView *)self topAnchor];
  v18 = [v20 constraintGreaterThanOrEqualToAnchor:v19];
  v21[0] = v18;
  v17 = [(TransitArtworkListView *)self->_artwortListView bottomAnchor];
  v16 = [(TransitWalkingPillView *)self bottomAnchor];
  v15 = [v17 constraintLessThanOrEqualToAnchor:v16];
  v21[1] = v15;
  objc_super v5 = [(TransitArtworkListView *)self->_artwortListView centerYAnchor];
  v6 = [(TransitWalkingPillView *)self centerYAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  v21[2] = v7;
  v8 = [(TransitArtworkListView *)self->_artwortListView leadingAnchor];
  v9 = [(TransitWalkingPillView *)self leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v21[3] = v10;
  v11 = [(TransitArtworkListView *)self->_artwortListView trailingAnchor];
  v12 = [(TransitWalkingPillView *)self trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v21[4] = v13;
  v14 = +[NSArray arrayWithObjects:v21 count:5];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)setText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    text = self->_text;
    self->_text = v4;

    [(TransitWalkingPillView *)self _updateListView];
  }
}

- (void)_updateListView
{
  v3 = [(TransitWalkingPillView *)self _walkingArtwork];
  uint64_t v4 = [(TransitWalkingPillView *)self _textArtwork];
  objc_super v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = [(TransitWalkingPillView *)self _walkingArtwork];
    v13[0] = v6;
    v7 = [(TransitWalkingPillView *)self _textArtwork];
    v13[1] = v7;
    v8 = +[NSArray arrayWithObjects:v13 count:2];

    v12 = v8;
    v9 = +[NSArray arrayWithObjects:&v12 count:1];
    v11 = v9;
    v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [(TransitArtworkListView *)self->_artwortListView setArtworkData:v10];
    [(TransitWalkingPillView *)self invalidateIntrinsicContentSize];
    [(TransitWalkingPillView *)self layoutIfNeeded];
  }
}

- (id)_walkingArtwork
{
  id v2 = [objc_alloc((Class)MKTransitShield) initWithShieldType:210002 text:0 color:0];
  v3 = +[MKTransitArtwork artworkWithShield:v2 accessibilityText:0];

  return v3;
}

- (id)_textArtwork
{
  id v2 = [(TransitWalkingPillView *)self text];
  v3 = [v2 _geo_serverFormattedString];

  id v4 = [objc_alloc((Class)MKTransitText) initWithFormattedString:v3];
  objc_super v5 = +[MKTransitArtwork artworkWithText:v4];

  return v5;
}

- (CGSize)intrinsicContentSize
{
  [(TransitArtworkListView *)self->_artwortListView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_artwortListView, 0);
}

@end