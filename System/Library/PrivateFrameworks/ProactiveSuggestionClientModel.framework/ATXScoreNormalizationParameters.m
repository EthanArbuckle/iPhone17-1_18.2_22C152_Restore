@interface ATXScoreNormalizationParameters
- (ATXScoreNormalizationParameters)initWithBufferSize:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXScoreNormalizationParameters:(id)a3;
- (NSNumber)bufferSize;
- (unint64_t)hash;
@end

@implementation ATXScoreNormalizationParameters

- (ATXScoreNormalizationParameters)initWithBufferSize:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXScoreNormalizationParameters;
  v6 = [(ATXScoreNormalizationParameters *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bufferSize, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSNumber *)self->_bufferSize hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXScoreNormalizationParameters *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXScoreNormalizationParameters *)self isEqualToATXScoreNormalizationParameters:v5];

  return v6;
}

- (BOOL)isEqualToATXScoreNormalizationParameters:(id)a3
{
  v4 = self->_bufferSize;
  id v5 = v4;
  if (v4 == *((NSNumber **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSNumber isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (NSNumber)bufferSize
{
  return self->_bufferSize;
}

- (void).cxx_destruct
{
}

@end