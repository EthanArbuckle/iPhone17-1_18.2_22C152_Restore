@interface ContactResolver
@end

@implementation ContactResolver

void ___ContactResolver_block_invoke()
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v0 = +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys];
  v1 = [[PKContactResolver alloc] initWithContactStore:v3 keysToFetch:v0];
  v2 = (void *)qword_1E92D9A48;
  qword_1E92D9A48 = (uint64_t)v1;
}

@end