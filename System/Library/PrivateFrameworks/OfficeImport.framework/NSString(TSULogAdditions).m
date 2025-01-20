@interface NSString(TSULogAdditions)
- (uint64_t)tsu_initRedactedWithFormat:()TSULogAdditions;
- (uint64_t)tsu_initRedactedWithFormat:()TSULogAdditions arguments:;
- (uint64_t)tsu_initUnRedactedWithFormat:()TSULogAdditions;
- (uint64_t)tsu_initUnRedactedWithFormat:()TSULogAdditions arguments:;
@end

@implementation NSString(TSULogAdditions)

- (uint64_t)tsu_initRedactedWithFormat:()TSULogAdditions arguments:
{
  v5 = (void *)[a3 mutableCopy];
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"%s", @"<REDACT %s REDACT>", 0, 0, objc_msgSend(v5, "length"));
  [v5 replaceOccurrencesOfString:@"%@", @"<REDACT %@ REDACT>", 0, 0, objc_msgSend(v5, "length") withString options range];
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"%{public}s", @"%s", 0, 0, objc_msgSend(v5, "length"));
  [v5 replaceOccurrencesOfString:@"%{public}@", @"%@", 0, 0, objc_msgSend(v5, "length") withString options range];
  v6 = (void *)[[NSString alloc] initWithFormat:v5 arguments:a4];
  if (tsu_initRedactedWithFormat_arguments__onceToken != -1) {
    dispatch_once(&tsu_initRedactedWithFormat_arguments__onceToken, &__block_literal_global_262);
  }
  uint64_t v7 = objc_msgSend((id)tsu_initRedactedWithFormat_arguments__redactRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), @"<redacted>");

  return v7;
}

- (uint64_t)tsu_initUnRedactedWithFormat:()TSULogAdditions arguments:
{
  v5 = (void *)[a3 mutableCopy];
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"%{public}", @"%", 0, 0, objc_msgSend(v5, "length"));
  uint64_t v6 = [a1 initWithFormat:v5 arguments:a4];

  return v6;
}

- (uint64_t)tsu_initRedactedWithFormat:()TSULogAdditions
{
  return objc_msgSend(a1, "tsu_initRedactedWithFormat:arguments:", a3, &a9, &a9, &a9);
}

- (uint64_t)tsu_initUnRedactedWithFormat:()TSULogAdditions
{
  return objc_msgSend(a1, "tsu_initUnRedactedWithFormat:arguments:", a3, &a9, &a9, &a9);
}

@end