@interface CRLatticeEdge
- (CRLatticeEdge)initWithSymbol:(id)a3 index:(unint64_t)a4 score:(double)a5 startNode:(unint64_t)a6 endNode:(unint64_t)a7;
- (NSString)symbol;
- (double)score;
- (unint64_t)edgeIndex;
- (unint64_t)endNode;
- (unint64_t)startNode;
@end

@implementation CRLatticeEdge

- (CRLatticeEdge)initWithSymbol:(id)a3 index:(unint64_t)a4 score:(double)a5 startNode:(unint64_t)a6 endNode:(unint64_t)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRLatticeEdge;
  v14 = [(CRLatticeEdge *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_symbol, a3);
    v15->_edgeIndex = a4;
    v15->_score = a5;
    v15->_startNode = a6;
    v15->_endNode = a7;
  }

  return v15;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (unint64_t)edgeIndex
{
  return self->_edgeIndex;
}

- (double)score
{
  return self->_score;
}

- (unint64_t)startNode
{
  return self->_startNode;
}

- (unint64_t)endNode
{
  return self->_endNode;
}

- (void).cxx_destruct
{
}

@end