@interface VIVisualQuery
+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 depthBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 normalizedRegionOfInterest:(CGRect)a6 textBlockAnnotation:(id)a7 queryContext:(id)a8;
+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4;
+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 normalizedRegionOfInterest:(CGRect)a5;
+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 normalizedRegionOfInterest:(CGRect)a5 annotation:(id)a6 queryContext:(id)a7;
+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 normalizedRegionOfInterest:(CGRect)a5 textBlockAnnotation:(id)a6 queryContext:(id)a7;
- (CGRect)normalizedRegionOfInterest;
- (NSSet)domainsOfInterest;
- (VIAnnotation)annotation;
- (VIImageContent)image;
- (VIQueryContext)queryContext;
- (VIVisualQuery)initWithImage:(id)a3 annotation:(id)a4 normalizedRegionOfInterest:(CGRect)a5 domainsOfInterest:(id)a6 queryContext:(id)a7;
- (VIVisualQuery)initWithImage:(id)a3 textBlockAnnotation:(id)a4 normalizedRegionOfInterest:(CGRect)a5 domainsOfInterest:(id)a6 queryContext:(id)a7;
@end

@implementation VIVisualQuery

- (VIVisualQuery)initWithImage:(id)a3 textBlockAnnotation:(id)a4 normalizedRegionOfInterest:(CGRect)a5 domainsOfInterest:(id)a6 queryContext:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  if (a4)
  {
    id v18 = a4;
    a4 = [[VIAnnotation alloc] initWithTextAnnotations:v18];
  }
  v19 = -[VIVisualQuery initWithImage:annotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:](self, "initWithImage:annotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:", v15, a4, v16, v17, x, y, width, height);

  return v19;
}

- (VIVisualQuery)initWithImage:(id)a3 annotation:(id)a4 normalizedRegionOfInterest:(CGRect)a5 domainsOfInterest:(id)a6 queryContext:(id)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  v29.receiver = self;
  v29.super_class = (Class)VIVisualQuery;
  v20 = [(VIVisualQuery *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_image, a3);
    v21->_normalizedRegionOfInterest.origin.CGFloat x = x;
    v21->_normalizedRegionOfInterest.origin.CGFloat y = y;
    v21->_normalizedRegionOfInterest.size.CGFloat width = width;
    v21->_normalizedRegionOfInterest.size.CGFloat height = height;
    uint64_t v22 = [v18 copy];
    domainsOfInterest = v21->_domainsOfInterest;
    v21->_domainsOfInterest = (NSSet *)v22;

    uint64_t v24 = [v19 copy];
    queryContext = v21->_queryContext;
    v21->_queryContext = (VIQueryContext *)v24;

    uint64_t v26 = [v17 copy];
    annotation = v21->_annotation;
    v21->_annotation = (VIAnnotation *)v26;
  }
  return v21;
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = objc_opt_class();
  double v7 = *(double *)&VIIdentityRect;
  double v8 = unk_1EAB01B60;
  double v9 = *(double *)&qword_1EAB01B68;
  double v10 = unk_1EAB01B70;
  return (id)objc_msgSend(v6, "queryWithPixelBuffer:orientation:normalizedRegionOfInterest:", a3, v4, v7, v8, v9, v10);
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 normalizedRegionOfInterest:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v9 = *(void *)&a4;
  v11 = objc_opt_class();
  return (id)objc_msgSend(v11, "queryWithPixelBuffer:orientation:normalizedRegionOfInterest:textBlockAnnotation:queryContext:", a3, v9, 0, 0, x, y, width, height);
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 normalizedRegionOfInterest:(CGRect)a5 textBlockAnnotation:(id)a6 queryContext:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v12 = *(void *)&a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = objc_alloc((Class)objc_opt_class());
  id v17 = +[VIImage imageWithPixelBuffer:a3 orientation:v12];
  id v18 = VIAllVisualSearchDomains();
  id v19 = objc_msgSend(v16, "initWithImage:textBlockAnnotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:", v17, v15, v18, v14, x, y, width, height);

  return v19;
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 depthBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 normalizedRegionOfInterest:(CGRect)a6 textBlockAnnotation:(id)a7 queryContext:(id)a8
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v13 = *(void *)&a5;
  id v15 = a8;
  id v16 = a7;
  id v17 = objc_alloc((Class)objc_opt_class());
  id v18 = +[VIImage imageWithPixelBuffer:a3 orientation:v13];
  id v19 = VIAllVisualSearchDomains();
  v20 = objc_msgSend(v17, "initWithImage:textBlockAnnotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:", v18, v16, v19, v15, x, y, width, height);

  return v20;
}

+ (id)queryWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 normalizedRegionOfInterest:(CGRect)a5 annotation:(id)a6 queryContext:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v12 = *(void *)&a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = objc_alloc((Class)objc_opt_class());
  id v17 = +[VIImage imageWithPixelBuffer:a3 orientation:v12];
  id v18 = VIAllVisualSearchDomains();
  id v19 = objc_msgSend(v16, "initWithImage:annotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:", v17, v15, v18, v14, x, y, width, height);

  return v19;
}

- (VIImageContent)image
{
  return self->_image;
}

- (VIAnnotation)annotation
{
  return self->_annotation;
}

- (CGRect)normalizedRegionOfInterest
{
  double x = self->_normalizedRegionOfInterest.origin.x;
  double y = self->_normalizedRegionOfInterest.origin.y;
  double width = self->_normalizedRegionOfInterest.size.width;
  double height = self->_normalizedRegionOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSSet)domainsOfInterest
{
  return self->_domainsOfInterest;
}

- (VIQueryContext)queryContext
{
  return self->_queryContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_domainsOfInterest, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end