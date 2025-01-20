@interface PKPassBucketTemplate
- (BOOL)sitsOnStripImage;
- (CGRect)bucketRect;
- (NSMutableArray)fieldTemplates;
- (PKPassFieldTemplate)defaultFieldTemplate;
- (double)minFieldPadding;
- (id)templateForFieldAtIndex:(unint64_t)a3;
- (int64_t)bucketAlignment;
- (unint64_t)maxFields;
- (void)addFieldTemplate:(id)a3;
- (void)setBucketAlignment:(int64_t)a3;
- (void)setBucketRect:(CGRect)a3;
- (void)setDefaultFieldTemplate:(id)a3;
- (void)setFieldTemplates:(id)a3;
- (void)setMaxFields:(unint64_t)a3;
- (void)setMinFieldPadding:(double)a3;
- (void)setSitsOnStripImage:(BOOL)a3;
@end

@implementation PKPassBucketTemplate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldTemplates, 0);

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

- (void)setMaxFields:(unint64_t)a3
{
  self->_maxFields = a3;
}

- (void)setBucketRect:(CGRect)a3
{
  self->_bucketRect = a3;
}

- (void)setBucketAlignment:(int64_t)a3
{
  self->_bucketAlignment = a3;
}

- (void)setSitsOnStripImage:(BOOL)a3
{
  self->_sitsOnStripImage = a3;
}

- (void)setMinFieldPadding:(double)a3
{
  self->_minFieldPadding = a3;
}

- (BOOL)sitsOnStripImage
{
  return self->_sitsOnStripImage;
}

- (int64_t)bucketAlignment
{
  return self->_bucketAlignment;
}

- (double)minFieldPadding
{
  return self->_minFieldPadding;
}

- (CGRect)bucketRect
{
  double x = self->_bucketRect.origin.x;
  double y = self->_bucketRect.origin.y;
  double width = self->_bucketRect.size.width;
  double height = self->_bucketRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)templateForFieldAtIndex:(unint64_t)a3
{
  if ([(PKPassBucketTemplate *)self maxFields] >= a3)
  {
    if ([(NSMutableArray *)self->_fieldTemplates count] <= a3)
    {
      v6 = 0;
    }
    else
    {
      v6 = [(NSMutableArray *)self->_fieldTemplates objectAtIndex:a3];
    }
    v5 = +[PKPassFieldTemplate _templateByResolvingTemplate:v6 withDefault:self->_defaultFieldTemplate];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)maxFields
{
  return self->_maxFields;
}

- (void)setDefaultFieldTemplate:(id)a3
{
}

- (void)addFieldTemplate:(id)a3
{
  id v4 = a3;
  fieldTemplates = self->_fieldTemplates;
  id v8 = v4;
  if (!fieldTemplates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_fieldTemplates;
    self->_fieldTemplates = v6;

    id v4 = v8;
    fieldTemplates = self->_fieldTemplates;
  }
  [(NSMutableArray *)fieldTemplates addObject:v4];
}

- (NSMutableArray)fieldTemplates
{
  return self->_fieldTemplates;
}

- (void)setFieldTemplates:(id)a3
{
}

@end