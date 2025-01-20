@interface CRLMutableBrushStrokeStorage
+ (id)p_smoothPath:(id)a3;
- (CRLImage)image;
- (CRLMutableBrushStrokeStorage)init;
- (NSDictionary)bounds;
- (NSDictionary)lineEnds;
- (NSDictionary)options;
- (NSDictionary)paths;
- (NSDictionary)textureIndices;
- (id)deepCopy;
- (unint64_t)totalSectionCount;
- (void)addPath:(id)a3 withBounds:(CGRect)a4 shouldSmooth:(BOOL)a5 forKey:(id)a6;
- (void)addTextureIndex:(unint64_t)a3 forKey:(id)a4;
- (void)setImage:(id)a3;
- (void)setLineEnd:(id)a3 forKey:(id)a4;
- (void)setOption:(id)a3 forKey:(id)a4;
@end

@implementation CRLMutableBrushStrokeStorage

- (CRLMutableBrushStrokeStorage)init
{
  v14.receiver = self;
  v14.super_class = (Class)CRLMutableBrushStrokeStorage;
  v2 = [(CRLMutableBrushStrokeStorage *)&v14 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    paths = v2->_paths;
    v2->_paths = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    bounds = v2->_bounds;
    v2->_bounds = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    textureIndices = v2->_textureIndices;
    v2->_textureIndices = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    options = v2->_options;
    v2->_options = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    lineEnds = v2->_lineEnds;
    v2->_lineEnds = (NSMutableDictionary *)v11;
  }
  return v2;
}

- (unint64_t)totalSectionCount
{
  v2 = [(CRLMutableBrushStrokeStorage *)self paths];
  unint64_t v3 = +[CRLImmutableBrushStrokeStorage p_totalSectionCountWithPaths:v2];

  return v3;
}

- (void)setImage:(id)a3
{
  v4 = (CRLImage *)[a3 copy];
  image = self->_image;
  self->_image = v4;
}

- (void)addPath:(id)a3 withBounds:(CGRect)a4 shouldSmooth:(BOOL)a5 forKey:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v24 = a3;
  id v13 = a6;
  objc_super v14 = [(NSMutableDictionary *)self->_paths objectForKeyedSubscript:v13];
  if (!v14)
  {
    objc_super v14 = +[NSMutableArray array];
    [(NSMutableDictionary *)self->_paths setObject:v14 forKeyedSubscript:v13];
  }
  v15 = [(NSMutableDictionary *)self->_bounds objectForKeyedSubscript:v13];
  if (v15)
  {
    if (a5)
    {
LABEL_5:
      id v16 = +[CRLMutableBrushStrokeStorage p_smoothPath:v24];
      goto LABEL_8;
    }
  }
  else
  {
    v15 = +[NSMutableArray array];
    [(NSMutableDictionary *)self->_bounds setObject:v15 forKeyedSubscript:v13];
    if (a5) {
      goto LABEL_5;
    }
  }
  id v16 = [v24 copy];
LABEL_8:
  v17 = v16;
  v18 = [(NSMutableDictionary *)self->_paths objectForKeyedSubscript:v13];
  v19 = [CRLBrushStrokeStorageBezierPathContainer alloc];
  id v20 = [v24 copy];
  v21 = [(CRLBrushStrokeStorageBezierPathContainer *)v19 initWithOriginalPath:v20 pathWithPossibleSmoothing:v17];
  [v18 addObject:v21];

  v22 = [(NSMutableDictionary *)self->_bounds objectForKeyedSubscript:v13];
  v23 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height);
  [v22 addObject:v23];
}

+ (id)p_smoothPath:(id)a3
{
  return +[CRLBezierPath smoothBezierPath:a3 withThreshold:0.05];
}

- (void)addTextureIndex:(unint64_t)a3 forKey:(id)a4
{
  id v8 = a4;
  v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_textureIndices, "objectForKeyedSubscript:");
  if (!v6)
  {
    v6 = +[NSMutableArray array];
    [(NSMutableDictionary *)self->_textureIndices setObject:v6 forKeyedSubscript:v8];
  }
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
  [v6 addObject:v7];
}

- (void)setOption:(id)a3 forKey:(id)a4
{
  options = self->_options;
  id v6 = a4;
  id v7 = [a3 copy];
  [(NSMutableDictionary *)options setObject:v7 forKey:v6];
}

- (void)setLineEnd:(id)a3 forKey:(id)a4
{
  lineEnds = self->_lineEnds;
  id v6 = a4;
  id v7 = a3;
  id v8 = [CRLLineEnd alloc];
  id v20 = [v7 path];
  id v9 = [v20 copy];
  v10 = [v7 wrapPath];
  id v11 = [v10 copy];
  [v7 endPoint];
  double v13 = v12;
  double v15 = v14;
  id v16 = [v7 isFilled];
  v17 = [v7 identifier];
  id v18 = [v7 lineJoin];

  v19 = -[CRLLineEnd initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](v8, "initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", v9, v11, v16, v17, v18, v13, v15);
  [(NSMutableDictionary *)lineEnds setObject:v19 forKey:v6];
}

- (id)deepCopy
{
  v2 = [[CRLImmutableBrushStrokeStorage alloc] initWithImage:self->_image paths:self->_paths bounds:self->_bounds textureIndices:self->_textureIndices options:self->_options lineEnds:self->_lineEnds];
  unint64_t v3 = [(CRLImmutableBrushStrokeStorage *)v2 deepCopy];

  return v3;
}

- (CRLImage)image
{
  return self->_image;
}

- (NSDictionary)paths
{
  return &self->_paths->super;
}

- (NSDictionary)bounds
{
  return &self->_bounds->super;
}

- (NSDictionary)textureIndices
{
  return &self->_textureIndices->super;
}

- (NSDictionary)options
{
  return &self->_options->super;
}

- (NSDictionary)lineEnds
{
  return &self->_lineEnds->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_lineEnds, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_textureIndices, 0);
  objc_storeStrong((id *)&self->_bounds, 0);

  objc_storeStrong((id *)&self->_paths, 0);
}

@end