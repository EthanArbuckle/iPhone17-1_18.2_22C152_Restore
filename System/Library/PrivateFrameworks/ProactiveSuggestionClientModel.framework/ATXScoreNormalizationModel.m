@interface ATXScoreNormalizationModel
+ (BOOL)supportsSecureCoding;
- (ATXScoreNormalizationModel)initWithCoder:(id)a3;
- (ATXScoreNormalizationModel)initWithParameters:(id)a3;
- (ATXScoreNormalizationModel)initWithParameters:(id)a3 circularBuffer:(id)a4 bufferHead:(int)a5 isBufferSorted:(BOOL)a6;
- (ATXScoreNormalizationParameters)parameters;
- (BOOL)isBufferSorted;
- (NSMutableArray)circularBuffer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)normalizeScore:(id)a3;
- (int)bufferHead;
- (int)bufferSize;
- (void)addScore:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getStateReadyForNormalization;
- (void)resetBuffer;
- (void)setBufferHead:(int)a3;
- (void)setBufferSize:(int)a3;
- (void)setCircularBuffer:(id)a3;
- (void)setIsBufferSorted:(BOOL)a3;
- (void)setParameters:(id)a3;
@end

@implementation ATXScoreNormalizationModel

- (ATXScoreNormalizationModel)initWithParameters:(id)a3
{
  return [(ATXScoreNormalizationModel *)self initWithParameters:a3 circularBuffer:0 bufferHead:0 isBufferSorted:1];
}

- (ATXScoreNormalizationModel)initWithParameters:(id)a3 circularBuffer:(id)a4 bufferHead:(int)a5 isBufferSorted:(BOOL)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXScoreNormalizationModel;
  v12 = [(ATXScoreNormalizationModel *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_isBufferSorted = a6;
    v14 = [v10 bufferSize];
    -[ATXScoreNormalizationModel setBufferSize:](v13, "setBufferSize:", [v14 intValue]);

    [(ATXScoreNormalizationModel *)v13 setCircularBuffer:v11];
    [(ATXScoreNormalizationModel *)v13 setBufferHead:v7];
    [(ATXScoreNormalizationModel *)v13 setParameters:v10];
    v15 = [(ATXScoreNormalizationModel *)v13 circularBuffer];

    if (!v15) {
      [(ATXScoreNormalizationModel *)v13 resetBuffer];
    }
  }

  return v13;
}

- (void)addScore:(id)a3
{
  id v4 = a3;
  int v5 = [(ATXScoreNormalizationModel *)self bufferHead];
  v6 = [(ATXScoreNormalizationModel *)self circularBuffer];
  unint64_t v7 = [v6 count];

  v8 = [(ATXScoreNormalizationModel *)self circularBuffer];
  v9 = v8;
  if (v7 <= v5) {
    [v8 addObject:v4];
  }
  else {
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", -[ATXScoreNormalizationModel bufferHead](self, "bufferHead"), v4);
  }

  [(ATXScoreNormalizationModel *)self setBufferHead:(([(ATXScoreNormalizationModel *)self bufferHead] + 1)% [(ATXScoreNormalizationModel *)self bufferSize])];
  [(ATXScoreNormalizationModel *)self setIsBufferSorted:0];
}

- (void)resetBuffer
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[ATXScoreNormalizationModel bufferSize](self, "bufferSize"));
  [(ATXScoreNormalizationModel *)self setCircularBuffer:v3];

  [(ATXScoreNormalizationModel *)self setBufferHead:0];
}

- (id)normalizeScore:(id)a3
{
  id v4 = a3;
  int v5 = [(ATXScoreNormalizationModel *)self circularBuffer];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    if (![(ATXScoreNormalizationModel *)self isBufferSorted]) {
      [(ATXScoreNormalizationModel *)self getStateReadyForNormalization];
    }
    unint64_t v7 = [(ATXScoreNormalizationModel *)self circularBuffer];
    uint64_t v8 = [v7 count];

    unint64_t v9 = 0;
    if (v8)
    {
      do
      {
        id v10 = [(ATXScoreNormalizationModel *)self circularBuffer];
        id v11 = [v10 objectAtIndexedSubscript:v9];
        [v11 doubleValue];
        double v13 = v12;
        [v4 doubleValue];
        double v15 = v14;

        if (v13 > v15) {
          break;
        }
        ++v9;
        v16 = [(ATXScoreNormalizationModel *)self circularBuffer];
        unint64_t v17 = [v16 count];
      }
      while (v17 > v9);
      double v18 = (double)(int)v9;
    }
    else
    {
      double v18 = 0.0;
    }
    v20 = [(ATXScoreNormalizationModel *)self circularBuffer];
    uint64_t v21 = [v20 count] - 1;

    if (v21 == v9)
    {
      v19 = &unk_1F0627F58;
    }
    else
    {
      v22 = NSNumber;
      v23 = [(ATXScoreNormalizationModel *)self circularBuffer];
      v19 = objc_msgSend(v22, "numberWithDouble:", v18 / (double)(unint64_t)objc_msgSend(v23, "count") * 100.0);
    }
  }
  else
  {
    v19 = &unk_1F0627F70;
  }

  return v19;
}

- (void)getStateReadyForNormalization
{
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v3 = [(ATXScoreNormalizationModel *)self circularBuffer];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
  [v3 sortUsingDescriptors:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)[(NSMutableArray *)self->_circularBuffer copyWithZone:a3];
  [v5 setCircularBuffer:v6];

  [v5 setIsBufferSorted:self->_isBufferSorted];
  [v5 setBufferHead:self->_bufferHead];
  [v5 setBufferSize:self->_bufferSize];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ATXScoreNormalizationModel *)self circularBuffer];
  [v5 encodeObject:v4 forKey:@"circularBuffer"];

  objc_msgSend(v5, "encodeBool:forKey:", -[ATXScoreNormalizationModel isBufferSorted](self, "isBufferSorted"), @"isBufferSorted");
  objc_msgSend(v5, "encodeInt64:forKey:", -[ATXScoreNormalizationModel bufferSize](self, "bufferSize"), @"bufferSize");
  objc_msgSend(v5, "encodeInt64:forKey:", -[ATXScoreNormalizationModel bufferHead](self, "bufferHead"), @"bufferHead");
}

- (ATXScoreNormalizationModel)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"circularBuffer"];
  uint64_t v9 = [v5 decodeBoolForKey:@"isBufferSorted"];
  uint64_t v10 = [v5 decodeInt32ForKey:@"bufferSize"];
  uint64_t v11 = [v5 decodeInt32ForKey:@"bufferHead"];

  double v12 = [ATXScoreNormalizationParameters alloc];
  double v13 = [NSNumber numberWithInt:v10];
  double v14 = [(ATXScoreNormalizationParameters *)v12 initWithBufferSize:v13];

  double v15 = [(ATXScoreNormalizationModel *)self initWithParameters:v14 circularBuffer:v8 bufferHead:v11 isBufferSorted:v9];
  return v15;
}

- (ATXScoreNormalizationParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
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

- (int)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(int)a3
{
  self->_bufferSize = a3;
}

- (BOOL)isBufferSorted
{
  return self->_isBufferSorted;
}

- (void)setIsBufferSorted:(BOOL)a3
{
  self->_isBufferSorted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularBuffer, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end