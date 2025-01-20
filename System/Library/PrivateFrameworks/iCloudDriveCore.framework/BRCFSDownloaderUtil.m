@interface BRCFSDownloaderUtil
+ (int)downloadKindWithEtagIfLoser:(id)a3 options:(unint64_t)a4;
@end

@implementation BRCFSDownloaderUtil

+ (int)downloadKindWithEtagIfLoser:(id)a3 options:(unint64_t)a4
{
  if ((a4 & 0x20) != 0) {
    int v4 = 3;
  }
  else {
    int v4 = 0;
  }
  if ((a4 & 0x14) != 0) {
    int v5 = 1;
  }
  else {
    int v5 = v4;
  }
  if (a3) {
    return 2;
  }
  else {
    return v5;
  }
}

@end