@interface WAAQIViewStyler
+ (id)shadowColor;
+ (id)textColorWithLightLabel:(BOOL)a3;
- (id)stringWithLogoImageFromText:(id)a3 attribution:(id)a4 attr:(id)a5;
- (id)styledAQICategoryText:(id)a3 mode:(id)a4;
- (id)styledAQILocalizedIndexText:(id)a3 mode:(id)a4;
- (id)styledAQIMetadataCitationText:(id)a3 attribution:(id)a4 shouldInsertGlyph:(BOOL)a5;
- (id)styledAQIMetadataGradeText:(id)a3;
- (id)styledAQIMetadataRecommendationText:(id)a3;
- (id)styledAQIMetadataSourceText:(id)a3;
- (id)styledAQIText:(id)a3 mode:(id)a4;
- (id)styledDashWithLabelColor:(BOOL)a3;
@end

@implementation WAAQIViewStyler

+ (id)textColorWithLightLabel:(BOOL)a3
{
  BOOL v3 = a3;
  if (textColorWithLightLabel__onceToken != -1) {
    dispatch_once(&textColorWithLightLabel__onceToken, &__block_literal_global_19);
  }
  id v4 = (id)textColorWithLightLabel____solid;
  if (v3)
  {
    id v5 = (id)textColorWithLightLabel____light;

    id v4 = v5;
  }
  return v4;
}

uint64_t __43__WAAQIViewStyler_textColorWithLightLabel___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.600000024];
  v1 = (void *)textColorWithLightLabel____light;
  textColorWithLightLabel____light = v0;

  uint64_t v2 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
  uint64_t v3 = textColorWithLightLabel____solid;
  textColorWithLightLabel____solid = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

+ (id)shadowColor
{
  if (shadowColor_onceToken != -1) {
    dispatch_once(&shadowColor_onceToken, &__block_literal_global_2_0);
  }
  uint64_t v2 = (void *)shadowColor___shadowColor;
  return v2;
}

uint64_t __30__WAAQIViewStyler_shadowColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.1];
  uint64_t v1 = shadowColor___shadowColor;
  shadowColor___shadowColor = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)styledAQIText:(id)a3 mode:(id)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  v48[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (var1 == 1)
  {
    switch(var0)
    {
      case 0uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D270]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v14 = *MEMORY[0x263F1C240];
        v37[0] = *MEMORY[0x263F1C238];
        v37[1] = v14;
        v38[0] = v8;
        v38[1] = v9;
        v11 = NSDictionary;
        v12 = v38;
        v13 = v37;
        goto LABEL_15;
      case 1uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v21 = *MEMORY[0x263F1C240];
        v35[0] = *MEMORY[0x263F1C238];
        v35[1] = v21;
        v36[0] = v8;
        v36[1] = v9;
        v11 = NSDictionary;
        v12 = v36;
        v13 = v35;
        goto LABEL_15;
      case 2uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v22 = *MEMORY[0x263F1C240];
        v33[0] = *MEMORY[0x263F1C238];
        v33[1] = v22;
        v34[0] = v8;
        v34[1] = v9;
        v11 = NSDictionary;
        v12 = v34;
        v13 = v33;
        goto LABEL_15;
      case 3uLL:
        v23 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v8 = objc_msgSend(v23, "wa_bold");

        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v24 = *MEMORY[0x263F1C240];
        v31[0] = *MEMORY[0x263F1C238];
        v31[1] = v24;
        v32[0] = v8;
        v32[1] = v9;
        v11 = NSDictionary;
        v12 = v32;
        v13 = v31;
        goto LABEL_15;
      case 4uLL:
        v25 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v8 = objc_msgSend(v25, "wa_bold");

        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v26 = *MEMORY[0x263F1C240];
        v29[0] = *MEMORY[0x263F1C238];
        v29[1] = v26;
        v30[0] = v8;
        v30[1] = v9;
        v11 = NSDictionary;
        v12 = v30;
        v13 = v29;
LABEL_15:
        v27 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:2];
        id v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v27];

        break;
      default:
        break;
    }
  }
  else if (!var1)
  {
    switch(var0)
    {
      case 0uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D270]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v10 = *MEMORY[0x263F1C240];
        v47[0] = *MEMORY[0x263F1C238];
        v47[1] = v10;
        v48[0] = v8;
        v48[1] = v9;
        v11 = NSDictionary;
        v12 = v48;
        v13 = v47;
        goto LABEL_15;
      case 1uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D270]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v15 = *MEMORY[0x263F1C240];
        v45[0] = *MEMORY[0x263F1C238];
        v45[1] = v15;
        v46[0] = v8;
        v46[1] = v9;
        v11 = NSDictionary;
        v12 = v46;
        v13 = v45;
        goto LABEL_15;
      case 2uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D270]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v16 = *MEMORY[0x263F1C240];
        v43[0] = *MEMORY[0x263F1C238];
        v43[1] = v16;
        v44[0] = v8;
        v44[1] = v9;
        v11 = NSDictionary;
        v12 = v44;
        v13 = v43;
        goto LABEL_15;
      case 3uLL:
        v17 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v8 = objc_msgSend(v17, "wa_bold");

        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v18 = *MEMORY[0x263F1C240];
        v41[0] = *MEMORY[0x263F1C238];
        v41[1] = v18;
        v42[0] = v8;
        v42[1] = v9;
        v11 = NSDictionary;
        v12 = v42;
        v13 = v41;
        goto LABEL_15;
      case 4uLL:
        v19 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v8 = objc_msgSend(v19, "wa_bold");

        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v20 = *MEMORY[0x263F1C240];
        v39[0] = *MEMORY[0x263F1C238];
        v39[1] = v20;
        v40[0] = v8;
        v40[1] = v9;
        v11 = NSDictionary;
        v12 = v40;
        v13 = v39;
        goto LABEL_15;
      default:
        break;
    }
  }

  return v4;
}

- (id)styledAQILocalizedIndexText:(id)a3 mode:(id)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  void v44[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (var1 == 1)
  {
    switch(var0)
    {
      case 0uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v14 = *MEMORY[0x263F1C240];
        v33[0] = *MEMORY[0x263F1C238];
        v33[1] = v14;
        v34[0] = v8;
        v34[1] = v9;
        v11 = NSDictionary;
        v12 = v34;
        v13 = v33;
        goto LABEL_15;
      case 1uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D308]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v19 = *MEMORY[0x263F1C240];
        v31[0] = *MEMORY[0x263F1C238];
        v31[1] = v19;
        v32[0] = v8;
        v32[1] = v9;
        v11 = NSDictionary;
        v12 = v32;
        v13 = v31;
        goto LABEL_15;
      case 2uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v20 = *MEMORY[0x263F1C240];
        v29[0] = *MEMORY[0x263F1C238];
        v29[1] = v20;
        v30[0] = v8;
        v30[1] = v9;
        v11 = NSDictionary;
        v12 = v30;
        v13 = v29;
        goto LABEL_15;
      case 3uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v21 = *MEMORY[0x263F1C240];
        v27[0] = *MEMORY[0x263F1C238];
        v27[1] = v21;
        v28[0] = v8;
        v28[1] = v9;
        v11 = NSDictionary;
        v12 = v28;
        v13 = v27;
        goto LABEL_15;
      case 4uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v22 = *MEMORY[0x263F1C240];
        v25[0] = *MEMORY[0x263F1C238];
        v25[1] = v22;
        v26[0] = v8;
        v26[1] = v9;
        v11 = NSDictionary;
        v12 = v26;
        v13 = v25;
LABEL_15:
        v23 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:2];
        id v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v23];

        break;
      default:
        break;
    }
  }
  else if (!var1)
  {
    switch(var0)
    {
      case 0uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v10 = *MEMORY[0x263F1C240];
        v43[0] = *MEMORY[0x263F1C238];
        v43[1] = v10;
        v44[0] = v8;
        v44[1] = v9;
        v11 = NSDictionary;
        v12 = v44;
        v13 = v43;
        goto LABEL_15;
      case 1uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v15 = *MEMORY[0x263F1C240];
        v41[0] = *MEMORY[0x263F1C238];
        v41[1] = v15;
        v42[0] = v8;
        v42[1] = v9;
        v11 = NSDictionary;
        v12 = v42;
        v13 = v41;
        goto LABEL_15;
      case 2uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v16 = *MEMORY[0x263F1C240];
        v39[0] = *MEMORY[0x263F1C238];
        v39[1] = v16;
        v40[0] = v8;
        v40[1] = v9;
        v11 = NSDictionary;
        v12 = v40;
        v13 = v39;
        goto LABEL_15;
      case 3uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v17 = *MEMORY[0x263F1C240];
        v37[0] = *MEMORY[0x263F1C238];
        v37[1] = v17;
        v38[0] = v8;
        v38[1] = v9;
        v11 = NSDictionary;
        v12 = v38;
        v13 = v37;
        goto LABEL_15;
      case 4uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v18 = *MEMORY[0x263F1C240];
        v35[0] = *MEMORY[0x263F1C238];
        v35[1] = v18;
        v36[0] = v8;
        v36[1] = v9;
        v11 = NSDictionary;
        v12 = v36;
        v13 = v35;
        goto LABEL_15;
      default:
        break;
    }
  }

  return v4;
}

- (id)styledAQICategoryText:(id)a3 mode:(id)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  void v44[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (var1 == 1)
  {
    switch(var0)
    {
      case 0uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v14 = *MEMORY[0x263F1C240];
        v33[0] = *MEMORY[0x263F1C238];
        v33[1] = v14;
        v34[0] = v8;
        v34[1] = v9;
        v11 = NSDictionary;
        v12 = v34;
        v13 = v33;
        goto LABEL_15;
      case 1uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D308]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v19 = *MEMORY[0x263F1C240];
        v31[0] = *MEMORY[0x263F1C238];
        v31[1] = v19;
        v32[0] = v8;
        v32[1] = v9;
        v11 = NSDictionary;
        v12 = v32;
        v13 = v31;
        goto LABEL_15;
      case 2uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v20 = *MEMORY[0x263F1C240];
        v29[0] = *MEMORY[0x263F1C238];
        v29[1] = v20;
        v30[0] = v8;
        v30[1] = v9;
        v11 = NSDictionary;
        v12 = v30;
        v13 = v29;
        goto LABEL_15;
      case 3uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v21 = *MEMORY[0x263F1C240];
        v27[0] = *MEMORY[0x263F1C238];
        v27[1] = v21;
        v28[0] = v8;
        v28[1] = v9;
        v11 = NSDictionary;
        v12 = v28;
        v13 = v27;
        goto LABEL_15;
      case 4uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v22 = *MEMORY[0x263F1C240];
        v25[0] = *MEMORY[0x263F1C238];
        v25[1] = v22;
        v26[0] = v8;
        v26[1] = v9;
        v11 = NSDictionary;
        v12 = v26;
        v13 = v25;
LABEL_15:
        v23 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:2];
        id v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v23];

        break;
      default:
        break;
    }
  }
  else if (!var1)
  {
    switch(var0)
    {
      case 0uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v10 = *MEMORY[0x263F1C240];
        v43[0] = *MEMORY[0x263F1C238];
        v43[1] = v10;
        v44[0] = v8;
        v44[1] = v9;
        v11 = NSDictionary;
        v12 = v44;
        v13 = v43;
        goto LABEL_15;
      case 1uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v15 = *MEMORY[0x263F1C240];
        v41[0] = *MEMORY[0x263F1C238];
        v41[1] = v15;
        v42[0] = v8;
        v42[1] = v9;
        v11 = NSDictionary;
        v12 = v42;
        v13 = v41;
        goto LABEL_15;
      case 2uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
        v9 = +[WAAQIViewStyler textColorWithLightLabel:0];
        uint64_t v16 = *MEMORY[0x263F1C240];
        v39[0] = *MEMORY[0x263F1C238];
        v39[1] = v16;
        v40[0] = v8;
        v40[1] = v9;
        v11 = NSDictionary;
        v12 = v40;
        v13 = v39;
        goto LABEL_15;
      case 3uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v17 = *MEMORY[0x263F1C240];
        v37[0] = *MEMORY[0x263F1C238];
        v37[1] = v17;
        v38[0] = v8;
        v38[1] = v9;
        v11 = NSDictionary;
        v12 = v38;
        v13 = v37;
        goto LABEL_15;
      case 4uLL:
        v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
        v9 = [MEMORY[0x263F1C550] labelColor];
        uint64_t v18 = *MEMORY[0x263F1C240];
        v35[0] = *MEMORY[0x263F1C238];
        v35[1] = v18;
        v36[0] = v8;
        v36[1] = v9;
        v11 = NSDictionary;
        v12 = v36;
        v13 = v35;
        goto LABEL_15;
      default:
        break;
    }
  }

  return v4;
}

- (id)styledDashWithLabelColor:(BOOL)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D270]];
  if (a3) {
    [MEMORY[0x263F1C550] labelColor];
  }
  else {
  id v5 = +[WAAQIViewStyler textColorWithLightLabel:0];
  }
  uint64_t v6 = *MEMORY[0x263F1C240];
  v10[0] = *MEMORY[0x263F1C238];
  v10[1] = v6;
  v11[0] = v4;
  v11[1] = v5;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"—" attributes:v7];

  return v8;
}

- (id)styledAQIMetadataSourceText:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F1C658];
  uint64_t v4 = *MEMORY[0x263F1D270];
  id v5 = a3;
  uint64_t v6 = [v3 preferredFontForTextStyle:v4];
  id v7 = +[WAAQIViewStyler textColorWithLightLabel:1];
  uint64_t v8 = *MEMORY[0x263F1C240];
  v12[0] = *MEMORY[0x263F1C238];
  v12[1] = v8;
  v13[0] = v6;
  v13[1] = v7;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v9];

  return v10;
}

- (id)styledAQIMetadataGradeText:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F1C658];
  uint64_t v4 = *MEMORY[0x263F1D2F8];
  id v5 = a3;
  uint64_t v6 = [v3 preferredFontForTextStyle:v4];
  id v7 = +[WAAQIViewStyler textColorWithLightLabel:0];
  id v8 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v8 setLineSpacing:0.0];
  uint64_t v9 = *MEMORY[0x263F1C240];
  v13[0] = *MEMORY[0x263F1C238];
  v13[1] = v9;
  v14[0] = v6;
  v14[1] = v7;
  v13[2] = *MEMORY[0x263F1C268];
  v14[2] = v8;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  v11 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v10];

  return v11;
}

- (id)styledAQIMetadataRecommendationText:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F1C658];
  uint64_t v4 = *MEMORY[0x263F1D260];
  id v5 = a3;
  uint64_t v6 = [v3 preferredFontForTextStyle:v4];
  id v7 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v7 setLineSpacing:0.0];
  id v8 = +[WAAQIViewStyler textColorWithLightLabel:0];
  uint64_t v9 = *MEMORY[0x263F1C240];
  v13[0] = *MEMORY[0x263F1C238];
  v13[1] = v9;
  v14[0] = v6;
  v14[1] = v8;
  v13[2] = *MEMORY[0x263F1C268];
  v14[2] = v7;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  v11 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v10];

  return v11;
}

- (id)styledAQIMetadataCitationText:(id)a3 attribution:(id)a4 shouldInsertGlyph:(BOOL)a5
{
  BOOL v5 = a5;
  v22[3] = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x263F1C658];
  uint64_t v10 = *MEMORY[0x263F1D270];
  id v11 = a3;
  v12 = [v9 preferredFontForTextStyle:v10];
  v13 = +[WAAQIViewStyler textColorWithLightLabel:1];
  id v14 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v14 setLineSpacing:0.0];
  uint64_t v15 = *MEMORY[0x263F1C240];
  v21[0] = *MEMORY[0x263F1C238];
  v21[1] = v15;
  v22[0] = v12;
  v22[1] = v13;
  v21[2] = *MEMORY[0x263F1C268];
  v22[2] = v14;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11 attributes:v16];

  if (v8 && v5)
  {
    id v18 = [(WAAQIViewStyler *)self stringWithLogoImageFromText:v17 attribution:v8 attr:v16];
  }
  else
  {
    id v18 = v17;
  }
  uint64_t v19 = v18;

  return v19;
}

- (id)stringWithLogoImageFromText:(id)a3 attribution:(id)a4 attr:(id)a5
{
  uint64_t v6 = (void *)MEMORY[0x263F1C6C8];
  uint64_t v7 = *MEMORY[0x263F1D270];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v6 configurationWithTextStyle:v7 scale:1];
  id v11 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.forward" withConfiguration:v10];
  v12 = [MEMORY[0x263F1C370] textAttachmentWithImage:v11];
  v13 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v9];

  id v14 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v12];
  uint64_t v15 = (void *)[v14 mutableCopy];

  objc_msgSend(v15, "addAttributes:range:", v8, 0, objc_msgSend(v15, "length"));
  [v13 appendAttributedString:v15];

  return v13;
}

@end