@interface NSString(PhotosUI)
- (id)pu_stringByIndentingNewLines;
- (uint64_t)pu_platformAgnosticHash;
@end

@implementation NSString(PhotosUI)

- (uint64_t)pu_platformAgnosticHash
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  uint64_t v3 = v2;
  v4 = v9;
  if (v2 >= 97)
  {
    objc_msgSend(a1, "getCharacters:range:", v9, 0, 32);
    objc_msgSend(a1, "getCharacters:range:", &v10, ((unint64_t)v2 >> 1) - 16, 32);
    objc_msgSend(a1, "getCharacters:range:", &v11, v2 - 32, 32);
    v5 = (unsigned __int16 *)&v12;
    v6 = (unsigned __int16 *)&v12;
LABEL_5:
    v4 = v9;
    do
    {
      uint64_t v3 = 67503105 * v3 + 16974593 * *v4 + 66049 * v4[1] + 257 * v4[2] + v4[3];
      v4 += 4;
    }
    while (v4 < v6);
    goto LABEL_9;
  }
  objc_msgSend(a1, "getCharacters:range:", v9, 0, v2);
  v5 = &v9[v2];
  if ((uint64_t)(v2 & 0xFFFFFFFFFFFFFFFCLL) >= 1)
  {
    v6 = &v9[v2 & 0xFFFFFFFFFFFFFFFCLL];
    goto LABEL_5;
  }
LABEL_9:
  while (v4 < v5)
  {
    unsigned int v7 = *v4++;
    uint64_t v3 = 257 * v3 + v7;
  }
  return (v3 << (v2 & 0x1F)) + v3;
}

- (id)pu_stringByIndentingNewLines
{
  uint64_t v2 = (void *)[a1 mutableCopy];
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\n\t", 2, 0, objc_msgSend(a1, "length"));
  return v2;
}

@end