@interface VMUGroupBy
- (VMUGroupBy)initWithGraph:(id)a3;
- (VMUProcessObjectGraph)graph;
- (id)typeNameForNode:(unsigned int)a3;
@end

@implementation VMUGroupBy

- (VMUGroupBy)initWithGraph:(id)a3
{
  v4 = (VMUProcessObjectGraph *)a3;
  v5 = [(VMUGroupBy *)self init];
  graph = v5->_graph;
  v5->_graph = v4;

  return v5;
}

- (id)typeNameForNode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(VMUGroupBy *)self graph];
  v5 = v4;
  if (v4) {
    [v4 nodeDetails:v3];
  }

  v6 = [0 className];
  if (!v6) {
    v6 = @"(unknown)";
  }

  return v6;
}

- (VMUProcessObjectGraph)graph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end