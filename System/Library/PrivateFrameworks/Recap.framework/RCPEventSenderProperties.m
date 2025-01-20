@interface RCPEventSenderProperties
+ (BOOL)_isMouseSender:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_cachedPropertiesOrCacheIfNeeded:(id)a3 senderID:(unint64_t)a4;
+ (id)_senderWithProperties:(id)a3 senderID:(unint64_t)a4;
+ (id)crownSender;
+ (id)gamepadSender;
+ (id)globalPositionSender;
+ (id)keyboardSender;
+ (id)keyboardSenderForDisplayUUID:(id)a3;
+ (id)mouseSender;
+ (id)naturalInputCollectionSender;
+ (id)pencilDigitizerSender;
+ (id)phoneButtonSender;
+ (id)senderFromIOHIDService:(__IOHIDServiceClient *)a3;
+ (id)senderWithProperties:(id)a3;
+ (id)senderWithProperties:(id)a3 senderID:(unint64_t)a4;
+ (id)supplyMissingStandardProperties:(id)a3 senderID:(unint64_t)a4;
+ (id)touchScreenDigitizerSender;
+ (id)touchScreenDigitizerSenderForDisplayUUID:(id)a3;
+ (id)trackpadSender;
+ (id)tvRemoteSender;
- (BOOL)sendsMousePointerEvents;
- (NSDictionary)properties;
- (RCPEventSenderProperties)initWithCoder:(id)a3;
- (unint64_t)senderID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RCPEventSenderProperties

- (unint64_t)senderID
{
  return self->_senderID;
}

+ (id)touchScreenDigitizerSender
{
  if (touchScreenDigitizerSender_onceToken != -1) {
    dispatch_once(&touchScreenDigitizerSender_onceToken, &__block_literal_global_119);
  }
  v2 = (void *)touchScreenDigitizerSender_sender;
  return v2;
}

- (BOOL)sendsMousePointerEvents
{
  return self->_sendsMousePointerEvents;
}

- (NSDictionary)properties
{
  return self->_properties;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RCPEventSenderProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"properties"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"senderID"];

  v7 = [(id)objc_opt_class() senderWithProperties:v5 senderID:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  properties = self->_properties;
  id v5 = a3;
  [v5 encodeObject:properties forKey:@"properties"];
  [v5 encodeInt64:self->_senderID forKey:@"senderID"];
}

+ (id)_cachedPropertiesOrCacheIfNeeded:(id)a3 senderID:(unint64_t)a4
{
  id v5 = a3;
  if (_cachedPropertiesOrCacheIfNeeded_senderID__onceToken != -1) {
    dispatch_once(&_cachedPropertiesOrCacheIfNeeded_senderID__onceToken, &__block_literal_global_5);
  }
  uint64_t v6 = [(id)_cachedPropertiesOrCacheIfNeeded_senderID__cache objectForKeyedSubscript:v5];
  if (!v6)
  {
    uint64_t v6 = +[RCPEventSenderProperties _senderWithProperties:v5 senderID:a4];
    [(id)_cachedPropertiesOrCacheIfNeeded_senderID__cache setObject:v6 forKeyedSubscript:v5];
  }

  return v6;
}

uint64_t __70__RCPEventSenderProperties__cachedPropertiesOrCacheIfNeeded_senderID___block_invoke()
{
  _cachedPropertiesOrCacheIfNeeded_senderID__cache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

+ (id)supplyMissingStandardProperties:(id)a3 senderID:(unint64_t)a4
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (supplyMissingStandardProperties_senderID__onceToken != -1) {
    dispatch_once(&supplyMissingStandardProperties_senderID__onceToken, &__block_literal_global_8);
  }
  uint64_t v6 = (void *)[(id)supplyMissingStandardProperties_senderID__defaultProperties mutableCopy];
  [v6 addEntriesFromDictionary:v5];
  v7 = [v6 objectForKeyedSubscript:@"PrimaryUsagePage"];

  if (!v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"page"];
    if (v8) {
      [v6 setObject:v8 forKeyedSubscript:@"PrimaryUsagePage"];
    }
  }
  v9 = [v6 objectForKeyedSubscript:@"PrimaryUsage"];

  if (!v9)
  {
    v10 = [v6 objectForKeyedSubscript:@"usage"];
    if (v10) {
      [v6 setObject:v10 forKeyedSubscript:@"PrimaryUsage"];
    }
  }
  v11 = [v6 objectForKeyedSubscript:@"DeviceUsagePairs"];

  if (!v11)
  {
    v12 = [v6 objectForKeyedSubscript:@"usagePairs"];
    if (v12)
    {
      unint64_t v37 = a4;
      id v38 = v5;
      v13 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v14 = [v6 objectForKeyedSubscript:@"PrimaryUsagePage"];
      v36 = v6;
      [v6 objectForKeyedSubscript:@"PrimaryUsage"];
      v49[0] = @"DeviceUsagePage";
      uint64_t v33 = v49[1] = @"DeviceUsage";
      v34 = (void *)v14;
      v50[0] = v14;
      v50[1] = v33;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
      [v13 addObject:v15];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v35 = v12;
      id v16 = v12;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            v22 = [v21 objectForKeyedSubscript:@"page"];
            v23 = [v21 objectForKeyedSubscript:@"usage"];
            v46[0] = @"DeviceUsagePage";
            v46[1] = @"DeviceUsage";
            v47[0] = v22;
            v47[1] = v23;
            v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
            [v13 addObject:v24];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
        }
        while (v18);
      }

      uint64_t v6 = v36;
      [v36 setObject:v13 forKeyedSubscript:@"DeviceUsagePairs"];
      a4 = v37;
      id v5 = v38;
      v25 = v34;
      v12 = v35;
      v26 = (void *)v33;
    }
    else
    {
      v13 = [v6 objectForKeyedSubscript:@"PrimaryUsagePage"];
      uint64_t v27 = [v6 objectForKeyedSubscript:@"PrimaryUsage"];
      v25 = (void *)v27;
      if (!v13 || !v27) {
        goto LABEL_25;
      }
      v43[0] = @"DeviceUsagePage";
      v43[1] = @"DeviceUsage";
      v44[0] = v13;
      v44[1] = v27;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
      v45 = v26;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      [v6 setObject:v28 forKeyedSubscript:@"DeviceUsagePairs"];
    }
LABEL_25:
  }
  v29 = [v6 objectForKeyedSubscript:@"LocationID"];

  if (!v29)
  {
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"recap-bus-%d", supplyMissingStandardProperties_senderID__deviceCount);
    [v6 setObject:v30 forKeyedSubscript:@"LocationID"];

    ++supplyMissingStandardProperties_senderID__deviceCount;
  }
  if (a4)
  {
    v31 = [NSNumber numberWithUnsignedLongLong:a4];
    [v6 setObject:v31 forKeyedSubscript:@"recapSenderID"];
  }
  return v6;
}

void __69__RCPEventSenderProperties_supplyMissingStandardProperties_senderID___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Transport";
  v2[1] = @"Authenticated";
  v3[0] = @"Recap";
  v3[1] = MEMORY[0x1E4F1CC38];
  v2[2] = @"VendorID";
  v2[3] = @"ProductID";
  v3[2] = &unk_1EFF9A860;
  v3[3] = &unk_1EFF9A860;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)supplyMissingStandardProperties_senderID__defaultProperties;
  supplyMissingStandardProperties_senderID__defaultProperties = v0;
}

+ (id)senderFromIOHIDService:(__IOHIDServiceClient *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = IOHIDServiceClientGetRegistryID(a3);
  uint64_t v6 = [v5 unsignedLongLongValue];
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v18 = v6;
  if (senderFromIOHIDService__onceToken != -1) {
    dispatch_once(&senderFromIOHIDService__onceToken, &__block_literal_global_63);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = (id)senderFromIOHIDService__persistentPropertyKeys;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        CFStringRef v13 = *(const __CFString **)(*((void *)&v19 + 1) + 8 * i);
        CFTypeRef v14 = IOHIDServiceClientCopyProperty(a3, v13);
        if (v14)
        {
          v15 = v14;
          [v7 setObject:v14 forKey:v13];
          CFRelease(v15);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v16 = [a1 senderWithProperties:v7 senderID:v18];

  return v16;
}

void __51__RCPEventSenderProperties_senderFromIOHIDService___block_invoke()
{
  uint64_t v0 = (void *)senderFromIOHIDService__persistentPropertyKeys;
  senderFromIOHIDService__persistentPropertyKeys = (uint64_t)&unk_1EFF9ABC0;
}

+ (BOOL)_isMouseSender:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [a3 objectForKey:@"DeviceUsagePairs"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "objectForKeyedSubscript:", @"DeviceUsagePage", (void)v13);
        uint64_t v10 = [v8 objectForKeyedSubscript:@"DeviceUsage"];
        if ([v9 intValue] == 1 && objc_msgSend(v10, "intValue") == 2)
        {

          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

+ (id)_senderWithProperties:(id)a3 senderID:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(RCPEventSenderProperties);
  uint64_t v8 = [v6 copy];
  properties = v7->_properties;
  v7->_properties = (NSDictionary *)v8;

  v7->_senderID = a4;
  LOBYTE(a4) = [a1 _isMouseSender:v6];

  v7->_sendsMousePointerEvents = a4;
  return v7;
}

+ (id)senderWithProperties:(id)a3
{
  return (id)[a1 senderWithProperties:a3 senderID:0];
}

+ (id)senderWithProperties:(id)a3 senderID:(unint64_t)a4
{
  id v6 = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_117];
  v7 = [a1 supplyMissingStandardProperties:v6 senderID:a4];

  uint64_t v8 = [a1 _cachedPropertiesOrCacheIfNeeded:v7 senderID:a4];

  return v8;
}

uint64_t __54__RCPEventSenderProperties_touchScreenDigitizerSender__block_invoke()
{
  touchScreenDigitizerSender_sender = +[RCPEventSenderProperties senderWithProperties:&unk_1EFF9AC08];
  return MEMORY[0x1F41817F8]();
}

+ (id)touchScreenDigitizerSenderForDisplayUUID:(id)a3
{
  id v4 = a3;
  if (touchScreenDigitizerSenderForDisplayUUID__onceToken != -1) {
    dispatch_once(&touchScreenDigitizerSenderForDisplayUUID__onceToken, &__block_literal_global_131);
  }
  uint64_t v5 = [(id)touchScreenDigitizerSenderForDisplayUUID__touchScreenDigitizerSenders objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = [a1 touchScreenDigitizerSender];
    v7 = [v6 properties];
    uint64_t v8 = (void *)[v7 mutableCopy];

    [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"Built-In"];
    [v8 setObject:v4 forKeyedSubscript:@"displayUUID"];
    uint64_t v5 = +[RCPEventSenderProperties senderWithProperties:v8];
    [(id)touchScreenDigitizerSenderForDisplayUUID__touchScreenDigitizerSenders setObject:v5 forKeyedSubscript:v4];
  }
  return v5;
}

uint64_t __69__RCPEventSenderProperties_touchScreenDigitizerSenderForDisplayUUID___block_invoke()
{
  touchScreenDigitizerSenderForDisplayUUID__touchScreenDigitizerSenders = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)pencilDigitizerSender
{
  if (pencilDigitizerSender_onceToken != -1) {
    dispatch_once(&pencilDigitizerSender_onceToken, &__block_literal_global_136);
  }
  v2 = (void *)pencilDigitizerSender_sender;
  return v2;
}

uint64_t __49__RCPEventSenderProperties_pencilDigitizerSender__block_invoke()
{
  pencilDigitizerSender_sender = +[RCPEventSenderProperties senderWithProperties:&unk_1EFF9AC30];
  return MEMORY[0x1F41817F8]();
}

+ (id)mouseSender
{
  if (mouseSender_onceToken != -1) {
    dispatch_once(&mouseSender_onceToken, &__block_literal_global_148);
  }
  v2 = (void *)mouseSender_sender;
  return v2;
}

uint64_t __39__RCPEventSenderProperties_mouseSender__block_invoke()
{
  mouseSender_sender = +[RCPEventSenderProperties senderWithProperties:&unk_1EFF9ACA8];
  return MEMORY[0x1F41817F8]();
}

+ (id)trackpadSender
{
  if (trackpadSender_onceToken != -1) {
    dispatch_once(&trackpadSender_onceToken, &__block_literal_global_182);
  }
  v2 = (void *)trackpadSender_sender;
  return v2;
}

uint64_t __42__RCPEventSenderProperties_trackpadSender__block_invoke()
{
  trackpadSender_sender = +[RCPEventSenderProperties senderWithProperties:&unk_1EFF9AD70];
  return MEMORY[0x1F41817F8]();
}

+ (id)gamepadSender
{
  if (gamepadSender_onceToken != -1) {
    dispatch_once(&gamepadSender_onceToken, &__block_literal_global_238);
  }
  v2 = (void *)gamepadSender_sender;
  return v2;
}

uint64_t __41__RCPEventSenderProperties_gamepadSender__block_invoke()
{
  gamepadSender_sender = +[RCPEventSenderProperties senderWithProperties:&unk_1EFF9AD98];
  return MEMORY[0x1F41817F8]();
}

+ (id)tvRemoteSender
{
  if (tvRemoteSender_onceToken != -1) {
    dispatch_once(&tvRemoteSender_onceToken, &__block_literal_global_246);
  }
  v2 = (void *)tvRemoteSender_sender;
  return v2;
}

void __42__RCPEventSenderProperties_tvRemoteSender__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v3[0] = @"PrimaryUsagePage";
  v3[1] = @"PrimaryUsage";
  v4[0] = &unk_1EFF9A878;
  v4[1] = &unk_1EFF9A9C8;
  v3[2] = @"Authenticated";
  v3[3] = @"Built-In";
  v4[2] = MEMORY[0x1E4F1CC38];
  v4[3] = MEMORY[0x1E4F1CC28];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v1 = +[RCPEventSenderProperties senderWithProperties:v0];
  v2 = (void *)tvRemoteSender_sender;
  tvRemoteSender_sender = v1;
}

+ (id)keyboardSender
{
  if (keyboardSender_onceToken != -1) {
    dispatch_once(&keyboardSender_onceToken, &__block_literal_global_248);
  }
  v2 = (void *)keyboardSender_sender;
  return v2;
}

void __42__RCPEventSenderProperties_keyboardSender__block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"PrimaryUsagePage";
  v3[1] = @"PrimaryUsage";
  v4[0] = &unk_1EFF9A8F0;
  v4[1] = &unk_1EFF9A9E0;
  v3[2] = @"Authenticated";
  v4[2] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v1 = +[RCPEventSenderProperties senderWithProperties:v0];
  v2 = (void *)keyboardSender_sender;
  keyboardSender_sender = v1;
}

+ (id)keyboardSenderForDisplayUUID:(id)a3
{
  id v4 = a3;
  if (keyboardSenderForDisplayUUID__onceToken != -1) {
    dispatch_once(&keyboardSenderForDisplayUUID__onceToken, &__block_literal_global_252);
  }
  uint64_t v5 = [(id)keyboardSenderForDisplayUUID__keyboardSenders objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = [a1 keyboardSender];
    v7 = [v6 properties];
    uint64_t v8 = (void *)[v7 mutableCopy];

    [v8 setObject:v4 forKeyedSubscript:@"displayUUID"];
    uint64_t v5 = +[RCPEventSenderProperties senderWithProperties:v8];
    [(id)keyboardSenderForDisplayUUID__keyboardSenders setObject:v5 forKeyedSubscript:v4];
  }
  return v5;
}

uint64_t __57__RCPEventSenderProperties_keyboardSenderForDisplayUUID___block_invoke()
{
  keyboardSenderForDisplayUUID__keyboardSenders = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)naturalInputCollectionSender
{
  if (naturalInputCollectionSender_onceToken != -1) {
    dispatch_once(&naturalInputCollectionSender_onceToken, &__block_literal_global_254);
  }
  v2 = (void *)naturalInputCollectionSender_sender;
  return v2;
}

uint64_t __56__RCPEventSenderProperties_naturalInputCollectionSender__block_invoke()
{
  naturalInputCollectionSender_sender = +[RCPEventSenderProperties senderWithProperties:&unk_1EFF9ADC0];
  return MEMORY[0x1F41817F8]();
}

+ (id)globalPositionSender
{
  if (globalPositionSender_onceToken != -1) {
    dispatch_once(&globalPositionSender_onceToken, &__block_literal_global_264);
  }
  v2 = (void *)globalPositionSender_sender;
  return v2;
}

uint64_t __48__RCPEventSenderProperties_globalPositionSender__block_invoke()
{
  globalPositionSender_sender = +[RCPEventSenderProperties senderWithProperties:&unk_1EFF9ADE8];
  return MEMORY[0x1F41817F8]();
}

+ (id)crownSender
{
  if (crownSender_onceToken != -1) {
    dispatch_once(&crownSender_onceToken, &__block_literal_global_274);
  }
  v2 = (void *)crownSender_sender;
  return v2;
}

void __39__RCPEventSenderProperties_crownSender__block_invoke()
{
  void v4[4] = *MEMORY[0x1E4F143B8];
  v3[0] = @"PrimaryUsagePage";
  v3[1] = @"PrimaryUsage";
  v4[0] = &unk_1EFF9AA58;
  v4[1] = &unk_1EFF9A8F0;
  v3[2] = @"Authenticated";
  void v3[3] = @"Built-In";
  v4[2] = MEMORY[0x1E4F1CC38];
  v4[3] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v1 = +[RCPEventSenderProperties senderWithProperties:v0];
  v2 = (void *)crownSender_sender;
  crownSender_sender = v1;
}

+ (id)phoneButtonSender
{
  if (phoneButtonSender_onceToken != -1) {
    dispatch_once(&phoneButtonSender_onceToken, &__block_literal_global_278);
  }
  v2 = (void *)phoneButtonSender_sender;
  return v2;
}

void __45__RCPEventSenderProperties_phoneButtonSender__block_invoke()
{
  void v4[4] = *MEMORY[0x1E4F143B8];
  v3[0] = @"PrimaryUsagePage";
  v3[1] = @"PrimaryUsage";
  v4[0] = &unk_1EFF9AA70;
  v4[1] = &unk_1EFF9A8F0;
  v3[2] = @"Authenticated";
  void v3[3] = @"Built-In";
  v4[2] = MEMORY[0x1E4F1CC38];
  v4[3] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v1 = +[RCPEventSenderProperties senderWithProperties:v0];
  v2 = (void *)phoneButtonSender_sender;
  phoneButtonSender_sender = v1;
}

- (void).cxx_destruct
{
}

@end