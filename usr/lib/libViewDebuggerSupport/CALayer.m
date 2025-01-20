@interface CALayer
+ (id)fallback_debugHierarchyChildGroupingID;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation CALayer

+ (id)fallback_debugHierarchyChildGroupingID
{
  return @"com.apple.QuartzCore.CALayer";
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.QuartzCore.CALayer"])
  {
    v7 = [v6 sublayers];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"anchorPoint");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf, CGf");
  v94 = Mutable;
  v96[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"anchorPointZ");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v3, @"propertyFormat", @"CGf");
  v93 = v3;
  v96[1] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"backgroundColor");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v4, @"propertyFormat", @"color");
  v92 = v4;
  v96[2] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"borderColor");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v5, @"propertyFormat", @"color");
  v91 = v5;
  v96[3] = v5;
  id v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"borderWidth");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v6, @"propertyFormat", @"CGf");
  v90 = v6;
  v96[4] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"bounds");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v7, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v89 = v7;
  v96[5] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"contentsCenter");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v8, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v88 = v8;
  v96[6] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"contentsGravity");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v9, @"propertyFormat", @"public.plain-text");
  v87 = v9;
  v96[7] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"contentsScale");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v10, @"propertyFormat", @"CGf");
  v86 = v10;
  v96[8] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"contentsRect");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v11, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v85 = v11;
  v96[9] = v11;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"cornerRadius");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v12, @"propertyFormat", @"CGf");
  v84 = v12;
  v96[10] = v12;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"delegate");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v13, @"propertyFormat", @"objectInfo");
  v83 = v13;
  v96[11] = v13;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"doubleSided");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v14, @"propertyFormat", @"b");
  v82 = v14;
  v96[12] = v14;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"frame");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v15, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v81 = v15;
  v96[13] = v15;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"geometryFlipped");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v16, @"propertyFormat", @"b");
  v80 = v16;
  v96[14] = v16;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"hidden");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v17, @"propertyFormat", @"b");
  v79 = v17;
  v96[15] = v17;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"magnificationFilter");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v18, @"propertyFormat", @"public.plain-text");
  v78 = v18;
  v96[16] = v18;
  v19 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, @"propertyName", @"mask");
  CFDictionaryAddValue(v19, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v19, @"propertyFormat", @"objectInfo");
  v76 = v19;
  v96[17] = v19;
  v20 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, @"propertyName", @"masksToBounds");
  CFDictionaryAddValue(v20, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v20, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v20, @"propertyFormat", @"b");
  v75 = v20;
  v96[18] = v20;
  v21 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, @"propertyName", @"minificationFilter");
  CFDictionaryAddValue(v21, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v21, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v21, @"propertyFormat", @"public.plain-text");
  v74 = v21;
  v96[19] = v21;
  v22 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, @"propertyName", @"minificationFilterBias");
  CFDictionaryAddValue(v22, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v22, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v22, @"propertyFormat", @"f");
  v73 = v22;
  v96[20] = v22;
  v23 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, @"propertyName", @"needsDisplayOnBoundsChange");
  CFDictionaryAddValue(v23, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v23, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v23, @"propertyFormat", @"b");
  v72 = v23;
  v96[21] = v23;
  v24 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, @"propertyName", @"name");
  CFDictionaryAddValue(v24, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v24, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v24, @"propertyFormat", @"public.plain-text");
  v71 = v24;
  v96[22] = v24;
  v25 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, @"propertyName", @"opacity");
  CFDictionaryAddValue(v25, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v25, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v25, @"propertyFormat", @"CGf");
  v70 = v25;
  v96[23] = v25;
  v26 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, @"propertyName", @"opaque");
  CFDictionaryAddValue(v26, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v26, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v26, @"propertyFormat", @"b");
  v69 = v26;
  v96[24] = v26;
  v27 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, @"propertyName", @"position");
  CFDictionaryAddValue(v27, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v27, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v27, @"propertyFormat", @"CGf, CGf");
  v68 = v27;
  v96[25] = v27;
  v28 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, @"propertyName", @"shadowColor");
  CFDictionaryAddValue(v28, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v28, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v28, @"propertyFormat", @"color");
  v67 = v28;
  v96[26] = v28;
  v29 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v29, @"propertyName", @"rasterizationScale");
  CFDictionaryAddValue(v29, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v29, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v29, @"propertyFormat", @"CGf");
  v66 = v29;
  v96[27] = v29;
  v30 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v30, @"propertyName", @"shadowOpacity");
  CFDictionaryAddValue(v30, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v30, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v30, @"propertyFormat", @"CGf");
  v65 = v30;
  v96[28] = v30;
  v31 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v31, @"propertyName", @"shadowRadius");
  CFDictionaryAddValue(v31, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v31, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v31, @"propertyFormat", @"CGf");
  v64 = v31;
  v96[29] = v31;
  v32 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v32, @"propertyName", @"shadowOffset");
  CFDictionaryAddValue(v32, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v32, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v32, @"propertyFormat", @"CGf, CGf");
  v63 = v32;
  v96[30] = v32;
  v33 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v33, @"propertyName", @"shouldRasterize");
  CFDictionaryAddValue(v33, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v33, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v33, @"propertyFormat", @"b");
  v62 = v33;
  v96[31] = v33;
  v34 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v34, @"propertyName", @"sublayerTransform");
  CFDictionaryAddValue(v34, @"propertyRuntimeType", @"CATransform3D");
  CFDictionaryAddValue(v34, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeMatrix4");
  CFDictionaryAddValue(v34, @"propertyFormat", @"CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf");
  v61 = v34;
  v96[32] = v34;
  v35 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v35, @"propertyName", @"transform");
  CFDictionaryAddValue(v35, @"propertyRuntimeType", @"CATransform3D");
  CFDictionaryAddValue(v35, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeMatrix4");
  CFDictionaryAddValue(v35, @"propertyFormat", @"CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf");
  v60 = v35;
  v96[33] = v35;
  v36 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v36, @"propertyName", @"zPosition");
  CFDictionaryAddValue(v36, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v36, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v36, @"propertyFormat", @"CGf");
  v59 = v36;
  v96[34] = v36;
  v37 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v37, @"propertyName", @"compositingFilter");
  CFDictionaryAddValue(v37, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v37, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v37, @"propertyFormat", @"public.plain-text");
  v58 = v37;
  v96[35] = v37;
  v38 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v38, @"propertyName", @"contentsDescription");
  CFDictionaryAddValue(v38, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v38, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v38, @"propertyFormat", @"public.plain-text");
  v57 = v38;
  v96[36] = v38;
  v39 = (objc_class *)objc_opt_class();
  if (v39)
  {
    v40 = v39;
    if (object_isClass(v39))
    {
      NSStringFromClass(v40);
      v39 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = 0;
    }
  }
  v41 = v39;
  v42 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v42, @"propertyName", @"encodedPresentationLayer");
  if (v41) {
    CFDictionaryAddValue(v42, @"propertyRuntimeType", v41);
  }
  CFDictionaryAddValue(v42, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeCustom");
  CFDictionaryAddValue(v42, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 8;
  CFNumberRef v43 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v42, @"visibility", v43);
  CFRelease(v43);
  uint64_t valuePtr = 1;
  CFNumberRef v44 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v42, @"propertyOptions", v44);
  CFRelease(v44);
  v56 = v41;

  v96[37] = v42;
  v77 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v77, @"propertyName", @"optimizationOpportunities");
  CFDictionaryAddValue(v77, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeCustom");
  CFDictionaryAddValue(v77, @"propertyFormat", @"custom");
  v96[38] = v77;
  v45 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v45, @"propertyName", @"optimizationOpportunities_includingInternals");
  CFDictionaryAddValue(v45, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeCustom");
  CFDictionaryAddValue(v45, @"propertyFormat", @"custom");
  v96[39] = v45;
  v46 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v46, @"propertyName", @"renderInfoRenderingPasses");
  CFDictionaryAddValue(v46, @"propertyRuntimeType", @"int");
  CFDictionaryAddValue(v46, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v46, @"propertyFormat", @"i");
  uint64_t valuePtr = 4;
  CFNumberRef v47 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v46, @"visibility", v47);
  CFRelease(v47);
  v96[40] = v46;
  v48 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v48, @"propertyName", @"renderInfoOffscreenFlags");
  CFDictionaryAddValue(v48, @"propertyRuntimeType", @"unsigned long");
  CFDictionaryAddValue(v48, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v48, @"propertyFormat", @"ul");
  uint64_t valuePtr = 4;
  CFNumberRef v49 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v48, @"visibility", v49);
  CFRelease(v49);
  v96[41] = v48;
  v50 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v50, @"propertyName", @"renderInfoGroupFlags");
  CFDictionaryAddValue(v50, @"propertyRuntimeType", @"unsigned long");
  CFDictionaryAddValue(v50, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v50, @"propertyFormat", @"ul");
  uint64_t valuePtr = 4;
  CFNumberRef v51 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v50, @"visibility", v51);
  CFRelease(v51);
  v96[42] = v50;
  v52 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v52, @"propertyName", @"dbg_ListID");
  CFDictionaryAddValue(v52, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v52, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v52, @"propertyFormat", @"integer");
  uint64_t valuePtr = 8;
  CFNumberRef v53 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v52, @"visibility", v53);
  CFRelease(v53);
  v96[43] = v52;
  v54 = +[NSArray arrayWithObjects:v96 count:44];

  return v54;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"encodedPresentationLayer"])
  {
    id v10 = [v9 presentationLayer];
    if (v10 || (id v10 = v9) != 0)
    {
      v11 = (id *)CAEncodeLayerTree();
LABEL_10:
      a6 = v11;
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_37;
  }
  if ([v8 isEqualToString:@"compositingFilter"])
  {
    v12 = [v9 compositingFilter];
LABEL_9:
    id v10 = v12;
    v11 = [v12 description];
    goto LABEL_10;
  }
  if ([v8 isEqualToString:@"contentsDescription"])
  {
    v12 = [v9 contents];
    goto LABEL_9;
  }
  if ([v8 isEqualToString:@"renderInfoRenderingPasses"])
  {
    LODWORD(v34) = 0;
    v33 = 0;
    if ([v9 getRendererInfo:&v33 size:12])
    {
      v14 = +[NSNumber numberWithInt:v33];
LABEL_25:
      a6 = v14;
      goto LABEL_12;
    }
LABEL_26:
    a6 = (id *)&off_58028;
    goto LABEL_12;
  }
  if ([v8 isEqualToString:@"renderInfoOffscreenFlags"])
  {
    LODWORD(v34) = 0;
    v33 = 0;
    if (![v9 getRendererInfo:&v33 size:12]) {
      goto LABEL_26;
    }
    uint64_t v15 = HIDWORD(v33);
LABEL_24:
    v14 = +[NSNumber numberWithUnsignedInt:v15];
    goto LABEL_25;
  }
  if ([v8 isEqualToString:@"renderInfoGroupFlags"])
  {
    LODWORD(v34) = 0;
    v33 = 0;
    if (![v9 getRendererInfo:&v33 size:12]) {
      goto LABEL_26;
    }
    uint64_t v15 = v34;
    goto LABEL_24;
  }
  if (![v8 isEqualToString:@"dbg_ListID"])
  {
    if ([v8 isEqualToString:@"optimizationOpportunities"])
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_37;
      }
      v16 = v9;
      uint64_t v17 = 0;
    }
    else
    {
      if (![v8 isEqualToString:@"optimizationOpportunities_includingInternals"])
      {
        id v10 = v9;
        id v18 = v8;
        if (![v18 length]) {
          goto LABEL_50;
        }
        NSSelectorFromString((NSString *)v18);
        if (objc_opt_respondsToSelector())
        {
          v19 = (NSString *)v18;
        }
        else
        {
          if ((unint64_t)[v18 length] < 2)
          {
            v23 = [v18 uppercaseString];
          }
          else
          {
            v20 = [v18 substringToIndex:1];
            v21 = [v20 uppercaseString];
            v22 = [v18 substringFromIndex:1];
            v23 = [v21 stringByAppendingString:v22];
          }
          v24 = [@"is" stringByAppendingString:v23];
          NSSelectorFromString(v24);
          v19 = (objc_opt_respondsToSelector() & 1) != 0 ? v24 : 0;
        }
        if (v19)
        {
          a6 = [v10 valueForKey:v19];
        }
        else
        {
LABEL_50:
          if (a6)
          {
            v25 = (__CFString *)v18;
            if (v10)
            {
              v26 = +[NSString stringWithFormat:@"%@", v10];
            }
            else
            {
              v26 = &stru_3C770;
            }
            if (v25) {
              v27 = v25;
            }
            else {
              v27 = &stru_3C770;
            }
            v32[0] = @"propertyName";
            v32[1] = @"objectDescription";
            v33 = v27;
            v34 = v26;
            v32[2] = @"errorDescription";
            v35 = &stru_3C770;
            v28 = v27;
            v29 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:v32 count:3];
            v30 = +[NSError errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v29];

            id v31 = v30;
            *a6 = v31;

            v19 = 0;
            a6 = 0;
          }
          else
          {
            v19 = 0;
          }
        }

        goto LABEL_11;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_37;
      }
      v16 = v9;
      uint64_t v17 = 1;
    }
    v14 = [v16 optimizationOpportunities:v17];
    goto LABEL_25;
  }
  if (objc_opt_respondsToSelector())
  {
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 swiftUI_displayListID]);
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_37:
  a6 = 0;
LABEL_12:

  return a6;
}

@end