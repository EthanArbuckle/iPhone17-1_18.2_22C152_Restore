@interface VUIDurationValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
+ (void)initialize;
- (NSDateComponentsFormatter)hoursMinutesFormatter;
- (NSDateComponentsFormatter)secondsFormatter;
- (VUIDurationValueTransformer)init;
- (id)transformedValue:(id)a3;
- (void)setHoursMinutesFormatter:(id)a3;
- (void)setSecondsFormatter:(id)a3;
@end

@implementation VUIDurationValueTransformer

+ (void)initialize
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = (void *)MEMORY[0x1E4F29248];
    id v5 = objc_alloc_init((Class)a1);
    [v4 setValueTransformer:v5 forName:@"VUIDurationValueTransformer"];
  }
}

- (VUIDurationValueTransformer)init
{
  v8.receiver = self;
  v8.super_class = (Class)VUIDurationValueTransformer;
  v2 = [(VUIDurationValueTransformer *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
    hoursMinutesFormatter = v2->_hoursMinutesFormatter;
    v2->_hoursMinutesFormatter = v3;

    [(NSDateComponentsFormatter *)v2->_hoursMinutesFormatter setUnitsStyle:2];
    [(NSDateComponentsFormatter *)v2->_hoursMinutesFormatter setAllowedUnits:96];
    id v5 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
    secondsFormatter = v2->_secondsFormatter;
    v2->_secondsFormatter = v5;

    [(NSDateComponentsFormatter *)v2->_secondsFormatter setUnitsStyle:2];
    [(NSDateComponentsFormatter *)v2->_secondsFormatter setAllowedUnits:128];
  }
  return v2;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  [a3 doubleValue];
  double v5 = v4;
  if (v4 >= 60.0) {
    [(VUIDurationValueTransformer *)self hoursMinutesFormatter];
  }
  else {
  v6 = [(VUIDurationValueTransformer *)self secondsFormatter];
  }
  v7 = [v6 stringFromTimeInterval:v5];
  objc_super v8 = [v7 stringByReplacingOccurrencesOfString:@", ", @" " withString];

  return v8;
}

- (NSDateComponentsFormatter)hoursMinutesFormatter
{
  return self->_hoursMinutesFormatter;
}

- (void)setHoursMinutesFormatter:(id)a3
{
}

- (NSDateComponentsFormatter)secondsFormatter
{
  return self->_secondsFormatter;
}

- (void)setSecondsFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsFormatter, 0);
  objc_storeStrong((id *)&self->_hoursMinutesFormatter, 0);
}

@end