@interface VisionCoreMutableNamedObjects
- (BOOL)assignData:(id)a3 toName:(id)a4 error:(id *)a5;
- (BOOL)assignObject:(id)a3 toName:(id)a4 error:(id *)a5;
- (BOOL)assignPixelBuffer:(__CVBuffer *)a3 toName:(id)a4 error:(id *)a5;
- (BOOL)assignSurface:(__IOSurface *)a3 toName:(id)a4 error:(id *)a5;
- (VisionCoreMutableNamedObjects)initWithCapacity:(unint64_t)a3;
- (VisionCoreMutableNamedObjects)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)_assignObject:(void *)a3 ofKind:(void *)a4 toName:(void *)a5 error:;
- (void)removeAssignmentForName:(id)a3;
@end

@implementation VisionCoreMutableNamedObjects

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [VisionCoreNamedObjects alloc];
  objects = self->super._objects;
  return [(VisionCoreNamedObjects *)v4 initWithDictionary:objects];
}

- (void)removeAssignmentForName:(id)a3
{
}

- (BOOL)assignObject:(id)a3 toName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  Class = object_getClass(v9);
  v11 = NSStringFromClass(Class);
  LOBYTE(a5) = -[VisionCoreMutableNamedObjects _assignObject:ofKind:toName:error:]((uint64_t)self, v9, v11, v8, a5);

  return (char)a5;
}

- (uint64_t)_assignObject:(void *)a3 ofKind:(void *)a4 toName:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    if (v9)
    {
      v12 = [*(id *)(a1 + 8) objectForKey:v11];
      if (v12)
      {
        if (a5)
        {
          v13 = (void *)[[NSString alloc] initWithFormat:@"\"%@\" has already been assigned %@", v11, v9];
          *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v13];
        }
        a1 = 0;
      }
      else
      {
        [*(id *)(a1 + 8) setObject:v9 forKey:v11];
        a1 = 1;
      }
    }
    else
    {
      if (!a5)
      {
        a1 = 0;
        goto LABEL_11;
      }
      v12 = (void *)[[NSString alloc] initWithFormat:@"%@ cannot be nil", v10];
      [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v12];
      a1 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_11:

  return a1;
}

- (BOOL)assignData:(id)a3 toName:(id)a4 error:(id *)a5
{
  return -[VisionCoreMutableNamedObjects _assignObject:ofKind:toName:error:]((uint64_t)self, a3, @"NSData", a4, a5);
}

- (BOOL)assignPixelBuffer:(__CVBuffer *)a3 toName:(id)a4 error:(id *)a5
{
  return -[VisionCoreMutableNamedObjects _assignObject:ofKind:toName:error:]((uint64_t)self, a3, @"CVPixelBufferRef", a4, a5);
}

- (BOOL)assignSurface:(__IOSurface *)a3 toName:(id)a4 error:(id *)a5
{
  return -[VisionCoreMutableNamedObjects _assignObject:ofKind:toName:error:]((uint64_t)self, a3, @"IOSurfaceRef", a4, a5);
}

- (VisionCoreMutableNamedObjects)initWithCapacity:(unint64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:a3];
  v5 = [(VisionCoreNamedObjects *)self _initWithRetainedDictionary:v4];

  return v5;
}

- (VisionCoreMutableNamedObjects)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    id v6 = (id)[v4 mutableCopy];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v7 = [(VisionCoreNamedObjects *)self _initWithRetainedDictionary:v6];

  return v7;
}

@end