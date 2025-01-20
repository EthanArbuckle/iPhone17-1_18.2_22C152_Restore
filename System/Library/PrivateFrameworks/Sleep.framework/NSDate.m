@interface NSDate
@end

@implementation NSDate

void __42__NSDate_HKSPSleep__hksp_latestFromDates___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(v4, "hksp_isAfterDate:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __44__NSDate_HKSPSleep__hksp_earliestFromDates___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(v4, "hksp_isBeforeDate:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __50__NSDate_HKSPSleep__hksp_closestFromDates_toDate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:");
  double v5 = fabs(v4);
  if (v5 < *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  }
}

@end