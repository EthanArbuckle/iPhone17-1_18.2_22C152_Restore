@interface NSString
@end

@implementation NSString

void __64__NSString_SafariSharedExtras__safari_bestURLForUserTypedString__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void __54__NSString_SafariSharedExtras__safari_bestLanguageTag__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v9 = a2;
  v10 = v9;
  if (v9)
  {
    id v13 = v9;
    char v11 = [v9 isEqualToString:@"und"];
    v10 = v13;
    if ((v11 & 1) == 0)
    {
      [*(id *)(a1 + 32) addObject:v13];
      unint64_t v12 = [*(id *)(a1 + 32) countForObject:v13];
      v10 = v13;
      if (v12 >= 0x64) {
        *a7 = 1;
      }
    }
  }
}

void __54__NSString_SafariSharedExtras__safari_bestLanguageTag__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "countForObject:");
  if (v4 > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  }
}

void __60__NSString_SafariSharedExtras__safari_urlHashesOfComponents__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  -[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::salt = [v0 integerForKey:@"safari_urlHashesOfComponents_salt"];

  if (!-[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::salt)
  {
    -[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::salt = arc4random();
    id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v1 setInteger:-[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::salt forKey:@"safari_urlHashesOfComponents_salt"];
  }
}

__CFString *__60__NSString_SafariSharedExtras__safari_urlHashesOfComponents__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 length])
  {
    v3 = NSString;
    char v4 = [v2 hash];
    objc_msgSend(v3, "stringWithFormat:", @"%.2X", (-[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::salt + v4));
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"00";
  }

  return v5;
}

id __52__NSString_SafariSharedExtras__safari_containedURLs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ((unint64_t)(WBSUnifiedFieldInputTypeForString(v2) - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __80__NSString_SafariSharedExtras__safari_stringByRedactingStrings_withReplacement___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a2, a3, *(void *)(a1 + 40));
}

uint64_t __48__NSString_SafariSharedExtras__safari_wordCount__block_invoke(uint64_t result)
{
  return result;
}

void __60__NSString_ParsecExtras__safari_normalizedParsecInputString__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([a2 characterIsMember:*(unsigned __int16 *)(a1 + 48)])
  {
    [*(id *)(a1 + 32) appendString:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end