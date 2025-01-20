@interface VisionCoreNamedObjects
- (BOOL)accessReadOnlyDataForName:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)accessReadOnlyDataForNames:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (IOSurfaceRef)_surfaceForName:(int)a3 allowingAssociatedObject:(void *)a4 error:;
- (NSArray)allNames;
- (VisionCoreNamedObjects)init;
- (VisionCoreNamedObjects)initWithDictionary:(id)a3;
- (VisionCoreNamedObjects)initWithNamedObjects:(id)a3;
- (__CVBuffer)pixelBufferForName:(id)a3 error:(id *)a4;
- (__IOSurface)surfaceAssociatedWithName:(id)a3 error:(id *)a4;
- (__IOSurface)surfaceForName:(id)a3 error:(id *)a4;
- (id)_initWithRetainedDictionary:(id)a3;
- (id)dataForName:(id)a3 error:(id *)a4;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectOfClass:(Class)a3 forName:(id)a4 error:(id *)a5;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_objectForName:(objc_class *)a3 requiredClass:(void *)a4 error:;
@end

@implementation VisionCoreNamedObjects

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VisionCoreNamedObjects *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSDictionary *)self->_objects isEqualToDictionary:v4->_objects];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_objects hash];
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)VisionCoreNamedObjects;
  v3 = [(VisionCoreNamedObjects *)&v24 description];
  v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(NSDictionary *)self->_objects allKeys];
  v6 = [v5 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  v7 = [v6 valueForKeyPath:@"@max.length"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = v8 + 1;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x230F41A40]();
        v16 = objc_msgSend(v14, "VisionCore_stringAppendedWithPaddingCharacter:toMinimumLength:", 32, v11);
        v17 = [(NSDictionary *)self->_objects objectForKey:v14];
        [v4 appendFormat:@"\n    %@: %@", v16, v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v10);
  }

  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSDictionary *)self->_objects countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [VisionCoreMutableNamedObjects alloc];
  objects = self->_objects;
  return [(VisionCoreMutableNamedObjects *)v4 initWithDictionary:objects];
}

- (id)objectOfClass:(Class)a3 forName:(id)a4 error:(id *)a5
{
  return -[VisionCoreNamedObjects _objectForName:requiredClass:error:]((uint64_t)self, a4, a3, a5);
}

- (void)_objectForName:(objc_class *)a3 requiredClass:(void *)a4 error:
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v8 = [*(id *)(a1 + 8) objectForKey:v7];
    if (v8)
    {
      if (!a3 || (objc_opt_isKindOfClass() & 1) != 0)
      {
        a4 = v8;
LABEL_11:

        goto LABEL_12;
      }
      if (!a4) {
        goto LABEL_11;
      }
      id v10 = [NSString alloc];
      uint64_t v11 = NSStringFromClass(a3);
      uint64_t v12 = (void *)[v10 initWithFormat:@"\"%@\" is not a %@", v7, v11];

      *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v12];
    }
    else
    {
      if (!a4) {
        goto LABEL_11;
      }
      uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"\"%@\" has not been assigned", v7];
      *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v9];
    }
    a4 = 0;
    goto LABEL_11;
  }
  a4 = 0;
LABEL_12:

  return a4;
}

- (id)dataForName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = -[VisionCoreNamedObjects _objectForName:requiredClass:error:]((uint64_t)self, v6, v7, a4);

  return v8;
}

- (__CVBuffer)pixelBufferForName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[VisionCoreNamedObjects _objectForName:requiredClass:error:]((uint64_t)self, v6, 0, a4);
  id v7 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (!v7)
  {
LABEL_5:
    id v10 = 0;
    goto LABEL_6;
  }
  CFTypeID v9 = CFGetTypeID(v7);
  id v10 = v8;
  if (v9 != CVPixelBufferGetTypeID())
  {
    if (a4)
    {
      uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"\"%@\" is not a CVPixelBuffer", v6];
      *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v11];
    }
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (__IOSurface)surfaceAssociatedWithName:(id)a3 error:(id *)a4
{
  return -[VisionCoreNamedObjects _surfaceForName:allowingAssociatedObject:error:]((uint64_t)self, a3, 1, a4);
}

- (IOSurfaceRef)_surfaceForName:(int)a3 allowingAssociatedObject:(void *)a4 error:
{
  id v7 = a2;
  if (!a1)
  {
    IOSurfaceRef IOSurface = 0;
    goto LABEL_14;
  }
  -[VisionCoreNamedObjects _objectForName:requiredClass:error:](a1, v7, 0, a4);
  uint64_t v8 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  CFTypeID v9 = v8;
  if (!v8) {
    goto LABEL_12;
  }
  CFTypeID v10 = CFGetTypeID(v8);
  IOSurfaceRef IOSurface = v9;
  if (v10 != IOSurfaceGetTypeID())
  {
    if (a3)
    {
      if (v10 == CVPixelBufferGetTypeID())
      {
        IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v9);
        if (IOSurface) {
          goto LABEL_13;
        }
      }
      if (!a4) {
        goto LABEL_12;
      }
      uint64_t v12 = @"\"%@\" cannot provide an IOSurface";
    }
    else
    {
      if (!a4)
      {
LABEL_12:
        IOSurfaceRef IOSurface = 0;
        goto LABEL_13;
      }
      uint64_t v12 = @"\"%@\" is not an IOSurface";
    }
    v13 = objc_msgSend([NSString alloc], "initWithFormat:", v12, v7);
    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v13];

    goto LABEL_12;
  }
LABEL_13:

LABEL_14:
  return IOSurface;
}

- (__IOSurface)surfaceForName:(id)a3 error:(id *)a4
{
  return -[VisionCoreNamedObjects _surfaceForName:allowingAssociatedObject:error:]((uint64_t)self, a3, 0, a4);
}

- (NSArray)allNames
{
  return [(NSDictionary *)self->_objects allKeys];
}

- (unint64_t)count
{
  return [(NSDictionary *)self->_objects count];
}

- (VisionCoreNamedObjects)initWithNamedObjects:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13 = (id *)&v15;
  if (v4)
  {
    do
    {
      id v6 = v13;
      v14 = v13 + 1;
      id v7 = *v6;
      if (!v7) {
        break;
      }
      uint64_t v8 = v7;
      [v5 setObject:v7 forKeyedSubscript:v4];
      CFTypeID v9 = v14;
      v13 = v14 + 1;
      id v10 = *v9;

      id v4 = v10;
    }
    while (v10);
  }
  uint64_t v11 = [(VisionCoreNamedObjects *)self initWithDictionary:v5];

  return v11;
}

- (VisionCoreNamedObjects)init
{
  return [(VisionCoreNamedObjects *)self initWithDictionary:0];
}

- (VisionCoreNamedObjects)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = (id)[v4 copy];
  }
  else
  {
    id v6 = objc_alloc_init(NSDictionary);
  }
  id v7 = [(VisionCoreNamedObjects *)self _initWithRetainedDictionary:v6];

  return v7;
}

- (id)_initWithRetainedDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VisionCoreNamedObjects;
  id v6 = [(VisionCoreNamedObjects *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_objects, a3);
  }

  return v7;
}

- (BOOL)accessReadOnlyDataForNames:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v31 = a3;
  v30 = (uint64_t (**)(id, void *, id *))a4;
  id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
  v35 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v31, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v31;
  uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v7)
  {
    uint64_t v34 = *(void *)v44;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v44 != v34) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void *)(*((void *)&v43 + 1) + 8 * v8);
      id v42 = 0;
      id v10 = [(VisionCoreNamedObjects *)self dataForName:v9 error:&v42];
      id v11 = v42;
      uint64_t v12 = v11;
      if (v10)
      {
        [v35 setObject:v10 forKeyedSubscript:v9];
      }
      else
      {
        id v41 = v11;
        v13 = [(VisionCoreNamedObjects *)self surfaceAssociatedWithName:v9 error:&v41];
        id v14 = v41;

        if (!v13)
        {
          if (a5)
          {
            id v14 = v14;
            *a5 = v14;
          }
          goto LABEL_18;
        }
        uint64_t v15 = IOSurfaceLock(v13, 1u, 0);
        if (v15)
        {
          if (a5)
          {
            id v21 = [NSString alloc];
            long long v22 = [NSNumber numberWithInt:v15];
            long long v23 = (void *)[v21 initWithFormat:@"Could not unlock IOSurfaceRef %p (%@)", v13, v22];

            *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForKernelReturnCode:v15 localizedDescription:v23];
          }
LABEL_18:

          char v20 = 0;
          goto LABEL_19;
        }
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __91__VisionCoreNamedObjects_DataAccessUtilities__accessReadOnlyDataForNames_usingBlock_error___block_invoke;
        v40[3] = &__block_descriptor_40_e5_v8__0l;
        v40[4] = v13;
        uint64_t v12 = (void *)MEMORY[0x230F41C60](v40);
        v16 = (void *)MEMORY[0x230F41C60]();
        [v32 addObject:v16];

        id v17 = objc_alloc(MEMORY[0x263EFF8F8]);
        BaseAddress = IOSurfaceGetBaseAddress(v13);
        v19 = (void *)[v17 initWithBytesNoCopy:BaseAddress length:IOSurfaceGetAllocSize(v13) freeWhenDone:0];
        [v35 setObject:v19 forKeyedSubscript:v9];
      }
      if (v7 == ++v8)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  char v20 = v30[2](v30, v35, a5);
LABEL_19:

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v24 = v32;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v24);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v36 + 1) + 8 * i) + 16))();
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v25);
  }

  return v20;
}

void __91__VisionCoreNamedObjects_DataAccessUtilities__accessReadOnlyDataForNames_usingBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = IOSurfaceUnlock(*(IOSurfaceRef *)(a1 + 32), 1u, 0);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v10 = [NSNumber numberWithInt:v2];
    VisionCoreValidatedLog(4, @"Could not unlock IOSurfaceRef %p (%@)", v4, v5, v6, v7, v8, v9, v3);
  }
}

- (BOOL)accessReadOnlyDataForName:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (uint64_t (**)(id, void *, id *))a4;
  id v10 = [(VisionCoreNamedObjects *)self dataForName:v8 error:0];
  if (v10)
  {
    LOBYTE(a5) = v9[2](v9, v10, a5);
  }
  else
  {
    id v11 = [(VisionCoreNamedObjects *)self surfaceAssociatedWithName:v8 error:0];
    if (v11)
    {
      uint64_t v12 = v11;
      size_t AllocSize = IOSurfaceGetAllocSize(v11);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __90__VisionCoreNamedObjects_DataAccessUtilities__accessReadOnlyDataForName_usingBlock_error___block_invoke;
      v17[3] = &unk_26488B1B8;
      size_t v19 = AllocSize;
      v18 = v9;
      id v14 = (void *)MEMORY[0x230F41C60](v17);
      LOBYTE(a5) = VisionCorePerformWithLockedIOSurface(v12, 1u, v14, a5);
    }
    else if (a5)
    {
      uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"Assigned object with name: %@ is either doesn't exist or                                                                exists but the type is neither NSData nor IOSurface", v8];
      *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:v15];

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

uint64_t __90__VisionCoreNamedObjects_DataAccessUtilities__accessReadOnlyDataForName_usingBlock_error___block_invoke(uint64_t a1, __IOSurface *a2)
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:IOSurfaceGetBaseAddress(a2) length:*(void *)(a1 + 40) freeWhenDone:0];
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v4;
}

@end