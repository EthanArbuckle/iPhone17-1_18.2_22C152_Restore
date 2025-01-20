@interface CRLayoutListItem
- (BOOL)canBeSucceededByListItem:(id)a3;
- (CRLayoutListItem)initWithGroup:(id)a3;
- (CRListItemMarker)marker;
- (CRNormalizedQuad)unionBoundingQuad;
- (NSArray)groups;
- (_NSRange)markerRange;
- (int64_t)markerType;
- (void)appendGroup:(id)a3;
- (void)setGroups:(id)a3;
- (void)setMarker:(id)a3;
- (void)setUnionBoundingQuad:(id)a3;
@end

@implementation CRLayoutListItem

- (CRLayoutListItem)initWithGroup:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLayoutListItem;
  v5 = [(CRLayoutListItem *)&v12 init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [v4 text];
  v7 = +[CRListItemMarker listItemMarkerForText:v6 requiresAdjacentText:1];
  [(CRLayoutListItem *)v5 setMarker:v7];

  v8 = [(CRLayoutListItem *)v5 marker];

  if (v8)
  {
    v13[0] = v4;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [(CRLayoutListItem *)v5 setGroups:v9];

    v10 = [v4 boundingQuad];
    [(CRLayoutListItem *)v5 setUnionBoundingQuad:v10];

LABEL_4:
    v8 = v5;
  }

  return v8;
}

- (void)appendGroup:(id)a3
{
  id v4 = a3;
  v5 = [(CRLayoutListItem *)self groups];
  v6 = [v5 arrayByAddingObject:v4];
  [(CRLayoutListItem *)self setGroups:v6];

  v7 = [(CRLayoutListItem *)self unionBoundingQuad];
  [v7 baselineAngle];
  double v9 = v8;
  v10 = [v4 boundingQuad];
  [v10 baselineAngle];
  double v12 = v11;
  v13 = [(CRLayoutListItem *)self groups];
  unint64_t v14 = [v13 count];
  double v15 = v9 - v12;
  if (v9 - v12 <= 3.14159265)
  {
    if (v15 > -3.14159265) {
      goto LABEL_6;
    }
    double v16 = 6.28318531;
  }
  else
  {
    double v16 = -6.28318531;
  }
  double v15 = v15 + v16;
LABEL_6:
  double v17 = v12 + v15 * (float)(1.0 / (float)v14);
  if (v17 <= 3.14159265)
  {
    if (v17 > -3.14159265) {
      goto LABEL_11;
    }
    double v18 = 6.28318531;
  }
  else
  {
    double v18 = -6.28318531;
  }
  double v17 = v17 + v18;
LABEL_11:

  id v22 = [(CRLayoutListItem *)self unionBoundingQuad];
  v19 = [v4 boundingQuad];

  *(float *)&double v20 = v17;
  v21 = [v22 unionWithNormalizedQuad:v19 baselineAngle:v20];
  [(CRLayoutListItem *)self setUnionBoundingQuad:v21];
}

- (BOOL)canBeSucceededByListItem:(id)a3
{
  id v4 = a3;
  v5 = [(CRLayoutListItem *)self marker];
  v6 = [v4 marker];

  LOBYTE(v4) = [v5 canBeSucceededByMarker:v6];
  return (char)v4;
}

- (_NSRange)markerRange
{
  v2 = [(CRLayoutListItem *)self marker];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (int64_t)markerType
{
  v2 = [(CRLayoutListItem *)self marker];
  int64_t v3 = [v2 type];

  return v3;
}

- (NSArray)groups
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGroups:(id)a3
{
}

- (CRNormalizedQuad)unionBoundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUnionBoundingQuad:(id)a3
{
}

- (CRListItemMarker)marker
{
  return (CRListItemMarker *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMarker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marker, 0);
  objc_storeStrong((id *)&self->_unionBoundingQuad, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end