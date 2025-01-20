@interface VIParsedVisualQuery
+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 imageRegions:(id)a5 payload:(id)a6;
+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 imageRegions:(id)a5 textBlockAnnotation:(id)a6 queryContext:(id)a7 payload:(id)a8;
- (BOOL)isEqual:(id)a3;
- (VIImageContent)image;
- (VIParsedVisualQuery)initWithImage:(id)a3 imageRegions:(id)a4 textBlockAnnotation:(id)a5 queryContext:(id)a6 payload:(id)a7;
- (VIParsedVisualQuery)initWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5;
- (VIQueryContext)queryContext;
- (VIVisualUnderstanding)visualUnderstanding;
- (unint64_t)hash;
@end

@implementation VIParsedVisualQuery

- (VIParsedVisualQuery)initWithImage:(id)a3 imageRegions:(id)a4 textBlockAnnotation:(id)a5 queryContext:(id)a6 payload:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[VIVisualUnderstanding alloc] initWithImageRegions:v15 textBlockAnnotation:v14 payload:v12];

  v18 = [(VIParsedVisualQuery *)self initWithImage:v16 visualUnderstanding:v17 queryContext:v13];
  return v18;
}

- (VIParsedVisualQuery)initWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VIParsedVisualQuery;
  id v12 = [(VIParsedVisualQuery *)&v19 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a3);
    uint64_t v14 = [v10 copy];
    visualUnderstanding = v13->_visualUnderstanding;
    v13->_visualUnderstanding = (VIVisualUnderstanding *)v14;

    uint64_t v16 = [v11 copy];
    queryContext = v13->_queryContext;
    v13->_queryContext = (VIQueryContext *)v16;
  }
  return v13;
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 imageRegions:(id)a5 payload:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = [(id)objc_opt_class() queryWithPixelBuffer:a3 orientation:v7 imageRegions:v10 textBlockAnnotation:0 queryContext:0 payload:v9];

  return v11;
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 imageRegions:(id)a5 textBlockAnnotation:(id)a6 queryContext:(id)a7 payload:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  v17 = [[VIVisualUnderstanding alloc] initWithImageRegions:v16 textBlockAnnotation:v15 payload:v13];

  v18 = +[VIImage imageWithPixelBuffer:a3 orientation:v11];
  objc_super v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithImage:v18 visualUnderstanding:v17 queryContext:v14];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIParsedVisualQuery *)a3;
  if (v4 == self)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    image = self->_image;
    v8 = [(VIParsedVisualQuery *)v6 image];
    if (VIObjectIsEqual((unint64_t)image, (uint64_t)v8))
    {
      visualUnderstanding = self->_visualUnderstanding;
      id v10 = [(VIParsedVisualQuery *)v6 visualUnderstanding];
      char IsEqual = VIObjectIsEqual((unint64_t)visualUnderstanding, (uint64_t)v10);
    }
    else
    {
      char IsEqual = 0;
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3 = [(VIImageContent *)self->_image hash];
  return [(VIVisualUnderstanding *)self->_visualUnderstanding hash] ^ v3;
}

- (VIImageContent)image
{
  return self->_image;
}

- (VIVisualUnderstanding)visualUnderstanding
{
  return self->_visualUnderstanding;
}

- (VIQueryContext)queryContext
{
  return self->_queryContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_visualUnderstanding, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end