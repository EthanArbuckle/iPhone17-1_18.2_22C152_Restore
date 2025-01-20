@interface PEAdjustmentUtilities
+ (id)adjustmentStyleCastDisplayName:(signed __int16)a3;
+ (id)semanticStyleCastDisplayName:(id)a3;
+ (id)semanticStyleCastForPHAdjustmentStyleCast:(signed __int16)a3;
@end

@implementation PEAdjustmentUtilities

+ (id)adjustmentStyleCastDisplayName:(signed __int16)a3
{
  v4 = [a1 semanticStyleCastForPHAdjustmentStyleCast:a3];
  v5 = [a1 semanticStyleCastDisplayName:v4];

  return v5;
}

+ (id)semanticStyleCastForPHAdjustmentStyleCast:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3 >= 0x10)
  {
    v5 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_217B65000, v5, OS_LOG_TYPE_ERROR, "PEAdjustmentUtilities: semanticStyleCastForPHAdjustmentStyleCast - Unsupported cast %hd", (uint8_t *)v8, 8u);
    }

    v4 = (void **)MEMORY[0x263F5D818];
  }
  else
  {
    v4 = (void **)qword_2642BEAA8[(unsigned __int16)a3];
  }
  v6 = *v4;
  return v6;
}

+ (id)semanticStyleCastDisplayName:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F5D818]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_ORIGINAL";
LABEL_33:
    v5 = PELocalizedString(v4);
    goto LABEL_34;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D820]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_STANDARD";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D830]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_TAN_WARM";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D7C8]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_BLUSH_WARM";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D808]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_NEUTRAL";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D7E0]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_COOL";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D810]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_NO_FILTER";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D840]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_WARM_AUTHENTIC";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D828]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_STARK_BLACK_WHITE";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D7D8]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_COLORFUL";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D7E8]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_DREAMY_HUES";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D838]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_URBAN_COOL";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D7F0]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_EARTHY";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D7D0]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_CLOUD_COVER";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D7F8]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_GOLD_WARM";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F5D800]])
  {
    v4 = @"PHOTOEDIT_STYLE_CAST_LONG_GRAY";
    goto LABEL_33;
  }
  v7 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_217B65000, v7, OS_LOG_TYPE_ERROR, "PEAdjustmentUtilities: semanticStyleCastDisplayName - Unsupported cast %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = 0;
LABEL_34:

  return v5;
}

@end