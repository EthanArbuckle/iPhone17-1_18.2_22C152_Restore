@interface NSString(VG)
+ (id)vg_descriptionForFourCharCode:()VG;
@end

@implementation NSString(VG)

+ (id)vg_descriptionForFourCharCode:()VG
{
  if (a3 == 32) {
    int v3 = 1095911234;
  }
  else {
    int v3 = a3;
  }
  v6[0] = HIBYTE(v3);
  v6[1] = BYTE2(v3);
  v6[2] = BYTE1(v3);
  v6[3] = v3;
  v6[4] = 0;
  v4 = [a1 stringWithCString:v6 encoding:1];

  return v4;
}

@end