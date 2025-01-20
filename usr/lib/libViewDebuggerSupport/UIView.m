@interface UIView
+ (id)fallback_debugHierarchyAdditionalGroupingIDs;
+ (id)fallback_debugHierarchyChildGroupingID;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (BOOL)__dbg_hasAmbiguousLayout;
- (BOOL)__dbg_renderingModeIsMultiLayer;
- (BOOL)__dbg_shouldIgnoreScrollableContentHeightAmbiguity;
- (BOOL)__dbg_shouldIgnoreScrollableContentWidthAmbiguity;
- (BOOL)__dbg_wantsAutoLayout;
- (double)__dbg_firstBaselineOffsetFromTop;
- (double)__dbg_lastBaselineOffsetFromBottom;
- (id)__dbg_constraintsAffectingLayoutForAxis:(int64_t)a3;
- (id)__dbg_formattedDisplayName;
- (id)__dbg_layer;
- (id)__dbg_readableContentGuide;
- (id)__dbg_snapshotImage;
- (id)__dbg_snapshotImageRenderedUsingDrawHierarchyInRect;
- (id)__dbg_viewController;
- (id)__dbg_viewForFirstBaselineLayout;
- (id)__dbg_viewForLastBaselineLayout;
- (unint64_t)__dbg_ambiguityStatusMask;
@end

@implementation UIView

+ (id)fallback_debugHierarchyChildGroupingID
{
  return @"com.apple.UIKit.UIView";
}

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  v4[0] = @"com.apple.UIKit.NSLayoutConstraint";
  v4[1] = @"com.apple.QuartzCore.CALayer";
  v4[2] = @"com.apple.UIKit.UIViewController";
  v4[3] = @"com.apple.UIKit.UILayoutGuide";
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.UIKit.UIView"])
  {
    uint64_t v8 = [v7 subviews];
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_6;
  }
  if ([v6 isEqualToString:@"com.apple.UIKit.NSLayoutConstraint"])
  {
    uint64_t v8 = [v7 constraints];
    goto LABEL_5;
  }
  if ([v6 isEqualToString:@"com.apple.QuartzCore.CALayer"])
  {
    uint64_t v11 = [v7 __dbg_layer];
    v12 = (void *)v11;
    if (!v11)
    {
      v9 = 0;
      goto LABEL_19;
    }
    uint64_t v15 = v11;
    v13 = &v15;
LABEL_15:
    v9 = +[NSArray arrayWithObjects:v13 count:1];
LABEL_19:

    goto LABEL_6;
  }
  if ([v6 isEqualToString:@"com.apple.UIKit.UIViewController"])
  {
    v9 = [v7 __dbg_viewController];

    if (!v9) {
      goto LABEL_6;
    }
    v12 = [v7 __dbg_viewController];
    v14 = v12;
    v13 = (uint64_t *)&v14;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"com.apple.UIKit.UILayoutGuide"])
  {
    uint64_t v8 = [v7 layoutGuides];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"alpha");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf");
  v69[0] = Mutable;
  v65 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v65, @"propertyName", @"accessibilityCustomActions");
  CFDictionaryAddValue(v65, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v65, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v65, @"propertyFormat", @"public.plain-text");
  v69[1] = v65;
  v64 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v64, @"propertyName", @"accessibilityElements");
  CFDictionaryAddValue(v64, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v64, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v64, @"propertyFormat", @"public.plain-text");
  v69[2] = v64;
  v63 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v63, @"propertyName", @"accessibilityElementIsFocused");
  CFDictionaryAddValue(v63, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v63, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v63, @"propertyFormat", @"b");
  v69[3] = v63;
  v62 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v62, @"propertyName", @"accessibilityLabel");
  CFDictionaryAddValue(v62, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v62, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v62, @"propertyFormat", @"public.plain-text");
  v69[4] = v62;
  v61 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v61, @"propertyName", @"accessibilityHint");
  CFDictionaryAddValue(v61, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v61, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v61, @"propertyFormat", @"public.plain-text");
  v69[5] = v61;
  v60 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v60, @"propertyName", @"accessibilityIdentifier");
  CFDictionaryAddValue(v60, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v60, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v60, @"propertyFormat", @"public.plain-text");
  v69[6] = v60;
  v59 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v59, @"propertyName", @"accessibilityValue");
  CFDictionaryAddValue(v59, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v59, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v59, @"propertyFormat", @"public.plain-text");
  v69[7] = v59;
  v58 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v58, @"propertyName", @"autoresizesSubviews");
  CFDictionaryAddValue(v58, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v58, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v58, @"propertyFormat", @"b");
  v69[8] = v58;
  v57 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v57, @"propertyName", @"backgroundColor");
  CFDictionaryAddValue(v57, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v57, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v69[9] = v57;
  v56 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v56, @"propertyName", @"bounds");
  CFDictionaryAddValue(v56, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v56, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v56, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v69[10] = v56;
  v55 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v55, @"propertyName", @"clearsContextBeforeDrawing");
  CFDictionaryAddValue(v55, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v55, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v55, @"propertyFormat", @"b");
  v69[11] = v55;
  v54 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v54, @"propertyName", @"clipsToBounds");
  CFDictionaryAddValue(v54, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v54, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v54, @"propertyFormat", @"b");
  v69[12] = v54;
  v53 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v53, @"propertyName", @"frame");
  CFDictionaryAddValue(v53, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v53, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v53, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v69[13] = v53;
  v52 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v52, @"propertyName", @"hasAmbiguousLayout");
  CFDictionaryAddValue(v52, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v52, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v52, @"propertyFormat", @"b");
  v69[14] = v52;
  v51 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v51, @"propertyName", @"hidden");
  CFDictionaryAddValue(v51, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v51, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v51, @"propertyFormat", @"b");
  v69[15] = v51;
  v50 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v50, @"propertyName", @"isAccessibilityElement");
  CFDictionaryAddValue(v50, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v50, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v50, @"propertyFormat", @"b");
  v69[16] = v50;
  v49 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v49, @"propertyName", @"layer");
  CFDictionaryAddValue(v49, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v49, @"propertyFormat", @"objectInfo");
  v69[17] = v49;
  v48 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v48, @"propertyName", @"layoutMargins");
  CFDictionaryAddValue(v48, @"propertyRuntimeType", @"UIEdgeInsets");
  CFDictionaryAddValue(v48, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeInsets");
  CFDictionaryAddValue(v48, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v69[18] = v48;
  v47 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v47, @"propertyName", @"multipleTouchEnabled");
  CFDictionaryAddValue(v47, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v47, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v47, @"propertyFormat", @"b");
  v69[19] = v47;
  v46 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v46, @"propertyName", @"opaque");
  CFDictionaryAddValue(v46, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v46, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v46, @"propertyFormat", @"b");
  v69[20] = v46;
  v45 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v45, @"propertyName", @"userInteractionEnabled");
  CFDictionaryAddValue(v45, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v45, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v45, @"propertyFormat", @"b");
  v69[21] = v45;
  v44 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v44, @"propertyName", @"tag");
  CFDictionaryAddValue(v44, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v44, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v44, @"propertyFormat", @"integer");
  v69[22] = v44;
  v43 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v43, @"propertyName", @"tintColor");
  CFDictionaryAddValue(v43, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v43, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v69[23] = v43;
  v42 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v42, @"propertyName", @"ambiguityStatusMask");
  CFDictionaryAddValue(v42, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v42, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v42, @"propertyFormat", @"integer");
  v69[24] = v42;
  v41 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v41, @"propertyName", @"autoresizingMask");
  CFDictionaryAddValue(v41, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v41, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v41, @"propertyFormat", @"integer");
  v69[25] = v41;
  v40 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v40, @"propertyName", @"autoresizingMask");
  CFDictionaryAddValue(v40, @"propertyRuntimeType", @"UIViewAutoresizing");
  CFDictionaryAddValue(v40, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v40, @"propertyFormat", @"uinteger");
  v69[26] = v40;
  v39 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v39, @"propertyName", @"contentCompressionResistancePriorityHorizontal");
  CFDictionaryAddValue(v39, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v39, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v39, @"propertyFormat", @"f");
  v69[27] = v39;
  v38 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v38, @"propertyName", @"contentCompressionResistancePriorityVertical");
  CFDictionaryAddValue(v38, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v38, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v38, @"propertyFormat", @"f");
  v69[28] = v38;
  v37 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v37, @"propertyName", @"contentHuggingPriorityHorizontal");
  CFDictionaryAddValue(v37, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v37, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v37, @"propertyFormat", @"f");
  v69[29] = v37;
  v36 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v36, @"propertyName", @"contentHuggingPriorityVertical");
  CFDictionaryAddValue(v36, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v36, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v36, @"propertyFormat", @"f");
  v69[30] = v36;
  v35 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v35, @"propertyName", @"contentMode");
  CFDictionaryAddValue(v35, @"propertyRuntimeType", @"UIViewContentMode");
  CFDictionaryAddValue(v35, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v35, @"propertyFormat", @"integer");
  v69[31] = v35;
  v34 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v34, @"propertyName", @"contentStretch");
  CFDictionaryAddValue(v34, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v34, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v34, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  v69[32] = v34;
  v33 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v33, @"propertyName", @"dbgFormattedDisplayName");
  CFDictionaryAddValue(v33, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v33, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v33, @"propertyFormat", @"public.plain-text");
  v69[33] = v33;
  v32 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v32, @"propertyName", @"dbgInspectedDebugDescription");
  CFDictionaryAddValue(v32, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v32, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v32, @"propertyFormat", @"public.plain-text");
  v69[34] = v32;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"snapshotImage");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  v31 = v2;
  CFDictionaryAddValue(v2, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v2, @"propertyOptions", v3);
  CFRelease(v3);
  v69[35] = v2;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"snapshotImageRenderedUsingDrawHierarchyInRect");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  v30 = v4;
  CFDictionaryAddValue(v4, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, @"propertyOptions", v5);
  CFRelease(v5);
  v69[36] = v4;
  v29 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v29, @"propertyName", @"tintAdjustmentMode");
  CFDictionaryAddValue(v29, @"propertyRuntimeType", @"UIViewTintAdjustmentMode");
  CFDictionaryAddValue(v29, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v29, @"propertyFormat", @"integer");
  v69[37] = v29;
  v28 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, @"propertyName", @"dbgViewForFirstBaselineLayout");
  CFDictionaryAddValue(v28, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v28, @"propertyFormat", @"objectInfo");
  v69[38] = v28;
  v27 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, @"propertyName", @"dbgViewForLastBaselineLayout");
  CFDictionaryAddValue(v27, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v27, @"propertyFormat", @"objectInfo");
  v69[39] = v27;
  v26 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, @"propertyName", @"layerClass");
  CFDictionaryAddValue(v26, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v26, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v26, @"propertyFormat", @"public.plain-text");
  v69[40] = v26;
  v25 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, @"propertyName", @"horizontalAffectingConstraints");
  CFDictionaryAddValue(v25, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v25, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v25, @"propertyFormat", @"public.plain-text");
  v69[41] = v25;
  v24 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, @"propertyName", @"verticalAffectingConstraints");
  CFDictionaryAddValue(v24, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v24, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v24, @"propertyFormat", @"public.plain-text");
  v69[42] = v24;
  v23 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, @"propertyName", @"firstBaselineOffsetFromTop");
  CFDictionaryAddValue(v23, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v23, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v23, @"propertyFormat", @"CGf");
  v69[43] = v23;
  v22 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, @"propertyName", @"lastBaselineOffsetFromBottom");
  CFDictionaryAddValue(v22, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v22, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v22, @"propertyFormat", @"CGf");
  v69[44] = v22;
  v21 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, @"propertyName", @"dbgRenderingModeIsMultiLayer");
  CFDictionaryAddValue(v21, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v21, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v21, @"propertyFormat", @"b");
  v69[45] = v21;
  v20 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, @"propertyName", @"accessibilityTraits");
  CFDictionaryAddValue(v20, @"propertyRuntimeType", @"unsigned long long");
  CFDictionaryAddValue(v20, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v20, @"propertyFormat", @"ull");
  v69[46] = v20;
  v19 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, @"propertyName", @"anchorPoint");
  CFDictionaryAddValue(v19, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v19, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v19, @"propertyFormat", @"CGf, CGf");
  v69[47] = v19;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, @"propertyName", @"anchorPointZ");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v18, @"propertyFormat", @"CGf");
  v69[48] = v18;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, @"propertyName", @"position");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v17, @"propertyFormat", @"CGf, CGf");
  v69[49] = v17;
  id v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"zPosition");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v6, @"propertyFormat", @"CGf");
  v69[50] = v6;
  id v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"traitCollectionVerticalSizeClass");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"UIUserInterfaceSizeClass");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v7, @"propertyFormat", @"integer");
  v69[51] = v7;
  uint64_t v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"traitCollectionHorizontalSizeClass");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"UIUserInterfaceSizeClass");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v8, @"propertyFormat", @"integer");
  v69[52] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"traitCollectionLayoutDirection");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"UITraitEnvironmentLayoutDirection");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v9, @"propertyFormat", @"integer");
  v69[53] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"dbgSubviewHierarchy");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeData");
  CFDictionaryAddValue(v10, @"propertyFormat", @"public.data");
  uint64_t valuePtr = 8;
  CFNumberRef v11 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v10, @"visibility", v11);
  CFRelease(v11);
  v69[54] = v10;
  v12 = +[NSArray arrayWithObjects:v69 count:55];

  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"traitCollectionUserInterfaceStyle");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"UIUserInterfaceStyle");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v13, @"propertyFormat", @"integer");
  v68 = v13;
  v14 = +[NSArray arrayWithObjects:&v68 count:1];

  uint64_t v15 = [v12 arrayByAddingObjectsFromArray:v14];

  return v15;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if ([v9 isEqualToString:@"accessibilityCustomActions"])
  {
    CFNumberRef v11 = [a1 accessibilityCustomActions];
LABEL_5:
    id v12 = v11;
    v13 = [v11 description];
LABEL_6:
    a6 = v13;
LABEL_7:

    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"accessibilityElements"])
  {
    CFNumberRef v11 = [a1 accessibilityElements];
    goto LABEL_5;
  }
  if ([v9 isEqualToString:@"snapshotImage"])
  {
    [v10 __dbg_snapshotImage];
    v14 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_39:
    a6 = v14;
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"snapshotImageRenderedUsingDrawHierarchyInRect"])
  {
    [v10 __dbg_snapshotImageRenderedUsingDrawHierarchyInRect];
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"dbgViewForFirstBaselineLayout"])
  {
    [v10 __dbg_viewForFirstBaselineLayout];
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"dbgViewForLastBaselineLayout"])
  {
    [v10 __dbg_viewForLastBaselineLayout];
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"ambiguityStatusMask"])
  {
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 __dbg_ambiguityStatusMask]);
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"horizontalAffectingConstraints"])
  {
    uint64_t v15 = v10;
    uint64_t v16 = 0;
LABEL_22:
    [v15 __dbg_constraintsAffectingLayoutForAxis:v16];
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"verticalAffectingConstraints"])
  {
    uint64_t v15 = v10;
    uint64_t v16 = 1;
    goto LABEL_22;
  }
  if ([v9 isEqualToString:@"firstBaselineOffsetFromTop"])
  {
    [v10 __dbg_firstBaselineOffsetFromTop];
LABEL_27:
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"lastBaselineOffsetFromBottom"])
  {
    [v10 __dbg_lastBaselineOffsetFromBottom];
    goto LABEL_27;
  }
  if ([v9 isEqualToString:@"contentCompressionResistancePriorityHorizontal"])
  {
    v17 = v10;
    uint64_t v18 = 0;
LABEL_32:
    [v17 contentCompressionResistancePriorityForAxis:v18];
LABEL_38:
    +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"contentCompressionResistancePriorityVertical"])
  {
    v17 = v10;
    uint64_t v18 = 1;
    goto LABEL_32;
  }
  if ([v9 isEqualToString:@"contentHuggingPriorityHorizontal"])
  {
    v19 = v10;
    uint64_t v20 = 0;
LABEL_37:
    [v19 contentHuggingPriorityForAxis:v20];
    goto LABEL_38;
  }
  if ([v9 isEqualToString:@"contentHuggingPriorityVertical"])
  {
    v19 = v10;
    uint64_t v20 = 1;
    goto LABEL_37;
  }
  if ([v9 isEqualToString:@"dbgFormattedDisplayName"])
  {
    [v10 __dbg_formattedDisplayName];
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"dbgInspectedDebugDescription"])
  {
    v14 = [v10 debugDescription];
    goto LABEL_39;
  }
  if ([v9 isEqualToString:@"hasAmbiguousLayout"])
  {
    id v22 = [v10 __dbg_hasAmbiguousLayout];
LABEL_49:
    v14 = +[NSNumber numberWithBool:v22];
    goto LABEL_39;
  }
  if (![v9 isEqualToString:@"layerClass"])
  {
    if ([v9 isEqualToString:@"layer"])
    {
      [v10 __dbg_layer];
      v14 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    }
    if ([v9 isEqualToString:@"dbgSubviewHierarchy"])
    {
      if (objc_opt_respondsToSelector())
      {
        v14 = [v10 makeViewDebugData];
        goto LABEL_39;
      }
      goto LABEL_59;
    }
    if ([v9 isEqualToString:@"dbgRenderingModeIsMultiLayer"])
    {
      id v22 = [v10 __dbg_renderingModeIsMultiLayer];
      goto LABEL_49;
    }
    if ([v9 isEqualToString:@"anchorPoint"])
    {
      id v12 = [v10 layer];
      [v12 anchorPoint];
LABEL_68:
      uint64_t valuePtr = v24;
      v44[0] = v25;
      v26 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
      __CFDictionary *v26 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
      v26[1] = CFNumberCreate(0, kCFNumberCGFloatType, v44);
      a6 = (id *)CFArrayCreate(0, v26, 2, &kCFTypeArrayCallBacks);
      CFRelease(*v26);
      CFRelease(v26[1]);
      free(v26);
      goto LABEL_7;
    }
    if ([v9 isEqualToString:@"anchorPointZ"])
    {
      id v12 = [v10 layer];
      [v12 anchorPointZ];
    }
    else
    {
      if ([v9 isEqualToString:@"position"])
      {
        id v12 = [v10 layer];
        [v12 position];
        goto LABEL_68;
      }
      if (![v9 isEqualToString:@"zPosition"])
      {
        if ([v9 isEqualToString:@"traitCollectionUserInterfaceStyle"])
        {
          id v12 = [v10 traitCollection];
          id v27 = [v12 userInterfaceStyle];
        }
        else if ([v9 isEqualToString:@"traitCollectionVerticalSizeClass"])
        {
          id v12 = [v10 traitCollection];
          id v27 = [v12 verticalSizeClass];
        }
        else if ([v9 isEqualToString:@"traitCollectionHorizontalSizeClass"])
        {
          id v12 = [v10 traitCollection];
          id v27 = [v12 horizontalSizeClass];
        }
        else
        {
          if (![v9 isEqualToString:@"traitCollectionLayoutDirection"])
          {
            id v12 = v10;
            id v28 = v9;
            if (![v28 length]) {
              goto LABEL_93;
            }
            NSSelectorFromString((NSString *)v28);
            if (objc_opt_respondsToSelector())
            {
              v29 = (NSString *)v28;
            }
            else
            {
              if ((unint64_t)[v28 length] < 2)
              {
                v33 = [v28 uppercaseString];
              }
              else
              {
                v30 = [v28 substringToIndex:1];
                v31 = [v30 uppercaseString];
                v32 = [v28 substringFromIndex:1];
                v33 = [v31 stringByAppendingString:v32];
              }
              v34 = [@"is" stringByAppendingString:v33];
              NSSelectorFromString(v34);
              v29 = (objc_opt_respondsToSelector() & 1) != 0 ? v34 : 0;
            }
            if (v29)
            {
              a6 = [v12 valueForKey:v29];
            }
            else
            {
LABEL_93:
              if (a6)
              {
                v35 = (__CFString *)v28;
                if (v12)
                {
                  v36 = +[NSString stringWithFormat:@"%@", v12];
                }
                else
                {
                  v36 = &stru_3C770;
                }
                if (v35) {
                  v37 = v35;
                }
                else {
                  v37 = &stru_3C770;
                }
                v42[0] = @"propertyName";
                v42[1] = @"objectDescription";
                uint64_t valuePtr = v37;
                v44[0] = v36;
                v42[2] = @"errorDescription";
                v44[1] = &stru_3C770;
                v38 = v37;
                v39 = +[NSDictionary dictionaryWithObjects:&valuePtr forKeys:v42 count:3];
                v40 = +[NSError errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v39];

                id v41 = v40;
                *a6 = v41;

                v29 = 0;
                a6 = 0;
              }
              else
              {
                v29 = 0;
              }
            }

            goto LABEL_7;
          }
          id v12 = [v10 traitCollection];
          id v27 = [v12 layoutDirection];
        }
        v13 = +[NSNumber numberWithInteger:v27];
        goto LABEL_6;
      }
      id v12 = [v10 layer];
      [v12 zPosition];
    }
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v23 = (id *)[(id)objc_opt_class() layerClass];
  a6 = v23;
  if (!v23) {
    goto LABEL_40;
  }
  if (object_isClass(v23))
  {
    NSStringFromClass((Class)a6);
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
LABEL_59:
  a6 = 0;
LABEL_40:

  return a6;
}

- (BOOL)__dbg_wantsAutoLayout
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(UIView *)self _wantsAutolayout];
}

- (BOOL)__dbg_hasAmbiguousLayout
{
  if (![(UIView *)self __dbg_wantsAutoLayout]) {
    return 0;
  }
  CFNumberRef v3 = [(UIView *)self _layoutVariablesWithAmbiguousValue];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (unint64_t)__dbg_ambiguityStatusMask
{
  CFNumberRef v3 = [(UIView *)self _layoutVariablesWithAmbiguousValue];
  BOOL v4 = +[NSSet setWithArray:v3];

  CFNumberRef v5 = [(UIView *)self superview];
  if (!v5) {
    goto LABEL_7;
  }
  while ((objc_msgSend(v5, "_uiib_hostsLayoutEngine") & 1) == 0)
  {
    id v6 = [v5 superview];

    CFNumberRef v5 = v6;
    if (!v6) {
      goto LABEL_8;
    }
  }
  if (objc_msgSend(v5, "_uiib_hostsLayoutEngine"))
  {
    id v6 = [v5 _uiib_layoutEngineCreatingIfNecessary];
  }
  else
  {
LABEL_7:
    id v6 = 0;
  }
LABEL_8:
  uint64_t v7 = [(UIView *)self _minXVariable];
  if (v7)
  {
    if ([v4 containsObject:v7]) {
      unint64_t v8 = 2;
    }
    else {
      unint64_t v8 = 0;
    }
    if (v6 && ![v6 hasValue:0 forVariable:v7]) {
      v8 |= 0x400uLL;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  id v9 = [(UIView *)self _minYVariable];
  if (v9)
  {
    if ([v4 containsObject:v9]) {
      v8 |= 4uLL;
    }
    if (v6 && ![v6 hasValue:0 forVariable:v9]) {
      v8 |= 0x800uLL;
    }
  }
  id v10 = [(UIView *)self _boundsWidthVariable];
  if (v10)
  {
    if ([v4 containsObject:v10]) {
      v8 |= 8uLL;
    }
    if (v6 && ![v6 hasValue:0 forVariable:v10]) {
      v8 |= 0x1000uLL;
    }
  }
  CFNumberRef v11 = [(UIView *)self _boundsHeightVariable];
  if (v11)
  {
    if ([v4 containsObject:v11]) {
      v8 |= 0x10uLL;
    }
    if (v6 && ![v6 hasValue:0 forVariable:v11]) {
      v8 |= 0x2000uLL;
    }
  }
  id v12 = [(UIView *)self _contentWidthVariable];
  uint64_t v15 = (void *)v7;
  if (v12)
  {
    if (!-[UIView __dbg_shouldIgnoreScrollableContentWidthAmbiguity](self, "__dbg_shouldIgnoreScrollableContentWidthAmbiguity")&& [v4 containsObject:v12])
    {
      v8 |= 0x20uLL;
    }
    if (v6
      && !-[UIView __dbg_shouldIgnoreScrollableContentWidthAmbiguity](self, "__dbg_shouldIgnoreScrollableContentWidthAmbiguity")&& ![v6 hasValue:0 forVariable:v12])
    {
      v8 |= 0x4000uLL;
    }
  }
  v13 = [(UIView *)self _contentHeightVariable];
  if (v13)
  {
    if (!-[UIView __dbg_shouldIgnoreScrollableContentHeightAmbiguity](self, "__dbg_shouldIgnoreScrollableContentHeightAmbiguity")&& [v4 containsObject:v13])
    {
      v8 |= 0x40uLL;
    }
    if (v6
      && !-[UIView __dbg_shouldIgnoreScrollableContentHeightAmbiguity](self, "__dbg_shouldIgnoreScrollableContentHeightAmbiguity")&& ![v6 hasValue:0 forVariable:v13])
    {
      v8 |= 0x8000uLL;
    }
  }

  return v8;
}

- (BOOL)__dbg_shouldIgnoreScrollableContentWidthAmbiguity
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  CFNumberRef v3 = [(UIView *)self subviews];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (BOOL)__dbg_shouldIgnoreScrollableContentHeightAmbiguity
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  CFNumberRef v3 = [(UIView *)self subviews];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (double)__dbg_firstBaselineOffsetFromTop
{
  v2 = self;
  CFNumberRef v3 = v2;
  if ([(UIView *)v2 __dbg_wantsAutoLayout])
  {
    CFNumberRef v3 = v2;
    if (objc_opt_respondsToSelector())
    {
      CFNumberRef v3 = [(UIView *)v2 viewForFirstBaselineLayout];
    }
  }
  double v4 = 0.0;
  if ([(UIView *)v2 __dbg_wantsAutoLayout] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v3 _firstBaselineOffsetFromTop];
    double v4 = v5;
  }
  [v3 bounds];
  [v3 alignmentRectForFrame:];
  [v3 convertRect:v2 toView:v3];
  double v7 = v6;
  [(UIView *)v2 bounds];
  -[UIView alignmentRectForFrame:](v2, "alignmentRectForFrame:");
  double v9 = v4 + v7 + v8;

  return v9;
}

- (double)__dbg_lastBaselineOffsetFromBottom
{
  v2 = self;
  CFNumberRef v3 = v2;
  if ([(UIView *)v2 __dbg_wantsAutoLayout])
  {
    CFNumberRef v3 = v2;
    if (objc_opt_respondsToSelector())
    {
      CFNumberRef v3 = [(UIView *)v2 viewForLastBaselineLayout];
    }
  }
  double v4 = 0.0;
  if objc_msgSend(v3, "__dbg_wantsAutoLayout") && (objc_opt_respondsToSelector())
  {
    [v3 _baselineOffsetFromBottom];
    double v4 = v5;
  }
  [v3 bounds];
  [v3 alignmentRectForFrame:];
  [v3 convertRect:v2 toView:];
  double v7 = v6;
  double v9 = v8;
  [(UIView *)v2 bounds];
  -[UIView alignmentRectForFrame:](v2, "alignmentRectForFrame:");
  double v12 = v4 + v10 + v11 - (v7 + v9);

  return v12;
}

- (id)__dbg_viewForFirstBaselineLayout
{
  if ([(UIView *)self __dbg_wantsAutoLayout] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFNumberRef v3 = [(UIView *)self viewForFirstBaselineLayout];
  }
  else
  {
    CFNumberRef v3 = 0;
  }

  return v3;
}

- (id)__dbg_viewForLastBaselineLayout
{
  if ([(UIView *)self __dbg_wantsAutoLayout] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFNumberRef v3 = [(UIView *)self viewForLastBaselineLayout];
  }
  else
  {
    CFNumberRef v3 = 0;
  }

  return v3;
}

- (id)__dbg_readableContentGuide
{
  if ([(UIView *)self __dbg_wantsAutoLayout] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    CFNumberRef v3 = [(UIView *)self readableContentGuide];
  }
  else
  {
    CFNumberRef v3 = 0;
  }

  return v3;
}

- (id)__dbg_constraintsAffectingLayoutForAxis:(int64_t)a3
{
  if ([(UIView *)self __dbg_wantsAutoLayout])
  {
    double v5 = [(UIView *)self constraintsAffectingLayoutForAxis:a3];
    if ([v5 count])
    {
      double v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v5;
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            if (*(void *)(*((void *)&v15 + 1) + 8 * i)) {
              double v12 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%p", *(void *)(*((void *)&v15 + 1) + 8 * i));
            }
            else {
              double v12 = 0;
            }
            [v6 addObject:v12];
          }
          id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }

      v13 = [v6 componentsJoinedByString:@", "];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)__dbg_viewController
{
  if (objc_opt_respondsToSelector())
  {
    CFNumberRef v3 = [(UIView *)self _viewDelegate];
  }
  else
  {
    CFNumberRef v3 = 0;
  }

  return v3;
}

- (id)__dbg_formattedDisplayName
{
  CFNumberRef v3 = [(UIView *)self accessibilityLabel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v5 = [(UIView *)self accessibilityLabel];
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass();

    if ((v6 & 1) == 0) {
      goto LABEL_5;
    }
    id v7 = [(UIView *)self accessibilityLabel];
    double v5 = [v7 string];
  }
  if (v5) {
    goto LABEL_18;
  }
LABEL_5:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(UIView *)self currentTitle];
    goto LABEL_18;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(UIView *)self text];
LABEL_13:
    id v9 = (void *)v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v11 = v9;
    }
    else {
      double v11 = 0;
    }
    id v10 = v11;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(UIView *)self date];
    id v10 = [v9 description];
LABEL_17:
    double v5 = v10;

    goto LABEL_18;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(UIView *)self title];
    goto LABEL_13;
  }
  double v5 = 0;
LABEL_18:

  return v5;
}

- (id)__dbg_snapshotImage
{
  [(UIView *)self bounds];
  double v4 = v3;
  [(UIView *)self bounds];
  CurrentContext = 0;
  if (v4 > 0.0 && v5 > 0.0 && v4 * v5 < 16000000.0)
  {
    NSClassFromString(&cfstr_Glkview.isa);
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (NSClassFromString(&cfstr_Skview.isa), (objc_opt_isKindOfClass() & 1) != 0)
      || (NSClassFromString(&cfstr_Scnview.isa), (objc_opt_isKindOfClass() & 1) != 0)
      || (NSClassFromString(&cfstr_RealitykitArvi.isa), (objc_opt_isKindOfClass() & 1) != 0))
    {
      CurrentContext = [(UIView *)self snapshot];
    }
    else
    {
      uint64_t v8 = [(UIView *)self subviews];
      id v9 = [v8 count];
      id v10 = (char *)&v24 - ((4 * (void)v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v9)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          double v12 = [v8 objectAtIndex:i];
          v13 = [v12 layer];
          [v13 opacity];
          *(_DWORD *)&v10[4 * (void)i] = v14;

          long long v15 = [v12 layer];
          [v15 setOpacity:3.18618444e-58];
        }
      }
      [(UIView *)self bounds];
      v26.width = v16;
      v26.height = v17;
      UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      if (CurrentContext)
      {
        long long v18 = [(UIView *)self layer];
        [v18 renderInContext:CurrentContext];

        CurrentContext = UIGraphicsGetImageFromCurrentImageContext();
      }
      UIGraphicsEndImageContext();
      if (v9)
      {
        for (j = 0; j != v9; j = (char *)j + 1)
        {
          uint64_t v20 = [v8 objectAtIndex:j];
          int v21 = *(_DWORD *)&v10[4 * (void)j];
          id v22 = [v20 layer];
          LODWORD(v23) = v21;
          [v22 setOpacity:v23];
        }
      }
    }
  }

  return CurrentContext;
}

- (id)__dbg_snapshotImageRenderedUsingDrawHierarchyInRect
{
  double v3 = [(UIView *)self window];
  if (!v3)
  {
    double v4 = self;
    double v5 = [(UIView *)v4 superview];

    if (v5)
    {
      do
      {
        double v3 = [(UIView *)v4 superview];

        char v6 = [(UIView *)v3 superview];

        double v4 = v3;
      }
      while (v6);
    }
    else
    {
      double v3 = v4;
    }
  }
  [(UIView *)self bounds];
  -[UIView convertRect:fromView:](v3, "convertRect:fromView:", self);
  double x = v7;
  double y = v9;
  double width = v11;
  double height = v13;
  [(UIView *)v3 bounds];
  v97.origin.double x = v15;
  v97.origin.double y = v16;
  v97.size.double width = v17;
  v97.size.double height = v18;
  v91.origin.double x = x;
  v91.origin.double y = y;
  v91.size.double width = width;
  v91.size.double height = height;
  if (CGRectIntersectsRect(v91, v97))
  {
    v19 = +[NSMutableArray array];
    uint64_t v20 = self;
    int v21 = v20;
    if (v3 == v20)
    {
      v37 = v20;
    }
    else
    {
      id v22 = v20;
      do
      {
        double v23 = [(UIView *)v22 superview];
        uint64_t v24 = [(UIView *)v23 subviews];
        uint64_t v25 = (char *)[v24 indexOfObject:v22];

        CGSize v26 = [(UIView *)v23 subviews];
        id v27 = (char *)[v26 count];
        id v28 = v25 + 1;

        if (v27 > v25 + 1)
        {
          while (1)
          {
            v29 = [(UIView *)v23 subviews];
            v30 = (char *)[v29 count];

            if (v28 >= v30) {
              break;
            }
            v31 = [(UIView *)v23 subviews];
            v32 = [v31 objectAtIndexedSubscript:v28];

            [v32 bounds];
            -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v32);
            v98.origin.double x = x;
            v98.origin.double y = y;
            v98.size.double width = width;
            v98.size.double height = height;
            if (CGRectIntersectsRect(v92, v98)) {
              [v19 addObject:v32];
            }

            ++v28;
          }
        }
        if ([(UIView *)v23 clipsToBounds])
        {
          [(UIView *)v23 bounds];
          -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v23);
          v99.origin.double x = v33;
          v99.origin.double y = v34;
          v99.size.double width = v35;
          v99.size.double height = v36;
          v93.origin.double x = x;
          v93.origin.double y = y;
          v93.size.double width = width;
          v93.size.double height = height;
          CGRect v94 = CGRectIntersection(v93, v99);
          double x = v94.origin.x;
          double y = v94.origin.y;
          double width = v94.size.width;
          double height = v94.size.height;
        }

        id v22 = v23;
      }
      while (v23 != v3);
      v37 = v3;
    }
    v95.origin.double x = x;
    v95.origin.double y = y;
    v95.size.double width = width;
    v95.size.double height = height;
    if (CGRectIsNull(v95)
      || (v96.origin.double x = x, v96.origin.y = y, v96.size.width = width, v96.size.height = height, CGRectIsEmpty(v96)))
    {
      v39 = 0;
    }
    else
    {
      v76 = v37;
      v40 = [(UIView *)v21 subviews];
      [v19 addObjectsFromArray:v40];

      id v41 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:0];
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      v77 = v19;
      id v42 = v19;
      id v43 = [v42 countByEnumeratingWithState:&v82 objects:v87 count:16];
      if (v43)
      {
        id v44 = v43;
        uint64_t v45 = *(void *)v83;
        do
        {
          for (i = 0; i != v44; i = (char *)i + 1)
          {
            if (*(void *)v83 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            [v47 alpha];
            v48 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v41 setObject:v48 forKey:v47];

            [v47 setAlpha:0.00000011920929];
          }
          id v44 = [v42 countByEnumeratingWithState:&v82 objects:v87 count:16];
        }
        while (v44);
      }

      [(UIView *)v3 bounds];
      double v50 = v49;
      double v52 = v51;
      v89.double width = width;
      v89.double height = height;
      UIGraphicsBeginImageContextWithOptions(v89, 0, 0.0);
      -[UIView drawViewHierarchyInRect:afterScreenUpdates:](v3, "drawViewHierarchyInRect:afterScreenUpdates:", 1, -x, -y, v50, v52);
      v39 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [(UIView *)v21 bounds];
      if (v54 != width || v53 != height)
      {
        -[UIView convertRect:fromView:](v21, "convertRect:fromView:", v3, x, y, width, height);
        double v56 = v55;
        double v58 = v57;
        double v60 = v59;
        double v62 = v61;
        [(UIView *)v21 bounds];
        v90.double width = v63;
        v90.double height = v64;
        UIGraphicsBeginImageContextWithOptions(v90, 0, 0.0);
        [v39 drawInRect:0 blendMode:v56 alpha:v58];
        uint64_t v65 = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();
        v39 = (void *)v65;
      }
      v37 = v76;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      v66 = [v41 keyEnumerator];
      id v67 = [v66 countByEnumeratingWithState:&v78 objects:v86 count:16];
      if (v67)
      {
        id v68 = v67;
        uint64_t v69 = *(void *)v79;
        do
        {
          for (j = 0; j != v68; j = (char *)j + 1)
          {
            if (*(void *)v79 != v69) {
              objc_enumerationMutation(v66);
            }
            v71 = *(void **)(*((void *)&v78 + 1) + 8 * (void)j);
            v72 = [v41 objectForKey:v71];
            [v72 doubleValue];
            double v74 = v73;

            [v71 setAlpha:v74];
          }
          id v68 = [v66 countByEnumeratingWithState:&v78 objects:v86 count:16];
        }
        while (v68);
      }

      v19 = v77;
    }
    id v38 = v39;
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

- (id)__dbg_layer
{
  if (objc_opt_respondsToSelector()) {
    [(UIView *)self _outermostLayer];
  }
  else {
  double v3 = [(UIView *)self layer];
  }

  return v3;
}

- (BOOL)__dbg_renderingModeIsMultiLayer
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  double v3 = [(UIView *)self _outermostLayer];
  double v4 = [(UIView *)self layer];
  BOOL v5 = v3 != v4;

  return v5;
}

@end