@interface DrivingWalkingSteppingSignGenerator
- (BOOL)_forWalkingNavigation;
- (BOOL)_showDistanceInMinorText;
- (CGSize)sizeForSignAtIndex:(int64_t)a3 fittingSize:(CGSize)a4;
- (CellVendor)cellVendor;
- (DrivingWalkingSteppingSignGenerator)initWithRoute:(id)a3;
- (DrivingWalkingSteppingSignGenerator)initWithRoute:(id)a3 options:(int64_t)a4;
- (GEOComposedRoute)route;
- (NSArray)stepsWithCorrespondingSigns;
- (NSMutableArray)signs;
- (NavManeuverSignView)steppingSizingView;
- (double)distanceFromPageControlBaselineToBottomOfSignAtIndex:(int64_t)a3 fittingSize:(CGSize)a4;
- (double)distanceFromPageControlBaselineToTopOfAuxView;
- (id)_distanceTextForStep:(id)a3;
- (id)_distanceTextForStep:(id)a3 distance:(double)a4;
- (id)_signSizeAttributesForSign:(id)a3 fittingSize:(CGSize)a4;
- (id)auxViewAtIndex:(int64_t)a3;
- (id)currentViewStateForSignAtIndex:(int64_t)a3;
- (id)signAtIndex:(int64_t)a3;
- (id)stepAtSignIndex:(int64_t)a3;
- (int64_t)numberOfSigns;
- (int64_t)options;
- (int64_t)signIndexForStep:(id)a3;
- (int64_t)signIndexForStepIndex:(int64_t)a3;
- (unint64_t)signLayoutType;
- (void)_configureSign:(id)a3 forSteppingWithStep:(id)a4;
- (void)_configureSign:(id)a3 withStep:(id)a4;
- (void)_configureWithRoute:(id)a3;
- (void)configureNavSignView:(id)a3 withSign:(id)a4;
- (void)invalidateSizeCaches;
- (void)rectForSignAtIndex:(int64_t)a3 currentStepIndex:(unint64_t)a4 handler:(id)a5;
- (void)resetDistanceForSignAtIndex:(int64_t)a3;
- (void)setCellVendor:(id)a3;
- (void)setSignLayoutType:(unint64_t)a3;
- (void)setSigns:(id)a3;
- (void)setSteppingSizingView:(id)a3;
- (void)updateDistance:(double)a3 forStepAtIndex:(int64_t)a4;
- (void)updateInstruction:(id)a3 forSignAtIndex:(int64_t)a4;
- (void)updateSignForStepAtIndex:(int64_t)a3 maneuverInfo:(id)a4;
@end

@implementation DrivingWalkingSteppingSignGenerator

- (DrivingWalkingSteppingSignGenerator)initWithRoute:(id)a3
{
  return [(DrivingWalkingSteppingSignGenerator *)self initWithRoute:a3 options:0];
}

- (DrivingWalkingSteppingSignGenerator)initWithRoute:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DrivingWalkingSteppingSignGenerator;
  v7 = [(DrivingWalkingSteppingSignGenerator *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_options = a4;
    [(DrivingWalkingSteppingSignGenerator *)v7 _configureWithRoute:v6];
  }

  return v8;
}

- (BOOL)_forWalkingNavigation
{
  return ((unint64_t)[(DrivingWalkingSteppingSignGenerator *)self options] >> 1) & 1;
}

- (BOOL)_showDistanceInMinorText
{
  return ((unint64_t)[(DrivingWalkingSteppingSignGenerator *)self options] >> 2) & 1;
}

- (void)_configureWithRoute:(id)a3
{
  id v29 = a3;
  objc_storeStrong((id *)&self->_route, a3);
  v5 = [v29 steps];
  id v6 = +[NSMutableArray array];
  v7 = +[NSMutableArray array];
  signs = self->_signs;
  self->_signs = 0;

  stepsWithCorrespondingSigns = self->_stepsWithCorrespondingSigns;
  self->_stepsWithCorrespondingSigns = 0;

  if ([v5 count])
  {
    uint64_t v10 = (uint64_t)[v5 count];
    if (v10 >= 1)
    {
      uint64_t v11 = 0;
      unint64_t v12 = v10 + 1;
      do
      {
        v13 = [v5 objectAtIndexedSubscript:v12 - 2];
        v14 = [v13 geoStep];
        v15 = v14;
        if (v14
          && ([v14 maneuverType] != 17 || (objc_msgSend(v13, "distance"), v16 >= 1.0)))
        {
          v17 = objc_alloc_init(NavSignViewModel);
          if ([(DrivingWalkingSteppingSignGenerator *)self _forWalkingNavigation]) {
            [(DrivingWalkingSteppingSignGenerator *)self _configureSign:v17 withStep:v13];
          }
          else {
            [(DrivingWalkingSteppingSignGenerator *)self _configureSign:v17 forSteppingWithStep:v13];
          }
          -[NavSignViewModel setStepIndexRange:](v17, "setStepIndexRange:", v12 - 2, v11 + 1);
          [v6 addObject:v17];
          [v7 addObject:v13];

          uint64_t v11 = 0;
        }
        else
        {
          ++v11;
        }

        --v12;
      }
      while (v12 > 1);
    }
    v18 = [v6 lastObject];
    [v18 stepIndexRange];
    [v18 setStepIndexRange:0, (char *)[v18 stepIndexRange] + v19];
    v20 = [v6 reverseObjectEnumerator];
    v21 = [v20 allObjects];
    v22 = +[NSMutableArray arrayWithArray:v21];
    v23 = self->_signs;
    self->_signs = v22;

    v24 = [v7 reverseObjectEnumerator];
    v25 = [v24 allObjects];
    v26 = self->_stepsWithCorrespondingSigns;
    self->_stepsWithCorrespondingSigns = v25;
  }
  v27 = objc_alloc_init(SteppingSignSizeAttributesCache);
  sizeCache = self->_sizeCache;
  self->_sizeCache = v27;
}

- (void)_configureSign:(id)a3 withStep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36 = v6;
  [v6 setStep:v7];
  v38 = [(DrivingWalkingSteppingSignGenerator *)self _distanceTextForStep:v7];
  if ([v7 transportType] == 4)
  {
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Navigation_DirectionsForUnknownTransport" value:@"localized string not found" table:0];
    uint64_t v10 = [v9 mkServerFormattedString];
    v51 = v10;
    v37 = +[NSArray arrayWithObjects:&v51 count:1];

    unsigned int v35 = 0;
  }
  else
  {
    uint64_t v11 = [v7 contentsForContext:1];
    unint64_t v12 = [v11 instructionWithShorterAlternatives];

    v37 = sub_100099700(v12, &stru_101322F50);
    v13 = [v7 geoStep];
    unsigned int v35 = [v13 maneuverType];
  }
  id v14 = [v7 drivingSide];
  id v15 = objc_alloc((Class)MKJunction);
  double v16 = [v7 geoStep];
  id v17 = [v16 junctionType];
  v18 = [v7 geoStep];
  id v19 = [v18 maneuverType];
  v20 = [v7 geoStep];
  id v21 = [v20 junctionElements];
  v22 = [v7 geoStep];
  id v23 = [v15 initWithType:v17 maneuver:v19 drivingSide:v14 elements:v21 count:[v22 junctionElementsCount]];

  v24 = [GuidanceManeuverArtwork alloc];
  v25 = [v7 artworkOverride];
  v26 = [(GuidanceManeuverArtwork *)v24 initWithManeuver:v35 junction:v23 drivingSide:v14 artworkDataSource:v25];

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_100104590;
  v44 = sub_100104B38;
  id v45 = 0;
  v27 = [v7 geoStep];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100D5592C;
  v39[3] = &unk_1012EA528;
  v39[4] = &v46;
  v39[5] = &v40;
  [v27 shieldInfo:v39];

  uint64_t v28 = *((unsigned int *)v47 + 6);
  if (v28)
  {
    +[NavSignShieldInfo shieldWithID:v28 stringID:0 text:v41[5]];
    v30 = id v29 = v38;
  }
  else
  {
    v30 = 0;
    id v29 = v38;
  }
  v31 = [NavSignManeuverGuidanceInfo alloc];
  v32 = +[NSUUID UUID];
  if (v29)
  {
    v50 = v29;
    v33 = +[NSArray arrayWithObjects:&v50 count:1];
  }
  else
  {
    v33 = 0;
  }
  v34 = [(NavSignManeuverGuidanceInfo *)v31 initWithSignID:v32 maneuverArtwork:v26 majorTextAlternatives:v33 minorTextAlternatives:v37 shieldInfo:v30];
  [v36 setManeuverInfo:v34];

  if (v29) {
  _Block_object_dispose(&v40, 8);
  }

  _Block_object_dispose(&v46, 8);
}

- (void)_configureSign:(id)a3 forSteppingWithStep:(id)a4
{
  id v30 = a3;
  id v32 = a4;
  v31 = [v32 geoStep];
  [v30 setStep:v32];
  v27 = [v32 contentsForContext:1];
  if ([v32 isStartOrResumeStep])
  {
    v5 = 0;
  }
  else
  {
    [v32 distance];
    v5 = [v27 stringForDistance:];
  }
  v26 = v5;
  id v6 = [v5 _geo_serverFormattedString];
  id v29 = +[NSString _navigation_stringForServerFormattedString:v6];

  if ([v32 transportType] == 4)
  {
    id v7 = +[NSBundle mainBundle];
    [v7 localizedStringForKey:@"Navigation_DirectionsForUnknownTransport" value:@"localized string not found" table:0];
  }
  else
  {
    id v7 = [v32 contentsForContext:1];
    [v7 instruction];
  v8 = };

  v9 = [v8 _geo_serverFormattedString];
  uint64_t v28 = +[NSString _navigation_stringForServerFormattedString:v9];

  id v10 = [v32 drivingSide];
  id v11 = [objc_alloc((Class)MKJunction) initWithType:[v31 junctionType] maneuver:[v31 maneuverType] drivingSide:v10 elements:[v31 junctionElements] count:[v31 junctionElementsCount]];
  unint64_t v12 = [GuidanceManeuverArtwork alloc];
  id v13 = [v31 maneuverType];
  id v14 = [v32 artworkOverride];
  id v15 = [(GuidanceManeuverArtwork *)v12 initWithManeuver:v13 junction:v11 drivingSide:v10 artworkDataSource:v14];

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 0;
  uint64_t v34 = 0;
  unsigned int v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_100104590;
  v38 = sub_100104B38;
  id v39 = 0;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100D55E4C;
  v33[3] = &unk_1012EA528;
  v33[4] = &v40;
  v33[5] = &v34;
  [v31 shieldInfo:v33];
  uint64_t v16 = *((unsigned int *)v41 + 6);
  if (v16)
  {
    id v17 = +[NavSignShieldInfo shieldWithID:v16 stringID:0 text:v35[5]];
  }
  else
  {
    id v17 = 0;
  }
  v18 = v11;
  id v19 = [v29 mkServerFormattedString];
  v20 = [v28 mkServerFormattedString];
  id v21 = [NavSignManeuverGuidanceInfo alloc];
  v22 = +[NSUUID UUID];
  if (v19)
  {
    id v45 = v19;
    id v23 = +[NSArray arrayWithObjects:&v45 count:1];
    if (v20)
    {
LABEL_12:
      v44 = v20;
      v24 = +[NSArray arrayWithObjects:&v44 count:1];
      goto LABEL_15;
    }
  }
  else
  {
    id v23 = 0;
    if (v20) {
      goto LABEL_12;
    }
  }
  v24 = 0;
LABEL_15:
  v25 = [(NavSignManeuverGuidanceInfo *)v21 initWithSignID:v22 maneuverArtwork:v15 majorTextAlternatives:v23 minorTextAlternatives:v24 shieldInfo:v17];
  [v30 setManeuverInfo:v25];

  if (v20) {
  if (v19)
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
}

- (void)configureNavSignView:(id)a3 withSign:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [v9 setFlipMajorAndMinorTextInLabels:[self _showDistanceInMinorText]];
  [v9 setShieldSize:6];
  id v7 = [v6 maneuverInfo];

  [v9 setManeuverGuidanceInfo:v7];
  if ([(DrivingWalkingSteppingSignGenerator *)self _forWalkingNavigation]) {
    +[NavSignLayoutDelegateManager defaultLayoutDelegateForWalking];
  }
  else {
  v8 = +[NavSignLayoutDelegateManager defaultLayoutDelegateForStepping];
  }
  [v9 setSignLayoutDelegate:v8];

  [v9 refreshSign];
  [v9 layoutIfNeeded];
}

- (id)_distanceTextForStep:(id)a3
{
  id v4 = a3;
  [v4 distance];
  v5 = -[DrivingWalkingSteppingSignGenerator _distanceTextForStep:distance:](self, "_distanceTextForStep:distance:", v4);

  return v5;
}

- (id)_distanceTextForStep:(id)a3 distance:(double)a4
{
  id v5 = a3;
  if ([v5 isStartOrResumeStep])
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [v5 contentsForContext:1];
    v8 = [v7 stringForDistance:a4];
    id v6 = [v8 mkServerFormattedString];
  }

  return v6;
}

- (void)resetDistanceForSignAtIndex:(int64_t)a3
{
  if ((unint64_t)a3 <= 0x7FFFFFFFFFFFFFFELL
    && (unint64_t)[(NSMutableArray *)self->_signs count] > a3)
  {
    id v8 = [(NSMutableArray *)self->_signs objectAtIndexedSubscript:a3];
    id v5 = [v8 step];
    id v6 = [(DrivingWalkingSteppingSignGenerator *)self _distanceTextForStep:v5];

    id v7 = [v8 maneuverInfo];
    [v7 setMajorText:v6];
  }
}

- (void)updateSignForStepAtIndex:(int64_t)a3 maneuverInfo:(id)a4
{
  id v9 = a4;
  unint64_t v6 = [(DrivingWalkingSteppingSignGenerator *)self signIndexForStepIndex:a3];
  if (v6 <= 0x7FFFFFFFFFFFFFFELL)
  {
    unint64_t v7 = v6;
    if (v6 < (unint64_t)[(NSMutableArray *)self->_signs count])
    {
      id v8 = [(NSMutableArray *)self->_signs objectAtIndexedSubscript:v7];
      [v8 setManeuverInfo:v9];
      [(SteppingSignSizeAttributesCache *)self->_sizeCache invalidateSizeAttributesForSignAtIndex:v7];
    }
  }
}

- (void)updateDistance:(double)a3 forStepAtIndex:(int64_t)a4
{
  unint64_t v6 = [(DrivingWalkingSteppingSignGenerator *)self signIndexForStepIndex:a4];
  if (v6 <= 0x7FFFFFFFFFFFFFFELL)
  {
    unint64_t v7 = v6;
    if (v6 < (unint64_t)[(NSMutableArray *)self->_signs count])
    {
      id v11 = [(NSArray *)self->_stepsWithCorrespondingSigns objectAtIndexedSubscript:v7];
      id v8 = [(NSMutableArray *)self->_signs objectAtIndexedSubscript:v7];
      id v9 = [(DrivingWalkingSteppingSignGenerator *)self _distanceTextForStep:v11 distance:a3];
      id v10 = [v8 maneuverInfo];
      [v10 setMajorText:v9];
    }
  }
}

- (void)updateInstruction:(id)a3 forSignAtIndex:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)a4 <= 0x7FFFFFFFFFFFFFFELL)
  {
    id v11 = v6;
    BOOL v7 = (unint64_t)[(NSMutableArray *)self->_signs count] > a4;
    id v6 = v11;
    if (v7)
    {
      id v8 = [(NSMutableArray *)self->_signs objectAtIndexedSubscript:a4];
      id v9 = [v11 mkServerFormattedString];
      id v10 = [v8 maneuverInfo];
      [v10 setMinorText:v9];

      [(SteppingSignSizeAttributesCache *)self->_sizeCache invalidateSizeAttributesForSignAtIndex:a4];
      id v6 = v11;
    }
  }
}

- (void)setCellVendor:(id)a3
{
  p_cellVendor = &self->_cellVendor;
  id v4 = a3;
  objc_storeWeak((id *)p_cellVendor, v4);
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"NavSignCellIdentifier"];
}

- (id)currentViewStateForSignAtIndex:(int64_t)a3
{
  if ((unint64_t)a3 <= 0x7FFFFFFFFFFFFFFELL)
  {
    id v5 = [(NSMutableArray *)self->_signs objectAtIndexedSubscript:v3];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)invalidateSizeCaches
{
}

- (id)signAtIndex:(int64_t)a3
{
  id v5 = [(DrivingWalkingSteppingSignGenerator *)self cellVendor];
  id v6 = +[NSIndexPath indexPathForItem:a3 inSection:0];
  BOOL v7 = [v5 dequeueReusableCellWithReuseIdentifier:@"NavSignCellIdentifier" forIndexPath:v6];

  id v8 = [(NSMutableArray *)self->_signs objectAtIndexedSubscript:a3];
  id v9 = [v7 navSignView];
  [(DrivingWalkingSteppingSignGenerator *)self configureNavSignView:v9 withSign:v8];

  return v7;
}

- (id)auxViewAtIndex:(int64_t)a3
{
  return 0;
}

- (id)stepAtSignIndex:(int64_t)a3
{
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL
    || (unint64_t)[(NSMutableArray *)self->_signs count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_signs objectAtIndexedSubscript:a3];
    id v6 = [v5 step];
  }

  return v6;
}

- (int64_t)signIndexForStep:(id)a3
{
  id v4 = [a3 stepIndex];

  return [(DrivingWalkingSteppingSignGenerator *)self signIndexForStepIndex:v4];
}

- (int64_t)signIndexForStepIndex:(int64_t)a3
{
  if (![(NSMutableArray *)self->_signs count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v5 = 0;
  while (1)
  {
    id v6 = [(NSMutableArray *)self->_signs objectAtIndexedSubscript:v5];
    id v7 = [v6 stepIndexRange];
    unint64_t v9 = v8;

    if (a3 >= (unint64_t)v7 && a3 - (uint64_t)v7 < v9) {
      break;
    }
    if (++v5 >= (unint64_t)[(NSMutableArray *)self->_signs count]) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v5;
}

- (CGSize)sizeForSignAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  unint64_t v8 = -[SteppingSignSizeAttributesCache sizeAttributesForSignAtIndex:fittingSize:](self->_sizeCache, "sizeAttributesForSignAtIndex:fittingSize:");
  if (v8)
  {
    unint64_t v9 = v8;
    [v8 size];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
  }
  else if ((unint64_t)[(NSMutableArray *)self->_signs count] <= a3)
  {
    CGFloat v11 = CGSizeZero.width;
    CGFloat v13 = CGSizeZero.height;
  }
  else
  {
    id v14 = [(NSMutableArray *)self->_signs objectAtIndexedSubscript:a3];
    id v15 = -[DrivingWalkingSteppingSignGenerator _signSizeAttributesForSign:fittingSize:](self, "_signSizeAttributesForSign:fittingSize:", v14, width, height);
    -[SteppingSignSizeAttributesCache setSizeAttributes:forSignAtIndex:fittingSize:](self->_sizeCache, "setSizeAttributes:forSignAtIndex:fittingSize:", v15, a3, width, height);
    [v15 size];
    CGFloat v11 = v16;
    CGFloat v13 = v17;
  }
  double v18 = v11;
  double v19 = v13;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (double)distanceFromPageControlBaselineToBottomOfSignAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  unint64_t v8 = -[SteppingSignSizeAttributesCache sizeAttributesForSignAtIndex:fittingSize:](self->_sizeCache, "sizeAttributesForSignAtIndex:fittingSize:");
  if (v8)
  {
    unint64_t v9 = v8;
    [v8 signToPageControlDistance];
    double v11 = v10;
LABEL_3:

    return v11;
  }
  double v11 = 20.0;
  if ((a3 & 0x8000000000000000) == 0 && (unint64_t)[(NSMutableArray *)self->_signs count] > a3)
  {
    CGFloat v13 = [(NSMutableArray *)self->_signs objectAtIndexedSubscript:a3];
    unint64_t v9 = -[DrivingWalkingSteppingSignGenerator _signSizeAttributesForSign:fittingSize:](self, "_signSizeAttributesForSign:fittingSize:", v13, width, height);
    -[SteppingSignSizeAttributesCache setSizeAttributes:forSignAtIndex:fittingSize:](self->_sizeCache, "setSizeAttributes:forSignAtIndex:fittingSize:", v9, a3, width, height);
    [v9 signToPageControlDistance];
    double v11 = v14;

    goto LABEL_3;
  }
  return v11;
}

- (id)_signSizeAttributesForSign:(id)a3 fittingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  steppingSizingView = self->_steppingSizingView;
  if (!steppingSizingView)
  {
    unint64_t v9 = -[NavSignView initWithFrame:]([NavManeuverSignView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    double v10 = self->_steppingSizingView;
    self->_steppingSizingView = v9;

    [(NavManeuverSignView *)self->_steppingSizingView setTranslatesAutoresizingMaskIntoConstraints:0];
    steppingSizingView = self->_steppingSizingView;
  }
  [(NavManeuverSignView *)steppingSizingView clearContent];
  [(DrivingWalkingSteppingSignGenerator *)self configureNavSignView:self->_steppingSizingView withSign:v7];
  double v11 = [(NavManeuverSignView *)self->_steppingSizingView widthAnchor];
  double v12 = [v11 constraintEqualToConstant:width];

  [v12 setActive:1];
  -[NavManeuverSignView systemLayoutSizeFittingSize:](self->_steppingSizingView, "systemLayoutSizeFittingSize:", width, height);
  double v14 = v13;
  double v16 = v15;
  [v12 setActive:0];
  unsigned int v17 = [(DrivingWalkingSteppingSignGenerator *)self _forWalkingNavigation];
  double v18 = [(NavSignView *)self->_steppingSizingView minorLabel];
  id v19 = [v18 lineCount];

  double v20 = 3.0;
  if (v17) {
    double v20 = 6.0;
  }
  double v21 = -2.0;
  if (v17) {
    double v21 = 4.0;
  }
  if ((unint64_t)v19 <= 1) {
    double v22 = v21;
  }
  else {
    double v22 = v20;
  }
  id v23 = -[SteppingSignSizeAttributes initWithSize:signToPageControlDistance:]([SteppingSignSizeAttributes alloc], "initWithSize:signToPageControlDistance:", v14, v16, v22);

  return v23;
}

- (double)distanceFromPageControlBaselineToTopOfAuxView
{
  unsigned int v2 = [(DrivingWalkingSteppingSignGenerator *)self _forWalkingNavigation];
  double result = 17.0;
  if (v2) {
    return 13.0;
  }
  return result;
}

- (void)rectForSignAtIndex:(int64_t)a3 currentStepIndex:(unint64_t)a4 handler:(id)a5
{
  unint64_t v9 = (void (**)(double))a5;
  id v7 = [(DrivingWalkingSteppingSignGenerator *)self stepAtSignIndex:a3];
  double v8 = sub_1008C018C(v7);
  if (v9) {
    v9[2](v8);
  }
}

- (int64_t)numberOfSigns
{
  return (int64_t)[(NSMutableArray *)self->_signs count];
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (NSArray)stepsWithCorrespondingSigns
{
  return self->_stepsWithCorrespondingSigns;
}

- (CellVendor)cellVendor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cellVendor);

  return (CellVendor *)WeakRetained;
}

- (unint64_t)signLayoutType
{
  return self->_signLayoutType;
}

- (void)setSignLayoutType:(unint64_t)a3
{
  self->_signLayoutType = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (NSMutableArray)signs
{
  return self->_signs;
}

- (void)setSigns:(id)a3
{
}

- (NavManeuverSignView)steppingSizingView
{
  return self->_steppingSizingView;
}

- (void)setSteppingSizingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steppingSizingView, 0);
  objc_storeStrong((id *)&self->_signs, 0);
  objc_destroyWeak((id *)&self->_cellVendor);
  objc_storeStrong((id *)&self->_stepsWithCorrespondingSigns, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_sizeCache, 0);
}

@end