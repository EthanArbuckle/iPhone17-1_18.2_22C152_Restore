@interface WLDetailItem
+ (id)contexts:(id)a3;
+ (id)importDescriptionForType:(int64_t)a3 import:(unint64_t)a4 total:(unint64_t)a5;
+ (id)items:(id)a3;
+ (id)items:(id)a3 size:(unint64_t *)a4;
+ (id)order;
- (BOOL)failed;
- (BOOL)showDetailDiscloureButton;
- (NSString)detailText;
- (NSString)secondaryText;
- (NSString)symbol;
- (NSString)text;
- (UIColor)symbolTintColor;
- (WLDetailItem)initWithType:(int64_t)a3 count:(unint64_t)a4 secondaryText:(id)a5 alternativeTextUsed:(BOOL)a6 symbolFilled:(BOOL)a7 symbolTintColor:(id)a8;
- (WLDetailItem)initWithType:(int64_t)a3 secondaryText:(id)a4 detailText:(id)a5 showDetailDiscloureButton:(BOOL)a6 failed:(BOOL)a7;
- (void)setDetailText:(id)a3;
- (void)setFailed:(BOOL)a3;
- (void)setSecondaryText:(id)a3;
- (void)setShowDetailDiscloureButton:(BOOL)a3;
- (void)setSymbol:(id)a3;
- (void)setSymbolTintColor:(id)a3;
- (void)setText:(id)a3;
@end

@implementation WLDetailItem

- (WLDetailItem)initWithType:(int64_t)a3 count:(unint64_t)a4 secondaryText:(id)a5 alternativeTextUsed:(BOOL)a6 symbolFilled:(BOOL)a7 symbolTintColor:(id)a8
{
  BOOL v9 = a7;
  id v12 = a5;
  id v13 = a8;
  v21.receiver = self;
  v21.super_class = (Class)WLDetailItem;
  v14 = [(WLDetailItem *)&v21 init];
  v15 = v14;
  if (v14)
  {
    [(WLDetailItem *)v14 setSecondaryText:v12];
    [(WLDetailItem *)v15 setSymbolTintColor:v13];
    switch(a3)
    {
      case 0:
        if (v9) {
          v16 = @"message.fill";
        }
        else {
          v16 = @"message";
        }
        goto LABEL_40;
      case 1:
        if (v9) {
          v16 = @"person.2.fill";
        }
        else {
          v16 = @"person.2";
        }
        goto LABEL_40;
      case 2:
        if (v9) {
          v16 = @"person.2.fill";
        }
        else {
          v16 = @"person.2";
        }
        goto LABEL_40;
      case 3:
        [(WLDetailItem *)v15 setSymbol:@"calendar"];
        goto LABEL_48;
      case 4:
        if (v9) {
          v16 = @"bookmark.fill";
        }
        else {
          v16 = @"bookmark";
        }
        goto LABEL_40;
      case 5:
        if (v9) {
          v16 = @"folder.fill";
        }
        else {
          v16 = @"folder";
        }
        goto LABEL_40;
      case 6:
        if (v9) {
          v16 = @"photo.fill";
        }
        else {
          v16 = @"photo";
        }
        goto LABEL_40;
      case 7:
        if (v9) {
          v16 = @"photo.fill";
        }
        else {
          v16 = @"photo";
        }
        goto LABEL_40;
      case 8:
        if (v9) {
          v16 = @"photo.fill.on.rectangle.fill";
        }
        else {
          v16 = @"photo.on.rectangle";
        }
        goto LABEL_40;
      case 9:
        if (v9) {
          v16 = @"waveform.circle.fill";
        }
        else {
          v16 = @"waveform.circle";
        }
        goto LABEL_40;
      case 10:
        if (v9) {
          v17 = @"app.badge.fill";
        }
        else {
          v17 = @"app.badge";
        }
        goto LABEL_46;
      case 11:
        if (v9) {
          v16 = @"envelope.fill";
        }
        else {
          v16 = @"envelope";
        }
        goto LABEL_40;
      case 12:
        if (v9) {
          v16 = @"app.badge.fill";
        }
        else {
          v16 = @"app.badge";
        }
LABEL_40:
        [(WLDetailItem *)v15 setSymbol:v16];
LABEL_48:
        v19 = WLLocalizedString();
        [(WLDetailItem *)v15 setText:v19];

        break;
      case 14:
        [(WLDetailItem *)v15 setSymbol:@"textformat.size"];
        goto LABEL_47;
      case 15:
        [(WLDetailItem *)v15 setSymbol:@"dot.arrowtriangles.up.right.down.left.circle"];
        goto LABEL_47;
      case 16:
        if (v9) {
          v17 = @"simcard.fill";
        }
        else {
          v17 = @"simcard";
        }
LABEL_46:
        [(WLDetailItem *)v15 setSymbol:v17];
LABEL_47:
        v18 = WLLocalizedString();
        [(WLDetailItem *)v15 setText:v18];

        [(WLDetailItem *)v15 setSecondaryText:0];
        break;
      default:
        break;
    }
  }

  return v15;
}

- (WLDetailItem)initWithType:(int64_t)a3 secondaryText:(id)a4 detailText:(id)a5 showDetailDiscloureButton:(BOOL)a6 failed:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WLDetailItem;
  v14 = [(WLDetailItem *)&v18 init];
  v15 = v14;
  if (v14)
  {
    [(WLDetailItem *)v14 setSecondaryText:v12];
    [(WLDetailItem *)v15 setDetailText:v13];
    [(WLDetailItem *)v15 setShowDetailDiscloureButton:v8];
    [(WLDetailItem *)v15 setFailed:v7];
    if (unint64_t)a3 <= 0x10 && ((0x1DFFFu >> a3))
    {
      v16 = WLLocalizedString();
      [(WLDetailItem *)v15 setText:v16];
    }
  }

  return v15;
}

+ (id)order
{
  return &unk_26DDF06B0;
}

+ (id)contexts:(id)a3
{
  v24[17] = *MEMORY[0x263EF8340];
  v23[0] = &unk_26DDF0518;
  id v3 = a3;
  v22 = [v3 message];
  v24[0] = v22;
  v23[1] = &unk_26DDF0530;
  objc_super v21 = [v3 contact];
  v24[1] = v21;
  v23[2] = &unk_26DDF0548;
  v20 = [v3 callHistory];
  v24[2] = v20;
  v23[3] = &unk_26DDF0560;
  v19 = [v3 calendar];
  v24[3] = v19;
  v23[4] = &unk_26DDF0578;
  objc_super v18 = [v3 bookmark];
  v24[4] = v18;
  v23[5] = &unk_26DDF0590;
  v17 = [v3 file];
  v24[5] = v17;
  v23[6] = &unk_26DDF05A8;
  v16 = [v3 image];
  v24[6] = v16;
  v23[7] = &unk_26DDF05C0;
  v15 = [v3 video];
  v24[7] = v15;
  v23[8] = &unk_26DDF05D8;
  v4 = [v3 album];
  v24[8] = v4;
  v23[9] = &unk_26DDF05F0;
  v5 = [v3 voiceMemo];
  v24[9] = v5;
  v23[10] = &unk_26DDF0608;
  v6 = [v3 account];
  v24[10] = v6;
  v23[11] = &unk_26DDF0620;
  BOOL v7 = [v3 application];
  v24[11] = v7;
  v23[12] = &unk_26DDF0638;
  BOOL v8 = [v3 placeholder];
  v24[12] = v8;
  v23[13] = &unk_26DDF0668;
  BOOL v9 = [v3 accessibilitySetting];
  v24[13] = v9;
  v23[14] = &unk_26DDF0680;
  v10 = [v3 displaySetting];
  v24[14] = v10;
  v23[15] = &unk_26DDF0698;
  v11 = [v3 container];
  v24[15] = v11;
  v23[16] = &unk_26DDF0650;
  id v12 = [v3 sim];

  v24[16] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:17];

  return v13;
}

+ (id)items:(id)a3 size:(unint64_t *)a4
{
  v24 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[WLDetailItem order];
  v26 = v4;
  v31 = +[WLDetailItem contexts:v4];
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v6 setNumberStyle:1];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v33)
  {
    unint64_t v32 = 0;
    goto LABEL_30;
  }
  unint64_t v32 = 0;
  uint64_t v30 = *(void *)v35;
  unint64_t v7 = 0x263F08000uLL;
  do
  {
    for (uint64_t i = 0; i != v33; ++i)
    {
      if (*(void *)v35 != v30) {
        objc_enumerationMutation(obj);
      }
      BOOL v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      uint64_t v10 = objc_msgSend(v9, "integerValue", v24);
      v11 = [v31 objectForKey:v9];
      if ([v11 importCount] || objc_msgSend(v11, "importErrorCount"))
      {
        id v12 = objc_msgSend(*(id *)(v7 + 2584), "numberWithUnsignedLongLong:", objc_msgSend(v11, "importCount"));
        id v13 = [v6 stringFromNumber:v12];

        if (v10 == 12 && ![v11 importCount] && objc_msgSend(v11, "importErrorCount"))
        {

          id v13 = 0;
        }
        if ([v11 importCount]) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = (unint64_t)(v10 - 14) >= 3;
        }
        if (v14)
        {
          v15 = -[WLDetailItem initWithType:count:secondaryText:alternativeTextUsed:symbolFilled:symbolTintColor:]([WLDetailItem alloc], "initWithType:count:secondaryText:alternativeTextUsed:symbolFilled:symbolTintColor:", v10, [v11 importCount], v13, 0, 1, 0);
          [v28 addObject:v15];
        }
        else
        {
          v15 = 0;
        }
        if ([v11 importErrorCount])
        {
          unint64_t v16 = v7;
          v17 = objc_msgSend(*(id *)(v7 + 2584), "numberWithUnsignedLongLong:", objc_msgSend(v11, "importErrorCount"));
          objc_super v18 = [v6 stringFromNumber:v17];

          v19 = [WLDetailItem alloc];
          uint64_t v20 = [v11 importErrorCount];
          objc_super v21 = [MEMORY[0x263F825C8] tertiaryLabelColor];
          v22 = [(WLDetailItem *)v19 initWithType:v10 count:v20 secondaryText:v18 alternativeTextUsed:1 symbolFilled:0 symbolTintColor:v21];

          if (v10 == 10 || v10 == 12)
          {
            unint64_t v7 = v16;
LABEL_25:

            goto LABEL_26;
          }
          [v27 addObject:v22];
          unint64_t v7 = v16;
        }
        else
        {
          objc_super v18 = v13;
          v22 = v15;
        }
        v32 += [v11 size];
        goto LABEL_25;
      }
LABEL_26:
    }
    uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  }
  while (v33);
LABEL_30:

  [v25 addObject:v28];
  if ([v27 count]) {
    [v25 addObject:v27];
  }
  if (v24) {
    unint64_t *v24 = v32;
  }

  return v25;
}

+ (id)items:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[WLDetailItem order];
  v38 = v3;
  v5 = +[WLDetailItem contexts:v3];
  id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26DDF0620, &unk_26DDF0698, 0);
  v48 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26DDF0668, &unk_26DDF0680, &unk_26DDF0650, 0);
  v42 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26DDF05A8, &unk_26DDF05C0, &unk_26DDF05F0, 0);
  id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v37 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v37 setNumberStyle:1];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v49 = *(void *)v51;
    v40 = v6;
    v41 = v5;
    do
    {
      uint64_t v9 = 0;
      uint64_t v45 = v8;
      do
      {
        if (*(void *)v51 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v50 + 1) + 8 * v9);
        uint64_t v11 = [v10 integerValue];
        id v12 = [v5 objectForKeyedSubscript:v10];
        if ([v12 importCount] || objc_msgSend(v12, "importErrorCount"))
        {
          if ([v48 containsObject:v10])
          {
            if (v11 == 16 && [v12 importErrorCount])
            {
              id v13 = WLLocalizedString();
              BOOL v14 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DETAIL_ITEM_WARNING_DESCRIPTION_FOR_SIM"];
              v15 = WLLocalizedString();

              unint64_t v16 = [[WLDetailItem alloc] initWithType:16 secondaryText:v13 detailText:v15 showDetailDiscloureButton:1 failed:1];
              [v44 addObject:v16];

LABEL_17:
              goto LABEL_18;
            }
            id v13 = WLLocalizedString();
          }
          else
          {
            if ([v12 importErrorCount] && (objc_msgSend(v6, "containsObject:", v10) & 1) == 0)
            {
              uint64_t v20 = NSString;
              objc_super v21 = WLLocalizedString();
              id v13 = objc_msgSend(v20, "localizedStringWithFormat:", v21, objc_msgSend(v12, "importErrorCount") + objc_msgSend(v12, "importCount"));

              id v22 = objc_alloc_init(MEMORY[0x263F089D8]);
              v23 = +[WLDetailItem importDescriptionForType:import:total:](WLDetailItem, "importDescriptionForType:import:total:", v11, [v12 importCount], objc_msgSend(v12, "importErrorCount") + objc_msgSend(v12, "importCount"));
              v43 = v23;
              if ([v23 length])
              {
                [v22 appendString:v23];
              }
              else
              {
                uint64_t v39 = NSString;
                v24 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DETAIL_ITEM_WARNING_DESCRIPTION_TRANFERRED_%lld_%lld"];
                id v25 = WLLocalizedString();
                v26 = objc_msgSend(v39, "localizedStringWithFormat:", v25, objc_msgSend(v12, "importCount"), objc_msgSend(v12, "importErrorCount") + objc_msgSend(v12, "importCount"));
                [v22 appendString:v26];
              }
              [v22 appendString:@"\n\n"];
              if ([v42 containsObject:v10])
              {
                id v27 = NSString;
                id v28 = WLLocalizedString();
                v29 = objc_msgSend(v27, "localizedStringWithFormat:", v28, objc_msgSend(v12, "importErrorCount"));
                [v22 appendString:v29];
              }
              else
              {
                uint64_t v30 = NSString;
                if (v11 == 8) {
                  v31 = @"DETAIL_ITEM_WARNING_DESCRITPION_IMPORTED_PHOTO_ALBUM_%lld";
                }
                else {
                  v31 = @"DETAIL_ITEM_WARNING_DESCRITPION_IMPORTED_%lld";
                }
                id v28 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:v31];
                v29 = WLLocalizedString();
                unint64_t v32 = objc_msgSend(v30, "localizedStringWithFormat:", v29, objc_msgSend(v12, "importErrorCount"));
                [v22 appendString:v32];
              }
              id v6 = v40;
              v5 = v41;

              [v22 appendString:@" "];
              uint64_t v33 = WLLocalizedString();
              [v22 appendString:v33];

              unint64_t v16 = [[WLDetailItem alloc] initWithType:v11 secondaryText:v13 detailText:v22 showDetailDiscloureButton:1 failed:0];
              [v44 addObject:v16];

              uint64_t v8 = v45;
              goto LABEL_17;
            }
            v17 = NSString;
            objc_super v18 = WLLocalizedString();
            uint64_t v36 = [v12 importCount];
            v19 = v17;
            uint64_t v8 = v45;
            id v13 = objc_msgSend(v19, "localizedStringWithFormat:", v18, v36);
          }
          unint64_t v16 = [[WLDetailItem alloc] initWithType:v11 secondaryText:v13 detailText:0 showDetailDiscloureButton:0 failed:0];
          [v47 addObject:v16];
          goto LABEL_17;
        }
LABEL_18:

        ++v9;
      }
      while (v8 != v9);
      uint64_t v34 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      uint64_t v8 = v34;
    }
    while (v34);
  }

  [v44 addObjectsFromArray:v47];

  return v44;
}

+ (id)importDescriptionForType:(int64_t)a3 import:(unint64_t)a4 total:(unint64_t)a5
{
  v5 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v8 = NSString;
      goto LABEL_13;
    case 1:
      uint64_t v8 = NSString;
      goto LABEL_13;
    case 2:
      uint64_t v8 = NSString;
      goto LABEL_13;
    case 3:
      uint64_t v8 = NSString;
      goto LABEL_13;
    case 4:
      uint64_t v8 = NSString;
      goto LABEL_13;
    case 5:
      uint64_t v8 = NSString;
      goto LABEL_13;
    case 6:
    case 7:
    case 8:
      uint64_t v8 = NSString;
      goto LABEL_13;
    case 9:
      uint64_t v8 = NSString;
      goto LABEL_13;
    case 10:
      uint64_t v8 = NSString;
      goto LABEL_13;
    case 11:
      uint64_t v8 = NSString;
      goto LABEL_13;
    case 14:
    case 15:
      uint64_t v8 = NSString;
LABEL_13:
      uint64_t v9 = WLLocalizedString();
      v5 = objc_msgSend(v8, "localizedStringWithFormat:", v9, a4, a5);

      break;
    default:
      break;
  }

  return v5;
}

- (BOOL)showDetailDiscloureButton
{
  return self->_showDetailDiscloureButton;
}

- (void)setShowDetailDiscloureButton:(BOOL)a3
{
  self->_showDetailDiscloureButton = a3;
}

- (BOOL)failed
{
  return self->_failed;
}

- (void)setFailed:(BOOL)a3
{
  self->_failed = a3;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (UIColor)symbolTintColor
{
  return self->_symbolTintColor;
}

- (void)setSymbolTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolTintColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_symbol, 0);
}

@end