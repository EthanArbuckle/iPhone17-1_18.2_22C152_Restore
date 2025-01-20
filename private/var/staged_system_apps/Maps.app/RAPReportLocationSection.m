@interface RAPReportLocationSection
- (BOOL)shouldHighlightCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
- (NSData)imageDataOfMapAndInstructionsCell;
- (RAPReportLocationSection)initWithQuestion:(id)a3;
- (id)cellForRowAtIndex:(int64_t)a3;
- (id)headerTitle;
- (int64_t)rowsCount;
- (void)registerReuseIdentifiersForCells;
@end

@implementation RAPReportLocationSection

- (RAPReportLocationSection)initWithQuestion:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RAPReportLocationSection;
  v6 = [(RAPTablePartSection *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_question, a3);
    v8 = [(RAPQuestion *)v7->_question parentQuestion];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      v11 = [v10 parentQuestion];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
      id v13 = v12;

      v14 = [v13 parentQuestion];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
      id v16 = v15;

      if (v16)
      {
        uint64_t v17 = [v16 routeFromRecording];
        route = v7->_route;
        v7->_route = (GEOComposedRoute *)v17;

        v19 = [[RAPInstructionDetailRouteCellProvider alloc] initWithRoute:v7->_route];
        provider = v7->_provider;
        v7->_provider = v19;
      }
    }
  }
  return v7;
}

- (int64_t)rowsCount
{
  return 2;
}

- (void)registerReuseIdentifiersForCells
{
  provider = self->_provider;
  id v3 = [(RAPTablePartSection *)self tableView];
  [(RAPInstructionDetailRouteCellProvider *)provider registerCellsForTableView:v3];
}

- (BOOL)shouldHighlightCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  return 0;
}

- (NSData)imageDataOfMapAndInstructionsCell
{
  [(RAPRouteStepMapViewCell *)self->_mapViewCell bounds];
  CGFloat v4 = v3;
  [(RAPRouteStepMapViewCell *)self->_mapViewCell bounds];
  double v6 = v5;
  [(UITableViewCell *)self->_instructionCell bounds];
  v16.height = v6 + v7;
  v16.width = v4;
  UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = [(RAPRouteStepMapViewCell *)self->_mapViewCell layer];
  [v9 renderInContext:CurrentContext];

  [(RAPRouteStepMapViewCell *)self->_mapViewCell bounds];
  CGContextTranslateCTM(CurrentContext, 0.0, v10);
  v11 = [(UITableViewCell *)self->_instructionCell layer];
  [v11 renderInContext:CurrentContext];

  UIGraphicsGetImageFromCurrentImageContext();
  v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  id v13 = UIImagePNGRepresentation(v12);

  return (NSData *)v13;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  if (a3 == 1)
  {
    v14 = [(RAPInstructionCorrectionQuestion *)self->_question listItem];

    provider = self->_provider;
    CGSize v16 = [(RAPTablePartSection *)self tableView];
    question = self->_question;
    if (v14)
    {
      v18 = [(RAPInstructionCorrectionQuestion *)question listItem];
      v19 = [(RAPInstructionDetailRouteCellProvider *)provider transitDirectionsCellForTableView:v16 item:v18];
      instructionCell = self->_instructionCell;
      self->_instructionCell = v19;

      CGSize v16 = [(RAPTablePartSection *)self tableView];
      [v16 bounds];
      -[UITableViewCell setSeparatorInset:](self->_instructionCell, "setSeparatorInset:", 0.0, 0.0, 0.0, CGRectGetWidth(v27));
    }
    else
    {
      objc_super v22 = [(RAPInstructionCorrectionQuestion *)question composedRouteStep];
      v23 = [(RAPInstructionDetailRouteCellProvider *)provider directionStepCellForTableView:v16 step:v22];
      v24 = self->_instructionCell;
      self->_instructionCell = v23;
    }
    p_instructionCell = (void **)&self->_instructionCell;
    goto LABEL_10;
  }
  if (a3)
  {
    v21 = 0;
    goto LABEL_12;
  }
  CGFloat v4 = [(RAPTablePartSection *)self tableView];
  double v5 = [v4 dequeueReusableCellWithIdentifier:@"RAPRouteStepMapViewCell"];
  p_instructionCell = (void **)&self->_mapViewCell;
  mapViewCell = self->_mapViewCell;
  self->_mapViewCell = v5;

  v8 = self->_mapViewCell;
  if (!v8)
  {
    v9 = [RAPRouteStepMapViewCell alloc];
    route = self->_route;
    v11 = [(RAPInstructionCorrectionQuestion *)self->_question composedRouteStep];
    v12 = [(RAPRouteStepMapViewCell *)v9 initWithIdentifier:@"RAPRouteStepMapViewCell" route:route routeStep:v11];
    id v13 = *p_instructionCell;
    *p_instructionCell = v12;

LABEL_10:
    v8 = (RAPRouteStepMapViewCell *)*p_instructionCell;
  }
  v21 = v8;
LABEL_12:

  return v21;
}

- (id)headerTitle
{
  v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"Information [RAP]" value:@"localized string not found" table:0];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionCell, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_question, 0);

  objc_storeStrong((id *)&self->_mapViewCell, 0);
}

@end