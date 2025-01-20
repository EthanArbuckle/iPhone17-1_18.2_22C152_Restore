@interface VIDetectedResult
- (CGRect)boundingBox;
- (VIDetectedResult)initWithOntologyNode:(id)a3 position:(int64_t)a4 boundingBox:(CGRect)a5 score:(float)a6;
- (VIOntologyNode)ontologyNode;
- (float)score;
- (int64_t)position;
@end

@implementation VIDetectedResult

- (VIDetectedResult)initWithOntologyNode:(id)a3 position:(int64_t)a4 boundingBox:(CGRect)a5 score:(float)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VIDetectedResult;
  v15 = [(VIDetectedResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_ontologyNode, a3);
    v16->_position = a4;
    v16->_boundingBox.origin.CGFloat x = x;
    v16->_boundingBox.origin.CGFloat y = y;
    v16->_boundingBox.size.CGFloat width = width;
    v16->_boundingBox.size.CGFloat height = height;
    v16->_score = a6;
  }

  return v16;
}

- (VIOntologyNode)ontologyNode
{
  return self->_ontologyNode;
}

- (int64_t)position
{
  return self->_position;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

@end