@interface TIKeyboardShortcut
+ (BOOL)isMirroringCandidate:(id)a3;
+ (id)findLocalizationForKeyboardShortcut:(id)a3 withModifiers:(unint64_t)a4 inApplicableOverrides:(id)a5 usingKeyboardType:(unsigned int)a6;
+ (id)localizedKeyboardShortcut:(id)a3 forKeyboardLayout:(id)a4;
+ (id)localizedKeyboardShortcut:(id)a3 forKeyboardLayout:(id)a4 usingKeyboardType:(unsigned int)a5;
+ (id)localizedKeyboardShortcut:(id)a3 forKeyboardLayout:(id)a4 withAttributes:(id)a5;
+ (id)shortcutWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4;
+ (id)shortcutWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4 displayStringOverride:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)displayStringOverride;
- (NSString)keyEquivalent;
- (TIKeyboardShortcut)initWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4;
- (TIKeyboardShortcut)initWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4 displayStringOverride:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)modifierFlags;
- (void)setDisplayStringOverride:(id)a3;
- (void)setKeyEquivalent:(id)a3;
- (void)setModifierFlags:(unint64_t)a3;
@end

@implementation TIKeyboardShortcut

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayStringOverride, 0);

  objc_storeStrong((id *)&self->_keyEquivalent, 0);
}

- (void)setDisplayStringOverride:(id)a3
{
}

- (NSString)displayStringOverride
{
  return self->_displayStringOverride;
}

- (void)setModifierFlags:(unint64_t)a3
{
  self->_modifierFlags = a3;
}

- (unint64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setKeyEquivalent:(id)a3
{
}

- (NSString)keyEquivalent
{
  return self->_keyEquivalent;
}

- (unint64_t)hash
{
  return self->_modifierFlags + [(NSString *)self->_keyEquivalent hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TIKeyboardShortcut *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(TIKeyboardShortcut *)self keyEquivalent];
      v6 = [(TIKeyboardShortcut *)v4 keyEquivalent];
      if ([v5 isEqualToString:v6])
      {
        unint64_t v7 = [(TIKeyboardShortcut *)self modifierFlags];
        BOOL v8 = v7 == [(TIKeyboardShortcut *)v4 modifierFlags];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  v5 = [(TIKeyboardShortcut *)self keyEquivalent];
  v6 = objc_msgSend(v4, "shortcutWithKeyEquivalent:modifierFlags:", v5, -[TIKeyboardShortcut modifierFlags](self, "modifierFlags"));

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (([(TIKeyboardShortcut *)self modifierFlags] & 0x40000) != 0) {
    [v3 appendString:@"⌃ "];
  }
  if (([(TIKeyboardShortcut *)self modifierFlags] & 0x80000) != 0) {
    [v3 appendString:@"⌥ "];
  }
  if (([(TIKeyboardShortcut *)self modifierFlags] & 0x20000) != 0) {
    [v3 appendString:@"⇧ "];
  }
  if (([(TIKeyboardShortcut *)self modifierFlags] & 0x100000) != 0) {
    [v3 appendString:@"⌘ "];
  }
  v4 = [(TIKeyboardShortcut *)self keyEquivalent];
  int v5 = [v4 isEqualToString:@" "];

  if (v5)
  {
    v6 = @"space";
LABEL_17:
    [v3 appendString:v6];
    goto LABEL_18;
  }
  unint64_t v7 = [(TIKeyboardShortcut *)self keyEquivalent];
  int v8 = [v7 isEqualToString:@"\t"];

  if (v8)
  {
    v6 = @"↹";
    goto LABEL_17;
  }
  v9 = [(TIKeyboardShortcut *)self keyEquivalent];
  if ([v9 isEqualToString:@"\n"])
  {

LABEL_16:
    v6 = @"⏎";
    goto LABEL_17;
  }
  v10 = [(TIKeyboardShortcut *)self keyEquivalent];
  int v11 = [v10 isEqualToString:@"\r"];

  if (v11) {
    goto LABEL_16;
  }
  v13 = [(TIKeyboardShortcut *)self keyEquivalent];
  int v14 = [v13 isEqualToString:@"\b"];

  if (v14)
  {
    v6 = @"⌫";
    goto LABEL_17;
  }
  v15 = [(TIKeyboardShortcut *)self keyEquivalent];
  [v3 appendString:v15];

LABEL_18:

  return v3;
}

- (TIKeyboardShortcut)initWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4 displayStringOverride:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardShortcut;
  v10 = [(TIKeyboardShortcut *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    keyEquivalent = v10->_keyEquivalent;
    v10->_keyEquivalent = (NSString *)v11;

    v10->_modifierFlags = a4;
    uint64_t v13 = [v9 copy];
    displayStringOverride = v10->_displayStringOverride;
    v10->_displayStringOverride = (NSString *)v13;
  }
  return v10;
}

- (TIKeyboardShortcut)initWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardShortcut;
  unint64_t v7 = [(TIKeyboardShortcut *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    keyEquivalent = v7->_keyEquivalent;
    v7->_keyEquivalent = (NSString *)v8;

    displayStringOverride = v7->_displayStringOverride;
    v7->_modifierFlags = a4;
    v7->_displayStringOverride = 0;
  }
  return v7;
}

+ (BOOL)isMirroringCandidate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length]) {
    char v5 = objc_msgSend(v4, "_ti_isKeyEquivalentMirroringCandidate");
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)findLocalizationForKeyboardShortcut:(id)a3 withModifiers:(unint64_t)a4 inApplicableOverrides:(id)a5 usingKeyboardType:(unsigned int)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = 0;
  if (v8 && a5)
  {
    v10 = NSNumber;
    id v11 = a5;
    objc_super v12 = [v10 numberWithUnsignedInteger:a4];
    uint64_t v13 = [v11 objectForKeyedSubscript:v8];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = 0;
LABEL_31:

      goto LABEL_32;
    }
    id v14 = v13;
    v15 = [v14 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    v34 = v15;
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    v35 = [v14 objectForKeyedSubscript:@"display"];
    v17 = [v12 stringValue];
    v18 = [v14 objectForKeyedSubscript:v17];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = 0;
LABEL_24:
      if (v16) {
        id v28 = v16;
      }
      else {
        id v28 = v8;
      }
      if (v23) {
        v29 = v23;
      }
      else {
        v29 = v12;
      }
      id v9 = +[TIKeyboardShortcut shortcutWithKeyEquivalent:modifierFlags:displayStringOverride:](TIKeyboardShortcut, "shortcutWithKeyEquivalent:modifierFlags:displayStringOverride:", v28, [v29 unsignedIntegerValue], v35);

      goto LABEL_31;
    }
    id v33 = v18;
    v19 = [v33 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    v31 = v19;
    if (objc_opt_isKindOfClass())
    {
      id v20 = v19;

      id v16 = v20;
    }
    v21 = objc_msgSend(v33, "objectForKeyedSubscript:", @"modifiers", v31);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = v21;
LABEL_17:
      v23 = v22;
LABEL_21:
      v25 = [v33 objectForKeyedSubscript:@"display"];
      v26 = v25;
      if (v25)
      {
        id v27 = v25;

        v35 = v27;
      }

      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v24 = [v21 integerValue];
      if (v24)
      {
        id v22 = [NSNumber numberWithInteger:v24];
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "+[TIKeyboardShortcut findLocalizationForKeyboardShortcut:withModifiers:inApplicableOverrides:usingKeyboardType:]";
        __int16 v38 = 2112;
        id v39 = v8;
        _os_log_fault_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s: malformatted plist, modifier not convertible to number, key %@", buf, 0x16u);
      }
    }
    v23 = 0;
    goto LABEL_21;
  }
LABEL_32:

  return v9;
}

+ (id)localizedKeyboardShortcut:(id)a3 forKeyboardLayout:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = a4;
    id v11 = [v9 objectForKeyedSubscript:@"isRTL"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int v12 = [v11 BOOLValue] ^ 1;
    }
    else {
      int v12 = 1;
    }
    uint64_t v13 = [v9 objectForKeyedSubscript:@"sel"];
    if (shouldOptOutForSelector___onceToken != -1) {
      dispatch_once(&shouldOptOutForSelector___onceToken, &__block_literal_global_13379);
    }
    int v14 = [(id)shouldOptOutForSelector___knownSelectors containsObject:v13];

    int v15 = [v8 modifierFlags];
    id v16 = v8;
    v17 = v16;
    if (((v12 | v14) & 1) == 0 && (v15 & 0x100000) != 0)
    {
      v18 = [v16 keyEquivalent];
      v19 = objc_msgSend(v18, "_ti_keyEquivalentMirroring");

      if (v19)
      {
        uint64_t v20 = objc_msgSend(objc_alloc((Class)a1), "initWithKeyEquivalent:modifierFlags:", v19, objc_msgSend(v17, "modifierFlags"));

        v17 = (void *)v20;
      }
    }
    v21 = [v9 objectForKeyedSubscript:@"keyboardType"];
    id v22 = +[TIKeyboardShortcut localizedKeyboardShortcut:forKeyboardLayout:usingKeyboardType:](TIKeyboardShortcut, "localizedKeyboardShortcut:forKeyboardLayout:usingKeyboardType:", v17, v10, [v21 unsignedIntValue]);
  }
  else
  {
    id v11 = a4;
    id v22 = +[TIKeyboardShortcut localizedKeyboardShortcut:v8 forKeyboardLayout:v11];
  }

  return v22;
}

+ (id)localizedKeyboardShortcut:(id)a3 forKeyboardLayout:(id)a4 usingKeyboardType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = TIGetKeyboardShortcutOverridesForKeyboardLayout(a4, v5 == 2);
  if (![v9 count]
    || (id v10 = objc_opt_class(),
        [v8 keyEquivalent],
        id v11 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "findLocalizationForKeyboardShortcut:withModifiers:inApplicableOverrides:usingKeyboardType:", v11, objc_msgSend(v8, "modifierFlags"), v9, v5), int v12 = objc_claimAutoreleasedReturnValue(), v11, !v12))
  {
    id v13 = objc_alloc((Class)a1);
    int v14 = [v8 keyEquivalent];
    int v12 = objc_msgSend(v13, "initWithKeyEquivalent:modifierFlags:", v14, objc_msgSend(v8, "modifierFlags"));
  }

  return v12;
}

+ (id)localizedKeyboardShortcut:(id)a3 forKeyboardLayout:(id)a4
{
  id v6 = a3;
  unint64_t v7 = TIGetKeyboardShortcutOverridesForKeyboardLayout(a4, 0);
  if (![v7 count]
    || (id v8 = objc_opt_class(),
        [v6 keyEquivalent],
        id v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "findLocalizationForKeyboardShortcut:withModifiers:inApplicableOverrides:usingKeyboardType:", v9, objc_msgSend(v6, "modifierFlags"), v7, 0), id v10 = objc_claimAutoreleasedReturnValue(), v9, !v10))
  {
    id v11 = objc_alloc((Class)a1);
    int v12 = [v6 keyEquivalent];
    id v10 = objc_msgSend(v11, "initWithKeyEquivalent:modifierFlags:", v12, objc_msgSend(v6, "modifierFlags"));
  }

  return v10;
}

+ (id)shortcutWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4 displayStringOverride:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithKeyEquivalent:v9 modifierFlags:a4 displayStringOverride:v8];

  return v10;
}

+ (id)shortcutWithKeyEquivalent:(id)a3 modifierFlags:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = (void *)[objc_alloc((Class)a1) initWithKeyEquivalent:v6 modifierFlags:a4];

  return v7;
}

@end