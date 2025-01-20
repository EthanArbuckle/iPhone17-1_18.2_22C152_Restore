@interface CRLatticeRun
- (CGRect)rect;
- (CRLatticeRun)initWithRect:(CGRect)a3;
- (NSArray)graphEdges;
- (NSArray)paths;
- (NSMutableArray)mutablePaths;
- (void)appendPath:(id)a3;
- (void)setGraph:(id)a3;
- (void)setMutablePaths:(id)a3;
@end

@implementation CRLatticeRun

- (CRLatticeRun)initWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CRLatticeRun;
  v7 = [(CRLatticeRun *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    mutablePaths = v7->_mutablePaths;
    v7->_mutablePaths = (NSMutableArray *)v8;

    v7->_rect.origin.CGFloat x = x;
    v7->_rect.origin.CGFloat y = y;
    v7->_rect.size.CGFloat width = width;
    v7->_rect.size.CGFloat height = height;
  }
  return v7;
}

- (void)appendPath:(id)a3
{
}

- (void)setGraph:(id)a3
{
}

- (NSArray)paths
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_mutablePaths];
}

- (CGRect)rect
{
  objc_copyStruct(v6, &self->_rect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (NSArray)graphEdges
{
  return self->_graphEdges;
}

- (NSMutableArray)mutablePaths
{
  return self->_mutablePaths;
}

- (void)setMutablePaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePaths, 0);
  objc_storeStrong((id *)&self->_graphEdges, 0);
}

@end