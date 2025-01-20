@interface NTKBatteryTimelineEntryModel
- (float)level;
- (id)_graphicExtraLargeCircularTemplate;
- (id)_levelTintColor;
- (id)_newBatteryTemplateForFamily:(int64_t)a3;
- (id)_newUtilitarianLargeTemplate;
- (id)_newUtilitarianSmallFlatTemplate;
- (id)_ringTextProvider;
- (id)_signatureBezelTemplate;
- (id)_signatureCircularTemplate;
- (id)_signatureCornerTemplate;
- (id)templateForComplicationFamily:(int64_t)a3;
- (int64_t)state;
- (void)setLevel:(float)a3;
- (void)setState:(int64_t)a3;
@end

@implementation NTKBatteryTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  v5 = 0;
  switch(a3)
  {
    case 0:
    case 2:
    case 4:
    case 7:
      id v6 = [(NTKBatteryTimelineEntryModel *)self _newBatteryTemplateForFamily:a3];
      goto LABEL_9;
    case 3:
      id v6 = [(NTKBatteryTimelineEntryModel *)self _newUtilitarianLargeTemplate];
      goto LABEL_9;
    case 6:
      id v6 = [(NTKBatteryTimelineEntryModel *)self _newUtilitarianSmallFlatTemplate];
      goto LABEL_9;
    case 8:
      id v6 = [(NTKBatteryTimelineEntryModel *)self _signatureCornerTemplate];
      goto LABEL_9;
    case 9:
      id v6 = [(NTKBatteryTimelineEntryModel *)self _signatureBezelTemplate];
      goto LABEL_9;
    case 10:
      id v6 = [(NTKBatteryTimelineEntryModel *)self _signatureCircularTemplate];
      goto LABEL_9;
    case 12:
      id v6 = [(NTKBatteryTimelineEntryModel *)self _graphicExtraLargeCircularTemplate];
LABEL_9:
      v5 = v6;
      break;
    default:
      break;
  }
  if (*MEMORY[0x1E4F19648] == a3)
  {
    id v7 = [(NTKBatteryTimelineEntryModel *)self _newBatteryTemplateForFamily:a3];

    v5 = v7;
  }

  return v5;
}

- (id)_newUtilitarianSmallFlatTemplate
{
  [(NTKBatteryTimelineEntryModel *)self level];
  v2 = +[NTKRing fillFractionStringWithSymbolForFillFraction:](NTKRing, "fillFractionStringWithSymbolForFillFraction:");
  v3 = [MEMORY[0x1E4F19AB0] finalizedTextProviderWithText:v2];
  v4 = [MEMORY[0x1E4F199E8] templateWithTextProvider:v3];
  [v4 finalize];

  return v4;
}

- (id)_newUtilitarianLargeTemplate
{
  *(float *)&double v2 = self->_level;
  v4 = +[NTKRing fillFractionStringWithSymbolForFillFraction:v2];
  v5 = +[NTKBatteryUtilities chargingStringForState:self->_state];
  id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v7 = [v5 uppercaseStringWithLocale:v6];

  v8 = NTKClockFaceLocalizedString(@"BATTERY_FORMAT", @"%@ %@");
  v9 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, v4, v7);
  v10 = (void *)MEMORY[0x1E4F19A80];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__NTKBatteryTimelineEntryModel__newUtilitarianLargeTemplate__block_invoke;
  v15[3] = &unk_1E62C7040;
  v15[4] = self;
  id v16 = v4;
  id v11 = v4;
  v12 = [v10 textProviderWithText:v9 overrideBlock:v15];
  v13 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v12];

  return v13;
}

id __60__NTKBatteryTimelineEntryModel__newUtilitarianLargeTemplate__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
    uint64_t v10 = [*(id *)(a1 + 32) _levelTintColor];
    id v11 = (void *)v10;
    if (v10)
    {
      uint64_t v20 = *MEMORY[0x1E4FB0700];
      v21[0] = v10;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      uint64_t v13 = [v7 rangeOfString:*(void *)(a1 + 40)];
      objc_msgSend(v9, "setAttributes:range:", v12, v13, v14);
    }
    uint64_t v18 = *MEMORY[0x1E4FB06F8];
    v15 = [v8 font];
    v19 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    objc_msgSend(v9, "setAttributes:range:", v16, 0, objc_msgSend(v7, "length"));
  }

  return v9;
}

- (id)_newBatteryTemplateForFamily:(int64_t)a3
{
  v5 = (void *)MEMORY[0x1E4F196E8];
  id v6 = [(NTKBatteryTimelineEntryModel *)self _ringTextProvider];
  [(NTKBatteryTimelineEntryModel *)self level];
  id v8 = objc_msgSend(v5, "templateWithFamily:textProvider:level:charging:", a3, v6, +[NTKBatteryUtilities chargingForState:](NTKBatteryUtilities, "chargingForState:", -[NTKBatteryTimelineEntryModel state](self, "state")), v7);

  return v8;
}

- (id)_signatureCornerTemplate
{
  v3 = [(NTKBatteryTimelineEntryModel *)self _levelTintColor];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  id v6 = v5;

  float v7 = (void *)MEMORY[0x1E4F19AA0];
  [(NTKBatteryTimelineEntryModel *)self level];
  id v8 = objc_msgSend(v7, "gaugeProviderWithStyle:gaugeColor:fillFraction:", 1, v6);
  [(NTKBatteryTimelineEntryModel *)self level];
  v9 = +[NTKRing fillFractionStringWithSymbolForFillFraction:](NTKRing, "fillFractionStringWithSymbolForFillFraction:");
  uint64_t v10 = [MEMORY[0x1E4F19AB0] textProviderWithText:v9];
  id v11 = [MEMORY[0x1E4F19858] templateWithGaugeProvider:v8 outerTextProvider:v10];

  return v11;
}

- (id)_signatureCircularTemplate
{
  v3 = [(NTKBatteryTimelineEntryModel *)self _levelTintColor];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  id v6 = v5;

  float v7 = (void *)MEMORY[0x1E4F19AA0];
  [(NTKBatteryTimelineEntryModel *)self level];
  id v8 = objc_msgSend(v7, "gaugeProviderWithStyle:gaugeColor:fillFraction:", 1, v6);
  [(NTKBatteryTimelineEntryModel *)self level];
  v9 = +[NTKRing fillFractionStringForFillFraction:](NTKRing, "fillFractionStringForFillFraction:");
  uint64_t v10 = [MEMORY[0x1E4F19AB0] textProviderWithText:v9];
  id v11 = [MEMORY[0x1E4F197D0] templateWithGaugeProvider:v8 centerTextProvider:v10];

  return v11;
}

- (id)_graphicExtraLargeCircularTemplate
{
  v3 = [(NTKBatteryTimelineEntryModel *)self _levelTintColor];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  id v6 = v5;

  float v7 = (void *)MEMORY[0x1E4F19AA0];
  [(NTKBatteryTimelineEntryModel *)self level];
  id v8 = objc_msgSend(v7, "gaugeProviderWithStyle:gaugeColor:fillFraction:", 1, v6);
  [(NTKBatteryTimelineEntryModel *)self level];
  v9 = +[NTKRing fillFractionStringForFillFraction:](NTKRing, "fillFractionStringForFillFraction:");
  uint64_t v10 = [MEMORY[0x1E4F19AB0] textProviderWithText:v9];
  id v11 = [MEMORY[0x1E4F198A0] templateWithGaugeProvider:v8 centerTextProvider:v10];

  return v11;
}

- (id)_signatureBezelTemplate
{
  double v2 = (void *)MEMORY[0x1E4F197B8];
  v3 = [(NTKBatteryTimelineEntryModel *)self _signatureCircularTemplate];
  v4 = [v2 templateWithCircularTemplate:v3];

  return v4;
}

- (id)_levelTintColor
{
  [(NTKBatteryTimelineEntryModel *)self level];
  int v4 = v3;
  int64_t v5 = [(NTKBatteryTimelineEntryModel *)self state];
  LODWORD(v6) = v4;

  return +[NTKBatteryUtilities colorForLevel:v5 andState:v6];
}

- (id)_ringTextProvider
{
  double v2 = (void *)MEMORY[0x1E4F19AB0];
  [(NTKBatteryTimelineEntryModel *)self level];
  int v3 = +[NTKRing fillFractionStringForFillFraction:](NTKRing, "fillFractionStringForFillFraction:");
  int v4 = [v2 textProviderWithText:v3];

  return v4;
}

- (float)level
{
  return self->_level;
}

- (void)setLevel:(float)a3
{
  self->_level = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end