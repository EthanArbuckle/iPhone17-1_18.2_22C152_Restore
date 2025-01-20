@interface MFListUnsubscribeMessageGenerator
@end

@implementation MFListUnsubscribeMessageGenerator

void __58__MFListUnsubscribeMessageGenerator_iOS_senderForCommand___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id obj = a2;
  id v7 = a3;
  if ([v7 isEqual:MEMORY[0x1E4F1CC38]])
  {
    id v8 = obj;
    v9 = [v8 emailAddressValue];
    v10 = [v9 simpleAddress];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v8 stringValue];
    }
    id obj = v12;

    if (![obj caseInsensitiveCompare:*(void *)(a1 + 32)])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
      *a4 = 1;
    }
  }
}

@end