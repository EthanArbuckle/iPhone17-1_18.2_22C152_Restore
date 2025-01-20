@interface _TVContentRatingBadgeDescriptor
- (BOOL)isTemplatedImage;
- (NSString)resourceName;
- (_TVContentRatingBadgeDescriptor)initWithResourceName:(id)a3 isTemplatedImage:(BOOL)a4;
@end

@implementation _TVContentRatingBadgeDescriptor

- (_TVContentRatingBadgeDescriptor)initWithResourceName:(id)a3 isTemplatedImage:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_TVContentRatingBadgeDescriptor;
  v7 = [(_TVContentRatingBadgeDescriptor *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    resourceName = v7->_resourceName;
    v7->_resourceName = (NSString *)v8;

    v7->_templatedImage = a4;
  }

  return v7;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (BOOL)isTemplatedImage
{
  return self->_templatedImage;
}

- (void).cxx_destruct
{
}

@end