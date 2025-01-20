@interface TSTCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
+ (void)tsaxAccessModelForCellAtColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4 tableModel:(id)a5 accessController:(id)a6 usingBlock:(id)a7;
- (BOOL)tsaxBoolValue;
- (BOOL)tsaxHasFormula;
- (BOOL)tsaxHasFormulaError;
- (NSString)tsaxSelectedMultipleChoiceValueDescription;
- (double)tsaxDoubleValue;
@end

@implementation TSTCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (void)tsaxAccessModelForCellAtColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4 tableModel:(id)a5 accessController:(id)a6 usingBlock:(id)a7
{
  id v8 = (id)objc_opt_new();
  TSTCellAtCellIDHoldingReadLock();
  (*((void (**)(id))a7 + 2))(a7);
}

- (BOOL)tsaxBoolValue
{
  char v7 = 0;
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v7);
  if (v7) {
    abort();
  }
  if (v4)
  {
    uint64_t v5 = v4 + OBJC_IVAR___TSTCell_mPrivate;
    if (*(unsigned char *)(v5 + 1))
    {
      if (*(unsigned char *)(v5 + 1) == 6) {
        return *(double *)(v5 + 8) != 0.0;
      }
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL TSTCellBoolValue(TSTCell *)") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/AppleInternal/Library/BuildRoots/8e133d8a-9fa7-11ef-96de-de9f3dcc796f/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/TSFrameworks/TSTables/TSTCell.h") lineNumber:925 description:@"can't get BOOL value from non-BOOL cell: %p" v4];
    }
  }
  return 0;
}

- (double)tsaxDoubleValue
{
  char v9 = 0;
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v9);
  if (v9) {
    abort();
  }
  if (v4)
  {
    uint64_t v5 = v4 + OBJC_IVAR___TSTCell_mPrivate;
    if ((*(_DWORD *)v5 & 0xFB00) == 0x200 || BYTE1(*(_DWORD *)v5) == 7)
    {
      return *(double *)(v5 + 8);
    }
    else
    {
      double v7 = 0.0;
      if (BYTE1(*(_DWORD *)v5)) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "double TSTCellDoubleValue(TSTCell *)") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/AppleInternal/Library/BuildRoots/8e133d8a-9fa7-11ef-96de-de9f3dcc796f/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/TSFrameworks/TSTables/TSTCell.h") lineNumber:897 description:@"can't get value from non-value cell: %p" v4];
      }
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "double TSTCellDoubleValue(TSTCell *)") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/AppleInternal/Library/BuildRoots/8e133d8a-9fa7-11ef-96de-de9f3dcc796f/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/TSFrameworks/TSTables/TSTCell.h") lineNumber:889 description:@"invalid nil value for '%s'", "cell"];
    return 0.0;
  }
  return v7;
}

- (NSString)tsaxSelectedMultipleChoiceValueDescription
{
  return 0;
}

- (BOOL)tsaxHasFormula
{
  return 0;
}

- (BOOL)tsaxHasFormulaError
{
  return 0;
}

@end