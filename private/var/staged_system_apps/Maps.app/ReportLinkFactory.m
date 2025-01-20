@interface ReportLinkFactory
- (id)createModelForType:(int64_t)a3;
@end

@implementation ReportLinkFactory

- (id)createModelForType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    id v3 = 0;
  }
  else {
    id v3 = objc_alloc_init(*(&off_101316E20)[a3]);
  }
  v4 = [v3 createReportLink];

  return v4;
}

@end