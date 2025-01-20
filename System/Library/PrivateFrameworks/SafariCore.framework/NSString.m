@interface NSString
@end

@implementation NSString

id __69__NSString_SafariCoreExtras__safari_stringByRemovingExcessWhitespace__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 stringByTrimmingCharactersInSet:*(void *)(a1 + 32)];

  if ([v4 length]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

void __71__NSString_SafariCoreExtras__safari_containsPeriodOrHomoglyphForPeriod__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".٠۰܁܂․ꓸ꘎．‧。｡"];
  v1 = (void *)-[NSString(SafariCoreExtras) safari_containsPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod;
  -[NSString(SafariCoreExtras) safari_containsPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod = v0;
}

void __78__NSString_SafariCoreExtras__safari_firstLocationOfPeriodOrHomoglyphForPeriod__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".٠۰܁܂․ꓸ꘎．‧。｡"];
  v1 = (void *)-[NSString(SafariCoreExtras) safari_firstLocationOfPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod;
  -[NSString(SafariCoreExtras) safari_firstLocationOfPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod = v0;
}

void __80__NSString_SafariCoreExtras__safari_stringByReplacingHomoglyphForSpaceWithSpace__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  v1 = (void *)-[NSString(SafariCoreExtras) safari_stringByReplacingHomoglyphForSpaceWithSpace]::homoglyphsForSpace;
  -[NSString(SafariCoreExtras) safari_stringByReplacingHomoglyphForSpaceWithSpace]::homoglyphsForSpace = v0;
}

void __105__NSString_SafariCoreExtras__safari_comparableSafariVersionNumberForAnalyticsFromNormalizedVersionString__block_invoke(uint64_t a1, void *a2, __int16 a3)
{
  id v10 = a2;
  v5 = objc_msgSend(MEMORY[0x1E4F28C28], "decimalNumberWithString:");
  id v6 = [v5 decimalNumberByMultiplyingByPowerOf10:(__int16)(-3 * a3)];

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) decimalNumberByAdding:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __107__NSString_SafariCoreExtras___safari_looksLikeWillRedirectToURLStringAfterAuthentication_orHostAfterLogin___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(log.{0,2}(in|on|out))|(sign.{0,2}(in|on|up|out))|account|auth|authentication|federate|setsid" options:1024 error:0];
  v1 = (void *)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern;
  -[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern = v0;

  uint64_t v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"continue|after|next|later|return|sequent|succeed|success|result|resume|sso|then|follow.{0,2}(up|on|ing)|proceed|back.{0,2}(to|in|on)|done" options:1024 error:0];
  id v3 = (void *)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::redirectQueryNamePattern;
  -[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::redirectQueryNamePattern = v2;

  uint64_t v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"accountname|appidkey|certversion|securityupgrade|relaystate|rememberme|samlrequest|sigalg|signature|widgetkey" options:1024 error:0];
  v5 = (void *)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::samlQueryNamePattern;
  -[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::samlQueryNamePattern = v4;
}

void __107__NSString_SafariCoreExtras___safari_looksLikeWillRedirectToURLStringAfterAuthentication_orHostAfterLogin___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  [v7 range];
  if ((double)v6 / (double)(unint64_t)[*(id *)(a1 + 32) length] > 0.8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

BOOL __107__NSString_SafariCoreExtras___safari_looksLikeWillRedirectToURLStringAfterAuthentication_orHostAfterLogin___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 name];
  v5 = [v4 stringByRemovingPercentEncoding];
  unint64_t v6 = [v5 lowercaseString];

  if (v6)
  {
    if (*(unsigned char *)(a1 + 48)
      && objc_msgSend((id)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::samlQueryNamePattern, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")))
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v8 = [v3 value];
      v9 = [v8 stringByRemovingPercentEncoding];
      id v10 = [v9 lowercaseString];

      if (*(void *)(a1 + 32) && (objc_msgSend(v10, "safari_hasPrefix:") & 1) == 0
        || *(void *)(a1 + 40) && !objc_msgSend(v10, "containsString:"))
      {
        BOOL v7 = 0;
      }
      else if (*(unsigned char *)(a1 + 48))
      {
        BOOL v7 = 1;
      }
      else
      {
        BOOL v7 = objc_msgSend((id)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::redirectQueryNamePattern, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __63__NSString_SafariCoreExtras__safari_numberOfComposedCharacters__block_invoke(uint64_t result)
{
  return result;
}

void __62__NSString_SafariCoreExtras__safari_bestURLForUserTypedString__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

@end