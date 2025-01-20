@interface CNVCardActivityAlertEscapingSerializationStrategy
+ (BOOL)strategyWouldAlterString:(id)a3;
+ (id)charactersToTriggerStrategy;
+ (id)regex;
+ (id)serializeString:(id)a3;
@end

@implementation CNVCardActivityAlertEscapingSerializationStrategy

+ (BOOL)strategyWouldAlterString:(id)a3
{
  id v4 = a3;
  v5 = [a1 charactersToTriggerStrategy];
  char v6 = objc_msgSend(v4, "_cn_containsCharacterInSet:", v5);

  return v6;
}

+ (id)charactersToTriggerStrategy
{
  if (charactersToTriggerStrategy_onceToken != -1) {
    dispatch_once(&charactersToTriggerStrategy_onceToken, &__block_literal_global_86);
  }
  v2 = (void *)charactersToTriggerStrategy_sCharSet;
  return v2;
}

uint64_t __80__CNVCardActivityAlertEscapingSerializationStrategy_charactersToTriggerStrategy__block_invoke()
{
  charactersToTriggerStrategy_sCharSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"=,\\\""];
  return MEMORY[0x1F41817F8]();
}

+ (id)serializeString:(id)a3
{
  id v4 = a3;
  v5 = [a1 regex];
  char v6 = objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), @"\\\\$1");

  return v6;
}

+ (id)regex
{
  if (regex_onceToken_92 != -1) {
    dispatch_once(&regex_onceToken_92, &__block_literal_global_94);
  }
  v2 = (void *)regex_sRegEx_91;
  return v2;
}

uint64_t __58__CNVCardActivityAlertEscapingSerializationStrategy_regex__block_invoke()
{
  regex_sRegEx_91 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"([=,\\\\\"])" options:0 error:0];
  return MEMORY[0x1F41817F8]();
}

@end