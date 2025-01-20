@interface _PSConfidenceModel
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)circularBuffer;
- (_PSConfidenceModel)initWithBufferSize:(int)a3 minimumInstanceCount:(int)a4;
- (_PSConfidenceModel)initWithBufferSize:(int)a3 sum:(double)a4 circularBuffer:(id)a5 bufferHead:(int)a6;
- (_PSConfidenceModel)initWithCoder:(id)a3;
- (double)getConfidence;
- (double)sum;
- (id)copyWithZone:(_NSZone *)a3;
- (int)bufferHead;
- (int)bufferSize;
- (int)minimumInstanceCount;
- (void)addEvent:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)resetBuffer;
- (void)setBufferHead:(int)a3;
- (void)setBufferSize:(int)a3;
- (void)setCircularBuffer:(id)a3;
- (void)setMinimumInstanceCount:(int)a3;
- (void)setSum:(double)a3;
@end

@implementation _PSConfidenceModel

- (_PSConfidenceModel)initWithBufferSize:(int)a3 minimumInstanceCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSConfidenceModel;
  v6 = [(_PSConfidenceModel *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(_PSConfidenceModel *)v6 setSum:0.0];
    [(_PSConfidenceModel *)v7 setBufferSize:v5];
    [(_PSConfidenceModel *)v7 setBufferHead:0];
    [(_PSConfidenceModel *)v7 setMinimumInstanceCount:v4];
    [(_PSConfidenceModel *)v7 resetBuffer];
  }
  return v7;
}

- (_PSConfidenceModel)initWithBufferSize:(int)a3 sum:(double)a4 circularBuffer:(id)a5 bufferHead:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_PSConfidenceModel;
  v11 = [(_PSConfidenceModel *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(_PSConfidenceModel *)v11 setSum:a4];
    [(_PSConfidenceModel *)v12 setBufferSize:v8];
    [(_PSConfidenceModel *)v12 setCircularBuffer:v10];
    [(_PSConfidenceModel *)v12 setBufferHead:v6];
  }

  return v12;
}

- (void)resetBuffer
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_PSConfidenceModel bufferSize](self, "bufferSize"));
  [(_PSConfidenceModel *)self setCircularBuffer:v3];

  [(_PSConfidenceModel *)self setBufferHead:0];
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  int v5 = [(_PSConfidenceModel *)self bufferHead];
  uint64_t v6 = [(_PSConfidenceModel *)self circularBuffer];
  unint64_t v7 = [v6 count];

  uint64_t v8 = [(_PSConfidenceModel *)self circularBuffer];
  objc_super v9 = v8;
  if (v7 <= v5)
  {
    [v8 addObject:v4];
  }
  else
  {
    id v10 = objc_msgSend(v8, "objectAtIndexedSubscript:", -[_PSConfidenceModel bufferHead](self, "bufferHead"));
    [v10 doubleValue];
    double v12 = v11;
    [(_PSConfidenceModel *)self sum];
    [(_PSConfidenceModel *)self setSum:v13 - v12];

    objc_super v9 = [(_PSConfidenceModel *)self circularBuffer];
    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", -[_PSConfidenceModel bufferHead](self, "bufferHead"), v4);
  }

  [v4 doubleValue];
  double v15 = v14;

  [(_PSConfidenceModel *)self sum];
  [(_PSConfidenceModel *)self setSum:v15 + v16];
  int v17 = [(_PSConfidenceModel *)self bufferHead] + 1;
  uint64_t v18 = (v17 % [(_PSConfidenceModel *)self bufferSize]);

  [(_PSConfidenceModel *)self setBufferHead:v18];
}

- (double)getConfidence
{
  v3 = [(_PSConfidenceModel *)self circularBuffer];
  if ([v3 count])
  {
    id v4 = [(_PSConfidenceModel *)self circularBuffer];
    unint64_t v5 = [v4 count];
    int v6 = [(_PSConfidenceModel *)self minimumInstanceCount];

    double v7 = -1.0;
    if (v5 < v6) {
      return v7;
    }
  }
  else
  {
  }
  uint64_t v8 = [(_PSConfidenceModel *)self circularBuffer];
  unint64_t v9 = [v8 count];
  int v10 = [(_PSConfidenceModel *)self minimumInstanceCount];

  double v7 = -1.0;
  if (v9 >= v10)
  {
    [(_PSConfidenceModel *)self sum];
    double v12 = v11;
    double v13 = [(_PSConfidenceModel *)self circularBuffer];
    double v7 = v12 / (double)(unint64_t)[v13 count];
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  int v6 = (void *)[(NSMutableArray *)self->_circularBuffer copyWithZone:a3];
  [v5 setCircularBuffer:v6];

  [v5 setBufferHead:self->_bufferHead];
  [v5 setSum:self->_sum];
  [v5 setBufferSize:self->_bufferSize];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_PSConfidenceModel *)self circularBuffer];
  int v6 = NSStringFromSelector(sel_circularBuffer);
  [v4 encodeObject:v5 forKey:v6];

  [(_PSConfidenceModel *)self sum];
  double v8 = v7;
  unint64_t v9 = NSStringFromSelector("sum");
  [v4 encodeDouble:v9 forKey:v8];

  uint64_t v10 = [(_PSConfidenceModel *)self bufferSize];
  double v11 = NSStringFromSelector(sel_bufferSize);
  [v4 encodeInt64:v10 forKey:v11];

  uint64_t v12 = [(_PSConfidenceModel *)self bufferHead];
  NSStringFromSelector(sel_bufferHead);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInt64:v12 forKey:v13];
}

- (_PSConfidenceModel)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  unint64_t v9 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  uint64_t v10 = NSStringFromSelector(sel_circularBuffer);
  double v11 = [v5 decodeObjectOfClasses:v9 forKey:v10];

  uint64_t v12 = NSStringFromSelector("sum");
  [v5 decodeDoubleForKey:v12];
  double v14 = v13;

  double v15 = NSStringFromSelector(sel_bufferSize);
  uint64_t v16 = [v5 decodeInt32ForKey:v15];

  int v17 = NSStringFromSelector(sel_bufferHead);
  uint64_t v18 = [v5 decodeInt32ForKey:v17];

  v19 = [(_PSConfidenceModel *)self initWithBufferSize:v16 sum:v11 circularBuffer:v18 bufferHead:v14];
  return v19;
}

- (NSMutableArray)circularBuffer
{
  return self->_circularBuffer;
}

- (void)setCircularBuffer:(id)a3
{
}

- (int)bufferHead
{
  return self->_bufferHead;
}

- (void)setBufferHead:(int)a3
{
  self->_bufferHead = a3;
}

- (double)sum
{
  return self->_sum;
}

- (void)setSum:(double)a3
{
  self->_sum = a3;
}

- (int)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(int)a3
{
  self->_bufferSize = a3;
}

- (int)minimumInstanceCount
{
  return self->_minimumInstanceCount;
}

- (void)setMinimumInstanceCount:(int)a3
{
  self->_minimumInstanceCount = a3;
}

- (void).cxx_destruct
{
}

@end