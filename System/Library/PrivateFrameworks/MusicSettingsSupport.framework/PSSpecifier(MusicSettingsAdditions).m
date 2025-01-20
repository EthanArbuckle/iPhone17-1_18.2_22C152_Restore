@interface PSSpecifier(MusicSettingsAdditions)
- (char)music_copy;
- (id)_music_specifierGetter;
- (id)music_getValue;
- (uint64_t)music_areDisplayValuesEqual:()MusicSettingsAdditions;
- (void)_music_specifierButtonAction:()MusicSettingsAdditions;
- (void)_music_specifierSetter:()MusicSettingsAdditions;
@end

@implementation PSSpecifier(MusicSettingsAdditions)

- (char)music_copy
{
  v2 = [(id)objc_opt_class() specifierWithSpecifier:a1];
  if (*(void *)&a1[*MEMORY[0x263F5FE10]])
  {
    uint64_t v3 = (int)*MEMORY[0x263F5FE40];
    id WeakRetained = objc_loadWeakRetained((id *)&a1[v3]);
    if (WeakRetained)
    {
      objc_initWeak(&location, WeakRetained);
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __49__PSSpecifier_MusicSettingsAdditions__music_copy__block_invoke;
      v18 = &unk_264CBF5A8;
      objc_copyWeak(&v19, &location);
      v5 = (void *)MEMORY[0x237E0CAA0](&v15);
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, @"__musicTarget", v15, v16, v17, v18);

      objc_storeWeak((id *)&v2[v3], v2);
      uint64_t v6 = (int)*MEMORY[0x263F5FE28];
      v7 = *(const char **)&a1[v6];
      if (v7)
      {
        v8 = NSStringFromSelector(v7);
        [v2 setObject:v8 forKeyedSubscript:@"__musicGetter"];

        *(void *)&v2[v6] = sel__music_specifierGetter;
      }
      uint64_t v9 = (int)*MEMORY[0x263F5FE38];
      v10 = *(const char **)&a1[v9];
      if (v10)
      {
        v11 = NSStringFromSelector(v10);
        [v2 setObject:v11 forKeyedSubscript:@"__musicSetter"];

        *(void *)&v2[v9] = sel__music_specifierSetter_;
      }
      if ([a1 buttonAction])
      {
        v12 = NSStringFromSelector((SEL)[a1 buttonAction]);
        [v2 setObject:v12 forKeyedSubscript:@"__musicButtonAction"];

        [v2 setButtonAction:sel__music_specifierButtonAction_];
      }
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    v13 = objc_msgSend(v2, "music_getValue");
    [v2 setObject:v13 forKeyedSubscript:@"__musicCachedValue"];
  }
  return v2;
}

- (id)music_getValue
{
  id WeakRetained = objc_loadWeakRetained((id *)&a1[*MEMORY[0x263F5FE40]]);
  if (WeakRetained && (uint64_t v3 = *(void *)&a1[*MEMORY[0x263F5FE28]]) != 0)
  {
    v4 = MusicSettingsPerformSelector2(v3, WeakRetained, a1, 0);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_music_specifierButtonAction:()MusicSettingsAdditions
{
  id v10 = a3;
  uint64_t v4 = [a1 objectForKeyedSubscript:@"__musicTarget"];
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = (*(void (**)(uint64_t))(v4 + 16))(v4);
    if (v6)
    {
      v7 = [a1 objectForKeyedSubscript:@"__musicButtonAction"];
      SEL v8 = NSSelectorFromString(v7);
      id v9 = MusicSettingsPerformSelector2((uint64_t)v8, v6, v10, 0);
    }
  }
}

- (void)_music_specifierSetter:()MusicSettingsAdditions
{
  id v10 = a3;
  objc_msgSend(a1, "setObject:forKeyedSubscript:");
  uint64_t v4 = [a1 objectForKeyedSubscript:@"__musicTarget"];
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = (*(void (**)(uint64_t))(v4 + 16))(v4);
    if (v6)
    {
      v7 = [a1 objectForKeyedSubscript:@"__musicSetter"];
      SEL v8 = NSSelectorFromString(v7);
      id v9 = MusicSettingsPerformSelector2((uint64_t)v8, v6, v10, a1);
    }
  }
}

- (id)_music_specifierGetter
{
  uint64_t v2 = [a1 objectForKeyedSubscript:@"__musicTarget"];
  uint64_t v3 = (void *)v2;
  if (v2 && ((*(void (**)(uint64_t))(v2 + 16))(v2), (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    uint64_t v6 = [a1 objectForKeyedSubscript:@"__musicGetter"];
    SEL v7 = NSSelectorFromString(v6);
    SEL v8 = MusicSettingsPerformSelector2((uint64_t)v7, v5, a1, 0);
  }
  else
  {
    SEL v8 = 0;
  }

  return v8;
}

- (uint64_t)music_areDisplayValuesEqual:()MusicSettingsAdditions
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [a1 identifier];
  SEL v7 = [v5 identifier];
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2 object:a1 file:@"MusicSettingsUtilities.m" lineNumber:52 description:@"Can only compare display values for the same specifier identifier"];
  }
  id v9 = [a1 name];
  uint64_t v10 = [v5 name];
  if (v9 == (void *)v10)
  {

LABEL_8:
    if (*(void *)&a1[*MEMORY[0x263F5FE10]])
    {
      uint64_t v16 = [a1 objectForKeyedSubscript:@"__musicCachedValue"];
      uint64_t v17 = [v5 objectForKeyedSubscript:@"__musicCachedValue"];
      if (v16 != (void *)v17 && ![v16 isEqual:v17])
      {
        uint64_t v15 = 0;
        goto LABEL_16;
      }
      uint64_t v18 = *MEMORY[0x263F60140];
      id v19 = [a1 objectForKeyedSubscript:*MEMORY[0x263F60140]];
      v20 = [v5 objectForKeyedSubscript:v18];
      uint64_t v15 = v19 == v20;
    }
    else
    {
      uint64_t v21 = *MEMORY[0x263F600F8];
      v22 = [a1 objectForKeyedSubscript:*MEMORY[0x263F600F8]];
      uint64_t v23 = [v5 objectForKeyedSubscript:v21];
      if (v22 == (void *)v23)
      {
        uint64_t v15 = 1;
        uint64_t v16 = v22;
        goto LABEL_17;
      }
      uint64_t v17 = v23;
      id v19 = [a1 objectForKeyedSubscript:v21];
      v20 = [v5 objectForKeyedSubscript:v21];
      uint64_t v15 = [v19 isEqualToString:v20];
      uint64_t v16 = v22;
    }

LABEL_16:
    v22 = (void *)v17;
LABEL_17:

    goto LABEL_18;
  }
  v11 = (void *)v10;
  v12 = [a1 name];
  v13 = [v5 name];
  int v14 = [v12 isEqualToString:v13];

  if (v14) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v15 = 0;
LABEL_18:

  return v15;
}

@end