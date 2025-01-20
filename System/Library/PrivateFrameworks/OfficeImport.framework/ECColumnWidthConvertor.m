@interface ECColumnWidthConvertor
- (CGSize)stringSizeWithFont:(id)a3 edFont:(id)a4 drawingState:(id)a5;
- (double)lassoColumnWidthFromXl:(double)a3;
- (double)xlColumnWidthFromLasso:(double)a3;
- (double)xlColumnWidthFromXlBaseColumnWidth:(double)a3;
- (float)fontWidthAdjustmentFor:(id)a3;
- (void)setupWithEDFont:(id)a3 state:(id)a4;
@end

@implementation ECColumnWidthConvertor

- (void)setupWithEDFont:(id)a3 state:(id)a4
{
  id v5 = a3;
  self->mMultiplier = 7;
  id v9 = v5;
  -[ECColumnWidthConvertor stringSizeWithFont:edFont:drawingState:](self, "stringSizeWithFont:edFont:drawingState:", @"m");
  float v7 = v6 * 0.65;
  if (v7 != 0.0)
  {
    [(ECColumnWidthConvertor *)self fontWidthAdjustmentFor:v9];
    self->mMultiplier = (int)((float)(v8 * v7) + 0.5);
  }
}

- (CGSize)stringSizeWithFont:(id)a3 edFont:(id)a4 drawingState:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = *MEMORY[0x263F001B0];
  double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v7 && [v7 length])
  {
    v12 = [v8 name];
    if (!v9)
    {
      [v8 height];
      CTFontRef v14 = CTFontCreateWithName(v12, v13 / 20.0, 0);
      if (v14)
      {
        +[TCImportFontCache stringSizeForText:v7 ctFontRef:v14];
        double v10 = v15;
        double v11 = v16;
        CFRelease(v14);
      }
      else
      {
        v17 = [NSString stringWithUTF8String:"-[ECColumnWidthConvertor(Private) stringSizeWithFont:edFont:drawingState:]"];
        v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Excel/Common/ECColumnWidthConvertor.mm"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 90, 0, "invalid nil value for '%{public}s'", "ctFontRef");

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
    }
  }
  double v19 = v10;
  double v20 = v11;
  result.height = v20;
  result.width = v19;
  return result;
}

- (double)xlColumnWidthFromXlBaseColumnWidth:(double)a3
{
  return 5.0 / (double)self->mMultiplier + a3;
}

- (double)lassoColumnWidthFromXl:(double)a3
{
  return round((double)self->mMultiplier * a3);
}

- (double)xlColumnWidthFromLasso:(double)a3
{
  return a3 / (double)self->mMultiplier;
}

- (float)fontWidthAdjustmentFor:(id)a3
{
  id v3 = a3;
  {
    -[ECColumnWidthConvertor(Private) fontWidthAdjustmentFor:]::sFontAdjustmentMap = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"Academy Engraved LET", &unk_26EC81348, @"Apple-Chancery", &unk_26EC81358, @"AbadiMT-CondensedExtraBold", &unk_26EC81368, @"Ayuthaya", &unk_26EC81378, @"Arial", &unk_26EC81378, @"ArialMT", &unk_26EC81378, @"ArialRoundedMTBold", &unk_26EC81378, @"AmericanTypewriter", &unk_26EC81378, @"AlBayan",
                                                                                       &unk_26EC81378,
                                                                                       @"AppleSymbols",
                                                                                       &unk_26EC81378,
                                                                                       @"Avenir-Heavy",
                                                                                       &unk_26EC81378,
                                                                                       @"Avenir-Black",
                                                                                       &unk_26EC81388,
                                                                                       @"Avenir-Light",
                                                                                       &unk_26EC81378,
                                                                                       @"Avenir Next",
                                                                                       &unk_26EC81378,
                                                                                       @"Avenir Medium",
                                                                                       &unk_26EC81378,
                                                                                       @"AvenirNext-DemiBold",
                                                                                       &unk_26EC81378,
                                                                                       @"AvenirNext-Heavy",
                                                                                       &unk_26EC81378,
                                                                                       @"AvenirNext-Medium",
                                                                                       &unk_26EC81378,
                                                                                       @"AvenirNextCondensed-Medium",
                                                                                       &unk_26EC81398,
                                                                                       @"Avenir Next Condensed Ultra Lig",
                                                                                       &unk_26EC81388,
                                                                                       @"AvenirNext-UltraLight",
                                                                                       &unk_26EC81368,
                                                                                       @"Baghdad",
                                                                                       &unk_26EC81358,
                                                                                       @"BanglaSangamMN",
                                                                                       &unk_26EC813A8,
                                                                                       @"Bank Gothic",
                                                                                       &unk_26EC813A8,
                                                                                       @"Blackmoor LET",
                                                                                       &unk_26EC813B8,
                                                                                       @"BlairMdITC TT",
                                                                                       &unk_26EC813B8,
                                                                                       @"Bodoni 72",
                                                                                       &unk_26EC813B8,
                                                                                       @"Bodoni 72 Oldstyle",
                                                                                       &unk_26EC81368,
                                                                                       @"Bodoni 72 Smallcaps",
                                                                                       &unk_26EC813C8,
                                                                                       @"BodoniOrnamentsITCTT",
                                                                                       &unk_26EC81348,
                                                                                       @"BookshelfSymbolSeven");
  }
  v4 = (void *)-[ECColumnWidthConvertor(Private) fontWidthAdjustmentFor:]::sFontAdjustmentMap;
  id v5 = [v3 name];
  double v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    [v6 floatValue];
    float v8 = v7;
  }
  else
  {
    float v8 = 1.0;
  }

  return v8;
}

@end