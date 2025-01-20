@interface SUIQueryContextBuilder
+ (id)queryContextWithPerformEntityQueryCommand:(id)a3 view:(id)a4;
+ (id)updateQueryContext:(id)a3 withSearchString:(id)a4 showSuggestions:(BOOL)a5 view:(id)a6;
+ (void)setCommonPropertiesOnQueryContext:(id)a3 withView:(id)a4;
@end

@implementation SUIQueryContextBuilder

+ (id)queryContextWithPerformEntityQueryCommand:(id)a3 view:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = [v6 fromSuggestion];
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = [MEMORY[0x263F78DA8] searchEntityWithCommand:v6 fromSuggestion:v8];
  v10 = objc_opt_new();
  [v10 setQueryKind:9];
  v14[0] = v9;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [v10 setSearchEntities:v11];

  v12 = [v9 displayString];
  [v10 setSearchString:v12];

  [v10 setWhyQuery:8];
  [a1 setCommonPropertiesOnQueryContext:v10 withView:v7];

  return v10;
}

+ (id)updateQueryContext:(id)a3 withSearchString:(id)a4 showSuggestions:(BOOL)a5 view:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  if ((isMacOS() & 1) == 0) {
    [v10 incrementQueryId];
  }
  v13 = [v10 searchEntities];
  uint64_t v14 = [v13 count];

  if (v10) {
    BOOL v15 = v7;
  }
  else {
    BOOL v15 = 0;
  }
  if (!v15 && !v14)
  {
    uint64_t v16 = objc_opt_new();

    id v10 = (id)v16;
  }
  if (!v10) {
    id v10 = (id)objc_opt_new();
  }
  [v10 setSearchString:v12];

  if (v7) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 8;
  }
  if (v7) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 5;
  }
  [v10 setWhyQuery:v17];
  if (v14) {
    uint64_t v19 = 9;
  }
  else {
    uint64_t v19 = v18;
  }
  [v10 setQueryKind:v19];
  [a1 setCommonPropertiesOnQueryContext:v10 withView:v11];

  return v10;
}

+ (void)setCommonPropertiesOnQueryContext:(id)a3 withView:(id)a4
{
  id v5 = a4;
  id v8 = a3;
  objc_msgSend(v8, "setDeviceAuthenticationState:", +[SUIUtilities deviceAuthenticationStateForView:](SUIUtilities, "deviceAuthenticationStateForView:", v5));
  objc_msgSend(v5, "tlks_scale");
  double v7 = v6;

  [v8 setScaleFactor:v7];
}

@end