@interface base_durationInput
- (NSSet)featureNames;
- (base_durationInput)initWithClassic_time_between_uses_med_dur_1:(double)a3 classic_time_between_uses_med_dur_2:(double)a4 classic_time_between_uses_med_dur_4:(double)a5 classic_time_between_uses_med_dur_24:(double)a6 classic_time_between_uses_std_dur_1:(double)a7 classic_time_between_uses_std_dur_2:(double)a8 classic_time_between_uses_std_dur_4:(double)a9 classic_time_between_uses_std_dur_24:(double)a10 hour:(double)a11 is_weekend:(double)a12 hour_plus_0:(double)a13 hour_plus_1:(double)a14 hour_plus_2:(double)a15 hour_plus_3:(double)a16 hour_plus_4:(double)a17 hour_plus_5:(double)a18 hours_until_use:(double)a19 meaningful_undercharge_rolling_average:(double)a20;
- (double)classic_time_between_uses_med_dur_1;
- (double)classic_time_between_uses_med_dur_2;
- (double)classic_time_between_uses_med_dur_24;
- (double)classic_time_between_uses_med_dur_4;
- (double)classic_time_between_uses_std_dur_1;
- (double)classic_time_between_uses_std_dur_2;
- (double)classic_time_between_uses_std_dur_24;
- (double)classic_time_between_uses_std_dur_4;
- (double)hour;
- (double)hour_plus_0;
- (double)hour_plus_1;
- (double)hour_plus_2;
- (double)hour_plus_3;
- (double)hour_plus_4;
- (double)hour_plus_5;
- (double)hours_until_use;
- (double)is_weekend;
- (double)meaningful_undercharge_rolling_average;
- (id)featureValueForName:(id)a3;
- (void)setClassic_time_between_uses_med_dur_1:(double)a3;
- (void)setClassic_time_between_uses_med_dur_24:(double)a3;
- (void)setClassic_time_between_uses_med_dur_2:(double)a3;
- (void)setClassic_time_between_uses_med_dur_4:(double)a3;
- (void)setClassic_time_between_uses_std_dur_1:(double)a3;
- (void)setClassic_time_between_uses_std_dur_24:(double)a3;
- (void)setClassic_time_between_uses_std_dur_2:(double)a3;
- (void)setClassic_time_between_uses_std_dur_4:(double)a3;
- (void)setHour:(double)a3;
- (void)setHour_plus_0:(double)a3;
- (void)setHour_plus_1:(double)a3;
- (void)setHour_plus_2:(double)a3;
- (void)setHour_plus_3:(double)a3;
- (void)setHour_plus_4:(double)a3;
- (void)setHour_plus_5:(double)a3;
- (void)setHours_until_use:(double)a3;
- (void)setIs_weekend:(double)a3;
- (void)setMeaningful_undercharge_rolling_average:(double)a3;
@end

@implementation base_durationInput

- (base_durationInput)initWithClassic_time_between_uses_med_dur_1:(double)a3 classic_time_between_uses_med_dur_2:(double)a4 classic_time_between_uses_med_dur_4:(double)a5 classic_time_between_uses_med_dur_24:(double)a6 classic_time_between_uses_std_dur_1:(double)a7 classic_time_between_uses_std_dur_2:(double)a8 classic_time_between_uses_std_dur_4:(double)a9 classic_time_between_uses_std_dur_24:(double)a10 hour:(double)a11 is_weekend:(double)a12 hour_plus_0:(double)a13 hour_plus_1:(double)a14 hour_plus_2:(double)a15 hour_plus_3:(double)a16 hour_plus_4:(double)a17 hour_plus_5:(double)a18 hours_until_use:(double)a19 meaningful_undercharge_rolling_average:(double)a20
{
  v29.receiver = self;
  v29.super_class = (Class)base_durationInput;
  result = [(base_durationInput *)&v29 init];
  if (result)
  {
    result->_classic_time_between_uses_med_dur_1 = a3;
    result->_classic_time_between_uses_med_dur_2 = a4;
    result->_classic_time_between_uses_med_dur_4 = a5;
    result->_classic_time_between_uses_med_dur_24 = a6;
    result->_classic_time_between_uses_std_dur_1 = a7;
    result->_classic_time_between_uses_std_dur_2 = a8;
    result->_classic_time_between_uses_std_dur_4 = a9;
    result->_classic_time_between_uses_std_dur_24 = a10;
    result->_hour = a11;
    result->_is_weekend = a12;
    result->_hour_plus_0 = a13;
    result->_hour_plus_1 = a14;
    result->_hour_plus_2 = a15;
    result->_hour_plus_3 = a16;
    result->_hour_plus_4 = a17;
    result->_hour_plus_5 = a18;
    result->_hours_until_use = a19;
    result->_meaningful_undercharge_rolling_average = a20;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_1000699E8];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"classic_time_between_uses_med_dur_1"]
    || [v4 isEqualToString:@"classic_time_between_uses_med_dur_2"]
    || [v4 isEqualToString:@"classic_time_between_uses_med_dur_4"]
    || [v4 isEqualToString:@"classic_time_between_uses_med_dur_24"])
  {
    [(base_durationInput *)self classic_time_between_uses_med_dur];
LABEL_30:
    v5 = +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:");
    goto LABEL_31;
  }
  if ([v4 isEqualToString:@"classic_time_between_uses_std_dur_1"]
    || [v4 isEqualToString:@"classic_time_between_uses_std_dur_2"]
    || [v4 isEqualToString:@"classic_time_between_uses_std_dur_4"]
    || [v4 isEqualToString:@"classic_time_between_uses_std_dur_24"])
  {
    [(base_durationInput *)self classic_time_between_uses_std_dur];
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"hour"])
  {
    [(base_durationInput *)self hour];
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"is_weekend"])
  {
    [(base_durationInput *)self is_weekend];
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"hour_plus_0"]
    || [v4 isEqualToString:@"hour_plus_1"]
    || [v4 isEqualToString:@"hour_plus_2"]
    || [v4 isEqualToString:@"hour_plus_3"]
    || [v4 isEqualToString:@"hour_plus_4"]
    || [v4 isEqualToString:@"hour_plus_5"])
  {
    [(base_durationInput *)self hour_plus];
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"hours_until_use"])
  {
    [(base_durationInput *)self hours_until_use];
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"meaningful_undercharge_rolling_average"])
  {
    [(base_durationInput *)self meaningful_undercharge_rolling_average];
    goto LABEL_30;
  }
  v5 = 0;
LABEL_31:

  return v5;
}

- (double)classic_time_between_uses_med_dur_1
{
  return self->_classic_time_between_uses_med_dur_1;
}

- (void)setClassic_time_between_uses_med_dur_1:(double)a3
{
  self->_classic_time_between_uses_med_dur_1 = a3;
}

- (double)classic_time_between_uses_med_dur_2
{
  return self->_classic_time_between_uses_med_dur_2;
}

- (void)setClassic_time_between_uses_med_dur_2:(double)a3
{
  self->_classic_time_between_uses_med_dur_2 = a3;
}

- (double)classic_time_between_uses_med_dur_4
{
  return self->_classic_time_between_uses_med_dur_4;
}

- (void)setClassic_time_between_uses_med_dur_4:(double)a3
{
  self->_classic_time_between_uses_med_dur_4 = a3;
}

- (double)classic_time_between_uses_med_dur_24
{
  return self->_classic_time_between_uses_med_dur_24;
}

- (void)setClassic_time_between_uses_med_dur_24:(double)a3
{
  self->_classic_time_between_uses_med_dur_24 = a3;
}

- (double)classic_time_between_uses_std_dur_1
{
  return self->_classic_time_between_uses_std_dur_1;
}

- (void)setClassic_time_between_uses_std_dur_1:(double)a3
{
  self->_classic_time_between_uses_std_dur_1 = a3;
}

- (double)classic_time_between_uses_std_dur_2
{
  return self->_classic_time_between_uses_std_dur_2;
}

- (void)setClassic_time_between_uses_std_dur_2:(double)a3
{
  self->_classic_time_between_uses_std_dur_2 = a3;
}

- (double)classic_time_between_uses_std_dur_4
{
  return self->_classic_time_between_uses_std_dur_4;
}

- (void)setClassic_time_between_uses_std_dur_4:(double)a3
{
  self->_classic_time_between_uses_std_dur_4 = a3;
}

- (double)classic_time_between_uses_std_dur_24
{
  return self->_classic_time_between_uses_std_dur_24;
}

- (void)setClassic_time_between_uses_std_dur_24:(double)a3
{
  self->_classic_time_between_uses_std_dur_24 = a3;
}

- (double)hour
{
  return self->_hour;
}

- (void)setHour:(double)a3
{
  self->_hour = a3;
}

- (double)is_weekend
{
  return self->_is_weekend;
}

- (void)setIs_weekend:(double)a3
{
  self->_is_weekend = a3;
}

- (double)hour_plus_0
{
  return self->_hour_plus_0;
}

- (void)setHour_plus_0:(double)a3
{
  self->_hour_plus_0 = a3;
}

- (double)hour_plus_1
{
  return self->_hour_plus_1;
}

- (void)setHour_plus_1:(double)a3
{
  self->_hour_plus_1 = a3;
}

- (double)hour_plus_2
{
  return self->_hour_plus_2;
}

- (void)setHour_plus_2:(double)a3
{
  self->_hour_plus_2 = a3;
}

- (double)hour_plus_3
{
  return self->_hour_plus_3;
}

- (void)setHour_plus_3:(double)a3
{
  self->_hour_plus_3 = a3;
}

- (double)hour_plus_4
{
  return self->_hour_plus_4;
}

- (void)setHour_plus_4:(double)a3
{
  self->_hour_plus_4 = a3;
}

- (double)hour_plus_5
{
  return self->_hour_plus_5;
}

- (void)setHour_plus_5:(double)a3
{
  self->_hour_plus_5 = a3;
}

- (double)hours_until_use
{
  return self->_hours_until_use;
}

- (void)setHours_until_use:(double)a3
{
  self->_hours_until_use = a3;
}

- (double)meaningful_undercharge_rolling_average
{
  return self->_meaningful_undercharge_rolling_average;
}

- (void)setMeaningful_undercharge_rolling_average:(double)a3
{
  self->_meaningful_undercharge_rolling_average = a3;
}

@end