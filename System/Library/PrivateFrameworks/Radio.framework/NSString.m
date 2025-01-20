@interface NSString
@end

@implementation NSString

void __94__NSString_RadioRequestAdditions__queryStringForRadioRequestParameters_protocolVersion_error___block_invoke()
{
  v0 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v1 = (void *)[v0 mutableCopy];

  [v1 removeCharactersInString:@":/?#[]@!$&'()*+,;="];
  v2 = (void *)queryStringForRadioRequestParameters_protocolVersion_error__sQueryStringAllowedCharacterSet;
  queryStringForRadioRequestParameters_protocolVersion_error__sQueryStringAllowedCharacterSet = (uint64_t)v1;
}

@end