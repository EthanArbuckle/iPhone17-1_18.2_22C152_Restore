@interface CNVCardActivityAlertQuotingSerializationStrategy
+ (BOOL)strategyWouldAlterString:(id)a3;
+ (id)regex;
+ (id)serializeString:(id)a3;
@end

@implementation CNVCardActivityAlertQuotingSerializationStrategy

+ (BOOL)strategyWouldAlterString:(id)a3
{
  return objc_msgSend(a3, "_cn_containsSubstring:", @" ");
}

+ (id)serializeString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 mutableCopy];
  v6 = [a1 regex];
  uint64_t v7 = [v4 length];

  objc_msgSend(v6, "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, v7, @"\\\\$1");
  [v5 insertString:@"\"" atIndex:0];
  [v5 appendString:@"\""];

  return v5;
}

+ (id)regex
{
  if (regex_onceToken != -1) {
    dispatch_once(&regex_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)regex_sRegEx;
  return v2;
}

uint64_t __57__CNVCardActivityAlertQuotingSerializationStrategy_regex__block_invoke()
{
  regex_sRegEx = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"([\"])" options:0 error:0];
  return MEMORY[0x1F41817F8]();
}

@end