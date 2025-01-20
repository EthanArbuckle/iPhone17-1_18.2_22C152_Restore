@interface PXStoryClipLayoutReuseIdentifier
- (BOOL)hasResourceEqualTo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PXStoryClip)clip;
- (PXStoryClipLayoutReuseIdentifier)init;
- (PXStoryClipLayoutReuseIdentifier)initWithClip:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation PXStoryClipLayoutReuseIdentifier

- (void).cxx_destruct
{
}

- (PXStoryClip)clip
{
  return self->_clip;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PXStoryClipLayoutReuseIdentifier *)self clip];
  uint64_t v7 = [v6 identifier];
  v8 = [(PXStoryClipLayoutReuseIdentifier *)self clip];
  v9 = [v3 stringWithFormat:@"<%@:%p; clipIdentifier:%ld clip:%@>", v5, self, v7, v8];

  return v9;
}

- (BOOL)hasResourceEqualTo:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryClipLayoutReuseIdentifier *)self clip];
  v6 = [v5 resource];

  uint64_t v7 = [v4 clip];

  v8 = [v7 resource];

  uint64_t v9 = objc_msgSend(v6, "px_storyResourceKind");
  if (v9 == objc_msgSend(v8, "px_storyResourceKind"))
  {
    v10 = objc_msgSend(v6, "px_storyResourceIdentifier");
    v11 = objc_msgSend(v8, "px_storyResourceIdentifier");
    if (v10 == v11) {
      char v12 = 1;
    }
    else {
      char v12 = [v10 isEqual:v11];
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v2 = [(PXStoryClipLayoutReuseIdentifier *)self clip];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PXStoryClipLayoutReuseIdentifier *)a3;
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
      v6 = [(PXStoryClipLayoutReuseIdentifier *)self clip];
      uint64_t v7 = [(PXStoryClipLayoutReuseIdentifier *)v5 clip];

      char v8 = [v6 isEqualToClip:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (PXStoryClipLayoutReuseIdentifier)initWithClip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryClipLayoutReuseIdentifier;
  v6 = [(PXStoryClipLayoutReuseIdentifier *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clip, a3);
  }

  return v7;
}

- (PXStoryClipLayoutReuseIdentifier)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryClipLayoutReuseIdentifier.m", 21, @"%s is not available as initializer", "-[PXStoryClipLayoutReuseIdentifier init]");

  abort();
}

@end