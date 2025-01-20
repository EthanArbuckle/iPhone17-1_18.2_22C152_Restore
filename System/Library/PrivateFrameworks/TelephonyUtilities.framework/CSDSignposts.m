@interface CSDSignposts
+ (BOOL)shouldTraceSingposts;
+ (void)trace:(unint64_t)a3;
@end

@implementation CSDSignposts

+ (BOOL)shouldTraceSingposts
{
  if (qword_10058C4E0 != -1) {
    dispatch_once(&qword_10058C4E0, &stru_100509540);
  }
  return byte_10058C4D8;
}

+ (void)trace:(unint64_t)a3
{
  __int16 v3 = a3;
  if ([a1 shouldTraceSingposts])
  {
    _kdebug_trace((4 * (v3 & 0x3FFF)) | 0x2B170000u, 0, 0, 0, 0);
  }
}

@end