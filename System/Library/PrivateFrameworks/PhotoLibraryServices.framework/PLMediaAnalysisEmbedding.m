@interface PLMediaAnalysisEmbedding
- (NSArray)vectors;
- (PLMediaAnalysisEmbedding)initWithMADEmbedding:(id)a3;
- (_CSEmbedding)csEmbedding;
- (int64_t)dimension;
- (int64_t)format;
- (int64_t)version;
@end

@implementation PLMediaAnalysisEmbedding

- (void).cxx_destruct
{
}

- (_CSEmbedding)csEmbedding
{
  return (_CSEmbedding *)[(MADEmbedding *)self->_madEmbedding csEmbedding];
}

- (NSArray)vectors
{
  return (NSArray *)[(MADEmbedding *)self->_madEmbedding vectors];
}

- (int64_t)version
{
  return [(MADEmbedding *)self->_madEmbedding version];
}

- (int64_t)dimension
{
  return [(MADEmbedding *)self->_madEmbedding dimension];
}

- (int64_t)format
{
  return [(MADEmbedding *)self->_madEmbedding format];
}

- (PLMediaAnalysisEmbedding)initWithMADEmbedding:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLMediaAnalysisEmbedding;
  v6 = [(PLMediaAnalysisEmbedding *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_madEmbedding, a3);
  }

  return v7;
}

@end