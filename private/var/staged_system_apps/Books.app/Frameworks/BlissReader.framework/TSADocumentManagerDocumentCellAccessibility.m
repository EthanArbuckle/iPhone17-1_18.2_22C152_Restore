@interface TSADocumentManagerDocumentCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_axShouldOutputTransferProgress;
- (id)_axCurrentTransferProgressState;
- (id)accessibilityValue;
- (unint64_t)_tsaxPendingSyncState;
- (unint64_t)accessibilityTraits;
- (void)_setupBadge;
- (void)_tsaxSetPendingSyncState:(unint64_t)a3;
@end

@implementation TSADocumentManagerDocumentCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADocumentManagerDocumentCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_tsaxPendingSyncState
{
  return (unint64_t)__TSAccessibilityGetAssociatedUnsignedInteger(self, &unk_5739F2);
}

- (void)_tsaxSetPendingSyncState:(unint64_t)a3
{
}

- (BOOL)_axShouldOutputTransferProgress
{
  id v3 = [(TSADocumentManagerDocumentCellAccessibility *)self tsaxValueForKey:@"progressBarView"];
  if (v3)
  {
    LOBYTE(v3) = [(TSADocumentManagerDocumentCellAccessibility *)self tsaxBoolValueForKey:@"isProgressBarShowable"];
  }
  return (char)v3;
}

- (id)_axCurrentTransferProgressState
{
  [self tsaxValueForKey:@"info"] tsaxDoubleValueForKey:@"transferProgress"];
  id result = TSAccessibilityLocalizedString(@"sync.progress.status %@");
  if (result) {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", result, TSAccessibilityLocalizedPercent());
  }
  return result;
}

- (id)accessibilityValue
{
  unint64_t v3 = [(TSADocumentManagerDocumentCellAccessibility *)self _tsaxPendingSyncState];
  if (v3 == 1)
  {
    CFStringRef v4 = @"pending.sync.state.download";
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    CFStringRef v4 = @"pending.sync.state.upload";
LABEL_5:
    return TSAccessibilityLocalizedString((uint64_t)v4);
  }
  if (![(TSADocumentManagerDocumentCellAccessibility *)self _axShouldOutputTransferProgress])return 0; {

  }
  return [(TSADocumentManagerDocumentCellAccessibility *)self _axCurrentTransferProgressState];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TSADocumentManagerDocumentCellAccessibility;
  return UIAccessibilityTraitUpdatesFrequently | [(TSADocumentManagerDocumentCellAccessibility *)&v3 accessibilityTraits];
}

- (void)_setupBadge
{
  v12.receiver = self;
  v12.super_class = (Class)TSADocumentManagerDocumentCellAccessibility;
  [(TSADocumentManagerDocumentCellAccessibility *)&v12 _setupBadge];
  id v3 = objc_msgSend(objc_msgSend(-[TSADocumentManagerDocumentCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"_imageLayer"), "tsaxValueForKey:", @"badge"), "accessibilityIdentifier");
  if ([v3 hasPrefix:@"sf_dm_statusbadge_download"])
  {
    uint64_t v4 = 1;
  }
  else if ([v3 hasPrefix:@"sf_dm_statusbadge_upload"])
  {
    uint64_t v4 = 2;
  }
  else
  {
    int ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
    uint64_t v4 = 0;
    if (v3 && ShouldPerformValidationChecks)
    {
      if (([v3 hasPrefix:@"sf_dm_statusbadge_share"] & 1) == 0)
      {
        int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Unknown badge name for TSADocumentManagerDocumentCell: %@.", v7, v8, v9, v10, v11, (uint64_t)v3))abort(); {
      }
        }
      uint64_t v4 = 0;
    }
  }
  [(TSADocumentManagerDocumentCellAccessibility *)self _tsaxSetPendingSyncState:v4];
}

@end