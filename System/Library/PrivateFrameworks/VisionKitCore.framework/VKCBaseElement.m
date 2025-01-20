@interface VKCBaseElement
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)hasChildren;
- (BOOL)isInspectableCellSelectable;
- (CGRect)boundingBox;
- (CGRect)imageSpaceBoundingBox;
- (CRDocumentOutputRegion)parentCRDocument;
- (CROutputRegion)crOutputRegion;
- (NSArray)children;
- (NSArray)components;
- (NSString)stringValue;
- (VKCBaseElement)parent;
- (VKQuad)quad;
- (id)childAtIndex:(unint64_t)a3;
- (id)description;
- (id)recursiveSearchForCROutputRegion:(id)a3;
- (int)confidence;
- (int64_t)elementType;
- (int64_t)type;
- (unint64_t)numberOfChildren;
- (void)loadInfoFromCROutputRegion:(id)a3;
- (void)setCrOutputRegion:(id)a3;
- (void)setParent:(id)a3;
- (void)setParentCRDocument:(id)a3;
- (void)setQuad:(id)a3;
@end

@implementation VKCBaseElement

- (int64_t)elementType
{
  return 0;
}

- (NSString)stringValue
{
  v2 = [(VKCBaseElement *)self crOutputRegion];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (CGRect)boundingBox
{
  v2 = [(VKCBaseElement *)self crOutputRegion];
  v3 = [v2 boundingQuad];
  [v3 boundingBox];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)imageSpaceBoundingBox
{
  v2 = [(VKCBaseElement *)self crOutputRegion];
  v3 = [v2 boundingQuad];
  double v4 = [v3 denormalizedQuad];
  [v4 boundingBox];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (int)confidence
{
  v2 = [(VKCBaseElement *)self crOutputRegion];
  int v3 = [v2 confidence];

  return v3;
}

- (int64_t)type
{
  v2 = [(VKCBaseElement *)self crOutputRegion];
  uint64_t v3 = [v2 type];

  if (v3 == 2048) {
    return 2;
  }
  else {
    return 1;
  }
}

- (NSArray)children
{
  return 0;
}

- (BOOL)isInspectableCellSelectable
{
  return 0;
}

- (unint64_t)numberOfChildren
{
  v2 = [(VKCBaseElement *)self children];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)hasChildren
{
  return [(VKCBaseElement *)self numberOfChildren] != 0;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(VKCBaseElement *)self quad];
  char v6 = objc_msgSend(v5, "containsPoint:", x, y);

  return v6;
}

- (void)setCrOutputRegion:(id)a3
{
  objc_storeStrong((id *)&self->_crOutputRegion, a3);
  id v5 = a3;
  [(VKCBaseElement *)self loadInfoFromCROutputRegion:v5];
}

- (void)loadInfoFromCROutputRegion:(id)a3
{
  id v4 = a3;
  id v5 = [VKQuad alloc];
  id v24 = [v4 boundingQuad];
  [v24 bottomLeft];
  double v7 = v6;
  double v9 = v8;
  double v10 = [v4 boundingQuad];
  [v10 bottomRight];
  double v12 = v11;
  double v14 = v13;
  double v15 = [v4 boundingQuad];
  [v15 topLeft];
  double v17 = v16;
  double v19 = v18;
  v20 = [v4 boundingQuad];

  [v20 topRight];
  v23 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v5, "initWithBottomLeft:bottomRight:topLeft:topRight:", v7, v9, v12, v14, v17, v19, v21, v22);
  [(VKCBaseElement *)self setQuad:v23];
}

- (id)childAtIndex:(unint64_t)a3
{
  id v5 = [(VKCBaseElement *)self children];
  if ([v5 count] <= a3)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKCBaseElement childAtIndex:]", 0, 0, @"Trying to ask for a child of index: %ld, where only %ld children exist", a3, [v5 count]);
    double v7 = 0;
  }
  else
  {
    double v6 = [(VKCBaseElement *)self children];
    double v7 = [v6 objectAtIndexedSubscript:a3];
  }
  return v7;
}

- (id)recursiveSearchForCROutputRegion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VKCBaseElement *)self crOutputRegion];
  int v6 = [v5 isEqual:v4];

  if (!v6 || (double v7 = self) == 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v8 = [(VKCBaseElement *)self children];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) recursiveSearchForCROutputRegion:v4];
          if (v13)
          {
            double v7 = (VKCBaseElement *)v13;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    double v7 = 0;
LABEL_13:
  }
  return v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = [(VKCBaseElement *)self stringValue];
  double v7 = [v3 stringWithFormat:@"%@ - %@", v5, v6];

  return v7;
}

- (VKCBaseElement)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (VKCBaseElement *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (CROutputRegion)crOutputRegion
{
  return self->_crOutputRegion;
}

- (CRDocumentOutputRegion)parentCRDocument
{
  return self->_parentCRDocument;
}

- (void)setParentCRDocument:(id)a3
{
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
}

- (NSArray)components
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_parentCRDocument, 0);
  objc_storeStrong((id *)&self->_crOutputRegion, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end