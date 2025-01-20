@interface _NTKPhotoIndexGenerator
- (_NTKPhotoIndexGenerator)initWithSize:(int64_t)a3;
- (int64_t)nextRandom;
- (int64_t)nextSequential;
- (void)reset;
- (void)setIndex:(int64_t)a3;
@end

@implementation _NTKPhotoIndexGenerator

- (_NTKPhotoIndexGenerator)initWithSize:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_NTKPhotoIndexGenerator;
  v4 = [(_NTKPhotoIndexGenerator *)&v8 init];
  v5 = v4;
  if (v4)
  {
    stepSizes = v4->_stepSizes;
    v4->_stepSizes = (NSArray *)&unk_1F16E9B38;

    v5->_n = a3;
    v5->_count = 0;
    v5->_prevIndex = a3 - 1;
  }
  return v5;
}

- (void)reset
{
  self->_prevIndex = self->_n - 1;
}

- (void)setIndex:(int64_t)a3
{
  if (self->_n > a3) {
    self->_prevIndex = a3;
  }
}

- (int64_t)nextRandom
{
  int64_t n = self->_n;
  if (n >= 2)
  {
    int64_t count = self->_count;
    int64_t prevIndex = self->_prevIndex;
    while (1)
    {
      if (count % n)
      {
        uint64_t v7 = self->_step + prevIndex;
      }
      else
      {
        do
        {
          do
          {
            objc_super v8 = [(NSArray *)self->_stepSizes objectAtIndexedSubscript:arc4random() % [(NSArray *)self->_stepSizes count]];
            int64_t v9 = [v8 integerValue];
          }
          while (v9 == self->_step);
          int64_t n = self->_n;
        }
        while (v9 == n);
        self->_step = v9;
        int64_t count = self->_count;
        if (!count)
        {
          int64_t result = 0;
          goto LABEL_11;
        }
        uint64_t v7 = arc4random();
        int64_t n = self->_n;
        int64_t count = self->_count;
      }
      int64_t result = v7 % n;
LABEL_11:
      self->_int64_t count = ++count;
      self->_int64_t prevIndex = result;
      if (prevIndex != result) {
        return result;
      }
    }
  }
  return 0;
}

- (int64_t)nextSequential
{
  int64_t n = self->_n;
  if (n < 2) {
    return 0;
  }
  int64_t v3 = (self->_prevIndex + 1) % n;
  self->_int64_t prevIndex = v3;
  return v3;
}

- (void).cxx_destruct
{
}

@end