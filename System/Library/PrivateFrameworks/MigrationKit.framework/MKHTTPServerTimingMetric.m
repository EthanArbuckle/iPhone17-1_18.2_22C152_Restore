@interface MKHTTPServerTimingMetric
- (MKHTTPServerTimingMetric)initWithDuration:(double)a3;
- (MKHTTPServerTimingMetric)initWithDuration:(double)a3 desc:(id)a4;
- (NSString)desc;
- (double)duration;
- (id)value;
- (void)setDesc:(id)a3;
- (void)setDuration:(double)a3;
@end

@implementation MKHTTPServerTimingMetric

- (MKHTTPServerTimingMetric)initWithDuration:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKHTTPServerTimingMetric;
  v4 = [(MKHTTPServerTimingMetric *)&v7 init];
  v5 = v4;
  if (v4) {
    [(MKHTTPServerTimingMetric *)v4 setDuration:a3];
  }
  return v5;
}

- (MKHTTPServerTimingMetric)initWithDuration:(double)a3 desc:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MKHTTPServerTimingMetric;
  objc_super v7 = [(MKHTTPServerTimingMetric *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MKHTTPServerTimingMetric *)v7 setDuration:a3];
    [(MKHTTPServerTimingMetric *)v8 setDesc:v6];
  }

  return v8;
}

- (id)value
{
  if ([(NSString *)self->_desc length]) {
    objc_msgSend(NSString, "stringWithFormat:", @"desc=\"%@\";dur=%f",
  }
      self->_desc,
      *(void *)&self->_duration);
  else {
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"dur=%f", *(void *)&self->_duration, v5);
  }
  return v3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)desc
{
  return self->_desc;
}

- (void)setDesc:(id)a3
{
}

- (void).cxx_destruct
{
}

@end