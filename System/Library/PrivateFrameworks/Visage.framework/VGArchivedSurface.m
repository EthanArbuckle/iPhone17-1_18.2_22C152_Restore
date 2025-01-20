@interface VGArchivedSurface
+ (BOOL)supportsSecureCoding;
+ (id)archivedSurfaceWithSurface:(id)a3;
- (IOSurface)decodedSurface;
- (VGArchivedSurface)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDecodedSurface:(id)a3;
@end

@implementation VGArchivedSurface

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)archivedSurfaceWithSurface:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_getAssociatedObject(v4, a1);
    if (!v6)
    {
      v6 = objc_opt_new();
      v6[1] = v5;
      objc_setAssociatedObject(v5, a1, v6, (void *)1);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (VGArchivedSurface)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VGArchivedSurface;
  v5 = [(VGArchivedSurface *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_vg_decodeSurfaceForKey:", @"surface");
    decodedSurface = v5->_decodedSurface;
    v5->_decodedSurface = (IOSurface *)v6;

    v8 = v5;
  }

  return v5;
}

- (IOSurface)decodedSurface
{
  return self->_decodedSurface;
}

- (void)setDecodedSurface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end