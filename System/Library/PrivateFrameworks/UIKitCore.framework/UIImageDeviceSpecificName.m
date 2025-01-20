@interface UIImageDeviceSpecificName
@end

@implementation UIImageDeviceSpecificName

void ___UIImageDeviceSpecificName_block_invoke()
{
  v0 = +[UIDevice currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if ((v1 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v2 = 1024.0;
  }
  else {
    double v2 = 480.0;
  }
  v3 = +[UIScreen mainScreen];
  [v3 _referenceBounds];
  double v5 = v4;

  if (v5 <= v2)
  {
    v7 = +[UIDevice currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    double v9 = dbl_186B97880[(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    v10 = +[UIScreen mainScreen];
    [v10 _pointsPerInch];
    double v12 = v11;

    if (v12 <= v9) {
      return;
    }
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"-%.0fr", *(void *)&v12);
  }
  else
  {
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"-%.0fh", *(void *)&v5);
  }
  v13 = (void *)qword_1EB25B158;
  qword_1EB25B158 = v6;
}

@end