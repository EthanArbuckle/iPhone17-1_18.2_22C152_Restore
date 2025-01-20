@interface PGGraphMusicGenreNode
- (PGGraphMusicGenreNode)initWithLabel:(id)a3;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphMusicGenreNode

- (void).cxx_destruct
{
}

- (id)label
{
  return self->_label;
}

- (unsigned)domain
{
  return 1001;
}

- (PGGraphMusicGenreNode)initWithLabel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMusicGenreNode;
  v5 = [(PGGraphNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

@end