@interface CRGroupRegion
- (CRGroupRegion)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5;
- (CRNormalizedQuad)boundingQuad;
- (NSArray)subregions;
- (unint64_t)layoutDirection;
- (void)setSubregions:(id)a3;
@end

@implementation CRGroupRegion

- (CRGroupRegion)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CRGroupRegion;
  v11 = [(CRGroupRegion *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_boundingQuad, a3);
    v12->_layoutDirection = a4;
    objc_storeStrong((id *)&v12->_subregions, a5);
  }

  return v12;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSubregions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end