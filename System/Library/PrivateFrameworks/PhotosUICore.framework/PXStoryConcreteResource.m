@interface PXStoryConcreteResource
- (BOOL)isEqual:(id)a3;
- (NSString)px_storyResourceIdentifier;
- (PXStoryConcreteResource)init;
- (PXStoryConcreteResource)initWithIdentifier:(id)a3 kind:(int64_t)a4;
- (int64_t)px_storyResourceKind;
- (unint64_t)hash;
@end

@implementation PXStoryConcreteResource

- (void).cxx_destruct
{
}

- (int64_t)px_storyResourceKind
{
  return self->_kind;
}

- (NSString)px_storyResourceIdentifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  v2 = [(PXStoryConcreteResource *)self px_storyResourceIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXStoryConcreteResource *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PXStoryConcreteResource *)self px_storyResourceIdentifier];
      v7 = [(PXStoryConcreteResource *)v5 px_storyResourceIdentifier];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (PXStoryConcreteResource)initWithIdentifier:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryConcreteResource;
  v7 = [(PXStoryConcreteResource *)&v13 init];
  if (v7)
  {
    if (v6)
    {
      char v8 = (NSString *)v6;
      identifier = v7->_identifier;
      v7->_identifier = v8;
    }
    else
    {
      identifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v10 = [identifier UUIDString];
      v11 = v7->_identifier;
      v7->_identifier = (NSString *)v10;
    }
    v7->_kind = a4;
  }

  return v7;
}

- (PXStoryConcreteResource)init
{
  return [(PXStoryConcreteResource *)self initWithIdentifier:0 kind:0];
}

@end