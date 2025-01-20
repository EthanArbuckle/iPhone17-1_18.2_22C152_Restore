@interface TransitRouteStepCell
+ (id)cellWithRoute:(id)a3 sign:(id)a4;
- (TransitRouteStepCell)initWithRoute:(id)a3 sign:(id)a4;
- (TransitSegmentSteppingModeSign)sign;
- (TransitSteppingCameraFramer)cameraFramer;
- (id)instructionStringsArray;
- (id)routeStep;
- (id)snapshotBlock;
- (int64_t)signIndexForSign:(id)a3;
- (int64_t)signIndexForStepIndex:(int64_t)a3;
- (unint64_t)numberOfSteps;
- (void)setCameraFramer:(id)a3;
- (void)setSign:(id)a3;
@end

@implementation TransitRouteStepCell

+ (id)cellWithRoute:(id)a3 sign:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithRoute:v7 sign:v6];

  return v8;
}

- (TransitRouteStepCell)initWithRoute:(id)a3 sign:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TransitRouteStepCell *)self sign];
  int64_t v9 = [(TransitRouteStepCell *)self signIndexForSign:v8];

  v12.receiver = self;
  v12.super_class = (Class)TransitRouteStepCell;
  v10 = [(RouteStepCell *)&v12 initWithRoute:v7 stepIndex:v9 mapType:104];

  if (v10) {
    [(TransitRouteStepCell *)v10 setSign:v6];
  }

  return v10;
}

- (TransitSteppingCameraFramer)cameraFramer
{
  cameraFramer = self->_cameraFramer;
  if (!cameraFramer)
  {
    v4 = objc_alloc_init(TransitSteppingCameraFramer);
    v5 = self->_cameraFramer;
    self->_cameraFramer = v4;

    cameraFramer = self->_cameraFramer;
  }

  return cameraFramer;
}

- (id)routeStep
{
  v3 = [(TransitRouteStepCell *)self sign];
  v4 = [v3 step];

  if (v4)
  {
    v5 = [(TransitRouteStepCell *)self sign];
    id v6 = [v5 step];
  }
  else
  {
    v5 = [(RouteStepCell *)self route];
    id v7 = [(TransitRouteStepCell *)self sign];
    id v6 = objc_msgSend(v5, "stepAtIndex:", objc_msgSend(v7, "stepIndexRange"));
  }

  return v6;
}

- (int64_t)signIndexForSign:(id)a3
{
  id v4 = a3;
  v5 = [v4 step];

  if (v5)
  {
    id v6 = [v4 step];
  }
  else
  {
    id v7 = [v4 segment];

    if (!v7)
    {
      int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_6;
    }
    id v8 = [v4 segment];
    int64_t v9 = [v8 steps];
    id v6 = [v9 firstObject];
  }
  int64_t v10 = -[TransitRouteStepCell signIndexForStepIndex:](self, "signIndexForStepIndex:", [v6 stepIndex]);

LABEL_6:
  return v10;
}

- (int64_t)signIndexForStepIndex:(int64_t)a3
{
  v5 = [(RouteStepCell *)self route];
  id v6 = [v5 steppingSigns];
  id v7 = [v6 count];

  if (!v7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v8 = 0;
  while (1)
  {
    int64_t v9 = [(RouteStepCell *)self route];
    int64_t v10 = [v9 steppingSigns];
    v11 = [v10 objectAtIndexedSubscript:v8];

    id v12 = [v11 stepIndexRange];
    unint64_t v14 = v13;

    if (a3 >= (unint64_t)v12 && a3 - (uint64_t)v12 < v14) {
      break;
    }
    ++v8;
    v15 = [(RouteStepCell *)self route];
    v16 = [v15 steppingSigns];
    id v17 = [v16 count];

    if (v8 >= (unint64_t)v17) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v8;
}

- (unint64_t)numberOfSteps
{
  v2 = [(GEOComposedRoute *)self->super._route steppingSigns];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)instructionStringsArray
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(TransitRouteStepCell *)self sign];
  unsigned int v5 = [v4 hasValidInstructions];

  if (v5)
  {
    NSAttributedStringKey v27 = NSFontAttributeName;
    id v6 = +[UIFont systemFontOfSize:13.5];
    v28 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

    unint64_t v8 = [(TransitRouteStepCell *)self sign];
    int64_t v9 = [v8 majorFormattedInstruction];

    if (v9)
    {
      int64_t v10 = [(TransitRouteStepCell *)self sign];
      v11 = [v10 majorFormattedInstruction];
      id v12 = +[NSAttributedString _mapkit_attributedStringForComposedString:v11 defaultAttributes:v7];
      unint64_t v13 = [v12 string];

      if (v13) {
        [v3 addObject:v13];
      }
    }
    unint64_t v14 = [(TransitRouteStepCell *)self sign];
    v15 = [v14 minorFormattedInstruction];

    if (v15)
    {
      v16 = [(TransitRouteStepCell *)self sign];
      id v17 = [v16 minorFormattedInstruction];
      v18 = +[NSAttributedString _mapkit_attributedStringForComposedString:v17 defaultAttributes:v7];
      v19 = [v18 string];

      if (v19) {
        [v3 addObject:v19];
      }
    }
    v20 = [(TransitRouteStepCell *)self sign];
    v21 = [v20 tertiaryFormattedInstruction];

    if (v21)
    {
      v22 = [(TransitRouteStepCell *)self sign];
      v23 = [v22 tertiaryFormattedInstruction];
      v24 = +[NSAttributedString _mapkit_attributedStringForComposedString:v23 defaultAttributes:v7];
      v25 = [v24 string];

      if (v25) {
        [v3 addObject:v25];
      }
    }
  }

  return v3;
}

- (id)snapshotBlock
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007D2C80;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  id v2 = [v4 copy];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (TransitSegmentSteppingModeSign)sign
{
  return self->_sign;
}

- (void)setSign:(id)a3
{
}

- (void)setCameraFramer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraFramer, 0);

  objc_storeStrong((id *)&self->_sign, 0);
}

@end