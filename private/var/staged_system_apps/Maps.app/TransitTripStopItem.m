@interface TransitTripStopItem
- (BOOL)isPlaceholder;
- (GEOTransitTripStop)transitTripStop;
- (NSObject)identifier;
- (TransitTripStopItem)initWithPlaceHolderType:(unint64_t)a3 numCollapsedStops:(unint64_t)a4;
- (TransitTripStopItem)initWithTransitTripStop:(id)a3 stopIndex:(unint64_t)a4;
- (id)description;
- (id)placeholderTextForLine:(id)a3;
- (unint64_t)numberOfCollapsedStops;
- (unint64_t)type;
- (void)setNumberOfCollapsedStops:(unint64_t)a3;
@end

@implementation TransitTripStopItem

- (TransitTripStopItem)initWithPlaceHolderType:(unint64_t)a3 numCollapsedStops:(unint64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)TransitTripStopItem;
  v6 = [(TransitTripStopItem *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_numberOfCollapsedStops = a4;
    v6->_type = a3;
    v8 = @"PostAlightingPlaceholder";
    if (a3 == 1) {
      v8 = @"PreBoardingPlaceholder";
    }
    v9 = v8;
    v10 = +[NSUUID UUID];
    v11 = [v10 UUIDString];
    uint64_t v12 = +[NSString stringWithFormat:@"%@-%lu-%@", v9, a4, v11];

    identifier = v7->_identifier;
    v7->_identifier = v12;
  }
  return v7;
}

- (TransitTripStopItem)initWithTransitTripStop:(id)a3 stopIndex:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TransitTripStopItem;
  v8 = [(TransitTripStopItem *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transitTripStop, a3);
    v9->_type = 0;
    uint64_t v10 = +[NSNumber numberWithUnsignedInteger:a4];
    identifier = v9->_identifier;
    v9->_identifier = v10;
  }
  return v9;
}

- (BOOL)isPlaceholder
{
  return self->_numberOfCollapsedStops != 0;
}

- (id)placeholderTextForLine:(id)a3
{
  unsigned int v4 = [a3 isBus];
  unint64_t type = self->_type;
  if (type == 2)
  {
    v6 = +[NSBundle mainBundle];
    if (v4) {
      CFStringRef v7 = @"[Transit Schedule] (Bus) Additional bus stops";
    }
    else {
      CFStringRef v7 = @"[Transit Schedule] (Non-bus) Additional non-bus stops text";
    }
  }
  else
  {
    if (type != 1)
    {
      v8 = 0;
      goto LABEL_11;
    }
    v6 = +[NSBundle mainBundle];
    if (v4) {
      CFStringRef v7 = @"[Transit Schedule] (Bus) Previous stops text";
    }
    else {
      CFStringRef v7 = @"[Transit Schedule] (Non-bus) Previous stops text";
    }
  }
  v9 = [v6 localizedStringForKey:v7 value:@"localized string not found" table:0];

  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, self->_numberOfCollapsedStops);

LABEL_11:

  return v8;
}

- (id)description
{
  if (self->_type)
  {
    v2 = self->_identifier;
  }
  else
  {
    v2 = [(GEOTransitTripStop *)self->_transitTripStop description];
  }

  return v2;
}

- (unint64_t)type
{
  return self->_type;
}

- (GEOTransitTripStop)transitTripStop
{
  return self->_transitTripStop;
}

- (unint64_t)numberOfCollapsedStops
{
  return self->_numberOfCollapsedStops;
}

- (void)setNumberOfCollapsedStops:(unint64_t)a3
{
  self->_numberOfCollapsedStops = a3;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_transitTripStop, 0);
}

@end