@interface BMAtomBatchChunker
- (BMAtomBatchChunker)initWithChunkerPolicy:(id)a3;
- (BOOL)canAddAtomWithData:(id)a3;
- (BOOL)moreComing;
- (void)didAddAtomWithData:(id)a3;
- (void)setMoreComing:(BOOL)a3;
@end

@implementation BMAtomBatchChunker

- (BMAtomBatchChunker)initWithChunkerPolicy:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMAtomBatchChunker;
  v5 = [(BMAtomBatchChunker *)&v9 init];
  if (v5)
  {
    v6 = (BMAtomBatchChunkerPolicy *)[v4 copy];
    chunkerPolicy = v5->_chunkerPolicy;
    v5->_chunkerPolicy = v6;
  }
  return v5;
}

- (BOOL)canAddAtomWithData:(id)a3
{
  return [(BMAtomBatchChunkerPolicy *)self->_chunkerPolicy canAddAtomWithData:a3];
}

- (void)didAddAtomWithData:(id)a3
{
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
}

- (void).cxx_destruct
{
}

@end