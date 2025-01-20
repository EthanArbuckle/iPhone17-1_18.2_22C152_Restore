@interface _ICQAlertSpecification
+ (id)alertSpecificationDictionarySampleForLevel:(int64_t)a3;
+ (id)alertSpecificationSampleForLevel:(int64_t)a3;
- (BOOL)disableLockScreenAlert;
- (NSDictionary)serverDict;
- (NSMutableDictionary)linkForButtonIndex;
- (NSString)altLockScreenMessage;
- (NSString)altMessage;
- (NSString)lockScreenMessage;
- (NSString)lockScreenTitle;
- (NSString)message;
- (NSString)title;
- (_ICQAlertSpecification)init;
- (_ICQAlertSpecification)initWithServerDictionary:(id)a3;
- (id)linkForButtonIndex:(int64_t)a3;
- (int64_t)defaultButtonIndex;
- (void)_setLinks:(id)a3 defaultIndex:(unint64_t)a4;
- (void)setAltLockScreenMessage:(id)a3;
- (void)setAltMessage:(id)a3;
- (void)setDefaultButtonIndex:(int64_t)a3;
- (void)setDisableLockScreenAlert:(BOOL)a3;
- (void)setLink:(id)a3 forButtonIndex:(int64_t)a4;
- (void)setLink:(id)a3 forButtonIndex:(int64_t)a4 defaultButton:(BOOL)a5;
- (void)setLinkForButtonIndex:(id)a3;
- (void)setLockScreenMessage:(id)a3;
- (void)setLockScreenTitle:(id)a3;
- (void)setMessage:(id)a3;
- (void)setServerDict:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _ICQAlertSpecification

- (_ICQAlertSpecification)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ICQAlertSpecification;
  v2 = [(_ICQAlertSpecification *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    linkForButtonIndex = v2->_linkForButtonIndex;
    v2->_linkForButtonIndex = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (_ICQAlertSpecification)initWithServerDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(_ICQAlertSpecification *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(_ICQAlertSpecification *)v5 setServerDict:v4];
  }

  return v6;
}

- (id)linkForButtonIndex:(int64_t)a3
{
  id v4 = [(_ICQAlertSpecification *)self linkForButtonIndex];
  v5 = [NSNumber numberWithInteger:a3];
  objc_super v6 = [v4 objectForKey:v5];

  return v6;
}

- (void)setLink:(id)a3 forButtonIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if ((unint64_t)(a4 - 4) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v10 = v6;
    v8 = [(_ICQAlertSpecification *)self linkForButtonIndex];
    v9 = [NSNumber numberWithInteger:a4];
    if (v10) {
      [v8 setObject:v10 forKey:v9];
    }
    else {
      [v8 removeObjectForKey:v9];
    }

    id v7 = v10;
  }
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)setLink:(id)a3 forButtonIndex:(int64_t)a4 defaultButton:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v5) {
    [(_ICQAlertSpecification *)self setDefaultButtonIndex:a4];
  }
  [(_ICQAlertSpecification *)self setLink:v8 forButtonIndex:a4];
}

- (void)_setLinks:(id)a3 defaultIndex:(unint64_t)a4
{
  id v12 = a3;
  uint64_t v6 = [v12 count];
  if (v6 == 1) {
    goto LABEL_7;
  }
  if (v6 == 2)
  {
LABEL_6:
    id v10 = [v12 objectAtIndexedSubscript:1];
    [(_ICQAlertSpecification *)self setLink:v10 forButtonIndex:2 defaultButton:a4 == 1];

LABEL_7:
    v11 = [v12 objectAtIndexedSubscript:0];
    [(_ICQAlertSpecification *)self setLink:v11 forButtonIndex:1 defaultButton:a4 == 0];

    id v8 = v12;
    goto LABEL_8;
  }
  BOOL v7 = v6 == 3;
  id v8 = v12;
  if (v7)
  {
    v9 = [v12 objectAtIndexedSubscript:2];
    [(_ICQAlertSpecification *)self setLink:v9 forButtonIndex:3 defaultButton:a4 == 2];

    goto LABEL_6;
  }
LABEL_8:
}

- (NSDictionary)serverDict
{
  return self->_serverDict;
}

- (void)setServerDict:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_serverDict, a3);
  uint64_t v6 = [v5 objectForKeyedSubscript:@"title"];
  [(_ICQAlertSpecification *)self setTitle:v6];

  BOOL v7 = [v5 objectForKeyedSubscript:@"mesg"];
  [(_ICQAlertSpecification *)self setMessage:v7];

  id v8 = [v5 objectForKeyedSubscript:@"altMesg"];
  [(_ICQAlertSpecification *)self setAltMessage:v8];

  v9 = [v5 objectForKeyedSubscript:@"hideOnLock"];
  v36 = self;
  [(_ICQAlertSpecification *)self setDisableLockScreenAlert:_ICQBooleanForServerObjectDefault(v9, 0)];

  id v10 = [v5 objectForKeyedSubscript:@"actions"];
  v11 = v10;
  v37 = v5;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v5 objectForKeyedSubscript:@"Actions"];
  }
  v13 = v12;

  id v14 = v13;
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v14;
  uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    uint64_t v38 = -1;
    uint64_t v19 = *(void *)v41;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v22 = _ICQLinkForServerMessageParameter(v21);
        if (v22)
        {
          [v15 addObject:v22];
          id v23 = v21;
          v24 = [v23 objectForKeyedSubscript:@"btnDefault"];
          v25 = v24;
          if (v24)
          {
            id v26 = v24;
          }
          else
          {
            id v26 = [v23 objectForKeyedSubscript:@"BtnDefault"];
          }
          v27 = v26;

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v28 = [v27 BOOLValue];

            if ((v28 & 1) == 0) {
              goto LABEL_26;
            }
            goto LABEL_25;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v29 = [v27 isEqualToString:@"0"];

            if (v29) {
              goto LABEL_26;
            }
            goto LABEL_25;
          }
          v30 = [v23 objectForKeyedSubscript:@"btnAction"];
          v31 = v30;
          if (v30)
          {
            id v32 = v30;
          }
          else
          {
            id v32 = [v23 objectForKeyedSubscript:@"BtnAction"];
          }
          v33 = v32;

          if ([v33 isEqualToString:@"CHANGE_STORAGE_PLAN"])
          {

            goto LABEL_25;
          }
          int v34 = [v33 isEqualToString:@"MANAGE_STORAGE"];

          if (v34) {
LABEL_25:
          }
            uint64_t v38 = v18;
LABEL_26:
          ++v18;
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (!v17) {
        goto LABEL_31;
      }
    }
  }
  uint64_t v38 = -1;
LABEL_31:

  v35 = (void *)[v15 copy];
  [(_ICQAlertSpecification *)v36 _setLinks:v35 defaultIndex:v38];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)altMessage
{
  return self->_altMessage;
}

- (void)setAltMessage:(id)a3
{
}

- (NSString)lockScreenTitle
{
  return self->_lockScreenTitle;
}

- (void)setLockScreenTitle:(id)a3
{
}

- (NSString)lockScreenMessage
{
  return self->_lockScreenMessage;
}

- (void)setLockScreenMessage:(id)a3
{
}

- (NSString)altLockScreenMessage
{
  return self->_altLockScreenMessage;
}

- (void)setAltLockScreenMessage:(id)a3
{
}

- (BOOL)disableLockScreenAlert
{
  return self->_disableLockScreenAlert;
}

- (void)setDisableLockScreenAlert:(BOOL)a3
{
  self->_disableLockScreenAlert = a3;
}

- (int64_t)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setDefaultButtonIndex:(int64_t)a3
{
  self->_defaultButtonIndex = a3;
}

- (NSMutableDictionary)linkForButtonIndex
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLinkForButtonIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkForButtonIndex, 0);
  objc_storeStrong((id *)&self->_altLockScreenMessage, 0);
  objc_storeStrong((id *)&self->_lockScreenMessage, 0);
  objc_storeStrong((id *)&self->_lockScreenTitle, 0);
  objc_storeStrong((id *)&self->_altMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

+ (id)alertSpecificationSampleForLevel:(int64_t)a3
{
  if (a3 == 3)
  {
    if (AlertSpecificationSampleForFullLevel_onceToken != -1) {
      dispatch_once(&AlertSpecificationSampleForFullLevel_onceToken, &__block_literal_global_14);
    }
    uint64_t v3 = &AlertSpecificationSampleForFullLevel_sAlertSpecification;
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    if (AlertSpecificationSampleForAlmostFullLevel_onceToken != -1) {
      dispatch_once(&AlertSpecificationSampleForAlmostFullLevel_onceToken, &__block_literal_global_5);
    }
    uint64_t v3 = &AlertSpecificationSampleForAlmostFullLevel_sAlertSpecification;
LABEL_9:
    id v4 = (id)*v3;
    goto LABEL_11;
  }
  id v4 = 0;
LABEL_11:
  return v4;
}

+ (id)alertSpecificationDictionarySampleForLevel:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return &unk_1F2DE06D0;
  }
}

@end