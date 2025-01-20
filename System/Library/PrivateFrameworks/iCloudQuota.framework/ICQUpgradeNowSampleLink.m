@interface ICQUpgradeNowSampleLink
@end

@implementation ICQUpgradeNowSampleLink

void ___ICQUpgradeNowSampleLink_block_invoke()
{
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"Upgrade%CStorage%C>", 160, 160);
  uint64_t v0 = +[ICQLink linkWithText:v2 options:2 action:3 parameters:MEMORY[0x1E4F1CC08]];
  v1 = (void *)_ICQUpgradeNowSampleLink_sUpgradeNowSampleLink;
  _ICQUpgradeNowSampleLink_sUpgradeNowSampleLink = v0;
}

@end