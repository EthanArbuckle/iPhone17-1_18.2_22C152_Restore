@interface PPEventHighlight
+ (BOOL)supportsSecureCoding;
+ (id)describeProminentFeature:(unint64_t)a3;
+ (id)eventHighlightWithEKEvent:(id)a3 score:(double)a4 prominentFeature:(unint64_t)a5 features:(id)a6 isExtraordinary:(BOOL)a7;
+ (id)eventHighlightWithEvent:(id)a3 score:(double)a4 prominentFeature:(unint64_t)a5 features:(id)a6 isExtraordinary:(BOOL)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEventHighlight:(id)a3;
- (BOOL)isExtraordinary;
- (CGColor)calendarColor;
- (NSArray)features;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)eventIdentifier;
- (NSString)location;
- (NSString)organizer;
- (NSString)title;
- (NSURL)externalURI;
- (PPEventHighlight)initWithCoder:(id)a3;
- (PPEventHighlight)initWithEventIdentifier:(id)a3 externalURI:(id)a4 title:(id)a5 startDate:(id)a6 endDate:(id)a7 location:(id)a8 organizer:(id)a9 calendarColor:(CGColor *)a10 prominentFeature:(unint64_t)a11 features:(id)a12 score:(double)a13 isExtraordinary:(BOOL)a14;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)prominentFeature;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCalendarColor:(CGColor *)a3;
- (void)setEndDate:(id)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setExternalURI:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setIsExtraordinary:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setOrganizer:(id)a3;
- (void)setProminentFeature:(unint64_t)a3;
- (void)setScore:(double)a3;
- (void)setStartDate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PPEventHighlight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_organizer, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

- (void)setIsExtraordinary:(BOOL)a3
{
  self->_isExtraordinary = a3;
}

- (BOOL)isExtraordinary
{
  return self->_isExtraordinary;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setFeatures:(id)a3
{
}

- (NSArray)features
{
  return self->_features;
}

- (void)setProminentFeature:(unint64_t)a3
{
  self->_prominentFeature = a3;
}

- (unint64_t)prominentFeature
{
  return self->_prominentFeature;
}

- (void)setCalendarColor:(CGColor *)a3
{
  self->_calendarColor = a3;
}

- (CGColor)calendarColor
{
  return self->_calendarColor;
}

- (void)setOrganizer:(id)a3
{
}

- (NSString)organizer
{
  return self->_organizer;
}

- (void)setLocation:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setExternalURI:(id)a3
{
}

- (NSURL)externalURI
{
  return self->_externalURI;
}

- (void)setEventIdentifier:(id)a3
{
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)dealloc
{
  CGColorRelease(self->_calendarColor);
  v3.receiver = self;
  v3.super_class = (Class)PPEventHighlight;
  [(PPEventHighlight *)&v3 dealloc];
}

- (BOOL)isEqualToEventHighlight:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_35;
  }
  eventIdentifier = self->_eventIdentifier;
  v7 = (NSString *)v4[2];
  if (eventIdentifier == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = eventIdentifier;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_35:
      BOOL v47 = 0;
      goto LABEL_36;
    }
  }
  externalURI = self->_externalURI;
  v12 = (NSURL *)v5[3];
  if (externalURI == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = externalURI;
    char v15 = [(NSURL *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_35;
    }
  }
  title = self->_title;
  v17 = (NSString *)v5[4];
  if (title == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = title;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_35;
    }
  }
  startDate = self->_startDate;
  v22 = (NSDate *)v5[5];
  if (startDate == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = startDate;
    char v25 = [(NSDate *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_35;
    }
  }
  endDate = self->_endDate;
  v27 = (NSDate *)v5[6];
  if (endDate == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = endDate;
    char v30 = [(NSDate *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_35;
    }
  }
  location = self->_location;
  v32 = (NSString *)v5[7];
  if (location == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = location;
    char v35 = [(NSString *)v34 isEqual:v33];

    if ((v35 & 1) == 0) {
      goto LABEL_35;
    }
  }
  organizer = self->_organizer;
  v37 = (NSString *)v5[8];
  if (organizer == v37)
  {
  }
  else
  {
    v38 = v37;
    v39 = organizer;
    char v40 = [(NSString *)v39 isEqual:v38];

    if ((v40 & 1) == 0) {
      goto LABEL_35;
    }
  }
  if (!CGColorEqualToColor(self->_calendarColor, (CGColorRef)[v5 calendarColor])) {
    goto LABEL_35;
  }
  unint64_t prominentFeature = self->_prominentFeature;
  if (prominentFeature != [v5 prominentFeature]) {
    goto LABEL_35;
  }
  double score = self->_score;
  [v5 score];
  if (score != v43) {
    goto LABEL_35;
  }
  features = self->_features;
  v45 = [v5 features];
  if ([(NSArray *)features isEqualToArray:v45])
  {
    int isExtraordinary = self->_isExtraordinary;
    BOOL v47 = isExtraordinary == [v5 isExtraordinary];
  }
  else
  {
    BOOL v47 = 0;
  }

LABEL_36:
  return v47;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPEventHighlight *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPEventHighlight *)self isEqualToEventHighlight:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_eventIdentifier copyWithZone:a3];
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    uint64_t v8 = [(NSURL *)self->_externalURI copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_title copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    uint64_t v12 = [(NSDate *)self->_startDate copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    uint64_t v14 = [(NSDate *)self->_endDate copyWithZone:a3];
    char v15 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v14;

    uint64_t v16 = [(NSString *)self->_location copyWithZone:a3];
    v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    uint64_t v18 = [(NSString *)self->_organizer copyWithZone:a3];
    v19 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v18;

    *(void *)(v5 + 72) = CGColorCreateCopy(self->_calendarColor);
    *(void *)(v5 + 80) = self->_prominentFeature;
    *(double *)(v5 + 96) = self->_score;
    uint64_t v20 = [(NSArray *)self->_features copyWithZone:a3];
    v21 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v20;

    *(unsigned char *)(v5 + 8) = self->_isExtraordinary;
  }
  return (id)v5;
}

- (PPEventHighlight)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v3 decodeObjectOfClass:v4 forKey:@"eid"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"eur"];
  uint64_t v8 = [v3 decodeObjectOfClass:v4 forKey:@"ttl"];
  v9 = [v3 decodeObjectOfClass:v5 forKey:@"std"];
  uint64_t v10 = [v3 decodeObjectOfClass:v5 forKey:@"end"];
  v11 = (void *)MEMORY[0x192F97350]();
  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  char v15 = [v3 decodeObjectOfClasses:v14 forKey:@"fea"];

  uint64_t v16 = (void *)v10;
  if (v6 && v7 && v8 && v9 && v10 && v15)
  {
    v17 = PPCreateCalendarColorWithDecoder(v3);
    v26 = [v3 decodeObjectOfClass:v4 forKey:@"loc"];
    uint64_t v18 = [v3 decodeObjectOfClass:v4 forKey:@"org"];
    uint64_t v19 = (int)[v3 decodeInt32ForKey:@"pft"];
    [v3 decodeDoubleForKey:@"scr"];
    double v21 = v20;
    LOBYTE(v25) = [v3 decodeBoolForKey:@"ise"];
    v22 = [(PPEventHighlight *)self initWithEventIdentifier:v6 externalURI:v7 title:v8 startDate:v9 endDate:v16 location:v26 organizer:v21 calendarColor:v18 prominentFeature:v17 features:v19 score:v15 isExtraordinary:v25];

    CGColorRelease(v17);
    self = v22;
  }
  else
  {
    v23 = pp_events_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v3;
      _os_log_error_impl(&dword_18CAA6000, v23, OS_LOG_TYPE_ERROR, "failed to decode eventIdentifier, externalURI, title, startDate, endDate, or features from %@", buf, 0xCu);
    }

    v22 = 0;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  eventIdentifier = self->_eventIdentifier;
  id v5 = a3;
  [v5 encodeObject:eventIdentifier forKey:@"eid"];
  [v5 encodeObject:self->_externalURI forKey:@"eur"];
  [v5 encodeObject:self->_title forKey:@"ttl"];
  [v5 encodeObject:self->_startDate forKey:@"std"];
  [v5 encodeObject:self->_endDate forKey:@"end"];
  [v5 encodeObject:self->_location forKey:@"loc"];
  [v5 encodeObject:self->_organizer forKey:@"org"];
  PPEncodeCalendarColor(v5, self->_calendarColor);
  [v5 encodeInt32:LODWORD(self->_prominentFeature) forKey:@"pft"];
  [v5 encodeObject:self->_features forKey:@"fea"];
  [v5 encodeDouble:@"scr" forKey:self->_score];
  [v5 encodeBool:self->_isExtraordinary forKey:@"ise"];
}

- (unint64_t)hash
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self->_eventIdentifier hash];
  uint64_t v4 = [(NSURL *)self->_externalURI hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_title hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSDate *)self->_startDate hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSDate *)self->_endDate hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_location hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_organizer hash];
  features = self->_features;
  unint64_t v11 = self->_prominentFeature - (v9 - v8 + 32 * v8) + 32 * (v9 - v8 + 32 * v8);
  uint64_t v12 = (unint64_t)self->_score - v11 + 32 * v11;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = features;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v17++), "unsignedIntegerValue", (void)v21)
            - v12
            + 32 * v12;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [NSNumber numberWithBool:self->_isExtraordinary];
  uint64_t v19 = [v18 unsignedIntegerValue];

  return v19 - v12 + 32 * v12;
}

- (id)description
{
  id v3 = [NSString alloc];
  title = self->_title;
  location = self->_location;
  double score = self->_score;
  if (self->_isExtraordinary) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  NSUInteger v8 = +[PPEventHighlight describeProminentFeature:self->_prominentFeature];
  NSUInteger v9 = (void *)[v3 initWithFormat:@"<PPEventHighlight t:'%@' l:'%@' s:'%f' e:'%@' p:'%@' f:'%@'", title, location, *(void *)&score, v7, v8, self->_features];

  return v9;
}

- (PPEventHighlight)initWithEventIdentifier:(id)a3 externalURI:(id)a4 title:(id)a5 startDate:(id)a6 endDate:(id)a7 location:(id)a8 organizer:(id)a9 calendarColor:(CGColor *)a10 prominentFeature:(unint64_t)a11 features:(id)a12 score:(double)a13 isExtraordinary:(BOOL)a14
{
  id v38 = a3;
  id v37 = a4;
  id v21 = a5;
  id v36 = a6;
  id v35 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a12;
  v39.receiver = self;
  v39.super_class = (Class)PPEventHighlight;
  uint64_t v25 = [(PPEventHighlight *)&v39 init];
  if (v25)
  {
    uint64_t v26 = [v38 copy];
    eventIdentifier = v25->_eventIdentifier;
    v25->_eventIdentifier = (NSString *)v26;

    objc_storeStrong((id *)&v25->_externalURI, a4);
    uint64_t v28 = [v21 copy];
    title = v25->_title;
    v25->_title = (NSString *)v28;

    objc_storeStrong((id *)&v25->_startDate, a6);
    objc_storeStrong((id *)&v25->_endDate, a7);
    uint64_t v30 = [v22 copy];
    location = v25->_location;
    v25->_location = (NSString *)v30;

    uint64_t v32 = [v23 copy];
    organizer = v25->_organizer;
    v25->_organizer = (NSString *)v32;

    v25->_calendarColor = CGColorRetain(a10);
    v25->_unint64_t prominentFeature = a11;
    objc_storeStrong((id *)&v25->_features, a12);
    v25->_double score = a13;
    v25->_int isExtraordinary = a14;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)describeProminentFeature:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return @"Calendar";
  }
  else {
    return (id)*((void *)&off_1E550F5E0 + a3 - 1);
  }
}

+ (id)eventHighlightWithEvent:(id)a3 score:(double)a4 prominentFeature:(unint64_t)a5 features:(id)a6 isExtraordinary:(BOOL)a7
{
  id v9 = a6;
  id v10 = a3;
  unint64_t v11 = [v10 calendar];
  uint64_t v23 = [v11 color];

  uint64_t v12 = [PPEventHighlight alloc];
  uint64_t v13 = [v10 eventIdentifier];
  uint64_t v14 = [v10 externalURI];
  uint64_t v15 = [v10 title];
  uint64_t v16 = [v10 startDate];
  uint64_t v17 = [v10 endDate];
  uint64_t v18 = [v10 location];
  uint64_t v19 = [v10 organizerName];

  LOBYTE(v22) = a7;
  double v20 = [(PPEventHighlight *)v12 initWithEventIdentifier:v13 externalURI:v14 title:v15 startDate:v16 endDate:v17 location:v18 organizer:a4 calendarColor:v19 prominentFeature:v23 features:a5 score:v9 isExtraordinary:v22];

  return v20;
}

+ (id)eventHighlightWithEKEvent:(id)a3 score:(double)a4 prominentFeature:(unint64_t)a5 features:(id)a6 isExtraordinary:(BOOL)a7
{
  id v10 = a3;
  id v29 = a6;
  unint64_t v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  uint64_t v12 = [v10 calendar];
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v11, kCGRenderingIntentDefault, (CGColorRef)[v12 CGColor], 0);

  CGColorSpaceRelease(v11);
  uint64_t v13 = [v10 locationWithoutPrediction];
  uint64_t v14 = (void *)[v13 copy];

  if (![v14 length])
  {

    uint64_t v14 = 0;
  }
  context = (void *)MEMORY[0x192F97350]();
  id v24 = [PPEventHighlight alloc];
  uint64_t v15 = [v10 eventIdentifier];
  uint64_t v16 = [v10 externalURI];
  uint64_t v17 = [v10 title];
  uint64_t v18 = [v10 startDate];
  uint64_t v19 = [v10 endDate];
  double v20 = [v10 organizer];
  id v21 = [v20 name];
  LOBYTE(v23) = a7;
  uint64_t v26 = [(PPEventHighlight *)v24 initWithEventIdentifier:v15 externalURI:v16 title:v17 startDate:v18 endDate:v19 location:v14 organizer:a4 calendarColor:v21 prominentFeature:CopyByMatchingToColorSpace features:a5 score:v29 isExtraordinary:v23];

  CGColorRelease(CopyByMatchingToColorSpace);

  return v26;
}

@end