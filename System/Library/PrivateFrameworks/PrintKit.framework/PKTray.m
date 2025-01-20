@interface PKTray
+ (BOOL)supportsSecureCoding;
+ (id)filter:(id)a3 withBlock:(id)a4;
+ (id)trayWithString:(id)a3 andMediaSource:(id)a4;
+ (id)traysWithMediaSourceSupported:(id)a3 printerInputTrays:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)trayDict;
- (NSString)description;
- (NSString)localizedName;
- (NSString)name;
- (PKTray)initWithCoder:(id)a3;
- (PKTray)initWithString:(id)a3 andMediaSource:(id)a4;
- (PKTray)initWithUserCodableDictionary:(id)a3;
- (id)mediaName;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setTrayDict:(id)a3;
@end

@implementation PKTray

+ (id)traysWithMediaSourceSupported:(id)a3 printerInputTrays:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__PKTray_traysWithMediaSourceSupported_printerInputTrays___block_invoke;
  v13[3] = &unk_2649EF510;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  [v5 enumerateObjectsUsingBlock:v13];
  v10 = v15;
  id v11 = v9;

  return v11;
}

void __58__PKTray_traysWithMediaSourceSupported_printerInputTrays___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    id v6 = &stru_26E251B90;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    id v6 = (__CFString *)[[NSString alloc] initWithData:v5 encoding:4];
  }
  v7 = +[PKTray trayWithString:v6 andMediaSource:v8];
  [*(id *)(a1 + 40) addObject:v7];
}

+ (id)filter:(id)a3 withBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (unsigned int (**)(id, void))a4;
  v7 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v6[2](v6, v12)) {
          objc_msgSend(v7, "addObject:", v12, (void)v14);
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)trayWithString:(id)a3 andMediaSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[PKTray alloc] initWithString:v5 andMediaSource:v6];

  return v7;
}

- (PKTray)initWithString:(id)a3 andMediaSource:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v21 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKTray;
  uint64_t v19 = [(PKTray *)&v23 init];
  if (v19)
  {
    id v17 = v20;
    id v18 = v21;
    v22 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
    id v6 = [v17 componentsSeparatedByString:@";"];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = [*(id *)(*((void *)&v24 + 1) + 8 * i) componentsSeparatedByString:@"="];
          if ([v11 count] == 2)
          {
            uint64_t v12 = [v11 objectAtIndexedSubscript:0];
            v13 = [v12 lowercaseString];

            uint64_t v14 = [v11 objectAtIndexedSubscript:1];
            if (!v13) {
              v13 = @"unreadable-key";
            }
            if (v14) {
              long long v15 = (__CFString *)v14;
            }
            else {
              long long v15 = @"unreadable-value";
            }
            [v22 setObject:v15 forKeyedSubscript:v13];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }

    if (v18) {
      [v22 setObject:v18 forKeyedSubscript:@"media-source"];
    }

    [(PKTray *)v19 setTrayDict:v22];
  }

  return v19;
}

- (void)dealloc
{
  [(PKTray *)self setTrayDict:0];
  v3.receiver = self;
  v3.super_class = (Class)PKTray;
  [(PKTray *)&v3 dealloc];
}

- (NSString)name
{
  v2 = [(PKTray *)self trayDict];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"media-source"];

  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = @"Unknown";
  }

  return (NSString *)v4;
}

- (NSString)localizedName
{
  v2 = [(PKTray *)self name];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.PrintKit"];
  v4 = [v3 localizedStringForKey:v2 value:v2 table:@"InputSlots"];

  return (NSString *)v4;
}

- (id)mediaName
{
  v2 = [(PKTray *)self trayDict];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"medianame"];

  return v3;
}

- (BOOL)isEmpty
{
  v2 = [(PKTray *)self trayDict];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"status"];

  if (v3) {
    BOOL v4 = ([v3 intValue] & 7) == 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  BOOL v4 = [(PKTray *)self trayDict];
  id v5 = [v3 stringWithFormat:@"PKTray<%p> %@", self, v4];

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTray)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKTray;
  id v5 = [(PKTray *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"trayDict"];
    trayDict = v5->_trayDict;
    v5->_trayDict = (NSDictionary *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(PKTray *)self trayDict];
    uint64_t v6 = [v4 trayDict];
    char v7 = [v5 isEqualToDictionary:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (PKTray)initWithUserCodableDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTray;
  id v5 = [(PKTray *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    trayDict = v5->_trayDict;
    v5->_trayDict = (NSDictionary *)v6;
  }
  return v5;
}

- (NSDictionary)trayDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTrayDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end