@interface MTKView
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)GenericRGB;
@end

@implementation MTKView

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"delegate");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"objectInfo");
  v30[0] = Mutable;
  v28 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, @"propertyName", @"deviceName");
  CFDictionaryAddValue(v28, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v28, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v28, @"propertyFormat", @"public.plain-text");
  v30[1] = v28;
  v27 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, @"propertyName", @"preferredDeviceName");
  CFDictionaryAddValue(v27, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v27, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v27, @"propertyFormat", @"public.plain-text");
  v30[2] = v27;
  v26 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, @"propertyName", @"colorPixelFormatName");
  CFDictionaryAddValue(v26, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v26, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v26, @"propertyFormat", @"public.plain-text");
  v30[3] = v26;
  v25 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, @"propertyName", @"clearColorAsCGColor");
  CFDictionaryAddValue(v25, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v25, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v25, @"propertyFormat", @"color");
  v30[4] = v25;
  v24 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, @"propertyName", @"depthStencilPixelFormatName");
  CFDictionaryAddValue(v24, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v24, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v24, @"propertyFormat", @"public.plain-text");
  v30[5] = v24;
  v23 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, @"propertyName", @"clearDepth");
  CFDictionaryAddValue(v23, @"propertyRuntimeType", @"double");
  CFDictionaryAddValue(v23, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v23, @"propertyFormat", @"d");
  v30[6] = v23;
  v22 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, @"propertyName", @"clearStencil");
  CFDictionaryAddValue(v22, @"propertyRuntimeType", @"int");
  CFDictionaryAddValue(v22, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v22, @"propertyFormat", @"i");
  v30[7] = v22;
  v21 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, @"propertyName", @"sampleCount");
  CFDictionaryAddValue(v21, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v21, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v21, @"propertyFormat", @"integer");
  v30[8] = v21;
  v20 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, @"propertyName", @"multisampleColorTexture");
  CFDictionaryAddValue(v20, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v20, @"propertyFormat", @"objectInfo");
  v30[9] = v20;
  v19 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, @"propertyName", @"multisampleColorAttachmentTextureUsage");
  CFDictionaryAddValue(v19, @"propertyRuntimeType", @"NSUInteger");
  CFDictionaryAddValue(v19, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v19, @"propertyFormat", @"uinteger");
  v30[10] = v19;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"depthStencilPixelFormatName");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v18, @"propertyFormat", @"public.plain-text");
  v30[11] = v18;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"clearDepth");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"double");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v17, @"propertyFormat", @"d");
  v30[12] = v17;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"clearStencil");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"int");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v16, @"propertyFormat", @"i");
  v30[13] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"depthStencilTexture");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v15, @"propertyFormat", @"objectInfo");
  v30[14] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"depthStencilAttachmentTextureUsage");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"NSUInteger");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v14, @"propertyFormat", @"uinteger");
  v30[15] = v14;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"preferredFramesPerSecond");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"NSUInteger");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v13, @"propertyFormat", @"uinteger");
  v30[16] = v13;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"drawableSize");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v12, @"propertyFormat", @"CGf, CGf");
  v30[17] = v12;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"preferredDrawableSize");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v11, @"propertyFormat", @"CGf, CGf");
  v30[18] = v11;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"autoResizeDrawable");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v2, @"propertyFormat", @"b");
  v30[19] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"framebufferOnly");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v3, @"propertyFormat", @"b");
  v30[20] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"paused");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v4, @"propertyFormat", @"b");
  v30[21] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"enableSetNeedsDisplay");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v5, @"propertyFormat", @"b");
  v30[22] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"maximumDrawableCount");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"NSUInteger");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v6, @"propertyFormat", @"uinteger");
  v30[23] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"presentsWithTransaction");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v7, @"propertyFormat", @"b");
  v30[24] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"allowsNextDrawableTimeout");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v8, @"propertyFormat", @"b");
  v30[25] = v8;
  v9 = +[NSArray arrayWithObjects:v30 count:26];

  return v9;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)GenericRGB
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"deviceName"])
  {
    v10 = [v9 device];
LABEL_5:
    id v11 = v10;
    v12 = [v10 name];
    goto LABEL_6;
  }
  if ([v8 isEqualToString:@"preferredDeviceName"])
  {
    v10 = [v9 preferredDevice];
    goto LABEL_5;
  }
  if ([v8 isEqualToString:@"colorPixelFormatName"])
  {
    [v9 colorPixelFormat];
  }
  else
  {
    if ([v8 isEqualToString:@"clearColorAsCGColor"])
    {
      [v9 clearColor];
      GenericRGB = (id *)CGColorCreateGenericRGB(v14, v15, v16, v17);
      goto LABEL_8;
    }
    if (![v8 isEqualToString:@"depthStencilPixelFormatName"])
    {
      if ([v8 isEqualToString:@"maximumDrawableCount"])
      {
        id v11 = [v9 layer];
        +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 maximumDrawableCount]);
        v12 = (id *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ([v8 isEqualToString:@"presentsWithTransaction"])
        {
          id v11 = [v9 layer];
          id v21 = [v11 presentsWithTransaction];
        }
        else
        {
          if (![v8 isEqualToString:@"allowsNextDrawableTimeout"])
          {
            id v11 = v9;
            id v22 = v8;
            if (![v22 length]) {
              goto LABEL_41;
            }
            NSSelectorFromString((NSString *)v22);
            if (objc_opt_respondsToSelector())
            {
              v23 = (NSString *)v22;
            }
            else
            {
              if ((unint64_t)[v22 length] < 2)
              {
                v27 = [v22 uppercaseString];
              }
              else
              {
                v24 = [v22 substringToIndex:1];
                v25 = [v24 uppercaseString];
                v26 = [v22 substringFromIndex:1];
                v27 = [v25 stringByAppendingString:v26];
              }
              v28 = [@"is" stringByAppendingString:v27];
              NSSelectorFromString(v28);
              v23 = (objc_opt_respondsToSelector() & 1) != 0 ? v28 : 0;
            }
            if (v23)
            {
              GenericRGB = [v11 valueForKey:v23];
            }
            else
            {
LABEL_41:
              if (GenericRGB)
              {
                v29 = (__CFString *)v22;
                if (v11)
                {
                  v30 = +[NSString stringWithFormat:@"%@", v11];
                }
                else
                {
                  v30 = &stru_3C770;
                }
                if (v29) {
                  v31 = v29;
                }
                else {
                  v31 = &stru_3C770;
                }
                v36[0] = @"propertyName";
                v36[1] = @"objectDescription";
                v37[0] = v31;
                v37[1] = v30;
                v36[2] = @"errorDescription";
                v37[2] = &stru_3C770;
                v32 = v31;
                v33 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
                v34 = +[NSError errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v33];

                id v35 = v34;
                *GenericRGB = v35;

                v23 = 0;
                GenericRGB = 0;
              }
              else
              {
                v23 = 0;
              }
            }

            goto LABEL_7;
          }
          id v11 = [v9 layer];
          id v21 = [v11 allowsNextDrawableTimeout];
        }
        v12 = +[NSNumber numberWithBool:v21];
      }
LABEL_6:
      GenericRGB = v12;
LABEL_7:

      goto LABEL_8;
    }
    [v9 depthStencilPixelFormat];
  }
  uint64_t Name = MTLPixelFormatGetName();
  if (Name) {
    v19 = (const char *)Name;
  }
  else {
    v19 = "Invalid";
  }
  GenericRGB = +[NSString stringWithUTF8String:v19];
  if ([GenericRGB hasPrefix:@"MTLPixelFormat"])
  {
    v20 = [GenericRGB substringFromIndex:[@"MTLPixelFormat" length]];

    GenericRGB = v20;
  }
LABEL_8:

  return GenericRGB;
}

@end