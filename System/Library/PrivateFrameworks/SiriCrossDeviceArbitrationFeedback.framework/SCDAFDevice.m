@interface SCDAFDevice
+ (BOOL)supportsSecureCoding;
+ (id)arrayDictionaryRepresentation:(id)a3;
+ (id)devicesArrayWithDictionaryRepresentation:(id)a3;
+ (unint64_t)deviceClassFromProductTypeString:(id)a3;
- (NSArray)deviceClass;
- (NSArray)productTypes;
- (NSString)assistantId;
- (NSString)build;
- (NSString)enclosureColor;
- (NSString)idsIdentifier;
- (NSString)locale;
- (NSString)name;
- (NSString)roomName;
- (NSString)speechId;
- (SCDAFDevice)initWithCoder:(id)a3;
- (SCDAFDevice)initWithDictionaryRepresentation:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setAssistantId:(id)a3;
- (void)setBuild:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setEnclosureColor:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setLocale:(id)a3;
- (void)setName:(id)a3;
- (void)setProductTypes:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setSpeechId:(id)a3;
@end

@implementation SCDAFDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_productTypes, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_enclosureColor, 0);
  objc_storeStrong((id *)&self->_build, 0);

  objc_storeStrong((id *)&self->_assistantId, 0);
}

- (void)setDeviceClass:(id)a3
{
}

- (NSArray)deviceClass
{
  return self->_deviceClass;
}

- (void)setProductTypes:(id)a3
{
}

- (NSArray)productTypes
{
  return self->_productTypes;
}

- (void)setSpeechId:(id)a3
{
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setRoomName:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setEnclosureColor:(id)a3
{
}

- (NSString)enclosureColor
{
  return self->_enclosureColor;
}

- (void)setBuild:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (SCDAFDevice)initWithCoder:(id)a3
{
  id v3 = a3;
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"idsIdentifier"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"enclosureColor"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v8 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"productTypes"];
  v9 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"deviceClass"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"assistantId"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"speechId"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"roomName"];

  v13 = objc_alloc_init(SCDAFDevice);
  [(SCDAFDevice *)v13 setIdsIdentifier:v16];
  [(SCDAFDevice *)v13 setBuild:v4];
  [(SCDAFDevice *)v13 setEnclosureColor:v5];
  [(SCDAFDevice *)v13 setLocale:v6];
  [(SCDAFDevice *)v13 setName:v7];
  [(SCDAFDevice *)v13 setProductTypes:v8];
  [(SCDAFDevice *)v13 setDeviceClass:v9];
  [(SCDAFDevice *)v13 setAssistantId:v10];
  [(SCDAFDevice *)v13 setSpeechId:v11];
  [(SCDAFDevice *)v13 setRoomName:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  idsIdentifier = self->_idsIdentifier;
  id v5 = a3;
  [v5 encodeObject:idsIdentifier forKey:@"idsIdentifier"];
  [v5 encodeObject:self->_build forKey:@"build"];
  [v5 encodeObject:self->_enclosureColor forKey:@"enclosureColor"];
  [v5 encodeObject:self->_locale forKey:@"locale"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_productTypes forKey:@"productTypes"];
  [v5 encodeObject:self->_deviceClass forKey:@"deviceClass"];
  [v5 encodeObject:self->_assistantId forKey:@"assistantId"];
  [v5 encodeObject:self->_speechId forKey:@"speechId"];
  [v5 encodeObject:self->_roomName forKey:@"roomName"];
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSString *)self->_idsIdentifier length]) {
    [v3 setObject:self->_idsIdentifier forKeyedSubscript:@"idsIdentifier"];
  }
  if ([(NSString *)self->_build length]) {
    [v3 setObject:self->_build forKeyedSubscript:@"build"];
  }
  if ([(NSString *)self->_enclosureColor length]) {
    [v3 setObject:self->_enclosureColor forKeyedSubscript:@"enclosureColor"];
  }
  if ([(NSString *)self->_locale length]) {
    [v3 setObject:self->_locale forKeyedSubscript:@"locale"];
  }
  if ([(NSString *)self->_name length]) {
    [v3 setObject:self->_name forKeyedSubscript:@"name"];
  }
  if ([(NSArray *)self->_productTypes count]) {
    [v3 setObject:self->_productTypes forKeyedSubscript:@"productTypes"];
  }
  if ([(NSArray *)self->_deviceClass count]) {
    [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  }
  if ([(NSString *)self->_assistantId length]) {
    [v3 setObject:self->_assistantId forKeyedSubscript:@"assistantId"];
  }
  if ([(NSString *)self->_speechId length]) {
    [v3 setObject:self->_speechId forKeyedSubscript:@"speechId"];
  }
  v4 = [(SCDAFDevice *)self roomName];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(SCDAFDevice *)self roomName];
    [v3 setObject:v6 forKeyedSubscript:@"roomName"];
  }
  v7 = [NSDictionary dictionaryWithDictionary:v3];

  return v7;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(SCDAFDevice *)self dictionaryRepresentation];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (SCDAFDevice)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SCDAFDevice;
  uint64_t v5 = [(SCDAFDevice *)&v52 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"idsIdentifier"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length])
    {
      uint64_t v7 = [v6 copy];
      idsIdentifier = v5->_idsIdentifier;
      v5->_idsIdentifier = (NSString *)v7;
    }
    v9 = [v4 objectForKeyedSubscript:@"build"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 length])
    {
      uint64_t v10 = [v9 copy];
      build = v5->_build;
      v5->_build = (NSString *)v10;
    }
    v12 = [v4 objectForKeyedSubscript:@"enclosureColor"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 length])
    {
      uint64_t v13 = [v12 copy];
      enclosureColor = v5->_enclosureColor;
      v5->_enclosureColor = (NSString *)v13;
    }
    v15 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 length])
    {
      uint64_t v16 = [v15 copy];
      locale = v5->_locale;
      v5->_locale = (NSString *)v16;
    }
    v44 = v15;
    v45 = v12;
    v46 = v9;
    v47 = v6;
    v18 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 length])
    {
      uint64_t v19 = [v18 copy];
      name = v5->_name;
      v5->_name = (NSString *)v19;
    }
    v21 = [MEMORY[0x263EFF980] array];
    v22 = [v4 objectForKeyedSubscript:@"productTypes"];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __48__SCDAFDevice_initWithDictionaryRepresentation___block_invoke;
    v50[3] = &unk_2654BA810;
    id v23 = v21;
    id v51 = v23;
    v43 = v22;
    [v22 enumerateObjectsUsingBlock:v50];
    uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithArray:v23];
    productTypes = v5->_productTypes;
    v5->_productTypes = (NSArray *)v24;

    v26 = [MEMORY[0x263EFF980] array];
    v27 = [v4 objectForKeyedSubscript:@"deviceClass"];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __48__SCDAFDevice_initWithDictionaryRepresentation___block_invoke_2;
    v48[3] = &unk_2654BA810;
    id v28 = v26;
    id v49 = v28;
    [v27 enumerateObjectsUsingBlock:v48];
    uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithArray:v28];
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSArray *)v29;

    v31 = [v4 objectForKeyedSubscript:@"speechId"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v31 length])
    {
      uint64_t v32 = [v31 copy];
      speechId = v5->_speechId;
      v5->_speechId = (NSString *)v32;
    }
    v34 = [v4 objectForKeyedSubscript:@"assistantId"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v34 length])
    {
      uint64_t v35 = [v34 copy];
      assistantId = v5->_assistantId;
      v5->_assistantId = (NSString *)v35;
    }
    v37 = [v4 objectForKeyedSubscript:@"roomName"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v39 = [v4 objectForKeyedSubscript:@"roomName"];
      uint64_t v40 = [v39 copy];
      roomName = v5->_roomName;
      v5->_roomName = (NSString *)v40;
    }
  }

  return v5;
}

void __48__SCDAFDevice_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __48__SCDAFDevice_initWithDictionaryRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)arrayDictionaryRepresentation:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__SCDAFDevice_arrayDictionaryRepresentation___block_invoke;
  v9[3] = &unk_2654BA7E8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];

  return v7;
}

uint64_t __45__SCDAFDevice_arrayDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dictionaryRepresentation];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

+ (unint64_t)deviceClassFromProductTypeString:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"iPhone"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 containsString:@"iPad"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 containsString:@"Watch"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 containsString:@"AudioAccessory"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 containsString:@"AppleTV"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 containsString:@"mac"])
  {
    unint64_t v4 = 6;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)devicesArrayWithDictionaryRepresentation:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__SCDAFDevice_devicesArrayWithDictionaryRepresentation___block_invoke;
  v8[3] = &unk_2654BA888;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __56__SCDAFDevice_devicesArrayWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SCDAFDevice alloc] initWithDictionaryRepresentation:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

@end