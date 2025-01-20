@interface MKHex
- (id)dataToHex:(id)a3;
- (id)hexToData:(id)a3;
@end

@implementation MKHex

- (id)dataToHex:(id)a3
{
  id v3 = a3;
  size_t v4 = 2 * [v3 length];
  v5 = malloc_type_malloc(v4, 0x5B83F660uLL);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __19__MKHex_dataToHex___block_invoke;
  v8[3] = &__block_descriptor_40_e29_v40__0r_v8__NSRange_QQ_16_B32l;
  v8[4] = v5;
  [v3 enumerateByteRangesUsingBlock:v8];

  v6 = (void *)[[NSString alloc] initWithBytes:v5 length:v4 encoding:4];
  free(v5);
  return v6;
}

uint64_t __19__MKHex_dataToHex___block_invoke(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = 2 * a3;
    do
    {
      unsigned int v5 = *a2++;
      *(unsigned char *)(*(void *)(result + 32) + v4) = dataToHex__intToHexMap[(unint64_t)v5 >> 4];
      *(unsigned char *)(*(void *)(result + 32) + v4 + 1) = dataToHex__intToHexMap[v5 & 0xF];
      v4 += 2;
      --a4;
    }
    while (a4);
  }
  return result;
}

- (id)hexToData:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v12 = 0;
    goto LABEL_17;
  }
  size_t v4 = (unint64_t)[v3 length] >> 1;
  unsigned int v5 = malloc_type_malloc(v4, 0x2233AB8BuLL);
  if (![v3 length])
  {
LABEL_14:
    v12 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:v4];
    goto LABEL_15;
  }
  unint64_t v6 = 0;
  while (1)
  {
    int v7 = [v3 characterAtIndex:v6];
    if ((v7 - 48) >= 0xA) {
      break;
    }
    char v8 = -48;
LABEL_10:
    char v9 = v8 + v7;
    unint64_t v10 = v6 >> 1;
    if (v6) {
      char v11 = v5[v10] | v9;
    }
    else {
      char v11 = 16 * v9;
    }
    v5[v10] = v11;
    if (++v6 >= [v3 length]) {
      goto LABEL_14;
    }
  }
  if ((v7 - 97) < 6)
  {
    char v8 = -87;
    goto LABEL_10;
  }
  if ((v7 - 65) <= 5)
  {
    char v8 = -55;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_15:
  free(v5);
LABEL_17:

  return v12;
}

@end