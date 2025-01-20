@interface MBGetCachedGestaltValues
@end

@implementation MBGetCachedGestaltValues

uint64_t ___MBGetCachedGestaltValues_block_invoke()
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v0 = MBGetDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD9AE000, v0, OS_LOG_TYPE_DEBUG, "Loading cached MobileGestalt values", buf, 2u);
    _MBLog(@"DEBUG", (uint64_t)"Loading cached MobileGestalt values", v1, v2, v3, v4, v5, v6, v14);
  }
  _MBCachedGestaltValues = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  *(void *)buf = @"DeviceClass";
  v21 = @"UniqueDeviceID";
  v22 = @"SerialNumber";
  v23 = @"ProductType";
  v24 = @"BuildVersion";
  v25 = @"ProductVersion";
  v26 = @"DeviceColor";
  v27 = @"DeviceEnclosureColor";
  v28 = @"9N7qIucqhr0Cy2/Tk27/hw";
  v29 = @"NJsxTSI2WuD+13rxShXX9w";
  v30 = @"CJcvxERO5v/3IWjDFKZKRw";
  v31 = @"HWModelStr";
  v32 = @"marketing-name";
  v33 = @"ReleaseType";
  v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:buf count:14];
  uint64_t result = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        v13 = MBGetGestaltValueForKey();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = (void *)[v13 stringValue];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_13;
          }
        }
        if (v13)
        {
          [(id)_MBCachedGestaltValues setObject:v13 forKeyedSubscript:v12];
          goto LABEL_14;
        }
LABEL_13:
        *(void *)buf = @"DeviceColor";
        v21 = @"DeviceEnclosureColor";
        v22 = @"marketing-name";
        v23 = @"ReleaseType";
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", buf, 4), "containsObject:", v12) & 1) == 0)objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 1, @"Error getting %@ from MobileGestalt", v12)); {
LABEL_14:
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t result = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v9 = result;
    }
    while (result);
  }
  return result;
}

@end