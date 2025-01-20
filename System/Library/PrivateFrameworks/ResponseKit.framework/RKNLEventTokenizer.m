@interface RKNLEventTokenizer
+ (BOOL)isSpecialToken:(id)a3;
+ (void)initialize;
- (BOOL)hasEmoticon:(id)a3;
- (NSString)languageID;
- (RKNLEventTokenizer)initWithLanguageID:(id)a3;
- (__CFStringTokenizer)tokenizer;
- (id)buildTokenSquence:(id)a3 withOffset:(unint64_t)a4;
- (id)getTokens:(id)a3;
- (id)processForEmoticons:(id)a3;
- (id)processForEmoticonsAndEmojis:(id)a3;
- (id)processForHyphenation:(id)a3;
- (id)tokenizeWithDataDetectors:(id)a3;
- (id)transform:(id)a3;
- (void)dealloc;
- (void)setTokenizer:(__CFStringTokenizer *)a3;
@end

@implementation RKNLEventTokenizer

+ (void)initialize
{
  v9[214] = *MEMORY[0x263EF8340];
  if (!happyEmojiSet)
  {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"🙆‍♀️", @"🙆‍♂️", @"😀", @"😁", @"😂", @"😃", @"😄", @"😅", @"😆", @"😇", @"😉", @"😊", @"😋", @"😌", @"😍", @"😎", @"😏",
      @"🤑",
      @"🤓",
      @"😗",
      @"😘",
      @"🤗",
      @"😙",
      @"😚",
      @"😛",
      @"😜",
      @"😝",
      @"😬",
      @"😸",
      @"😹",
      @"😺",
      @"😻",
      @"😽",
      @"🙂",
      @"🙃",
      @"🙆",
      @"☺️",
      @"✊",
    uint64_t v2 = 0);
    v3 = (void *)happyEmojiSet;
    happyEmojiSet = v2;
  }
  if (!sadEmojiSet)
  {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"🙍‍♀️", @"🙍‍♂️", @"☹️", @"🙎‍♀️", @"🙎‍♂️", @"😐", @"😑", @"😒", @"😓", @"🤒", @"😔", @"😕", @"😖", @"🤕", @"😞", @"😟", @"😠",
      @"😡",
      @"😢",
      @"😣",
      @"😤",
      @"😥",
      @"😦",
      @"😧",
      @"😨",
      @"😩",
      @"😪",
      @"😫",
      @"😭",
      @"😮",
      @"😰",
      @"😱",
      @"😲",
      @"😳",
      @"😵",
      @"😶",
      @"😿",
      @"🙀",
      @"🙁",
      @"🙄",
      @"🙍",
      @"🙎",
      @"🙍‍♂️",
      @"☹️",
      @"😐",
      @"😑",
      @"🤒",
      @"😔",
      @"😕",
      @"🤕",
      @"😞",
      @"😟",
      @"😢",
      @"😦",
      @"😧",
      @"😨",
      @"😩",
      @"😫",
      @"😭",
    uint64_t v4 = 0);
    v5 = (void *)sadEmojiSet;
    sadEmojiSet = v4;
  }
  if (!specialCharMapping)
  {
    v8[0] = @"#";
    v8[1] = @"$";
    v9[0] = @"#";
    v9[1] = @"$";
    v8[2] = @"%";
    v8[3] = @"&";
    v9[2] = @"%";
    v9[3] = @"&";
    v8[4] = @"'";
    v8[5] = @",";
    v9[4] = @"'";
    v9[5] = @",";
    v8[6] = @"、";
    v8[7] = @"-";
    v9[6] = @",";
    v9[7] = @"-";
    v8[8] = @"‒";
    v8[9] = @"–";
    v9[8] = kEMDash;
    v9[9] = kEMDash;
    v8[10] = @"‐";
    v8[11] = @"‑";
    v9[10] = @"-";
    v9[11] = @"-";
    v8[12] = @"—";
    v8[13] = @"―";
    v9[12] = kEMDash;
    v9[13] = kEMDash;
    v8[14] = @"­";
    v8[15] = @".";
    v9[14] = @"-";
    v9[15] = @".";
    v8[16] = @"/";
    v8[17] = @"0";
    v9[16] = @"/";
    v9[17] = @"0";
    v8[18] = @"1";
    v8[19] = @"2";
    v9[18] = @"1";
    v9[19] = @"2";
    v8[20] = @"3";
    v8[21] = @"4";
    v9[20] = @"3";
    v9[21] = @"4";
    v8[22] = @"5";
    v8[23] = @"6";
    v9[22] = @"5";
    v9[23] = @"6";
    v8[24] = @"7";
    v8[25] = @"8";
    v9[24] = @"7";
    v9[25] = @"8";
    v8[26] = @"9";
    v8[27] = @":";
    v9[26] = @"9";
    v9[27] = @":";
    v8[28] = @"<";
    v8[29] = @">";
    v9[28] = @"<";
    v9[29] = @">";
    v8[30] = @"?";
    v8[31] = @"@";
    v9[30] = @"?";
    v9[31] = @"@";
    v8[32] = @"A";
    v8[33] = @"B";
    v9[32] = @"A";
    v9[33] = @"B";
    v8[34] = @"C";
    v8[35] = @"D";
    v9[34] = @"C";
    v9[35] = @"D";
    v8[36] = @"E";
    v8[37] = @"F";
    v9[36] = @"E";
    v9[37] = @"F";
    v8[38] = @"G";
    v8[39] = @"H";
    v9[38] = @"G";
    v9[39] = @"H";
    v8[40] = @"I";
    v8[41] = @"J";
    v9[40] = @"I";
    v9[41] = @"J";
    v8[42] = @"K";
    v8[43] = @"L";
    v9[42] = @"K";
    v9[43] = @"L";
    v8[44] = @"M";
    v8[45] = @"N";
    v9[44] = @"M";
    v9[45] = @"N";
    v8[46] = @"O";
    v8[47] = @"P";
    v9[46] = @"O";
    v9[47] = @"P";
    v8[48] = @"Q";
    v8[49] = @"R";
    v9[48] = @"Q";
    v9[49] = @"R";
    v8[50] = @"S";
    v8[51] = @"T";
    v9[50] = @"S";
    v9[51] = @"T";
    v8[52] = @"U";
    v8[53] = @"V";
    v9[52] = @"U";
    v9[53] = @"V";
    v8[54] = @"W";
    v8[55] = @"X";
    v9[54] = @"W";
    v9[55] = @"X";
    v8[56] = @"Y";
    v8[57] = @"Z";
    v9[56] = @"Y";
    v9[57] = @"Z";
    v8[58] = @"\\"";
    v8[59] = @"_";
    v9[58] = @"\\"";
    v9[59] = @"_";
    v8[60] = @"a";
    v8[61] = @"b";
    v9[60] = @"a";
    v9[61] = @"b";
    v8[62] = @"c";
    v8[63] = @"d";
    v9[62] = @"c";
    v9[63] = @"d";
    v8[64] = @"e";
    v9[64] = @"e";
    v8[65] = @"f";
    v9[65] = @"f";
    v8[66] = @"g";
    v9[66] = @"g";
    v8[67] = @"h";
    v9[67] = @"h";
    v8[68] = @"i";
    v9[68] = @"i";
    v8[69] = @"j";
    v9[69] = @"j";
    v8[70] = @"k";
    v9[70] = @"k";
    v8[71] = @"l";
    v9[71] = @"l";
    v8[72] = @"m";
    v9[72] = @"m";
    v8[73] = @"n";
    v9[73] = @"n";
    v8[74] = @"o";
    v9[74] = @"o";
    v8[75] = @"p";
    v9[75] = @"p";
    v8[76] = @"q";
    v9[76] = @"q";
    v8[77] = @"r";
    v9[77] = @"r";
    v8[78] = @"s";
    v9[78] = @"s";
    v8[79] = @"t";
    v9[79] = @"t";
    v8[80] = @"u";
    v9[80] = @"u";
    v8[81] = @"v";
    v9[81] = @"v";
    v8[82] = @"w";
    v9[82] = @"w";
    v8[83] = @"x";
    v9[83] = @"x";
    v8[84] = @"y";
    v9[84] = @"y";
    v8[85] = @"z";
    v9[85] = @"z";
    v8[86] = @"¢";
    v9[86] = @"¢";
    v8[87] = @"£";
    v9[87] = @"£";
    v8[88] = @"¥";
    v9[88] = @"¥";
    v8[89] = @"§";
    v9[89] = @"§";
    v8[90] = @"°";
    v9[90] = @"°";
    v8[91] = @"À";
    v9[91] = @"À";
    v8[92] = @"Á";
    v9[92] = @"Á";
    v8[93] = @"Â";
    v9[93] = @"Â";
    v8[94] = @"Ã";
    v9[94] = @"Ã";
    v8[95] = @"Ä";
    v9[95] = @"Ä";
    v8[96] = @"Å";
    v9[96] = @"Å";
    v8[97] = @"Ç";
    v9[97] = @"Ç";
    v8[98] = @"È";
    v9[98] = @"È";
    v8[99] = @"É";
    v9[99] = @"É";
    v8[100] = @"Ê";
    v9[100] = @"Ê";
    v8[101] = @"Ë";
    v9[101] = @"Ë";
    v8[102] = @"Ì";
    v9[102] = @"Ì";
    v8[103] = @"Í";
    v9[103] = @"Í";
    v8[104] = @"Î";
    v9[104] = @"Î";
    v8[105] = @"Ï";
    v9[105] = @"Ï";
    v8[106] = @"Ñ";
    v9[106] = @"Ñ";
    v8[107] = @"Ò";
    v9[107] = @"Ò";
    v8[108] = @"Ó";
    v9[108] = @"Ó";
    v8[109] = @"Ô";
    v9[109] = @"Ô";
    v8[110] = @"Õ";
    v9[110] = @"Õ";
    v8[111] = @"Ö";
    v9[111] = @"Ö";
    v8[112] = @"Ø";
    v9[112] = @"Ø";
    v8[113] = @"Ù";
    v9[113] = @"Ù";
    v8[114] = @"Ú";
    v9[114] = @"Ú";
    v8[115] = @"Ü";
    v9[115] = @"Ü";
    v8[116] = @"ß";
    v9[116] = @"ß";
    v8[117] = @"à";
    v9[117] = @"à";
    v8[118] = @"á";
    v9[118] = @"á";
    v8[119] = @"â";
    v9[119] = @"â";
    v8[120] = @"ã";
    v9[120] = @"ã";
    v8[121] = @"ä";
    v9[121] = @"ä";
    v8[122] = @"å";
    v9[122] = @"å";
    v8[123] = @"æ";
    v9[123] = @"æ";
    v8[124] = @"ç";
    v9[124] = @"ç";
    v8[125] = @"è";
    v9[125] = @"è";
    v8[126] = @"é";
    v9[126] = @"é";
    v8[127] = @"ê";
    v9[127] = @"ê";
    v8[128] = @"ë";
    v9[128] = @"ë";
    v8[129] = @"ì";
    v9[129] = @"ì";
    v8[130] = @"í";
    v9[130] = @"í";
    v8[131] = @"î";
    v9[131] = @"î";
    v8[132] = @"ï";
    v9[132] = @"ï";
    v8[133] = @"ð";
    v9[133] = @"ð";
    v8[134] = @"ñ";
    v9[134] = @"ñ";
    v8[135] = @"ò";
    v9[135] = @"ò";
    v8[136] = @"ó";
    v9[136] = @"ó";
    v8[137] = @"ô";
    v9[137] = @"ô";
    v8[138] = @"õ";
    v9[138] = @"õ";
    v8[139] = @"ö";
    v9[139] = @"ö";
    v8[140] = @"ø";
    v9[140] = @"ø";
    v8[141] = @"ù";
    v9[141] = @"ù";
    v8[142] = @"ú";
    v9[142] = @"ú";
    v8[143] = @"û";
    v9[143] = @"û";
    v8[144] = @"ü";
    v9[144] = @"ü";
    v8[145] = @"\xFF";
    v9[145] = @"\xFF";
    v8[146] = @"∼";
    v9[146] = @"~";
    v8[147] = @"’";
    v9[147] = @"'";
    v8[148] = @"ʼ";
    v9[148] = @"'";
    v8[149] = @"Ⅱ";
    v9[149] = @"II";
    v8[150] = @"Ⅲ";
    v9[150] = @"III";
    v8[151] = @"ƒ";
    v9[151] = @"f";
    v8[152] = @"ﬁ";
    v9[152] = @"fi";
    v8[153] = @"ı";
    v9[153] = @"i";
    v8[154] = @"ẞ";
    v9[154] = @"s";
    v8[155] = @"ſ";
    v9[155] = @"s";
    v8[156] = @"Ć";
    v9[156] = @"Ć";
    v8[157] = @"Ė";
    v9[157] = @"Ė";
    v8[158] = @"ė";
    v9[158] = @"ė";
    v8[159] = @"ě";
    v9[159] = @"ě";
    v8[160] = @"Ķ";
    v9[160] = @"Ķ";
    v8[161] = @"ń";
    v9[161] = @"ń";
    v8[162] = @"ş";
    v9[162] = @"ş";
    v8[163] = @"ż";
    v9[163] = @"ż";
    v8[164] = @"ą";
    v9[164] = @"ą";
    v8[165] = @"ž";
    v9[165] = @"ž";
    v8[166] = @"ś";
    v9[166] = @"ś";
    v8[167] = @"ā";
    v9[167] = @"ā";
    v8[168] = @"ę";
    v9[168] = @"ę";
    v8[169] = @"ğ";
    v9[169] = @"ğ";
    v8[170] = @"ř";
    v9[170] = @"ř";
    v8[171] = @"Š";
    v9[171] = @"Š";
    v8[172] = @"Ż";
    v9[172] = @"Ż";
    v8[173] = @"€";
    v9[173] = @"€";
    v8[174] = @"Ÿ";
    v9[174] = @"Ÿ";
    v8[175] = @"ć";
    v9[175] = @"ć";
    v8[176] = @"ī";
    v9[176] = @"ī";
    v8[177] = @"ň";
    v9[177] = @"ň";
    v8[178] = @"ů";
    v9[178] = @"ů";
    v8[179] = @"Œ";
    v9[179] = @"Œ";
    v8[180] = @"š";
    v9[180] = @"š";
    v8[181] = @"č";
    v9[181] = @"č";
    v8[182] = @"ō";
    v9[182] = @"ō";
    v8[183] = @"ņ";
    v9[183] = @"ņ";
    v8[184] = @"œ";
    v9[184] = @"œ";
    v8[185] = @"😁";
    v9[185] = @"😁";
    v8[186] = @"😂";
    v9[186] = @"😂";
    v8[187] = @"😉";
    v9[187] = @"😉";
    v8[188] = @"😊";
    v9[188] = @"😊";
    v8[189] = @"👍";
    v9[189] = @"👍";
    v8[190] = @"😍";
    v9[190] = @"😍";
    v8[191] = @"☺";
    v9[191] = @"😊";
    v8[192] = @"😄";
    v9[192] = @"😄";
    v8[193] = @"😘";
    v9[193] = @"😘";
    v8[194] = @"😱";
    v9[194] = @"😱";
    v8[195] = @"👌";
    v9[195] = @"👌";
    v8[196] = @"😎";
    v9[196] = @"😎";
    v8[197] = @"😡";
    v9[197] = @"😡";
    v8[198] = @"❤";
    v9[198] = @"❤";
    v8[199] = @"😬";
    v9[199] = @"😬";
    v8[200] = @"😃";
    v9[200] = @"😃";
    v8[201] = @"😏";
    v9[201] = @"😏";
    v8[202] = @"😝";
    v9[202] = @"😝";
    v8[203] = @"😩";
    v9[203] = @"😩";
    v8[204] = @"😳";
    v9[204] = @"😳";
    v8[205] = @"🍸";
    v9[205] = @"🍸";
    v8[206] = @"✨";
    v9[206] = @"✨";
    v8[207] = @"😜";
    v9[207] = @"😜";
    v8[208] = @"😀";
    v9[208] = @"😀";
    v8[209] = @"🍷";
    v9[209] = @"🍷";
    v8[210] = @"😭";
    v9[210] = @"😭";
    v8[211] = @"☹";
    v9[211] = @"😭";
    v8[212] = @"👎";
    v9[212] = @"👎";
    v8[213] = @"à";
    v9[213] = @"à";
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:214];
    v7 = (void *)specialCharMapping;
    specialCharMapping = v6;
  }
  if (!emoticonCategoryDict)
  {
    emoticonCategoryDict = (uint64_t)&unk_26C8EFB10;
  }
}

- (void)dealloc
{
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    CFRelease(tokenizer);
  }
  v4.receiver = self;
  v4.super_class = (Class)RKNLEventTokenizer;
  [(RKNLEventTokenizer *)&v4 dealloc];
}

- (RKNLEventTokenizer)initWithLanguageID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RKNLEventTokenizer;
  uint64_t v6 = [(RKNLEventTokenizer *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_languageID, a3);
    CFStringRef CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(0, (CFStringRef)v7->_languageID);
    CFLocaleRef v9 = CFLocaleCreate(0, CanonicalLocaleIdentifierFromString);
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v13.length = CFStringGetLength(@"init");
    v13.location = 0;
    v7->_tokenizer = CFStringTokenizerCreate(v10, @"init", v13, 4uLL, v9);
    CFRelease(CanonicalLocaleIdentifierFromString);
    CFRelease(v9);
  }

  return v7;
}

+ (BOOL)isSpecialToken:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"URL"] & 1) != 0
    || ([v3 isEqualToString:@"PHONE"] & 1) != 0
    || ([v3 isEqualToString:@"ADDRESS"] & 1) != 0
    || ([v3 isEqualToString:@"DATE_TIME"] & 1) != 0
    || ([v3 isEqualToString:@"CURRENCY"] & 1) != 0
    || ([v3 isEqualToString:@"DIGIT_STRG"] & 1) != 0
    || ([v3 isEqualToString:@"EMOTICON_HAPPY"] & 1) != 0
    || ([v3 isEqualToString:@"EMOTICON_PERTURBED"] & 1) != 0
    || ([v3 isEqualToString:@"EMOTICONHAPPY"] & 1) != 0
    || ([v3 isEqualToString:@"EMOTICONPERTURBED"] & 1) != 0
    || ([v3 isEqualToString:@"DATETIME"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"DIGITSTRG"];
  }

  return v4;
}

- (id)tokenizeWithDataDetectors:(id)a3
{
  id v3 = a3;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__RKNLEventTokenizer_tokenizeWithDataDetectors___block_invoke;
  block[3] = &unk_2642D2068;
  block[4] = v35;
  if (tokenizeWithDataDetectors__onceToken != -1) {
    dispatch_once(&tokenizeWithDataDetectors__onceToken, block);
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (tokenizeWithDataDetectors__scanner
    && DDScannerScanString()
    && (v5 = (const __CFArray *)DDScannerCopyResultsWithOptions(), (CFArrayRef v6 = v5) != 0))
  {
    CFIndex Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      unint64_t v8 = 0;
      CFIndex v9 = 0;
      CFTypeRef v32 = (CFTypeRef)*MEMORY[0x263F39420];
      CFTypeRef v30 = (CFTypeRef)*MEMORY[0x263F39428];
      CFTypeRef v29 = (CFTypeRef)*MEMORY[0x263F39470];
      CFTypeRef v28 = (CFTypeRef)*MEMORY[0x263F39418];
      CFTypeRef v27 = (CFTypeRef)*MEMORY[0x263F39468];
      CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x263F39480];
      while (2)
      {
        CFArrayGetValueAtIndex(v6, v9);
        CFAllocatorRef v10 = @"URL";
        switch(DDResultGetCategory())
        {
          case 1u:
            goto LABEL_18;
          case 2u:
            CFAllocatorRef v10 = @"PHONE";
            goto LABEL_18;
          case 3u:
            CFAllocatorRef v10 = @"ADDRESS";
            goto LABEL_18;
          case 4u:
            Type = (const void *)DDResultGetType();
            CFAllocatorRef v10 = @"DATETIME";
            if (CFEqual(Type, v32) || CFEqual(Type, v30) || CFEqual(Type, v29) || CFEqual(Type, v28)) {
              goto LABEL_18;
            }
            int v12 = CFEqual(Type, v27);
LABEL_11:
            if (v12)
            {
LABEL_18:
              unint64_t Range = DDResultGetRange();
              unint64_t v15 = Range;
              uint64_t v17 = v16;
              if (Range > v8)
              {
                v33 = v10;
                CFArrayRef v18 = v6;
                CFIndex v19 = Count;
                id v20 = v3;
                v21 = objc_msgSend(v3, "substringWithRange:", v8, Range - v8);
                v22 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v21, v8, [v21 length]);
                [v4 addObject:v22];

                id v3 = v20;
                CFIndex Count = v19;
                CFArrayRef v6 = v18;
                CFAllocatorRef v10 = v33;
              }
              v23 = [[RKNLEventToken alloc] initWithString:v10 location:v15 length:v17];
              [v4 addObject:v23];

              unint64_t v8 = v15 + v17;
            }
            if (Count == ++v9) {
              goto LABEL_26;
            }
            continue;
          default:
            v11 = (const void *)DDResultGetType();
            int v12 = CFEqual(v11, cf2);
            CFAllocatorRef v10 = @"DATETIME";
            goto LABEL_11;
        }
      }
    }
    unint64_t v8 = 0;
LABEL_26:
    CFRelease(v6);
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (v8 < objc_msgSend(v3, "length", v27))
  {
    v24 = objc_msgSend(v3, "substringWithRange:", v8, objc_msgSend(v3, "length") - v8);
    v25 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v24, v8, [v3 length] - v8);
    [v4 addObject:v25];
  }
  _Block_object_dispose(v35, 8);

  return v4;
}

uint64_t __48__RKNLEventTokenizer_tokenizeWithDataDetectors___block_invoke()
{
  uint64_t result = DDScannerCreateWithType();
  tokenizeWithDataDetectors__scanner = result;
  return result;
}

- (BOOL)hasEmoticon:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)emoticonCategoryDict;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "containsString:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)processForEmoticonsAndEmojis:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v4;
  uint64_t v34 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v56 != v33) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        unint64_t v8 = [v7 string];
        uint64_t v51 = 0;
        v52 = &v51;
        uint64_t v53 = 0x2020000000;
        uint64_t v54 = 0;
        uint64_t v54 = [v7 location];
        if (CEMStringContainsEmoji())
        {
          CFStringGetLength(v8);
          uint64_t v47 = 0;
          v48 = &v47;
          uint64_t v49 = 0x2020000000;
          uint64_t v50 = 0;
          uint64_t v39 = MEMORY[0x263EF8330];
          uint64_t v40 = 3221225472;
          v41 = __51__RKNLEventTokenizer_processForEmoticonsAndEmojis___block_invoke;
          v42 = &unk_2642D2090;
          v45 = &v47;
          long long v9 = v8;
          v43 = v9;
          id v10 = v5;
          id v44 = v10;
          v46 = &v51;
          CEMEnumerateEmojiTokensInStringWithBlock();
          unint64_t v11 = v48[3];
          if (v11 < [(__CFString *)v9 length])
          {
            long long v12 = v5;
            CFRange v13 = self;
            uint64_t v14 = v48[3];
            uint64_t v15 = [(__CFString *)v9 length];
            uint64_t v16 = -[__CFString substringWithRange:](v9, "substringWithRange:", v14, v15 - v48[3]);
            uint64_t v17 = [RKNLEventToken alloc];
            uint64_t v18 = v52[3];
            uint64_t v19 = v48[3];
            uint64_t v20 = [(__CFString *)v9 length];
            v21 = [(RKNLEventToken *)v17 initWithString:v16 location:v19 + v18 length:v20 - v48[3]];
            [v10 addObject:v21];

            self = v13;
            uint64_t v5 = v12;
          }
          _Block_object_dispose(&v47, 8);
        }
        else
        {
          [v5 addObject:v7];
        }
        _Block_object_dispose(&v51, 8);
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v34);
  }

  v22 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v5;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v59 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v23);
        }
        CFTypeRef v27 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        CFTypeRef v28 = [v27 string];
        BOOL v29 = [(RKNLEventTokenizer *)self hasEmoticon:v28];

        if (v29)
        {
          CFTypeRef v30 = [(RKNLEventTokenizer *)self processForEmoticons:v27];
          [v22 addObjectsFromArray:v30];
        }
        else
        {
          [v22 addObject:v27];
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v59 count:16];
    }
    while (v24);
  }

  return v22;
}

void __51__RKNLEventTokenizer_processForEmoticonsAndEmojis___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  CEMEmojiTokenGetString();
  uint64_t v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v7 = [(id)specialCharMapping objectForKeyedSubscript:v14];

  unint64_t v8 = v14;
  if (!v7)
  {
    if (objc_msgSend((id)happyEmojiSet, "containsObject:"))
    {
      unint64_t v8 = @"EMOTICONHAPPY";
    }
    else if ([(id)sadEmojiSet containsObject:v14])
    {
      unint64_t v8 = @"EMOTICONPERTURBED";
    }
    else
    {
      unint64_t v8 = (__CFString *)(id)kEmojiPlaceholder;
    }
  }
  if (a3 > *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    long long v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
    id v10 = *(void **)(a1 + 40);
    unint64_t v11 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v9, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)+ *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), [v9 length]);
    [v10 addObject:v11];
  }
  long long v12 = *(void **)(a1 + 40);
  CFRange v13 = [[RKNLEventToken alloc] initWithString:v8 location:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + a3 length:a4];
  [v12 addObject:v13];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3 + a4;
}

- (id)transform:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v31 = self;
  BOOL v39 = [(NSString *)self->_languageID isEqualToString:@"ja"]
     || [(NSString *)self->_languageID isEqualToString:@"zh-Hans"]
     || [(NSString *)self->_languageID isEqualToString:@"zh-Hant"];
  uint64_t v33 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v4;
  uint64_t v35 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v43;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v5;
        uint64_t v6 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
        v7 = [v6 string];
        long long v36 = v6;
        uint64_t v37 = [v6 location];
        id v40 = objc_alloc_init(MEMORY[0x263F089D8]);
        CFIndex Length = CFStringGetLength(v7);
        id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        if (Length >= 1)
        {
          uint64_t v41 = 0;
          CFIndex v10 = 0;
          unint64_t v11 = &stru_26C8AEFC8;
          while (1)
          {
            CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(v7, v10);
            long long v12 = (id)CFStringCreateWithSubstring(0, v7, RangeOfComposedCharactersAtIndex);
            CFRange v13 = [(id)specialCharMapping objectForKey:v12];
            uint64_t v14 = v13;
            if (v13)
            {
              uint64_t v15 = v13;
            }
            else
            {
              uint64_t v16 = v12;
              if (v39) {
                goto LABEL_18;
              }
              uint64_t v16 = v12;
              if ([(__CFString *)v12 isEqualToString:@" "]) {
                goto LABEL_18;
              }
              uint64_t v15 = @" ";
              uint64_t v16 = v12;
              if ([(id)kAllowedPunctuations containsString:v12]) {
                goto LABEL_18;
              }
            }

            uint64_t v16 = v15;
LABEL_18:
            uint64_t v17 = [v9 objectForKey:v16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "integerValue") + 1);

              [v9 setObject:v19 forKey:v16];
            }
            else
            {
              uint64_t v20 = [NSNumber numberWithInt:1];
              [v9 setObject:v20 forKey:v16];

              uint64_t v19 = 0;
            }
            if ([(__CFString *)v11 isEqualToString:v16])
            {
              if (CEMStringContainsEmoji()
                || ([(__CFString *)v16 isEqualToString:@"?"] & 1) != 0
                || ([(__CFString *)v16 isEqualToString:@":"] & 1) != 0
                || (unint64_t v21 = [v19 integerValue], v21 >= kMaxCharRepetitionAllowed))
              {
                unint64_t v22 = [v19 integerValue];
                uint64_t v23 = v41;
                if (v22 >= kMaxCharRepetitionAllowed) {
                  uint64_t v23 = v41 + 1;
                }
                uint64_t v41 = v23;
                goto LABEL_31;
              }
            }
            else
            {
              [v9 removeAllObjects];
            }
            [v40 appendString:v16];
LABEL_31:
            Length -= CFStringGetLength(v12);
            v10 += CFStringGetLength(v12);
            uint64_t v24 = v16;

            CFRelease(v12);
            unint64_t v11 = v24;
            if (Length <= 0) {
              goto LABEL_34;
            }
          }
        }
        uint64_t v41 = 0;
        uint64_t v24 = &stru_26C8AEFC8;
LABEL_34:
        if ([v40 length])
        {
          BOOL v25 = +[RKNLEventTokenizer isSpecialToken:v40];
          v26 = [RKNLEventToken alloc];
          if (v25) {
            uint64_t v27 = [v36 length];
          }
          else {
            uint64_t v27 = [v40 length] + v41;
          }
          CFTypeRef v28 = [(RKNLEventToken *)v26 initWithString:v40 location:v37 length:v27];
          [v33 addObject:v28];
        }
        uint64_t v5 = v38 + 1;
      }
      while (v38 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v35);
  }

  BOOL v29 = [(RKNLEventTokenizer *)v31 processForHyphenation:v33];

  return v29;
}

- (id)processForEmoticons:(id)a3
{
  id v3 = a3;
  id v40 = (id)objc_opt_new();
  uint64_t v41 = v3;
  id v4 = [v3 string];
  uint64_t v5 = [&stru_26C8AEFC8 stringByPaddingToLength:kMaxCharToConsiderForEmoticonDetection withString:@" " startingAtIndex:0];
  CFStringRef v6 = (const __CFString *)[v4 stringByAppendingString:v5];

  CFStringRef v7 = v6;
  unint64_t v8 = &OBJC_IVAR___RKBundleDataProvider__localizationsByLanguageID;
  unint64_t Length = CFStringGetLength(v6);
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v11 = v10;
  unint64_t v43 = 0;
  if (Length > kMinCharToConsiderForEmoticonDetection)
  {
    unint64_t v43 = 0;
    CFIndex v12 = 0;
    CFStringRef v38 = v7;
    BOOL v39 = v10;
    do
    {
      CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(v7, v12);
      CFStringRef v14 = CFStringCreateWithSubstring(0, v7, RangeOfComposedCharactersAtIndex);
      [v11 addObject:v14];
      if ((unint64_t)[v11 count] > *((void *)v8 + 7)) {
        [v11 removeObjectAtIndex:0];
      }
      uint64_t v15 = [v11 componentsJoinedByString:&stru_26C8AEFC8];
      unint64_t v16 = [v15 length];
      unint64_t v17 = *((void *)v8 + 7);
      if (v16 <= v17) {
        unint64_t v17 = [v15 length];
      }
      if (v17 >= kMinCharToConsiderForEmoticonDetection)
      {
        unint64_t v18 = v17;
        while (1)
        {
          uint64_t v19 = objc_msgSend(v15, "substringWithRange:", 0, v18);
          uint64_t v20 = [(id)emoticonCategoryDict objectForKey:v19];
          if (v20) {
            break;
          }

          if (--v18 < kMinCharToConsiderForEmoticonDetection)
          {
            unint64_t v11 = v39;
            goto LABEL_15;
          }
        }
        unint64_t v21 = (void *)v20;
        unint64_t v22 = RangeOfComposedCharactersAtIndex.location - v17 + 1;
        unint64_t v42 = v22;
        if (v22 > v43)
        {
          unint64_t v37 = v22 - v43;
          uint64_t v23 = [v41 string];
          uint64_t v24 = objc_msgSend(v23, "substringWithRange:", v43, v37);

          BOOL v25 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v24, [v41 location] + v43, objc_msgSend(v24, "length"));
          [v40 addObject:v25];

          unint64_t v22 = v42;
        }
        v26 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v21, [v41 location] + v22, objc_msgSend(v19, "length"));
        [v40 addObject:v26];

        unint64_t v43 = [v19 length] + v42;
        objc_msgSend(v39, "removeObjectsInRange:", 0, v18);

        unint64_t v11 = v39;
LABEL_15:
        unint64_t v8 = &OBJC_IVAR___RKBundleDataProvider__localizationsByLanguageID;
        CFStringRef v7 = v38;
      }
      Length -= CFStringGetLength(v14);
      v12 += CFStringGetLength(v14);
      CFRelease(v14);
    }
    while (Length > kMinCharToConsiderForEmoticonDetection);
  }
  uint64_t v27 = [v41 string];
  unint64_t v28 = [v27 length];

  if (v43 < v28)
  {
    BOOL v29 = [v41 string];
    CFTypeRef v30 = [v41 string];
    v31 = objc_msgSend(v29, "substringWithRange:", v43, objc_msgSend(v30, "length") - v43);

    CFTypeRef v32 = [RKNLEventToken alloc];
    unint64_t v33 = [v41 location] + v43;
    uint64_t v34 = [v41 string];
    uint64_t v35 = -[RKNLEventToken initWithString:location:length:](v32, "initWithString:location:length:", v31, v33, [v34 length] - v43);
    [v40 addObject:v35];
  }

  return v40;
}

- (id)processForHyphenation:(id)a3
{
  id v3 = a3;
  id v20 = (id)objc_opt_new();
  if ([v3 count])
  {
    unint64_t v4 = 0;
    uint64_t v19 = v3;
    do
    {
      uint64_t v5 = objc_msgSend(v3, "objectAtIndexedSubscript:", v4, v19);
      CFStringRef v6 = [v5 string];
      CFStringRef v7 = [v6 componentsSeparatedByString:@" "];

      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
      if ([v7 count])
      {
        unint64_t v9 = 0;
        do
        {
          id v10 = [v7 objectAtIndexedSubscript:v9];
          if ([v10 isEqualToString:@"-"]) {
            BOOL v11 = v9 == 0;
          }
          else {
            BOOL v11 = 1;
          }
          if (!v11
            || [v10 containsString:@"-"]
            && v9
            && [v10 hasPrefix:@"-"])
          {
            CFIndex v12 = [v10 stringByReplacingOccurrencesOfString:@"-" withString:kEMDash];
            CFRange v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
            uint64_t v14 = [v12 stringByTrimmingCharactersInSet:v13];

            id v10 = (void *)v14;
          }
          [v8 addObject:v10];

          ++v9;
        }
        while (v9 < [v7 count]);
      }
      uint64_t v15 = [v8 componentsJoinedByString:@" "];
      id v3 = v19;
      unint64_t v16 = [v19 objectAtIndexedSubscript:v4];
      [v16 setString:v15];

      unint64_t v17 = [v19 objectAtIndexedSubscript:v4];
      [v20 addObject:v17];

      ++v4;
    }
    while (v4 < [v19 count]);
  }

  return v20;
}

- (id)getTokens:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (getTokens__onceToken != -1) {
    dispatch_once(&getTokens__onceToken, &__block_literal_global_1);
  }
  id v36 = [MEMORY[0x263EFF980] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v5)
  {
    unint64_t v42 = &stru_26C8AEFC8;
    goto LABEL_44;
  }
  uint64_t v6 = 0;
  uint64_t v40 = *(void *)v44;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  unint64_t v42 = &stru_26C8AEFC8;
  do
  {
    uint64_t v8 = 0;
    uint64_t v41 = v5;
    do
    {
      if (*(void *)v44 != v40) {
        objc_enumerationMutation(obj);
      }
      unint64_t v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
      id v10 = [v9 string];
      if (!+[RKNLEventTokenizer isSpecialToken:v10])
      {
        uint64_t v38 = v6;
        uint64_t v15 = [(RKNLEventTokenizer *)self tokenizer];
        v50.length = CFStringGetLength(v10);
        v50.location = 0;
        CFStringTokenizerSetString(v15, v10, v50);
        if (!CFStringTokenizerAdvanceToNextToken([(RKNLEventTokenizer *)self tokenizer]))
        {
LABEL_37:
          uint64_t v32 = [v9 location];
          uint64_t v6 = [v9 length] + v32;
          goto LABEL_40;
        }
        BOOL v39 = v9;
        while (2)
        {
          CurrentTokenunint64_t Range = CFStringTokenizerGetCurrentTokenRange([(RKNLEventTokenizer *)self tokenizer]);
          -[__CFString substringWithRange:](v10, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
          unint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          MutableCopy = CFStringCreateMutableCopy(v7, 0, v17);
          CFStringNormalize(MutableCopy, kCFStringNormalizationFormKC);

          if (([(__CFString *)MutableCopy isEqualToString:@" "] & 1) == 0
            && ([(__CFString *)MutableCopy isEqualToString:@"\n"] & 1) == 0
            && ([(__CFString *)MutableCopy isEqualToString:@" "] & 1) == 0)
          {
            uint64_t v19 = [(__CFString *)MutableCopy stringByTrimmingCharactersInSet:getTokens__symbolsAndPunctuationSet];
            int v20 = [v19 isEqualToString:&stru_26C8AEFC8];

            if (v20
              && (-[__CFString stringByTrimmingCharactersInSet:](MutableCopy, "stringByTrimmingCharactersInSet:", getTokens__allowedPunctuationSet), unint64_t v21 = objc_claimAutoreleasedReturnValue(), v22 = [v21 isEqualToString:&stru_26C8AEFC8], v21, (v22 & 1) == 0))
            {
              uint64_t v24 = MutableCopy;
              MutableCopy = v24;
              uint64_t v23 = v42;
LABEL_27:
              unint64_t v42 = v24;
            }
            else
            {
              uint64_t v23 = v42;
              if ([(__CFString *)v42 isEqualToString:@"?"]
                && [(__CFString *)MutableCopy isEqualToString:@"?"]
                || CEMStringContainsEmoji()
                && [(__CFString *)v42 isEqualToString:MutableCopy])
              {
                uint64_t v24 = MutableCopy;
                MutableCopy = v24;
                goto LABEL_27;
              }
              uint64_t v25 = [(__CFString *)MutableCopy rangeOfCharacterFromSet:getTokens__nonDigitCommaPeriodSet];
              uint64_t v23 = objc_opt_new();
              if (v25 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v26 = v42;
                if (![(__CFString *)v42 isEqualToString:@"DIGIT_STRG"])
                {
                  uint64_t v27 = v23;
                  unint64_t v28 = @"DIGIT_STRG";
                  goto LABEL_33;
                }
LABEL_31:
                MutableCopy = MutableCopy;

                unint64_t v42 = MutableCopy;
              }
              else
              {
                BOOL v29 = [(__CFString *)MutableCopy stringByReplacingOccurrencesOfString:@"DATETIME" withString:@"DATE_TIME"];

                CFTypeRef v30 = [v29 stringByReplacingOccurrencesOfString:@"EMOTICONHAPPY" withString:@"EMOTICON_HAPPY"];

                MutableCopy = [v30 stringByReplacingOccurrencesOfString:@"EMOTICONPERTURBED" withString:@"EMOTICON_PERTURBED"];

                v26 = v42;
                if ((+[RKNLEventTokenizer isSpecialToken:](RKNLEventTokenizer, "isSpecialToken:", MutableCopy)|| [(id)kAllowedPunctuations containsString:MutableCopy])&& -[__CFString isEqualToString:](v42, "isEqualToString:", MutableCopy))
                {
                  goto LABEL_31;
                }
                uint64_t v27 = v23;
                unint64_t v28 = MutableCopy;
LABEL_33:
                [v27 setString:v28];
                uint64_t v31 = [v23 string];

                [v23 setLocation:CurrentTokenRange.location + v38];
                [v23 setLength:CurrentTokenRange.length];
                [v36 addObject:v23];
                unint64_t v42 = (__CFString *)v31;
              }
              unint64_t v9 = v39;
            }
          }
          if (!CFStringTokenizerAdvanceToNextToken([(RKNLEventTokenizer *)self tokenizer])) {
            goto LABEL_37;
          }
          continue;
        }
      }
      BOOL v11 = [(__CFString *)v10 stringByReplacingOccurrencesOfString:@"DATETIME" withString:@"DATE_TIME"];

      CFIndex v12 = [v11 stringByReplacingOccurrencesOfString:@"EMOTICONHAPPY" withString:@"EMOTICON_HAPPY"];

      CFRange v13 = [v12 stringByReplacingOccurrencesOfString:@"EMOTICONPERTURBED" withString:@"EMOTICON_PERTURBED"];

      if ([v13 isEqualToString:v42])
      {
        id v10 = v13;

        uint64_t v14 = [v9 location];
        uint64_t v6 = [v9 length] + v14;
      }
      else
      {
        unint64_t v33 = objc_opt_new();
        [v33 setString:v13];
        objc_msgSend(v33, "setLocation:", objc_msgSend(v9, "location"));
        objc_msgSend(v33, "setLength:", objc_msgSend(v9, "length"));
        [v36 addObject:v33];
        id v10 = v13;

        uint64_t v34 = [v9 location];
        uint64_t v6 = [v9 length] + v34;
      }
      unint64_t v42 = v10;
LABEL_40:

      ++v8;
    }
    while (v8 != v41);
    uint64_t v5 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  }
  while (v5);
LABEL_44:

  return v36;
}

void __32__RKNLEventTokenizer_getTokens___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:kAllowedPunctuations];
  v1 = (void *)getTokens__allowedPunctuationSet;
  getTokens__allowedPunctuationSet = v0;

  uint64_t v2 = [MEMORY[0x263F08708] punctuationCharacterSet];
  uint64_t v3 = [v2 mutableCopy];
  id v4 = (void *)getTokens__symbolsAndPunctuationSet;
  getTokens__symbolsAndPunctuationSet = v3;

  uint64_t v5 = (void *)getTokens__symbolsAndPunctuationSet;
  uint64_t v6 = [MEMORY[0x263F08708] symbolCharacterSet];
  [v5 formUnionWithCharacterSet:v6];

  CFAllocatorRef v7 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  id v10 = (id)[v7 mutableCopy];

  [v10 addCharactersInString:@",."];
  uint64_t v8 = [v10 invertedSet];
  unint64_t v9 = (void *)getTokens__nonDigitCommaPeriodSet;
  getTokens__nonDigitCommaPeriodSet = v8;
}

- (id)buildTokenSquence:(id)a3 withOffset:(unint64_t)a4
{
  uint64_t v6 = [(RKNLEventTokenizer *)self tokenizeWithDataDetectors:a3];
  CFAllocatorRef v7 = [(RKNLEventTokenizer *)self processForEmoticonsAndEmojis:v6];
  uint64_t v8 = [(RKNLEventTokenizer *)self transform:v7];
  unint64_t v9 = [(RKNLEventTokenizer *)self getTokens:v8];
  if ([v9 count])
  {
    unint64_t v10 = 0;
    do
    {
      BOOL v11 = [v9 objectAtIndexedSubscript:v10];
      objc_msgSend(v11, "setLocation:", objc_msgSend(v11, "location") + a4);

      ++v10;
    }
    while ([v9 count] > v10);
  }

  return v9;
}

- (NSString)languageID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(__CFStringTokenizer *)a3
{
  self->_tokenizer = a3;
}

- (void).cxx_destruct
{
}

@end