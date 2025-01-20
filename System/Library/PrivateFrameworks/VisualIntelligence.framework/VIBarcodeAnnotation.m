@interface VIBarcodeAnnotation
+ (id)annotationFromObservations:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)annotationItems;
- (VIBarcodeAnnotation)initWithAnnotationItems:(id)a3;
- (unint64_t)hash;
@end

@implementation VIBarcodeAnnotation

- (VIBarcodeAnnotation)initWithAnnotationItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIBarcodeAnnotation;
  v5 = [(VIBarcodeAnnotation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    annotationItems = v5->_annotationItems;
    v5->_annotationItems = (NSArray *)v6;
  }
  return v5;
}

+ (id)annotationFromObservations:(id)a3
{
  v3 = (void *)VICompactMapArray(a3, &__block_literal_global_2);
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAnnotationItems:v3];

  return v4;
}

id __50__VIBarcodeAnnotation_annotationFromObservations___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VIBarcodeAnnotationItem annotationItemFromObservation:a2];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v15 = v5;
  uint64_t v16 = v3;
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  annotationItems = self->_annotationItems;
  v13 = objc_msgSend(v11, "annotationItems", v6, v15, v4, v16, v7, v8);
  LOBYTE(annotationItems) = VIObjectIsEqual((unint64_t)annotationItems, (uint64_t)v13);

  return (char)annotationItems;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_annotationItems hash];
}

- (NSArray)annotationItems
{
  return self->_annotationItems;
}

- (void).cxx_destruct
{
}

@end