@interface _TUIGuideNode
- ($881BB7C90C7D0DFCC1492E3DC022A30F)accumulatedLength;
- (NSHashTable)dependencies;
- (NSMutableArray)edges;
- (_TUIGuideNode)init;
- (id)description;
- (void)setAccumulatedLength:(id *)a3;
- (void)setDependencies:(id)a3;
- (void)setEdges:(id)a3;
@end

@implementation _TUIGuideNode

- (_TUIGuideNode)init
{
  v8.receiver = self;
  v8.super_class = (Class)_TUIGuideNode;
  v2 = [(_TUIGuideNode *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable hashTableWithOptions:517];
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    uint64_t v5 = objc_opt_new();
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    *(_OWORD *)(v2 + 24) = xmmword_243130;
  }
  return (_TUIGuideNode *)v2;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = TUILengthDescription(*(void *)&self->_accumulatedLength.value, *(void *)&self->_accumulatedLength.max);
  v6 = +[NSString stringWithFormat:@"<%@ %p accLength=%@>", v4, self, v5];

  return v6;
}

- (NSHashTable)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)accumulatedLength
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_accumulatedLength.value;
}

- (void)setAccumulatedLength:(id *)a3
{
  *(void *)&self->_accumulatedLength.value = a3;
  *(void *)&self->_accumulatedLength.max = v3;
}

- (NSMutableArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edges, 0);

  objc_storeStrong((id *)&self->_dependencies, 0);
}

@end