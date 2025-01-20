@interface UITextSelectionWindowAveragedValue
- (UITextSelectionWindowAveragedValue)initWithDepth:(unint64_t)a3;
- (double)windowAveragedValue;
- (void)addValue:(double)a3;
- (void)flushValues;
@end

@implementation UITextSelectionWindowAveragedValue

- (UITextSelectionWindowAveragedValue)initWithDepth:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UITextSelectionWindowAveragedValue;
  v4 = [(UITextSelectionWindowAveragedValue *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_depth = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4->_depth];
    values = v5->_values;
    v5->_values = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)flushValues
{
}

- (void)addValue:(double)a3
{
  values = self->_values;
  v5 = [NSNumber numberWithDouble:a3];
  [(NSMutableArray *)values insertObject:v5 atIndex:0];

  if ([(NSMutableArray *)self->_values count] > self->_depth)
  {
    uint64_t v6 = self->_values;
    [(NSMutableArray *)v6 removeLastObject];
  }
}

- (double)windowAveragedValue
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_values;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "doubleValue", (void)v11);
        double v7 = v7 + v9;
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  if ([(NSMutableArray *)self->_values count]) {
    return v7 / (double)(unint64_t)[(NSMutableArray *)self->_values count];
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end