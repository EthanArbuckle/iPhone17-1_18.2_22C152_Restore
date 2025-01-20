@interface UIQOSAdjustableDeadlineOffset
@end

@implementation UIQOSAdjustableDeadlineOffset

void ___UIQOSAdjustableDeadlineOffset_block_invoke()
{
  _UIKitPreferencesOnce();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v6 objectForKey:@"QOSAdjustableDeadlineOffset"];
  v1 = v0;
  if (v0)
  {
    [v0 doubleValue];
    double v3 = v2;
    unint64_t v4 = _UIMachDurationForMediaDuration(fabs(v2));
    if (v3 > 0.0) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = -(uint64_t)v4;
    }
    qword_1EB264D90 = v5;
  }
}

@end