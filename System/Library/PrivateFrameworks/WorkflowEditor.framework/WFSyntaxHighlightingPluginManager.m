@interface WFSyntaxHighlightingPluginManager
- (BOOL)didChangeLine:(unint64_t)a3 string:(id)a4;
- (UIColor)defaultBackgroundColor;
- (UIColor)defaultForegroundColor;
- (WFSyntaxHighlightingPluginManager)init;
- (id)configurationFilesForAppearance:(unint64_t)a3;
- (id)loadPluginUsingConfigWithModuleName:(id)a3 module:(id)a4;
- (unint64_t)syntaxHighlightingAppearance;
- (unint64_t)syntaxHighlightingType;
- (void)dealloc;
- (void)didAddLineAtIndex:(unint64_t)a3;
- (void)didRemoveLineAtIndex:(unint64_t)a3;
- (void)discardManagedReferencesForLineNumber:(unint64_t)a3;
- (void)highlightAllTokensWithCallback:(id)a3;
- (void)loadColorSchemePlugin;
- (void)loadHighlightingPlugin;
- (void)loadPlugins;
- (void)loadSyntaxPlugin;
- (void)reloadPlugins;
- (void)setSyntaxHighlightingAppearance:(unint64_t)a3;
- (void)setSyntaxHighlightingType:(unint64_t)a3;
- (void)unloadPlugins;
@end

@implementation WFSyntaxHighlightingPluginManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntaxPlugin, 0);
  objc_storeStrong((id *)&self->_highlightingPlugin, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_tokenLines, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (unint64_t)syntaxHighlightingAppearance
{
  return self->_syntaxHighlightingAppearance;
}

- (unint64_t)syntaxHighlightingType
{
  return self->_syntaxHighlightingType;
}

- (UIColor)defaultForegroundColor
{
  v2 = [(JSManagedValue *)self->_colorScheme value];
  v3 = [v2 objectForKeyedSubscript:@"defaultForegroundColor"];

  if ([v3 toBool])
  {
    v4 = [v3 callWithArguments:MEMORY[0x263EFFA68]];
    v5 = [v4 toObject];
  }
  else
  {
    v5 = [MEMORY[0x263F825C8] blackColor];
  }

  return (UIColor *)v5;
}

- (UIColor)defaultBackgroundColor
{
  v2 = [(JSManagedValue *)self->_colorScheme value];
  v3 = [v2 objectForKeyedSubscript:@"defaultBackgroundColor"];

  if ([v3 toBool])
  {
    v4 = [v3 callWithArguments:MEMORY[0x263EFFA68]];
    v5 = [v4 toObject];
  }
  else
  {
    v5 = [MEMORY[0x263F825C8] whiteColor];
  }

  return (UIColor *)v5;
}

- (void)loadSyntaxPlugin
{
  v3 = [(WFSyntaxHighlightingPluginManager *)self loadPluginUsingConfigWithModuleName:@"syntax" module:0];
  if (v3)
  {
    v7 = v3;
    v4 = [MEMORY[0x263F10388] managedValueWithValue:v3];
    syntaxPlugin = self->_syntaxPlugin;
    self->_syntaxPlugin = v4;

    v6 = [(JSContext *)self->_context virtualMachine];
    [v6 addManagedReference:self->_syntaxPlugin withOwner:self];

    v3 = v7;
  }
}

- (void)loadHighlightingPlugin
{
  v3 = [(WFSyntaxHighlightingPluginManager *)self loadPluginUsingConfigWithModuleName:@"highlighting" module:0];
  if (v3)
  {
    v7 = v3;
    v4 = [MEMORY[0x263F10388] managedValueWithValue:v3];
    highlightingPlugin = self->_highlightingPlugin;
    self->_highlightingPlugin = v4;

    v6 = [(JSContext *)self->_context virtualMachine];
    [v6 addManagedReference:self->_highlightingPlugin withOwner:self];

    v3 = v7;
  }
}

- (void)loadColorSchemePlugin
{
  id v7 = [MEMORY[0x263F10390] valueWithNewObjectInContext:self->_context];
  [v7 setObject:&__block_literal_global_225 forKeyedSubscript:@"makeColor"];
  v3 = [(WFSyntaxHighlightingPluginManager *)self loadPluginUsingConfigWithModuleName:@"colorScheme" module:v7];
  if (v3)
  {
    v4 = [MEMORY[0x263F10388] managedValueWithValue:v3];
    colorScheme = self->_colorScheme;
    self->_colorScheme = v4;

    v6 = [(JSContext *)self->_context objectForKeyedSubscript:@"PluginAPI"];
    [v6 setObject:v3 forKeyedSubscript:@"ColorScheme"];
  }
}

id __58__WFSyntaxHighlightingPluginManager_loadColorSchemePlugin__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"alpha"];
  v4 = v3;
  if (!v3) {
    v3 = &unk_26E7C1738;
  }
  [v3 floatValue];
  double v6 = v5 / 255.0;

  id v7 = (void *)MEMORY[0x263F825C8];
  v8 = [v2 objectForKeyedSubscript:@"red"];
  [v8 floatValue];
  double v10 = (float)(v9 / 255.0);
  v11 = [v2 objectForKeyedSubscript:@"green"];
  [v11 floatValue];
  double v13 = (float)(v12 / 255.0);
  v14 = [v2 objectForKeyedSubscript:@"blue"];

  [v14 floatValue];
  v16 = [v7 colorWithRed:v10 green:v13 blue:(float)(v15 / 255.0) alpha:v6];

  return v16;
}

- (id)loadPluginUsingConfigWithModuleName:(id)a3 module:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFSyntaxHighlightingPluginManager *)self configurationFilesForAppearance:[(WFSyntaxHighlightingPluginManager *)self syntaxHighlightingAppearance]];
  float v9 = [v8 objectForKeyedSubscript:v7];
  double v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v9 stringByDeletingPathExtension];
  float v12 = [v9 pathExtension];
  double v13 = [v10 pathForResource:v11 ofType:v12];

  v14 = [NSString stringWithContentsOfFile:v13 encoding:4 error:0];
  float v15 = [NSString stringWithFormat:@"(function(%@) { %@ })", v7, v14];

  v16 = [(JSContext *)self->_context evaluateScript:v15];
  if (!v6)
  {
    id v6 = [MEMORY[0x263F10390] valueWithNewObjectInContext:self->_context];
  }
  v20[0] = v6;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  id v18 = (id)[v16 callWithArguments:v17];

  return v6;
}

- (void)unloadPlugins
{
  v3 = [(JSContext *)self->_context virtualMachine];
  [v3 removeManagedReference:self->_colorScheme withOwner:self];

  v4 = [(JSContext *)self->_context virtualMachine];
  [v4 removeManagedReference:self->_highlightingPlugin withOwner:self];

  id v5 = [(JSContext *)self->_context virtualMachine];
  [v5 removeManagedReference:self->_syntaxPlugin withOwner:self];
}

- (void)reloadPlugins
{
  [(WFSyntaxHighlightingPluginManager *)self unloadPlugins];
  [(WFSyntaxHighlightingPluginManager *)self loadPlugins];
}

- (void)loadPlugins
{
  [(WFSyntaxHighlightingPluginManager *)self loadSyntaxPlugin];
  [(WFSyntaxHighlightingPluginManager *)self loadColorSchemePlugin];
  [(WFSyntaxHighlightingPluginManager *)self loadHighlightingPlugin];
}

- (void)highlightAllTokensWithCallback:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  v4 = (char *)a3;
  id v5 = [(JSManagedValue *)self->_highlightingPlugin value];
  id v6 = [v5 objectForKeyedSubscript:@"tokenAttributes"];

  if ([(NSMutableArray *)self->_tokenLines count])
  {
    unint64_t v7 = 0;
    v8 = v4 + 16;
    unint64_t v9 = 0x263EFF000uLL;
    v22 = self;
    v23 = v4;
    do
    {
      double v10 = -[NSMutableArray objectAtIndex:](self->_tokenLines, "objectAtIndex:", v7, v22);
      if ([v10 count])
      {
        unint64_t v11 = 0;
        do
        {
          float v12 = [v10 objectAtIndex:v11];
          v24[0] = v12;
          [*(id *)(v9 + 2240) arrayWithObjects:v24 count:1];
          unint64_t v13 = v7;
          float v15 = v14 = v9;
          [v6 callWithArguments:v15];
          v16 = v8;
          id v18 = v17 = v6;
          v19 = [v18 toDictionary];

          id v6 = v17;
          v8 = v16;

          unint64_t v9 = v14;
          unint64_t v7 = v13;
          v4 = v23;
          uint64_t v20 = [v12 range];
          (*((void (**)(char *, unint64_t, uint64_t, uint64_t, void *))v4 + 2))(v4, v7, v20, v21, v19);

          ++v11;
        }
        while (v11 < [v10 count]);
      }
      ++v7;

      self = v22;
    }
    while (v7 < [(NSMutableArray *)v22->_tokenLines count]);
  }
  *(_OWORD *)&self->_minimumChangedLine = xmmword_234B79600;
}

- (void)discardManagedReferencesForLineNumber:(unint64_t)a3
{
  id v7 = [(NSMutableArray *)self->_tokenLines objectAtIndex:a3];
  if ([v7 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [v7 objectAtIndex:v4];
      id v6 = [(JSContext *)self->_context virtualMachine];
      [v6 removeManagedReference:v5 withOwner:self];

      ++v4;
    }
    while (v4 < [v7 count]);
  }
}

- (BOOL)didChangeLine:(unint64_t)a3 string:(id)a4
{
  v32[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (self->_minimumChangedLine > a3) {
    self->_minimumChangedLine = a3;
  }
  if (self->_maxChangedLine < a3) {
    self->_maxChangedLine = a3;
  }
  id v7 = 0;
  unint64_t v8 = a3 - 1;
  while ((v8 & 0x8000000000000000) == 0)
  {
    unint64_t v9 = [(NSMutableArray *)self->_tokenLines objectAtIndex:v8];

    uint64_t v10 = [v9 lastObject];
    --v8;
    id v7 = v9;
    if (v10)
    {
      unint64_t v11 = (void *)v10;
      goto LABEL_10;
    }
  }
  unint64_t v11 = [MEMORY[0x263EFF9D0] null];
  unint64_t v9 = v7;
LABEL_10:
  float v12 = [(JSManagedValue *)self->_syntaxPlugin value];
  v31 = [v12 objectForKeyedSubscript:@"nextToken"];

  unint64_t v13 = [MEMORY[0x263EFF980] array];
  uint64_t v14 = 0;
  for (i = 0; ; unint64_t v11 = i)
  {
    v32[0] = v6;
    v16 = [NSNumber numberWithInt:v14];
    v32[1] = v16;
    v32[2] = v11;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
    id v18 = [v31 callWithArguments:v17];
    v19 = [v18 toObject];

    if (!v19) {
      break;
    }
    uint64_t v20 = [v19 range];
    v22 = objc_msgSend(v6, "substringWithRange:", v20, v21);
    [v19 setString:v22];

    [v13 addObject:v19];
    v23 = [(JSContext *)self->_context virtualMachine];
    [v23 addManagedReference:v19 withOwner:self];

    LODWORD(v23) = [v19 start];
    uint64_t v14 = [v19 length] + v23;
    id i = v19;
  }
  v24 = [(NSMutableArray *)self->_tokenLines objectAtIndex:v30];
  v25 = [v24 lastObject];
  [(WFSyntaxHighlightingPluginManager *)self discardManagedReferencesForLineNumber:v30];
  [(NSMutableArray *)self->_tokenLines setObject:v13 atIndexedSubscript:v30];
  if (v11)
  {
    v26 = [MEMORY[0x263EFF9D0] null];
    if (v11 == v26)
    {
      char v28 = 0;
    }
    else if (!v25 || (int v27 = [v11 overflows], v27 == objc_msgSend(v25, "overflows")))
    {
      char v28 = [v11 overflows];
    }
    else
    {
      char v28 = 1;
    }
  }
  else
  {
    char v28 = 0;
  }

  return v28;
}

- (void)didRemoveLineAtIndex:(unint64_t)a3
{
  -[WFSyntaxHighlightingPluginManager discardManagedReferencesForLineNumber:](self, "discardManagedReferencesForLineNumber:");
  tokenLines = self->_tokenLines;
  [(NSMutableArray *)tokenLines removeObjectAtIndex:a3];
}

- (void)didAddLineAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableArray *)self->_tokenLines count];
  tokenLines = self->_tokenLines;
  id v7 = [MEMORY[0x263EFF980] array];
  if (v5 <= a3) {
    [(NSMutableArray *)tokenLines addObject:v7];
  }
  else {
    [(NSMutableArray *)tokenLines insertObject:v7 atIndex:a3];
  }
}

- (void)setSyntaxHighlightingAppearance:(unint64_t)a3
{
  if (self->_syntaxHighlightingAppearance != a3)
  {
    self->_syntaxHighlightingAppearance = a3;
    [(WFSyntaxHighlightingPluginManager *)self reloadPlugins];
  }
}

- (void)setSyntaxHighlightingType:(unint64_t)a3
{
  if (self->_syntaxHighlightingType != a3)
  {
    self->_syntaxHighlightingType = a3;
    [(WFSyntaxHighlightingPluginManager *)self reloadPlugins];
  }
}

- (void)dealloc
{
  [(WFSyntaxHighlightingPluginManager *)self unloadPlugins];
  if ([(NSMutableArray *)self->_tokenLines count])
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = [(NSMutableArray *)self->_tokenLines objectAtIndex:v3];
      if ([v4 count])
      {
        unint64_t v5 = 0;
        do
        {
          id v6 = [v4 objectAtIndex:v5];
          id v7 = [(JSContext *)self->_context virtualMachine];
          [v7 removeManagedReference:v6 withOwner:self];

          ++v5;
        }
        while (v5 < [v4 count]);
      }

      ++v3;
    }
    while (v3 < [(NSMutableArray *)self->_tokenLines count]);
  }
  v8.receiver = self;
  v8.super_class = (Class)WFSyntaxHighlightingPluginManager;
  [(WFSyntaxHighlightingPluginManager *)&v8 dealloc];
}

- (WFSyntaxHighlightingPluginManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)WFSyntaxHighlightingPluginManager;
  id v2 = [(WFSyntaxHighlightingPluginManager *)&v16 init];
  unint64_t v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_syntaxHighlightingType = xmmword_234B72B40;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    tokenLines = v3->_tokenLines;
    v3->_tokenLines = (NSMutableArray *)v4;

    v3->_minimumChangedLine = -1;
    id v6 = objc_alloc(MEMORY[0x263F10378]);
    id v7 = objc_alloc_init(MEMORY[0x263F10398]);
    uint64_t v8 = [v6 initWithVirtualMachine:v7];
    context = v3->_context;
    v3->_context = (JSContext *)v8;

    [(JSContext *)v3->_context setObject:v3 forKeyedSubscript:@"PluginAPI"];
    uint64_t v10 = objc_opt_class();
    unint64_t v11 = [(JSContext *)v3->_context objectForKeyedSubscript:@"PluginAPI"];
    [v11 setObject:v10 forKeyedSubscript:@"Token"];

    float v12 = [MEMORY[0x263F10390] valueWithNewObjectInContext:v3->_context];
    [v12 setObject:*MEMORY[0x263F81500] forKeyedSubscript:@"color"];
    unint64_t v13 = [(JSContext *)v3->_context objectForKeyedSubscript:@"PluginAPI"];
    [v13 setObject:v12 forKeyedSubscript:@"AttributeNames"];

    [(JSContext *)v3->_context setExceptionHandler:&__block_literal_global_2697];
    [(JSContext *)v3->_context setObject:&__block_literal_global_203 forKeyedSubscript:@"log"];
    [(WFSyntaxHighlightingPluginManager *)v3 loadPlugins];
    uint64_t v14 = v3;
  }
  return v3;
}

void __41__WFSyntaxHighlightingPluginManager_init__block_invoke_200(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  unint64_t v3 = getWFGeneralLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    unint64_t v5 = "-[WFSyntaxHighlightingPluginManager init]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_impl(&dword_23490C000, v3, OS_LOG_TYPE_INFO, "%s Log from syntax highlighting JSContext: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

void __41__WFSyntaxHighlightingPluginManager_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = getWFGeneralLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315394;
    __int16 v6 = "-[WFSyntaxHighlightingPluginManager init]_block_invoke";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_23490C000, v4, OS_LOG_TYPE_FAULT, "%s Exception from syntax highlighting JSContext: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)configurationFilesForAppearance:(unint64_t)a3
{
  if (a3 == 1) {
    return &unk_26E7C1828;
  }
  else {
    return &unk_26E7C1850;
  }
}

@end