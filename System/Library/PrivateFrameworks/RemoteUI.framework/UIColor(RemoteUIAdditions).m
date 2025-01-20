@interface UIColor(RemoteUIAdditions)
+ (id)_remoteUI_colorWithString:()RemoteUIAdditions;
+ (id)_remoteUI_colorWithString:()RemoteUIAdditions defaultColor:;
@end

@implementation UIColor(RemoteUIAdditions)

+ (id)_remoteUI_colorWithString:()RemoteUIAdditions defaultColor:
{
  v62[36] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (![v5 length]) {
    goto LABEL_14;
  }
  v7 = [MEMORY[0x263F08B08] scannerWithString:v5];
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  [v7 setCharactersToBeSkipped:v8];

  v9 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @"(");
  LODWORD(v8) = [v7 scanUpToCharactersFromSet:v9 intoString:0];

  objc_msgSend(v7, "scanString:intoString:", @"("), 0;
  int v10 = [v7 scanInt:(char *)&v60 + 4];
  int v11 = [v7 scanString:@"," intoString:0];
  int v12 = [v7 scanInt:&v60];
  int v13 = [v7 scanString:@"," intoString:0];
  int v14 = [v7 scanInt:(char *)&v59 + 4];
  int v15 = [v7 scanString:@"," intoString:0];
  int v16 = [v7 scanFloat:&v59];
  if (v8 && v10 && v11 && v12 && v13 && v14)
  {
    double v17 = *(float *)&v59;
    if ((v15 & v16) == 0) {
      double v17 = 1.0;
    }
    id v18 = [MEMORY[0x263F825C8] colorWithRed:(double)SHIDWORD(v60) / 255.0 green:(double)(int)v60 / 255.0 blue:(double)SHIDWORD(v59) / 255.0 alpha:v17];

    goto LABEL_15;
  }
  v19 = (void *)_remoteUI_colorWithString_defaultColor__colorMap;
  if (!_remoteUI_colorWithString_defaultColor__colorMap)
  {
    v61[0] = @"black";
    v58 = [MEMORY[0x263F825C8] blackColor];
    v62[0] = v58;
    v61[1] = @"darkGray";
    v57 = [MEMORY[0x263F825C8] darkGrayColor];
    v62[1] = v57;
    v61[2] = @"lightGray";
    v56 = [MEMORY[0x263F825C8] lightGrayColor];
    v62[2] = v56;
    v61[3] = @"white";
    v55 = [MEMORY[0x263F825C8] whiteColor];
    v62[3] = v55;
    v61[4] = @"gray";
    v54 = [MEMORY[0x263F825C8] grayColor];
    v62[4] = v54;
    v61[5] = @"red";
    v53 = [MEMORY[0x263F825C8] redColor];
    v62[5] = v53;
    v61[6] = @"green";
    v52 = [MEMORY[0x263F825C8] greenColor];
    v62[6] = v52;
    v61[7] = @"blue";
    v51 = [MEMORY[0x263F825C8] blueColor];
    v62[7] = v51;
    v61[8] = @"cyan";
    v50 = [MEMORY[0x263F825C8] cyanColor];
    v62[8] = v50;
    v61[9] = @"yellow";
    v49 = [MEMORY[0x263F825C8] yellowColor];
    v62[9] = v49;
    v61[10] = @"magenta";
    v48 = [MEMORY[0x263F825C8] magentaColor];
    v62[10] = v48;
    v61[11] = @"orange";
    v47 = [MEMORY[0x263F825C8] orangeColor];
    v62[11] = v47;
    v61[12] = @"purple";
    v46 = [MEMORY[0x263F825C8] purpleColor];
    v62[12] = v46;
    v61[13] = @"brown";
    v45 = [MEMORY[0x263F825C8] brownColor];
    v62[13] = v45;
    v61[14] = @"clear";
    v44 = [MEMORY[0x263F825C8] clearColor];
    v62[14] = v44;
    v61[15] = @"systemRed";
    v43 = [MEMORY[0x263F825C8] systemRedColor];
    v62[15] = v43;
    v61[16] = @"systemGreen";
    v42 = [MEMORY[0x263F825C8] systemGreenColor];
    v62[16] = v42;
    v61[17] = @"systemBlue";
    v41 = [MEMORY[0x263F825C8] systemBlueColor];
    v62[17] = v41;
    v61[18] = @"systemOrange";
    v40 = [MEMORY[0x263F825C8] systemOrangeColor];
    v62[18] = v40;
    v61[19] = @"systemYellow";
    v39 = [MEMORY[0x263F825C8] systemYellowColor];
    v62[19] = v39;
    v61[20] = @"systemTeal";
    v38 = [MEMORY[0x263F825C8] systemTealColor];
    v62[20] = v38;
    v61[21] = @"systemPink";
    v37 = [MEMORY[0x263F825C8] systemPinkColor];
    v62[21] = v37;
    v61[22] = @"systemGray";
    v36 = [MEMORY[0x263F825C8] systemGrayColor];
    v62[22] = v36;
    v61[23] = @"systemPurple";
    v35 = [MEMORY[0x263F825C8] systemPurpleColor];
    v62[23] = v35;
    v61[24] = @"systemBrown";
    v34 = [MEMORY[0x263F825C8] systemBrownColor];
    v62[24] = v34;
    v61[25] = @"systemIndigo";
    v33 = [MEMORY[0x263F825C8] systemIndigoColor];
    v62[25] = v33;
    v61[26] = @"systemMidGray";
    v32 = [MEMORY[0x263F825C8] systemMidGrayColor];
    v62[26] = v32;
    v61[27] = @"systemGray6Color";
    v31 = [MEMORY[0x263F825C8] systemGray6Color];
    v62[27] = v31;
    v61[28] = @"tertiarySystemGroupedBackgroundColor";
    v30 = [MEMORY[0x263F825C8] tertiarySystemGroupedBackgroundColor];
    v62[28] = v30;
    v61[29] = @"systemBackgroundColor";
    v20 = [MEMORY[0x263F825C8] _systemBackgroundColor];
    v62[29] = v20;
    v61[30] = @"labelColor";
    v21 = [MEMORY[0x263F825C8] labelColor];
    v62[30] = v21;
    v61[31] = @"secondaryLabelColor";
    v22 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v62[31] = v22;
    v61[32] = @"tertiaryLabelColor";
    v23 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    v62[32] = v23;
    v61[33] = @"quaternaryLabelColor";
    v24 = [MEMORY[0x263F825C8] quaternaryLabelColor];
    v62[33] = v24;
    v61[34] = @"linkColor";
    v25 = [MEMORY[0x263F825C8] linkColor];
    v62[34] = v25;
    v61[35] = @"placeholderTextColor";
    v26 = [MEMORY[0x263F825C8] placeholderTextColor];
    v62[35] = v26;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:36];
    v28 = (void *)_remoteUI_colorWithString_defaultColor__colorMap;
    _remoteUI_colorWithString_defaultColor__colorMap = v27;

    v19 = (void *)_remoteUI_colorWithString_defaultColor__colorMap;
  }
  id v18 = [v19 objectForKeyedSubscript:v5];

  if (!v18) {
LABEL_14:
  }
    id v18 = v6;
LABEL_15:

  return v18;
}

+ (id)_remoteUI_colorWithString:()RemoteUIAdditions
{
  v4 = (void *)MEMORY[0x263F825C8];
  id v5 = a3;
  id v6 = [v4 labelColor];
  v7 = objc_msgSend(a1, "_remoteUI_colorWithString:defaultColor:", v5, v6);

  return v7;
}

@end