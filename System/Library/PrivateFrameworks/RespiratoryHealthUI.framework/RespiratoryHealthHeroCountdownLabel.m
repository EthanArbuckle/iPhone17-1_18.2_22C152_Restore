@interface RespiratoryHealthHeroCountdownLabel
- (RespiratoryHealthHeroCountdownLabel)initWithFrame:(CGRect)a3;
- (id)_makeUnitLabelFontWithSize:(double)a3;
- (id)_makeValueLabelFontWithSize:(double)a3;
- (id)countdownStringForScaleFactor:(double)a3;
- (void)setScaleFactor:(double)a3;
@end

@implementation RespiratoryHealthHeroCountdownLabel

- (RespiratoryHealthHeroCountdownLabel)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RespiratoryHealthHeroCountdownLabel;
  v3 = -[RespiratoryHealthHeroCountdownLabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] whiteColor];
    [(RespiratoryHealthHeroCountdownLabel *)v3 setTextColor:v4];

    v5 = [(RespiratoryHealthHeroCountdownLabel *)v3 countdownStringForScaleFactor:1.0];
    [(RespiratoryHealthHeroCountdownLabel *)v3 setAttributedText:v5];
  }
  return v3;
}

- (void)setScaleFactor:(double)a3
{
  id v4 = [(RespiratoryHealthHeroCountdownLabel *)self countdownStringForScaleFactor:a3];
  [(RespiratoryHealthHeroCountdownLabel *)self setAttributedText:v4];
}

- (id)countdownStringForScaleFactor:(double)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v5 setSecond:14];
  id v6 = objc_alloc_init(MEMORY[0x263F08780]);
  [v6 setUnitsStyle:2];
  objc_super v7 = [v6 stringFromDateComponents:v5];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F089B8]);
    uint64_t v9 = *MEMORY[0x263F1C238];
    uint64_t v22 = *MEMORY[0x263F1C238];
    v10 = [(RespiratoryHealthHeroCountdownLabel *)self _makeUnitLabelFontWithSize:a3 * 15.0];
    v23[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v12 = (void *)[v8 initWithString:v7 attributes:v11];

    [v6 setUnitsStyle:0];
    v13 = [v6 stringFromDateComponents:v5];
    if (v13)
    {
      uint64_t v14 = [v7 rangeOfString:v13];
      uint64_t v16 = v15;
      uint64_t v20 = v9;
      v17 = [(RespiratoryHealthHeroCountdownLabel *)self _makeValueLabelFontWithSize:a3 * 20.0];
      v21 = v17;
      v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      objc_msgSend(v12, "addAttributes:range:", v18, v14, v16);
    }
  }
  else
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26E87DBF8];
  }

  return v12;
}

- (id)_makeValueLabelFontWithSize:(double)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263F1C658], "hk_roundedSystemFontWithSize:weight:", a3, *MEMORY[0x263F1D330]);
  id v5 = [v4 fontDescriptor];
  uint64_t v6 = *MEMORY[0x263F1D218];
  v11[0] = *MEMORY[0x263F1D220];
  v11[1] = v6;
  v12[0] = &unk_26E87EDA0;
  v12[1] = &unk_26E87EDB8;
  objc_super v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v8 = [v5 fontDescriptorByAddingAttributes:v7];

  uint64_t v9 = [MEMORY[0x263F1C658] fontWithDescriptor:v8 size:a3];

  return v9;
}

- (id)_makeUnitLabelFontWithSize:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "hk_roundedSystemFontWithSize:weight:", a3, *MEMORY[0x263F1D330]);
}

@end