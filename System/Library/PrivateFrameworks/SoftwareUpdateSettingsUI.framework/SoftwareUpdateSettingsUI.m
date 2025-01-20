uint64_t SUSUISettingsIsBadgedForSoftwareUpdate()
{
  char v1;
  id v2;

  v2 = (id)[MEMORY[0x263F78238] sharedController];
  v1 = [v2 isBadgeOnlyFollowUpCurrentlyBeingPresented];
  objc_storeStrong(&v2, 0);
  return v1 & 1;
}

uint64_t __os_log_helper_16_2_2_8_32_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

id SUSettingsSharedLogger()
{
  predicate = (dispatch_once_t *)&onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)sharedLogger;
  return v0;
}

void __SUSettingsSharedLogger_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F77DE8]) initWithCategory:@"SUSettings"];
  v1 = (void *)sharedLogger;
  sharedLogger = v0;
}

__CFString *SUSettingsUIStateToString(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    char v1 = 1;
  }
  else
  {
    uint64_t v2 = 0;
    char v1 = 0;
  }
  if (v1)
  {
    v4 = @"Unknown";
  }
  else
  {
    switch(v2)
    {
      case 0:
        v4 = @"Idle";
        break;
      case 1:
        v4 = @"CheckingForAvailableUpdate";
        break;
      case 2:
        v4 = @"ScanFailed";
        break;
      case 3:
        v4 = @"NoUpdateFound";
        break;
      case 4:
        v4 = @"UpdatesAvailable";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v4;
}

void sub_228408838()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t result = a13;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 22;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  return result;
}

uint64_t __os_log_helper_16_2_26_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_66_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t result = a17;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 26;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 66;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  *(unsigned char *)(a1 + 242) = 66;
  *(unsigned char *)(a1 + 243) = 8;
  *(void *)(a1 + 244) = a26;
  *(unsigned char *)(a1 + 252) = 0;
  *(unsigned char *)(a1 + 253) = 8;
  *(void *)(a1 + 254) = a27;
  return result;
}

void sub_22840C274()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result = a15;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 24;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 66;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 2;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

id getSUNetworkMonitorClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUNetworkMonitorClass_softClass;
  uint64_t v13 = getSUNetworkMonitorClass_softClass;
  if (!getSUNetworkMonitorClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUNetworkMonitorClass_block_invoke;
    v6 = &unk_26483C080;
    v7 = &v9;
    __getSUNetworkMonitorClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_2284113CC()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_32_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t result = a14;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 23;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 66;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,uint64_t a25)
{
  uint64_t result = a15;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 24;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 0;
  *(unsigned char *)(a1 + 223) = 4;
  *(_DWORD *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 228) = 66;
  *(unsigned char *)(a1 + 229) = 8;
  *(void *)(a1 + 230) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24)
{
  uint64_t result = a15;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 23;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 0;
  *(unsigned char *)(a1 + 223) = 4;
  *(_DWORD *)(a1 + 224) = a24;
  return result;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_4_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,uint64_t a26)
{
  uint64_t result = a16;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 25;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 0;
  *(unsigned char *)(a1 + 223) = 4;
  *(_DWORD *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 228) = 0;
  *(unsigned char *)(a1 + 229) = 4;
  *(_DWORD *)(a1 + 230) = a25;
  *(unsigned char *)(a1 + 234) = 66;
  *(unsigned char *)(a1 + 235) = 8;
  *(void *)(a1 + 236) = a26;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result = a15;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 24;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 66;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 66;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_34_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result = a15;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 24;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 34;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 66;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  return result;
}

void sub_228423DBC()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result = a15;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 24;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 0;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_26_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t result = a17;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 26;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 66;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  *(unsigned char *)(a1 + 242) = 0;
  *(unsigned char *)(a1 + 243) = 8;
  *(void *)(a1 + 244) = a26;
  *(unsigned char *)(a1 + 252) = 66;
  *(unsigned char *)(a1 + 253) = 8;
  *(void *)(a1 + 254) = a27;
  return result;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t result = a16;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 25;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 66;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  *(unsigned char *)(a1 + 242) = 0;
  *(unsigned char *)(a1 + 243) = 8;
  *(void *)(a1 + 244) = a26;
  return result;
}

uint64_t __os_log_helper_16_2_26_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66_8_34_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t result = a17;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 26;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 66;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 66;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  *(unsigned char *)(a1 + 242) = 34;
  *(unsigned char *)(a1 + 243) = 8;
  *(void *)(a1 + 244) = a26;
  *(unsigned char *)(a1 + 252) = 66;
  *(unsigned char *)(a1 + 253) = 8;
  *(void *)(a1 + 254) = a27;
  return result;
}

void sub_22842A728()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_28_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_64_4_0_8_66_4_0_8_66_4_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,uint64_t a26,int a27,uint64_t a28,int a29)
{
  uint64_t result = a20;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 28;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 64;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 233) = 4;
  *(_DWORD *)(a1 + 234) = a25;
  *(unsigned char *)(a1 + 238) = 66;
  *(unsigned char *)(a1 + 239) = 8;
  *(void *)(a1 + 240) = a26;
  *(unsigned char *)(a1 + 248) = 0;
  *(unsigned char *)(a1 + 249) = 4;
  *(_DWORD *)(a1 + 250) = a27;
  *(unsigned char *)(a1 + 254) = 66;
  *(unsigned char *)(a1 + 255) = 8;
  *(void *)(a1 + 256) = a28;
  *(unsigned char *)(a1 + 264) = 0;
  *(unsigned char *)(a1 + 265) = 4;
  *(_DWORD *)(a1 + 266) = a29;
  return result;
}

void sub_22842D36C()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_32_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result = a15;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 24;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 66;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_66_8_0_8_66_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 0;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t result = a16;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 25;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 66;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  *(unsigned char *)(a1 + 242) = 66;
  *(unsigned char *)(a1 + 243) = 8;
  *(void *)(a1 + 244) = a26;
  return result;
}

id getSUErrorDomain()
{
  SUErrorDomainSymbolLoc = (void **)getSUErrorDomainSymbolLoc();
  if (!SUErrorDomainSymbolLoc)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *SUErrorDomainSymbolLoc;
  return v0;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t result = a16;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 25;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 66;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  *(unsigned char *)(a1 + 242) = 32;
  *(unsigned char *)(a1 + 243) = 8;
  *(void *)(a1 + 244) = a26;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_4_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25)
{
  uint64_t result = a15;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 24;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 0;
  *(unsigned char *)(a1 + 223) = 4;
  *(_DWORD *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 228) = 0;
  *(unsigned char *)(a1 + 229) = 4;
  *(_DWORD *)(a1 + 230) = a25;
  return result;
}

void sub_228436EEC()
{
  _Unwind_Resume(v0);
}

void sub_22843902C()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_27_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66_8_0_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t result = a18;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 27;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 0;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 66;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  *(unsigned char *)(a1 + 242) = 66;
  *(unsigned char *)(a1 + 243) = 8;
  *(void *)(a1 + 244) = a26;
  *(unsigned char *)(a1 + 252) = 0;
  *(unsigned char *)(a1 + 253) = 8;
  *(void *)(a1 + 254) = a27;
  *(unsigned char *)(a1 + 262) = 0;
  *(unsigned char *)(a1 + 263) = 8;
  *(void *)(a1 + 264) = a28;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_32_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result = a15;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 24;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 32;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 66;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t result = a16;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 25;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 32;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 66;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  *(unsigned char *)(a1 + 242) = 66;
  *(unsigned char *)(a1 + 243) = 8;
  *(void *)(a1 + 244) = a26;
  return result;
}

void sub_2284414C4()
{
  _Unwind_Resume(v0);
}

void sub_228441810()
{
  _Unwind_Resume(v0);
}

void sub_228441B68()
{
  _Unwind_Resume(v0);
}

void sub_228441EA8()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t result = a16;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 25;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 66;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 66;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 0;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 34;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 34;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 34;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  *(unsigned char *)(a1 + 182) = 0;
  *(unsigned char *)(a1 + 183) = 8;
  *(void *)(a1 + 184) = a20;
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 193) = 8;
  *(void *)(a1 + 194) = a21;
  *(unsigned char *)(a1 + 202) = 0;
  *(unsigned char *)(a1 + 203) = 8;
  *(void *)(a1 + 204) = a22;
  *(unsigned char *)(a1 + 212) = 0;
  *(unsigned char *)(a1 + 213) = 8;
  *(void *)(a1 + 214) = a23;
  *(unsigned char *)(a1 + 222) = 0;
  *(unsigned char *)(a1 + 223) = 8;
  *(void *)(a1 + 224) = a24;
  *(unsigned char *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 233) = 8;
  *(void *)(a1 + 234) = a25;
  *(unsigned char *)(a1 + 242) = 66;
  *(unsigned char *)(a1 + 243) = 8;
  *(void *)(a1 + 244) = a26;
  return result;
}

void sub_2284446A0()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_7_8_32_8_66_8_0_8_66_8_66_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 7;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 66;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 0;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 66;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  return result;
}

uint64_t __os_log_helper_16_2_7_8_66_8_66_8_0_8_66_8_0_8_32_8_32(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 7;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 32;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 32;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  return result;
}

uint64_t __getSUNetworkMonitorClass_block_invoke(uint64_t a1)
{
  SoftwareUpdateServicesLibrary();
  Class Class = objc_getClass("SUNetworkMonitor");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUNetworkMonitorClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary()
{
  uint64_t updated = SoftwareUpdateServicesLibraryCore();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary) {
    __SoftwareUpdateServicesLibraryCore_block_invoke();
  }
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary;
}

uint64_t __SoftwareUpdateServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t getSUErrorDomainSymbolLoc()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getSUErrorDomainSymbolLoc_ptr;
  uint64_t v13 = getSUErrorDomainSymbolLoc_ptr;
  if (!getSUErrorDomainSymbolLoc_ptr)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke;
    v6 = &unk_26483C080;
    v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary();
  uint64_t v2 = dlsym(updated, "SUErrorDomain");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *SUSettingsUserInteractionResponseTypeToString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"Disagree";
    }
    else if (a1 == 2)
    {
      uint64_t v2 = @"Cancel";
    }
    else
    {
      uint64_t v2 = @"Unknown";
    }
  }
  else
  {
    uint64_t v2 = @"Agree";
  }
  return v2;
}

uint64_t __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 14;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  *(unsigned char *)(result + 82) = 0;
  *(unsigned char *)(result + 83) = 8;
  *(void *)(result + 84) = a10;
  *(unsigned char *)(result + 92) = 66;
  *(unsigned char *)(result + 93) = 8;
  *(void *)(result + 94) = a11;
  *(unsigned char *)(result + 102) = 0;
  *(unsigned char *)(result + 103) = 8;
  *(void *)(result + 104) = a12;
  *(unsigned char *)(result + 112) = 34;
  *(unsigned char *)(result + 113) = 8;
  *(void *)(result + 114) = a13;
  *(unsigned char *)(result + 122) = 66;
  *(unsigned char *)(result + 123) = 8;
  *(void *)(result + 124) = a14;
  *(unsigned char *)(result + 132) = 66;
  *(unsigned char *)(result + 133) = 8;
  *(void *)(result + 134) = a15;
  return result;
}

uint64_t __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_32_8_32(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 14;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  *(unsigned char *)(result + 82) = 0;
  *(unsigned char *)(result + 83) = 8;
  *(void *)(result + 84) = a10;
  *(unsigned char *)(result + 92) = 66;
  *(unsigned char *)(result + 93) = 8;
  *(void *)(result + 94) = a11;
  *(unsigned char *)(result + 102) = 0;
  *(unsigned char *)(result + 103) = 8;
  *(void *)(result + 104) = a12;
  *(unsigned char *)(result + 112) = 34;
  *(unsigned char *)(result + 113) = 8;
  *(void *)(result + 114) = a13;
  *(unsigned char *)(result + 122) = 32;
  *(unsigned char *)(result + 123) = 8;
  *(void *)(result + 124) = a14;
  *(unsigned char *)(result + 132) = 32;
  *(unsigned char *)(result + 133) = 8;
  *(void *)(result + 134) = a15;
  return result;
}

uint64_t __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 12;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  *(unsigned char *)(result + 82) = 0;
  *(unsigned char *)(result + 83) = 8;
  *(void *)(result + 84) = a10;
  *(unsigned char *)(result + 92) = 66;
  *(unsigned char *)(result + 93) = 8;
  *(void *)(result + 94) = a11;
  *(unsigned char *)(result + 102) = 0;
  *(unsigned char *)(result + 103) = 8;
  *(void *)(result + 104) = a12;
  *(unsigned char *)(result + 112) = 34;
  *(unsigned char *)(result + 113) = 8;
  *(void *)(result + 114) = a13;
  return result;
}

__CFString *SUSettingsDescriptorStateToString(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    char v1 = 1;
  }
  else
  {
    uint64_t v2 = 0;
    char v1 = 0;
  }
  if ((v1 & 1) == 0)
  {
    switch(v2)
    {
      case 0:
        break;
      case 1:
        int v4 = @"AvailableToDownload";
        goto LABEL_12;
      case 2:
        int v4 = @"Downloading";
        goto LABEL_12;
      case 3:
        int v4 = @"DownloadStalled";
        goto LABEL_12;
      case 4:
        int v4 = @"AvailableToInstall";
        goto LABEL_12;
      case 5:
        int v4 = @"Installing";
        goto LABEL_12;
      default:
        JUMPOUT(0);
    }
  }
  int v4 = @"Unknown";
LABEL_12:
  return v4;
}

__CFString *SUSettingsDescriptorTypeToString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v2 = @"Alternate";
    }
    else {
      uint64_t v2 = @"Unknown";
    }
  }
  else
  {
    uint64_t v2 = @"Preferred";
  }
  return v2;
}

uint64_t __os_log_helper_16_2_2_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

unsigned char *__os_log_helper_16_0_0(unsigned char *result)
{
  *uint64_t result = 0;
  result[1] = 0;
  return result;
}

uint64_t SUPrefsDownloadPhaseIsStalled(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  IsStalledSymbolLoc = (uint64_t (*)(id))getSUDownloadPhaseIsStalledSymbolLoc();
  if (!IsStalledSymbolLoc)
  {
    dlerror();
    abort_report_np();
  }
  char v2 = IsStalledSymbolLoc(location);
  objc_storeStrong(&location, 0);
  return v2 & 1;
}

uint64_t __os_log_helper_16_2_6_8_32_8_66_8_66_8_0_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 66;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 0;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_8_8_32_8_66_8_66_8_0_8_66_8_0_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 8;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 66;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 0;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 66;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  return result;
}

uint64_t __os_log_helper_16_2_8_8_32_8_66_8_66_8_0_8_66_8_0_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 8;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 66;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 0;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 66;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 0;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_66_8_66_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 66;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

id getSUErrorDomain_0()
{
  SUErrorDomainSymbolLoc_0 = (void **)getSUErrorDomainSymbolLoc_0();
  if (!SUErrorDomainSymbolLoc_0)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *SUErrorDomainSymbolLoc_0;
  return v0;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

id getkSUInstallationConstraintsUnmetKey()
{
  char v2 = (void **)getkSUInstallationConstraintsUnmetKeySymbolLoc();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *v2;
  return v0;
}

uint64_t getSUDownloadPhaseIsStalledSymbolLoc()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getSUDownloadPhaseIsStalledSymbolLoc_ptr;
  uint64_t v13 = getSUDownloadPhaseIsStalledSymbolLoc_ptr;
  if (!getSUDownloadPhaseIsStalledSymbolLoc_ptr)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke;
    v6 = &unk_26483C080;
    v7 = &v9;
    __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_0();
  uint64_t v2 = dlsym(updated, "SUDownloadPhaseIsStalled");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getSUDownloadPhaseIsStalledSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_0()
{
  uint64_t updated = SoftwareUpdateServicesLibraryCore_0();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_0()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_0) {
    __SoftwareUpdateServicesLibraryCore_block_invoke_0();
  }
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_0;
}

uint64_t __SoftwareUpdateServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t getSUErrorDomainSymbolLoc_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getSUErrorDomainSymbolLoc_ptr_0;
  uint64_t v13 = getSUErrorDomainSymbolLoc_ptr_0;
  if (!getSUErrorDomainSymbolLoc_ptr_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke_0;
    v6 = &unk_26483C080;
    v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_0();
  uint64_t v2 = dlsym(updated, "SUErrorDomain");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkSUInstallationConstraintsUnmetKeySymbolLoc()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr;
  uint64_t v13 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr;
  if (!getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke;
    v6 = &unk_26483C080;
    v7 = &v9;
    __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_0();
  uint64_t v2 = dlsym(updated, "kSUInstallationConstraintsUnmetKey");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *SUBetaUpdatesRestrictionToString(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1;
  if (a1)
  {
    if (a1 == 1)
    {
      v5 = @"Lockdown";
    }
    else if (a1 == 2)
    {
      v5 = @"MDM";
    }
    else
    {
      id location = _SUSUILoggingFacility();
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_0((uint64_t)v6, (uint64_t)"NSString *const  _Nonnull SUBetaUpdatesRestrictionToString(SUBetaUpdatesRestriction)", v4);
        _os_log_error_impl(&dword_228401000, (os_log_t)location, OS_LOG_TYPE_ERROR, "%s: Un-mapped restriction %ld", v6, 0x16u);
      }
      objc_storeStrong(&location, 0);
      v5 = (__CFString *)(id)objc_msgSend(NSString, "stringWithFormat:", @"N/A (restriction: %ld)", v4);
    }
  }
  else
  {
    v5 = @"None";
  }
  uint64_t v1 = v5;
  return v1;
}

uint64_t __os_log_helper_16_2_2_8_32_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

id getSUSUIUserDefaultsKeysClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSUIUserDefaultsKeysClass_softClass;
  uint64_t v13 = getSUSUIUserDefaultsKeysClass_softClass;
  if (!getSUSUIUserDefaultsKeysClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSUIUserDefaultsKeysClass_block_invoke;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSUIUserDefaultsKeysClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_22844E740(uint64_t a1, int a2)
{
  *(void *)(v2 - 24) = a1;
  *(_DWORD *)(v2 - 28) = a2;
  if (*(_DWORD *)(v2 - 28) == 1)
  {
    *(void *)(v2 - 40) = objc_begin_catch(*(void **)(v2 - 24));
    objc_storeStrong((id *)(v2 - 40), 0);
    objc_end_catch();
    JUMPOUT(0x22844E710);
  }
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 24));
}

id getSUSMKTestCaseSessionPhaseUtilityClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKTestCaseSessionPhaseUtilityClass_softClass;
  uint64_t v13 = getSUSMKTestCaseSessionPhaseUtilityClass_softClass;
  if (!getSUSMKTestCaseSessionPhaseUtilityClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKTestCaseSessionPhaseUtilityClass_block_invoke;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKTestCaseSessionPhaseUtilityClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUSMKMockedServiceTypeUtilityClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKMockedServiceTypeUtilityClass_softClass;
  uint64_t v13 = getSUSMKMockedServiceTypeUtilityClass_softClass;
  if (!getSUSMKMockedServiceTypeUtilityClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKMockedServiceTypeUtilityClass_block_invoke;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKMockedServiceTypeUtilityClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUSMKUserDefaultsCodedMockedStrategyClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKUserDefaultsCodedMockedStrategyClass_softClass;
  uint64_t v13 = getSUSMKUserDefaultsCodedMockedStrategyClass_softClass;
  if (!getSUSMKUserDefaultsCodedMockedStrategyClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKUserDefaultsCodedMockedStrategyClass_block_invoke;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKUserDefaultsCodedMockedStrategyClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_3_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __getSUSUIUserDefaultsKeysClass_block_invoke(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary();
  Class Class = objc_getClass("SUSUIUserDefaultsKeys");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSUIUserDefaultsKeysClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary()
{
  uint64_t updated = SoftwareUpdateSettingsMockingKitLibraryCore();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary) {
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke();
  }
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary;
}

uint64_t __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __getSUSMKTestCaseSessionPhaseUtilityClass_block_invoke(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary();
  Class Class = objc_getClass("SUSMKTestCaseSessionPhaseUtility");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKTestCaseSessionPhaseUtilityClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSUSMKMockedServiceTypeUtilityClass_block_invoke(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary();
  Class Class = objc_getClass("SUSMKMockedServiceTypeUtility");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKMockedServiceTypeUtilityClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSUSMKUserDefaultsCodedMockedStrategyClass_block_invoke(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary();
  Class Class = objc_getClass("SUSMKUserDefaultsCodedMockedStrategy");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKUserDefaultsCodedMockedStrategyClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_228454270()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_32_8_32_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 32;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_228455DE0(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  *(void *)(v11 - 56) = a1;
  *(_DWORD *)(v11 - 60) = a2;
  objc_destroyWeak((id *)(v11 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 56));
}

uint64_t __os_log_helper_16_2_2_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

id getkSUDownloadPhasePreparingForInstallation()
{
  uint64_t v2 = (void **)getkSUDownloadPhasePreparingForInstallationSymbolLoc();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *v2;
  return v0;
}

uint64_t getkSUDownloadPhasePreparingForInstallationSymbolLoc()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr;
  uint64_t v13 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr;
  if (!getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_1();
  uint64_t v2 = dlsym(updated, "kSUDownloadPhasePreparingForInstallation");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_1()
{
  uint64_t updated = SoftwareUpdateServicesLibraryCore_1();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_1()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_1) {
    __SoftwareUpdateServicesLibraryCore_block_invoke_1();
  }
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_1;
}

uint64_t __SoftwareUpdateServicesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateServicesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

uint64_t __os_log_helper_16_2_16_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64_8_0_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 16;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  *(unsigned char *)(result + 82) = 0;
  *(unsigned char *)(result + 83) = 8;
  *(void *)(result + 84) = a10;
  *(unsigned char *)(result + 92) = 66;
  *(unsigned char *)(result + 93) = 8;
  *(void *)(result + 94) = a11;
  *(unsigned char *)(result + 102) = 0;
  *(unsigned char *)(result + 103) = 8;
  *(void *)(result + 104) = a12;
  *(unsigned char *)(result + 112) = 34;
  *(unsigned char *)(result + 113) = 8;
  *(void *)(result + 114) = a13;
  *(unsigned char *)(result + 122) = 64;
  *(unsigned char *)(result + 123) = 8;
  *(void *)(result + 124) = a14;
  *(unsigned char *)(result + 132) = 0;
  *(unsigned char *)(result + 133) = 8;
  *(void *)(result + 134) = a15;
  *(unsigned char *)(result + 142) = 64;
  *(unsigned char *)(result + 143) = 8;
  *(void *)(result + 144) = a16;
  *(unsigned char *)(result + 152) = 0;
  *(unsigned char *)(result + 153) = 8;
  *(void *)(result + 154) = a17;
  return result;
}

uint64_t __os_log_helper_16_2_18_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_0_8_64_8_0_8_64_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t result = a9;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 18;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 0;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 0;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 66;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 0;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 66;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 0;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 64;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 0;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 64;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 0;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  return result;
}

uint64_t __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 14;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  *(unsigned char *)(result + 82) = 0;
  *(unsigned char *)(result + 83) = 8;
  *(void *)(result + 84) = a10;
  *(unsigned char *)(result + 92) = 66;
  *(unsigned char *)(result + 93) = 8;
  *(void *)(result + 94) = a11;
  *(unsigned char *)(result + 102) = 0;
  *(unsigned char *)(result + 103) = 8;
  *(void *)(result + 104) = a12;
  *(unsigned char *)(result + 112) = 34;
  *(unsigned char *)(result + 113) = 8;
  *(void *)(result + 114) = a13;
  *(unsigned char *)(result + 122) = 66;
  *(unsigned char *)(result + 123) = 8;
  *(void *)(result + 124) = a14;
  *(unsigned char *)(result + 132) = 0;
  *(unsigned char *)(result + 133) = 8;
  *(void *)(result + 134) = a15;
  return result;
}

uint64_t __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_4_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 14;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  *(unsigned char *)(result + 82) = 0;
  *(unsigned char *)(result + 83) = 8;
  *(void *)(result + 84) = a10;
  *(unsigned char *)(result + 92) = 66;
  *(unsigned char *)(result + 93) = 8;
  *(void *)(result + 94) = a11;
  *(unsigned char *)(result + 102) = 0;
  *(unsigned char *)(result + 103) = 8;
  *(void *)(result + 104) = a12;
  *(unsigned char *)(result + 112) = 34;
  *(unsigned char *)(result + 113) = 8;
  *(void *)(result + 114) = a13;
  *(unsigned char *)(result + 122) = 0;
  *(unsigned char *)(result + 123) = 4;
  *(_DWORD *)(result + 124) = a14;
  *(unsigned char *)(result + 128) = 66;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  return result;
}

void system_root_status(unsigned char *a1, unsigned char *a2)
{
  v5 = (dispatch_once_t *)&system_root_status_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_694);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  if (a1) {
    *a1 = system_root_status_is_live_fs & 1;
  }
  if (a2) {
    *a2 = system_root_status_darwinup & 1;
  }
}

uint64_t __os_log_helper_16_0_1_8_0(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

id getkSUDownloadPhasePreparingForInstallation_0()
{
  uint64_t v2 = (void **)getkSUDownloadPhasePreparingForInstallationSymbolLoc_0();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *v2;
  return v0;
}

void sub_2284683B0()
{
  _Unwind_Resume(v0);
}

id getSUErrorDomain_1()
{
  SUErrorDomainSymbolLoc_1 = (void **)getSUErrorDomainSymbolLoc_1();
  if (!SUErrorDomainSymbolLoc_1)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *SUErrorDomainSymbolLoc_1;
  return v0;
}

id getkSUInstallationConstraintsUnmetKey_0()
{
  uint64_t v2 = (void **)getkSUInstallationConstraintsUnmetKeySymbolLoc_0();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *v2;
  return v0;
}

uint64_t __os_log_helper_16_2_3_8_0_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void __system_root_status_block_invoke(NSObject *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  oslog[2] = a1;
  oslog[1] = a1;
  bzero(&v11, 0x200uLL);
  bzero(&v11, 0x878uLL);
  if (statfs("/", &v11))
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v1 = __error();
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v10, (uint64_t)"void system_root_status(_Bool *, _Bool *)_block_invoke", *v1);
      _os_log_impl(&dword_228401000, oslog[0], type, "%s: statfs(\"/\") failed: %d", v10, 0x12u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    id location = (id)[NSString stringWithUTF8String:v11.f_mntfromname];
    if ([location containsString:@"darwinup"])
    {
      os_log_t v4 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v9, (uint64_t)"void system_root_status(_Bool *, _Bool *)_block_invoke", (uint64_t)location);
        _os_log_impl(&dword_228401000, v4, v3, "%s: rooted from darwinup snapshot %@", v9, 0x16u);
      }
      objc_storeStrong((id *)&v4, 0);
      system_root_status_darwinup = 1;
    }
    if ([location hasPrefix:@"/dev/disk"])
    {
      os_log_t v2 = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"void system_root_status(_Bool *, _Bool *)_block_invoke", (uint64_t)location);
        _os_log_impl(&dword_228401000, v2, OS_LOG_TYPE_DEFAULT, "%s: rooted from live fs %@", v8, 0x16u);
      }
      objc_storeStrong((id *)&v2, 0);
      system_root_status_is_live_fs = 1;
    }
    objc_storeStrong(&location, 0);
  }
}

uint64_t getkSUDownloadPhasePreparingForInstallationSymbolLoc_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_0;
  uint64_t v13 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_0;
  if (!getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_0;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_2();
  uint64_t v2 = dlsym(updated, "kSUDownloadPhasePreparingForInstallation");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_2()
{
  uint64_t updated = SoftwareUpdateServicesLibraryCore_2();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_2()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_2) {
    __SoftwareUpdateServicesLibraryCore_block_invoke_2();
  }
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_2;
}

uint64_t __SoftwareUpdateServicesLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateServicesLibraryCore_frameworkLibrary_2 = result;
  return result;
}

uint64_t getSUErrorDomainSymbolLoc_1()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getSUErrorDomainSymbolLoc_ptr_1;
  uint64_t v13 = getSUErrorDomainSymbolLoc_ptr_1;
  if (!getSUErrorDomainSymbolLoc_ptr_1)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke_1;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke_1((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke_1(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_2();
  uint64_t v2 = dlsym(updated, "SUErrorDomain");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkSUInstallationConstraintsUnmetKeySymbolLoc_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_0;
  uint64_t v13 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_0;
  if (!getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_0;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_2();
  uint64_t v2 = dlsym(updated, "kSUInstallationConstraintsUnmetKey");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __os_log_helper_16_2_4_8_64_8_66_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

__CFString *SUSettingsUpdateOperationTypeToString(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    char v1 = 1;
  }
  else
  {
    uint64_t v2 = 0;
    char v1 = 0;
  }
  if (v1)
  {
    int v4 = @"Unknown";
  }
  else
  {
    switch(v2)
    {
      case 0:
        int v4 = @"None";
        break;
      case 1:
        int v4 = @"DownloadOnly";
        break;
      case 2:
        int v4 = @"DownloadAndInstall";
        break;
      case 3:
        int v4 = @"DownloadAndSchedule";
        break;
      case 4:
        int v4 = @"ScheduleOnly";
        break;
      case 5:
        int v4 = @"InstallNow";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v4;
}

uint64_t __os_log_helper_16_2_6_8_32_8_66_8_66_8_66_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_4_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_4_0_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 0;
  *(unsigned char *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_66_8_66_4_0_4_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 4;
  *(_DWORD *)(result + 34) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 4;
  *(_DWORD *)(result + 40) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_8_66_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_66_4_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 4;
  *(_DWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_66_8_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 2;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

id getSUDownloadPolicyFactoryClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUDownloadPolicyFactoryClass_softClass;
  uint64_t v13 = getSUDownloadPolicyFactoryClass_softClass;
  if (!getSUDownloadPolicyFactoryClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUDownloadPolicyFactoryClass_block_invoke;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUDownloadPolicyFactoryClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUErrorDomain_2()
{
  SUErrorDomainSymbolLoc_2 = (void **)getSUErrorDomainSymbolLoc_2();
  if (!SUErrorDomainSymbolLoc_2)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *SUErrorDomainSymbolLoc_2;
  return v0;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_32_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 32;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

void sub_228478488()
{
  _Unwind_Resume(v0);
}

void sub_228478838()
{
  _Unwind_Resume(v0);
}

void sub_228478BF0()
{
  _Unwind_Resume(v0);
}

void sub_228478FF8()
{
  _Unwind_Resume(v0);
}

void sub_2284797E0()
{
  _Unwind_Resume(v0);
}

void sub_228479C94()
{
  _Unwind_Resume(v0);
}

uint64_t __getSUDownloadPolicyFactoryClass_block_invoke(uint64_t a1)
{
  SoftwareUpdateServicesLibrary_3();
  Class Class = objc_getClass("SUDownloadPolicyFactory");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUDownloadPolicyFactoryClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_3()
{
  uint64_t updated = SoftwareUpdateServicesLibraryCore_3();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_3()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_3) {
    __SoftwareUpdateServicesLibraryCore_block_invoke_3();
  }
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_3;
}

uint64_t __SoftwareUpdateServicesLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateServicesLibraryCore_frameworkLibrary_3 = result;
  return result;
}

uint64_t getSUErrorDomainSymbolLoc_2()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getSUErrorDomainSymbolLoc_ptr_2;
  uint64_t v13 = getSUErrorDomainSymbolLoc_ptr_2;
  if (!getSUErrorDomainSymbolLoc_ptr_2)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke_2;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke_2((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke_2(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_3();
  uint64_t v2 = dlsym(updated, "SUErrorDomain");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 13;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  *(unsigned char *)(result + 82) = 0;
  *(unsigned char *)(result + 83) = 8;
  *(void *)(result + 84) = a10;
  *(unsigned char *)(result + 92) = 66;
  *(unsigned char *)(result + 93) = 8;
  *(void *)(result + 94) = a11;
  *(unsigned char *)(result + 102) = 0;
  *(unsigned char *)(result + 103) = 8;
  *(void *)(result + 104) = a12;
  *(unsigned char *)(result + 112) = 34;
  *(unsigned char *)(result + 113) = 8;
  *(void *)(result + 114) = a13;
  *(unsigned char *)(result + 122) = 64;
  *(unsigned char *)(result + 123) = 8;
  *(void *)(result + 124) = a14;
  return result;
}

uint64_t __os_log_helper_16_2_18_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_66_8_0_8_66_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t result = a9;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 18;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 8;
  *(void *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 32) = 66;
  *(unsigned char *)(a1 + 33) = 8;
  *(void *)(a1 + 34) = a5;
  *(unsigned char *)(a1 + 42) = 0;
  *(unsigned char *)(a1 + 43) = 8;
  *(void *)(a1 + 44) = a6;
  *(unsigned char *)(a1 + 52) = 66;
  *(unsigned char *)(a1 + 53) = 8;
  *(void *)(a1 + 54) = a7;
  *(unsigned char *)(a1 + 62) = 0;
  *(unsigned char *)(a1 + 63) = 8;
  *(void *)(a1 + 64) = a8;
  *(unsigned char *)(a1 + 72) = 66;
  *(unsigned char *)(a1 + 73) = 8;
  *(void *)(a1 + 74) = a9;
  *(unsigned char *)(a1 + 82) = 0;
  *(unsigned char *)(a1 + 83) = 8;
  *(void *)(a1 + 84) = a10;
  *(unsigned char *)(a1 + 92) = 66;
  *(unsigned char *)(a1 + 93) = 8;
  *(void *)(a1 + 94) = a11;
  *(unsigned char *)(a1 + 102) = 0;
  *(unsigned char *)(a1 + 103) = 8;
  *(void *)(a1 + 104) = a12;
  *(unsigned char *)(a1 + 112) = 34;
  *(unsigned char *)(a1 + 113) = 8;
  *(void *)(a1 + 114) = a13;
  *(unsigned char *)(a1 + 122) = 66;
  *(unsigned char *)(a1 + 123) = 8;
  *(void *)(a1 + 124) = a14;
  *(unsigned char *)(a1 + 132) = 66;
  *(unsigned char *)(a1 + 133) = 8;
  *(void *)(a1 + 134) = a15;
  *(unsigned char *)(a1 + 142) = 0;
  *(unsigned char *)(a1 + 143) = 8;
  *(void *)(a1 + 144) = a16;
  *(unsigned char *)(a1 + 152) = 66;
  *(unsigned char *)(a1 + 153) = 8;
  *(void *)(a1 + 154) = a17;
  *(unsigned char *)(a1 + 162) = 0;
  *(unsigned char *)(a1 + 163) = 8;
  *(void *)(a1 + 164) = a18;
  *(unsigned char *)(a1 + 172) = 66;
  *(unsigned char *)(a1 + 173) = 8;
  *(void *)(a1 + 174) = a19;
  return result;
}

uint64_t __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 13;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  *(unsigned char *)(result + 82) = 0;
  *(unsigned char *)(result + 83) = 8;
  *(void *)(result + 84) = a10;
  *(unsigned char *)(result + 92) = 66;
  *(unsigned char *)(result + 93) = 8;
  *(void *)(result + 94) = a11;
  *(unsigned char *)(result + 102) = 0;
  *(unsigned char *)(result + 103) = 8;
  *(void *)(result + 104) = a12;
  *(unsigned char *)(result + 112) = 34;
  *(unsigned char *)(result + 113) = 8;
  *(void *)(result + 114) = a13;
  *(unsigned char *)(result + 122) = 66;
  *(unsigned char *)(result + 123) = 8;
  *(void *)(result + 124) = a14;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_0_8_0_8_0_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 66;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 14;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  *(unsigned char *)(result + 82) = 0;
  *(unsigned char *)(result + 83) = 8;
  *(void *)(result + 84) = a10;
  *(unsigned char *)(result + 92) = 66;
  *(unsigned char *)(result + 93) = 8;
  *(void *)(result + 94) = a11;
  *(unsigned char *)(result + 102) = 0;
  *(unsigned char *)(result + 103) = 8;
  *(void *)(result + 104) = a12;
  *(unsigned char *)(result + 112) = 34;
  *(unsigned char *)(result + 113) = 8;
  *(void *)(result + 114) = a13;
  *(unsigned char *)(result + 122) = 0;
  *(unsigned char *)(result + 123) = 8;
  *(void *)(result + 124) = a14;
  *(unsigned char *)(result + 132) = 0;
  *(unsigned char *)(result + 133) = 8;
  *(void *)(result + 134) = a15;
  return result;
}

uint64_t __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 13;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 66;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  *(unsigned char *)(result + 82) = 0;
  *(unsigned char *)(result + 83) = 8;
  *(void *)(result + 84) = a10;
  *(unsigned char *)(result + 92) = 66;
  *(unsigned char *)(result + 93) = 8;
  *(void *)(result + 94) = a11;
  *(unsigned char *)(result + 102) = 0;
  *(unsigned char *)(result + 103) = 8;
  *(void *)(result + 104) = a12;
  *(unsigned char *)(result + 112) = 34;
  *(unsigned char *)(result + 113) = 8;
  *(void *)(result + 114) = a13;
  *(unsigned char *)(result + 122) = 0;
  *(unsigned char *)(result + 123) = 8;
  *(void *)(result + 124) = a14;
  return result;
}

uint64_t __os_log_helper_16_2_8_8_32_8_34_8_0_8_0_8_0_8_66_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 8;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 34;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  *(unsigned char *)(result + 62) = 0;
  *(unsigned char *)(result + 63) = 8;
  *(void *)(result + 64) = a8;
  *(unsigned char *)(result + 72) = 0;
  *(unsigned char *)(result + 73) = 8;
  *(void *)(result + 74) = a9;
  return result;
}

void sub_22848A814()
{
  _Unwind_Resume(v0);
}

id getSUSUIUserDefaultsKeysClass_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSUIUserDefaultsKeysClass_softClass_0;
  uint64_t v13 = getSUSUIUserDefaultsKeysClass_softClass_0;
  if (!getSUSUIUserDefaultsKeysClass_softClass_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSUIUserDefaultsKeysClass_block_invoke_0;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSUIUserDefaultsKeysClass_block_invoke_0((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_22848AC08()
{
  _Unwind_Resume(v0);
}

id getSUSMKMockedServiceTypeUtilityClass_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKMockedServiceTypeUtilityClass_softClass_0;
  uint64_t v13 = getSUSMKMockedServiceTypeUtilityClass_softClass_0;
  if (!getSUSMKMockedServiceTypeUtilityClass_softClass_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKMockedServiceTypeUtilityClass_block_invoke_0;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKMockedServiceTypeUtilityClass_block_invoke_0((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUSMKUserDefaultsCodedTestCaseSessionClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKUserDefaultsCodedTestCaseSessionClass_softClass;
  uint64_t v13 = getSUSMKUserDefaultsCodedTestCaseSessionClass_softClass;
  if (!getSUSMKUserDefaultsCodedTestCaseSessionClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKUserDefaultsCodedTestCaseSessionClass_block_invoke;
    v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKUserDefaultsCodedTestCaseSessionClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_4_8_32_8_0_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore_0()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_0) {
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_0();
  }
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_0;
}

uint64_t __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t __getSUSUIUserDefaultsKeysClass_block_invoke_0(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary_0();
  Class Class = objc_getClass("SUSUIUserDefaultsKeys");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSUIUserDefaultsKeysClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary_0()
{
  uint64_t updated = SoftwareUpdateSettingsMockingKitLibraryCore_0();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t __getSUSMKMockedServiceTypeUtilityClass_block_invoke_0(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary_0();
  Class Class = objc_getClass("SUSMKMockedServiceTypeUtility");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKMockedServiceTypeUtilityClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSUSMKUserDefaultsCodedTestCaseSessionClass_block_invoke(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary_0();
  Class Class = objc_getClass("SUSMKUserDefaultsCodedTestCaseSession");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKUserDefaultsCodedTestCaseSessionClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_2_8_34_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 34;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_34_8_66_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 34;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_34(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 34;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_34_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 34;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

__CFString *SUSUISoftwareUpdateStateToString(unsigned int a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unsigned int v6 = a1;
  if (a1)
  {
    uint64_t v2 = a1;
    char v1 = 1;
  }
  else
  {
    uint64_t v2 = 0;
    char v1 = 0;
  }
  if ((v1 & 1) == 0)
  {
    switch(v2)
    {
      case 0:
        uint64_t v7 = @"Idle";
        goto LABEL_25;
      case 1:
        uint64_t v7 = @"Checking";
        goto LABEL_25;
      case 2:
        uint64_t v7 = @"ScanFailed";
        goto LABEL_25;
      case 3:
        uint64_t v7 = @"NoUpdateFound";
        goto LABEL_25;
      case 4:
        uint64_t v7 = @"DelayingUpdate";
        goto LABEL_25;
      case 5:
        uint64_t v7 = @"Queued";
        goto LABEL_25;
      case 6:
        uint64_t v7 = @"ReadyToDownloadAlternate";
        goto LABEL_25;
      case 7:
        break;
      case 8:
        uint64_t v7 = @"ReadyToDownload";
        goto LABEL_25;
      case 9:
        uint64_t v7 = @"ReadyToDownloadRevealHidden";
        goto LABEL_25;
      case 10:
        uint64_t v7 = @"ReadyToInstall";
        goto LABEL_25;
      case 11:
        uint64_t v7 = @"ReadyToInstallWithAutoInstallEnabled";
        goto LABEL_25;
      case 12:
        uint64_t v7 = @"Downloading";
        goto LABEL_25;
      case 13:
        uint64_t v7 = @"DownloadingAlternateHidingPreferred";
        goto LABEL_25;
      case 14:
        uint64_t v7 = @"DownloadStalled";
        goto LABEL_25;
      case 15:
        uint64_t v7 = @"Installing";
        goto LABEL_25;
      case 16:
        uint64_t v7 = @"Installed";
        goto LABEL_25;
      default:
        JUMPOUT(0);
    }
  }
  id location = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v8, (uint64_t)"NSString *const SUSUISoftwareUpdateStateToString(SUSUISoftwareUpdateState)", v6);
    _os_log_error_impl(&dword_228401000, (os_log_t)location, OS_LOG_TYPE_ERROR, "%s: Un-mapped state %d", v8, 0x12u);
  }
  objc_storeStrong(&location, 0);
  uint64_t v7 = (__CFString *)(id)objc_msgSend(NSString, "stringWithFormat:", @"N/A (state: %d)", v6);
LABEL_25:
  int v3 = v7;
  return v3;
}

__CFString *SUInstallationTypeToString(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1;
  if (a1)
  {
    if (a1 == 1)
    {
      v5 = @"InstallAfterDownload";
    }
    else if (a1 == 2)
    {
      v5 = @"InstallTonight";
    }
    else
    {
      id location = _SUSUILoggingFacility();
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_0((uint64_t)v6, (uint64_t)"NSString *const SUInstallationTypeToString(SUInstallationType)", v4);
        _os_log_error_impl(&dword_228401000, (os_log_t)location, OS_LOG_TYPE_ERROR, "%s: Un-mapped installation type %lu", v6, 0x16u);
      }
      objc_storeStrong(&location, 0);
      v5 = (__CFString *)(id)objc_msgSend(NSString, "stringWithFormat:", @"N/A (type: %lu)", v4);
    }
  }
  else
  {
    v5 = @"DoNotInstall";
  }
  char v1 = v5;
  return v1;
}

id getSUNetworkMonitorClass_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUNetworkMonitorClass_softClass_0;
  uint64_t v13 = getSUNetworkMonitorClass_softClass_0;
  if (!getSUNetworkMonitorClass_softClass_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUNetworkMonitorClass_block_invoke_0;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUNetworkMonitorClass_block_invoke_0((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getkSUDownloadPhasePreparingForInstallation_1()
{
  uint64_t v2 = (void **)getkSUDownloadPhasePreparingForInstallationSymbolLoc_1();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *v2;
  return v0;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19, int a20)
{
  uint64_t result = a11;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 19;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 66;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 0;
  *(unsigned char *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  *(unsigned char *)(a1 + 164) = 66;
  *(unsigned char *)(a1 + 165) = 8;
  *(void *)(a1 + 166) = a19;
  *(unsigned char *)(a1 + 174) = 0;
  *(unsigned char *)(a1 + 175) = 4;
  *(_DWORD *)(a1 + 176) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_21_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_4_0_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19, int a20,uint64_t a21,uint64_t a22)
{
  uint64_t result = a12;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 21;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 66;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 0;
  *(unsigned char *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  *(unsigned char *)(a1 + 164) = 66;
  *(unsigned char *)(a1 + 165) = 8;
  *(void *)(a1 + 166) = a19;
  *(unsigned char *)(a1 + 174) = 0;
  *(unsigned char *)(a1 + 175) = 4;
  *(_DWORD *)(a1 + 176) = a20;
  *(unsigned char *)(a1 + 180) = 66;
  *(unsigned char *)(a1 + 181) = 8;
  *(void *)(a1 + 182) = a21;
  *(unsigned char *)(a1 + 190) = 66;
  *(unsigned char *)(a1 + 191) = 8;
  *(void *)(a1 + 192) = a22;
  return result;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19, uint64_t a20)
{
  uint64_t result = a10;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 19;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 66;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 0;
  *(unsigned char *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  *(unsigned char *)(a1 + 164) = 66;
  *(unsigned char *)(a1 + 165) = 8;
  *(void *)(a1 + 166) = a19;
  *(unsigned char *)(a1 + 174) = 66;
  *(unsigned char *)(a1 + 175) = 8;
  *(void *)(a1 + 176) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 16;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  *(unsigned char *)(result + 148) = 66;
  *(unsigned char *)(result + 149) = 8;
  *(void *)(result + 150) = a17;
  return result;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 17;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  *(unsigned char *)(result + 148) = 0;
  *(unsigned char *)(result + 149) = 4;
  *(_DWORD *)(result + 150) = a17;
  *(unsigned char *)(result + 154) = 66;
  *(unsigned char *)(result + 155) = 8;
  *(void *)(result + 156) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 15;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  return result;
}

uint64_t __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t result = a9;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 18;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 0;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 0;
  *(unsigned char *)(a1 + 159) = 8;
  *(void *)(a1 + 160) = a18;
  *(unsigned char *)(a1 + 168) = 66;
  *(unsigned char *)(a1 + 169) = 8;
  *(void *)(a1 + 170) = a19;
  return result;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66_4_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, int a19, uint64_t a20)
{
  uint64_t result = a10;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 19;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 0;
  *(unsigned char *)(a1 + 149) = 4;
  *(_DWORD *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 154) = 66;
  *(unsigned char *)(a1 + 155) = 8;
  *(void *)(a1 + 156) = a18;
  *(unsigned char *)(a1 + 164) = 0;
  *(unsigned char *)(a1 + 165) = 4;
  *(_DWORD *)(a1 + 166) = a19;
  *(unsigned char *)(a1 + 170) = 66;
  *(unsigned char *)(a1 + 171) = 8;
  *(void *)(a1 + 172) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 17;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  *(unsigned char *)(result + 148) = 0;
  *(unsigned char *)(result + 149) = 4;
  *(_DWORD *)(result + 150) = a17;
  *(unsigned char *)(result + 154) = 0;
  *(unsigned char *)(result + 155) = 4;
  *(_DWORD *)(result + 156) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 17;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  *(unsigned char *)(result + 148) = 0;
  *(unsigned char *)(result + 149) = 8;
  *(void *)(result + 150) = a17;
  *(unsigned char *)(result + 158) = 0;
  *(unsigned char *)(result + 159) = 8;
  *(void *)(result + 160) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_4_0_8_66_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19, int a20)
{
  uint64_t result = a11;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 19;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 64;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 0;
  *(unsigned char *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  *(unsigned char *)(a1 + 164) = 66;
  *(unsigned char *)(a1 + 165) = 8;
  *(void *)(a1 + 166) = a19;
  *(unsigned char *)(a1 + 174) = 0;
  *(unsigned char *)(a1 + 175) = 4;
  *(_DWORD *)(a1 + 176) = a20;
  return result;
}

void sub_2284A0044()
{
  _Unwind_Resume(v0);
}

void sub_2284A0BA0(unint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _Unwind_Exception *exception_object, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id *location)
{
  STACK[0x248] = a1;
  LODWORD(STACK[0x244]) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)&STACK[0x298]);
  _Unwind_Resume((_Unwind_Exception *)STACK[0x248]);
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18)
{
  uint64_t result = a9;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 17;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 66;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 0;
  *(unsigned char *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  return result;
}

id getSUDownloadPolicyFactoryClass_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUDownloadPolicyFactoryClass_softClass_0;
  uint64_t v13 = getSUDownloadPolicyFactoryClass_softClass_0;
  if (!getSUDownloadPolicyFactoryClass_softClass_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUDownloadPolicyFactoryClass_block_invoke_0;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUDownloadPolicyFactoryClass_block_invoke_0((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_2284A1944(unint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _Unwind_Exception *exception_object,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id *location)
{
  STACK[0x230] = a1;
  LODWORD(STACK[0x22C]) = a2;
  objc_destroyWeak(location);
  _Unwind_Resume((_Unwind_Exception *)STACK[0x230]);
}

id getSUErrorDomain_3()
{
  SUErrorDomainSymbolLoc_3 = (void **)getSUErrorDomainSymbolLoc_3();
  if (!SUErrorDomainSymbolLoc_3)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *SUErrorDomainSymbolLoc_3;
  return v0;
}

void sub_2284A2590()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 17;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  *(unsigned char *)(result + 148) = 66;
  *(unsigned char *)(result + 149) = 8;
  *(void *)(result + 150) = a17;
  *(unsigned char *)(result + 158) = 66;
  *(unsigned char *)(result + 159) = 8;
  *(void *)(result + 160) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 17;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  *(unsigned char *)(result + 148) = 64;
  *(unsigned char *)(result + 149) = 8;
  *(void *)(result + 150) = a17;
  *(unsigned char *)(result + 158) = 64;
  *(unsigned char *)(result + 159) = 8;
  *(void *)(result + 160) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t result = a10;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 19;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 66;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 66;
  *(unsigned char *)(a1 + 159) = 8;
  *(void *)(a1 + 160) = a18;
  *(unsigned char *)(a1 + 168) = 66;
  *(unsigned char *)(a1 + 169) = 8;
  *(void *)(a1 + 170) = a19;
  *(unsigned char *)(a1 + 178) = 66;
  *(unsigned char *)(a1 + 179) = 8;
  *(void *)(a1 + 180) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_0_8_64_8_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t result = a10;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 19;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 64;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 0;
  *(unsigned char *)(a1 + 159) = 8;
  *(void *)(a1 + 160) = a18;
  *(unsigned char *)(a1 + 168) = 64;
  *(unsigned char *)(a1 + 169) = 8;
  *(void *)(a1 + 170) = a19;
  *(unsigned char *)(a1 + 178) = 0;
  *(unsigned char *)(a1 + 179) = 8;
  *(void *)(a1 + 180) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 17;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  *(unsigned char *)(result + 148) = 0;
  *(unsigned char *)(result + 149) = 4;
  *(_DWORD *)(result + 150) = a17;
  *(unsigned char *)(result + 154) = 64;
  *(unsigned char *)(result + 155) = 8;
  *(void *)(result + 156) = a18;
  return result;
}

uint64_t __os_log_helper_16_0_1_4_0(uint64_t result, int a2)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_8_66(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_0_8_64_8_0_4_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(unsigned char *)(result + 48) = 0;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  return result;
}

uint64_t SUPrefsDownloadPhaseIsStalled_0(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  IsStalledSymbolLoc_0 = (uint64_t (*)(id))getSUDownloadPhaseIsStalledSymbolLoc_0();
  if (!IsStalledSymbolLoc_0)
  {
    dlerror();
    abort_report_np();
  }
  char v2 = IsStalledSymbolLoc_0(location);
  objc_storeStrong(&location, 0);
  return v2 & 1;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18)
{
  uint64_t result = a9;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 17;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 64;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 0;
  *(unsigned char *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 16;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  *(unsigned char *)(result + 148) = 64;
  *(unsigned char *)(result + 149) = 8;
  *(void *)(result + 150) = a17;
  return result;
}

id getkSUInstallationConstraintsUnmetKey_1()
{
  char v2 = (void **)getkSUInstallationConstraintsUnmetKeySymbolLoc_1();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *v2;
  return v0;
}

uint64_t SUPrefsRequiredBatteryLevelForInstall()
{
  uint64_t SURequiredBatteryLevelForInstallSymbolLoc = getSURequiredBatteryLevelForInstallSymbolLoc();
  char v2 = (uint64_t (*)(uint64_t))SURequiredBatteryLevelForInstallSymbolLoc;
  if (!SURequiredBatteryLevelForInstallSymbolLoc)
  {
    dlerror();
    uint64_t SURequiredBatteryLevelForInstallSymbolLoc = abort_report_np();
  }
  return v2(SURequiredBatteryLevelForInstallSymbolLoc);
}

uint64_t SUPrefsconnectedToCharger(uint64_t a1)
{
  char v2 = (uint64_t (*)(uint64_t))getconnectedToChargerSymbolLoc();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  return v2(a1) & 1;
}

uint64_t __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 16;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  *(unsigned char *)(result + 148) = 0;
  *(unsigned char *)(result + 149) = 4;
  *(_DWORD *)(result + 150) = a17;
  return result;
}

void sub_2284BA9B8()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  char v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_4_0_8_64(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19)
{
  uint64_t result = a9;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 18;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 0;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 0;
  *(unsigned char *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  *(unsigned char *)(a1 + 164) = 64;
  *(unsigned char *)(a1 + 165) = 8;
  *(void *)(a1 + 166) = a19;
  return result;
}

void sub_2284BC7CC()
{
  _Unwind_Resume(v0);
}

id getSUScanOptionsClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUScanOptionsClass_softClass;
  uint64_t v13 = getSUScanOptionsClass_softClass;
  if (!getSUScanOptionsClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUScanOptionsClass_block_invoke;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUScanOptionsClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_0_8_64(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19)
{
  uint64_t result = a9;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 18;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 0;
  *(unsigned char *)(a1 + 149) = 4;
  *(_DWORD *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 154) = 0;
  *(unsigned char *)(a1 + 155) = 8;
  *(void *)(a1 + 156) = a18;
  *(unsigned char *)(a1 + 164) = 64;
  *(unsigned char *)(a1 + 165) = 8;
  *(void *)(a1 + 166) = a19;
  return result;
}

id getkSUDownloadPhaseBrainFetchingQueuedRemote()
{
  uint64_t v2 = (void **)getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *v2;
  return v0;
}

id getkSUDownloadPhaseUpdateFetchingQueuedRemote()
{
  uint64_t updated = (void **)getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc();
  if (!updated)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *updated;
  return v0;
}

void sub_2284BF880()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_64(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t result = a10;
  *(unsigned char *)a1 = 2;
  *(unsigned char *)(a1 + 1) = 19;
  *(unsigned char *)(a1 + 2) = 32;
  *(unsigned char *)(a1 + 3) = 8;
  *(void *)(a1 + 4) = a2;
  *(unsigned char *)(a1 + 12) = 66;
  *(unsigned char *)(a1 + 13) = 8;
  *(void *)(a1 + 14) = a3;
  *(unsigned char *)(a1 + 22) = 0;
  *(unsigned char *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(unsigned char *)(a1 + 28) = 66;
  *(unsigned char *)(a1 + 29) = 8;
  *(void *)(a1 + 30) = a5;
  *(unsigned char *)(a1 + 38) = 0;
  *(unsigned char *)(a1 + 39) = 8;
  *(void *)(a1 + 40) = a6;
  *(unsigned char *)(a1 + 48) = 66;
  *(unsigned char *)(a1 + 49) = 8;
  *(void *)(a1 + 50) = a7;
  *(unsigned char *)(a1 + 58) = 66;
  *(unsigned char *)(a1 + 59) = 8;
  *(void *)(a1 + 60) = a8;
  *(unsigned char *)(a1 + 68) = 0;
  *(unsigned char *)(a1 + 69) = 8;
  *(void *)(a1 + 70) = a9;
  *(unsigned char *)(a1 + 78) = 66;
  *(unsigned char *)(a1 + 79) = 8;
  *(void *)(a1 + 80) = a10;
  *(unsigned char *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 89) = 8;
  *(void *)(a1 + 90) = a11;
  *(unsigned char *)(a1 + 98) = 66;
  *(unsigned char *)(a1 + 99) = 8;
  *(void *)(a1 + 100) = a12;
  *(unsigned char *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 109) = 8;
  *(void *)(a1 + 110) = a13;
  *(unsigned char *)(a1 + 118) = 66;
  *(unsigned char *)(a1 + 119) = 8;
  *(void *)(a1 + 120) = a14;
  *(unsigned char *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 129) = 8;
  *(void *)(a1 + 130) = a15;
  *(unsigned char *)(a1 + 138) = 66;
  *(unsigned char *)(a1 + 139) = 8;
  *(void *)(a1 + 140) = a16;
  *(unsigned char *)(a1 + 148) = 66;
  *(unsigned char *)(a1 + 149) = 8;
  *(void *)(a1 + 150) = a17;
  *(unsigned char *)(a1 + 158) = 66;
  *(unsigned char *)(a1 + 159) = 8;
  *(void *)(a1 + 160) = a18;
  *(unsigned char *)(a1 + 168) = 66;
  *(unsigned char *)(a1 + 169) = 8;
  *(void *)(a1 + 170) = a19;
  *(unsigned char *)(a1 + 178) = 64;
  *(unsigned char *)(a1 + 179) = 8;
  *(void *)(a1 + 180) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_64_8_0_8_64_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 64;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_64_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_7_8_32_8_0_8_64_8_64_4_0_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 7;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(unsigned char *)(result + 48) = 0;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 0;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  return result;
}

uint64_t __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 16;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 0;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(unsigned char *)(result + 48) = 66;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(unsigned char *)(result + 58) = 66;
  *(unsigned char *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(unsigned char *)(result + 68) = 0;
  *(unsigned char *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  *(unsigned char *)(result + 78) = 66;
  *(unsigned char *)(result + 79) = 8;
  *(void *)(result + 80) = a10;
  *(unsigned char *)(result + 88) = 0;
  *(unsigned char *)(result + 89) = 8;
  *(void *)(result + 90) = a11;
  *(unsigned char *)(result + 98) = 66;
  *(unsigned char *)(result + 99) = 8;
  *(void *)(result + 100) = a12;
  *(unsigned char *)(result + 108) = 0;
  *(unsigned char *)(result + 109) = 8;
  *(void *)(result + 110) = a13;
  *(unsigned char *)(result + 118) = 66;
  *(unsigned char *)(result + 119) = 8;
  *(void *)(result + 120) = a14;
  *(unsigned char *)(result + 128) = 0;
  *(unsigned char *)(result + 129) = 8;
  *(void *)(result + 130) = a15;
  *(unsigned char *)(result + 138) = 66;
  *(unsigned char *)(result + 139) = 8;
  *(void *)(result + 140) = a16;
  *(unsigned char *)(result + 148) = 0;
  *(unsigned char *)(result + 149) = 8;
  *(void *)(result + 150) = a17;
  return result;
}

uint64_t __getSUNetworkMonitorClass_block_invoke_0(uint64_t a1)
{
  SoftwareUpdateServicesLibrary_4();
  Class Class = objc_getClass("SUNetworkMonitor");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUNetworkMonitorClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_4()
{
  uint64_t updated = SoftwareUpdateServicesLibraryCore_4();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_4()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_4) {
    __SoftwareUpdateServicesLibraryCore_block_invoke_4();
  }
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_4;
}

uint64_t __SoftwareUpdateServicesLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateServicesLibraryCore_frameworkLibrary_4 = result;
  return result;
}

uint64_t getkSUDownloadPhasePreparingForInstallationSymbolLoc_1()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_1;
  uint64_t v13 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_1;
  if (!getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_1)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_1;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_1((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_1(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_4();
  uint64_t v2 = dlsym(updated, "kSUDownloadPhasePreparingForInstallation");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSUDownloadPolicyFactoryClass_block_invoke_0(uint64_t a1)
{
  SoftwareUpdateServicesLibrary_4();
  Class Class = objc_getClass("SUDownloadPolicyFactory");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUDownloadPolicyFactoryClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getSUErrorDomainSymbolLoc_3()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getSUErrorDomainSymbolLoc_ptr_3;
  uint64_t v13 = getSUErrorDomainSymbolLoc_ptr_3;
  if (!getSUErrorDomainSymbolLoc_ptr_3)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke_3;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke_3((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke_3(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_4();
  uint64_t v2 = dlsym(updated, "SUErrorDomain");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getSUDownloadPhaseIsStalledSymbolLoc_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getSUDownloadPhaseIsStalledSymbolLoc_ptr_0;
  uint64_t v13 = getSUDownloadPhaseIsStalledSymbolLoc_ptr_0;
  if (!getSUDownloadPhaseIsStalledSymbolLoc_ptr_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke_0;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_4();
  uint64_t v2 = dlsym(updated, "SUDownloadPhaseIsStalled");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getSUDownloadPhaseIsStalledSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkSUInstallationConstraintsUnmetKeySymbolLoc_1()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_1;
  uint64_t v13 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_1;
  if (!getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_1)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_1;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_1((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_1(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_4();
  uint64_t v2 = dlsym(updated, "kSUInstallationConstraintsUnmetKey");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getSURequiredBatteryLevelForInstallSymbolLoc()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getSURequiredBatteryLevelForInstallSymbolLoc_ptr;
  uint64_t v13 = getSURequiredBatteryLevelForInstallSymbolLoc_ptr;
  if (!getSURequiredBatteryLevelForInstallSymbolLoc_ptr)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_4();
  uint64_t v2 = dlsym(updated, "SURequiredBatteryLevelForInstall");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getSURequiredBatteryLevelForInstallSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getconnectedToChargerSymbolLoc()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getconnectedToChargerSymbolLoc_ptr;
  uint64_t v13 = getconnectedToChargerSymbolLoc_ptr;
  if (!getconnectedToChargerSymbolLoc_ptr)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getconnectedToChargerSymbolLoc_block_invoke;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getconnectedToChargerSymbolLoc_block_invoke((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getconnectedToChargerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_4();
  uint64_t v2 = dlsym(updated, "connectedToCharger");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getconnectedToChargerSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSUScanOptionsClass_block_invoke(uint64_t a1)
{
  SoftwareUpdateServicesLibrary_4();
  Class Class = objc_getClass("SUScanOptions");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUScanOptionsClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_ptr;
  uint64_t v13 = getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_ptr;
  if (!getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_ptr)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_block_invoke;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_block_invoke((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_4();
  uint64_t v2 = dlsym(updated, "kSUDownloadPhaseBrainFetchingQueuedRemote");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_ptr;
  uint64_t v13 = getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_ptr;
  if (!getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_ptr)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_block_invoke;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_block_invoke((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_4();
  uint64_t v2 = dlsym(updated, "kSUDownloadPhaseUpdateFetchingQueuedRemote");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *SUSettingsScanOperationTypeToString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"FullScan";
    }
    else if (a1 == 2)
    {
      uint64_t v2 = @"RefreshScanResults";
    }
    else
    {
      uint64_t v2 = @"Unknown";
    }
  }
  else
  {
    uint64_t v2 = @"None";
  }
  return v2;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_66_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_66_8_32_8_66_8_32_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 32;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 32;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_66_8_66_8_32_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 32;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 66;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 66;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_66_8_64_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 66;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_64_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_66_4_0_8_66_8_64(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 64;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_64_8_0_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_66_8_66_8_66_4_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 66;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_64_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 32;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

id getSUSMKSoftwareUpdateServicesStrategyBaseClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass;
  uint64_t v13 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass;
  if (!getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUSMKSoftwareUpdateServicesStrategyOptionsClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass;
  uint64_t v13 = getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass;
  if (!getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary_1();
  Class Class = objc_getClass("SUSMKSoftwareUpdateServicesStrategyBase");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary_1()
{
  uint64_t updated = SoftwareUpdateSettingsMockingKitLibraryCore_1();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore_1()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_1) {
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_1();
  }
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_1;
}

uint64_t __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

uint64_t __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary_1();
  Class Class = objc_getClass("SUSMKSoftwareUpdateServicesStrategyOptions");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

uint64_t __os_log_helper_16_2_3_8_64_8_32_8_34(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 32;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 34;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

id getSUSMKSoftwareUpdateServicesStrategyBaseClass_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_0;
  uint64_t v13 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_0;
  if (!getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_0;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_0((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUSMKSoftwareUpdateServicesStrategyOptionsClass_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass_0;
  uint64_t v13 = getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass_0;
  if (!getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke_0;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke_0((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_0(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary_2();
  Class Class = objc_getClass("SUSMKSoftwareUpdateServicesStrategyBase");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary_2()
{
  uint64_t updated = SoftwareUpdateSettingsMockingKitLibraryCore_2();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore_2()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_2) {
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_2();
  }
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_2;
}

uint64_t __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

uint64_t __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke_0(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary_2();
  Class Class = objc_getClass("SUSMKSoftwareUpdateServicesStrategyOptions");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

id getkSUInstallationConstraintsUnmetKey_2()
{
  uint64_t v2 = (void **)getkSUInstallationConstraintsUnmetKeySymbolLoc_2();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *v2;
  return v0;
}

id getSUErrorDomain_4()
{
  SUErrorDomainSymbolLoc_4 = (void **)getSUErrorDomainSymbolLoc_4();
  if (!SUErrorDomainSymbolLoc_4)
  {
    dlerror();
    abort_report_np();
  }
  uint64_t v0 = *SUErrorDomainSymbolLoc_4;
  return v0;
}

uint64_t SUPrefsRequiredBatteryLevelForInstall_0()
{
  uint64_t SURequiredBatteryLevelForInstallSymbolLoc_0 = getSURequiredBatteryLevelForInstallSymbolLoc_0();
  uint64_t v2 = (uint64_t (*)(uint64_t))SURequiredBatteryLevelForInstallSymbolLoc_0;
  if (!SURequiredBatteryLevelForInstallSymbolLoc_0)
  {
    dlerror();
    uint64_t SURequiredBatteryLevelForInstallSymbolLoc_0 = abort_report_np();
  }
  return v2(SURequiredBatteryLevelForInstallSymbolLoc_0);
}

uint64_t __os_log_helper_16_2_1_8_66(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t SUPrefsconnectedToCharger_0(uint64_t a1)
{
  uint64_t v2 = (uint64_t (*)(uint64_t))getconnectedToChargerSymbolLoc_0();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  return v2(a1) & 1;
}

uint64_t getkSUInstallationConstraintsUnmetKeySymbolLoc_2()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_2;
  uint64_t v13 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_2;
  if (!getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_2)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_2;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_2((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_2(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_5();
  uint64_t v2 = dlsym(updated, "kSUInstallationConstraintsUnmetKey");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_5()
{
  uint64_t updated = SoftwareUpdateServicesLibraryCore_5();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_5()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_5) {
    __SoftwareUpdateServicesLibraryCore_block_invoke_5();
  }
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_5;
}

uint64_t __SoftwareUpdateServicesLibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateServicesLibraryCore_frameworkLibrary_5 = result;
  return result;
}

uint64_t getSUErrorDomainSymbolLoc_4()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getSUErrorDomainSymbolLoc_ptr_4;
  uint64_t v13 = getSUErrorDomainSymbolLoc_ptr_4;
  if (!getSUErrorDomainSymbolLoc_ptr_4)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke_4;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke_4((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke_4(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_5();
  uint64_t v2 = dlsym(updated, "SUErrorDomain");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr_4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getSURequiredBatteryLevelForInstallSymbolLoc_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getSURequiredBatteryLevelForInstallSymbolLoc_ptr_0;
  uint64_t v13 = getSURequiredBatteryLevelForInstallSymbolLoc_ptr_0;
  if (!getSURequiredBatteryLevelForInstallSymbolLoc_ptr_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke_0;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_5();
  uint64_t v2 = dlsym(updated, "SURequiredBatteryLevelForInstall");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getSURequiredBatteryLevelForInstallSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getconnectedToChargerSymbolLoc_0()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getconnectedToChargerSymbolLoc_ptr_0;
  uint64_t v13 = getconnectedToChargerSymbolLoc_ptr_0;
  if (!getconnectedToChargerSymbolLoc_ptr_0)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getconnectedToChargerSymbolLoc_block_invoke_0;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getconnectedToChargerSymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getconnectedToChargerSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t updated = (void *)SoftwareUpdateServicesLibrary_5();
  uint64_t v2 = dlsym(updated, "connectedToCharger");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getconnectedToChargerSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id getSUSMKSoftwareUpdateServicesStrategyBaseClass_1()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_1;
  uint64_t v13 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_1;
  if (!getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_1)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_1;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_1((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_1(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary_3();
  Class Class = objc_getClass("SUSMKSoftwareUpdateServicesStrategyBase");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary_3()
{
  uint64_t updated = SoftwareUpdateSettingsMockingKitLibraryCore_3();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore_3()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_3) {
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_3();
  }
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_3;
}

uint64_t __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_3 = result;
  return result;
}

id getSUSMKMockedServiceTypeUtilityClass_1()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getSUSMKMockedServiceTypeUtilityClass_softClass_1;
  uint64_t v13 = getSUSMKMockedServiceTypeUtilityClass_softClass_1;
  if (!getSUSMKMockedServiceTypeUtilityClass_softClass_1)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getSUSMKMockedServiceTypeUtilityClass_block_invoke_1;
    unsigned int v6 = &unk_26483C080;
    uint64_t v7 = &v9;
    __getSUSMKMockedServiceTypeUtilityClass_block_invoke_1((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 64;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

uint64_t __getSUSMKMockedServiceTypeUtilityClass_block_invoke_1(uint64_t a1)
{
  SoftwareUpdateSettingsMockingKitLibrary_4();
  Class Class = objc_getClass("SUSMKMockedServiceTypeUtility");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getSUSMKMockedServiceTypeUtilityClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary_4()
{
  uint64_t updated = SoftwareUpdateSettingsMockingKitLibraryCore_4();
  if (!updated) {
    abort_report_np();
  }
  return updated;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore_4()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_4) {
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_4();
  }
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_4;
}

uint64_t __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_4 = result;
  return result;
}

void sub_2284EF398(uint64_t a1, int a2)
{
  *(void *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_2284EF6F0(uint64_t a1, int a2)
{
  *(void *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_2284EFA48(uint64_t a1, int a2)
{
  *(void *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_2284EFDA0(uint64_t a1, int a2)
{
  *(void *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_2284F00F8(uint64_t a1, int a2)
{
  *(void *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_2284F02AC(uint64_t a1, int a2)
{
  *(void *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_2284F0604(uint64_t a1, int a2)
{
  *(void *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

id _SUSUILoggingFacility()
{
  predicate = (dispatch_once_t *)&_SUSUILoggingFacility_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_7);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  uint64_t v0 = (void *)_SUSUILoggingFacility_oslog;
  return v0;
}

id _SUSUIInternalLoggingFacility()
{
  predicate = (dispatch_once_t *)&_SUSUIInternalLoggingFacility_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_8);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  uint64_t v0 = (void *)_SUSUIInternalLoggingFacility_oslog;
  return v0;
}

uint64_t sub_2284F37CC()
{
  uint64_t v1 = sub_2284F75D0();
  __swift_allocate_value_buffer(v1, qword_268210610);
  __swift_project_value_buffer(v1, (uint64_t)qword_268210610);
  sub_2284F7630();
  sub_2284F7630();
  return sub_2284F75C0();
}

uint64_t sub_2284F3870()
{
  if (qword_268210608 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2284F75D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_268210610);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

void *sub_2284F3944()
{
  return &unk_268210628;
}

uint64_t SUSUISoftwareUpdateController.shouldShowComingSoonTip.getter()
{
  char v9 = 0;
  v15 = v0;
  id v1 = v0;
  key = sub_2284F3944();
  swift_beginAccess();
  id v7 = objc_getAssociatedObject(v0, key);
  swift_endAccess();
  swift_unknownObjectRelease();
  if (v7)
  {
    sub_2284F7750();
    sub_2284F3CD0((uint64_t)v8, (uint64_t)&v10);
    swift_unknownObjectRelease();
  }
  else
  {
    long long v10 = 0uLL;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  sub_2284F3B7C(&v10, &v13);
  if (v14)
  {
    if (swift_dynamicCast()) {
      char v5 = v8[39] & 1;
    }
    else {
      char v5 = 2;
    }
    char v4 = v5;
  }
  else
  {
    sub_2284F3BE0((uint64_t)&v13);
    char v4 = 2;
  }
  if (v4 == 2)
  {
    char v3 = 0;
  }
  else
  {
    char v9 = v4 & 1;
    char v3 = v4;
  }
  return v3 & 1;
}

_OWORD *sub_2284F3B7C(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  a2[1] = a1[1];
  return a2;
}

uint64_t sub_2284F3BE0(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

__n128 sub_2284F3CD0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t SUSUISoftwareUpdateController.shouldShowComingSoonTip.setter()
{
  id v1 = v0;
  key = sub_2284F3944();
  id value = (id)sub_2284F7670();
  swift_beginAccess();
  objc_setAssociatedObject(v0, key, value, 0);
  swift_endAccess();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall SUSUISoftwareUpdateController.setupTipsObserver()()
{
  uint64_t v15 = MEMORY[0x263F8F500];
  uint64_t v12 = 0;
  v16 = &unk_268210388;
  id v18 = 0;
  unint64_t v10 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268210378) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v17 = (char *)&v9 - v10;
  id v18 = (id)MEMORY[0x270FA5388](v13);
  unsigned int v11 = 1;
  objc_msgSend(v18, sel_setShouldShowComingSoonTip_, 0);
  uint64_t v0 = sub_2284F76C0();
  (*(void (**)(char *, void))(*(void *)(v0 - 8) + 56))(v17, v11);
  id v1 = v13;
  sub_2284F76A0();
  uint64_t v2 = sub_2284F7690();
  id v3 = v13;
  uint64_t v14 = v2;
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v15;
  uint64_t v6 = (uint64_t)v16;
  id v7 = (void *)v4;
  uint64_t v8 = (uint64_t)v17;
  v7[2] = v14;
  v7[3] = v5;
  v7[4] = v3;
  sub_2284F5588(v8, v6, (uint64_t)v7, MEMORY[0x263F8EE60] + 8);
  swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t sub_2284F4000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[20] = a4;
  v4[14] = v4;
  v4[15] = 0;
  uint64_t v5 = sub_2284F75D0();
  v4[21] = v5;
  v4[22] = *(void *)(v5 - 8);
  v4[23] = swift_task_alloc();
  uint64_t v6 = sub_2284F7610();
  v4[24] = v6;
  uint64_t v11 = *(void *)(v6 - 8);
  v4[25] = v11;
  v4[26] = *(void *)(v11 + 64);
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682103A0);
  v4[29] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682103A8);
  v4[30] = v7;
  v4[31] = *(void *)(v7 - 8);
  v4[32] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682103B0);
  v4[33] = v8;
  v4[34] = *(void *)(v8 - 8);
  v4[35] = swift_task_alloc();
  v4[15] = a4;
  v4[36] = sub_2284F76A0();
  v4[37] = sub_2284F7690();
  uint64_t v13 = sub_2284F7680();
  v4[38] = v13;
  v4[39] = v9;
  return MEMORY[0x270FA2498](sub_2284F42D4, v13, v9);
}

uint64_t sub_2284F42D4()
{
  uint64_t v12 = MEMORY[0x263F8F500];
  uint64_t v8 = v0[32];
  uint64_t v7 = v0[31];
  uint64_t v9 = v0[30];
  v0[14] = v0;
  uint64_t v6 = *(void **)sub_2284F75A0();
  id v1 = v6;
  (*(void (**)(void *))((*v6 & *MEMORY[0x263F8EED0]) + 0x90))(v1);

  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  sub_2284F75E0();
  sub_2284F76D0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  v0[40] = 0;
  uint64_t v11 = sub_2284F7690();
  v0[41] = v11;
  uint64_t v2 = (void *)swift_task_alloc();
  v10[42] = v2;
  *uint64_t v2 = v10[14];
  v2[1] = sub_2284F4494;
  uint64_t v3 = v10[33];
  uint64_t v4 = v10[29];
  return MEMORY[0x270FA1F68](v4, v11, v12, v3);
}

uint64_t sub_2284F4494()
{
  uint64_t v4 = *v0;
  *(void *)(*v0 + 112) = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v4 + 312);
  uint64_t v2 = *(void *)(v4 + 304);
  return MEMORY[0x270FA2498](sub_2284F45F4, v2, v1);
}

uint64_t sub_2284F45F4()
{
  uint64_t v52 = MEMORY[0x263F8F500];
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[24];
  v0[14] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    (*(void (**)(void))(*(void *)(v51 + 272) + 8))();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v51 + 112) + 8);
    return v4();
  }
  else
  {
    uint64_t v34 = *(void *)(v51 + 224);
    uint64_t v36 = *(void *)(v51 + 216);
    uint64_t v37 = *(void *)(v51 + 192);
    uint64_t v30 = *(void *)(v51 + 184);
    uint64_t v32 = *(void *)(v51 + 168);
    uint64_t v33 = *(void *)(v51 + 200);
    uint64_t v31 = *(void *)(v51 + 176);
    v29 = *(void **)sub_2284F75A0();
    uint64_t v6 = v29;
    (*(void (**)(void *))((*v29 & *MEMORY[0x263F8EED0]) + 0x90))(v6);

    __swift_project_boxed_opaque_existential_1((void *)(v51 + 56), *(void *)(v51 + 80));
    sub_2284F75F0();
    __swift_destroy_boxed_opaque_existential_1(v51 + 56);
    uint64_t v7 = sub_2284F3870();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v30, v7, v32);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v36, v34, v37);
    unint64_t v35 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    uint64_t v40 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v33 + 32))(v40 + v35, v36, v37);
    v49 = sub_2284F75B0();
    os_log_type_t v50 = sub_2284F76F0();
    *(void *)(v51 + 128) = 22;
    sub_2284F6114();
    sub_2284F6190();
    sub_2284F620C();
    sub_2284F7650();
    uint32_t size = *(_DWORD *)(v51 + 344);
    uint64_t v42 = swift_allocObject();
    *(unsigned char *)(v42 + 16) = 32;
    uint64_t v43 = swift_allocObject();
    *(unsigned char *)(v43 + 16) = 8;
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = sub_2284F54A4;
    *(void *)(v39 + 24) = 0;
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = sub_2284F7278;
    *(void *)(v44 + 24) = v39;
    uint64_t v45 = swift_allocObject();
    *(unsigned char *)(v45 + 16) = 32;
    uint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 8;
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = sub_2284F60AC;
    *(void *)(v41 + 24) = v40;
    uint64_t v47 = swift_allocObject();
    *(void *)(v47 + 16) = sub_2284F7378;
    *(void *)(v47 + 24) = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682103D0);
    sub_2284F7780();
    v48 = v8;
    swift_retain();
    void *v48 = sub_2284F71FC;
    v48[1] = v42;
    swift_retain();
    v48[2] = sub_2284F7230;
    v48[3] = v43;
    swift_retain();
    v48[4] = sub_2284F72C4;
    v48[5] = v44;
    swift_retain();
    v48[6] = sub_2284F72FC;
    v48[7] = v45;
    swift_retain();
    v48[8] = sub_2284F7330;
    v48[9] = v46;
    swift_retain();
    v48[10] = sub_2284F73C4;
    v48[11] = v47;
    sub_2284F73D0();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v9 = *(void *)(v51 + 320);
      buf = (uint8_t *)sub_2284F7720();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2682103D8);
      uint64_t v27 = sub_2284F58F8(0);
      uint64_t v28 = sub_2284F58F8(2);
      *(void *)(v51 + 136) = buf;
      *(void *)(v51 + 144) = v27;
      *(void *)(v51 + 152) = v28;
      sub_2284F5954(2, (unsigned char **)(v51 + 136));
      sub_2284F5954(2, (unsigned char **)(v51 + 136));
      *(void *)(v51 + 96) = sub_2284F71FC;
      *(void *)(v51 + 104) = v42;
      uint64_t result = sub_2284F5968((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 96), v51 + 136, v51 + 144, v51 + 152);
      if (v9) {
        return result;
      }
      *(void *)(v51 + 96) = sub_2284F7230;
      *(void *)(v51 + 104) = v43;
      sub_2284F5968((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 96), v51 + 136, v51 + 144, v51 + 152);
      *(void *)(v51 + 96) = sub_2284F72C4;
      *(void *)(v51 + 104) = v44;
      sub_2284F5968((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 96), v51 + 136, v51 + 144, v51 + 152);
      *(void *)(v51 + 96) = sub_2284F72FC;
      *(void *)(v51 + 104) = v45;
      sub_2284F5968((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 96), v51 + 136, v51 + 144, v51 + 152);
      *(void *)(v51 + 96) = sub_2284F7330;
      *(void *)(v51 + 104) = v46;
      sub_2284F5968((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 96), v51 + 136, v51 + 144, v51 + 152);
      *(void *)(v51 + 96) = sub_2284F73C4;
      *(void *)(v51 + 104) = v47;
      sub_2284F5968((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 96), v51 + 136, v51 + 144, v51 + 152);
      _os_log_impl(&dword_228401000, v49, v50, "%s: Coming Soon tip asked to refresh its status: %s", buf, size);
      sub_2284F59B4(v27);
      sub_2284F59B4(v28);
      sub_2284F7700();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v25 = 0;
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v25 = *(void *)(v51 + 320);
    }
    uint64_t v21 = *(void *)(v51 + 232);
    uint64_t v20 = *(void *)(v51 + 224);
    uint64_t v17 = *(void *)(v51 + 216);
    uint64_t v22 = *(void *)(v51 + 192);
    uint64_t v14 = *(void *)(v51 + 184);
    uint64_t v15 = *(void *)(v51 + 168);
    id v19 = *(id *)(v51 + 160);
    uint64_t v16 = *(void *)(v51 + 200);
    uint64_t v13 = *(void *)(v51 + 176);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v17, *MEMORY[0x263F1C050], v22);
    char v18 = sub_2284F7600();
    v23 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v23(v17, v22);
    objc_msgSend(v19, sel_setShouldShowComingSoonTip_, v18 & 1);
    objc_msgSend(v19, sel_refreshPane);
    v23(v20, v22);
    v23(v21, v22);
    *(void *)(v51 + 320) = v25;
    uint64_t v24 = sub_2284F7690();
    *(void *)(v51 + 328) = v24;
    unint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v51 + 336) = v10;
    void *v10 = *(void *)(v51 + 112);
    v10[1] = sub_2284F4494;
    uint64_t v11 = *(void *)(v51 + 264);
    uint64_t v12 = *(void *)(v51 + 232);
    return MEMORY[0x270FA1F68](v12, v24, v52, v11);
  }
}

uint64_t sub_2284F5258()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2284F52A0(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_2284F5378;
  return sub_2284F4000(a1, v6, v7, v8);
}

uint64_t sub_2284F5378()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_2284F54A4()
{
  return sub_2284F7630();
}

uint64_t sub_2284F54D4(uint64_t a1)
{
  v2[1] = a1;
  uint64_t v5 = sub_2284F7610();
  uint64_t v4 = *(void *)(v5 - 8);
  unint64_t v3 = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v2 - v3;
  (*(void (**)(void))(v4 + 16))();
  return sub_2284F7620();
}

uint64_t sub_2284F5588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = sub_2284F76C0();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_2284F5848(a1);
  }
  else
  {
    sub_2284F76B0();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  }
  uint64_t v6 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v6)
  {
    swift_getObjectType();
    sub_2284F7680();
    swift_unknownObjectRelease();
  }
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = a4;
  v5[3] = a2;
  v5[4] = a3;
  return swift_task_create();
}

uint64_t sub_2284F5848(uint64_t a1)
{
  uint64_t v3 = sub_2284F76C0();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_2284F58F8(uint64_t a1)
{
  if (a1) {
    return sub_2284F7720();
  }
  else {
    return 0;
  }
}

uint64_t sub_2284F5954(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2284F5968(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2284F59B4(uint64_t result)
{
  if (result)
  {
    sub_2284F7710();
    return sub_2284F7700();
  }
  return result;
}

uint64_t sub_2284F5A24(uint64_t a1, int *a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_2284F5B24;
  return v6(a1);
}

uint64_t sub_2284F5B24()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_2284F5C54()
{
  return swift_deallocObject();
}

uint64_t sub_2284F5C9C(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v7 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_2284F5D90;
  uint64_t v4 = dword_268210390;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_268210390 + v4))(a1, v7);
}

uint64_t sub_2284F5D90()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

uint64_t sub_2284F5FE0()
{
  uint64_t v2 = *(void *)(sub_2284F7610() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_2284F60AC()
{
  uint64_t v1 = *(void *)(sub_2284F7610() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_2284F54D4(v2);
}

unint64_t sub_2284F6114()
{
  uint64_t v2 = qword_2682103B8;
  if (!qword_2682103B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682103B8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2284F6190()
{
  uint64_t v2 = qword_2682103C0;
  if (!qword_2682103C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682103C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2284F620C()
{
  uint64_t v2 = qword_2682103C8;
  if (!qword_2682103C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682103C8);
    return WitnessTable;
  }
  return v2;
}

void sub_2284F6288()
{
  void *v0 = *v0;
}

uint64_t sub_2284F6294(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_2284F62BC(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  sub_2284F6340(v4, v5, a3);
  uint64_t v8 = *a1;
  sub_2284F7730();
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t sub_2284F6340(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_2284F64B4((uint64_t)&v17, 0, 0, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      sub_2284F7414((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x263F8DBE0];
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_2284F7414((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  return v11;
}

uint64_t sub_2284F64B4(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }
      else
      {
        int64_t v16 = 0;
      }
      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_2284F682C(v21, v15, a2);
          sub_2284F7740();
          void *v17 = a2;
          uint64_t v11 = 0;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          char v22 = v13 & 1;
          char v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    uint64_t v6 = sub_2284F686C(a5, a6);
    void *v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  uint64_t result = sub_2284F7770();
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  void *v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_2284F682C(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_2284F686C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_2284F6920(a1, a2);
  sub_2284F6A9C();
  uint64_t v4 = v6[2];
  sub_2284F6B14(v4);
  sub_2284F6B98(v4, 0);
  sub_2284F6C08();
  swift_retain();
  uint64_t v5 = sub_2284F6C14((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_2284F6920(uint64_t a1, uint64_t a2)
{
  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = sub_2284F7640();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7) {
    return (void *)sub_2284F6D98();
  }
  uint64_t v5 = sub_2284F6C2C(v7, 0);
  swift_retain();
  swift_release();
  uint64_t result = (void *)sub_2284F7760();
  uint64_t v6 = result;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_2284F74AC();
    if (v6 == (void *)v7) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2284F6A9C()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_2284F6C14(*v3);
    uint64_t result = sub_2284F6DC8(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }
  return result;
}

uint64_t sub_2284F6B14(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24) >> 1 < result + 1)
  {
    uint64_t result = sub_2284F6DC8(*(void *)(*(void *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_2284F6B98(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(unsigned char *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void sub_2284F6C08()
{
  void *v0 = *v0;
}

uint64_t sub_2284F6C14(uint64_t a1)
{
  return sub_2284F70C8(a1);
}

void *sub_2284F6C2C(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682103E0);
    uint64_t v6 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    swift_retain();
    return (void *)v3;
  }
}

uint64_t sub_2284F6D98()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  swift_retain();
  return v1;
}

uint64_t sub_2284F6DC8(char a1, uint64_t a2, char a3, uint64_t a4)
{
  swift_retain();
  uint64_t result = swift_retain();
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if (a3)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682103E0);
    uint64_t v8 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * (v6 - (void)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * v9;
    }
    swift_release();
    uint64_t v7 = (char *)v8;
  }
  else
  {
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    swift_retain();
    uint64_t v7 = v5;
  }
  if (a1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_2284F7108((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    sub_2284F70D0((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t sub_2284F70C8(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_2284F70D0(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_2284F7108(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

unsigned char **sub_2284F71BC(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_2284F71D0()
{
  return swift_deallocObject();
}

unsigned char **sub_2284F71FC(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_2284F71BC(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_2284F7204()
{
  return swift_deallocObject();
}

unsigned char **sub_2284F7230(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_2284F71BC(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_2284F7238()
{
  return swift_deallocObject();
}

uint64_t sub_2284F7278()
{
  return sub_2284F6294(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_2284F7284()
{
  return swift_deallocObject();
}

void *sub_2284F72C4(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_2284F62BC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_2284F72D0()
{
  return swift_deallocObject();
}

unsigned char **sub_2284F72FC(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_2284F71BC(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_2284F7304()
{
  return swift_deallocObject();
}

unsigned char **sub_2284F7330(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_2284F71BC(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_2284F7338()
{
  return swift_deallocObject();
}

uint64_t sub_2284F7378()
{
  return sub_2284F6294(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_2284F7384()
{
  return swift_deallocObject();
}

void *sub_2284F73C4(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_2284F62BC(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2284F73D0()
{
}

uint64_t sub_2284F7414(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2284F74AC()
{
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_2284F7580()
{
  return MEMORY[0x270FA1128]();
}

uint64_t sub_2284F7590()
{
  return MEMORY[0x270FA1138]();
}

uint64_t sub_2284F75A0()
{
  return MEMORY[0x270F76378]();
}

uint64_t sub_2284F75B0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2284F75C0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2284F75D0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2284F75E0()
{
  return MEMORY[0x270F05B48]();
}

uint64_t sub_2284F75F0()
{
  return MEMORY[0x270F05B78]();
}

uint64_t sub_2284F7600()
{
  return MEMORY[0x270F05D58]();
}

uint64_t sub_2284F7610()
{
  return MEMORY[0x270F05D60]();
}

uint64_t sub_2284F7620()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2284F7630()
{
  return MEMORY[0x270F9D6D8]();
}

uint64_t sub_2284F7640()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2284F7650()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t sub_2284F7660()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2284F7670()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_2284F7680()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2284F7690()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2284F76A0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2284F76B0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2284F76C0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2284F76D0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_2284F76F0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2284F7700()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_2284F7710()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_2284F7720()
{
  return MEMORY[0x270F9E398]();
}

uint64_t sub_2284F7730()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2284F7740()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2284F7750()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2284F7760()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2284F7770()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2284F7780()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t LICreateIconForImage()
{
  return MEMORY[0x270F4ADE0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PSIsDataRoamingEnabled()
{
  return MEMORY[0x270F5D130]();
}

uint64_t PSIsRunningInAssistant()
{
  return MEMORY[0x270F55258]();
}

uint64_t PSSetBatteryMonitoringEnabled()
{
  return MEMORY[0x270F552E0]();
}

uint64_t SBGetApplicationNetworkFlags()
{
  return MEMORY[0x270F770D8]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x270F771E8]();
}

uint64_t SBSetApplicationNetworkFlags()
{
  return MEMORY[0x270F77220]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x270F5D188]();
}

uint64_t SULogInfo()
{
  return MEMORY[0x270F76340]();
}

uint64_t SURequiredBatteryLevelForInstallForDescriptor()
{
  return MEMORY[0x270F76348]();
}

uint64_t SURequiredBatteryLevelForInstallation()
{
  return MEMORY[0x270F76350]();
}

uint64_t SUStringFromAgreementStatus()
{
  return MEMORY[0x270F76358]();
}

uint64_t SUStringFromMDMSUPath()
{
  return MEMORY[0x270F76360]();
}

uint64_t SUStringFromNetworkType()
{
  return MEMORY[0x270F76368]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x270EE55E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}