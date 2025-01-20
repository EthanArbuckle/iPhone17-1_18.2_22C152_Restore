@interface CSPlatformInfo
+ (id)hardwareMap;
+ (id)sharedInstance;
+ (id)sharedInstance:(unint64_t)a3;
- (BOOL)forceDetectionDevice;
- (BOOL)isDOEDeviceDefaultSet;
- (BOOL)isEigerDevice;
- (BOOL)isExtendedPretriggerDMDevice;
- (BOOL)isExtendedPretriggerMagDevice;
- (BOOL)isInternalInstall;
- (BOOL)isKappaDetectionDevice;
- (BOOL)isKappaDetectionDevice:(unint64_t)a3;
- (BOOL)isKappaLoggingDevice;
- (BOOL)isKappaLoggingDevice:(unint64_t)a3;
- (BOOL)isMDevice;
- (BOOL)isSimulated;
- (BOOL)isSovereignDevice;
- (CSPlatformInfo)init;
- (CSPlatformInfo)initWithHardware:(unint64_t)a3;
- (NSDictionary)hardwareMap;
- (id)getSerialNumber;
- (id)getSystem:(const char *)a3;
- (id)getSystemModel;
- (id)getSystemVersionDescription;
- (id)getSystemVersionDescriptionNoBuild;
- (int)getSystemReleaseType;
- (unint64_t)getSystemHardware;
- (unint64_t)hardware;
- (unint64_t)queryEmbeddedSystemHardware;
@end

@implementation CSPlatformInfo

+ (id)sharedInstance:(unint64_t)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100319A14;
  block[3] = &unk_1003AA558;
  block[4] = a3;
  if (qword_1003DD7C8 != -1) {
    dispatch_once(&qword_1003DD7C8, block);
  }
  v3 = (void *)qword_1003DD7C0;

  return v3;
}

+ (id)sharedInstance
{
  if (qword_1003DD7C8 != -1) {
    dispatch_once(&qword_1003DD7C8, &stru_1003BAFA0);
  }
  v2 = (void *)qword_1003DD7C0;

  return v2;
}

+ (id)hardwareMap
{
  v4[0] = &off_1003C1C08;
  v4[1] = &off_1003C1C20;
  v5[0] = &off_1003C1C08;
  v5[1] = &off_1003C1C20;
  v4[2] = &off_1003C1C38;
  v4[3] = &off_1003C1C50;
  v5[2] = &off_1003C1C38;
  v5[3] = &off_1003C1C50;
  v4[4] = &off_1003C1C68;
  v4[5] = &off_1003C1C80;
  v5[4] = &off_1003C1C68;
  v5[5] = &off_1003C1C80;
  v4[6] = &off_1003C1C98;
  v4[7] = &off_1003C1CB0;
  v5[6] = &off_1003C1C98;
  v5[7] = &off_1003C1CB0;
  v4[8] = &off_1003C1CC8;
  v4[9] = &off_1003C1CE0;
  v5[8] = &off_1003C1CC8;
  v5[9] = &off_1003C1CE0;
  v4[10] = &off_1003C1CF8;
  v4[11] = &off_1003C1D10;
  v5[10] = &off_1003C1CF8;
  v5[11] = &off_1003C1D10;
  v4[12] = &off_1003C1D28;
  v4[13] = &off_1003C1D40;
  v5[12] = &off_1003C1D28;
  v5[13] = &off_1003C1D40;
  v4[14] = &off_1003C1D58;
  v4[15] = &off_1003C1D70;
  v5[14] = &off_1003C1D58;
  v5[15] = &off_1003C1D70;
  v4[16] = &off_1003C1D88;
  v4[17] = &off_1003C1DA0;
  v5[16] = &off_1003C1D88;
  v5[17] = &off_1003C1DA0;
  v4[18] = &off_1003C1DB8;
  v4[19] = &off_1003C1DD0;
  v5[18] = &off_1003C1DB8;
  v5[19] = &off_1003C1DD0;
  v4[20] = &off_1003C1DE8;
  v4[21] = &off_1003C1E00;
  v5[20] = &off_1003C1DE8;
  v5[21] = &off_1003C1E00;
  v4[22] = &off_1003C1E18;
  v4[23] = &off_1003C1E30;
  v5[22] = &off_1003C1E18;
  v5[23] = &off_1003C1E30;
  v4[24] = &off_1003C1E48;
  v4[25] = &off_1003C1E60;
  v5[24] = &off_1003C1E48;
  v5[25] = &off_1003C1E60;
  v4[26] = &off_1003C1E78;
  v4[27] = &off_1003C1E90;
  v5[26] = &off_1003C1E78;
  v5[27] = &off_1003C1E90;
  v4[28] = &off_1003C1EA8;
  v4[29] = &off_1003C1EC0;
  v5[28] = &off_1003C1EA8;
  v5[29] = &off_1003C1EC0;
  v4[30] = &off_1003C1ED8;
  v4[31] = &off_1003C1EF0;
  v5[30] = &off_1003C1ED8;
  v5[31] = &off_1003C1EF0;
  v4[32] = &off_1003C1F08;
  v4[33] = &off_1003C1F20;
  v5[32] = &off_1003C1F08;
  v5[33] = &off_1003C1F20;
  v4[34] = &off_1003C1F38;
  v4[35] = &off_1003C1F50;
  v5[34] = &off_1003C1F38;
  v5[35] = &off_1003C1F50;
  v4[36] = &off_1003C1F68;
  v4[37] = &off_1003C1F80;
  v5[36] = &off_1003C1F68;
  v5[37] = &off_1003C1F80;
  v4[38] = &off_1003C1F98;
  v4[39] = &off_1003C1FB0;
  v5[38] = &off_1003C1F98;
  v5[39] = &off_1003C1FB0;
  v4[40] = &off_1003C1FC8;
  v4[41] = &off_1003C1FE0;
  v5[40] = &off_1003C1FC8;
  v5[41] = &off_1003C1FE0;
  v4[42] = &off_1003C1FF8;
  v4[43] = &off_1003C2010;
  v5[42] = &off_1003C1FF8;
  v5[43] = &off_1003C2010;
  v4[44] = &off_1003C2028;
  v4[45] = &off_1003C2040;
  v5[44] = &off_1003C2028;
  v5[45] = &off_1003C2040;
  v4[46] = &off_1003C2058;
  v4[47] = &off_1003C2070;
  v5[46] = &off_1003C2058;
  v5[47] = &off_1003C2070;
  v4[48] = &off_1003C2088;
  v4[49] = &off_1003C20A0;
  v5[48] = &off_1003C2088;
  v5[49] = &off_1003C20A0;
  v4[50] = &off_1003C20B8;
  v4[51] = &off_1003C20D0;
  v5[50] = &off_1003C20B8;
  v5[51] = &off_1003C20D0;
  v4[52] = &off_1003C20E8;
  v4[53] = &off_1003C2100;
  v5[52] = &off_1003C20E8;
  v5[53] = &off_1003C2100;
  v4[54] = &off_1003C2118;
  v4[55] = &off_1003C2130;
  v5[54] = &off_1003C2118;
  v5[55] = &off_1003C2130;
  v4[56] = &off_1003C2148;
  v4[57] = &off_1003C2160;
  v5[56] = &off_1003C2148;
  v5[57] = &off_1003C2160;
  v4[58] = &off_1003C2178;
  v4[59] = &off_1003C2190;
  v5[58] = &off_1003C2178;
  v5[59] = &off_1003C2190;
  v4[60] = &off_1003C21A8;
  v4[61] = &off_1003C21C0;
  v5[60] = &off_1003C21A8;
  v5[61] = &off_1003C21C0;
  v4[62] = &off_1003C21D8;
  v4[63] = &off_1003C21F0;
  v5[62] = &off_1003C21D8;
  v5[63] = &off_1003C21F0;
  v4[64] = &off_1003C2208;
  v5[64] = &off_1003C2208;
  v4[65] = &off_1003C2220;
  v5[65] = &off_1003C2220;
  v4[66] = &off_1003C2238;
  v5[66] = &off_1003C2238;
  v4[67] = &off_1003C2250;
  v5[67] = &off_1003C2250;
  v4[68] = &off_1003C2268;
  v5[68] = &off_1003C2268;
  v4[69] = &off_1003C2280;
  v5[69] = &off_1003C2280;
  v4[70] = &off_1003C2298;
  v5[70] = &off_1003C2298;
  v4[71] = &off_1003C22B0;
  v5[71] = &off_1003C22B0;
  v4[72] = &off_1003C22C8;
  v5[72] = &off_1003C22C8;
  v4[73] = &off_1003C22E0;
  v5[73] = &off_1003C22E0;
  v4[74] = &off_1003C22F8;
  v5[74] = &off_1003C22F8;
  v4[75] = &off_1003C2310;
  v5[75] = &off_1003C2310;
  v4[76] = &off_1003C2328;
  v5[76] = &off_1003C2328;
  v4[77] = &off_1003C2340;
  v5[77] = &off_1003C2340;
  v4[78] = &off_1003C2358;
  v5[78] = &off_1003C2358;
  v4[79] = &off_1003C2370;
  v5[79] = &off_1003C2370;
  v4[80] = &off_1003C2388;
  v5[80] = &off_1003C2388;
  v4[81] = &off_1003C23A0;
  v5[81] = &off_1003C23A0;
  v4[82] = &off_1003C23B8;
  v5[82] = &off_1003C23B8;
  v4[83] = &off_1003C23D0;
  v5[83] = &off_1003C23D0;
  v4[84] = &off_1003C23E8;
  v5[84] = &off_1003C23E8;
  v4[85] = &off_1003C2400;
  v5[85] = &off_1003C2400;
  v4[86] = &off_1003C2418;
  v5[86] = &off_1003C2418;
  v4[87] = &off_1003C2430;
  v5[87] = &off_1003C2430;
  v4[88] = &off_1003C2448;
  v5[88] = &off_1003C2448;
  v4[89] = &off_1003C2460;
  v5[89] = &off_1003C2460;
  v4[90] = &off_1003C2478;
  v5[90] = &off_1003C2478;
  v4[91] = &off_1003C2490;
  v5[91] = &off_1003C2490;
  v4[92] = &off_1003C24A8;
  v5[92] = &off_1003C24A8;
  v4[93] = &off_1003C24C0;
  v5[93] = &off_1003C24C0;
  v4[94] = &off_1003C24D8;
  v5[94] = &off_1003C24D8;
  v4[95] = &off_1003C24F0;
  v5[95] = &off_1003C24F0;
  v4[96] = &off_1003C2508;
  v5[96] = &off_1003C2508;
  v4[97] = &off_1003C2520;
  v5[97] = &off_1003C2520;
  v4[98] = &off_1003C2538;
  v5[98] = &off_1003C2538;
  v4[99] = &off_1003C2550;
  v5[99] = &off_1003C2550;
  v4[100] = &off_1003C2568;
  v5[100] = &off_1003C2568;
  v4[101] = &off_1003C2580;
  v5[101] = &off_1003C2580;
  v4[102] = &off_1003C2598;
  v5[102] = &off_1003C2598;
  v4[103] = &off_1003C25B0;
  v5[103] = &off_1003C25B0;
  v4[104] = &off_1003C25C8;
  v5[104] = &off_1003C25C8;
  v4[105] = &off_1003C25E0;
  v5[105] = &off_1003C25E0;
  v4[106] = &off_1003C25F8;
  v5[106] = &off_1003C25F8;
  v4[107] = &off_1003C2610;
  v5[107] = &off_1003C2610;
  v4[108] = &off_1003C2628;
  v5[108] = &off_1003C2628;
  v4[109] = &off_1003C2640;
  v5[109] = &off_1003C2640;
  v4[110] = &off_1003C2658;
  v5[110] = &off_1003C2658;
  v4[111] = &off_1003C2670;
  v5[111] = &off_1003C2670;
  v4[112] = &off_1003C2688;
  v5[112] = &off_1003C2688;
  v4[113] = &off_1003C26A0;
  v5[113] = &off_1003C26A0;
  v4[114] = &off_1003C26B8;
  v5[114] = &off_1003C26B8;
  v4[115] = &off_1003C26D0;
  v5[115] = &off_1003C26D0;
  v4[116] = &off_1003C26E8;
  v5[116] = &off_1003C26E8;
  v4[117] = &off_1003C2700;
  v5[117] = &off_1003C2700;
  v4[118] = &off_1003C2718;
  v5[118] = &off_1003C2718;
  v4[119] = &off_1003C2730;
  v5[119] = &off_1003C2730;
  v4[120] = &off_1003C2748;
  v5[120] = &off_1003C2748;
  v4[121] = &off_1003C2760;
  v5[121] = &off_1003C2760;
  v4[122] = &off_1003C2778;
  v5[122] = &off_1003C2778;
  v4[123] = &off_1003C2790;
  v5[123] = &off_1003C2790;
  v4[124] = &off_1003C27A8;
  v5[124] = &off_1003C27A8;
  v4[125] = &off_1003C27C0;
  v5[125] = &off_1003C27C0;
  v4[126] = &off_1003C27D8;
  v5[126] = &off_1003C27D8;
  v4[127] = &off_1003C27F0;
  v5[127] = &off_1003C27F0;
  v4[128] = &off_1003C2808;
  v5[128] = &off_1003C2808;
  v4[129] = &off_1003C2820;
  v5[129] = &off_1003C2820;
  v4[130] = &off_1003C2838;
  v5[130] = &off_1003C2838;
  v4[131] = &off_1003C2850;
  v5[131] = &off_1003C2850;
  v4[132] = &off_1003C2868;
  v5[132] = &off_1003C2868;
  v4[133] = &off_1003C2880;
  v5[133] = &off_1003C2880;
  v4[134] = &off_1003C2898;
  v5[134] = &off_1003C2898;
  v4[135] = &off_1003C28B0;
  v5[135] = &off_1003C28B0;
  v4[136] = &off_1003C28C8;
  v5[136] = &off_1003C28C8;
  v4[137] = &off_1003C28E0;
  v5[137] = &off_1003C28E0;
  v4[138] = &off_1003C28F8;
  v5[138] = &off_1003C28F8;
  v4[139] = &off_1003C2910;
  v5[139] = &off_1003C2910;
  v4[140] = &off_1003C2928;
  v5[140] = &off_1003C2928;
  v4[141] = &off_1003C2940;
  v5[141] = &off_1003C2940;
  v4[142] = &off_1003C2958;
  v5[142] = &off_1003C2958;
  v4[143] = &off_1003C2970;
  v5[143] = &off_1003C2970;
  v4[144] = &off_1003C2988;
  v5[144] = &off_1003C2988;
  v4[145] = &off_1003C29A0;
  v5[145] = &off_1003C29A0;
  v4[146] = &off_1003C29B8;
  v5[146] = &off_1003C29B8;
  v4[147] = &off_1003C29D0;
  v5[147] = &off_1003C29D0;
  v4[148] = &off_1003C29E8;
  v5[148] = &off_1003C29E8;
  v4[149] = &off_1003C2A00;
  v5[149] = &off_1003C2A00;
  v4[150] = &off_1003C2A18;
  v5[150] = &off_1003C2A18;
  v4[151] = &off_1003C2A30;
  v5[151] = &off_1003C2A30;
  v4[152] = &off_1003C2A48;
  v5[152] = &off_1003C2A48;
  v4[153] = &off_1003C2A60;
  v5[153] = &off_1003C2A60;
  v4[154] = &off_1003C2A78;
  v5[154] = &off_1003C2A78;
  v4[155] = &off_1003C2A90;
  v5[155] = &off_1003C2A90;
  v4[156] = &off_1003C2AA8;
  v5[156] = &off_1003C2AA8;
  v4[157] = &off_1003C2AC0;
  v5[157] = &off_1003C2AC0;
  v4[158] = &off_1003C2AD8;
  v5[158] = &off_1003C2AD8;
  v4[159] = &off_1003C2AF0;
  v5[159] = &off_1003C2AF0;
  v4[160] = &off_1003C2B08;
  v5[160] = &off_1003C2B08;
  v4[161] = &off_1003C2B20;
  v5[161] = &off_1003C2B20;
  v4[162] = &off_1003C2B38;
  v5[162] = &off_1003C2B38;
  v4[163] = &off_1003C2B50;
  v5[163] = &off_1003C2B50;
  v4[164] = &off_1003C2B68;
  v5[164] = &off_1003C2B68;
  v4[165] = &off_1003C2B80;
  v5[165] = &off_1003C2B80;
  v4[166] = &off_1003C2B98;
  v5[166] = &off_1003C2B98;
  v4[167] = &off_1003C2BB0;
  v5[167] = &off_1003C2BB0;
  v4[168] = &off_1003C2BC8;
  v5[168] = &off_1003C2BC8;
  v4[169] = &off_1003C2BE0;
  v5[169] = &off_1003C2BE0;
  v4[170] = &off_1003C2BF8;
  v5[170] = &off_1003C2BF8;
  v4[171] = &off_1003C2C10;
  v5[171] = &off_1003C2C10;
  v4[172] = &off_1003C2C28;
  v5[172] = &off_1003C2C28;
  v4[173] = &off_1003C2C40;
  v5[173] = &off_1003C2C40;
  v4[174] = &off_1003C2C58;
  v5[174] = &off_1003C2C58;
  v4[175] = &off_1003C2C70;
  v5[175] = &off_1003C2C70;
  v4[176] = &off_1003C2C88;
  v5[176] = &off_1003C2C88;
  v4[177] = &off_1003C2CA0;
  v5[177] = &off_1003C2CA0;
  v4[178] = &off_1003C2CB8;
  v5[178] = &off_1003C2CB8;
  v4[179] = &off_1003C2CD0;
  v5[179] = &off_1003C2CD0;
  v4[180] = &off_1003C2CE8;
  v5[180] = &off_1003C2CE8;
  v4[181] = &off_1003C2D00;
  v5[181] = &off_1003C2D00;
  v4[182] = &off_1003C2D18;
  v5[182] = &off_1003C2D18;
  v4[183] = &off_1003C2D30;
  v5[183] = &off_1003C2D30;
  v4[184] = &off_1003C2D48;
  v5[184] = &off_1003C2D48;
  v4[185] = &off_1003C2D60;
  v5[185] = &off_1003C2D60;
  v4[186] = &off_1003C2D78;
  v5[186] = &off_1003C2D78;
  v4[187] = &off_1003C2D90;
  v5[187] = &off_1003C2D90;
  v4[188] = &off_1003C2DA8;
  v5[188] = &off_1003C2DA8;
  v4[189] = &off_1003C2DC0;
  v5[189] = &off_1003C2DC0;
  v4[190] = &off_1003C2DD8;
  v5[190] = &off_1003C2DD8;
  v4[191] = &off_1003C2DF0;
  v5[191] = &off_1003C2DF0;
  v4[192] = &off_1003C2E08;
  v5[192] = &off_1003C2E08;
  v4[193] = &off_1003C2E20;
  v5[193] = &off_1003C2E20;
  v4[194] = &off_1003C2E38;
  v5[194] = &off_1003C2E38;
  v4[195] = &off_1003C2E50;
  v5[195] = &off_1003C2E50;
  v4[196] = &off_1003C2E68;
  v5[196] = &off_1003C2E68;
  v4[197] = &off_1003C2E80;
  v5[197] = &off_1003C2E80;
  v4[198] = &off_1003C2E98;
  v5[198] = &off_1003C2E98;
  v4[199] = &off_1003C2EB0;
  v5[199] = &off_1003C2EB0;
  v4[200] = &off_1003C2EC8;
  v5[200] = &off_1003C2EC8;
  v4[201] = &off_1003C2EE0;
  v5[201] = &off_1003C2EE0;
  v4[202] = &off_1003C2EF8;
  v5[202] = &off_1003C2EF8;
  v4[203] = &off_1003C2F10;
  v5[203] = &off_1003C2F10;
  v4[204] = &off_1003C2F28;
  v5[204] = &off_1003C2F28;
  v4[205] = &off_1003C2F40;
  v5[205] = &off_1003C2F40;
  v4[206] = &off_1003C2F58;
  v5[206] = &off_1003C2F58;
  v4[207] = &off_1003C2F70;
  v5[207] = &off_1003C2F70;
  v4[208] = &off_1003C2F88;
  v5[208] = &off_1003C2F88;
  v4[209] = &off_1003C2FA0;
  v5[209] = &off_1003C2FA0;
  v4[210] = &off_1003C2FB8;
  v5[210] = &off_1003C2FB8;
  v4[211] = &off_1003C2FD0;
  v5[211] = &off_1003C2FD0;
  v4[212] = &off_1003C2FE8;
  v5[212] = &off_1003C2FE8;
  v4[213] = &off_1003C3000;
  v5[213] = &off_1003C3000;
  v4[214] = &off_1003C3018;
  v5[214] = &off_1003C3018;
  v4[215] = &off_1003C3030;
  v5[215] = &off_1003C3030;
  v4[216] = &off_1003C3048;
  v5[216] = &off_1003C3048;
  v4[217] = &off_1003C3060;
  v5[217] = &off_1003C3060;
  v4[218] = &off_1003C3078;
  v5[218] = &off_1003C3078;
  v4[219] = &off_1003C3090;
  v5[219] = &off_1003C3090;
  v4[220] = &off_1003C30A8;
  v5[220] = &off_1003C30A8;
  v4[221] = &off_1003C30C0;
  v5[221] = &off_1003C30C0;
  v4[222] = &off_1003C30D8;
  v5[222] = &off_1003C30D8;
  v4[223] = &off_1003C30F0;
  v5[223] = &off_1003C30F0;
  v4[224] = &off_1003C3108;
  v5[224] = &off_1003C3108;
  v4[225] = &off_1003C3120;
  v5[225] = &off_1003C3120;
  v4[226] = &off_1003C3138;
  v5[226] = &off_1003C3138;
  v4[227] = &off_1003C3150;
  v5[227] = &off_1003C3150;
  v4[228] = &off_1003C3168;
  v5[228] = &off_1003C3168;
  v4[229] = &off_1003C3180;
  v5[229] = &off_1003C3180;
  v4[230] = &off_1003C3198;
  v5[230] = &off_1003C3198;
  v4[231] = &off_1003C31B0;
  v5[231] = &off_1003C31B0;
  v4[232] = &off_1003C31C8;
  v5[232] = &off_1003C31C8;
  v4[233] = &off_1003C31E0;
  v5[233] = &off_1003C31E0;
  v4[234] = &off_1003C31F8;
  v5[234] = &off_1003C31F8;
  v4[235] = &off_1003C3210;
  v5[235] = &off_1003C3210;
  v4[236] = &off_1003C3228;
  v5[236] = &off_1003C3228;
  v4[237] = &off_1003C3240;
  v5[237] = &off_1003C3240;
  v4[238] = &off_1003C3258;
  v5[238] = &off_1003C3258;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:239];

  return v2;
}

- (CSPlatformInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSPlatformInfo;
  v2 = [(CSPlatformInfo *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_unint64_t hardware = [(CSPlatformInfo *)v2 getSystemHardware];
    if (qword_1003DB6E0 != -1) {
      dispatch_once(&qword_1003DB6E0, &stru_1003BB020);
    }
    v4 = (id)qword_1003DB6E8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unint64_t hardware = v3->_hardware;
      v6 = [(CSPlatformInfo *)v3 getSystemVersionDescription];
      *(_DWORD *)buf = 67109378;
      int v10 = hardware;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "hw = %d (%@)", buf, 0x12u);
    }
    v3->_isSimulated = 0;
  }
  return v3;
}

- (CSPlatformInfo)initWithHardware:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSPlatformInfo;
  result = [(CSPlatformInfo *)&v5 init];
  if (result)
  {
    result->_unint64_t hardware = a3;
    result->_isSimulated = 1;
  }
  return result;
}

- (BOOL)isDOEDeviceDefaultSet
{
  v2 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CSKappaDeviceIsDOE"];

  return v3;
}

- (BOOL)forceDetectionDevice
{
  v2 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned __int8 v3 = [v2 BOOLForKey:@"CSKappaForceDetection"];

  return v3;
}

- (BOOL)isKappaDetectionDevice
{
  BOOL v3 = [(CSPlatformInfo *)self isKappaDetectionDevice:self->_hardware];
  if ([(CSPlatformInfo *)self isKappaLoggingDevice:self->_hardware]
    && !v3
    && [(CSPlatformInfo *)self forceDetectionDevice])
  {
    return 1;
  }
  return v3;
}

- (BOOL)isKappaDetectionDevice:(unint64_t)a3
{
  if (a3 != 194 || ![(CSPlatformInfo *)self isDOEDeviceDefaultSet]) {
    return a3 - 229 < 2
  }
        || a3 - 87 < 2
        || a3 - 91 < 2
        || (a3 & 0xFFFFFFFFFFFFFFFELL) == 202
        || (a3 & 0xFFFFFFFFFFFFFFFBLL) - 89 < 2
        || a3 == 237
        || a3 - 145 < 0x12;
  if (qword_1003DB6E0 != -1) {
    dispatch_once(&qword_1003DB6E0, &stru_1003BB020);
  }
  v4 = qword_1003DB6E8;
  BOOL v5 = 1;
  if (os_log_type_enabled((os_log_t)qword_1003DB6E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "is DOE default set, overriding", v13, 2u);
  }
  return v5;
}

- (BOOL)isKappaLoggingDevice
{
  unsigned __int8 v3 = [(CSPlatformInfo *)self isKappaDetectionDevice:self->_hardware];
  BOOL v4 = [(CSPlatformInfo *)self isKappaLoggingDevice:self->_hardware];
  if (v4 && (v3 & 1) == 0 && [(CSPlatformInfo *)self forceDetectionDevice]) {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isKappaLoggingDevice:(unint64_t)a3
{
  if (a3 - 168 > 0x3C) {
    goto LABEL_10;
  }
  if (((1 << (a3 + 88)) & 0x100000037A000015) != 0)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (a3 != 194)
  {
LABEL_10:
    LOBYTE(v5) = 0;
    return v5;
  }
  uint64_t v9 = v3;
  uint64_t v10 = v4;
  if ([(CSPlatformInfo *)self isDOEDeviceDefaultSet])
  {
    if (qword_1003DB6E0 != -1) {
      dispatch_once(&qword_1003DB6E0, &stru_1003BB020);
    }
    v6 = qword_1003DB6E8;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_1003DB6E8, OS_LOG_TYPE_INFO);
    if (v5)
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "is DOE default set, overriding", v8, 2u);
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isEigerDevice
{
  unint64_t hardware = self->_hardware;
  unint64_t v3 = hardware - 137;
  unint64_t v4 = hardware - 193;
  BOOL v6 = v4 <= 8 && v4 != 6;
  return v3 < 0xC || v6;
}

- (BOOL)isSovereignDevice
{
  unint64_t hardware = self->_hardware;
  unint64_t v3 = hardware - 197;
  BOOL v4 = hardware - 141 < 4;
  BOOL v5 = v3 > 0x1F;
  uint64_t v6 = (1 << v3) & 0x8000001BLL;
  return !v5 && v6 != 0 || v4;
}

- (BOOL)isExtendedPretriggerDMDevice
{
  unint64_t hardware = self->_hardware;
  unint64_t v3 = hardware - 154;
  BOOL v4 = hardware - 87 < 4;
  return v3 < 5 || v4;
}

- (BOOL)isExtendedPretriggerMagDevice
{
  unint64_t hardware = self->_hardware;
  unint64_t v3 = hardware - 154;
  BOOL v4 = hardware - 87 < 4;
  return v3 < 5 || v4;
}

- (BOOL)isMDevice
{
  return self->_hardware - 91 < 4;
}

- (int)getSystemReleaseType
{
  if (qword_1003DD7D0 != -1) {
    dispatch_once(&qword_1003DD7D0, &stru_1003BAFC0);
  }
  return dword_1003DD548;
}

- (BOOL)isInternalInstall
{
  v2 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned __int16 v3 = (unsigned __int16)[v2 getBooleanDefault:@"CSKappaForceNotInternal"];

  if (v3 >= 0x100u)
  {
    BOOL v4 = v3 == 0;
    if (qword_1003DB6E0 != -1) {
      dispatch_once(&qword_1003DB6E0, &stru_1003BB020);
    }
    BOOL v5 = qword_1003DB6E8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6E8, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109120;
      v7[1] = v3 == 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "isInternalInstall forcing internal = %d", (uint8_t *)v7, 8u);
    }
  }
  else
  {
    if (qword_1003DD7E0 != -1) {
      dispatch_once(&qword_1003DD7E0, &stru_1003BAFE0);
    }
    return byte_1003DD7D8;
  }
  return v4;
}

- (id)getSystem:(const char *)a3
{
  size_t v5 = 128;
  if (sysctlbyname(a3, v6, &v5, 0, 0)) {
    unsigned __int16 v3 = &stru_1003BC4E8;
  }
  else {
    unsigned __int16 v3 = (__CFString *)[objc_alloc((Class)NSString) initWithUTF8String:v6];
  }

  return v3;
}

- (id)getSystemModel
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031B594;
  block[3] = &unk_10039F568;
  block[4] = self;
  if (qword_1003DD7F0 != -1) {
    dispatch_once(&qword_1003DD7F0, block);
  }
  return (id)qword_1003DD7E8;
}

- (id)getSystemVersionDescription
{
  v2 = _CFCopyServerVersionDictionary();
  if (!v2)
  {
    v2 = _CFCopySystemVersionDictionary();
  }
  unsigned __int16 v3 = [v2 objectForKey:_kCFSystemVersionProductVersionKey];
  BOOL v4 = [v2 objectForKey:_kCFSystemVersionProductNameKey];
  size_t v5 = [v2 objectForKey:_kCFSystemVersionBuildVersionKey];
  CFStringRef v6 = @"???";
  if (v4) {
    CFStringRef v7 = v4;
  }
  else {
    CFStringRef v7 = @"???";
  }
  if (v3) {
    CFStringRef v8 = v3;
  }
  else {
    CFStringRef v8 = @"???";
  }
  if (v5) {
    CFStringRef v6 = v5;
  }
  uint64_t v9 = +[NSString stringWithFormat:@"%@ %@ (%@)", v7, v8, v6];

  return v9;
}

- (id)getSystemVersionDescriptionNoBuild
{
  v2 = _CFCopyServerVersionDictionary();
  if (!v2)
  {
    v2 = _CFCopySystemVersionDictionary();
  }
  unsigned __int16 v3 = [v2 objectForKey:_kCFSystemVersionProductVersionKey];
  BOOL v4 = [v2 objectForKey:_kCFSystemVersionProductNameKey];
  CFStringRef v5 = @"???";
  if (v4) {
    CFStringRef v6 = v4;
  }
  else {
    CFStringRef v6 = @"???";
  }
  if (v3) {
    CFStringRef v5 = v3;
  }
  CFStringRef v7 = +[NSString stringWithFormat:@"%@ %@", v6, v5];

  return v7;
}

- (unint64_t)getSystemHardware
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031B8AC;
  block[3] = &unk_10039F568;
  block[4] = self;
  if (qword_1003DD800 != -1) {
    dispatch_once(&qword_1003DD800, block);
  }
  return qword_1003DD7F8;
}

- (unint64_t)queryEmbeddedSystemHardware
{
  if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
    return 10;
  }
  if (MGIsDeviceOfType()) {
    return 15;
  }
  if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
    return 12;
  }
  if (MGIsDeviceOfType()) {
    return 13;
  }
  if (MGIsDeviceOfType()) {
    return 14;
  }
  if (MGIsDeviceOfType()) {
    return 16;
  }
  if (MGIsDeviceOfType()) {
    return 17;
  }
  int v6 = 1244490093;
  *(_OWORD *)buf = xmmword_10033F670;
  if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
    return 25;
  }
  if (MGIsDeviceOfType()) {
    return 49;
  }
  if (MGIsDeviceOfType()) {
    return 50;
  }
  int v6 = 1839812531;
  *(_OWORD *)buf = xmmword_10033F698;
  if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
    return 50;
  }
  if (MGIsDeviceOfType()) {
    return 82;
  }
  int v6 = -435113336;
  *(_OWORD *)buf = xmmword_10033F6AC;
  if (MGIsDeviceOfType()) {
    return 83;
  }
  int v6 = -1997581659;
  *(_OWORD *)buf = xmmword_10033F6C0;
  if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
    return 187;
  }
  if (MGIsDeviceOfType()) {
    return 18;
  }
  if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
    return 19;
  }
  int v6 = -38605833;
  *(_OWORD *)buf = xmmword_10033F6D4;
  if (MGIsDeviceOfType()) {
    return 20;
  }
  int v6 = -894965712;
  *(_OWORD *)buf = xmmword_10033F6E8;
  if (MGIsDeviceOfType()) {
    return 21;
  }
  if (MGIsDeviceOfType()) {
    return 23;
  }
  int v6 = -926344036;
  *(_OWORD *)buf = xmmword_10033F6FC;
  if (MGIsDeviceOfType()) {
    return 26;
  }
  int v6 = -954998212;
  *(_OWORD *)buf = xmmword_10033F710;
  if (MGIsDeviceOfType()) {
    return 27;
  }
  int v6 = 436612651;
  *(_OWORD *)buf = xmmword_10033F724;
  if (MGIsDeviceOfType()) {
    return 28;
  }
  if (MGIsDeviceOfType()) {
    return 29;
  }
  if (MGIsDeviceOfType()) {
    return 30;
  }
  if (MGIsDeviceOfType()) {
    return 31;
  }
  if (MGIsDeviceOfType()) {
    return 32;
  }
  int v6 = 28030256;
  *(_OWORD *)buf = xmmword_10033F738;
  if (MGIsDeviceOfType()) {
    return 33;
  }
  int v6 = 1214363620;
  *(_OWORD *)buf = xmmword_10033F74C;
  if (MGIsDeviceOfType()) {
    return 34;
  }
  int v6 = -2101636455;
  *(_OWORD *)buf = xmmword_10033F760;
  if (MGIsDeviceOfType()) {
    return 35;
  }
  int v6 = -1955568593;
  *(_OWORD *)buf = xmmword_10033F774;
  if (MGIsDeviceOfType()) {
    return 36;
  }
  int v6 = 1602014129;
  *(_OWORD *)buf = xmmword_10033F788;
  if (MGIsDeviceOfType()) {
    return 37;
  }
  int v6 = -810116762;
  *(_OWORD *)buf = xmmword_10033F79C;
  if (MGIsDeviceOfType()) {
    return 38;
  }
  int v6 = -1195351767;
  *(_OWORD *)buf = xmmword_10033F7B0;
  if (MGIsDeviceOfType()) {
    return 39;
  }
  if (MGIsDeviceOfType()) {
    return 40;
  }
  if (MGIsDeviceOfType()) {
    return 41;
  }
  int v6 = 1789837692;
  *(_OWORD *)buf = xmmword_10033F7C4;
  if (MGIsDeviceOfType()) {
    return 43;
  }
  int v6 = 48355600;
  *(_OWORD *)buf = xmmword_10033F7D8;
  if (MGIsDeviceOfType()) {
    return 44;
  }
  int v6 = -1239654590;
  *(_OWORD *)buf = xmmword_10033F7EC;
  if (MGIsDeviceOfType()) {
    return 45;
  }
  int v6 = -679691073;
  *(_OWORD *)buf = xmmword_10033F800;
  if (MGIsDeviceOfType()) {
    return 46;
  }
  int v6 = -1579092758;
  *(_OWORD *)buf = xmmword_10033F814;
  if (MGIsDeviceOfType()) {
    return 47;
  }
  int v6 = 1430379884;
  *(_OWORD *)buf = xmmword_10033F828;
  if (MGIsDeviceOfType()) {
    return 48;
  }
  if (MGIsDeviceOfType()) {
    return 51;
  }
  int v6 = -798153473;
  *(_OWORD *)buf = xmmword_10033F83C;
  if (MGIsDeviceOfType()) {
    return 52;
  }
  int v6 = -776721724;
  *(_OWORD *)buf = xmmword_10033F850;
  if (MGIsDeviceOfType()) {
    return 53;
  }
  int v6 = -1403227947;
  *(_OWORD *)buf = xmmword_10033F864;
  if (MGIsDeviceOfType()) {
    return 54;
  }
  int v6 = 729118884;
  *(_OWORD *)buf = xmmword_10033F878;
  if (MGIsDeviceOfType()) {
    return 55;
  }
  int v6 = 1046806126;
  *(_OWORD *)buf = xmmword_10033F88C;
  if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
    return 56;
  }
  int v6 = -489993439;
  *(_OWORD *)buf = xmmword_10033F8B4;
  if (MGIsDeviceOfType()) {
    return 57;
  }
  int v6 = 886875686;
  *(_OWORD *)buf = xmmword_10033F8C8;
  if (MGIsDeviceOfType()) {
    return 58;
  }
  int v6 = -1639077591;
  *(_OWORD *)buf = xmmword_10033F8DC;
  if (MGIsDeviceOfType()) {
    return 59;
  }
  int v6 = 338555555;
  *(_OWORD *)buf = xmmword_10033F8F0;
  if (MGIsDeviceOneOfType()) {
    return 60;
  }
  int v6 = 1032708406;
  *(_OWORD *)buf = xmmword_10033F904;
  if (MGIsDeviceOfType()) {
    return 61;
  }
  int v6 = 729903963;
  *(_OWORD *)buf = xmmword_10033F918;
  if (MGIsDeviceOfType()) {
    return 62;
  }
  int v6 = 1278131292;
  *(_OWORD *)buf = xmmword_10033F92C;
  if (MGIsDeviceOfType()) {
    return 63;
  }
  int v6 = -1841712216;
  *(_OWORD *)buf = xmmword_10033F940;
  if (MGIsDeviceOfType()) {
    return 64;
  }
  int v6 = 1275676051;
  *(_OWORD *)buf = xmmword_10033F954;
  if (MGIsDeviceOfType()) {
    return 65;
  }
  int v6 = 1908474541;
  *(_OWORD *)buf = xmmword_10033F968;
  if (MGIsDeviceOfType()) {
    return 66;
  }
  int v6 = -1022451852;
  *(_OWORD *)buf = xmmword_10033F97C;
  if (MGIsDeviceOfType()) {
    return 100;
  }
  int v6 = 1729782187;
  *(_OWORD *)buf = xmmword_10033F990;
  if (MGIsDeviceOfType()) {
    return 101;
  }
  if (MGIsDeviceOfType()) {
    return 67;
  }
  int v6 = 368885834;
  *(_OWORD *)buf = xmmword_10033F9A4;
  if (MGIsDeviceOfType()) {
    return 68;
  }
  int v6 = -414334491;
  *(_OWORD *)buf = xmmword_10033F9B8;
  if (MGIsDeviceOfType()) {
    return 69;
  }
  if (MGIsDeviceOfType()) {
    return 70;
  }
  int v6 = -526227167;
  *(_OWORD *)buf = xmmword_10033F9CC;
  if (MGIsDeviceOfType()) {
    return 71;
  }
  int v6 = -1509831889;
  *(_OWORD *)buf = xmmword_10033F9E0;
  if (MGIsDeviceOfType()) {
    return 72;
  }
  int v6 = 1960366092;
  *(_OWORD *)buf = xmmword_10033F9F4;
  if (MGIsDeviceOfType()) {
    return 73;
  }
  int v6 = -2114570942;
  *(_OWORD *)buf = xmmword_10033FA08;
  if (MGIsDeviceOfType()) {
    return 177;
  }
  int v6 = -1527788847;
  *(_OWORD *)buf = xmmword_10033FA1C;
  if (MGIsDeviceOfType()) {
    return 74;
  }
  int v6 = 1532898719;
  *(_OWORD *)buf = xmmword_10033FA30;
  if (MGIsDeviceOfType()) {
    return 75;
  }
  int v6 = 996646949;
  *(_OWORD *)buf = xmmword_10033FA44;
  if (MGIsDeviceOfType()) {
    return 76;
  }
  int v6 = -563086000;
  *(_OWORD *)buf = xmmword_10033FA58;
  if (MGIsDeviceOfType()) {
    return 77;
  }
  int v6 = 659506830;
  *(_OWORD *)buf = xmmword_10033FA6C;
  if (MGIsDeviceOfType()) {
    return 78;
  }
  int v6 = 213746202;
  *(_OWORD *)buf = xmmword_10033FA80;
  if (MGIsDeviceOfType()) {
    return 79;
  }
  int v6 = 289690957;
  *(_OWORD *)buf = xmmword_10033FA94;
  if (MGIsDeviceOfType()) {
    return 80;
  }
  int v6 = 586720268;
  *(_OWORD *)buf = xmmword_10033FAA8;
  if (MGIsDeviceOfType()) {
    return 81;
  }
  int v6 = -350584140;
  *(_OWORD *)buf = xmmword_10033FABC;
  if (MGIsDeviceOfType()) {
    return 84;
  }
  int v6 = 368778837;
  *(_OWORD *)buf = xmmword_10033FAD0;
  if (MGIsDeviceOfType()) {
    return 85;
  }
  if (MGIsDeviceOfType()) {
    return 86;
  }
  int v6 = -609570151;
  *(_OWORD *)buf = xmmword_10033FAE4;
  if (MGIsDeviceOfType()) {
    return 87;
  }
  int v6 = -874769875;
  *(_OWORD *)buf = xmmword_10033FAF8;
  if (MGIsDeviceOfType()) {
    return 88;
  }
  int v6 = 1223847566;
  *(_OWORD *)buf = xmmword_10033FB0C;
  if (MGIsDeviceOfType()) {
    return 91;
  }
  int v6 = 185580364;
  *(_OWORD *)buf = xmmword_10033FB20;
  if (MGIsDeviceOfType()) {
    return 92;
  }
  int v6 = -1418383976;
  *(_OWORD *)buf = xmmword_10033FB34;
  if (MGIsDeviceOfType()) {
    return 95;
  }
  int v6 = -1213485500;
  *(_OWORD *)buf = xmmword_10033FB48;
  if (MGIsDeviceOfType()) {
    return 96;
  }
  if (MGIsDeviceOfType()) {
    return 97;
  }
  int v6 = 1425254930;
  *(_OWORD *)buf = xmmword_10033FB5C;
  if (MGIsDeviceOfType()) {
    return 98;
  }
  int v6 = 1899561076;
  *(_OWORD *)buf = xmmword_10033FB70;
  if (MGIsDeviceOfType()) {
    return 99;
  }
  int v6 = -199226823;
  *(_OWORD *)buf = xmmword_10033FB84;
  if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
    return 102;
  }
  int v6 = -1283070668;
  *(_OWORD *)buf = xmmword_10033FBAC;
  if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
    return 103;
  }
  int v6 = 1711910369;
  *(_OWORD *)buf = xmmword_10033FBD4;
  if (MGIsDeviceOfType()) {
    return 104;
  }
  int v6 = -1282800328;
  *(_OWORD *)buf = xmmword_10033FBE8;
  if (MGIsDeviceOfType()) {
    return 105;
  }
  int v6 = 897736383;
  *(_OWORD *)buf = xmmword_10033FBFC;
  if (MGIsDeviceOfType()) {
    return 106;
  }
  int v6 = -453987047;
  *(_OWORD *)buf = xmmword_10033FC10;
  if (MGIsDeviceOfType()) {
    return 107;
  }
  int v6 = 450980336;
  *(_OWORD *)buf = xmmword_10033FC24;
  if (MGIsDeviceOfType()) {
    return 108;
  }
  int v6 = 414393924;
  *(_OWORD *)buf = xmmword_10033FC38;
  if (MGIsDeviceOfType()) {
    return 109;
  }
  int v6 = -996295886;
  *(_OWORD *)buf = xmmword_10033FC4C;
  if (MGIsDeviceOfType()) {
    return 110;
  }
  int v6 = -337121064;
  *(_OWORD *)buf = xmmword_10033FC60;
  if (MGIsDeviceOfType()) {
    return 111;
  }
  int v6 = -2092955395;
  *(_OWORD *)buf = xmmword_10033FC74;
  if (MGIsDeviceOfType()) {
    return 112;
  }
  int v6 = 674998600;
  *(_OWORD *)buf = xmmword_10033FC88;
  if (MGIsDeviceOfType()) {
    return 113;
  }
  int v6 = 317289457;
  *(_OWORD *)buf = xmmword_10033FC9C;
  if (MGIsDeviceOfType()) {
    return 114;
  }
  int v6 = 401945557;
  *(_OWORD *)buf = xmmword_10033FCB0;
  if (MGIsDeviceOfType()) {
    return 115;
  }
  int v6 = -232427879;
  *(_OWORD *)buf = xmmword_10033FCC4;
  if (MGIsDeviceOfType()) {
    return 116;
  }
  int v6 = -427474227;
  *(_OWORD *)buf = xmmword_10033FCD8;
  if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
    return 117;
  }
  int v6 = -1843102369;
  *(_OWORD *)buf = xmmword_10033FD00;
  if (MGIsDeviceOfType()) {
    return 118;
  }
  if (MGIsDeviceOfType()) {
    return 119;
  }
  int v6 = 470738981;
  *(_OWORD *)buf = xmmword_10033FD14;
  if (MGIsDeviceOfType()) {
    return 120;
  }
  if (MGIsDeviceOfType()) {
    return 121;
  }
  int v6 = 710807826;
  *(_OWORD *)buf = xmmword_10033FD28;
  if (MGIsDeviceOfType()) {
    return 122;
  }
  if (MGIsDeviceOfType()) {
    return 123;
  }
  int v6 = 1860682089;
  *(_OWORD *)buf = xmmword_10033FD3C;
  if (MGIsDeviceOfType()) {
    return 124;
  }
  if (MGIsDeviceOfType()) {
    return 125;
  }
  int v6 = -2085056298;
  *(_OWORD *)buf = xmmword_10033FD50;
  if (MGIsDeviceOfType()) {
    return 126;
  }
  int v6 = 2146530832;
  *(_OWORD *)buf = xmmword_10033FD64;
  if (MGIsDeviceOfType()) {
    return 127;
  }
  int v6 = -1742178852;
  *(_OWORD *)buf = xmmword_10033FD78;
  if (MGIsDeviceOfType()) {
    return 128;
  }
  int v6 = 617174804;
  *(_OWORD *)buf = xmmword_10033FD8C;
  if (MGIsDeviceOfType()) {
    return 129;
  }
  int v6 = 1330813729;
  *(_OWORD *)buf = xmmword_10033FDA0;
  if (MGIsDeviceOfType()) {
    return 130;
  }
  if (MGIsDeviceOfType()) {
    return 131;
  }
  if (MGIsDeviceOfType()) {
    return 132;
  }
  int v6 = 152704997;
  *(_OWORD *)buf = xmmword_10033FDB4;
  if (MGIsDeviceOfType()) {
    return 133;
  }
  int v6 = -338255497;
  *(_OWORD *)buf = xmmword_10033FDC8;
  if (MGIsDeviceOfType()) {
    return 134;
  }
  int v6 = -1040127899;
  *(_OWORD *)buf = xmmword_10033FDDC;
  if (MGIsDeviceOfType()) {
    return 135;
  }
  int v6 = 283967174;
  *(_OWORD *)buf = xmmword_10033FDF0;
  if (MGIsDeviceOfType()) {
    return 136;
  }
  int v6 = 1530707451;
  *(_OWORD *)buf = xmmword_10033FE04;
  if (MGIsDeviceOfType()) {
    return 137;
  }
  int v6 = -871113647;
  *(_OWORD *)buf = xmmword_10033FE18;
  if (MGIsDeviceOfType()) {
    return 138;
  }
  int v6 = 483476120;
  *(_OWORD *)buf = xmmword_10033FE2C;
  if (MGIsDeviceOfType()) {
    return 139;
  }
  int v6 = 1472775220;
  *(_OWORD *)buf = xmmword_10033FE40;
  if (MGIsDeviceOfType()) {
    return 140;
  }
  int v6 = 56502976;
  *(_OWORD *)buf = xmmword_10033FE54;
  if (MGIsDeviceOfType()) {
    return 141;
  }
  int v6 = 282158961;
  *(_OWORD *)buf = xmmword_10033FE68;
  if (MGIsDeviceOfType()) {
    return 142;
  }
  int v6 = 1282132887;
  *(_OWORD *)buf = xmmword_10033FE7C;
  if (MGIsDeviceOfType()) {
    return 143;
  }
  int v6 = -961843768;
  *(_OWORD *)buf = xmmword_10033FE90;
  if (MGIsDeviceOfType()) {
    return 144;
  }
  int v6 = 1326690998;
  *(_OWORD *)buf = xmmword_10033FEA4;
  if (MGIsDeviceOfType()) {
    return 145;
  }
  int v6 = -441172408;
  *(_OWORD *)buf = xmmword_10033FEB8;
  if (MGIsDeviceOfType()) {
    return 146;
  }
  int v6 = -126099363;
  *(_OWORD *)buf = xmmword_10033FECC;
  if (MGIsDeviceOfType()) {
    return 147;
  }
  int v6 = 1756484512;
  *(_OWORD *)buf = xmmword_10033FEE0;
  if (MGIsDeviceOfType()) {
    return 148;
  }
  int v6 = 763775061;
  *(_OWORD *)buf = xmmword_10033FEF4;
  if (MGIsDeviceOfType()) {
    return 149;
  }
  int v6 = -1092155788;
  *(_OWORD *)buf = xmmword_10033FF08;
  if (MGIsDeviceOfType()) {
    return 150;
  }
  int v6 = -557458837;
  *(_OWORD *)buf = xmmword_10033FF1C;
  if (MGIsDeviceOfType()) {
    return 151;
  }
  int v6 = -63049871;
  *(_OWORD *)buf = xmmword_10033FF30;
  if (MGIsDeviceOfType()) {
    return 152;
  }
  int v6 = 1730000236;
  *(_OWORD *)buf = xmmword_10033FF44;
  if (MGIsDeviceOfType()) {
    return 153;
  }
  int v6 = 406601745;
  *(_OWORD *)buf = xmmword_10033FF58;
  if (MGIsDeviceOfType()) {
    return 154;
  }
  int v6 = 1530338216;
  *(_OWORD *)buf = xmmword_10033FF6C;
  if (MGIsDeviceOfType()) {
    return 155;
  }
  int v6 = -1930811061;
  *(_OWORD *)buf = xmmword_10033FF80;
  if (MGIsDeviceOfType()) {
    return 156;
  }
  int v6 = 1654218604;
  *(_OWORD *)buf = xmmword_10033FF94;
  if (MGIsDeviceOfType()) {
    return 157;
  }
  int v6 = -182498503;
  *(_OWORD *)buf = xmmword_10033FFA8;
  if (MGIsDeviceOfType()) {
    return 158;
  }
  int v6 = -2030489149;
  *(_OWORD *)buf = xmmword_10033FFBC;
  if (MGIsDeviceOfType()) {
    return 159;
  }
  int v6 = 841005628;
  *(_OWORD *)buf = xmmword_10033FFD0;
  if (MGIsDeviceOfType()) {
    return 160;
  }
  int v6 = 223445260;
  *(_OWORD *)buf = xmmword_10033FFE4;
  if (MGIsDeviceOfType()) {
    return 161;
  }
  int v6 = 1219348060;
  *(_OWORD *)buf = xmmword_10033FFF8;
  if (MGIsDeviceOfType()) {
    return 162;
  }
  int v6 = 2030516999;
  *(_OWORD *)buf = xmmword_10034000C;
  if (MGIsDeviceOneOfType()) {
    return 163;
  }
  int v6 = -762483149;
  *(_OWORD *)buf = xmmword_100340034;
  if (MGIsDeviceOneOfType()) {
    return 164;
  }
  int v6 = -1902732724;
  *(_OWORD *)buf = xmmword_10034005C;
  if (MGIsDeviceOneOfType()) {
    return 165;
  }
  int v6 = 300442574;
  *(_OWORD *)buf = xmmword_100340084;
  if (MGIsDeviceOneOfType()) {
    return 166;
  }
  if (MGIsDeviceOfType()) {
    return 167;
  }
  int v6 = -61007701;
  *(_OWORD *)buf = xmmword_1003400AC;
  if (MGIsDeviceOfType()) {
    return 168;
  }
  if (MGIsDeviceOfType()) {
    return 169;
  }
  int v6 = -235416490;
  *(_OWORD *)buf = xmmword_1003400C0;
  if (MGIsDeviceOfType()) {
    return 170;
  }
  int v6 = -820493242;
  *(_OWORD *)buf = xmmword_1003400D4;
  if (MGIsDeviceOfType()) {
    return 172;
  }
  int v6 = -1157300313;
  *(_OWORD *)buf = xmmword_1003400E8;
  if (MGIsDeviceOfType()) {
    return 173;
  }
  int v6 = -2132668294;
  *(_OWORD *)buf = xmmword_1003400FC;
  if (MGIsDeviceOfType()) {
    return 174;
  }
  if (MGIsDeviceOfType()) {
    return 175;
  }
  if (MGIsDeviceOfType()) {
    return 176;
  }
  if (MGIsDeviceOfType()) {
    return 178;
  }
  if (MGIsDeviceOfType()) {
    return 179;
  }
  int v6 = 1737149739;
  *(_OWORD *)buf = xmmword_100340110;
  if (MGIsDeviceOfType()) {
    return 180;
  }
  int v6 = 1577888303;
  *(_OWORD *)buf = xmmword_100340124;
  if (MGIsDeviceOfType()) {
    return 181;
  }
  int v6 = -1918230744;
  *(_OWORD *)buf = xmmword_100340138;
  if (MGIsDeviceOfType()) {
    return 182;
  }
  int v6 = 1126727276;
  *(_OWORD *)buf = xmmword_10034014C;
  if (MGIsDeviceOfType()) {
    return 183;
  }
  int v6 = 300130091;
  *(_OWORD *)buf = xmmword_100340160;
  if (MGIsDeviceOfType()) {
    return 184;
  }
  int v6 = 343814884;
  *(_OWORD *)buf = xmmword_100340174;
  if (MGIsDeviceOfType()) {
    return 185;
  }
  int v6 = -1675932945;
  *(_OWORD *)buf = xmmword_100340188;
  if (MGIsDeviceOfType()) {
    return 186;
  }
  if (MGIsDeviceOfType()) {
    return 188;
  }
  if (MGIsDeviceOfType()) {
    return 189;
  }
  if (MGIsDeviceOfType()) {
    return 191;
  }
  int v6 = -1840391155;
  *(_OWORD *)buf = xmmword_10034019C;
  if (MGIsDeviceOfType()) {
    return 192;
  }
  int v6 = -121925081;
  *(_OWORD *)buf = xmmword_1003401B0;
  if (MGIsDeviceOfType()) {
    return 171;
  }
  int v6 = 1071957977;
  *(_OWORD *)buf = xmmword_1003401C4;
  if (MGIsDeviceOfType()) {
    return 193;
  }
  int v6 = 438437663;
  *(_OWORD *)buf = xmmword_1003401D8;
  if (MGIsDeviceOfType()) {
    return 194;
  }
  int v6 = 1575123478;
  *(_OWORD *)buf = xmmword_1003401EC;
  if (MGIsDeviceOfType()) {
    return 195;
  }
  int v6 = -382792827;
  *(_OWORD *)buf = xmmword_100340200;
  if (MGIsDeviceOfType()) {
    return 196;
  }
  int v6 = 123138233;
  *(_OWORD *)buf = xmmword_100340214;
  if (MGIsDeviceOfType()) {
    return 197;
  }
  int v6 = 681511593;
  *(_OWORD *)buf = xmmword_100340228;
  if (MGIsDeviceOfType()) {
    return 198;
  }
  if (MGIsDeviceOfType()) {
    return 199;
  }
  int v6 = 713503427;
  *(_OWORD *)buf = xmmword_10034023C;
  if (MGIsDeviceOfType()) {
    return 200;
  }
  int v6 = -1632750650;
  *(_OWORD *)buf = xmmword_100340250;
  if (MGIsDeviceOfType()) {
    return 201;
  }
  int v6 = -1820426635;
  *(_OWORD *)buf = xmmword_100340264;
  if (MGIsDeviceOfType()) {
    return 202;
  }
  int v6 = -937652876;
  *(_OWORD *)buf = xmmword_100340278;
  if (MGIsDeviceOfType()) {
    return 203;
  }
  int v6 = 1874287171;
  *(_OWORD *)buf = xmmword_10034028C;
  if (MGIsDeviceOfType()) {
    return 89;
  }
  int v6 = -781324731;
  *(_OWORD *)buf = xmmword_1003402A0;
  if (MGIsDeviceOfType()) {
    return 90;
  }
  int v6 = 1214880059;
  *(_OWORD *)buf = xmmword_1003402B4;
  if (MGIsDeviceOfType()) {
    return 93;
  }
  int v6 = 426359977;
  *(_OWORD *)buf = xmmword_1003402C8;
  if (MGIsDeviceOfType()) {
    return 94;
  }
  if (MGIsDeviceOfType()) {
    return 237;
  }
  if (MGIsDeviceOfType()) {
    return 190;
  }
  if (MGIsDeviceOfType()) {
    return 204;
  }
  int v6 = 345196535;
  *(_OWORD *)buf = xmmword_1003402DC;
  if (MGIsDeviceOfType()) {
    return 205;
  }
  int v6 = 440949464;
  *(_OWORD *)buf = xmmword_1003402F0;
  if (MGIsDeviceOfType()) {
    return 206;
  }
  int v6 = 688565114;
  *(_OWORD *)buf = xmmword_100340304;
  if (MGIsDeviceOfType()) {
    return 207;
  }
  int v6 = -493418906;
  *(_OWORD *)buf = xmmword_100340318;
  if (MGIsDeviceOfType()) {
    return 208;
  }
  if (MGIsDeviceOfType()) {
    return 209;
  }
  int v6 = -584398440;
  *(_OWORD *)buf = xmmword_10034032C;
  if (MGIsDeviceOfType()) {
    return 214;
  }
  int v6 = -879476163;
  *(_OWORD *)buf = xmmword_100340340;
  if (MGIsDeviceOfType()) {
    return 215;
  }
  int v6 = -695298128;
  *(_OWORD *)buf = xmmword_100340354;
  if (MGIsDeviceOneOfType()) {
    return 216;
  }
  int v6 = 1614584579;
  *(_OWORD *)buf = xmmword_10034037C;
  if (MGIsDeviceOneOfType()) {
    return 217;
  }
  int v6 = 460218192;
  *(_OWORD *)buf = xmmword_1003403A4;
  if (MGIsDeviceOneOfType()) {
    return 218;
  }
  int v6 = 127894440;
  *(_OWORD *)buf = xmmword_1003403CC;
  if (MGIsDeviceOneOfType()) {
    return 219;
  }
  int v6 = 372777383;
  *(_OWORD *)buf = xmmword_1003403F4;
  if (MGIsDeviceOfType()) {
    return 220;
  }
  int v6 = -858079590;
  *(_OWORD *)buf = xmmword_100340408;
  if (MGIsDeviceOfType()) {
    return 221;
  }
  int v6 = -212523443;
  *(_OWORD *)buf = xmmword_10034041C;
  if (MGIsDeviceOfType()) {
    return 222;
  }
  int v6 = 646100384;
  *(_OWORD *)buf = xmmword_100340430;
  if (MGIsDeviceOfType()) {
    return 223;
  }
  int v6 = -340360463;
  *(_OWORD *)buf = xmmword_100340444;
  if (MGIsDeviceOfType()) {
    return 224;
  }
  int v6 = 1605231531;
  *(_OWORD *)buf = xmmword_100340458;
  if (MGIsDeviceOfType()) {
    return 225;
  }
  int v6 = -545612308;
  *(_OWORD *)buf = xmmword_10034046C;
  if (MGIsDeviceOfType()) {
    return 226;
  }
  int v6 = 1178062702;
  *(_OWORD *)buf = xmmword_100340480;
  if (MGIsDeviceOfType()) {
    return 227;
  }
  int v6 = -1431778695;
  *(_OWORD *)buf = xmmword_100340494;
  if (MGIsDeviceOfType()) {
    return 228;
  }
  int v6 = 533419158;
  *(_OWORD *)buf = xmmword_1003404A8;
  if (MGIsDeviceOfType()) {
    return 229;
  }
  int v6 = 1106979518;
  *(_OWORD *)buf = xmmword_1003404BC;
  if (MGIsDeviceOfType()) {
    return 230;
  }
  int v6 = 1878025452;
  *(_OWORD *)buf = xmmword_1003404D0;
  if (MGIsDeviceOfType()) {
    return 231;
  }
  int v6 = 1725957070;
  *(_OWORD *)buf = xmmword_1003404E4;
  if (MGIsDeviceOfType()) {
    return 232;
  }
  int v6 = 538967431;
  *(_OWORD *)buf = xmmword_1003404F8;
  if (MGIsDeviceOfType()) {
    return 233;
  }
  int v6 = 2060712151;
  *(_OWORD *)buf = xmmword_10034050C;
  if (MGIsDeviceOfType()) {
    return 234;
  }
  if (MGIsDeviceOfType()) {
    return 171;
  }
  int v6 = -1819593402;
  *(_OWORD *)buf = xmmword_100340520;
  if (MGIsDeviceOneOfType()) {
    return 1;
  }
  unint64_t result = MGCopyAnswer();
  if (result)
  {
    unsigned __int16 v3 = (const void *)result;
    BOOL v4 = sub_100319B04();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "unknown HW model %{private}@", buf, 0xCu);
    }

    CFRelease(v3);
    return 0;
  }
  return result;
}

- (id)getSerialNumber
{
  if (qword_1003DD810 != -1) {
    dispatch_once(&qword_1003DD810, &stru_1003BB000);
  }
  v2 = (void *)qword_1003DD808;

  return v2;
}

- (unint64_t)hardware
{
  return self->_hardware;
}

- (NSDictionary)hardwareMap
{
  return self->_hardwareMap;
}

- (BOOL)isSimulated
{
  return self->_isSimulated;
}

- (void).cxx_destruct
{
}

@end