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
    if (!a3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FRRingBuffer initWithCapacity:]();
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

    if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FRRingBuffer initWithCapacity:dictionary:].cold.4();
    }
    v11 = (void *)[v10 mutableCopy];
    [(FRRingBuffer *)v8 setValues:v11];

    objc_opt_class();
    v12 = [v6 objectForKeyedSubscript:@"Position"];
    v13 = FCDynamicCast();

    if (!v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FRRingBuffer initWithCapacity:dictionary:]();
    }
    -[FRRingBuffer setPosition:](v8, "setPosition:", [v13 integerValue]);
    objc_opt_class();
    v14 = [v6 objectForKeyedSubscript:@"Min"];
    v15 = FCDynamicCast();

    if (!v15 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FRRingBuffer initWithCapacity:dictionary:]();
    }
    [v15 doubleValue];
    -[FRRingBuffer setMin:](v8, "setMin:");
    objc_opt_class();
    v16 = [v6 objectForKeyedSubscript:@"Max"];
    v17 = FCDynamicCast();

    if (!v17 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FRRingBuffer initWithCapacity:dictionary:]();
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
        [(NSMutableArray *)self->_values setObject:&unk_26D9225D8 atIndexedSubscript:v5++];
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
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(FRRingBuffer *)self values];
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", -[FRRingBuffer position](self, "position"));
  [v6 doubleValue];
  double v8 = v7;

  v9 = [NSNumber numberWithDouble:a3];
  v10 = [(FRRingBuffer *)self values];
  objc_msgSend(v10, "setObject:atIndexedSubscript:", v9, -[FRRingBuffer position](self, "position"));

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
  *(_OWORD *)&self->_min = xmmword_22596E810;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v17 = [(FRRingBuffer *)self values];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
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
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v19);
  }
}

- (NSDictionary)dictionary
{
  v12[4] = *MEMORY[0x263EF8340];
  v11[0] = @"Values";
  v3 = [(FRRingBuffer *)self values];
  v12[0] = v3;
  v11[1] = @"Position";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FRRingBuffer position](self, "position"));
  v12[1] = v4;
  v11[2] = @"Min";
  unint64_t v5 = NSNumber;
  [(FRRingBuffer *)self min];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  v12[2] = v6;
  v11[3] = @"Max";
  double v7 = NSNumber;
  [(FRRingBuffer *)self max];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  v12[3] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return (NSDictionary *)v9;
}

- (id)description
{
  v3 = NSString;
  v4 = [(FRRingBuffer *)self values];
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FRRingBuffer position](self, "position"));
  id v6 = NSNumber;
  [(FRRingBuffer *)self min];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  double v8 = NSNumber;
  [(FRRingBuffer *)self max];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v10 = [v3 stringWithFormat:@"Ring Buffer with Values : %@\nPosition : %@\nMin : %@\nMax : %@\n", v4, v5, v7, v9];

  return v10;
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

- (void)initWithCapacity:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Cannot be zero capacity"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithCapacity:dictionary:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Initializing FRRingBuffer with a dictionay with no max"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithCapacity:dictionary:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Initializing FRRingBuffer with a dictionay with no min"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithCapacity:dictionary:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Initializing FRRingBuffer with a dictionay with no position"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithCapacity:dictionary:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Initializing FRRingBuffer with a dictionay with no values"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

@end