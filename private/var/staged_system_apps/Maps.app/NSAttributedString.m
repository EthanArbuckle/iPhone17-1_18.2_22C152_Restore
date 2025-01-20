@interface NSAttributedString
+ (NSAttributedString)attributedStringWithText:(id)a3 boldInRange:(id)a4 font:(id)a5 bold:(id)a6;
+ (NSAttributedString)attributedStringWithText:(id)a3 highlightRanges:(id)a4 font:(id)a5 highlightedFont:(id)a6 highlightedTextColor:(id)a7;
+ (NSAttributedString)attributedStringWithText:(id)a3 highlightRanges:(id)a4 font:(id)a5 highlightedFont:(id)a6 highlightedTextColor:(id)a7 unhighlightedTextColor:(id)a8;
+ (id)unsafeBoldCharacterSet;
- (NSAttributedString)_maps_attributedStringByReplacingWhitespaceToAvoidOrphanWords;
- (id)_maps_attributedStringByAppendingRidesharingSpecialPricingBadge:(id)a3 representativeContentFont:(id)a4;
- (id)_maps_attributedStringByApplyingBindingFormatReplacements:(id)a3;
- (id)_maps_attributedStringWithExcessiveHeightCharacterSupport;
- (id)_maps_attributedStringWithExcessiveHeightCharacterSupport:(double)a3;
@end

@implementation NSAttributedString

- (id)_maps_attributedStringByApplyingBindingFormatReplacements:(id)a3
{
  return [(NSAttributedString *)self _mapkit_attributedStringByApplyingBindingFormatReplacements:a3];
}

- (id)_maps_attributedStringWithExcessiveHeightCharacterSupport
{
  return [(NSAttributedString *)self _maps_attributedStringWithExcessiveHeightCharacterSupport:1.29999995];
}

- (id)_maps_attributedStringWithExcessiveHeightCharacterSupport:(double)a3
{
  v5 = [(NSAttributedString *)self string];
  if (objc_msgSend(v5, "_maps_containsExcessiveHeightCharacters"))
  {
    id v6 = [(NSAttributedString *)self mutableCopy];
    id v7 = [v5 length];
    v8 = [v6 attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:0];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v12 = +[NSParagraphStyle defaultParagraphStyle];
      id v10 = [v12 mutableCopy];
    }
    [v10 setLineHeightMultiple:a3];
    [v6 addAttribute:NSParagraphStyleAttributeName value:v10 range:0];
    v11 = (NSAttributedString *)[v6 copy];
  }
  else
  {
    v11 = self;
  }

  return v11;
}

- (id)_maps_attributedStringByAppendingRidesharingSpecialPricingBadge:(id)a3 representativeContentFont:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 lineHeight];
  v8 = [v7 badgeImageWithMaximumDimension:];

  if (v8)
  {
    id v9 = [objc_alloc((Class)NSTextAttachment) initWithData:0 ofType:0];
    [v9 setImage:v8];
    [v6 lineHeight];
    double v11 = v10;
    [v8 size];
    double v13 = (v11 - v12) * 0.5;
    [v6 descender];
    double v15 = v14 + v13;
    [v8 size];
    [v9 setBounds:0.0, v15, v16, v17];
    v18 = +[NSAttributedString attributedStringWithAttachment:v9];
    v19 = objc_opt_class();
    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"SUBTITLE - SURGE ICON INDICATOR [Ridesharing format string]" value:@"localized string not found" table:0];
    v25[0] = @"subtitle";
    v25[1] = @"surgeIcon";
    v26[0] = self;
    v26[1] = v18;
    v22 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v19 _mapkit_attributedStringWithBindingFormat:v21 replacements:v22 attributes:0];
    v23 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = self;
  }

  return v23;
}

+ (id)unsafeBoldCharacterSet
{
  if (qword_1016105C0 != -1) {
    dispatch_once(&qword_1016105C0, &stru_1013154D8);
  }
  v2 = (void *)qword_1016105C8;

  return v2;
}

+ (NSAttributedString)attributedStringWithText:(id)a3 boldInRange:(id)a4 font:(id)a5 bold:(id)a6
{
  return (NSAttributedString *)[a1 attributedStringWithText:a3 highlightRanges:a4 font:a5 highlightedFont:a6 highlightedTextColor:0];
}

+ (NSAttributedString)attributedStringWithText:(id)a3 highlightRanges:(id)a4 font:(id)a5 highlightedFont:(id)a6 highlightedTextColor:(id)a7
{
  return (NSAttributedString *)[a1 attributedStringWithText:a3 highlightRanges:a4 font:a5 highlightedFont:a6 highlightedTextColor:a7 unhighlightedTextColor:0];
}

+ (NSAttributedString)attributedStringWithText:(id)a3 highlightRanges:(id)a4 font:(id)a5 highlightedFont:(id)a6 highlightedTextColor:(id)a7 unhighlightedTextColor:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v37 = a7;
  id v17 = a8;
  if ([v13 length])
  {
    v18 = +[NSAttributedString unsafeBoldCharacterSet];
    id v19 = objc_alloc((Class)NSMutableAttributedString);
    NSAttributedStringKey v43 = NSFontAttributeName;
    id v44 = v15;
    v20 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v21 = [v19 initWithString:v13 attributes:v20];

    if (v17) {
      [v21 addAttribute:NSForegroundColorAttributeName value:v17 range:NSMakeRange(0, [v13 length])];
    }
    if ([v14 count] && objc_msgSend(v13, "rangeOfCharacterFromSet:", v18) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v32 = v18;
      id v33 = v17;
      id v34 = v15;
      id v35 = v14;
      id v36 = v13;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v22 = v14;
      id v23 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v39;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v39 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = [*(id *)(*((void *)&v38 + 1) + 8 * i) rangeValue:v32, v33, v34, v35, v36];
            if (v27 != (char *)0x7FFFFFFFFFFFFFFFLL)
            {
              v29 = v27;
              uint64_t v30 = v28;
              if (&v27[v28] <= [v21 length])
              {
                if (v16) {
                  [v21 addAttribute:NSFontAttributeName value:v16 range:v29, v30];
                }
                if (v37) {
                  [v21 addAttribute:NSForegroundColorAttributeName value:v37 range:v29, v30];
                }
              }
            }
          }
          id v24 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v24);
      }

      id v14 = v35;
      id v13 = v36;
      id v17 = v33;
      id v15 = v34;
      v18 = v32;
    }
  }
  else
  {
    id v21 = [objc_alloc((Class)NSAttributedString) initWithString:&stru_101324E70];
  }

  return (NSAttributedString *)v21;
}

- (NSAttributedString)_maps_attributedStringByReplacingWhitespaceToAvoidOrphanWords
{
  id v2 = [(NSAttributedString *)self mutableCopy];
  v3 = [v2 string];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3010000000;
  v20 = &unk_1011B93F2;
  int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100A56C5C;
  v12[3] = &unk_1012F76B8;
  v12[4] = &v13;
  [v3 enumerateSubstringsInRange:0 length:[v3 length] options:3 usingBlock:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A56C74;
  v11[3] = &unk_1012F76B8;
  v11[4] = &v17;
  [v3 enumerateSubstringsInRange:0 length:[v3 length] options:259 usingBlock:v11];
  uint64_t v4 = v18[4];
  if (v4 && v4 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)v18[5] <= 1 && (unint64_t)v14[3] > 2)
  {
    v8 = +[NSCharacterSet whitespaceCharacterSet];
    uint64_t v9 = v4 - 1;
    id v10 = [v3 rangeOfCharacterFromSet:v8 options:0 range:v9];

    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL) {
      [v2 replaceCharactersInRange:v9 withString:@" "];
    }
    id v5 = [v2 copy];
  }
  else
  {
    id v5 = v2;
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return (NSAttributedString *)v6;
}

@end