@interface VIVisualUnderstanding
- (BOOL)isEqual:(id)a3;
- (NSArray)imageRegions;
- (NSData)payload;
- (VIAnnotation)annotation;
- (VIVisualUnderstanding)initWithImageRegions:(id)a3 annotation:(id)a4 payload:(id)a5;
- (VIVisualUnderstanding)initWithImageRegions:(id)a3 payload:(id)a4;
- (VIVisualUnderstanding)initWithImageRegions:(id)a3 textBlockAnnotation:(id)a4 payload:(id)a5;
- (unint64_t)hash;
@end

@implementation VIVisualUnderstanding

- (VIVisualUnderstanding)initWithImageRegions:(id)a3 payload:(id)a4
{
  return [(VIVisualUnderstanding *)self initWithImageRegions:a3 annotation:0 payload:a4];
}

- (VIVisualUnderstanding)initWithImageRegions:(id)a3 textBlockAnnotation:(id)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4)
  {
    id v10 = a4;
    a4 = [[VIAnnotation alloc] initWithTextAnnotations:v10];
  }
  v11 = [(VIVisualUnderstanding *)self initWithImageRegions:v8 annotation:a4 payload:v9];

  return v11;
}

- (VIVisualUnderstanding)initWithImageRegions:(id)a3 annotation:(id)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VIVisualUnderstanding;
  v11 = [(VIVisualUnderstanding *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    imageRegions = v11->_imageRegions;
    v11->_imageRegions = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    annotation = v11->_annotation;
    v11->_annotation = (VIAnnotation *)v14;

    uint64_t v16 = [v10 copy];
    payload = v11->_payload;
    v11->_payload = (NSData *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIVisualUnderstanding *)a3;
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
    imageRegions = self->_imageRegions;
    id v8 = [(VIVisualUnderstanding *)v6 imageRegions];
    if (VIObjectIsEqual((unint64_t)imageRegions, (uint64_t)v8))
    {
      annotation = self->_annotation;
      id v10 = [(VIVisualUnderstanding *)v6 annotation];
      if (VIObjectIsEqual((unint64_t)annotation, (uint64_t)v10))
      {
        payload = self->_payload;
        uint64_t v12 = [(VIVisualUnderstanding *)v6 payload];
        char IsEqual = VIObjectIsEqual((unint64_t)payload, (uint64_t)v12);
      }
      else
      {
        char IsEqual = 0;
      }
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
  uint64_t v3 = [(NSArray *)self->_imageRegions hash];
  unint64_t v4 = [(VIAnnotation *)self->_annotation hash] ^ v3;
  return v4 ^ [(NSData *)self->_payload hash];
}

- (NSArray)imageRegions
{
  return self->_imageRegions;
}

- (NSData)payload
{
  return self->_payload;
}

- (VIAnnotation)annotation
{
  return self->_annotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_imageRegions, 0);
}

@end