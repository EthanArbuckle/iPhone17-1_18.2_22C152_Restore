@interface WBSSearchProviderShortNameOrderOnMac
@end

@implementation WBSSearchProviderShortNameOrderOnMac

void ___WBSSearchProviderShortNameOrderOnMac_block_invoke()
{
  v2[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Google";
  v2[1] = @"Baidu";
  v2[2] = @"Sogou";
  v2[3] = @"Qihoo";
  v2[4] = @"Yahoo!";
  v2[5] = @"Bing";
  v2[6] = @"DuckDuckGo";
  v2[7] = @"Yandex";
  v2[8] = @"Ecosia";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];
  v1 = (void *)_WBSSearchProviderShortNameOrderOnMac_definitionOrder;
  _WBSSearchProviderShortNameOrderOnMac_definitionOrder = v0;
}

void ___WBSSearchProviderShortNameOrderOnMac_block_invoke_2()
{
  v2[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Google";
  v2[1] = @"Yandex";
  v2[2] = @"Yahoo!";
  v2[3] = @"Bing";
  v2[4] = @"DuckDuckGo";
  v2[5] = @"Baidu";
  v2[6] = @"Sogou";
  v2[7] = @"Qihoo";
  v2[8] = @"Ecosia";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];
  v1 = (void *)_WBSSearchProviderShortNameOrderOnMac_definitionOrder_200;
  _WBSSearchProviderShortNameOrderOnMac_definitionOrder_200 = v0;
}

void ___WBSSearchProviderShortNameOrderOnMac_block_invoke_3()
{
  v2[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Google";
  v2[1] = @"Yahoo!";
  v2[2] = @"Bing";
  v2[3] = @"Baidu";
  v2[4] = @"DuckDuckGo";
  v2[5] = @"Yandex";
  v2[6] = @"Sogou";
  v2[7] = @"Qihoo";
  v2[8] = @"Ecosia";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];
  v1 = (void *)_WBSSearchProviderShortNameOrderOnMac_definitionOrder_204;
  _WBSSearchProviderShortNameOrderOnMac_definitionOrder_204 = v0;
}

@end