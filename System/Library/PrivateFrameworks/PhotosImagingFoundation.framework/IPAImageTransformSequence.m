@interface IPAImageTransformSequence
- (BOOL)canAlignToPixelsExactly;
- (CGPoint)mapPoint:(CGPoint)a3;
- (IPAImageTransformSequence)initWithTransforms:(id)a3;
- (id)description;
- (id)inputGeometry;
- (id)intrinsicGeometry;
- (id)inverseTransform;
@end

@implementation IPAImageTransformSequence

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@.%p elements:%@>", v5, self, self->_transforms];

  return v6;
}

- (id)inverseTransform
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(NSArray *)self->_transforms reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) inverseTransform];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = [[IPAImageTransformSequence alloc] initWithTransforms:v3];
  return v9;
}

- (CGPoint)mapPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_transforms;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "mapPoint:", x, y, (void)v13);
        double x = v9;
        double y = v10;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  double v11 = x;
  double v12 = y;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (id)intrinsicGeometry
{
  v2 = [(NSArray *)self->_transforms lastObject];
  v3 = [v2 intrinsicGeometry];

  return v3;
}

- (id)inputGeometry
{
  v2 = [(NSArray *)self->_transforms firstObject];
  v3 = [v2 inputGeometry];

  return v3;
}

- (BOOL)canAlignToPixelsExactly
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_transforms;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "canAlignToPixelsExactly", (void)v8) & 1) == 0)
        {
          BOOL v6 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (IPAImageTransformSequence)initWithTransforms:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v9.receiver = self;
    v9.super_class = (Class)IPAImageTransformSequence;
    uint64_t v5 = [(IPAImageTransformSequence *)&v9 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      transforms = v5->_transforms;
      v5->_transforms = (NSArray *)v6;
    }
    return v5;
  }
  else
  {
    CGPoint result = (IPAImageTransformSequence *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

@end