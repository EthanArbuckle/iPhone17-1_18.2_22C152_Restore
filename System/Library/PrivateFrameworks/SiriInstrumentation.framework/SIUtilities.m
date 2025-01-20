@interface SIUtilities
+ (int)convertCountryCodeToSchemaCountryCode:(id)a3;
+ (int)convertLanguageCodeToSchemaLocale:(id)a3;
@end

@implementation SIUtilities

+ (int)convertCountryCodeToSchemaCountryCode:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = [a3 uppercaseString];
  if ([v3 isEqualToString:@"AD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AE"])
  {
    int v4 = 222;
  }
  else if ([v3 isEqualToString:@"AF"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AG"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AI"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AM"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AO"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AQ"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AR"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"AS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AT"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"AU"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"AW"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AX"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AZ"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"BA"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"BB"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"BD"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"BE"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"BF"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"BG"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"BH"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"BI"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"BJ"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"BL"])
  {
    int v4 = 248;
  }
  else if ([v3 isEqualToString:@"BM"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"BN"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"BO"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"BQ"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"BR"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"BS"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"BT"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"BV"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"BW"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"BY"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"BZ"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"CA"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"CC"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"CD"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"CF"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"CG"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"CH"])
  {
    int v4 = 204;
  }
  else if ([v3 isEqualToString:@"CI"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"CK"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"CL"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"CM"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"CN"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"CO"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"CR"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"CU"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"CV"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"CW"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"CX"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"CY"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"CZ"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"DE"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"DJ"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"DK"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"DM"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"DO"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"DZ"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EC"])
  {
    int v4 = 238;
  }
  else if ([v3 isEqualToString:@"EE"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"EG"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"EH"])
  {
    int v4 = 234;
  }
  else if ([v3 isEqualToString:@"ER"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"ES"])
  {
    int v4 = 198;
  }
  else if ([v3 isEqualToString:@"ET"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"FI"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"FJ"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"FK"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"FM"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"FO"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"FR"])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:@"GA"])
  {
    int v4 = 79;
  }
  else if ([v3 isEqualToString:@"GB"])
  {
    int v4 = 223;
  }
  else if ([v3 isEqualToString:@"GD"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"GE"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"GF"])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:@"GG"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"GH"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"GI"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"GL"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"GM"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"GN"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"GP"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"GQ"])
  {
    int v4 = 239;
  }
  else if ([v3 isEqualToString:@"GR"])
  {
    int v4 = 240;
  }
  else if ([v3 isEqualToString:@"GS"])
  {
    int v4 = 196;
  }
  else if ([v3 isEqualToString:@"GT"])
  {
    int v4 = 89;
  }
  else if ([v3 isEqualToString:@"GU"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"GW"])
  {
    int v4 = 92;
  }
  else if ([v3 isEqualToString:@"GY"])
  {
    int v4 = 93;
  }
  else if ([v3 isEqualToString:@"HK"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"HM"])
  {
    int v4 = 241;
  }
  else if ([v3 isEqualToString:@"HN"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"HR"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"HT"])
  {
    int v4 = 94;
  }
  else if ([v3 isEqualToString:@"HU"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"ID"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"IE"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"IL"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"IM"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"IN"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"IO"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"IQ"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"IR"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"IS"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"IT"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"JE"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"JM"])
  {
    int v4 = 242;
  }
  else if ([v3 isEqualToString:@"JO"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"JP"])
  {
    int v4 = 243;
  }
  else if ([v3 isEqualToString:@"KE"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"KG"])
  {
    int v4 = 116;
  }
  else if ([v3 isEqualToString:@"KH"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"KI"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"KM"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"KN"])
  {
    int v4 = 178;
  }
  else if ([v3 isEqualToString:@"KP"])
  {
    int v4 = 113;
  }
  else if ([v3 isEqualToString:@"KR"])
  {
    int v4 = 114;
  }
  else if ([v3 isEqualToString:@"KW"])
  {
    int v4 = 115;
  }
  else if ([v3 isEqualToString:@"KY"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"KZ"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"LA"])
  {
    int v4 = 117;
  }
  else if ([v3 isEqualToString:@"LB"])
  {
    int v4 = 119;
  }
  else if ([v3 isEqualToString:@"LC"])
  {
    int v4 = 179;
  }
  else if ([v3 isEqualToString:@"LI"])
  {
    int v4 = 123;
  }
  else if ([v3 isEqualToString:@"LK"])
  {
    int v4 = 199;
  }
  else if ([v3 isEqualToString:@"LR"])
  {
    int v4 = 121;
  }
  else if ([v3 isEqualToString:@"LS"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"LT"])
  {
    int v4 = 124;
  }
  else if ([v3 isEqualToString:@"LU"])
  {
    int v4 = 125;
  }
  else if ([v3 isEqualToString:@"LV"])
  {
    int v4 = 118;
  }
  else if ([v3 isEqualToString:@"LY"])
  {
    int v4 = 122;
  }
  else if ([v3 isEqualToString:@"MA"])
  {
    int v4 = 146;
  }
  else if ([v3 isEqualToString:@"MC"])
  {
    int v4 = 142;
  }
  else if ([v3 isEqualToString:@"MD"])
  {
    int v4 = 141;
  }
  else if ([v3 isEqualToString:@"ME"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"MF"])
  {
    int v4 = 180;
  }
  else if ([v3 isEqualToString:@"MG"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"MH"])
  {
    int v4 = 134;
  }
  else if ([v3 isEqualToString:@"MK"])
  {
    int v4 = 127;
  }
  else if ([v3 isEqualToString:@"ML"])
  {
    int v4 = 132;
  }
  else if ([v3 isEqualToString:@"MM"])
  {
    int v4 = 148;
  }
  else if ([v3 isEqualToString:@"MN"])
  {
    int v4 = 143;
  }
  else if ([v3 isEqualToString:@"MO"])
  {
    int v4 = 126;
  }
  else if ([v3 isEqualToString:@"MP"])
  {
    int v4 = 245;
  }
  else if ([v3 isEqualToString:@"MQ"])
  {
    int v4 = 135;
  }
  else if ([v3 isEqualToString:@"MR"])
  {
    int v4 = 136;
  }
  else if ([v3 isEqualToString:@"MS"])
  {
    int v4 = 145;
  }
  else if ([v3 isEqualToString:@"MT"])
  {
    int v4 = 133;
  }
  else if ([v3 isEqualToString:@"MU"])
  {
    int v4 = 137;
  }
  else if ([v3 isEqualToString:@"MV"])
  {
    int v4 = 131;
  }
  else if ([v3 isEqualToString:@"MW"])
  {
    int v4 = 129;
  }
  else if ([v3 isEqualToString:@"MX"])
  {
    int v4 = 139;
  }
  else if ([v3 isEqualToString:@"MY"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"MZ"])
  {
    int v4 = 147;
  }
  else if ([v3 isEqualToString:@"NA"])
  {
    int v4 = 149;
  }
  else if ([v3 isEqualToString:@"NC"])
  {
    int v4 = 153;
  }
  else if ([v3 isEqualToString:@"NE"])
  {
    int v4 = 156;
  }
  else if ([v3 isEqualToString:@"NF"])
  {
    int v4 = 159;
  }
  else if ([v3 isEqualToString:@"NG"])
  {
    int v4 = 157;
  }
  else if ([v3 isEqualToString:@"NI"])
  {
    int v4 = 155;
  }
  else if ([v3 isEqualToString:@"NL"])
  {
    int v4 = 152;
  }
  else if ([v3 isEqualToString:@"NO"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"NP"])
  {
    int v4 = 151;
  }
  else if ([v3 isEqualToString:@"NR"])
  {
    int v4 = 150;
  }
  else if ([v3 isEqualToString:@"NU"])
  {
    int v4 = 158;
  }
  else if ([v3 isEqualToString:@"NZ"])
  {
    int v4 = 154;
  }
  else if ([v3 isEqualToString:@"OM"])
  {
    int v4 = 161;
  }
  else if ([v3 isEqualToString:@"PA"])
  {
    int v4 = 165;
  }
  else if ([v3 isEqualToString:@"PE"])
  {
    int v4 = 246;
  }
  else if ([v3 isEqualToString:@"PF"])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:@"PG"])
  {
    int v4 = 166;
  }
  else if ([v3 isEqualToString:@"PH"])
  {
    int v4 = 168;
  }
  else if ([v3 isEqualToString:@"PK"])
  {
    int v4 = 162;
  }
  else if ([v3 isEqualToString:@"PL"])
  {
    int v4 = 170;
  }
  else if ([v3 isEqualToString:@"PM"])
  {
    int v4 = 181;
  }
  else if ([v3 isEqualToString:@"PN"])
  {
    int v4 = 169;
  }
  else if ([v3 isEqualToString:@"PR"])
  {
    int v4 = 172;
  }
  else if ([v3 isEqualToString:@"PS"])
  {
    int v4 = 164;
  }
  else if ([v3 isEqualToString:@"PT"])
  {
    int v4 = 171;
  }
  else if ([v3 isEqualToString:@"PW"])
  {
    int v4 = 163;
  }
  else if ([v3 isEqualToString:@"PY"])
  {
    int v4 = 167;
  }
  else if ([v3 isEqualToString:@"QA"])
  {
    int v4 = 173;
  }
  else if ([v3 isEqualToString:@"RE"])
  {
    int v4 = 247;
  }
  else if ([v3 isEqualToString:@"RO"])
  {
    int v4 = 174;
  }
  else if ([v3 isEqualToString:@"RS"])
  {
    int v4 = 187;
  }
  else if ([v3 isEqualToString:@"RU"])
  {
    int v4 = 175;
  }
  else if ([v3 isEqualToString:@"RW"])
  {
    int v4 = 176;
  }
  else if ([v3 isEqualToString:@"SA"])
  {
    int v4 = 186;
  }
  else if ([v3 isEqualToString:@"SB"])
  {
    int v4 = 193;
  }
  else if ([v3 isEqualToString:@"SC"])
  {
    int v4 = 188;
  }
  else if ([v3 isEqualToString:@"SD"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"SE"])
  {
    int v4 = 203;
  }
  else if ([v3 isEqualToString:@"SG"])
  {
    int v4 = 190;
  }
  else if ([v3 isEqualToString:@"SH"])
  {
    int v4 = 177;
  }
  else if ([v3 isEqualToString:@"SI"])
  {
    int v4 = 192;
  }
  else if ([v3 isEqualToString:@"SJ"])
  {
    int v4 = 202;
  }
  else if ([v3 isEqualToString:@"SK"])
  {
    int v4 = 191;
  }
  else if ([v3 isEqualToString:@"SL"])
  {
    int v4 = 189;
  }
  else if ([v3 isEqualToString:@"SM"])
  {
    int v4 = 184;
  }
  else if ([v3 isEqualToString:@"SN"])
  {
    int v4 = 249;
  }
  else if ([v3 isEqualToString:@"SO"])
  {
    int v4 = 194;
  }
  else if ([v3 isEqualToString:@"SR"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"SS"])
  {
    int v4 = 197;
  }
  else if ([v3 isEqualToString:@"ST"])
  {
    int v4 = 185;
  }
  else if ([v3 isEqualToString:@"SV"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"SX"])
  {
    int v4 = 250;
  }
  else if ([v3 isEqualToString:@"SY"])
  {
    int v4 = 205;
  }
  else if ([v3 isEqualToString:@"SZ"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"TC"])
  {
    int v4 = 218;
  }
  else if ([v3 isEqualToString:@"TD"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"TF"])
  {
    int v4 = 78;
  }
  else if ([v3 isEqualToString:@"TG"])
  {
    int v4 = 211;
  }
  else if ([v3 isEqualToString:@"TH"])
  {
    int v4 = 209;
  }
  else if ([v3 isEqualToString:@"TJ"])
  {
    int v4 = 207;
  }
  else if ([v3 isEqualToString:@"TK"])
  {
    int v4 = 212;
  }
  else if ([v3 isEqualToString:@"TL"])
  {
    int v4 = 210;
  }
  else if ([v3 isEqualToString:@"TM"])
  {
    int v4 = 217;
  }
  else if ([v3 isEqualToString:@"TN"])
  {
    int v4 = 215;
  }
  else if ([v3 isEqualToString:@"TO"])
  {
    int v4 = 213;
  }
  else if ([v3 isEqualToString:@"TR"])
  {
    int v4 = 216;
  }
  else if ([v3 isEqualToString:@"TT"])
  {
    int v4 = 214;
  }
  else if ([v3 isEqualToString:@"TV"])
  {
    int v4 = 219;
  }
  else if ([v3 isEqualToString:@"TW"])
  {
    int v4 = 206;
  }
  else if ([v3 isEqualToString:@"TZ"])
  {
    int v4 = 208;
  }
  else if ([v3 isEqualToString:@"UA"])
  {
    int v4 = 221;
  }
  else if ([v3 isEqualToString:@"UG"])
  {
    int v4 = 220;
  }
  else if ([v3 isEqualToString:@"UM"])
  {
    int v4 = 224;
  }
  else if ([v3 isEqualToString:@"US"])
  {
    int v4 = 225;
  }
  else if ([v3 isEqualToString:@"UY"])
  {
    int v4 = 226;
  }
  else if ([v3 isEqualToString:@"UZ"])
  {
    int v4 = 227;
  }
  else if ([v3 isEqualToString:@"VA"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"VC"])
  {
    int v4 = 182;
  }
  else if ([v3 isEqualToString:@"VE"])
  {
    int v4 = 229;
  }
  else if ([v3 isEqualToString:@"VG"])
  {
    int v4 = 231;
  }
  else if ([v3 isEqualToString:@"VI"])
  {
    int v4 = 232;
  }
  else if ([v3 isEqualToString:@"VN"])
  {
    int v4 = 230;
  }
  else if ([v3 isEqualToString:@"VU"])
  {
    int v4 = 228;
  }
  else if ([v3 isEqualToString:@"WF"])
  {
    int v4 = 233;
  }
  else if ([v3 isEqualToString:@"WS"])
  {
    int v4 = 183;
  }
  else if ([v3 isEqualToString:@"XK"])
  {
    int v4 = 244;
  }
  else if ([v3 isEqualToString:@"YE"])
  {
    int v4 = 235;
  }
  else if ([v3 isEqualToString:@"YT"])
  {
    int v4 = 138;
  }
  else if ([v3 isEqualToString:@"ZA"])
  {
    int v4 = 195;
  }
  else if ([v3 isEqualToString:@"ZM"])
  {
    int v4 = 236;
  }
  else if ([v3 isEqualToString:@"ZW"])
  {
    int v4 = 237;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)convertLanguageCodeToSchemaLocale:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = [a3 uppercaseString];
  if ([v3 isEqualToString:@"AR-AE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AR-SA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CA-ES"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CS-CZ"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DA-DK"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"DE-AT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DE-CH"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DE-DE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"EL-GR"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EN-AE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"EN-AU"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"EN-CA"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"EN-GB"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"EN-ID"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"EN-IE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"EN-IN"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"EN-MY"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"EN-NZ"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"EN-PH"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"EN-SA"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"EN-SG"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"EN-US"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"EN-ZA"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ES-CL"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"ES-CO"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"ES-ES"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"ES-MX"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"ES-US"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"FI-FI"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"FR-BE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FR-CA"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"FR-CH"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"FR-FR"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"HE-IL"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"HI-IN"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"HR-HR"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"HU-HU"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"ID-ID"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"IT-CH"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"IT-IT"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"JA-JP"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"KO-KR"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"MS-MY"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"NB-NO"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"NL-BE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"NL-NL"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"PL-PL"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"PT-BR"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"PT-PT"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"RO-RO"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"RU-RU"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"SK-SK"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"SV-SE"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"TH-TH"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"TR-TR"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"UK-UA"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"VI-VN"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"WUU-CN"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"YUE-CN"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"ZH-CN"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"ZH-HK"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"ZH-TW"])
  {
    int v4 = 62;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

@end