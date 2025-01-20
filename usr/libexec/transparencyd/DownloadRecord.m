@interface DownloadRecord
+ (id)fetchRequest;
- (BOOL)expired;
- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4;
- (unint64_t)getUnsigned:(SEL)a3;
@end

@implementation DownloadRecord

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"DownloadRecord"];
}

- (BOOL)expired
{
  [(DownloadRecord *)self requestTime];
  return v2 < CFAbsoluteTimeGetCurrent() - (double)kTransparencyMaxmimumDownloadRecordLifetime;
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1002131E4(self, a3);
}

@end