@interface CNVCardData
+ (BOOL)isJPEGData:(id)a3;
+ (id)stringFromUTF7Data:(id)a3;
@end

@implementation CNVCardData

+ (BOOL)isJPEGData:(id)a3
{
  id v3 = a3;
  v4 = (unsigned __int8 *)[v3 bytes];
  unint64_t v5 = [v3 length];

  return v5 >= 4 && *v4 == 255 && v4[1] == 216 && v4[2] == 255 && (char)v4[3] < 0;
}

+ (id)stringFromUTF7Data:(id)a3
{
  id v3 = a3;
  __int16 v16 = 0;
  v4 = (char *)[v3 length];
  if (v4)
  {
    unint64_t v5 = (char *)[v3 bytes];
    v6 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v4];
    char v7 = 0;
    v8 = 0;
    while (1)
    {
      int v10 = *v5++;
      int v9 = v10;
      char v15 = v10;
      if ((v7 & 1) == 0) {
        break;
      }
      BOOL v12 = (v9 - 48) >= 0xA && (v9 - 64) >= 0x1Bu && (v9 - 97) >= 0x1Au;
      if (v12 && ((v9 - 43) & 0xFB) != 0)
      {
        v13 = objc_msgSend(v8, "_cn_decodeBase64");
        if (v13)
        {
          [v6 appendData:v13];
          if (v8)
          {

            v8 = 0;
          }
        }
        if (v15 != 45)
        {
          __int16 v16 = v15;
          [v6 appendBytes:&v16 length:2];
        }

        goto LABEL_26;
      }
      if (!v8) {
        goto LABEL_24;
      }
      char v7 = 1;
      [v8 appendBytes:&v15 length:1];
LABEL_27:
      if (!--v4)
      {
        v4 = (char *)[[NSString alloc] initWithData:v6 encoding:10];

        goto LABEL_29;
      }
    }
    if (v9 != 43)
    {
      __int16 v16 = v9;
      [v6 appendBytes:&v16 length:2];
LABEL_26:
      char v7 = 0;
      goto LABEL_27;
    }
    if (!v8)
    {
      v8 = [MEMORY[0x1E4F1CA58] data];
    }
LABEL_24:
    char v7 = 1;
    goto LABEL_27;
  }
LABEL_29:

  return v4;
}

@end