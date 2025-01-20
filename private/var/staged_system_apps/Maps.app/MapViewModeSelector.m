@interface MapViewModeSelector
- (BOOL)lastLayoutWidthFits;
- (BOOL)updateSegmentsIfNeededToFitWidth:(double)a3;
- (MapViewModeSelector)init;
- (MapViewModeSelector)initWithDesiredViewModes:(id)a3;
- (NSArray)desiredViewModes;
- (NSArray)orderedViewModes;
- (double)lastLayoutWidth;
- (int64_t)selectedViewMode;
- (void)setDesiredViewModes:(id)a3;
- (void)setLastLayoutWidth:(double)a3;
- (void)setLastLayoutWidthFits:(BOOL)a3;
- (void)setOrderedViewModes:(id)a3;
- (void)setSelectedViewMode:(int64_t)a3;
@end

@implementation MapViewModeSelector

- (MapViewModeSelector)init
{
  return [(MapViewModeSelector *)self initWithDesiredViewModes:&off_1013AD668];
}

- (MapViewModeSelector)initWithDesiredViewModes:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MapViewModeSelector;
  v6 = [(MapViewModeSelector *)&v23 init];
  v7 = v6;
  if (v6)
  {
    id v22 = v5;
    objc_storeStrong((id *)&v6->_desiredViewModes, a3);
    v21 = v7;
    id v8 = [(MapViewModeSelector *)v7 orderedViewModes];
    v9 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          switch((unint64_t)[*(id *)(*((void *)&v24 + 1) + 8 * (void)v14) integerValue])
          {
            case 0uLL:
              v15 = +[NSBundle mainBundle];
              v16 = v15;
              CFStringRef v17 = @"Map [Explore Mode Title]";
              goto LABEL_13;
            case 1uLL:
            case 5uLL:
              v15 = +[NSBundle mainBundle];
              v16 = v15;
              CFStringRef v17 = @"Hybrid";
              goto LABEL_13;
            case 2uLL:
            case 6uLL:
              v15 = +[NSBundle mainBundle];
              v16 = v15;
              CFStringRef v17 = @"Satellite";
              goto LABEL_13;
            case 3uLL:
              v15 = +[NSBundle mainBundle];
              v16 = v15;
              CFStringRef v17 = @"View Mode Transit";
              goto LABEL_13;
            case 7uLL:
              v15 = +[NSBundle mainBundle];
              v16 = v15;
              CFStringRef v17 = @"View Mode Driving";
LABEL_13:
              v18 = [v15 localizedStringForKey:v17 value:@"localized string not found" table:0];

              if (v18)
              {
                [v9 addObject:v18];
              }
              break;
            default:
              break;
          }
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    id v19 = [v9 copy];
    v7 = v21;
    [(MapViewModeSelector *)v21 _maps_setItems:v19];

    id v5 = v22;
  }

  return v7;
}

- (NSArray)orderedViewModes
{
  orderedViewModes = self->_orderedViewModes;
  if (!orderedViewModes)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = self->_desiredViewModes;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = [v10 integerValue];
          if ((unint64_t)v11 <= 7 && v11 != (id)4) {
            [v4 addObject:v10];
          }
        }
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    uint64_t v13 = (NSArray *)[v4 copy];
    v14 = self->_orderedViewModes;
    self->_orderedViewModes = v13;

    orderedViewModes = self->_orderedViewModes;
  }

  return orderedViewModes;
}

- (int64_t)selectedViewMode
{
  id v3 = [(MapViewModeSelector *)self selectedSegmentIndex];
  if ((unint64_t)v3 > 0x7FFFFFFFFFFFFFFELL) {
    return -1;
  }
  id v4 = v3;
  id v5 = [(MapViewModeSelector *)self orderedViewModes];
  id v6 = [v5 count];

  if (v4 >= v6) {
    return -1;
  }
  id v7 = [(MapViewModeSelector *)self orderedViewModes];
  uint64_t v8 = [v7 objectAtIndexedSubscript:v4];
  id v9 = [v8 integerValue];

  return (int64_t)v9;
}

- (void)setSelectedViewMode:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_100F6F950[a3];
  }
  if (((v4 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = [(MapViewModeSelector *)self orderedViewModes];
  id v7 = +[NSNumber numberWithInteger:v5];
  id v8 = [v6 indexOfObject:v7];

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v9 = 0;
  }
  else {
    id v9 = v8;
  }

  [(MapViewModeSelector *)self setSelectedSegmentIndex:v9];
}

- (BOOL)updateSegmentsIfNeededToFitWidth:(double)a3
{
  if (a3 <= 0.0) {
    return 0;
  }
  if (self->_lastLayoutWidth == a3) {
    return self->_lastLayoutWidthFits;
  }
  self->_lastLayoutWidth = a3;
  [(MapViewModeSelector *)self setApportionsSegmentWidthsByContent:0];
  unsigned __int8 v6 = [(MapViewModeSelector *)self _maps_testFitSegmentTitlesToWidth:a3];
  self->_lastLayoutWidthFits = v6;
  if (v6) {
    return 1;
  }
  [(MapViewModeSelector *)self setApportionsSegmentWidthsByContent:1];
  BOOL result = [(MapViewModeSelector *)self _maps_testFitSegmentTitlesToWidth:a3];
  self->_lastLayoutWidthFits = result;
  return result;
}

- (void)setOrderedViewModes:(id)a3
{
}

- (double)lastLayoutWidth
{
  return self->_lastLayoutWidth;
}

- (void)setLastLayoutWidth:(double)a3
{
  self->_lastLayoutWidth = a3;
}

- (BOOL)lastLayoutWidthFits
{
  return self->_lastLayoutWidthFits;
}

- (void)setLastLayoutWidthFits:(BOOL)a3
{
  self->_lastLayoutWidthFits = a3;
}

- (NSArray)desiredViewModes
{
  return self->_desiredViewModes;
}

- (void)setDesiredViewModes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredViewModes, 0);

  objc_storeStrong((id *)&self->_orderedViewModes, 0);
}

@end