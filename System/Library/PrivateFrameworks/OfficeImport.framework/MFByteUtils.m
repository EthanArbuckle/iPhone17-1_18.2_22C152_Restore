@interface MFByteUtils
+ (float)readFloat32FromByteArray:(const char *)a3 in_offset:(int)a4;
@end

@implementation MFByteUtils

+ (float)readFloat32FromByteArray:(const char *)a3 in_offset:(int)a4
{
  return *(float *)&a3[a4];
}

@end