@interface NSURL
@end

@implementation NSURL

uint64_t __64__NSURL_ISAdditions___URLQueryParameterValueAllowedCharacterSet__block_invoke()
{
  v0 = [MEMORY[0x263F089C0] URLQueryAllowedCharacterSet];
  uint64_t v1 = [v0 mutableCopy];
  v2 = (void *)_URLQueryParameterValueAllowedCharacterSet_characterSet;
  _URLQueryParameterValueAllowedCharacterSet_characterSet = v1;

  v3 = (void *)_URLQueryParameterValueAllowedCharacterSet_characterSet;

  return [v3 removeCharactersInString:@"?=&+"];
}

@end