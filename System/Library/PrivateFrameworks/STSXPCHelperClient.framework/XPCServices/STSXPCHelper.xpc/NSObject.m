@interface NSObject
- (unsigned)objectInstanceID;
@end

@implementation NSObject

- (unsigned)objectInstanceID
{
  if (qword_1000662E0 != -1) {
    dispatch_once(&qword_1000662E0, &stru_100055150);
  }
  return dword_1000662DC;
}

@end