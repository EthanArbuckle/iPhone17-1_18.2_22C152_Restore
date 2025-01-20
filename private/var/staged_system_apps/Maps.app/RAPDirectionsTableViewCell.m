@interface RAPDirectionsTableViewCell
- (RAPDirectionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7;
- (void)updateHeightForWidth:(double)a3;
@end

@implementation RAPDirectionsTableViewCell

- (RAPDirectionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RAPDirectionsTableViewCell;
  v4 = [(DirectionsStepTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(RAPDirectionsTableViewCell *)v4 backgroundView];

    if (!v6)
    {
      v7 = [DirectionsTableViewCellBackgroundView alloc];
      [(RAPDirectionsTableViewCell *)v5 bounds];
      v8 = -[DirectionsTableViewCellBackgroundView initWithFrame:](v7, "initWithFrame:");
      [(RAPDirectionsTableViewCell *)v5 setBackgroundView:v8];
    }
  }
  return v5;
}

- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  v13 = (GEOComposedRoute *)a4;
  v14 = *(void **)(&self->super._alignSeparatorWithLeadingText + 1);
  *(void *)(&self->super._alignSeparatorWithLeadingText + 1) = v12;
  id v15 = v12;

  v16 = *(GEOComposedRoute **)((char *)&self->_route + 1);
  *(GEOComposedRoute **)((char *)&self->_route + 1) = v13;
  v17 = v13;

  v18.receiver = self;
  v18.super_class = (Class)RAPDirectionsTableViewCell;
  [(DirectionsStepTableViewCell *)&v18 setRoute:v15 step:v17 stepIndex:a5 alignToLeftEdgeIfNoManeuverSign:v8 size:a7];
}

- (void)updateHeightForWidth:(double)a3
{
  v5 = objc_opt_class();
  uint64_t v6 = *(void *)(&self->super._alignSeparatorWithLeadingText + 1);
  uint64_t v7 = *(uint64_t *)((char *)&self->_route + 1);
  BOOL v8 = [(RAPDirectionsTableViewCell *)self traitCollection];
  objc_msgSend(v5, "heightForWidth:route:step:idiom:", v6, v7, objc_msgSend(v8, "userInterfaceIdiom"), a3);
  double v10 = v9;

  v11 = [(RAPDirectionsTableViewCell *)self contentView];
  id v12 = [v11 heightAnchor];
  v13 = [v12 constraintEqualToConstant:v10];

  if (*(GEOComposedRouteStep **)((char *)&self->_step + 1))
  {
    uint64_t v19 = *(uint64_t *)((char *)&self->_step + 1);
    v14 = +[NSArray arrayWithObjects:&v19 count:1];
    +[NSLayoutConstraint deactivateConstraints:v14];

    id v15 = *(GEOComposedRouteStep **)((char *)&self->_step + 1);
  }
  else
  {
    id v15 = 0;
  }
  *(GEOComposedRouteStep **)((char *)&self->_step + 1) = v13;
  v16 = v13;

  uint64_t v18 = *(uint64_t *)((char *)&self->_step + 1);
  v17 = +[NSArray arrayWithObjects:&v18 count:1];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_step + 1), 0);
  objc_storeStrong((id *)((char *)&self->_route + 1), 0);

  objc_storeStrong((id *)(&self->super._alignSeparatorWithLeadingText + 1), 0);
}

@end