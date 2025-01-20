@interface FRRingBuffer
- (FRRingBuffer)initWithCapacity:(unint64_t)a3;
- (FRRingBuffer)initWithCapacity:(unint64_t)a3 dictionary:(id)a4;
- (NSDictionary)dictionary;
- (NSMutableArray)values;
- (double)max;
- (double)min;
- (id)description;
- (unint64_t)capacity;
- (unint64_t)position;
- (void)insertValue:(double)a3;
- (void)setCapacity:(unint64_t)a3;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
- (void)setPosition:(unint64_t)a3;
- (void)setValues:(id)a3;
@end

@implementation FRRingBuffer

- (FRRingBuffer)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FRRingBuffer;
  v4 = [(FRRingBuffer *)&v6 init];
  if (v4)
  {
    if (!a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007A81C();
    }
    [(FRRingBuffer *)v4 setCapacity:a3];
  }
  return v4;
}

- (FRRingBuffer)initWithCapacity:(unint64_t)a3 dictionary:(id)a4
{
  id v6 = a4;
  v7 = [(FRRingBuffer *)self initWithCapacity:a3];
  v8 = v7;
  if (v6 && v7)
  {
    objc_opt_class();
    v9 = [v6 objectForKeyedSubscript:@"Values"];
    v10 = FCDynamicCast();

    if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007AAFC();
    }
    id v11 = [v10 mutableCopy];
    [(FRRingBuffer *)v8 setValues:v11];

    objc_opt_class();
    v12 = [v6 objectForKeyedSubscript:@"Position"];
    v13 = FCDynamicCast();

    if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007AA44();
    }
    -[FRRingBuffer setPosition:](v8, "setPosition:", [v13 integerValue]);
    objc_opt_class();
    v14 = [v6 objectForKeyedSubscript:@"Min"];
    v15 = FCDynamicCast();

    if (!v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007A98C();
    }
    [v15 doubleValue];
    -[FRRingBuffer setMin:](v8, "setMin:");
    objc_opt_class();
    v16 = [v6 objectForKeyedSubscript:@"Max"];
    v17 = FCDynamicCast();

    if (!v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007A8D4();
    }
    [v17 doubleValue];
    -[FRRingBuffer setMax:](v8, "setMax:");
  }
  return v8;
}

- (NSMutableArray)values
{
  values = self->_values;
  if (!values)
  {
    v4 = objc_opt_new();
    [(FRRingBuffer *)self setValues:v4];

    if ([(FRRingBuffer *)self capacity])
    {
      unint64_t v5 = 0;
      do
        [(NSMutableArray *)self->_values setObject:&off_1000CFBA8 atIndexedSubscript:v5++];
      while ([(FRRingBuffer *)self capacity] > v5);
    }
    [(FRRingBuffer *)self setMin:1.79769313e308];
    [(FRRingBuffer *)self setMax:-1.79769313e308];
    [(FRRingBuffer *)self setPosition:0];
    values = self->_values;
  }

  return values;
}

- (void)insertValue:(double)a3
{
  unint64_t v5 = [(FRRingBuffer *)self values];
  id v6 = [v5 objectAtIndexedSubscript:[self position]];
  [v6 doubleValue];
  double v8 = v7;

  v9 = +[NSNumber numberWithDouble:a3];
  v10 = [(FRRingBuffer *)self values];
  [v10 setObject:v9 atIndexedSubscript:[self position]];

  unint64_t v11 = [(FRRingBuffer *)self position] + 1;
  unint64_t v12 = [(FRRingBuffer *)self capacity];
  if (v12 <= 1) {
    unint64_t v13 = 1;
  }
  else {
    unint64_t v13 = v12;
  }
  [(FRRingBuffer *)self setPosition:v11 % v13];
  [(FRRingBuffer *)self min];
  if (v8 == -1.79769313e308) {
    goto LABEL_5;
  }
  if (v8 != v14)
  {
    [(FRRingBuffer *)self max];
    if (v8 != v16)
    {
      [(FRRingBuffer *)self min];
LABEL_5:
      if (v14 > a3) {
        [(FRRingBuffer *)self setMin:a3];
      }
      [(FRRingBuffer *)self max];
      if (v15 < a3)
      {
        [(FRRingBuffer *)self setMax:a3];
      }
      return;
    }
  }
  *(_OWORD *)&self->_min = xmmword_1000BD620;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v17 = [(FRRingBuffer *)self values];
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) doubleValue];
        double v23 = fmin(self->_min, v22);
        double v24 = fmax(self->_max, v22);
        self->_min = v23;
        self->_max = v24;
      }
      id v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v19);
  }
}

- (NSDictionary)dictionary
{
  v9[0] = @"Values";
  v3 = [(FRRingBuffer *)self values];
  v10[0] = v3;
  v9[1] = @"Position";
  v4 = +[NSNumber numberWithUnsignedInteger:[(FRRingBuffer *)self position]];
  v10[1] = v4;
  v9[2] = @"Min";
  [(FRRingBuffer *)self min];
  unint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v10[2] = v5;
  v9[3] = @"Max";
  [(FRRingBuffer *)self max];
  id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v10[3] = v6;
  double v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

- (id)description
{
  v3 = [(FRRingBuffer *)self values];
  v4 = +[NSNumber numberWithUnsignedInteger:[(FRRingBuffer *)self position]];
  [(FRRingBuffer *)self min];
  unint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(FRRingBuffer *)self max];
  id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v7 = +[NSString stringWithFormat:@"Ring Buffer with Values : %@\nPosition : %@\nMin : %@\nMax : %@\n", v3, v4, v5, v6];

  return v7;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (void)setValues:(id)a3
{
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (void).cxx_destruct
{
}

@end