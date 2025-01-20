@interface NSString(PKAdditions)
+ (id)pk_stringWithBCData:()PKAdditions;
+ (uint64_t)pk_stringWithInteger:()PKAdditions;
- (BOOL)pk_posixStringHasPeriod;
- (id)pk_attributedString;
- (id)pk_capitalizedStringForPreferredLocale;
- (id)pk_decodeHexadecimal;
- (id)pk_decodeURLBase64;
- (id)pk_lowercaseStringForPreferredLocale;
- (id)pk_merchantTokensSanitizedBillingAgreement;
- (id)pk_posixStringWithMinimumDecimalPlaces:()PKAdditions;
- (id)pk_stringIfNotEmpty;
- (id)pk_uppercaseAttributedString;
- (id)pk_uppercaseFirstStringForLocale:()PKAdditions;
- (id)pk_uppercaseFirstStringForPreferredLocale;
- (id)pk_uppercaseStringForPreferredLocale;
- (id)pk_zString;
- (uint64_t)pk_posixStringDecimalPlaces;
- (void)pk_normalizedLevenshteinDistanceFromString:()PKAdditions decimalPlaces:;
@end

@implementation NSString(PKAdditions)

- (id)pk_decodeHexadecimal
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v3 = a1;
  size_t v4 = strlen((const char *)[v3 cStringUsingEncoding:4]);
  __str[2] = 0;
  if (v4 >= 2)
  {
    size_t v5 = v4 >> 1;
    uint64_t v6 = 1;
    do
    {
      __str[0] = [v3 characterAtIndex:v6 - 1];
      __str[1] = [v3 characterAtIndex:v6];
      char v9 = 0;
      char v9 = strtoul(__str, 0, 16);
      [v2 appendBytes:&v9 length:1];
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  v7 = (void *)[v2 copy];

  return v7;
}

- (id)pk_uppercaseStringForPreferredLocale
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "pk_preferredLocale");
  id v3 = [a1 uppercaseStringWithLocale:v2];

  return v3;
}

- (id)pk_zString
{
  v1 = (void *)[NSString _newZStringWithString:a1];
  return v1;
}

- (id)pk_lowercaseStringForPreferredLocale
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "pk_preferredLocale");
  id v3 = [a1 lowercaseStringWithLocale:v2];

  return v3;
}

- (id)pk_capitalizedStringForPreferredLocale
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "pk_preferredLocale");
  id v3 = [a1 capitalizedStringWithLocale:v2];

  return v3;
}

- (id)pk_uppercaseFirstStringForPreferredLocale
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "pk_preferredLocale");
  id v3 = objc_msgSend(a1, "pk_uppercaseFirstStringForLocale:", v2);

  return v3;
}

- (id)pk_uppercaseFirstStringForLocale:()PKAdditions
{
  id v4 = a3;
  if ((unint64_t)[a1 length] < 2)
  {
    v10 = [a1 uppercaseStringWithLocale:v4];
  }
  else
  {
    [a1 rangeOfComposedCharacterSequenceAtIndex:0];
    uint64_t v6 = v5;
    v7 = [a1 substringToIndex:v5];
    v8 = [v7 uppercaseStringWithLocale:v4];
    char v9 = [a1 substringFromIndex:v6];
    v10 = [v8 stringByAppendingString:v9];
  }
  return v10;
}

- (id)pk_uppercaseAttributedString
{
  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v3 = objc_msgSend(a1, "pk_uppercaseStringForPreferredLocale");
  id v4 = (void *)[v2 initWithString:v3];

  return v4;
}

- (id)pk_attributedString
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a1];
  return v1;
}

- (void)pk_normalizedLevenshteinDistanceFromString:()PKAdditions decimalPlaces:
{
  id v6 = a1;
  id v7 = a3;
  v8 = (const char *)[v6 UTF8String];
  id v9 = v7;
  v10 = (const char *)[v9 UTF8String];

  if (v8)
  {
    size_t v11 = strlen(v8);
    if (v10)
    {
LABEL_3:
      size_t v12 = strlen(v10);
      goto LABEL_6;
    }
  }
  else
  {
    size_t v11 = 0;
    if (v10) {
      goto LABEL_3;
    }
  }
  size_t v12 = 0;
LABEL_6:
  if (v11 | v12)
  {
    LevenshteinDistance();
    __exp10((double)a4);
  }
}

- (id)pk_decodeURLBase64
{
  v1 = (void *)[a1 copy];
  id v2 = [v1 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

  id v3 = [v2 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  return v4;
}

+ (uint64_t)pk_stringWithInteger:()PKAdditions
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
}

+ (id)pk_stringWithBCData:()PKAdditions
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v3, "length"));
  id v5 = v3;
  uint64_t v6 = [v5 bytes];
  if ([v5 length])
  {
    unint64_t v7 = 0;
    do
      objc_msgSend(v4, "appendFormat:", @"%.2x", *(unsigned __int8 *)(v6 + v7++));
    while (v7 < [v5 length]);
  }
  v8 = (void *)[v4 copy];

  return v8;
}

- (id)pk_stringIfNotEmpty
{
  if ([a1 length]) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)pk_merchantTokensSanitizedBillingAgreement
{
  id v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v3 = [a1 stringByTrimmingCharactersInSet:v2];

  if ((unint64_t)[v3 length] <= 0x1F4) {
    uint64_t v4 = [v3 length];
  }
  else {
    uint64_t v4 = 500;
  }
  id v5 = [v3 substringToIndex:v4];

  return v5;
}

- (BOOL)pk_posixStringHasPeriod
{
  return [a1 rangeOfString:@"." options:4] != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)pk_posixStringDecimalPlaces
{
  uint64_t v2 = [a1 rangeOfString:@"." options:4];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return [a1 length] - (v2 + v3);
  }
}

- (id)pk_posixStringWithMinimumDecimalPlaces:()PKAdditions
{
  id v4 = a1;
  id v5 = v4;
  if (a3 < 1) {
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "pk_posixStringHasPeriod") & 1) == 0)
  {
    uint64_t v6 = [v5 stringByAppendingString:@"."];

    id v5 = (void *)v6;
  }
  uint64_t v7 = objc_msgSend(v5, "pk_posixStringDecimalPlaces");
  uint64_t v8 = a3 - v7;
  if (a3 <= v7)
  {
LABEL_7:
    id v9 = v5;
  }
  else
  {
    do
    {
      id v9 = [v5 stringByAppendingString:@"0"];

      id v5 = v9;
      --v8;
    }
    while (v8);
  }
  return v9;
}

@end