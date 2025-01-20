@interface TIWordSearchController
+ (id)sharedWordSearchController;
- (NSMapTable)inputModeToWordSearchMapping;
- (TIWordSearchController)init;
- (id)wordSearchForInputMode:(id)a3;
- (void)reset;
- (void)setInputModeToWordSearchMapping:(id)a3;
- (void)setWordSearch:(id)a3 forInputMode:(id)a4;
@end

@implementation TIWordSearchController

- (void).cxx_destruct
{
}

- (void)setInputModeToWordSearchMapping:(id)a3
{
}

- (NSMapTable)inputModeToWordSearchMapping
{
  return self->_inputModeToWordSearchMapping;
}

- (void)reset
{
  id v2 = [(TIWordSearchController *)self inputModeToWordSearchMapping];
  [v2 removeAllObjects];
}

- (id)wordSearchForInputMode:(id)a3
{
  id v4 = a3;
  v5 = [v4 normalizedIdentifier];
  v6 = [v4 normalizedIdentifier];
  if (![v6 isEqualToString:@"ko_KR"]) {
    goto LABEL_4;
  }
  v7 = [v4 originalIdentifier];
  v8 = TIInputModeGetSWLayout();

  if (v8)
  {
    v6 = [v4 originalIdentifier];
    uint64_t v9 = TIInputModeGetSWLayout();

    v5 = (void *)v9;
LABEL_4:
  }
  if (!v5) {
    goto LABEL_10;
  }
  v10 = [(TIWordSearchController *)self inputModeToWordSearchMapping];
  v11 = [v10 objectForKey:v5];

  if (v11) {
    goto LABEL_11;
  }
  v12 = [v4 normalizedIdentifier];
  v13 = TICanonicalInputModeName();
  v14 = (void *)TIInputManagerClassForInputMode();

  if (([v14 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([v4 normalizedIdentifier],
        v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 hasSuffix:@"HWR"],
        v15,
        v16))
  {
    v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v14, "performSelector:", sel_wordSearchClass)), "initTIWordSearchWithInputMode:", v4);
    v17 = [(TIWordSearchController *)self inputModeToWordSearchMapping];
    [v17 setObject:v11 forKey:v5];
  }
  else
  {
LABEL_10:
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (void)setWordSearch:(id)a3 forInputMode:(id)a4
{
  id v8 = a3;
  v6 = [a4 normalizedIdentifier];
  if (v8 && v6)
  {
    v7 = [(TIWordSearchController *)self inputModeToWordSearchMapping];
    [v7 setObject:v8 forKey:v6];
  }
}

- (TIWordSearchController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIWordSearchController;
  id v2 = [(TIWordSearchController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:16];
    inputModeToWordSearchMapping = v2->_inputModeToWordSearchMapping;
    v2->_inputModeToWordSearchMapping = (NSMapTable *)v3;
  }
  return v2;
}

+ (id)sharedWordSearchController
{
  if (sharedWordSearchController___onceToken != -1) {
    dispatch_once(&sharedWordSearchController___onceToken, &__block_literal_global_17969);
  }
  id v2 = (void *)sharedWordSearchController___sharedInstance;

  return v2;
}

uint64_t __52__TIWordSearchController_sharedWordSearchController__block_invoke()
{
  v0 = objc_alloc_init(TIWordSearchController);
  uint64_t v1 = sharedWordSearchController___sharedInstance;
  sharedWordSearchController___sharedInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end