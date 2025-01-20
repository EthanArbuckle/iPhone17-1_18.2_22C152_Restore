@interface EXReference
+ (BOOL)edAreaReferenceFromXmlReference:(id)a3 areaReference:(EDAreaReference *)a4;
+ (id)edDiscontinousReferencesFromXmlRanges:(id)a3;
+ (id)edReferenceFromXmlReference:(id)a3;
+ (id)numberToStringBase26:(int)a3;
+ (id)xmlRangesFromDiscontinuousReferences:(id)a3;
+ (id)xmlReferenceFromAreaReference:(EDAreaReference *)a3;
+ (id)xmlReferenceFromEDReference:(id)a3;
@end

@implementation EXReference

+ (id)edReferenceFromXmlReference:(id)a3
{
  id v4 = a3;
  if ([a1 edAreaReferenceFromXmlReference:v4 areaReference:v7])
  {
    v5 = +[EDReference referenceWithAreaReference:v7];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)edAreaReferenceFromXmlReference:(id)a3 areaReference:(EDAreaReference *)a4
{
  id v4 = a3;
  if (v4)
  {
    [v4 length];
    operator new[]();
  }

  return 0;
}

+ (id)xmlReferenceFromAreaReference:(EDAreaReference *)a3
{
  if (a3->firstColumn == -1)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(a1, "numberToStringBase26:");
  }
  if (a3->firstRow == -1)
  {
    v7 = 0;
  }
  else
  {
    v6 = [NSNumber numberWithInt:(a3->firstRow + 1)];
    v7 = [v6 stringValue];
  }
  int lastColumn = a3->lastColumn;
  if (lastColumn < 0
    || (int lastRow = a3->lastRow, lastRow < 0)
    || a3->firstColumn == lastColumn && a3->firstRow == lastRow)
  {
    v10 = 0;
LABEL_12:
    v11 = [NSString stringWithFormat:@"%@%@", v5, v7];
    goto LABEL_13;
  }
  v13 = objc_msgSend(a1, "numberToStringBase26:");
  v14 = [NSNumber numberWithInt:(a3->lastRow + 1)];
  v10 = [v14 stringValue];

  if (!v13) {
    goto LABEL_12;
  }
  v11 = [NSString stringWithFormat:@"%@%@:%@%@", v5, v7, v13, v10];

LABEL_13:
  return v11;
}

+ (id)xmlReferenceFromEDReference:(id)a3
{
  id v4 = a3;
  v8[0] = [v4 areaReference];
  v8[1] = v5;
  v6 = [a1 xmlReferenceFromAreaReference:v8];

  return v6;
}

+ (id)edDiscontinousReferencesFromXmlRanges:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [v4 componentsSeparatedByString:@" "];
    for (unsigned int i = 0; [v6 count] > (unint64_t)i; ++i)
    {
      v8 = [v6 objectAtIndex:i];
      char v9 = [a1 edAreaReferenceFromXmlReference:v8 areaReference:v12];

      if (v9)
      {
        v10 = [[EDReference alloc] initWithAreaReference:v12];
        [v5 addObject:v10];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)xmlRangesFromDiscontinuousReferences:(id)a3
{
  id v4 = a3;
  unsigned int v5 = 0;
  for (unsigned int i = &stru_26EBF24D8; ; unsigned int i = (__CFString *)v11)
  {
    unsigned int v7 = v5;
    if ([v4 count] <= (unint64_t)v5) {
      break;
    }
    v8 = [v4 objectAtIndex:v5];
    char v9 = [a1 xmlReferenceFromEDReference:v8];
    v10 = [(__CFString *)i stringByAppendingString:v9];

    uint64_t v11 = [v10 stringByAppendingString:@" "];

    unsigned int v5 = v7 + 1;
  }

  return i;
}

+ (id)numberToStringBase26:(int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  __int16 v15 = 0;
  uint64_t v14 = 0;
  if (a3 < 26)
  {
    LOWORD(v14) = a3 % 26 + 65;
LABEL_9:
    uint64_t v11 = 1;
    goto LABEL_10;
  }
  uint64_t v3 = 0;
  do
  {
    int v4 = a3 / 0x1Au - 1;
    *((_WORD *)&v14 + v3++) = a3 % 0x1Au + 65;
    BOOL v5 = a3 > 0x2BD;
    a3 = v4;
  }
  while (v5);
  v6 = &v14;
  *((_WORD *)&v14 + v3) = v4 % 26 + 65;
  if (!v3) {
    goto LABEL_9;
  }
  unsigned int v7 = v3 + 1;
  v8 = (_WORD *)&v14 + (int)v3;
  uint64_t v9 = v7 >> 1;
  do
  {
    __int16 v10 = *(char *)v6;
    *(_WORD *)v6 = *v8;
    v6 = (uint64_t *)((char *)v6 + 2);
    *v8-- = v10;
    --v9;
  }
  while (v9);
  uint64_t v11 = v7;
LABEL_10:
  v12 = [NSString stringWithCharacters:&v14 length:v11];
  return v12;
}

@end