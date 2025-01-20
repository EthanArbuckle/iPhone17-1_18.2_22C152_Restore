@interface MKBenchmark
- (MKBenchmark)initWithLabel:(id)a3 count:(unint64_t)a4 time:(double)a5;
- (NSString)label;
- (double)time;
- (id)benchmark;
- (unint64_t)count;
- (void)setCount:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setTime:(double)a3;
@end

@implementation MKBenchmark

- (MKBenchmark)initWithLabel:(id)a3 count:(unint64_t)a4 time:(double)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKBenchmark;
  v9 = [(MKBenchmark *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_time = a5;
    v9->_count = a4;
    [(MKBenchmark *)v9 setLabel:v8];
  }

  return v10;
}

- (id)benchmark
{
  id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  v4 = [MEMORY[0x263EFF960] currentLocale];
  [v3 setLocale:v4];

  [v3 setNumberStyle:1];
  [v3 setMaximumFractionDigits:1];
  [v3 setPositiveSuffix:@" assets"];
  [v3 setRoundingMode:6];
  double time = self->_time;
  v6 = @" m";
  if (time >= 60.0)
  {
    double v7 = time / 60.0;
  }
  else
  {
    v6 = @" s";
    double v7 = self->_time;
  }
  if (v7 >= 60.0) {
    id v8 = @" h";
  }
  else {
    id v8 = v6;
  }
  id v9 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v9 setNumberStyle:1];
  [v9 setMinimumFractionDigits:2];
  [v9 setMaximumFractionDigits:2];
  [v9 setPositiveSuffix:v8];
  [v9 setRoundingMode:6];
  double v10 = self->_time;
  double v11 = 0.0;
  if (v10 != 0.0) {
    double v11 = (double)self->_count / v10;
  }
  if (v7 >= 60.0) {
    double v7 = v7 / 60.0;
  }
  id v12 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v12 setNumberStyle:1];
  [v12 setMinimumFractionDigits:2];
  [v12 setMaximumFractionDigits:2];
  [v12 setPositiveSuffix:@" assets/sec"];
  [v12 setRoundingMode:6];
  v22 = NSString;
  label = self->_label;
  v14 = [NSNumber numberWithUnsignedLongLong:self->_count];
  v15 = [v3 stringFromNumber:v14];
  v16 = [NSNumber numberWithDouble:v7];
  v17 = [v9 stringFromNumber:v16];
  v18 = [NSNumber numberWithDouble:v11];
  v19 = [v12 stringFromNumber:v18];
  v20 = [v22 stringWithFormat:@"%@: %@, %@ (%@)", label, v15, v17, v19];

  return v20;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_double time = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end