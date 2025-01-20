@interface PLPlatform
+ (BOOL)carrierBuild;
+ (BOOL)hasANE;
+ (BOOL)hasAOD;
+ (BOOL)hasAOT;
+ (BOOL)hasBaseband;
+ (BOOL)hasCapability:(int)a3;
+ (BOOL)hasDCP;
+ (BOOL)hasGenerativeModelSystems;
+ (BOOL)hasLPEM;
+ (BOOL)hasNFC;
+ (BOOL)hasOLED;
+ (BOOL)hasOrb;
+ (BOOL)hasSleepMedia;
+ (BOOL)internalBuild;
+ (BOOL)is64Bit;
+ (BOOL)isARMMac;
+ (BOOL)isAppleTV;
+ (BOOL)isAppleVision;
+ (BOOL)isArchARM;
+ (BOOL)isAudioClass:(int)a3;
+ (BOOL)isBasebandClass:(int)a3;
+ (BOOL)isBasebandDSDS;
+ (BOOL)isBasebandIBIS;
+ (BOOL)isBasebandIce;
+ (BOOL)isBasebandMav;
+ (BOOL)isBasebandMavLeg;
+ (BOOL)isBasebandProto;
+ (BOOL)isCameraClass:(int)a3;
+ (BOOL)isDeviceClass:(int)a3;
+ (BOOL)isDeviceClassName:(id)a3;
+ (BOOL)isDisplayClass:(int)a3;
+ (BOOL)isGPSClass:(int)a3;
+ (BOOL)isHomePod;
+ (BOOL)isMac;
+ (BOOL)isSoCClass:(int)a3;
+ (BOOL)isTVOS;
+ (BOOL)isTorchClass:(int)a3;
+ (BOOL)isVirtualDevice;
+ (BOOL)isWatch;
+ (BOOL)isWiFiClass:(int)a3;
+ (BOOL)isiOS;
+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (BOOL)isiPod;
+ (BOOL)kPLAudioClassIsOneOf:(int)a3;
+ (BOOL)kPLBasebandClassIsOneOf:(int)a3;
+ (BOOL)kPLCameraClassIsOneOf:(int)a3;
+ (BOOL)kPLDeviceClassIsOneOf:(int)a3;
+ (BOOL)kPLDisplayClassIsOneOf:(int)a3;
+ (BOOL)kPLGPSClassIsOneOf:(int)a3;
+ (BOOL)kPLSoCClassIsOneOf:(int)a3;
+ (BOOL)kPLTorchClassIsOneOf:(int)a3;
+ (BOOL)kPLWiFiClassIsOneOf:(int)a3;
+ (BOOL)kPLXIsOneOf:(int)a3 firstArg:(int)a4 restOfArgs:(char *)a5;
+ (BOOL)nonUIBuild;
+ (BOOL)seedBuild;
+ (id)kPLDeviceClassName;
+ (id)kPLDeviceMap;
+ (id)kPLPlatformAttributes;
+ (id)wrapDeviceArgumentsInArray:(int)a3;
+ (int)kPLAudioClassOfDevice;
+ (int)kPLBasebandClassOfDevice;
+ (int)kPLCameraClassOfDevice;
+ (int)kPLDeviceClass;
+ (int)kPLDisplayClassOfDevice;
+ (int)kPLGPSClassOfDevice;
+ (int)kPLSoCClassOfDevice;
+ (int)kPLTorchClassOfDevice;
+ (int)kPLWiFiClassOfDevice;
@end

@implementation PLPlatform

+ (BOOL)internalBuild
{
  if (internalBuild_onceToken != -1) {
    dispatch_once(&internalBuild_onceToken, &__block_literal_global_548);
  }
  return internalBuild_result != 0;
}

+ (BOOL)isiOS
{
  if (isiOS_onceToken != -1) {
    dispatch_once(&isiOS_onceToken, &__block_literal_global_542);
  }
  return isiOS_isiOS;
}

+ (BOOL)hasAOD
{
  if (hasAOD_onceToken != -1) {
    dispatch_once(&hasAOD_onceToken, &__block_literal_global_511);
  }
  return hasAOD_result;
}

+ (BOOL)isiPod
{
  if (isiPod_onceToken != -1) {
    dispatch_once(&isiPod_onceToken, &__block_literal_global_536);
  }
  return isiPod_isiPod;
}

+ (int)kPLBasebandClassOfDevice
{
  v2 = [a1 kPLPlatformAttributes];
  v3 = [v2 objectAtIndexedSubscript:5];
  int v4 = [v3 intValue];

  return v4;
}

+ (int)kPLAudioClassOfDevice
{
  v2 = [a1 kPLPlatformAttributes];
  v3 = [v2 objectAtIndexedSubscript:7];
  int v4 = [v3 intValue];

  return v4;
}

+ (int)kPLSoCClassOfDevice
{
  v2 = [a1 kPLPlatformAttributes];
  v3 = [v2 objectAtIndexedSubscript:3];
  int v4 = [v3 intValue];

  return v4;
}

+ (BOOL)hasCapability:(int)a3
{
  if (a3 == 9) {
    return 0;
  }
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  int v7 = +[PLPlatform kPLDeviceClass];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PLPlatform_hasCapability___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v9 = v7;
  if (hasCapability__onceToken != -1) {
    dispatch_once(&hasCapability__onceToken, block);
  }
  return hasCapability__capabilitiesBeenSet == 1 && hasCapability__blockWrapper[a3] != 0;
}

+ (BOOL)isWiFiClass:(int)a3
{
  return [a1 kPLWiFiClassOfDevice] == a3;
}

+ (int)kPLWiFiClassOfDevice
{
  v2 = [a1 kPLPlatformAttributes];
  uint64_t v3 = [v2 objectAtIndexedSubscript:6];
  int v4 = [v3 intValue];

  return v4;
}

+ (int)kPLDeviceClass
{
  v2 = [a1 kPLPlatformAttributes];
  uint64_t v3 = [v2 objectAtIndexedSubscript:2];
  int v4 = [v3 intValue];

  return v4;
}

+ (BOOL)kPLDeviceClassIsOneOf:(int)a3
{
  return [a1 kPLXIsOneOf:2 firstArg:*(void *)&a3 restOfArgs:&v4];
}

+ (BOOL)kPLXIsOneOf:(int)a3 firstArg:(int)a4 restOfArgs:(char *)a5
{
  int v7 = [a1 kPLPlatformAttributes];
  v8 = [v7 objectAtIndexedSubscript:a3];
  int v9 = [v8 intValue];

  BOOL result = 0;
  if (a4 && v9 != -1)
  {
    do
    {
      BOOL result = a4 == v9;
      if (a4 == v9) {
        break;
      }
      uint64_t v11 = (int *)a5;
      a5 += 8;
      a4 = *v11;
    }
    while (*v11);
  }
  return result;
}

+ (id)kPLPlatformAttributes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PLPlatform_kPLPlatformAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (kPLPlatformAttributes_onceToken != -1) {
    dispatch_once(&kPLPlatformAttributes_onceToken, block);
  }
  v2 = (void *)kPLPlatformAttributes_deviceInfo;
  return v2;
}

+ (BOOL)isHomePod
{
  return 0;
}

+ (BOOL)isBasebandMav
{
  if (isBasebandMav_onceToken != -1) {
    dispatch_once(&isBasebandMav_onceToken, &__block_literal_global_566);
  }
  return isBasebandMav_result;
}

+ (BOOL)isiPhone
{
  if (isiPhone_onceToken != -1) {
    dispatch_once(&isiPhone_onceToken, &__block_literal_global_540);
  }
  return isiPhone_isiPhone;
}

+ (BOOL)isBasebandDSDS
{
  if (isBasebandDSDS_onceToken != -1) {
    dispatch_once(&isBasebandDSDS_onceToken, &__block_literal_global_568);
  }
  return isBasebandDSDS_result;
}

+ (id)kPLDeviceMap
{
  v1038[130] = *MEMORY[0x1E4F143B8];
  int v1036 = 1602014129;
  long long v1035 = xmmword_1BBE120B0;
  v632 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1037[0] = v632;
  v1037[1] = @"J71";
  v631 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1037 count:2];
  v630 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100004, 1001003, 1002002, 0xFFFFFFFFLL, 1004003, 1005010, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v629 = [v631 arrayByAddingObjectsFromArray:v630];
  v628 = (void *)[v629 copy];
  v1038[0] = v628;
  int v1033 = -810116762;
  long long v1032 = xmmword_1BBE120C4;
  v627 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1034[0] = v627;
  v1034[1] = @"J72";
  v626 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1034 count:2];
  v625 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100005, 1001003, 1002002, 1003002, 1004003, 1005010, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v624 = [v626 arrayByAddingObjectsFromArray:v625];
  v623 = (void *)[v624 copy];
  v1038[1] = v623;
  int v1030 = -1195351767;
  long long v1029 = xmmword_1BBE120D8;
  v622 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1031[0] = v622;
  v1031[1] = @"J73";
  v621 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1031 count:2];
  v620 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100006, 1001003, 1002002, 1003002, 1004003, 1005010, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v619 = [v621 arrayByAddingObjectsFromArray:v620];
  v618 = (void *)[v619 copy];
  v1038[2] = v618;
  int v1027 = -1639077591;
  long long v1026 = xmmword_1BBE120EC;
  v617 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1028[0] = v617;
  v1028[1] = @"J81";
  v616 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1028 count:2];
  v615 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100007, 1001005, 1002003, 0xFFFFFFFFLL, 1004005, 1005002, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v614 = [v616 arrayByAddingObjectsFromArray:v615];
  v613 = (void *)[v614 copy];
  v1038[3] = v613;
  int v1024 = 338555555;
  long long v1023 = xmmword_1BBE12100;
  v612 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1025[0] = v612;
  v1025[1] = @"J82";
  v611 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1025 count:2];
  v610 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100008, 1001005, 1002003, 1003003, 1004005, 1005002, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v609 = [v611 arrayByAddingObjectsFromArray:v610];
  v608 = (void *)[v609 copy];
  v1038[4] = v608;
  int v1021 = 1789837692;
  long long v1020 = xmmword_1BBE12114;
  v607 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1022[0] = v607;
  v1022[1] = @"J85";
  v606 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1022 count:2];
  v605 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100010, 1001003, 1002004, 0xFFFFFFFFLL, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v604 = [v606 arrayByAddingObjectsFromArray:v605];
  v603 = (void *)[v604 copy];
  v1038[5] = v603;
  int v1018 = -1239654590;
  long long v1017 = xmmword_1BBE12128;
  v602 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1019[0] = v602;
  v1019[1] = @"J86";
  v601 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1019 count:2];
  v600 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100011, 1001003, 1002004, 1003002, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v599 = [v601 arrayByAddingObjectsFromArray:v600];
  v598 = (void *)[v599 copy];
  v1038[6] = v598;
  int v1015 = -1579092758;
  long long v1014 = xmmword_1BBE1213C;
  v597 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1016[0] = v597;
  v1016[1] = @"J87";
  v596 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1016 count:2];
  v595 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100012, 1001003, 1002004, 1003002, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v594 = [v596 arrayByAddingObjectsFromArray:v595];
  v593 = (void *)[v594 copy];
  v1038[7] = v593;
  int v1012 = 48355600;
  long long v1011 = xmmword_1BBE12150;
  v592 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1013[0] = v592;
  v1013[1] = @"J85M";
  v591 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1013 count:2];
  v590 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100013, 1001003, 1002004, 0xFFFFFFFFLL, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v589 = [v591 arrayByAddingObjectsFromArray:v590];
  v588 = (void *)[v589 copy];
  v1038[8] = v588;
  int v1009 = -679691073;
  long long v1008 = xmmword_1BBE12164;
  v587 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1010[0] = v587;
  v1010[1] = @"J86M";
  v586 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1010 count:2];
  v585 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100014, 1001003, 1002004, 1003002, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v584 = [v586 arrayByAddingObjectsFromArray:v585];
  v583 = (void *)[v584 copy];
  v1038[9] = v583;
  int v1006 = 1430379884;
  long long v1005 = xmmword_1BBE12178;
  v582 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1007[0] = v582;
  v1007[1] = @"J87M";
  v581 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1007 count:2];
  v580 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100015, 1001003, 1002004, 1003002, 1004003, 1005003, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v579 = [v581 arrayByAddingObjectsFromArray:v580];
  v578 = (void *)[v579 copy];
  v1038[10] = v578;
  int v1003 = 1032708406;
  long long v1002 = xmmword_1BBE1218C;
  v577 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1004[0] = v577;
  v1004[1] = @"J96";
  v576 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1004 count:2];
  v575 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100016, 1001004, 1002004, 0xFFFFFFFFLL, 1004005, 1005003, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v574 = [v576 arrayByAddingObjectsFromArray:v575];
  v573 = (void *)[v574 copy];
  v1038[11] = v573;
  int v1000 = 729903963;
  long long v999 = xmmword_1BBE121A0;
  v572 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v1001[0] = v572;
  v1001[1] = @"J97";
  v571 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1001 count:2];
  v570 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100017, 1001004, 1002004, 1003003, 1004005, 1005003, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v569 = [v571 arrayByAddingObjectsFromArray:v570];
  v568 = (void *)[v569 copy];
  v1038[12] = v568;
  int v997 = 1275676051;
  long long v996 = xmmword_1BBE121B4;
  v567 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v998[0] = v567;
  v998[1] = @"J98A";
  v566 = [MEMORY[0x1E4F1C978] arrayWithObjects:v998 count:2];
  v565 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100018, 1001007, 1002005, 0xFFFFFFFFLL, 1004005, 1005005, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v564 = [v566 arrayByAddingObjectsFromArray:v565];
  v563 = (void *)[v564 copy];
  v1038[13] = v563;
  int v994 = 1908474541;
  long long v993 = xmmword_1BBE121C8;
  v562 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v995[0] = v562;
  v995[1] = @"J99A";
  v561 = [MEMORY[0x1E4F1C978] arrayWithObjects:v995 count:2];
  v560 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100019, 1001007, 1002005, 1003003, 1004005, 1005005, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v559 = [v561 arrayByAddingObjectsFromArray:v560];
  v558 = (void *)[v559 copy];
  v1038[14] = v558;
  int v991 = -1527788847;
  long long v990 = xmmword_1BBE121DC;
  v557 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v992[0] = v557;
  v992[1] = @"J127";
  v556 = [MEMORY[0x1E4F1C978] arrayWithObjects:v992 count:2];
  v555 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100020, 1001007, 1002006, 0xFFFFFFFFLL, 1004007, 1005004, 1006006, 1007004, 0xFFFFFFFFLL, 0);
  v554 = [v556 arrayByAddingObjectsFromArray:v555];
  v553 = (void *)[v554 copy];
  v1038[15] = v553;
  int v988 = 1532898719;
  long long v987 = xmmword_1BBE121F0;
  v552 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v989[0] = v552;
  v989[1] = @"J128";
  v551 = [MEMORY[0x1E4F1C978] arrayWithObjects:v989 count:2];
  v550 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100021, 1001007, 1002006, 1003004, 1004007, 1005004, 1006006, 1007004, 1008001, 0);
  v549 = [v551 arrayByAddingObjectsFromArray:v550];
  v548 = (void *)[v549 copy];
  v1038[16] = v548;
  int v985 = -199226823;
  long long v984 = xmmword_1BBE12204;
  v547 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v986[0] = v547;
  v986[1] = @"J71N";
  v546 = [MEMORY[0x1E4F1C978] arrayWithObjects:v986 count:2];
  v545 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100022, 1001006, 1002002, 0xFFFFFFFFLL, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v544 = [v546 arrayByAddingObjectsFromArray:v545];
  v543 = (void *)[v544 copy];
  v1038[17] = v543;
  int v982 = -1283070668;
  long long v981 = xmmword_1BBE12218;
  v542 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v983[0] = v542;
  v983[1] = @"J72N";
  v541 = [MEMORY[0x1E4F1C978] arrayWithObjects:v983 count:2];
  v540 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100023, 1001006, 1002002, 1003003, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v539 = [v541 arrayByAddingObjectsFromArray:v540];
  v538 = (void *)[v539 copy];
  v1038[18] = v538;
  int v979 = 1412427398;
  long long v978 = xmmword_1BBE1222C;
  v537 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v980[0] = v537;
  v980[1] = @"J71N";
  v536 = [MEMORY[0x1E4F1C978] arrayWithObjects:v980 count:2];
  v535 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100024, 1001006, 1002002, 0xFFFFFFFFLL, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v534 = [v536 arrayByAddingObjectsFromArray:v535];
  v533 = (void *)[v534 copy];
  v1038[19] = v533;
  int v976 = 160260070;
  long long v975 = xmmword_1BBE12240;
  v532 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v977[0] = v532;
  v977[1] = @"J72N";
  v531 = [MEMORY[0x1E4F1C978] arrayWithObjects:v977 count:2];
  v530 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100025, 1001006, 1002002, 1003003, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v529 = [v531 arrayByAddingObjectsFromArray:v530];
  v528 = (void *)[v529 copy];
  v1038[20] = v528;
  int v973 = -1022451852;
  long long v972 = xmmword_1BBE12254;
  v527 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v974[0] = v527;
  v974[1] = @"J98N";
  v526 = [MEMORY[0x1E4F1C978] arrayWithObjects:v974 count:2];
  v525 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100026, 1001009, 1002017, 0xFFFFFFFFLL, 1004007, 1005007, 1006006, 1007004, 0xFFFFFFFFLL, 0);
  v524 = [v526 arrayByAddingObjectsFromArray:v525];
  v523 = (void *)[v524 copy];
  v1038[21] = v523;
  int v970 = 1729782187;
  long long v969 = xmmword_1BBE12268;
  v522 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v971[0] = v522;
  v971[1] = @"J99N";
  v521 = [MEMORY[0x1E4F1C978] arrayWithObjects:v971 count:2];
  v520 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100027, 1001009, 1002017, 1003005, 1004007, 1005007, 1006006, 1007004, 1008001, 0);
  v519 = [v521 arrayByAddingObjectsFromArray:v520];
  v518 = (void *)[v519 copy];
  v1038[22] = v518;
  int v967 = 996646949;
  long long v966 = xmmword_1BBE1227C;
  v517 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v968[0] = v517;
  v968[1] = @"J127N";
  v516 = [MEMORY[0x1E4F1C978] arrayWithObjects:v968 count:2];
  v515 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100028, 1001009, 1002018, 0xFFFFFFFFLL, 1004007, 1005008, 1006006, 1007004, 0xFFFFFFFFLL, 0);
  v514 = [v516 arrayByAddingObjectsFromArray:v515];
  v513 = (void *)[v514 copy];
  v1038[23] = v513;
  int v964 = -563086000;
  long long v963 = xmmword_1BBE12290;
  v512 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v965[0] = v512;
  v965[1] = @"J128N";
  v511 = [MEMORY[0x1E4F1C978] arrayWithObjects:v965 count:2];
  v510 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100029, 1001009, 1002018, 1003005, 1004007, 1005008, 1006006, 1007004, 1008001, 0);
  v509 = [v511 arrayByAddingObjectsFromArray:v510];
  v508 = (void *)[v509 copy];
  v1038[24] = v508;
  int v961 = 317289457;
  long long v960 = xmmword_1BBE122A4;
  v507 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v962[0] = v507;
  v962[1] = @"J71NM";
  v506 = [MEMORY[0x1E4F1C978] arrayWithObjects:v962 count:2];
  v505 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100030, 1001008, 1002002, 0xFFFFFFFFLL, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v504 = [v506 arrayByAddingObjectsFromArray:v505];
  v503 = (void *)[v504 copy];
  v1038[25] = v503;
  int v958 = 401945557;
  long long v957 = xmmword_1BBE122B8;
  v502 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v959[0] = v502;
  v959[1] = @"J72NM";
  v501 = [MEMORY[0x1E4F1C978] arrayWithObjects:v959 count:2];
  v500 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100031, 1001008, 1002002, 1003004, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 1008001, 0);
  v499 = [v501 arrayByAddingObjectsFromArray:v500];
  v498 = (void *)[v499 copy];
  v1038[26] = v498;
  int v955 = 2030516999;
  long long v954 = xmmword_1BBE122CC;
  v497 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v956[0] = v497;
  v956[1] = @"J120N";
  v496 = [MEMORY[0x1E4F1C978] arrayWithObjects:v956 count:2];
  v495 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100032, 1001012, 1002027, 0xFFFFFFFFLL, 1004013, 1005006, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v494 = [v496 arrayByAddingObjectsFromArray:v495];
  v493 = (void *)[v494 copy];
  v1038[27] = v493;
  int v952 = -1276010597;
  long long v951 = xmmword_1BBE122E0;
  v492 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v953[0] = v492;
  v953[1] = @"J120N";
  v491 = [MEMORY[0x1E4F1C978] arrayWithObjects:v953 count:2];
  v490 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100033, 1001012, 1002027, 0xFFFFFFFFLL, 1004013, 1005006, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v489 = [v491 arrayByAddingObjectsFromArray:v490];
  v488 = (void *)[v489 copy];
  v1038[28] = v488;
  int v949 = -762483149;
  long long v948 = xmmword_1BBE122F4;
  v487 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v950[0] = v487;
  v950[1] = @"J121N";
  v486 = [MEMORY[0x1E4F1C978] arrayWithObjects:v950 count:2];
  v485 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100034, 1001012, 1002027, 1003010, 1004013, 1005006, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v484 = [v486 arrayByAddingObjectsFromArray:v485];
  v483 = (void *)[v484 copy];
  v1038[29] = v483;
  int v946 = -1926937532;
  long long v945 = xmmword_1BBE12308;
  v482 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v947[0] = v482;
  v947[1] = @"J121N";
  v481 = [MEMORY[0x1E4F1C978] arrayWithObjects:v947 count:2];
  v480 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100035, 1001012, 1002027, 1003010, 1004013, 1005006, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v479 = [v481 arrayByAddingObjectsFromArray:v480];
  v478 = (void *)[v479 copy];
  v1038[30] = v478;
  int v943 = -1902732724;
  long long v942 = xmmword_1BBE1231C;
  v477 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v944[0] = v477;
  v944[1] = @"J120NM";
  v476 = [MEMORY[0x1E4F1C978] arrayWithObjects:v944 count:2];
  v475 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100036, 1001012, 1002028, 0xFFFFFFFFLL, 1004013, 1005024, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v474 = [v476 arrayByAddingObjectsFromArray:v475];
  v473 = (void *)[v474 copy];
  v1038[31] = v473;
  int v940 = -342357580;
  long long v939 = xmmword_1BBE12330;
  v472 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v941[0] = v472;
  v941[1] = @"J120NM";
  v471 = [MEMORY[0x1E4F1C978] arrayWithObjects:v941 count:2];
  v470 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100037, 1001012, 1002028, 0xFFFFFFFFLL, 1004013, 1005024, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v469 = [v471 arrayByAddingObjectsFromArray:v470];
  v468 = (void *)[v469 copy];
  v1038[32] = v468;
  int v937 = 300442574;
  long long v936 = xmmword_1BBE12344;
  v467 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v938[0] = v467;
  v938[1] = @"J121NM";
  v466 = [MEMORY[0x1E4F1C978] arrayWithObjects:v938 count:2];
  v465 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100038, 1001012, 1002028, 1003010, 1004013, 1005024, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v464 = [v466 arrayByAddingObjectsFromArray:v465];
  v463 = (void *)[v464 copy];
  v1038[33] = v463;
  int v934 = -1294188889;
  long long v933 = xmmword_1BBE12358;
  v462 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v935[0] = v462;
  v935[1] = @"J121NM";
  v461 = [MEMORY[0x1E4F1C978] arrayWithObjects:v935 count:2];
  v460 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100039, 1001012, 1002028, 1003010, 1004013, 1005024, 1006007, 0xFFFFFFFFLL, 1008002, 0);
  v459 = [v461 arrayByAddingObjectsFromArray:v460];
  v458 = (void *)[v459 copy];
  v1038[34] = v458;
  int v931 = 1278131292;
  long long v930 = xmmword_1BBE1236C;
  v457 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v932[0] = v457;
  v932[1] = @"J96NM";
  v456 = [MEMORY[0x1E4F1C978] arrayWithObjects:v932 count:2];
  v455 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100040, 1001011, 1002004, 0xFFFFFFFFLL, 1004013, 1005003, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v454 = [v456 arrayByAddingObjectsFromArray:v455];
  v453 = (void *)[v454 copy];
  v1038[35] = v453;
  int v928 = -1841712216;
  long long v927 = xmmword_1BBE12380;
  v452 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v929[0] = v452;
  v929[1] = @"J97NM";
  v451 = [MEMORY[0x1E4F1C978] arrayWithObjects:v929 count:2];
  v450 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100041, 1001011, 1002004, 1003010, 1004013, 1005003, 1006006, 0xFFFFFFFFLL, 1008002, 0);
  v449 = [v451 arrayByAddingObjectsFromArray:v450];
  v448 = (void *)[v449 copy];
  v1038[36] = v448;
  int v925 = 659506830;
  long long v924 = xmmword_1BBE12394;
  v447 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v926[0] = v447;
  v926[1] = @"J207N";
  v446 = [MEMORY[0x1E4F1C978] arrayWithObjects:v926 count:2];
  v445 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100042, 1001011, 1002018, 0xFFFFFFFFLL, 1004013, 1005024, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v444 = [v446 arrayByAddingObjectsFromArray:v445];
  v443 = (void *)[v444 copy];
  v1038[37] = v443;
  int v922 = 213746202;
  long long v921 = xmmword_1BBE123A8;
  v442 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v923[0] = v442;
  v923[1] = @"J208N";
  v441 = [MEMORY[0x1E4F1C978] arrayWithObjects:v923 count:2];
  v440 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100043, 1001011, 1002018, 1003010, 1004013, 1005024, 1006006, 0xFFFFFFFFLL, 1008002, 0);
  v439 = [v441 arrayByAddingObjectsFromArray:v440];
  v438 = (void *)[v439 copy];
  v1038[38] = v438;
  int v919 = -1157300313;
  long long v918 = xmmword_1BBE123BC;
  v437 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v920[0] = v437;
  v920[1] = @"J71C";
  v436 = [MEMORY[0x1E4F1C978] arrayWithObjects:v920 count:2];
  v435 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100044, 1001008, 1002018, 0xFFFFFFFFLL, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v434 = [v436 arrayByAddingObjectsFromArray:v435];
  v433 = (void *)[v434 copy];
  v1038[39] = v433;
  int v916 = -2132668294;
  long long v915 = xmmword_1BBE123D0;
  v432 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v917[0] = v432;
  v917[1] = @"J72C";
  v431 = [MEMORY[0x1E4F1C978] arrayWithObjects:v917 count:2];
  v430 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100045, 1001008, 1002018, 1003010, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 1008002, 0);
  v429 = [v431 arrayByAddingObjectsFromArray:v430];
  v428 = (void *)[v429 copy];
  v1038[40] = v428;
  int v913 = 1126727276;
  long long v912 = xmmword_1BBE123E4;
  v427 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v914[0] = v427;
  v914[1] = @"J317N";
  v426 = [MEMORY[0x1E4F1C978] arrayWithObjects:v914 count:2];
  v425 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100046, 1001012, 1002027, 0xFFFFFFFFLL, 1004014, 1005006, 1006009, 0xFFFFFFFFLL, 1008002, 0);
  v424 = [v426 arrayByAddingObjectsFromArray:v425];
  v423 = (void *)[v424 copy];
  v1038[41] = v423;
  int v910 = 300130091;
  long long v909 = xmmword_1BBE123F8;
  v422 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v911[0] = v422;
  v911[1] = @"J318N";
  v421 = [MEMORY[0x1E4F1C978] arrayWithObjects:v911 count:2];
  v420 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100047, 1001012, 1002027, 1003011, 1004014, 1005006, 1006009, 0xFFFFFFFFLL, 1008002, 0);
  v419 = [v421 arrayByAddingObjectsFromArray:v420];
  v418 = (void *)[v419 copy];
  v1038[42] = v418;
  int v907 = 343814884;
  long long v906 = xmmword_1BBE1240C;
  v417 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v908[0] = v417;
  v908[1] = @"J320N";
  v416 = [MEMORY[0x1E4F1C978] arrayWithObjects:v908 count:2];
  v415 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100048, 1001012, 1002028, 0xFFFFFFFFLL, 1004014, 1005006, 1006009, 0xFFFFFFFFLL, 1008002, 0);
  v414 = [v416 arrayByAddingObjectsFromArray:v415];
  v413 = (void *)[v414 copy];
  v1038[43] = v413;
  int v904 = -1675932945;
  long long v903 = xmmword_1BBE12420;
  v412 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v905[0] = v412;
  v905[1] = @"J321N";
  v411 = [MEMORY[0x1E4F1C978] arrayWithObjects:v905 count:2];
  v410 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100049, 1001012, 1002028, 1003011, 1004014, 1005006, 1006009, 0xFFFFFFFFLL, 1008002, 0);
  v409 = [v411 arrayByAddingObjectsFromArray:v410];
  v408 = (void *)[v409 copy];
  v1038[44] = v408;
  int v901 = 372777383;
  long long v900 = xmmword_1BBE12434;
  v407 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v902[0] = v407;
  v902[1] = @"J71D";
  v406 = [MEMORY[0x1E4F1C978] arrayWithObjects:v902 count:2];
  v405 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100050, 1001011, 1002018, 0xFFFFFFFFLL, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v404 = [v406 arrayByAddingObjectsFromArray:v405];
  v403 = (void *)[v404 copy];
  v1038[45] = v403;
  int v898 = -858079590;
  long long v897 = xmmword_1BBE12448;
  v402 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v899[0] = v402;
  v899[1] = @"J72D";
  v401 = [MEMORY[0x1E4F1C978] arrayWithObjects:v899 count:2];
  v400 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100051, 1001011, 1002018, 1003010, 1004007, 1005006, 1006006, 0xFFFFFFFFLL, 1008002, 0);
  v399 = [v401 arrayByAddingObjectsFromArray:v400];
  v398 = (void *)[v399 copy];
  v1038[46] = v398;
  int v895 = 345196535;
  long long v894 = xmmword_1BBE1245C;
  v397 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v896[0] = v397;
  v896[1] = @"J127NM";
  v396 = [MEMORY[0x1E4F1C978] arrayWithObjects:v896 count:2];
  v395 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100052, 1001014, 1002031, 0xFFFFFFFFLL, 1004015, 1005006, 1006006, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v394 = [v396 arrayByAddingObjectsFromArray:v395];
  v393 = (void *)[v394 copy];
  v1038[47] = v393;
  int v892 = 440949464;
  long long v891 = xmmword_1BBE12470;
  v392 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v893[0] = v392;
  v893[1] = @"J128NM";
  v391 = [MEMORY[0x1E4F1C978] arrayWithObjects:v893 count:2];
  v390 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100053, 1001014, 1002031, 1003011, 1004015, 1005006, 1006006, 0xFFFFFFFFLL, 1008002, 0);
  v389 = [v391 arrayByAddingObjectsFromArray:v390];
  v388 = (void *)[v389 copy];
  v1038[48] = v388;
  int v889 = -695298128;
  long long v888 = xmmword_1BBE12484;
  v387 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v890[0] = v387;
  v890[1] = @"J317NM";
  v386 = [MEMORY[0x1E4F1C978] arrayWithObjects:v890 count:2];
  v385 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100054, 1001015, 1002032, 0xFFFFFFFFLL, 1004015, 1005008, 1006012, 1007004, 0xFFFFFFFFLL, 0);
  v384 = [v386 arrayByAddingObjectsFromArray:v385];
  v383 = (void *)[v384 copy];
  v1038[49] = v383;
  int v886 = 804488105;
  long long v885 = xmmword_1BBE12498;
  v382 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v887[0] = v382;
  v887[1] = @"J317NM";
  v381 = [MEMORY[0x1E4F1C978] arrayWithObjects:v887 count:2];
  v380 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100055, 1001015, 1002032, 0xFFFFFFFFLL, 1004015, 1005008, 1006012, 1007004, 0xFFFFFFFFLL, 0);
  v379 = [v381 arrayByAddingObjectsFromArray:v380];
  v378 = (void *)[v379 copy];
  v1038[50] = v378;
  int v883 = 1614584579;
  long long v882 = xmmword_1BBE124AC;
  v377 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v884[0] = v377;
  v884[1] = @"J318NM";
  v376 = [MEMORY[0x1E4F1C978] arrayWithObjects:v884 count:2];
  v375 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100056, 1001015, 1002032, 1003012, 1004015, 1005008, 1006012, 1007004, 1008004, 0);
  v374 = [v376 arrayByAddingObjectsFromArray:v375];
  v373 = (void *)[v374 copy];
  v1038[51] = v373;
  int v880 = 324288768;
  long long v879 = xmmword_1BBE124C0;
  v372 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v881[0] = v372;
  v881[1] = @"J318NM";
  v371 = [MEMORY[0x1E4F1C978] arrayWithObjects:v881 count:2];
  v370 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100057, 1001015, 1002032, 1003012, 1004015, 1005008, 1006012, 1007004, 1008004, 0);
  v369 = [v371 arrayByAddingObjectsFromArray:v370];
  v368 = (void *)[v369 copy];
  v1038[52] = v368;
  int v877 = 460218192;
  long long v876 = xmmword_1BBE124D4;
  v367 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v878[0] = v367;
  v878[1] = @"J320NM";
  v366 = [MEMORY[0x1E4F1C978] arrayWithObjects:v878 count:2];
  v365 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100058, 1001015, 1002030, 0xFFFFFFFFLL, 1004015, 1005008, 1006012, 1007004, 0xFFFFFFFFLL, 0);
  v364 = [v366 arrayByAddingObjectsFromArray:v365];
  v363 = (void *)[v364 copy];
  v1038[53] = v363;
  int v874 = 2144905009;
  long long v873 = xmmword_1BBE124E8;
  v362 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v875[0] = v362;
  v875[1] = @"J320NM";
  v361 = [MEMORY[0x1E4F1C978] arrayWithObjects:v875 count:2];
  v360 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100059, 1001015, 1002030, 0xFFFFFFFFLL, 1004015, 1005008, 1006012, 1007004, 0xFFFFFFFFLL, 0);
  v359 = [v361 arrayByAddingObjectsFromArray:v360];
  v358 = (void *)[v359 copy];
  v1038[54] = v358;
  int v871 = 127894440;
  long long v870 = xmmword_1BBE124FC;
  v357 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v872[0] = v357;
  v872[1] = @"J321NM";
  v356 = [MEMORY[0x1E4F1C978] arrayWithObjects:v872 count:2];
  v355 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100060, 1001015, 1002030, 1003012, 1004015, 1005008, 1006012, 1007004, 1008004, 0);
  v354 = [v356 arrayByAddingObjectsFromArray:v355];
  v353 = (void *)[v354 copy];
  v1038[55] = v353;
  int v868 = 1070997468;
  long long v867 = xmmword_1BBE12510;
  v352 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v869[0] = v352;
  v869[1] = @"J321NM";
  v351 = [MEMORY[0x1E4F1C978] arrayWithObjects:v869 count:2];
  v350 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100061, 1001015, 1002030, 1003012, 1004015, 1005008, 1006012, 1007004, 1008004, 0);
  v349 = [v351 arrayByAddingObjectsFromArray:v350];
  v348 = (void *)[v349 copy];
  v1038[56] = v348;
  int v865 = -212523443;
  long long v864 = xmmword_1BBE12524;
  v347 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v866[0] = v347;
  v866[1] = @"J71DN";
  v346 = [MEMORY[0x1E4F1C978] arrayWithObjects:v866 count:2];
  v345 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100062, 1001013, 1002018, 0xFFFFFFFFLL, 1004007, 1005006, 1006016, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v344 = [v346 arrayByAddingObjectsFromArray:v345];
  v343 = (void *)[v344 copy];
  v1038[57] = v343;
  int v862 = 646100384;
  long long v861 = xmmword_1BBE12538;
  v342 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v863[0] = v342;
  v863[1] = @"J72DN";
  v341 = [MEMORY[0x1E4F1C978] arrayWithObjects:v863 count:2];
  v340 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100063, 1001013, 1002018, 1003010, 1004007, 1005006, 1006016, 0xFFFFFFFFLL, 1008002, 0);
  v339 = [v341 arrayByAddingObjectsFromArray:v340];
  v338 = (void *)[v339 copy];
  v1038[58] = v338;
  int v859 = 688565114;
  long long v858 = xmmword_1BBE1254C;
  v337 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v860[0] = v337;
  v860[1] = @"J96NMN";
  v336 = [MEMORY[0x1E4F1C978] arrayWithObjects:v860 count:2];
  v335 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100064, 1001016, 1002033, 0xFFFFFFFFLL, 1004015, 1005003, 1006013, 1007004, 0xFFFFFFFFLL, 0);
  v334 = [v336 arrayByAddingObjectsFromArray:v335];
  v333 = (void *)[v334 copy];
  v1038[59] = v333;
  int v856 = -493418906;
  long long v855 = xmmword_1BBE12560;
  v332 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v857[0] = v332;
  v857[1] = @"J97NMN";
  v331 = [MEMORY[0x1E4F1C978] arrayWithObjects:v857 count:2];
  v330 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100065, 1001016, 1002033, 1003013, 1004015, 1005003, 1006013, 1007004, 1008004, 0);
  v329 = [v331 arrayByAddingObjectsFromArray:v330];
  v328 = (void *)[v329 copy];
  v1038[60] = v328;
  int v853 = -545612308;
  long long v852 = xmmword_1BBE12574;
  v327 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v854[0] = v327;
  v854[1] = @"J307N";
  v326 = [MEMORY[0x1E4F1C978] arrayWithObjects:v854 count:2];
  v325 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100066, 1001015, 1002036, 0xFFFFFFFFLL, 1004015, 1005028, 1006017, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v324 = [v326 arrayByAddingObjectsFromArray:v325];
  v323 = (void *)[v324 copy];
  v1038[61] = v323;
  int v850 = 1178062702;
  long long v849 = xmmword_1BBE12588;
  v322 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v851[0] = v322;
  v851[1] = @"J307NM";
  v321 = [MEMORY[0x1E4F1C978] arrayWithObjects:v851 count:2];
  v320 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100067, 1001015, 1002036, 1003013, 1004015, 1005028, 1006017, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v319 = [v321 arrayByAddingObjectsFromArray:v320];
  v318 = (void *)[v319 copy];
  v1038[62] = v318;
  int v847 = -340360463;
  long long v846 = xmmword_1BBE1259C;
  v317 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v848[0] = v317;
  v848[1] = @"J271";
  v316 = [MEMORY[0x1E4F1C978] arrayWithObjects:v848 count:2];
  v315 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100068, 1001014, 1002040, 0xFFFFFFFFLL, 1004015, 1005030, 1006021, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v314 = [v316 arrayByAddingObjectsFromArray:v315];
  v313 = (void *)[v314 copy];
  v1038[63] = v313;
  int v844 = 1605231531;
  long long v843 = xmmword_1BBE125B0;
  v312 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v845[0] = v312;
  v845[1] = @"J272";
  v311 = [MEMORY[0x1E4F1C978] arrayWithObjects:v845 count:2];
  v310 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100069, 1001014, 1002040, 1003013, 1004015, 1005030, 1006021, 0xFFFFFFFFLL, 1008004, 0);
  v309 = [v311 arrayByAddingObjectsFromArray:v310];
  v308 = (void *)[v309 copy];
  v1038[64] = v308;
  int v841 = 1878025452;
  long long v840 = xmmword_1BBE125C4;
  v307 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v842[0] = v307;
  v842[1] = @"J617";
  v306 = [MEMORY[0x1E4F1C978] arrayWithObjects:v842 count:2];
  v305 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100070, 1001017, 1002041, 0xFFFFFFFFLL, 1004016, 1005032, 1006022, 1007004, 0xFFFFFFFFLL, 0);
  v304 = [v306 arrayByAddingObjectsFromArray:v305];
  v303 = (void *)[v304 copy];
  v1038[65] = v303;
  int v838 = 1725957070;
  long long v837 = xmmword_1BBE125D8;
  v302 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v839[0] = v302;
  v839[1] = @"J618";
  v301 = [MEMORY[0x1E4F1C978] arrayWithObjects:v839 count:2];
  v300 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100071, 1001017, 1002041, 1003015, 1004016, 1005032, 1006022, 1007004, 1008004, 0);
  v299 = [v301 arrayByAddingObjectsFromArray:v300];
  v298 = (void *)[v299 copy];
  v1038[66] = v298;
  int v835 = 538967431;
  long long v834 = xmmword_1BBE125EC;
  v297 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v836[0] = v297;
  v836[1] = @"J620";
  v296 = [MEMORY[0x1E4F1C978] arrayWithObjects:v836 count:2];
  v295 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100072, 1001017, 1002030, 0xFFFFFFFFLL, 1004016, 1005032, 1006022, 1007004, 0xFFFFFFFFLL, 0);
  v294 = [v296 arrayByAddingObjectsFromArray:v295];
  v293 = (void *)[v294 copy];
  v1038[67] = v293;
  int v832 = 2060712151;
  long long v831 = xmmword_1BBE12600;
  v292 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v833[0] = v292;
  v833[1] = @"J621";
  v291 = [MEMORY[0x1E4F1C978] arrayWithObjects:v833 count:2];
  v290 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100073, 1001017, 1002030, 1003015, 1004016, 1005032, 1006022, 1007004, 1008004, 0);
  v289 = [v291 arrayByAddingObjectsFromArray:v290];
  v288 = (void *)[v289 copy];
  v1038[68] = v288;
  int v829 = 958549802;
  long long v828 = xmmword_1BBE12614;
  v287 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v830[0] = v287;
  v830[1] = @"J507";
  v286 = [MEMORY[0x1E4F1C978] arrayWithObjects:v830 count:2];
  v285 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100074, 1001017, 1002056, 0xFFFFFFFFLL, 1004016, 1005042, 1006028, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v284 = [v286 arrayByAddingObjectsFromArray:v285];
  v283 = (void *)[v284 copy];
  v1038[69] = v283;
  int v826 = -12497897;
  long long v825 = xmmword_1BBE12628;
  v282 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v827[0] = v282;
  v827[1] = @"J508";
  v281 = [MEMORY[0x1E4F1C978] arrayWithObjects:v827 count:2];
  v280 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100075, 1001017, 1002056, 1003016, 1004016, 1005042, 1006028, 0xFFFFFFFFLL, 1008004, 0);
  v279 = [v281 arrayByAddingObjectsFromArray:v280];
  v278 = (void *)[v279 copy];
  v1038[70] = v278;
  int v823 = 1377540371;
  long long v822 = xmmword_1BBE1263C;
  v277 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v824[0] = v277;
  v824[1] = @"J537";
  v276 = [MEMORY[0x1E4F1C978] arrayWithObjects:v824 count:2];
  v275 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100076, 1001017, 1002055, 0xFFFFFFFFLL, 1004016, 1005043, 1006029, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  v274 = [v276 arrayByAddingObjectsFromArray:v275];
  v273 = (void *)[v274 copy];
  v1038[71] = v273;
  int v820 = -518121279;
  long long v819 = xmmword_1BBE12650;
  v272 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v821[0] = v272;
  v821[1] = @"J538";
  v271 = [MEMORY[0x1E4F1C978] arrayWithObjects:v821 count:2];
  v270 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100077, 1001017, 1002055, 1003016, 1004016, 1005043, 1006029, 0xFFFFFFFFLL, 1008004, 0);
  v269 = [v271 arrayByAddingObjectsFromArray:v270];
  v268 = (void *)[v269 copy];
  v1038[72] = v268;
  int v817 = 802516499;
  long long v816 = xmmword_1BBE12664;
  v267 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v818[0] = v267;
  v818[1] = @"J717";
  v266 = [MEMORY[0x1E4F1C978] arrayWithObjects:v818 count:2];
  v265 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100078, 1001020, 1002057, 0xFFFFFFFFLL, 1004016, 1005044, 1006025, 1007004, 0xFFFFFFFFLL, 0);
  v264 = [v266 arrayByAddingObjectsFromArray:v265];
  v263 = (void *)[v264 copy];
  v1038[73] = v263;
  int v814 = -1919324456;
  long long v813 = xmmword_1BBE12678;
  v262 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v815[0] = v262;
  v815[1] = @"J718";
  v261 = [MEMORY[0x1E4F1C978] arrayWithObjects:v815 count:2];
  v260 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100079, 1001020, 1002057, 1003016, 1004016, 1005044, 1006025, 1007004, 1008004, 0);
  v259 = [v261 arrayByAddingObjectsFromArray:v260];
  v258 = (void *)[v259 copy];
  v1038[74] = v258;
  int v811 = 1127969586;
  long long v810 = xmmword_1BBE1268C;
  v257 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v812[0] = v257;
  v812[1] = @"J720";
  v256 = [MEMORY[0x1E4F1C978] arrayWithObjects:v812 count:2];
  v255 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100080, 1001020, 1002057, 0xFFFFFFFFLL, 1004016, 1005044, 1006025, 1007004, 0xFFFFFFFFLL, 0);
  v254 = [v256 arrayByAddingObjectsFromArray:v255];
  v253 = (void *)[v254 copy];
  v1038[75] = v253;
  int v808 = 1292009573;
  long long v807 = xmmword_1BBE126A0;
  v252 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v809[0] = v252;
  v809[1] = @"J721";
  v251 = [MEMORY[0x1E4F1C978] arrayWithObjects:v809 count:2];
  v250 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100081, 1001020, 1002057, 1003016, 1004016, 1005044, 1006025, 1007004, 1008004, 0);
  v249 = [v251 arrayByAddingObjectsFromArray:v250];
  v248 = (void *)[v249 copy];
  v1038[76] = v248;
  int v805 = -773054213;
  long long v804 = xmmword_1BBE126B4;
  v247 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v806[0] = v247;
  v806[1] = @"J410";
  v246 = [MEMORY[0x1E4F1C978] arrayWithObjects:v806 count:2];
  v245 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100084, 1001019, 1002054, 0xFFFFFFFFLL, 1004016, 1005045, 1006030, 1007004, 0xFFFFFFFFLL, 0);
  v244 = [v246 arrayByAddingObjectsFromArray:v245];
  v243 = (void *)[v244 copy];
  v1038[77] = v243;
  int v802 = -1204420428;
  long long v801 = xmmword_1BBE126C8;
  v242 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v803[0] = v242;
  v803[1] = @"J411";
  v241 = [MEMORY[0x1E4F1C978] arrayWithObjects:v803 count:2];
  v240 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 100085, 1001019, 1002054, 1003016, 1004016, 1005045, 1006030, 1007004, 1008004, 0);
  v239 = [v241 arrayByAddingObjectsFromArray:v240];
  v238 = (void *)[v239 copy];
  v1038[78] = v238;
  int v799 = 1960366092;
  long long v798 = xmmword_1BBE126DC;
  v237 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v800[0] = v237;
  v800[1] = @"N102";
  v236 = [MEMORY[0x1E4F1C978] arrayWithObjects:v800 count:2];
  v235 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 101001, 1001004, 1002007, 0xFFFFFFFFLL, 1004006, 1005009, 1006001, 1007001, 0xFFFFFFFFLL, 0);
  v234 = [v236 arrayByAddingObjectsFromArray:v235];
  v233 = (void *)[v234 copy];
  v1038[79] = v233;
  int v796 = -2114570942;
  long long v795 = xmmword_1BBE126F0;
  v232 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v797[0] = v232;
  v797[1] = @"N102N";
  v231 = [MEMORY[0x1E4F1C978] arrayWithObjects:v797 count:2];
  v229 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 101002, 1001008, 1002029, 0xFFFFFFFFLL, 1004008, 1005025, 1006001, 1007001, 0xFFFFFFFFLL, 0);
  v228 = [v231 arrayByAddingObjectsFromArray:v229];
  v227 = (void *)[v228 copy];
  v1038[80] = v227;
  int v793 = 28030256;
  long long v792 = xmmword_1BBE12704;
  v226 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v794[0] = v226;
  v794[1] = @"N51";
  v225 = [MEMORY[0x1E4F1C978] arrayWithObjects:v794 count:2];
  v224 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102005, 1001003, 1002008, 1003002, 1004002, 1005012, 1006001, 1007002, 1008001, 0);
  v223 = [v225 arrayByAddingObjectsFromArray:v224];
  v221 = (void *)[v223 copy];
  v1038[81] = v221;
  int v790 = 1214363620;
  long long v789 = xmmword_1BBE12718;
  v220 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v791[0] = v220;
  v791[1] = @"N53";
  v219 = [MEMORY[0x1E4F1C978] arrayWithObjects:v791 count:2];
  v640 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102006, 1001003, 1002008, 1003002, 1004002, 1005012, 1006001, 1007002, 1008001, 0);
  v218 = [v219 arrayByAddingObjectsFromArray:v640];
  v217 = (void *)[v218 copy];
  v1038[82] = v217;
  int v787 = -798153473;
  long long v786 = xmmword_1BBE1272C;
  v216 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v788[0] = v216;
  v788[1] = @"N56";
  v215 = [MEMORY[0x1E4F1C978] arrayWithObjects:v788 count:2];
  v214 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102007, 1001004, 1002009, 1003003, 1004006, 1005014, 1006001, 1007003, 1008001, 0);
  v213 = [v215 arrayByAddingObjectsFromArray:v214];
  v212 = (void *)[v213 copy];
  v1038[83] = v212;
  int v784 = -776721724;
  long long v783 = xmmword_1BBE12740;
  v210 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v785[0] = v210;
  v785[1] = @"N61";
  v209 = [MEMORY[0x1E4F1C978] arrayWithObjects:v785 count:2];
  v641 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102008, 1001004, 1002010, 1003003, 1004006, 1005013, 1006001, 1007004, 1008001, 0);
  v208 = [v209 arrayByAddingObjectsFromArray:v641];
  v207 = (void *)[v208 copy];
  v1038[84] = v207;
  int v781 = -1403227947;
  long long v780 = xmmword_1BBE12754;
  v206 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v782[0] = v206;
  v782[1] = @"N66";
  v205 = [MEMORY[0x1E4F1C978] arrayWithObjects:v782 count:2];
  v204 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102009, 1001006, 1002011, 1003004, 1004005, 1005015, 1006001, 1007004, 1008001, 0);
  v203 = [v205 arrayByAddingObjectsFromArray:v204];
  v202 = (void *)[v203 copy];
  v1038[85] = v202;
  int v778 = 729118884;
  long long v777 = xmmword_1BBE12768;
  v201 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v779[0] = v201;
  v779[1] = @"N66M";
  v200 = [MEMORY[0x1E4F1C978] arrayWithObjects:v779 count:2];
  v199 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102010, 1001006, 1002011, 1003004, 1004005, 1005015, 1006001, 1007004, 1008001, 0);
  v198 = [v200 arrayByAddingObjectsFromArray:v199];
  v197 = (void *)[v198 copy];
  v1038[86] = v197;
  int v775 = -489993439;
  long long v774 = xmmword_1BBE1277C;
  v196 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v776[0] = v196;
  v776[1] = @"N71";
  v195 = [MEMORY[0x1E4F1C978] arrayWithObjects:v776 count:2];
  v194 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102011, 1001006, 1002012, 1003004, 1004005, 1005015, 1006001, 1007004, 1008001, 0);
  v193 = [v195 arrayByAddingObjectsFromArray:v194];
  v192 = (void *)[v193 copy];
  v1038[87] = v192;
  int v772 = 886875686;
  long long v771 = xmmword_1BBE12790;
  v191 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v773[0] = v191;
  v773[1] = @"N71M";
  v190 = [MEMORY[0x1E4F1C978] arrayWithObjects:v773 count:2];
  v638 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102012, 1001006, 1002012, 1003004, 1004005, 1005015, 1006001, 1007004, 1008001, 0);
  v189 = [v190 arrayByAddingObjectsFromArray:v638];
  v188 = (void *)[v189 copy];
  v1038[88] = v188;
  int v769 = 1046806126;
  long long v768 = xmmword_1BBE127A4;
  v187 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v770[0] = v187;
  v770[1] = @"N69";
  v186 = [MEMORY[0x1E4F1C978] arrayWithObjects:v770 count:2];
  v185 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102013, 1001006, 1002008, 1003003, 1004008, 1005016, 1006001, 1007002, 1008001, 0);
  v184 = [v186 arrayByAddingObjectsFromArray:v185];
  v183 = (void *)[v184 copy];
  v1038[89] = v183;
  int v766 = -188760945;
  long long v765 = xmmword_1BBE127B8;
  v182 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v767[0] = v182;
  v767[1] = @"N69U";
  v181 = [MEMORY[0x1E4F1C978] arrayWithObjects:v767 count:2];
  v230 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102014, 1001006, 1002008, 1003003, 1004008, 1005016, 1006001, 1007002, 1008001, 0);
  v180 = [v181 arrayByAddingObjectsFromArray:v230];
  v179 = (void *)[v180 copy];
  v1038[90] = v179;
  int v763 = -350584140;
  long long v762 = xmmword_1BBE127CC;
  v178 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v764[0] = v178;
  v764[1] = @"D10";
  v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:v764 count:2];
  v176 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102015, 1001008, 1002013, 1003005, 1004007, 1005017, 1006002, 1007005, 1008001, 0);
  v175 = [v177 arrayByAddingObjectsFromArray:v176];
  v174 = (void *)[v175 copy];
  v1038[91] = v174;
  int v760 = -1418383976;
  long long v759 = xmmword_1BBE127E0;
  v173 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v761[0] = v173;
  v761[1] = @"D101";
  v172 = [MEMORY[0x1E4F1C978] arrayWithObjects:v761 count:2];
  v171 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102016, 1001008, 1002013, 1003006, 1004007, 1005017, 1006002, 1007005, 1008002, 0);
  v170 = [v172 arrayByAddingObjectsFromArray:v171];
  v169 = (void *)[v170 copy];
  v1038[92] = v169;
  int v757 = 368778837;
  long long v756 = xmmword_1BBE127F4;
  v167 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v758[0] = v167;
  v758[1] = @"D11";
  v166 = [MEMORY[0x1E4F1C978] arrayWithObjects:v758 count:2];
  v639 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102017, 1001008, 1002014, 1003005, 1004007, 1005018, 1006003, 1007005, 1008001, 0);
  v165 = [v166 arrayByAddingObjectsFromArray:v639];
  v164 = (void *)[v165 copy];
  v1038[93] = v164;
  int v754 = -1213485500;
  long long v753 = xmmword_1BBE12808;
  v163 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v755[0] = v163;
  v755[1] = @"D111";
  v162 = [MEMORY[0x1E4F1C978] arrayWithObjects:v755 count:2];
  v161 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102018, 1001008, 1002014, 1003006, 1004007, 1005018, 1006003, 1007005, 1008002, 0);
  v160 = [v162 arrayByAddingObjectsFromArray:v161];
  v159 = (void *)[v160 copy];
  v1038[94] = v159;
  int v751 = 414393924;
  long long v750 = xmmword_1BBE1281C;
  v158 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v752[0] = v158;
  v752[1] = @"D10N";
  v155 = [MEMORY[0x1E4F1C978] arrayWithObjects:v752 count:2];
  v154 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102021, 1001010, 1002019, 1003007, 1004010, 1005021, 1006002, 1007006, 1008001, 0);
  v153 = [v155 arrayByAddingObjectsFromArray:v154];
  v152 = (void *)[v153 copy];
  v1038[95] = v152;
  int v748 = 897736383;
  long long v747 = xmmword_1BBE12830;
  v151 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v749[0] = v151;
  v749[1] = @"D101N";
  v150 = [MEMORY[0x1E4F1C978] arrayWithObjects:v749 count:2];
  v149 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102022, 1001010, 1002019, 1003008, 1004010, 1005021, 1006002, 1007006, 1008002, 0);
  v148 = [v150 arrayByAddingObjectsFromArray:v149];
  v147 = (void *)[v148 copy];
  v1038[96] = v147;
  int v745 = -996295886;
  long long v744 = xmmword_1BBE12844;
  v146 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v746[0] = v146;
  v746[1] = @"D11N";
  v145 = [MEMORY[0x1E4F1C978] arrayWithObjects:v746 count:2];
  v144 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102023, 1001010, 1002020, 1003007, 1004010, 1005021, 1006004, 1007006, 1008001, 0);
  v143 = [v145 arrayByAddingObjectsFromArray:v144];
  v142 = (void *)[v143 copy];
  v1038[97] = v142;
  int v742 = -453987047;
  long long v741 = xmmword_1BBE12858;
  v141 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v743[0] = v141;
  v743[1] = @"D111N";
  v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v743 count:2];
  v139 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102024, 1001010, 1002020, 1003008, 1004010, 1005021, 1006004, 1007006, 1008002, 0);
  v138 = [v140 arrayByAddingObjectsFromArray:v139];
  v137 = (void *)[v138 copy];
  v1038[98] = v137;
  int v739 = -337121064;
  long long v738 = xmmword_1BBE1286C;
  v136 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v740[0] = v136;
  v740[1] = @"D11NM";
  v135 = [MEMORY[0x1E4F1C978] arrayWithObjects:v740 count:2];
  v648 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102025, 1001010, 1002021, 1003007, 1004010, 1005022, 1006004, 1007006, 1008001, 0);
  v134 = [v135 arrayByAddingObjectsFromArray:v648];
  v133 = (void *)[v134 copy];
  v1038[99] = v133;
  int v736 = 450980336;
  long long v735 = xmmword_1BBE12880;
  v132 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v737[0] = v132;
  v737[1] = @"D111NM";
  v131 = [MEMORY[0x1E4F1C978] arrayWithObjects:v737 count:2];
  v642 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102026, 1001010, 1002021, 1003008, 1004010, 1005022, 1006004, 1007006, 1008002, 0);
  v130 = [v131 arrayByAddingObjectsFromArray:v642];
  v129 = (void *)[v130 copy];
  v1038[100] = v129;
  int v733 = -232427879;
  long long v732 = xmmword_1BBE12894;
  v128 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v734[0] = v128;
  v734[1] = @"D211NM";
  v127 = [MEMORY[0x1E4F1C978] arrayWithObjects:v734 count:2];
  v126 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102027, 1001011, 1002024, 1003010, 1004013, 1005023, 1006005, 1007006, 1008002, 0);
  v125 = [v127 arrayByAddingObjectsFromArray:v126];
  v124 = (void *)[v125 copy];
  v1038[101] = v124;
  int v730 = 1477534141;
  long long v729 = xmmword_1BBE128A8;
  v123 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v731[0] = v123;
  v731[1] = @"D231NM";
  v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:v731 count:2];
  v222 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102028, 1001011, 1002025, 1003010, 1004013, 1005023, 1006005, 1007006, 1008002, 0);
  v121 = [v122 arrayByAddingObjectsFromArray:v222];
  v120 = (void *)[v121 copy];
  v1038[102] = v120;
  int v727 = -1843102369;
  long long v726 = xmmword_1BBE128BC;
  v119 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v728[0] = v119;
  v728[1] = @"D201NM";
  v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:v728 count:2];
  v645 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102029, 1001011, 1002026, 1003010, 1004010, 1005023, 1006005, 1007006, 1008002, 0);
  v637 = [v118 arrayByAddingObjectsFromArray:v645];
  v117 = (void *)[v637 copy];
  v1038[103] = v117;
  int v724 = -61007701;
  long long v723 = xmmword_1BBE128D0;
  v116 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v725[0] = v116;
  v725[1] = @"D321NM";
  v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:v725 count:2];
  v114 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102030, 1001013, 1002030, 1003011, 1004014, 1005026, 1006008, 1007006, 1008002, 0);
  v113 = [v115 arrayByAddingObjectsFromArray:v114];
  v112 = (void *)[v113 copy];
  v1038[104] = v112;
  int v721 = -235416490;
  long long v720 = xmmword_1BBE128E4;
  v111 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v722[0] = v111;
  v722[1] = @"D331NM";
  v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:v722 count:2];
  v109 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102031, 1001013, 1002030, 1003011, 1004014, 1005026, 1006008, 1007006, 1008002, 0);
  v108 = [v110 arrayByAddingObjectsFromArray:v109];
  v107 = (void *)[v108 copy];
  v1038[105] = v107;
  int v718 = -820493242;
  long long v717 = xmmword_1BBE128F8;
  v106 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v719[0] = v106;
  v719[1] = @"D332NM";
  v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v719 count:2];
  v104 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102032, 1001013, 1002030, 1003011, 1004014, 1005026, 1006008, 1007006, 1008002, 0);
  v103 = [v105 arrayByAddingObjectsFromArray:v104];
  v102 = (void *)[v103 copy];
  v1038[106] = v102;
  int v715 = -121925081;
  long long v714 = xmmword_1BBE1290C;
  v101 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v716[0] = v101;
  v716[1] = @"D10NM";
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v716 count:2];
  v650 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102033, 1001013, 1002019, 1003011, 1004014, 1005021, 1006002, 1007006, 1008002, 0);
  v647 = [v100 arrayByAddingObjectsFromArray:v650];
  v646 = (void *)[v647 copy];
  v1038[107] = v646;
  int v712 = 1071957977;
  long long v711 = xmmword_1BBE12920;
  v634 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v713[0] = v634;
  v713[1] = @"D421NM";
  v211 = [MEMORY[0x1E4F1C978] arrayWithObjects:v713 count:2];
  v99 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102034, 1001014, 1002030, 1003012, 1004015, 1005026, 1006010, 1007006, 1008004, 0);
  v98 = [v211 arrayByAddingObjectsFromArray:v99];
  v97 = (void *)[v98 copy];
  v1038[108] = v97;
  int v709 = 438437663;
  long long v708 = xmmword_1BBE12934;
  v96 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v710[0] = v96;
  v710[1] = @"D431NM";
  v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v710 count:2];
  v94 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102035, 1001014, 1002030, 1003012, 1004015, 1005026, 1006010, 1007006, 1008004, 0);
  v93 = [v95 arrayByAddingObjectsFromArray:v94];
  v92 = (void *)[v93 copy];
  v1038[109] = v92;
  int v706 = -382792827;
  long long v705 = xmmword_1BBE12948;
  v91 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v707[0] = v91;
  v707[1] = @"D432NM";
  v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v707 count:2];
  v89 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102036, 1001014, 1002030, 1003012, 1004015, 1005026, 1006011, 1007006, 1008004, 0);
  v88 = [v90 arrayByAddingObjectsFromArray:v89];
  v87 = (void *)[v88 copy];
  v1038[110] = v87;
  int v703 = 1575123478;
  long long v702 = xmmword_1BBE1295C;
  v86 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v704[0] = v86;
  v704[1] = @"D441NM";
  v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v704 count:2];
  v636 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102037, 1001014, 1002030, 1003012, 1004015, 1005026, 1006011, 1007006, 1008004, 0);
  v633 = [v85 arrayByAddingObjectsFromArray:v636];
  v84 = (void *)[v633 copy];
  v1038[111] = v84;
  int v700 = 123138233;
  long long v699 = xmmword_1BBE12970;
  v83 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v701[0] = v83;
  v701[1] = @"D521NM";
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v701 count:2];
  v80 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102038, 1001016, 1002030, 1003013, 1004015, 1005026, 1006014, 1007006, 1008004, 0);
  v79 = [v81 arrayByAddingObjectsFromArray:v80];
  v78 = (void *)[v79 copy];
  v1038[112] = v78;
  int v697 = 681511593;
  long long v696 = xmmword_1BBE12984;
  v77 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v698[0] = v77;
  v698[1] = @"D531NM";
  v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v698 count:2];
  v75 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102039, 1001016, 1002030, 1003013, 1004015, 1005026, 1006014, 1007006, 1008004, 0);
  v74 = [v76 arrayByAddingObjectsFromArray:v75];
  v73 = (void *)[v74 copy];
  v1038[113] = v73;
  int v694 = 713503427;
  long long v693 = xmmword_1BBE12998;
  v72 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v695[0] = v72;
  v695[1] = @"D532NM";
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v695 count:2];
  v70 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102040, 1001016, 1002030, 1003013, 1004015, 1005026, 1006015, 1007006, 1008004, 0);
  v69 = [v71 arrayByAddingObjectsFromArray:v70];
  v68 = (void *)[v69 copy];
  v1038[114] = v68;
  int v691 = -1632750650;
  long long v690 = xmmword_1BBE129AC;
  v67 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v692[0] = v67;
  v692[1] = @"D541NM";
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v692 count:2];
  v168 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102041, 1001016, 1002030, 1003013, 1004015, 1005026, 1006015, 1007006, 1008004, 0);
  v65 = [v66 arrayByAddingObjectsFromArray:v168];
  v64 = (void *)[v65 copy];
  v1038[115] = v64;
  int v688 = -1431778695;
  long long v687 = xmmword_1BBE129C0;
  v63 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v689[0] = v63;
  v689[1] = @"D10NMN";
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v689 count:2];
  v649 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102042, 1001016, 1002019, 1003014, 1004015, 1005029, 1006018, 1007006, 1008004, 0);
  v61 = [v62 arrayByAddingObjectsFromArray:v649];
  v60 = (void *)[v61 copy];
  v1038[116] = v60;
  int v685 = 533419158;
  long long v684 = xmmword_1BBE129D4;
  v59 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v686[0] = v59;
  v686[1] = @"D27";
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v686 count:2];
  v57 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102043, 1001016, 1002030, 1003015, 1004015, 1005026, 1006019, 1007005, 1008004, 0);
  v56 = [v58 arrayByAddingObjectsFromArray:v57];
  v55 = (void *)[v56 copy];
  v1038[117] = v55;
  int v682 = 1106979518;
  long long v681 = xmmword_1BBE129E8;
  v54 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v683[0] = v54;
  v683[1] = @"D28";
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v683 count:2];
  v643 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102044, 1001016, 1002030, 1003015, 1004015, 1005033, 1006019, 1007005, 1008004, 0);
  v82 = [v53 arrayByAddingObjectsFromArray:v643];
  v52 = (void *)[v82 copy];
  v1038[118] = v52;
  int v679 = -1820426635;
  long long v678 = xmmword_1BBE129FC;
  v51 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v680[0] = v51;
  v680[1] = @"D73";
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v680 count:2];
  v49 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102045, 1001018, 1002030, 1003015, 1004015, 1005026, 1006020, 1007006, 1008005, 0);
  v48 = [v50 arrayByAddingObjectsFromArray:v49];
  v47 = (void *)[v48 copy];
  v1038[119] = v47;
  int v676 = -937652876;
  long long v675 = xmmword_1BBE12A10;
  v46 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v677[0] = v46;
  v677[1] = @"D74";
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v677 count:2];
  v635 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102046, 1001018, 1002030, 1003015, 1004015, 1005026, 1006020, 1007006, 1008005, 0);
  v44 = [v45 arrayByAddingObjectsFromArray:v635];
  v43 = (void *)[v44 copy];
  v1038[120] = v43;
  int v673 = -609570151;
  long long v672 = xmmword_1BBE12A24;
  v42 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v674[0] = v42;
  v674[1] = @"D37";
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v674 count:2];
  v40 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102047, 1001018, 1002030, 1003016, 1004015, 1005034, 1006023, 1007006, 1008004, 0);
  v39 = [v41 arrayByAddingObjectsFromArray:v40];
  v38 = (void *)[v39 copy];
  v1038[121] = v38;
  int v670 = -874769875;
  long long v669 = xmmword_1BBE12A38;
  v37 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v671[0] = v37;
  v671[1] = @"D38";
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v671 count:2];
  v35 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102048, 1001018, 1002030, 1003016, 1004015, 1005035, 1006023, 1007006, 1008004, 0);
  v34 = [v36 arrayByAddingObjectsFromArray:v35];
  v33 = (void *)[v34 copy];
  v1038[122] = v33;
  int v667 = 1874287171;
  long long v666 = xmmword_1BBE12A4C;
  v32 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v668[0] = v32;
  v668[1] = @"D83";
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v668 count:2];
  v30 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102049, 1001019, 1002030, 1003016, 1004016, 1005036, 1006024, 1007006, 1008005, 0);
  v29 = [v31 arrayByAddingObjectsFromArray:v30];
  v28 = (void *)[v29 copy];
  v1038[123] = v28;
  int v664 = -781324731;
  long long v663 = xmmword_1BBE12A60;
  v27 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v665[0] = v27;
  v665[1] = @"D84";
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v665 count:2];
  v644 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102050, 1001019, 1002030, 1003016, 1004016, 1005037, 1006024, 1007006, 1008005, 0);
  v157 = [v26 arrayByAddingObjectsFromArray:v644];
  v156 = (void *)[v157 copy];
  v1038[124] = v156;
  int v661 = 1223847566;
  long long v660 = xmmword_1BBE12A74;
  v25 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v662[0] = v25;
  v662[1] = @"D47";
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v662 count:2];
  v23 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102052, 1001022, 1002030, 1003017, 1004017, 1005038, 1006026, 1007006, 1008004, 0);
  v22 = [v24 arrayByAddingObjectsFromArray:v23];
  v21 = (void *)[v22 copy];
  v1038[125] = v21;
  int v658 = 185580364;
  long long v657 = xmmword_1BBE12A88;
  v20 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v659[0] = v20;
  v659[1] = @"D48";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v659 count:2];
  v651 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102053, 1001022, 1002030, 1003017, 1004017, 1005038, 1006026, 1007006, 1008004, 0);
  v18 = [v19 arrayByAddingObjectsFromArray:v651];
  v17 = (void *)[v18 copy];
  v1038[126] = v17;
  int v655 = 1214880059;
  long long v654 = xmmword_1BBE12A9C;
  v16 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v656[0] = v16;
  v656[1] = @"D93";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v656 count:2];
  v14 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102054, 1001021, 1002030, 1003017, 1004017, 1005038, 1006027, 1007006, 1008005, 0);
  v13 = [v15 arrayByAddingObjectsFromArray:v14];
  uint64_t v3 = (void *)[v13 copy];
  v1038[127] = v3;
  uint64_t v4 = [NSNumber numberWithBool:MGIsDeviceOfType()];
  v653[0] = v4;
  v653[1] = @"D94";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v653 count:2];
  v6 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 102055, 1001021, 1002030, 1003017, 1004017, 1005038, 1006027, 1007006, 1008005, 0);
  int v7 = [v5 arrayByAddingObjectsFromArray:v6];
  v8 = (void *)[v7 copy];
  v1038[128] = v8;
  int v9 = objc_msgSend(a1, "wrapDeviceArgumentsInArray:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
  uint64_t v10 = [&unk_1F1585A90 arrayByAddingObjectsFromArray:v9];
  uint64_t v11 = (void *)[v10 copy];
  v1038[129] = v11;
  id v652 = [MEMORY[0x1E4F1C978] arrayWithObjects:v1038 count:130];

  return v652;
}

void __35__PLPlatform_kPLPlatformAttributes__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C1869120]();
  uint64_t v3 = [*(id *)(a1 + 32) kPLDeviceMap];
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [v3 objectAtIndexedSubscript:v4];
      v6 = [v5 objectAtIndexedSubscript:0];
      char v7 = [v6 BOOLValue];

      kPLPlatformAttributes_rowIndex = v4;
      if (v7) {
        break;
      }
      ++v4;
    }
    while ([v3 count] > v4);
  }
  uint64_t v8 = [v3 objectAtIndexedSubscript:kPLPlatformAttributes_rowIndex];
  int v9 = (void *)kPLPlatformAttributes_deviceInfo;
  kPLPlatformAttributes_deviceInfo = v8;
}

+ (BOOL)isDeviceClass:(int)a3
{
  return [a1 kPLDeviceClass] == a3;
}

+ (id)kPLDeviceClassName
{
  v2 = [a1 kPLPlatformAttributes];
  uint64_t v3 = [v2 objectAtIndexedSubscript:1];

  return v3;
}

+ (BOOL)isDeviceClassName:(id)a3
{
  id v4 = a3;
  id v5 = [a1 kPLDeviceClassName];

  return v5 == v4;
}

+ (BOOL)isSoCClass:(int)a3
{
  return [a1 kPLSoCClassOfDevice] == a3;
}

+ (int)kPLDisplayClassOfDevice
{
  v2 = [a1 kPLPlatformAttributes];
  uint64_t v3 = [v2 objectAtIndexedSubscript:4];
  int v4 = [v3 intValue];

  return v4;
}

+ (BOOL)isDisplayClass:(int)a3
{
  return [a1 kPLDisplayClassOfDevice] == a3;
}

+ (BOOL)isBasebandClass:(int)a3
{
  return [a1 kPLBasebandClassOfDevice] == a3;
}

+ (BOOL)isAudioClass:(int)a3
{
  return [a1 kPLAudioClassOfDevice] == a3;
}

+ (int)kPLCameraClassOfDevice
{
  v2 = [a1 kPLPlatformAttributes];
  uint64_t v3 = [v2 objectAtIndexedSubscript:8];
  int v4 = [v3 intValue];

  return v4;
}

+ (BOOL)isCameraClass:(int)a3
{
  return [a1 kPLCameraClassOfDevice] == a3;
}

+ (int)kPLTorchClassOfDevice
{
  v2 = [a1 kPLPlatformAttributes];
  uint64_t v3 = [v2 objectAtIndexedSubscript:9];
  int v4 = [v3 intValue];

  return v4;
}

+ (BOOL)isTorchClass:(int)a3
{
  return [a1 kPLTorchClassOfDevice] == a3;
}

+ (int)kPLGPSClassOfDevice
{
  v2 = [a1 kPLPlatformAttributes];
  uint64_t v3 = [v2 objectAtIndexedSubscript:10];
  int v4 = [v3 intValue];

  return v4;
}

+ (BOOL)isGPSClass:(int)a3
{
  return [a1 kPLGPSClassOfDevice] == a3;
}

+ (BOOL)isVirtualDevice
{
  if (isVirtualDevice_onceToken != -1) {
    dispatch_once(&isVirtualDevice_onceToken, &__block_literal_global_8);
  }
  return isVirtualDevice_isVirtualDevice;
}

void __29__PLPlatform_isVirtualDevice__block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  isVirtualDevice_isVirtualDevice = CFBooleanGetValue(v0) != 0;
  CFRelease(v0);
}

+ (BOOL)kPLSoCClassIsOneOf:(int)a3
{
  return [a1 kPLXIsOneOf:3 firstArg:*(void *)&a3 restOfArgs:&v4];
}

+ (BOOL)kPLDisplayClassIsOneOf:(int)a3
{
  return [a1 kPLXIsOneOf:4 firstArg:*(void *)&a3 restOfArgs:&v4];
}

+ (BOOL)kPLBasebandClassIsOneOf:(int)a3
{
  return [a1 kPLXIsOneOf:5 firstArg:*(void *)&a3 restOfArgs:&v4];
}

+ (BOOL)kPLWiFiClassIsOneOf:(int)a3
{
  return [a1 kPLXIsOneOf:6 firstArg:*(void *)&a3 restOfArgs:&v4];
}

+ (BOOL)kPLAudioClassIsOneOf:(int)a3
{
  return [a1 kPLXIsOneOf:7 firstArg:*(void *)&a3 restOfArgs:&v4];
}

+ (BOOL)kPLCameraClassIsOneOf:(int)a3
{
  return [a1 kPLXIsOneOf:8 firstArg:*(void *)&a3 restOfArgs:&v4];
}

+ (BOOL)kPLTorchClassIsOneOf:(int)a3
{
  return [a1 kPLXIsOneOf:9 firstArg:*(void *)&a3 restOfArgs:&v4];
}

+ (BOOL)kPLGPSClassIsOneOf:(int)a3
{
  return [a1 kPLXIsOneOf:10 firstArg:*(void *)&a3 restOfArgs:&v4];
}

void __28__PLPlatform_hasCapability___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(_DWORD *)(a1 + 32);
  switch(v8)
  {
    case 100018:
    case 100019:
    case 100020:
    case 100021:
    case 100026:
    case 100027:
    case 100028:
    case 100029:
    case 100040:
    case 100041:
    case 100042:
    case 100043:
    case 100044:
    case 100045:
    case 100050:
    case 100051:
    case 100052:
    case 100053:
    case 100062:
    case 100063:
    case 100064:
    case 100065:
    case 100066:
    case 100067:
    case 100068:
    case 100069:
    case 100074:
    case 100075:
    case 100076:
    case 100077:
    case 100084:
    case 100085:
    case 100086:
    case 100087:
      setCapabilities(a1, a2, 0, a4, a5, a6, a7, a8, 0);
      goto LABEL_6;
    case 100022:
    case 100023:
    case 100024:
    case 100025:
    case 100030:
    case 100031:
    case 100082:
    case 100083:
      return;
    case 100032:
    case 100033:
    case 100034:
    case 100035:
    case 100036:
    case 100037:
    case 100038:
    case 100039:
    case 100046:
    case 100047:
    case 100048:
    case 100049:
    case 100054:
    case 100055:
    case 100056:
    case 100057:
    case 100058:
    case 100059:
    case 100060:
    case 100061:
    case 100070:
    case 100071:
    case 100072:
    case 100073:
    case 100088:
    case 100089:
    case 100090:
    case 100091:
LABEL_3:
      setCapabilities(a1, a2, 0, a4, a5, a6, a7, a8, 1);
      goto LABEL_6;
    case 100078:
    case 100079:
    case 100080:
    case 100081:
LABEL_4:
      setCapabilities(a1, a2, 1, a4, a5, a6, a7, a8, 1);
LABEL_6:
      hasCapability__capabilitiesBeenSet = 1;
      break;
    default:
      switch(v8)
      {
        case 102025:
        case 102026:
        case 102027:
        case 102028:
        case 102030:
        case 102031:
        case 102034:
        case 102035:
        case 102036:
        case 102037:
        case 102038:
        case 102039:
        case 102040:
        case 102041:
        case 102043:
        case 102044:
        case 102045:
        case 102046:
        case 102047:
        case 102048:
        case 102049:
        case 102050:
        case 102052:
        case 102053:
        case 102054:
        case 102055:
        case 102056:
        case 102057:
          goto LABEL_4;
        case 102029:
        case 102032:
          goto LABEL_3;
        default:
          return;
      }
  }
}

+ (BOOL)is64Bit
{
  if (is64Bit_onceToken != -1) {
    dispatch_once(&is64Bit_onceToken, &__block_literal_global_494);
  }
  return is64Bit__is64Bit;
}

uint64_t __21__PLPlatform_is64Bit__block_invoke()
{
  host_t v0 = MEMORY[0x1C1869040]();
  long long v4 = 0u;
  long long v5 = 0u;
  *(_OWORD *)host_info_out = 0u;
  mach_msg_type_number_t host_info_outCnt = 12;
  uint64_t result = host_info(v0, 1, host_info_out, &host_info_outCnt);
  if (!result && HIBYTE(host_info_out[3]) == 1) {
    is64Bit__is64Bit = 1;
  }
  return result;
}

+ (BOOL)hasNFC
{
  if (hasNFC_onceToken != -1) {
    dispatch_once(&hasNFC_onceToken, &__block_literal_global_496);
  }
  return hasNFC_hasNfc;
}

void __20__PLPlatform_hasNFC__block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  hasNFC_hasNfc = CFBooleanGetValue(v0) != 0;
  CFRelease(v0);
}

+ (BOOL)hasLPEM
{
  if (hasLPEM_onceToken != -1) {
    dispatch_once(&hasLPEM_onceToken, &__block_literal_global_501);
  }
  return hasLPEM_supportsLPEM;
}

uint64_t __21__PLPlatform_hasLPEM__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasLPEM_supportsLPEM = result;
  return result;
}

+ (BOOL)hasOrb
{
  return +[PLPlatform kPLDeviceClassIsOneOf:](PLPlatform, "kPLDeviceClassIsOneOf:", 100019, 102011, 102009, 0);
}

+ (BOOL)hasBaseband
{
  return +[PLPlatform kPLBasebandClassOfDevice] != -1;
}

+ (BOOL)hasAOT
{
  if (hasAOT_onceToken != -1) {
    dispatch_once(&hasAOT_onceToken, &__block_literal_global_506);
  }
  return hasAOT_result;
}

uint64_t __20__PLPlatform_hasAOT__block_invoke()
{
  uint64_t result = +[PLPlatform isWatch];
  if (result) {
    uint64_t result = MGGetBoolAnswer();
  }
  hasAOT_uint64_t result = result;
  return result;
}

uint64_t __20__PLPlatform_hasAOD__block_invoke()
{
  uint64_t result = +[PLModelingUtilities isiPhone];
  if (result) {
    uint64_t result = MGGetBoolAnswer();
  }
  hasAOD_uint64_t result = result;
  return result;
}

+ (BOOL)hasSleepMedia
{
  if (hasSleepMedia_onceToken != -1) {
    dispatch_once(&hasSleepMedia_onceToken, &__block_literal_global_514);
  }
  return 0;
}

+ (BOOL)hasDCP
{
  if (hasDCP_onceToken != -1) {
    dispatch_once(&hasDCP_onceToken, &__block_literal_global_516);
  }
  return hasDCP_isDCPSupported;
}

uint64_t __20__PLPlatform_hasDCP__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasDCP_isDCPSupported = result;
  return result;
}

+ (BOOL)hasOLED
{
  if (hasOLED_onceToken != -1) {
    dispatch_once(&hasOLED_onceToken, &__block_literal_global_521);
  }
  return hasOLED_isOLEDSupported;
}

uint64_t __21__PLPlatform_hasOLED__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasOLED_isOLEDSupported = result;
  return result;
}

+ (BOOL)hasGenerativeModelSystems
{
  if (hasGenerativeModelSystems_onceToken != -1) {
    dispatch_once(&hasGenerativeModelSystems_onceToken, &__block_literal_global_526);
  }
  return hasGenerativeModelSystems_supportsGMS;
}

uint64_t __39__PLPlatform_hasGenerativeModelSystems__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasGenerativeModelSystems_supportsGMS = result;
  return result;
}

+ (BOOL)hasANE
{
  if (hasANE_onceToken != -1) {
    dispatch_once(&hasANE_onceToken, &__block_literal_global_531);
  }
  return hasANE___hasAppleNeuralEngineSupport;
}

uint64_t __20__PLPlatform_hasANE__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasANE___hasAppleNeuralEngineSupport = result;
  return result;
}

BOOL __20__PLPlatform_isiPod__block_invoke()
{
  BOOL result = +[PLModelingUtilities isiPod];
  isiPod_isiPod = result;
  return result;
}

+ (BOOL)isiPad
{
  if (isiPad_onceToken != -1) {
    dispatch_once(&isiPad_onceToken, &__block_literal_global_538);
  }
  return isiPad_isiPad;
}

BOOL __20__PLPlatform_isiPad__block_invoke()
{
  BOOL result = +[PLModelingUtilities isiPad];
  isiPad_isiPad = result;
  return result;
}

BOOL __22__PLPlatform_isiPhone__block_invoke()
{
  BOOL result = +[PLModelingUtilities isiPhone];
  isiPhone_isiPhone = result;
  return result;
}

BOOL __19__PLPlatform_isiOS__block_invoke()
{
  BOOL result = +[PLPlatform isiPhone]
        || +[PLPlatform isiPad]
        || +[PLPlatform isiPod];
  isiOS_isiOS = result;
  return result;
}

+ (BOOL)isWatch
{
  if (isWatch_onceToken != -1) {
    dispatch_once(&isWatch_onceToken, &__block_literal_global_544);
  }
  return isWatch_isWatch;
}

BOOL __21__PLPlatform_isWatch__block_invoke()
{
  BOOL result = +[PLModelingUtilities isWatch];
  isWatch_isWatch = result;
  return result;
}

+ (BOOL)isMac
{
  return +[PLModelingUtilities isMac];
}

+ (BOOL)isARMMac
{
  return +[PLModelingUtilities isARMMac];
}

+ (BOOL)isTVOS
{
  return +[PLModelingUtilities isTVOS];
}

+ (BOOL)isAppleTV
{
  if (isAppleTV_onceToken != -1) {
    dispatch_once(&isAppleTV_onceToken, &__block_literal_global_546);
  }
  return isAppleTV_isAppleTV;
}

BOOL __23__PLPlatform_isAppleTV__block_invoke()
{
  BOOL result = +[PLModelingUtilities isAppleTV];
  isAppleTV_isAppleTV = result;
  return result;
}

+ (BOOL)isAppleVision
{
  return +[PLModelingUtilities isAppleVision];
}

+ (BOOL)isArchARM
{
  return 1;
}

BOOL __27__PLPlatform_internalBuild__block_invoke()
{
  BOOL result = +[PLModelingUtilities internalBuild];
  internalBuild_BOOL result = result;
  return result;
}

+ (BOOL)carrierBuild
{
  if (carrierBuild_onceToken != -1) {
    dispatch_once(&carrierBuild_onceToken, &__block_literal_global_550);
  }
  return carrierBuild_carrierBuild;
}

BOOL __26__PLPlatform_carrierBuild__block_invoke()
{
  BOOL result = +[PLModelingUtilities carrierBuild];
  carrierBuild_carrierBuild = result;
  return result;
}

+ (BOOL)seedBuild
{
  return 0;
}

+ (BOOL)nonUIBuild
{
  if (nonUIBuild_onceToken != -1) {
    dispatch_once(&nonUIBuild_onceToken, &__block_literal_global_552);
  }
  return nonUIBuild_nonUIBuild;
}

void __24__PLPlatform_nonUIBuild__block_invoke()
{
  CFBooleanRef v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    nonUIBuild_nonUIBuild = [v0 isEqualToString:@"NonUI"];
    CFRelease(v1);
  }
  else
  {
    nonUIBuild_nonUIBuild = 0;
  }
}

+ (BOOL)isBasebandMavLeg
{
  if (isBasebandMavLeg_onceToken != -1) {
    dispatch_once(&isBasebandMavLeg_onceToken, &__block_literal_global_560);
  }
  return isBasebandMavLeg_result;
}

BOOL __30__PLPlatform_isBasebandMavLeg__block_invoke()
{
  BOOL result = +[PLPlatform kPLBasebandClassIsOneOf:](PLPlatform, "kPLBasebandClassIsOneOf:", 1003003, 1003004, 1003005, 1003007, 0);
  isBasebandMavLeg_BOOL result = result;
  return result;
}

+ (BOOL)isBasebandIce
{
  if (isBasebandIce_onceToken != -1) {
    dispatch_once(&isBasebandIce_onceToken, &__block_literal_global_562);
  }
  return isBasebandIce_result;
}

BOOL __27__PLPlatform_isBasebandIce__block_invoke()
{
  BOOL result = +[PLPlatform kPLBasebandClassIsOneOf:](PLPlatform, "kPLBasebandClassIsOneOf:", 1003006, 1003008, 1003010, 1003011, 0);
  isBasebandIce_BOOL result = result;
  return result;
}

+ (BOOL)isBasebandIBIS
{
  if (isBasebandIBIS_onceToken != -1) {
    dispatch_once(&isBasebandIBIS_onceToken, &__block_literal_global_564);
  }
  return isBasebandIBIS_result;
}

BOOL __28__PLPlatform_isBasebandIBIS__block_invoke()
{
  BOOL result = +[PLPlatform kPLBasebandClassIsOneOf:](PLPlatform, "kPLBasebandClassIsOneOf:", 1003009, 0);
  isBasebandIBIS_BOOL result = result;
  return result;
}

BOOL __27__PLPlatform_isBasebandMav__block_invoke()
{
  BOOL result = +[PLPlatform kPLBasebandClassIsOneOf:](PLPlatform, "kPLBasebandClassIsOneOf:", 1003012, 1003013, 1003014, 1003015, 1003016, 1003017, 0);
  isBasebandMav_BOOL result = result;
  return result;
}

+ (BOOL)isBasebandProto
{
  return 0;
}

BOOL __28__PLPlatform_isBasebandDSDS__block_invoke()
{
  BOOL result = +[PLPlatform kPLBasebandClassIsOneOf:](PLPlatform, "kPLBasebandClassIsOneOf:", 1003010, 1003011, 1003012, 1003013, 1003014, 1003015, 1003016, 1003017, 0);
  isBasebandDSDS_BOOL result = result;
  return result;
}

+ (id)wrapDeviceArgumentsInArray:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    long long v5 = [NSNumber numberWithInt:v3];
    [v4 addObject:v5];

    int v9 = &v12;
    if (v11)
    {
      do
      {
        v6 = objc_msgSend(NSNumber, "numberWithInt:");
        [v4 addObject:v6];

        char v7 = v9++;
      }
      while (*(_DWORD *)v7);
    }
  }
  return v4;
}

@end