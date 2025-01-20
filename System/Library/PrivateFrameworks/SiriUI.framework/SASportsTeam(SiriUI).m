@interface SASportsTeam(SiriUI)
- (id)_siriui_sportsValueForStandingsSnippetColumn:()SiriUI;
- (id)siriui_displayName;
- (id)siriui_displayNameAndLocation;
- (id)siriui_localizedQualificationPositionFormatString;
- (id)siriui_localizedSnippetColumnHeader:()SiriUI;
- (id)siriui_textForSnippetColumn:()SiriUI;
- (void)siriui_enumerateEntitiesWithGroupHandler:()SiriUI teamHandler:athleteHandler:;
@end

@implementation SASportsTeam(SiriUI)

- (id)siriui_displayName
{
  v2 = [a1 league];
  if ([v2 displayTeamLocationOverName]) {
    [a1 location];
  }
  else {
  v3 = [a1 name];
  }

  return v3;
}

- (id)siriui_displayNameAndLocation
{
  v2 = [a1 location];
  v3 = [a1 league];
  int v4 = [v3 displayTeamLocationOverName];

  if (v4)
  {
    id v5 = v2;
  }
  else
  {
    id v6 = [NSString alloc];
    v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v8 = [v7 siriUILocalizedStringForKey:@"ROSTER_NAME_AND_LOCATION_FORMAT %@ %@"];
    v9 = [a1 name];
    id v5 = (id)objc_msgSend(v6, "initWithFormat:", v8, v2, v9);
  }
  return v5;
}

- (void)siriui_enumerateEntitiesWithGroupHandler:()SiriUI teamHandler:athleteHandler:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  if (v9) {
    v9[2](v9, a1);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = objc_msgSend(a1, "athletes", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "siriui_enumerateEntitiesWithGroupHandler:teamHandler:athleteHandler:", v8, v9, v10);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (id)siriui_localizedSnippetColumnHeader:()SiriUI
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F65C80]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v6 = v5;
    v7 = @"W";
LABEL_26:
    uint64_t v14 = [v5 siriUILocalizedStringForKey:v7];
    goto LABEL_27;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C40]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v6 = v5;
    v7 = @"L";
    goto LABEL_26;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C70]])
  {
    id v6 = [a1 league];
    id v8 = [v6 sport];
    if ([v8 isEqualToString:*MEMORY[0x263F65CA8]])
    {
      v9 = [v6 identifier];
      char v10 = [v9 isEqualToString:@"mls"];

      if ((v10 & 1) == 0)
      {
        v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
        uint64_t v12 = v11;
        uint64_t v13 = @"D";
LABEL_13:
        uint64_t v14 = [v11 siriUILocalizedStringForKey:v13];

LABEL_27:
        goto LABEL_28;
      }
    }
    else
    {
    }
    v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    uint64_t v12 = v11;
    uint64_t v13 = @"T";
    goto LABEL_13;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C50]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v6 = v5;
    v7 = @"OTL";
    goto LABEL_26;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C68]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v6 = v5;
    v7 = @"PTS";
    goto LABEL_26;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C30]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v6 = v5;
    v7 = @"GB";
    goto LABEL_26;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C60]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v6 = v5;
    v7 = @"GF";
    goto LABEL_26;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C58]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v6 = v5;
    v7 = @"GA";
    goto LABEL_26;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C78]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v6 = v5;
    v7 = @"PCT";
    goto LABEL_26;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C38]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v6 = v5;
    v7 = @"LOC";
    goto LABEL_26;
  }
  uint64_t v14 = 0;
LABEL_28:

  return v14;
}

- (id)_siriui_sportsValueForStandingsSnippetColumn:()SiriUI
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F65C48]])
  {
    uint64_t v5 = [a1 name];
LABEL_23:
    id v6 = (void *)v5;
    goto LABEL_24;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C38]])
  {
    uint64_t v5 = [a1 location];
    goto LABEL_23;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C80]])
  {
    uint64_t v5 = [a1 wins];
    goto LABEL_23;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C40]])
  {
    uint64_t v5 = [a1 losses];
    goto LABEL_23;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C70]])
  {
    uint64_t v5 = [a1 ties];
    goto LABEL_23;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C50]])
  {
    uint64_t v5 = [a1 overtimeLosses];
    goto LABEL_23;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C68]])
  {
    uint64_t v5 = [a1 points];
    goto LABEL_23;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C30]])
  {
    uint64_t v5 = [a1 gamesBehind];
    goto LABEL_23;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C60]])
  {
    uint64_t v5 = [a1 pointsFor];
    goto LABEL_23;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C58]])
  {
    uint64_t v5 = [a1 pointsAgainst];
    goto LABEL_23;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F65C78]])
  {
    uint64_t v5 = [a1 winPercentage];
    goto LABEL_23;
  }
  id v6 = 0;
LABEL_24:

  return v6;
}

- (id)siriui_textForSnippetColumn:()SiriUI
{
  id v4 = a3;
  if (!v4
    || (objc_msgSend(a1, "_siriui_sportsValueForStandingsSnippetColumn:", v4),
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = [a1 statistics];
    v7 = [v6 firstObject];

    id v8 = [v7 metadata];
    v9 = [v8 firstObject];

    uint64_t v5 = [v9 value];
  }
  return v5;
}

- (id)siriui_localizedQualificationPositionFormatString
{
  v1 = [a1 qualificationPosition];
  if ([v1 isEqualToString:*MEMORY[0x263F65C98]])
  {
    v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v3 = v2;
    id v4 = @"QUALIFICATION_POSITION_FORMAT_PLAYOFFS";
LABEL_7:
    uint64_t v5 = [v2 siriUILocalizedStringForKey:v4];

    goto LABEL_8;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F65C90]])
  {
    v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v3 = v2;
    id v4 = @"QUALIFICATION_POSITION_FORMAT_DIVISION";
    goto LABEL_7;
  }
  if ([v1 isEqualToString:*MEMORY[0x263F65C88]])
  {
    v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v3 = v2;
    id v4 = @"QUALIFICATION_POSITION_FORMAT_CONFERENCE";
    goto LABEL_7;
  }
  uint64_t v5 = 0;
LABEL_8:

  return v5;
}

@end