@interface UIImage(ICQUIAdditions)
+ (id)icqBundleImageNamed:()ICQUIAdditions;
+ (id)imageForTableUIWithType:()ICQUIAdditions;
+ (id)imageWithType:()ICQUIAdditions size:;
@end

@implementation UIImage(ICQUIAdditions)

+ (id)icqBundleImageNamed:()ICQUIAdditions
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [MEMORY[0x263F827E8] imageNamed:v4 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

+ (id)imageForTableUIWithType:()ICQUIAdditions
{
  v3 = (objc_class *)MEMORY[0x263F4B540];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithType:v4];

  v6 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B5A0]];
  v7 = [v5 prepareImageForDescriptor:v6];
  v8 = (void *)MEMORY[0x263F827E8];
  uint64_t v9 = [v7 CGImage];
  [v7 scale];
  v10 = objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v9, 0);

  return v10;
}

+ (id)imageWithType:()ICQUIAdditions size:
{
  v5 = (objc_class *)MEMORY[0x263F4B540];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithType:v6];

  id v8 = objc_alloc(MEMORY[0x263F4B558]);
  uint64_t v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  v11 = objc_msgSend(v8, "initWithSize:scale:", a1, a1, v10 * 3.0);

  v12 = [v7 prepareImageForDescriptor:v11];
  v13 = (void *)MEMORY[0x263F827E8];
  uint64_t v14 = [v12 CGImage];
  [v12 scale];
  v15 = objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v14, 0);

  return v15;
}

@end