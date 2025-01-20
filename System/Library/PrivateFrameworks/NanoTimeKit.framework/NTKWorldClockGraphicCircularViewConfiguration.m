@interface NTKWorldClockGraphicCircularViewConfiguration
- (BOOL)inTritium;
- (BOOL)isPrivacy;
- (CLKUIAlmanacTransitInfo)transitInfo;
- (NSDate)overrideDate;
- (NSString)labelText;
- (NSTimeZone)timeZone;
- (NTKWorldClockGraphicCircularViewConfiguration)initWithTimeZone:(id)a3 labelText:(id)a4 transitInfo:(id)a5 inTritium:(BOOL)a6 overrideDate:(id)a7 isPrivacy:(BOOL)a8;
@end

@implementation NTKWorldClockGraphicCircularViewConfiguration

- (NTKWorldClockGraphicCircularViewConfiguration)initWithTimeZone:(id)a3 labelText:(id)a4 transitInfo:(id)a5 inTritium:(BOOL)a6 overrideDate:(id)a7 isPrivacy:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)NTKWorldClockGraphicCircularViewConfiguration;
  v18 = [(NTKWorldClockGraphicCircularViewConfiguration *)&v26 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    timeZone = v18->_timeZone;
    v18->_timeZone = (NSTimeZone *)v19;

    uint64_t v21 = [v15 copy];
    labelText = v18->_labelText;
    v18->_labelText = (NSString *)v21;

    objc_storeStrong((id *)&v18->_transitInfo, a5);
    v18->_inTritium = a6;
    uint64_t v23 = [v17 copy];
    overrideDate = v18->_overrideDate;
    v18->_overrideDate = (NSDate *)v23;

    v18->_isPrivacy = a8;
  }

  return v18;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (CLKUIAlmanacTransitInfo)transitInfo
{
  return self->_transitInfo;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (BOOL)inTritium
{
  return self->_inTritium;
}

- (BOOL)isPrivacy
{
  return self->_isPrivacy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_transitInfo, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end