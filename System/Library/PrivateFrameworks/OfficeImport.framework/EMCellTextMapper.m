@interface EMCellTextMapper
+ (double)contentWidthForString:(id)a3 style:(id)a4;
- (EMCellTextMapper)initWithEDString:(id)a3 style:(id)a4 parent:(id)a5;
- (double)contentWidth;
- (void)mapAt:(id)a3 withState:(id)a4 columnWidth:(double)a5 height:(double)a6 spreadLeft:(BOOL)a7;
- (void)mapTextRunsAt:(id)a3;
- (void)mapVerticalTextAt:(id)a3 withState:(id)a4 width:(double)a5 height:(double)a6;
@end

@implementation EMCellTextMapper

- (EMCellTextMapper)initWithEDString:(id)a3 style:(id)a4 parent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EMCellTextMapper;
  v10 = [(CMMapper *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->edString, a3);
    objc_storeStrong((id *)&v11->edStyle, a4);
  }

  return v11;
}

- (void)mapAt:(id)a3 withState:(id)a4 columnWidth:(double)a5 height:(double)a6 spreadLeft:(BOOL)a7
{
  id v44 = a3;
  id v12 = a4;
  if (self->edString)
  {
    edStyle = self->edStyle;
    if (edStyle)
    {
      if ([(EDStyle *)edStyle isAlignmentInfoOverridden])
      {
        v14 = [(EDStyle *)self->edStyle alignmentInfo];
        int v15 = [v14 textRotation];

        if (v15)
        {
          v16 = [(EDStyle *)self->edStyle font];
          [v16 height];
          double v18 = v17 / 20.0;

          if (v18 * 2.6 > a5)
          {
            [(EMCellTextMapper *)self mapVerticalTextAt:v44 withState:v12 width:v18 height:a6];
            goto LABEL_39;
          }
        }
      }
    }
    [(EMCellTextMapper *)self contentWidth];
    if (v19 <= a5)
    {
LABEL_25:
      v35 = [(EDString *)self->edString runs];
      if (v35)
      {
        v36 = [(EDString *)self->edString runs];
        BOOL v37 = [v36 count] != 0;
      }
      else
      {
        BOOL v37 = 0;
      }

      if ([(EDStyle *)self->edStyle isAlignmentInfoOverridden])
      {
        v38 = [(EDStyle *)self->edStyle alignmentInfo];
        if ([v38 isTextWrappedOverridden])
        {
          v39 = [(EDStyle *)self->edStyle alignmentInfo];
          int v40 = [v39 isTextWrapped];

          if (v40)
          {
            v41 = [(EDString *)self->edString string];
            v42 = +[CMTextFilter convertLineBreaksToParagraphBreaks:v41];

            if (!v37)
            {
LABEL_32:
              if (v42 && [v42 length])
              {
                v43 = +[OIXMLTextNode textNodeWithStringValue:v42];
                [v44 addChild:v43];
              }
              goto LABEL_38;
            }
LABEL_37:
            [(EMCellTextMapper *)self mapTextRunsAt:v44];
LABEL_38:

            goto LABEL_39;
          }
        }
        else
        {
        }
      }
      v42 = [(EDString *)self->edString string];
      if (!v37) {
        goto LABEL_32;
      }
      goto LABEL_37;
    }
    if ([(EDStyle *)self->edStyle isAlignmentInfoOverridden])
    {
      v20 = [(EDStyle *)self->edStyle alignmentInfo];
      if ([v20 isTextWrappedOverridden])
      {
        int v21 = [v20 isTextWrapped];
        if (a7)
        {
LABEL_15:

          if (!v21) {
            goto LABEL_25;
          }
          goto LABEL_19;
        }
      }
      else
      {
        int v21 = 0;
        if (a7) {
          goto LABEL_15;
        }
      }
      if ([v20 horizontalAlignment] == 3) {
        goto LABEL_15;
      }
    }
    else if (a7)
    {
      goto LABEL_25;
    }
LABEL_19:
    v22 = objc_alloc_init(CMStyle);
    v23 = [[CMStringProperty alloc] initWithString:0x26EC07AF8];
    [(CMStyle *)v22 addProperty:v23 forKey:0x26EC060D8];
    if ([(EDStyle *)self->edStyle isAlignmentInfoOverridden])
    {
      v24 = [(EDStyle *)self->edStyle alignmentInfo];
      int v25 = [v24 isIndentOverridden];

      if (v25)
      {
        v26 = [(EDStyle *)self->edStyle font];
        [v26 height];
        double v28 = v27;
        v29 = [(EDStyle *)self->edStyle alignmentInfo];
        a5 = a5 - (v28 / 20.0 * (double)(int)[v29 indent] + 1.0);
      }
    }
    v30 = [[CMLengthProperty alloc] initWithNumber:a5];
    [(CMStyle *)v22 addProperty:v30 forKey:@"width"];
    if (a6 > 0.0)
    {
      v31 = [[CMLengthProperty alloc] initWithNumber:a6];
      [(CMStyle *)v22 addProperty:v31 forKey:@"height"];
    }
    v32 = +[OIXMLElement elementWithType:3];
    [v44 addChild:v32];
    v33 = [(CMStyle *)v22 cssStyleString];
    v34 = +[OIXMLAttribute attributeWithName:@"style" stringValue:v33];
    [v32 addAttribute:v34];

    id v44 = v32;
    goto LABEL_25;
  }
LABEL_39:
}

- (double)contentWidth
{
  v3 = objc_opt_class();
  v4 = [(EDString *)self->edString string];
  [v3 contentWidthForString:v4 style:self->edStyle];
  double v6 = v5;

  return v6;
}

- (void)mapTextRunsAt:(id)a3
{
  id v28 = a3;
  edStyle = self->edStyle;
  if (!edStyle) {
    goto LABEL_5;
  }
  if ([(EDStyle *)edStyle isAlignmentInfoOverridden])
  {
    v4 = [(EDStyle *)self->edStyle alignmentInfo];
    if ([v4 isTextWrappedOverridden])
    {
      double v5 = [(EDStyle *)self->edStyle alignmentInfo];
      int v6 = [v5 isTextWrapped];

      if (v6)
      {
LABEL_5:
        v7 = [(EDString *)self->edString string];
        id v8 = +[CMTextFilter convertLineBreaksToParagraphBreaks:v7];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v8 = [(EDString *)self->edString string];
LABEL_8:
  id v9 = [(EDString *)self->edString runs];
  uint64_t v10 = [v9 count];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = 0;
    uint64_t v13 = v10 - 1;
    while (1)
    {
      v14 = [v9 objectAtIndex:v12];
      uint64_t v15 = [v14 charIndex];
      unint64_t v16 = v15;
      if (!v12 && v15)
      {
        double v17 = +[OIXMLElement elementWithType:16];
        [v28 addChild:v17];
        double v18 = objc_msgSend(v8, "substringWithRange:", 0, v16);
        double v19 = +[OIXMLTextNode textNodeWithStringValue:v18];
        [v17 addChild:v19];
      }
      if (v13 == v12)
      {
        uint64_t v20 = [v8 length];
      }
      else
      {
        int v21 = [v9 objectAtIndex:v12 + 1];
        uint64_t v20 = [v21 charIndex];
      }
      if (v16 >= [v8 length]) {
        break;
      }
      v22 = +[OIXMLElement elementWithType:16];
      [v28 addChild:v22];
      v23 = objc_msgSend(v8, "substringWithRange:", v16, v20 - v16);
      v24 = +[OIXMLTextNode textNodeWithStringValue:v23];
      [v22 addChild:v24];

      int v25 = [v14 font];
      if (v25)
      {
        v26 = +[EMCellStyle styleForFont:v25];
        [(CMMapper *)self addAttribute:0x26EBFB938 toNode:v22 value:v26];
      }
      if (v11 == ++v12) {
        goto LABEL_22;
      }
    }
  }
LABEL_22:
}

- (void)mapVerticalTextAt:(id)a3 withState:(id)a4 width:(double)a5 height:(double)a6
{
  id v18 = a3;
  id v8 = [(EDString *)self->edString string];
  id v9 = +[CMTextFilter convertToVericalString:v8];

  uint64_t v10 = objc_alloc_init(CMStyle);
  uint64_t v11 = [[CMStringProperty alloc] initWithString:0x26EC07AF8];
  [(CMStyle *)v10 addProperty:v11 forKey:0x26EC060D8];
  uint64_t v12 = [[CMStringProperty alloc] initWithString:0x26EC06A58];
  [(CMStyle *)v10 addProperty:v12 forKey:@"text-align"];
  uint64_t v13 = [[CMLengthProperty alloc] initWithNumber:9 unit:0.85];
  [(CMStyle *)v10 addProperty:v13 forKey:0x26EC19438];
  if (a6 > 0.0)
  {
    v14 = [[CMLengthProperty alloc] initWithNumber:a6];
    [(CMStyle *)v10 addProperty:v14 forKey:0x26EC07B38];
  }
  uint64_t v15 = +[OIXMLElement elementWithType:3];
  [v18 addChild:v15];
  unint64_t v16 = +[OIXMLTextNode textNodeWithStringValue:v9];
  [v15 addChild:v16];

  double v17 = [(CMStyle *)v10 cssStyleString];
  [(CMMapper *)self addAttribute:0x26EBFB938 toNode:v15 value:v17];
}

+ (double)contentWidthForString:(id)a3 style:(id)a4
{
  id v5 = a3;
  int v6 = [a4 font];
  v7 = [v6 name];
  [v6 height];
  double v9 = v8;
  if ([v6 isBoldOverridden]) {
    uint64_t v10 = [v6 isBold];
  }
  else {
    uint64_t v10 = 0;
  }
  if ([v6 isItalicOverridden]) {
    uint64_t v11 = [v6 isItalic];
  }
  else {
    uint64_t v11 = 0;
  }
  objc_msgSend(v5, "oi_sizeWithFontName:size:bold:italic:", v7, (int)(v9 / 20.0), v10, v11);
  double v13 = v12;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->edStyle, 0);
  objc_storeStrong((id *)&self->edString, 0);
}

@end