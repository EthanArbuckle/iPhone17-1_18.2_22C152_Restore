@interface CRTableGroupRegion
- (CRTableGroupRegion)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 cells:(id)a5 lineRegions:(id)a6 rowQuads:(id)a7 columnQuads:(id)a8;
- (NSArray)cells;
- (NSArray)columnQuads;
- (NSArray)rowQuads;
@end

@implementation CRTableGroupRegion

- (CRTableGroupRegion)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 cells:(id)a5 lineRegions:(id)a6 rowQuads:(id)a7 columnQuads:(id)a8
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)CRTableGroupRegion;
  v18 = [(CRGroupRegion *)&v21 initWithBoundingQuad:a3 layoutDirection:a4 subregions:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_rowQuads, a7);
    objc_storeStrong((id *)&v19->_columnQuads, a8);
    objc_storeStrong((id *)&v19->_cells, a5);
  }

  return v19;
}

- (NSArray)rowQuads
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)columnQuads
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)cells
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_columnQuads, 0);
  objc_storeStrong((id *)&self->_rowQuads, 0);
}

@end