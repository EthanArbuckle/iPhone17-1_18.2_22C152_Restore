@interface PXStoryConcreteColorResource
- (BOOL)isEqual:(id)a3;
- (PXStoryConcreteColorResource)init;
- (PXStoryConcreteColorResource)initWithColor:(id)a3 type:(int64_t)a4;
- (PXStoryConcreteColorResource)initWithIdentifier:(id)a3 kind:(int64_t)a4;
- (UIColor)px_storyResourceColor;
- (int64_t)px_storyResourceColorType;
- (unint64_t)hash;
@end

@implementation PXStoryConcreteColorResource

- (void).cxx_destruct
{
}

- (int64_t)px_storyResourceColorType
{
  return self->_colorType;
}

- (UIColor)px_storyResourceColor
{
  return self->_color;
}

- (unint64_t)hash
{
  v2 = [(PXStoryConcreteColorResource *)self px_storyResourceColor];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXStoryConcreteColorResource *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PXStoryConcreteColorResource *)self px_storyResourceColor];
      v7 = [(PXStoryConcreteColorResource *)v5 px_storyResourceColor];
      if ([v6 isEqual:v7])
      {
        int64_t v8 = [(PXStoryConcreteColorResource *)self px_storyResourceColorType];
        BOOL v9 = v8 == [(PXStoryConcreteColorResource *)v5 px_storyResourceColorType];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (PXStoryConcreteColorResource)initWithColor:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 description];
  v12.receiver = self;
  v12.super_class = (Class)PXStoryConcreteColorResource;
  int64_t v8 = [(PXStoryConcreteResource *)&v12 initWithIdentifier:v7 kind:4];

  if (v8)
  {
    uint64_t v9 = [v6 copy];
    color = v8->_color;
    v8->_color = (UIColor *)v9;

    v8->_colorType = a4;
  }

  return v8;
}

- (PXStoryConcreteColorResource)initWithIdentifier:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteResources.m", 158, @"%s is not available as initializer", "-[PXStoryConcreteColorResource initWithIdentifier:kind:]");

  abort();
}

- (PXStoryConcreteColorResource)init
{
  unint64_t v3 = [MEMORY[0x1E4FB1618] clearColor];
  v4 = [(PXStoryConcreteColorResource *)self initWithColor:v3 type:0];

  return v4;
}

@end