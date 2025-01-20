@interface PTCinematographyTransition
- (PTCinematographyTransition)initWithKind:(unint64_t)a3;
- (float)coefficientForNormalizedTime:(float)a3;
- (float)linearCoefficientForNormalizedTime:(float)result;
- (unint64_t)kind;
- (void)setKind:(unint64_t)a3;
@end

@implementation PTCinematographyTransition

- (PTCinematographyTransition)initWithKind:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PTCinematographyTransition;
  result = [(PTCinematographyTransition *)&v5 init];
  if (result) {
    result->_kind = a3;
  }
  return result;
}

- (float)coefficientForNormalizedTime:(float)a3
{
  if ([(PTCinematographyTransition *)self kind] == 1)
  {
    *(float *)&double v5 = a3;
    [(PTCinematographyTransition *)self linearCoefficientForNormalizedTime:v5];
  }
  else
  {
    v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyTransition coefficientForNormalizedTime:](self, v7);
    }

    return 0.0;
  }
  return result;
}

- (float)linearCoefficientForNormalizedTime:(float)result
{
  float v3 = 1.0;
  if (result > 1.0)
  {
    BOOL v4 = 1;
  }
  else
  {
    float v3 = 0.0;
    BOOL v4 = result < 0.0;
  }
  if (v4) {
    return v3;
  }
  return result;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (void)coefficientForNormalizedTime:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 kind];
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "unimplemented transition kind %ld", (uint8_t *)&v3, 0xCu);
}

@end