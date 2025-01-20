@interface VOSScreenreaderMode
+ (NSSet)allModes;
+ (VOSScreenreaderMode)BrailleScreenInput;
+ (VOSScreenreaderMode)Default;
+ (VOSScreenreaderMode)Handwriting;
+ (VOSScreenreaderMode)Invalid;
+ (id)modeWithStringValue:(id)a3;
- (NSString)localizedName;
- (NSString)rawValue;
- (id)_initWithRawValue:(id)a3;
- (id)description;
@end

@implementation VOSScreenreaderMode

- (id)_initWithRawValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VOSScreenreaderMode;
  v6 = [(VOSScreenreaderMode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawValue, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@<%p>: %@", v5, self, self->_rawValue];

  return v6;
}

+ (VOSScreenreaderMode)Default
{
  if (Default_onceToken != -1) {
    dispatch_once(&Default_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)Default__Mode;

  return (VOSScreenreaderMode *)v2;
}

uint64_t __30__VOSScreenreaderMode_Default__block_invoke()
{
  Default__Mode = [[VOSScreenreaderMode alloc] _initWithRawValue:@"Default"];

  return MEMORY[0x270F9A758]();
}

+ (VOSScreenreaderMode)Handwriting
{
  if (Handwriting_onceToken != -1) {
    dispatch_once(&Handwriting_onceToken, &__block_literal_global_274);
  }
  v2 = (void *)Handwriting__Mode;

  return (VOSScreenreaderMode *)v2;
}

uint64_t __34__VOSScreenreaderMode_Handwriting__block_invoke()
{
  Handwriting__Mode = [[VOSScreenreaderMode alloc] _initWithRawValue:@"Handwriting"];

  return MEMORY[0x270F9A758]();
}

+ (VOSScreenreaderMode)BrailleScreenInput
{
  if (BrailleScreenInput_onceToken != -1) {
    dispatch_once(&BrailleScreenInput_onceToken, &__block_literal_global_279);
  }
  v2 = (void *)BrailleScreenInput__Mode;

  return (VOSScreenreaderMode *)v2;
}

uint64_t __41__VOSScreenreaderMode_BrailleScreenInput__block_invoke()
{
  BrailleScreenInput__Mode = [[VOSScreenreaderMode alloc] _initWithRawValue:@"BrailleScreenInput"];

  return MEMORY[0x270F9A758]();
}

+ (VOSScreenreaderMode)Invalid
{
  if (Invalid_onceToken_0 != -1) {
    dispatch_once(&Invalid_onceToken_0, &__block_literal_global_284);
  }
  v2 = (void *)Invalid__Mode;

  return (VOSScreenreaderMode *)v2;
}

uint64_t __30__VOSScreenreaderMode_Invalid__block_invoke()
{
  Invalid__Mode = [[VOSScreenreaderMode alloc] _initWithRawValue:@"Invalid"];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)allModes
{
  if (allModes_onceToken != -1) {
    dispatch_once(&allModes_onceToken, &__block_literal_global_289);
  }
  v2 = (void *)allModes__AllModes;

  return (NSSet *)v2;
}

void __31__VOSScreenreaderMode_allModes__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  id v5 = +[VOSScreenreaderMode Default];
  v1 = +[VOSScreenreaderMode Handwriting];
  v2 = +[VOSScreenreaderMode BrailleScreenInput];
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v5, v1, v2, 0);
  v4 = (void *)allModes__AllModes;
  allModes__AllModes = v3;
}

+ (id)modeWithStringValue:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(a1, "allModes", 0);
  v6 = (id *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (id *)((char *)i + 1))
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(id **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9[1] isEqualToString:v4])
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (NSString)localizedName
{
  v2 = [NSString stringWithFormat:@"VOSScreenReaderMode.%@", self->_rawValue];
  uint64_t v3 = VOSLocString(v2);

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end