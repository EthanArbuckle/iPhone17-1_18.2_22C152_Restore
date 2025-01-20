@interface SCROBrailleKey
+ (BOOL)supportsSecureCoding;
- (BOOL)getRouterIndex:(int64_t *)a3 token:(int64_t *)a4 location:(int64_t *)a5 appToken:(id *)a6;
- (SCROBrailleKey)init;
- (SCROBrailleKey)initWithCoder:(id)a3;
- (id)description;
- (id)identifier;
- (id)keyMasks;
- (int)displayMode;
- (int)displayToken;
- (void)addKeyMask:(unsigned int)a3;
- (void)addModifierMask:(unsigned int)a3;
- (void)addSpacebarKeyMask;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayMode:(int)a3;
- (void)setDisplayToken:(int)a3;
- (void)setRouterIndex:(int64_t)a3 token:(int64_t)a4 location:(int64_t)a5 appToken:(id)a6;
@end

@implementation SCROBrailleKey

- (void)addSpacebarKeyMask
{
}

- (void)addModifierMask:(unsigned int)a3
{
  if (*MEMORY[0x263F2BAF0] != a3)
  {
    if ((*MEMORY[0x263F2BB08] & a3) != 0) {
      [(SCROBrailleKey *)self addKeyMask:67842];
    }
    if ((*MEMORY[0x263F2BAE8] & a3) != 0) {
      [(SCROBrailleKey *)self addKeyMask:68354];
    }
    if ((*MEMORY[0x263F2BAF8] & a3) != 0) {
      [(SCROBrailleKey *)self addKeyMask:68610];
    }
    if ((*MEMORY[0x263F2BAE0] & a3) != 0) {
      [(SCROBrailleKey *)self addKeyMask:68098];
    }
    if ((*MEMORY[0x263F2BB00] & a3) != 0)
    {
      [(SCROBrailleKey *)self addKeyMask:68866];
    }
  }
}

- (SCROBrailleKey)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCROBrailleKey;
  v2 = [(SCROBrailleKey *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    maskArray = v2->_maskArray;
    v2->_maskArray = v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCROBrailleKey)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SCROBrailleKey;
  v5 = [(SCROBrailleKey *)&v20 init];
  v5->_hasRouterInfo = [v4 decodeBoolForKey:@"_hasRouterInfo"];
  v5->_routerIndex = [v4 decodeIntegerForKey:@"_routerIndex"];
  v5->_routerToken = [v4 decodeIntegerForKey:@"_routerToken"];
  v5->_routerLocation = [v4 decodeIntegerForKey:@"_routerLocation"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = (void *)MEMORY[0x263EFFA08];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v10 = [v8 setWithArray:v9];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_maskArray"];
  uint64_t v12 = [v11 mutableCopy];
  maskArray = v5->_maskArray;
  v5->_maskArray = (NSMutableArray *)v12;

  v14 = (void *)MEMORY[0x263EFFA08];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  v16 = [v14 setWithArray:v15];
  uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_appToken"];
  appToken = v5->_appToken;
  v5->_appToken = (NSSecureCoding *)v17;

  v5->_displayToken = [v4 decodeIntegerForKey:@"_displayToken"];
  v5->_displayMode = [v4 decodeIntegerForKey:@"_displayModeToken"];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeBool:self->_hasRouterInfo forKey:@"_hasRouterInfo"];
  [v8 encodeInteger:self->_routerIndex forKey:@"_routerIndex"];
  [v8 encodeInteger:self->_routerToken forKey:@"_routerToken"];
  [v8 encodeInteger:self->_routerLocation forKey:@"_routerLocation"];
  [v8 encodeInteger:self->_displayToken forKey:@"_displayToken"];
  [v8 encodeInteger:self->_displayMode forKey:@"_displayModeToken"];
  identifier = self->_identifier;
  if (identifier) {
    [v8 encodeObject:identifier forKey:@"_identifier"];
  }
  maskArray = self->_maskArray;
  if (maskArray) {
    [v8 encodeObject:maskArray forKey:@"_maskArray"];
  }
  appToken = self->_appToken;
  v7 = v8;
  if (appToken)
  {
    [v8 encodeObject:appToken forKey:@"_appToken"];
    v7 = v8;
  }
}

- (void)setDisplayToken:(int)a3
{
  self->_displayToken = a3;
}

- (int)displayToken
{
  return self->_displayToken;
}

- (void)setDisplayMode:(int)a3
{
  self->_displayMode = a3;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (id)description
{
  BOOL hasRouterInfo = self->_hasRouterInfo;
  id v4 = NSString;
  uint64_t displayMode = self->_displayMode;
  uint64_t displayToken = self->_displayToken;
  uint64_t v7 = [(SCROBrailleKey *)self identifier];
  id v8 = (void *)v7;
  if (hasRouterInfo) {
    [v4 stringWithFormat:@"display = %ld, uint64_t displayMode = %ld, identifier = %@, routerIndex = %ld, routerToken = %ld, routerLocation = %ld", displayToken, displayMode, v7, self->_routerIndex, self->_routerToken, self->_routerLocation];
  }
  else {
  v9 = [v4 stringWithFormat:@"display = %ld, uint64_t displayMode = %ld, identifier = %@", displayToken, displayMode, v7, v11, v12, v13];
  }

  return v9;
}

- (void)addKeyMask:(unsigned int)a3
{
  maskArray = self->_maskArray;
  v5 = [NSNumber numberWithUnsignedLong:a3];
  [(NSMutableArray *)maskArray addObject:v5];

  identifier = self->_identifier;
  self->_identifier = 0;
}

- (id)keyMasks
{
  return self->_maskArray;
}

- (id)identifier
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  identifier = self->_identifier;
  if (!identifier)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
    v18 = self;
    v5 = [(NSMutableArray *)self->_maskArray sortedArrayUsingSelector:sel_compare_];
    uint64_t v6 = [v5 count];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        uint64_t v19 = v10;
        uint64_t v13 = v10 + 1;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v7);
          }
          v14 = [*(id *)(*((void *)&v20 + 1) + 8 * v12) stringValue];
          [v4 appendString:v14];

          if (v13 + v12 < v6) {
            [v4 appendString:@"."];
          }
          ++v12;
        }
        while (v9 != v12);
        uint64_t v10 = v19 + v9;
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [v4 copy];
    v16 = v18->_identifier;
    v18->_identifier = (NSString *)v15;

    identifier = v18->_identifier;
  }

  return identifier;
}

- (void)setRouterIndex:(int64_t)a3 token:(int64_t)a4 location:(int64_t)a5 appToken:(id)a6
{
  self->_BOOL hasRouterInfo = 1;
  self->_routerIndex = a3;
  self->_routerToken = a4;
  self->_routerLocation = a5;
  objc_storeStrong((id *)&self->_appToken, a6);
}

- (BOOL)getRouterIndex:(int64_t *)a3 token:(int64_t *)a4 location:(int64_t *)a5 appToken:(id *)a6
{
  if (a3) {
    *a3 = self->_routerIndex;
  }
  if (a4) {
    *a4 = self->_routerToken;
  }
  if (a5) {
    *a5 = self->_routerLocation;
  }
  if (a6) {
    *a6 = self->_appToken;
  }
  return self->_hasRouterInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_maskArray, 0);
}

@end