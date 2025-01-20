@interface UIColor
- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4;
@end

@implementation UIColor

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  v6 = (objc_class *)objc_opt_class();
  if (!v6 || (v7 = v6, !object_isClass(v6)))
  {
    v9 = 0;
    goto LABEL_4;
  }
  v8 = NSStringFromClass(v7);
  v9 = v8;
  if (!v8)
  {
LABEL_4:
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  id v11 = v8;
LABEL_7:
  v12 = v11;

  v45[0] = @"propertyFormat";
  v45[1] = @"propertyRuntimeType";
  v46[0] = @"color";
  v46[1] = v12;
  v13 = &_s10Foundation4DataVN_ptr;
  id v14 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  *a3 = v14;
  v15 = self;
  v16 = [(UIColor *)v15 CGColor];
  if (v16)
  {
    id v44 = v14;
    Mutable = CFDictionaryCreateMutable(0, 20, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    space = CGColorGetColorSpace(v16);
    CFStringRef v42 = CGColorSpaceCopyName(space);
    size_t NumberOfComponents = CGColorGetNumberOfComponents(v16);
    uint64_t v18 = NumberOfComponents << 32;
    CFIndex v19 = (int)NumberOfComponents;
    if (NumberOfComponents << 32)
    {
      v20 = v12;
      v21 = CFStringCreateMutable(0, 0);
      CFIndex v22 = v19 - 1;
      if ((unint64_t)v19 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v19;
      }
      do
      {
        CFStringAppend(v21, @"CGf");
        if (v22) {
          CFStringAppend(v21, @", ");
        }
        --v22;
        --v23;
      }
      while (v23);
      v12 = v20;
      v13 = &_s10Foundation4DataVN_ptr;
    }
    else
    {
      v21 = &stru_3C770;
    }
    Components = CGColorGetComponents(v16);
    v25 = (const void **)malloc_type_malloc(v18 >> 29, 0x6004044C4A2DFuLL);
    if (v18 <= 0)
    {
      CFArrayRef v28 = CFArrayCreate(0, v25, v19, &kCFTypeArrayCallBacks);
    }
    else
    {
      uint64_t v26 = 0;
      if (v19 <= 1) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = v19;
      }
      do
      {
        v25[v26] = CFNumberCreate(0, kCFNumberCGFloatType, &Components[v26]);
        ++v26;
      }
      while (v27 != v26);
      CFArrayRef v28 = CFArrayCreate(0, v25, v19, &kCFTypeArrayCallBacks);
      v29 = v25;
      do
      {
        v30 = *v29++;
        CFRelease(v30);
        --v27;
      }
      while (v27);
    }
    free(v25);
    CGColorSpaceGetModel(space);
    v16 = Mutable;
    id v14 = v44;
    if (v28) {
      CFDictionaryAddValue(Mutable, @"componentValues", v28);
    }
    if (v21) {
      CFDictionaryAddValue(Mutable, @"componentValuesFormat", v21);
    }
    if (v42) {
      CFDictionaryAddValue(Mutable, @"colorSpaceName", v42);
    }
    if (v28) {
      CFRelease(v28);
    }
    if (v42) {
      CFRelease(v42);
    }
    if (v21) {
      CFRelease(v21);
    }
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v31 = [(UIColor *)v15 _debugName];
    if (v31)
    {
    }
    else
    {
      v32 = [(UIColor *)v15 _debugCatalogBundleIdentifier];

      if (!v32) {
        goto LABEL_48;
      }
    }
    v33 = v13;
    id v34 = [(CGColor *)v16 mutableCopy];
    v35 = [(UIColor *)v15 _debugCatalogBundleIdentifier];

    if (v35)
    {
      v36 = [(UIColor *)v15 _debugCatalogBundleIdentifier];
      [v34 setObject:v36 forKeyedSubscript:@"catalogBundleID"];
    }
    v37 = [(UIColor *)v15 _debugName];

    if (v37)
    {
      v38 = [(UIColor *)v15 _debugName];
      [v34 setObject:v38 forKeyedSubscript:@"colorName"];
    }
    uint64_t v39 = [v33[16] dictionaryWithDictionary:v34];

    v16 = (CGColor *)v39;
  }
LABEL_48:

  return v16;
}

@end