@interface MSTrackListCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
+ (id)copyDefaultContext;
- ($3CC19D079FD0B010EE84973AA846B91B)position;
- (BOOL)showContentRating;
- (MSTrackListCellConfiguration)init;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (unint64_t)indexOfLabelForPurchaseAnimation;
- (void)drawBackgroundWithModifiers:(unint64_t)a3;
- (void)reloadImages;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
- (void)setPosition:(id *)a3;
@end

@implementation MSTrackListCellConfiguration

- (MSTrackListCellConfiguration)init
{
  return [(SUMediaItemCellConfiguration *)self initWithStringCount:4 imageCount:0];
}

- (void)setPosition:(id *)a3
{
  p_$277DA038E07E09C73EBFEAB3003DE8A9 position = &self->_position;
  $277DA038E07E09C73EBFEAB3003DE8A9 position = self->_position;
  $3CC19D079FD0B010EE84973AA846B91B v7 = *a3;
  if ((SUPositionEqualToPosition() & 1) == 0)
  {
    long long v6 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&p_position->localIndex = *(_OWORD *)&a3->var0;
    *(_OWORD *)&p_position->globalIndex = v6;
    -[SUCellConfiguration setNeedsDisplay:](self, "setNeedsDisplay:", 1, *(_OWORD *)&v7.var0, *(_OWORD *)&v7.var2, *(_OWORD *)&position.localIndex, *(_OWORD *)&position.globalIndex);
  }
}

+ (id)copyDefaultContext
{
  return objc_alloc_init(MSTrackListCellContext);
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 44.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  char v4 = a4;
  if ((a4 & 2) != 0)
  {
    $3CC19D079FD0B010EE84973AA846B91B v7 = (void *)MEMORY[0x263F1C550];
LABEL_8:
    return (id)objc_msgSend(v7, "grayColor", a3);
  }
  if (a3 == 4)
  {
    if ([(SUCellConfigurationView *)[(SUCellConfiguration *)self view] highlightsOnlyContentView])
    {
      id result = (id)[MEMORY[0x263F1C550] blackColor];
      if (v4) {
        return result;
      }
    }
    else
    {
      id result = (id)[MEMORY[0x263F1C550] whiteColor];
      if (v4) {
        return result;
      }
    }
    v8 = (void *)MEMORY[0x263F1C550];
    goto LABEL_22;
  }
  if (a3 == 3)
  {
    if ([(SUCellConfigurationView *)[(SUCellConfiguration *)self view] highlightsOnlyContentView])
    {
      id result = (id)SUTableCellGetHighlightedTextColor();
      if (v4) {
        return result;
      }
    }
    else
    {
      id result = (id)[MEMORY[0x263F1C550] whiteColor];
      if (v4) {
        return result;
      }
    }
    v8 = (void *)MEMORY[0x263F1C550];
LABEL_22:
    return (id)[v8 blackColor];
  }
  if (a3 - 1 <= 1)
  {
    if ([(SUCellConfigurationView *)[(SUCellConfiguration *)self view] highlightsOnlyContentView])
    {
      id result = (id)[MEMORY[0x263F1C550] grayColor];
      if (v4) {
        return result;
      }
    }
    else
    {
      id result = (id)[MEMORY[0x263F1C550] whiteColor];
      if (v4) {
        return result;
      }
    }
    $3CC19D079FD0B010EE84973AA846B91B v7 = (void *)MEMORY[0x263F1C550];
    goto LABEL_8;
  }
  int v9 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F89710]), "contentRating"), "isExplicitContent");
  int v10 = [(SUCellConfigurationView *)[(SUCellConfiguration *)self view] highlightsOnlyContentView];
  if (v9)
  {
    if (v10)
    {
      id result = (id)SUTableCellGetExplicitColor();
      if (v4) {
        return result;
      }
    }
    else
    {
      id result = (id)[MEMORY[0x263F1C550] whiteColor];
      if (v4) {
        return result;
      }
    }
    return (id)SUTableCellGetExplicitColor();
  }
  else
  {
    if (v10)
    {
      id result = (id)SUTableCellGetCleanColor();
      if (v4) {
        return result;
      }
    }
    else
    {
      id result = (id)[MEMORY[0x263F1C550] whiteColor];
      if (v4) {
        return result;
      }
    }
    return (id)SUTableCellGetCleanColor();
  }
}

- (void)drawBackgroundWithModifiers:(unint64_t)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.899999976, 1.0), "set");
  *(void *)&v6.size.height = *(id *)((char *)&self->super.super.super.super.super._context + (int)*MEMORY[0x263F89708]);
  v6.origin.x = 41.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  UIRectFill(v6);
  v5.receiver = self;
  v5.super_class = (Class)MSTrackListCellConfiguration;
  [(SUCellConfiguration *)&v5 drawBackgroundWithModifiers:a3];
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  if (a3 - 1 < 2)
  {
    objc_super v5 = (void *)MEMORY[0x263F1C658];
    return (id)[v5 systemFontOfSize:14.0];
  }
  else
  {
    if (a3 == 3)
    {
      v3 = (void *)MEMORY[0x263F1C658];
      double v4 = 14.0;
    }
    else
    {
      if (a3 != 4)
      {
        v7.receiver = self;
        v7.super_class = (Class)MSTrackListCellConfiguration;
        return -[SUMediaItemCellConfiguration fontForLabelAtIndex:](&v7, sel_fontForLabelAtIndex_);
      }
      v3 = (void *)MEMORY[0x263F1C658];
      double v4 = 16.0;
    }
    return (id)[v3 boldSystemFontOfSize:v4];
  }
}

- (unint64_t)indexOfLabelForPurchaseAnimation
{
  return 3;
}

- (void)reloadImages
{
  v4.receiver = self;
  v4.super_class = (Class)MSTrackListCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v4 reloadImages];
  uint64_t v3 = (int)*MEMORY[0x263F896E8];

  (*(void **)((char *)&self->super.super.super.super.super.super.isa + v3))[1] = 0;
}

- (void)reloadLayoutInformation
{
  v53.receiver = self;
  v53.super_class = (Class)MSTrackListCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v53 reloadLayoutInformation];
  uint64_t v3 = (int)*MEMORY[0x263F896F8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  objc_super v5 = (void *)v4[4];
  CGRect v6 = (int *)MEMORY[0x263F896F0];
  if (v5)
  {
    objc_msgSend(v5, "_legacy_sizeWithFont:constrainedToSize:", -[MSTrackListCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 4), 41.0, 19.0);
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + *v6);
    *(double *)(v7 + 128) = floor((41.0 - v8) * 0.5);
    *(void *)(v7 + 136) = 0x4026000000000000;
    *(double *)(v7 + 144) = v8;
    *(void *)(v7 + 152) = v9;
    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  int v10 = (void *)v4[1];
  v11 = (int *)MEMORY[0x263F89708];
  if (v10)
  {
    objc_msgSend(v10, "_legacy_sizeWithFont:constrainedToSize:", -[MSTrackListCellConfiguration fontForLabelAtIndex:](self, "fontForLabelAtIndex:", 1), *(double *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F89708]), 17.0);
    uint64_t v12 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + *v6);
    *(void *)(v12 + 48) = v13;
    *(void *)(v12 + 56) = v14;
    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  uint64_t v15 = v4[3];
  if (v15)
  {
    v16 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F89700]);
    id v17 = [(MSTrackListCellConfiguration *)self fontForLabelAtIndex:3];
    uint64_t v18 = *v11;
    objc_msgSend(v16, "sizeForString:font:constrainedToSize:", v15, v17, *(double *)((char *)&self->super.super.super.super.super.super.isa + v18), 18.0);
    double v20 = v19;
    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  else
  {
    double v20 = *MEMORY[0x263F001B0];
    uint64_t v18 = *v11;
  }
  double v21 = *(double *)((char *)&self->super.super.super.super.super.super.isa + v18);
  double v22 = v21 + -5.0;
  if (v4[2])
  {
    uint64_t v23 = *v6;
    double v24 = v21 + -5.0;
    if (v4[1])
    {
      uint64_t v25 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v23);
      double v26 = *(double *)(v25 + 48);
      uint64_t v27 = *(void *)(v25 + 56);
      double v28 = v22 - v26;
      if (v20 + 48.0 + 2.0 < v22 - v26) {
        double v28 = v20 + 48.0 + 2.0;
      }
      *(double *)(v25 + 32) = v28;
      *(void *)(v25 + 40) = 0x4014000000000000;
      double v29 = 5.0;
      double v24 = CGRectGetMinX(*(CGRect *)&v28) + -2.0;
      objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    }
    uint64_t v30 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v23);
    *(_OWORD *)(v30 + 96) = xmmword_23791B1E0;
    *(double *)(v30 + 112) = v24 + -48.0;
    *(void *)(v30 + 120) = 0x4032000000000000;
    if (*v4)
    {
      v54.size.width = *(CGFloat *)(v30 + 16);
      v54.origin.x = v22 - v54.size.width;
      v54.origin.y = *(double *)(v30 + 8) + 25.0;
      *(double *)uint64_t v30 = v22 - v54.size.width;
      *(CGFloat *)(v30 + 8) = v54.origin.y;
      v54.size.height = *(CGFloat *)(v30 + 24);
      double v22 = CGRectGetMinX(v54) + -6.0;
    }
    v31 = (void *)(*(void **)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F896E0]))[1];
    if (v31)
    {
      uint64_t v32 = (int)*MEMORY[0x263F896D8];
      uint64_t v33 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v32);
      [v31 size];
      *(void *)(v33 + 48) = v34;
      *(void *)(v33 + 56) = v35;
      uint64_t v36 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v32);
      v55.size.width = *(CGFloat *)(v36 + 48);
      v55.size.height = *(CGFloat *)(v36 + 56);
      v55.origin.x = v22 - v55.size.width;
      *(double *)(v36 + 32) = v22 - v55.size.width;
      *(void *)(v36 + 40) = 0x4038000000000000;
      v55.origin.y = 24.0;
      double v22 = CGRectGetMinX(v55) + -5.0;
    }
    uint64_t v37 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v23);
    *(_OWORD *)(v37 + 64) = xmmword_23791B1F0;
    *(double *)(v37 + 80) = v22 + -48.0;
    v38 = (void *)(v37 + 88);
  }
  else
  {
    if (*v4)
    {
      v39 = *(double **)((char *)&self->super.super.super.super.super.super.isa + *v6);
      v56.size.width = v39[2];
      v56.origin.x = v22 - v56.size.width;
      v56.origin.y = v39[1] + 17.0;
      double *v39 = v22 - v56.size.width;
      v39[1] = v56.origin.y;
      v56.size.height = v39[3];
      double v22 = CGRectGetMinX(v56) + -6.0;
    }
    v40 = (void *)(*(void **)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F896E0]))[1];
    if (v40)
    {
      uint64_t v41 = (int)*MEMORY[0x263F896D8];
      uint64_t v42 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v41);
      [v40 size];
      *(void *)(v42 + 48) = v43;
      *(void *)(v42 + 56) = v44;
      uint64_t v45 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v41);
      v57.size.width = *(CGFloat *)(v45 + 48);
      v57.size.height = *(CGFloat *)(v45 + 56);
      v57.origin.x = v22 - v57.size.width;
      *(double *)(v45 + 32) = v22 - v57.size.width;
      *(void *)(v45 + 40) = 0x4030000000000000;
      v57.origin.y = 16.0;
      double v22 = CGRectGetMinX(v57) + -5.0;
    }
    uint64_t v46 = *v6;
    if ((*(void **)((char *)&self->super.super.super.super.super.super.isa + v3))[1])
    {
      uint64_t v47 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v46);
      double v48 = *(double *)(v47 + 48);
      uint64_t v49 = *(void *)(v47 + 56);
      double v50 = v22 - v48;
      if (v20 + 48.0 + 2.0 < v22 - v48) {
        double v50 = v20 + 48.0 + 2.0;
      }
      *(double *)(v47 + 32) = v50;
      *(void *)(v47 + 40) = 0x402A000000000000;
      double v51 = 13.0;
      double v22 = CGRectGetMinX(*(CGRect *)&v50) + -2.0;
    }
    uint64_t v52 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v46);
    *(_OWORD *)(v52 + 96) = xmmword_23791B200;
    *(double *)(v52 + 112) = v22 + -48.0;
    v38 = (void *)(v52 + 120);
  }
  void *v38 = 0x4032000000000000;
}

- (void)reloadStrings
{
  v20.receiver = self;
  v20.super_class = (Class)MSTrackListCellConfiguration;
  [(SUMediaItemCellConfiguration *)&v20 reloadStrings];
  uint64_t v3 = (int)*MEMORY[0x263F89710];
  objc_super v4 = (void *)[*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) title];
  uint64_t v5 = (int)*MEMORY[0x263F896F8];

  id v6 = (id)[v4 length];
  if (v6) {
    id v6 = v4;
  }
  (*(void **)((char *)&self->super.super.super.super.super.super.isa + v5))[3] = v6;
  if (![*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F89700]) showSubtitle])
  {
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) itemType];
  if (v7 == 11) {
    goto LABEL_7;
  }
  if (v7 == 1009)
  {
    int v10 = (void *)[*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) humanReadableDescription];
LABEL_11:
    id v8 = v10;
    goto LABEL_12;
  }
  if (v7 != 1007)
  {
    int v10 = (void *)[*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) artistName];
    goto LABEL_11;
  }
LABEL_7:
  id v8 = (id)[*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) copyReleaseDateStringWithStyle:3];
LABEL_12:
  uint64_t v9 = v8;
LABEL_13:

  id v11 = (id)[v9 length];
  if (v11) {
    id v11 = v9;
  }
  (*(void **)((char *)&self->super.super.super.super.super.super.isa + v5))[2] = v11;

  uint64_t v12 = (void *)[*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) defaultStoreOffer];
  uint64_t v13 = v12;
  if (v12)
  {
    if (objc_msgSend((id)objc_msgSend(v12, "offerMedia"), "fullDurationInMilliseconds") < 1)
    {
      uint64_t v13 = 0;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v13, "offerMedia"), "fullDurationInMilliseconds");
      uint64_t v14 = (void *)SUCopyProgressStringForSeconds();
      uint64_t v13 = (void *)[NSString stringWithFormat:@"(%@)", v14];
    }
  }

  id v15 = (id)[v13 length];
  if (v15) {
    id v15 = v13;
  }
  (*(void **)((char *)&self->super.super.super.super.super.super.isa + v5))[1] = v15;
  v16 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (v16)
  {
    unint64_t v17 = [v16 integerValueForProperty:@"track-number"];
    if (!v17) {
      unint64_t v17 = self->_position.localIndex + 1;
    }
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v17);
  }
  else
  {
    uint64_t v18 = 0;
  }

  id v19 = (id)[v18 length];
  if (v19) {
    id v19 = v18;
  }
  (*(void **)((char *)&self->super.super.super.super.super.super.isa + v5))[4] = v19;
}

- (BOOL)showContentRating
{
  v5.receiver = self;
  v5.super_class = (Class)MSTrackListCellConfiguration;
  unsigned int v3 = [(SUMediaItemCellConfiguration *)&v5 showContentRating];
  if (v3) {
    LOBYTE(v3) = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F89700]) shouldHideContentRating] ^ 1;
  }
  return v3;
}

- ($3CC19D079FD0B010EE84973AA846B91B)position
{
  long long v3 = *(_OWORD *)&self[4].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

@end