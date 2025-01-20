@interface MFSniffer
+ (int)fileType:(id)a3;
@end

@implementation MFSniffer

+ (int)fileType:(id)a3
{
  id v3 = a3;
  v4 = (unsigned __int16 *)[v3 bytes];
  unint64_t v5 = [v3 length];
  int v6 = 2;
  if (v4 && v5 > 3)
  {
    unsigned int v7 = *v4;
    int v8 = *((unsigned __int8 *)v4 + 2);
    int v9 = *((unsigned __int8 *)v4 + 3);
    if (v7 <= 1 && (v8 | (v9 << 8)) == 9)
    {
      int v6 = 0;
    }
    else
    {
      int v11 = (v9 << 24) | (v8 << 16) | v7;
      int v6 = 2 * (v11 != -1698247209);
      if (v5 >= 0x2C && v11 != -1698247209)
      {
        if (*((_DWORD *)v4 + 10) == 1179469088) {
          int v6 = 1;
        }
        else {
          int v6 = 2;
        }
      }
    }
  }

  return v6;
}

@end