@interface EDTokenTree
+ (BOOL)isTokenAttrASum:(unsigned __int16)a3;
+ (BOOL)isTokenNoOp:(unsigned int)a3 formula:(id)a4;
+ (id)buildSubtree:(unsigned int)a3 formula:(id)a4;
+ (id)buildSubtreeAtIndex:(unsigned int *)a3 formula:(id)a4;
+ (unsigned)childCountForToken:(unsigned int)a3 formula:(id)a4;
@end

@implementation EDTokenTree

+ (id)buildSubtree:(unsigned int)a3 formula:(id)a4
{
  unsigned int v10 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6 && [v6 tokenCount] > a3)
  {
    v8 = [a1 buildSubtreeAtIndex:&v10 formula:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)buildSubtreeAtIndex:(unsigned int *)a3 formula:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 tokenTypeAtIndex:*a3];
  if (v7)
  {
    v8 = +[EDTokenTreeNode tokenTreeNodeWithIndexAndType:*a3 type:v7];
    unsigned int v9 = [a1 childCountForToken:*a3 formula:v6];
    if (v9)
    {
      unsigned int v10 = 0;
      v11 = 0;
      do
      {
        if (!*a3) {
          break;
        }
        --*a3;
        v12 = [a1 buildSubtreeAtIndex:a3 formula:v6];
        if ((objc_msgSend(a1, "isTokenNoOp:formula:", objc_msgSend(v12, "tokenIndex"), v6) & 1) == 0)
        {
          [v8 setFirstChild:v12];
          [v12 setSibling:v11];
          id v13 = v12;

          ++v10;
          v11 = v13;
        }
      }
      while (v10 < v9);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (unsigned)childCountForToken:(unsigned int)a3 formula:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v6 || [v6 tokenCount] <= v4) {
    goto LABEL_11;
  }
  int v8 = categoryForType([v7 tokenTypeAtIndex:v4]);
  unsigned int v9 = 0;
  if (!v8 || v8 == 3) {
    goto LABEL_12;
  }
  int v13 = 0;
  int v10 = [v7 tokenTypeAtIndex:v4];
  if (v10 <= 64)
  {
    unsigned int v9 = 2;
    switch(v10)
    {
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
        goto LABEL_12;
      case 18:
      case 19:
      case 20:
      case 21:
        unsigned int v9 = 1;
        break;
      case 25:
        unsigned int v12 = objc_msgSend(a1, "isTokenAttrASum:", *(unsigned __int16 *)objc_msgSend(v7, "lastExtendedDataForTokenAtIndex:length:", v4, &v13));
        goto LABEL_18;
      case 33:
        goto LABEL_16;
      case 34:
        goto LABEL_15;
      default:
        goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (v10 > 96)
  {
    if (v10 != 97)
    {
      if (v10 != 98) {
        goto LABEL_11;
      }
      goto LABEL_15;
    }
  }
  else if (v10 != 65)
  {
    if (v10 != 66)
    {
LABEL_11:
      unsigned int v9 = 0;
      goto LABEL_12;
    }
LABEL_15:
    unsigned int v9 = *(unsigned __int16 *)[v7 lastExtendedDataForTokenAtIndex:v4 length:&v13];
    goto LABEL_12;
  }
LABEL_16:
  unsigned int v12 = XlArgumentCountForFunction(*(_WORD *)[v7 lastExtendedDataForTokenAtIndex:v4 length:&v13]);
LABEL_18:
  unsigned int v9 = v12;
LABEL_12:

  return v9;
}

+ (BOOL)isTokenNoOp:(unsigned int)a3 formula:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v6 || [v6 tokenCount] <= v4)
  {
    LOBYTE(v9) = 1;
    goto LABEL_10;
  }
  unsigned int v8 = [v7 tokenTypeAtIndex:v4];
  LOBYTE(v9) = 1;
  if (v8 - 70 > 0x32 || ((1 << (v8 - 70)) & 0x4030F0004030FLL) == 0)
  {
    if (v8 > 0x2F) {
      goto LABEL_11;
    }
    if (((1 << v8) & 0xC3C008000004) == 0)
    {
      if (v8 == 25)
      {
        int v11 = 0;
        int v9 = objc_msgSend(a1, "isTokenAttrASum:", *(unsigned __int16 *)objc_msgSend(v7, "lastExtendedDataForTokenAtIndex:length:", v4, &v11)) ^ 1;
        goto LABEL_10;
      }
LABEL_11:
      LOBYTE(v9) = 0;
    }
  }
LABEL_10:

  return v9;
}

+ (BOOL)isTokenAttrASum:(unsigned __int16)a3
{
  return (a3 >> 4) & 1;
}

@end