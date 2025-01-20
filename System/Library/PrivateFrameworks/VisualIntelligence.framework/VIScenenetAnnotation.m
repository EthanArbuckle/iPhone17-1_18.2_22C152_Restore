@interface VIScenenetAnnotation
- (BOOL)isEqual:(id)a3;
- (NSArray)annotations;
- (VIScenenetAnnotation)initWithAnnotations:(id)a3 revision:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)revision;
@end

@implementation VIScenenetAnnotation

- (VIScenenetAnnotation)initWithAnnotations:(id)a3 revision:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VIScenenetAnnotation;
  v7 = [(VIScenenetAnnotation *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    annotations = v7->_annotations;
    v7->_annotations = (NSArray *)v8;

    v7->_revision = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIScenenetAnnotation *)a3;
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
    id v6 = v5;
    unint64_t revision = self->_revision;
    if (revision == [(VIScenenetAnnotation *)v6 revision])
    {
      annotations = self->_annotations;
      v9 = [(VIScenenetAnnotation *)v6 annotations];
      char IsEqual = VIObjectIsEqual((unint64_t)annotations, (uint64_t)v9);
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
  unint64_t v2 = 2654435761u * self->_revision;
  return [(NSArray *)self->_annotations hash] ^ v2;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (unint64_t)revision
{
  return self->_revision;
}

- (void).cxx_destruct
{
}

@end