@interface VisionCoreE5RTUtils
+ (BOOL)getPixelFormatType:(unsigned int *)a3 forSurfaceFormat:(int)a4 error:(id *)a5;
+ (BOOL)getTensorDataType:(unint64_t *)a3 forTensorDescriptor:(e5rt_tensor_desc *)a4 error:(id *)a5;
+ (BOOL)getType:(unint64_t *)a3 ofIOPort:(e5rt_io_port *)a4 error:(id *)a5;
+ (id)stringsForHandle:(void *)a3 fromCountProc:(void *)a4 stringsProc:(void *)a5 error:(id *)a6;
@end

@implementation VisionCoreE5RTUtils

+ (BOOL)getTensorDataType:(unint64_t *)a3 forTensorDescriptor:(e5rt_tensor_desc *)a4 error:(id *)a5
{
  uint64_t v7 = e5rt_tensor_desc_retain_dtype();
  if (!v7)
  {
    uint64_t component_size = e5rt_tensor_desc_dtype_get_component_size();
    if (component_size)
    {
      if (a5)
      {
LABEL_6:
        [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:component_size];
        BOOL v8 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
        e5rt_tensor_desc_dtype_release();
        return v8;
      }
    }
    else
    {
      uint64_t component_size = e5rt_tensor_desc_dtype_get_component_dtype();
      if (!component_size)
      {
        if (a3) {
          *a3 = 196608;
        }
        BOOL v8 = 1;
        goto LABEL_15;
      }
      if (a5) {
        goto LABEL_6;
      }
    }
    BOOL v8 = 0;
    goto LABEL_15;
  }
  if (!a5) {
    return 0;
  }
  [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v7];
  BOOL v8 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  return v8;
}

+ (BOOL)getType:(unint64_t *)a3 ofIOPort:(e5rt_io_port *)a4 error:(id *)a5
{
  uint64_t is_tensor = e5rt_io_port_is_tensor();
  if (is_tensor)
  {
    if (a5)
    {
LABEL_3:
      uint64_t v7 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:is_tensor];
LABEL_4:
      id v8 = v7;
      BOOL result = 0;
      *a5 = v8;
      return result;
    }
  }
  else
  {
    uint64_t is_tensor = e5rt_io_port_is_surface();
    if (is_tensor)
    {
      if (a5) {
        goto LABEL_3;
      }
    }
    else if (a5)
    {
      uint64_t v7 = [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:@"unsupported I/O port handle type"];
      goto LABEL_4;
    }
  }
  return 0;
}

+ (BOOL)getPixelFormatType:(unsigned int *)a3 forSurfaceFormat:(int)a4 error:(id *)a5
{
  uint64_t v7 = e5rt_surface_format_to_cvpb_4cc();
  if (v7)
  {
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v7];
    }
  }
  else
  {
    *a3 = 0;
  }
  return v7 == 0;
}

+ (id)stringsForHandle:(void *)a3 fromCountProc:(void *)a4 stringsProc:(void *)a5 error:(id *)a6
{
  unint64_t v19 = 0;
  uint64_t v9 = ((uint64_t (*)(void *, unint64_t *))a4)(a3, &v19);
  if (v9)
  {
    if (a6)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v9];
      v10 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263EFF990]);
    id v12 = (id) [v11 initWithLength:8 * v19];
    uint64_t v13 = [v12 mutableBytes];
    uint64_t v14 = ((uint64_t (*)(void *, unint64_t, uint64_t))a5)(a3, v19, v13);
    if (v14)
    {
      if (a6)
      {
        [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v14];
        v10 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x263EFF980]);
      v10 = (void *)[v15 initWithCapacity:v19];
      if (v19)
      {
        for (unint64_t i = 0; i < v19; ++i)
        {
          v17 = (void *)[[NSString alloc] initWithUTF8String:*(void *)(v13 + 8 * i)];
          [v10 addObject:v17];
        }
      }
    }
  }
  return v10;
}

@end