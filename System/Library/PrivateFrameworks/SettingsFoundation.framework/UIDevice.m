@interface UIDevice
@end

@implementation UIDevice

uint64_t __45__UIDevice_SFAdditions__sf_isInternalInstall__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  sf_isInternalInstall___internalInstall = result;
  return result;
}

uint64_t __44__UIDevice_SFAdditions__sf_isCarrierInstall__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  sf_isCarrierInstall___carrierInstall = result;
  return result;
}

uint64_t __55__UIDevice_SFAdditions__sf_isChinaRegionCellularDevice__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  sf_isChinaRegionCellularDevice___greenTea = result;
  return result;
}

void __40__UIDevice_SFAdditions__sf_configString__block_invoke()
{
  CFDataRef v0 = (const __CFData *)MGCopyAnswer();
  if (v0)
  {
    CFDataRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v1);
      size_t Length = CFDataGetLength(v1);
      v5 = malloc_type_malloc(Length + 1, 0x500A7F39uLL);
      bzero(v5, Length + 1);
      memcpy(v5, BytePtr, Length);
      uint64_t v6 = [NSString stringWithUTF8String:v5];
      v7 = (void *)sf_configString___config;
      sf_configString___config = v6;

      free(v5);
    }
  }
}

void __47__UIDevice_SFAdditions__sf_deviceSubTypeString__block_invoke()
{
  CFDataRef v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    id v5 = v0;
    CFDataRef v1 = [v0 objectForKey:@"ArtworkDeviceSubType"];
    uint64_t v2 = [v1 integerValue];

    if (v2 <= 2359)
    {
      if (v2 > 1791)
      {
        switch(v2)
        {
          case 1792:
            v3 = @"Retina6InchFull";
            goto LABEL_33;
          case 2224:
            v3 = @"Retina11Inch";
            goto LABEL_33;
          case 2340:
            v3 = @"3xRetina5.4InchFull";
            goto LABEL_33;
        }
      }
      else
      {
        switch(v2)
        {
          case 568:
            v3 = @"Retina4Inch";
            goto LABEL_33;
          case 569:
            v3 = @"Retina4.7Inch";
            goto LABEL_33;
          case 570:
            v3 = @"3xRetina5.5Inch";
            goto LABEL_33;
        }
      }
    }
    else if (v2 <= 2531)
    {
      switch(v2)
      {
        case 2360:
          v3 = @"Retina10.9InchFull";
          goto LABEL_33;
        case 2388:
          v3 = @"Retina11InchFull";
          goto LABEL_33;
        case 2436:
          v3 = @"3xRetina5.8InchFull";
          goto LABEL_33;
      }
    }
    else if (v2 > 2731)
    {
      if (v2 == 2732)
      {
        v3 = @"Retina12Inch";
        goto LABEL_33;
      }
      if (v2 == 2778)
      {
        v3 = @"3xRetina6.6InchFull";
        goto LABEL_33;
      }
    }
    else
    {
      if (v2 == 2532)
      {
        v3 = @"3xRetina6InchFull";
        goto LABEL_33;
      }
      if (v2 == 2688)
      {
        v3 = @"3xRetina6.5InchFull";
LABEL_33:
        v4 = (void *)sf_deviceSubTypeString_deviceSubTypeString;
        sf_deviceSubTypeString_deviceSubTypeString = (uint64_t)v3;

        CFDataRef v0 = v5;
        goto LABEL_34;
      }
    }
    v3 = &stru_26C60E030;
    goto LABEL_33;
  }
LABEL_34:
}

void __45__UIDevice_SFAdditions__sf_screenClassString__block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = @"main-screen-width";
  v2[1] = @"main-screen-height";
  v2[2] = @"main-screen-scale";
  v2[3] = @"main-screen-pitch";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  uint64_t v0 = MGCopyMultipleAnswers();
  CFDataRef v1 = (void *)sf_screenClassString_screenClass;
  sf_screenClassString_screenClass = v0;
}

uint64_t __38__UIDevice_SFAdditions__sf_regionCode__block_invoke()
{
  sf_regionCode___regionCode = MGGetStringAnswer();
  return MEMORY[0x270F9A758]();
}

void __53__UIDevice_SFAdditions__sf_deviceSupportsDisplayZoom__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  uint64_t v0 = [v3 objectForKeyedSubscript:@"default"];
  CFDataRef v1 = [v3 objectForKeyedSubscript:@"zoomed"];
  BOOL v2 = [v0 count] == 4 && objc_msgSend(v1, "count") == 4;
  sf_deviceSupportsDisplayZoom__supportsDisplayZoom = v2;
}

void __47__UIDevice_SFAdditions__sf_serialNumberQRImage__block_invoke(uint64_t a1)
{
  CFDataRef v1 = objc_msgSend(*(id *)(a1 + 32), "sf_serialNumber");
  BOOL v2 = [v1 dataUsingEncoding:5];
  id v3 = [MEMORY[0x263F00640] QRCodeGenerator];
  [v3 setMessage:v2];
  [v3 setCorrectionLevel:@"H"];
  v4 = [v3 outputImage];
  [v4 extent];
  CGRect v18 = CGRectIntegral(v17);
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  CGFloat v9 = 140.0 / CGRectGetWidth(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v10 = CGRectGetHeight(v19);
  CGAffineTransformMakeScale(&v16, v9, 140.0 / v10);
  v11 = [v4 imageByApplyingTransform:&v16];
  v12 = [MEMORY[0x263F00628] context];
  id v13 = objc_alloc(MEMORY[0x263F1C6B0]);
  [v11 extent];
  uint64_t v14 = objc_msgSend(v13, "initWithCGImage:", objc_msgSend(v12, "createCGImage:fromRect:", v11));
  v15 = (void *)sf_serialNumberQRImage_qrCodeImageByTransform;
  sf_serialNumberQRImage_qrCodeImageByTransform = v14;
}

@end