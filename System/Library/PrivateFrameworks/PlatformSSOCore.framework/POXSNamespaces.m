@interface POXSNamespaces
+ (id)prefixForNamespaceURI:(id)a3;
@end

@implementation POXSNamespaces

+ (id)prefixForNamespaceURI:(id)a3
{
  uint64_t v3 = prefixForNamespaceURI__predicate;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&prefixForNamespaceURI__predicate, &__block_literal_global_12);
  }
  v5 = [(id)prefixForNamespaceURI__namespaces objectForKeyedSubscript:v4];

  return v5;
}

void __40__POXSNamespaces_prefixForNamespaceURI___block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = @"http://www.w3.org/2003/05/soap-envelope";
  v2[1] = @"http://www.w3.org/2005/08/addressing";
  v3[0] = @"s";
  v3[1] = @"a";
  v2[2] = @"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd";
  v2[3] = @"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd";
  v3[2] = @"u";
  v3[3] = @"o";
  v2[4] = @"http://docs.oasis-open.org/ws-sx/ws-trust/200512";
  v2[5] = @"http://schemas.xmlsoap.org/ws/2005/02/trust";
  v3[4] = @"trust";
  v3[5] = @"trust";
  v2[6] = @"http://schemas.xmlsoap.org/ws/2004/09/policy";
  v3[6] = @"wsp";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)prefixForNamespaceURI__namespaces;
  prefixForNamespaceURI__namespaces = v0;
}

@end