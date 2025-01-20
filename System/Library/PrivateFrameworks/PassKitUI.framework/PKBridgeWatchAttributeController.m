@interface PKBridgeWatchAttributeController
+ (id)_watchAttributeController;
+ (int64_t)heroWatchSize;
@end

@implementation PKBridgeWatchAttributeController

+ (int64_t)heroWatchSize
{
  v2 = (void *)MEMORY[0x1E4F83B58];
  v3 = [a1 _watchAttributeController];
  int v4 = objc_msgSend(v2, "sizeFromInternalSize:", objc_msgSend(v3, "size"));

  v5 = PKHeroWatchSizeOverride();
  int64_t v6 = [v5 integerValue];

  if ((unint64_t)(v6 - 1) >= 4)
  {
    if ((v4 - 2) <= 2) {
      return (unsigned __int16)(v4 - 2) + 2;
    }
    else {
      return 1;
    }
  }
  return v6;
}

+ (id)_watchAttributeController
{
  v2 = [MEMORY[0x1E4F83B58] sharedDeviceController];
  v3 = PKPairedOrPairingDevice();
  [v2 setDevice:v3];

  return v2;
}

@end