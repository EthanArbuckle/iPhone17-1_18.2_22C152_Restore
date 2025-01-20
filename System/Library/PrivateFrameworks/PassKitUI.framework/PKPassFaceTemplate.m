@interface PKPassFaceTemplate
- (CGSize)barcodeMaxSize;
- (NSMutableArray)bucketTemplates;
- (PKPassFieldTemplate)defaultFieldTemplate;
- (double)barcodeBottomInset;
- (id)templateForBucketAtIndex:(unint64_t)a3;
- (void)addBucketTemplate:(id)a3;
- (void)setBarcodeBottomInset:(double)a3;
- (void)setBarcodeMaxSize:(CGSize)a3;
- (void)setBucketTemplates:(id)a3;
- (void)setDefaultFieldTemplate:(id)a3;
@end

@implementation PKPassFaceTemplate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketTemplates, 0);

  objc_storeStrong((id *)&self->_defaultFieldTemplate, 0);
}

- (PKPassFieldTemplate)defaultFieldTemplate
{
  defaultFieldTemplate = self->_defaultFieldTemplate;
  if (!defaultFieldTemplate)
  {
    v4 = objc_alloc_init(PKPassFieldTemplate);
    v5 = self->_defaultFieldTemplate;
    self->_defaultFieldTemplate = v4;

    defaultFieldTemplate = self->_defaultFieldTemplate;
  }

  return defaultFieldTemplate;
}

- (void)addBucketTemplate:(id)a3
{
  id v4 = a3;
  bucketTemplates = self->_bucketTemplates;
  id v8 = v4;
  if (!bucketTemplates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_bucketTemplates;
    self->_bucketTemplates = v6;

    id v4 = v8;
    bucketTemplates = self->_bucketTemplates;
  }
  [(NSMutableArray *)bucketTemplates addObject:v4];
}

- (void)setBarcodeMaxSize:(CGSize)a3
{
  self->_barcodeMaxSize = a3;
}

- (void)setBarcodeBottomInset:(double)a3
{
  self->_barcodeBottomInset = a3;
}

- (double)barcodeBottomInset
{
  return self->_barcodeBottomInset;
}

- (CGSize)barcodeMaxSize
{
  double width = self->_barcodeMaxSize.width;
  double height = self->_barcodeMaxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)templateForBucketAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_bucketTemplates count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_bucketTemplates objectAtIndex:a3];
    v6 = [v5 defaultFieldTemplate];
    v7 = +[PKPassFieldTemplate _templateByResolvingTemplate:v6 withDefault:self->_defaultFieldTemplate];

    [v5 setDefaultFieldTemplate:v7];
  }

  return v5;
}

- (void)setDefaultFieldTemplate:(id)a3
{
}

- (NSMutableArray)bucketTemplates
{
  return self->_bucketTemplates;
}

- (void)setBucketTemplates:(id)a3
{
}

@end