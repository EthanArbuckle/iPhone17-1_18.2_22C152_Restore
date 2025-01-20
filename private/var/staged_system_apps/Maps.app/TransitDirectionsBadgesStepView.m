@interface TransitDirectionsBadgesStepView
- (double)bottomSpacerHeight;
- (id)_initialConstraints;
- (void)_createSubviews;
- (void)configureWithItem:(id)a3;
@end

@implementation TransitDirectionsBadgesStepView

- (void)_createSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsBadgesStepView;
  [(TransitDirectionsStepView *)&v5 _createSubviews];
  v3 = -[TransitArtworkListView initWithFrame:]([TransitArtworkListView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  artworkListView = self->_artworkListView;
  self->_artworkListView = v3;

  [(TransitArtworkListView *)self->_artworkListView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TransitArtworkListView *)self->_artworkListView setSeparatorStyle:1];
  [(TransitDirectionsBadgesStepView *)self addSubview:self->_artworkListView];
}

- (id)_initialConstraints
{
  v11.receiver = self;
  v11.super_class = (Class)TransitDirectionsBadgesStepView;
  v3 = [(TransitDirectionsStepView *)&v11 _initialConstraints];
  artworkListView = self->_artworkListView;
  objc_super v5 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  LODWORD(v6) = 1148846080;
  v7 = [(TransitArtworkListView *)artworkListView _maps_constraintsEqualToEdgesOfLayoutGuide:v5 priority:v6];

  v8 = [v7 topConstraint];
  [v8 setConstant:6.0];

  v9 = [v7 allConstraints];
  [v3 addObjectsFromArray:v9];

  return v3;
}

- (void)configureWithItem:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TransitDirectionsBadgesStepView;
  [(TransitDirectionsStepView *)&v7 configureWithItem:v4];
  objc_super v5 = [v4 badges];
  double v6 = +[GEOTransitStepBadge _maps_artworkListFromStepBadges:v5];
  [(TransitArtworkListView *)self->_artworkListView setArtworkData:v6];
}

- (double)bottomSpacerHeight
{
  return 0.0;
}

- (void).cxx_destruct
{
}

@end