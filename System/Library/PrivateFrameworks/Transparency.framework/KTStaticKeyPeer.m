@interface KTStaticKeyPeer
+ (BOOL)supportsSecureCoding;
+ (id)stripIMPrefix:(id)a3;
- (KTStaticKeyPeer)initWithCoder:(id)a3;
- (KTStaticKeyPeer)initWithPeer:(id)a3;
- (NSSet)otherNamesForPeer;
- (NSString)lastUsedAddressOfMe;
- (NSString)peer;
- (void)encodeWithCoder:(id)a3;
- (void)setLastUsedAddressOfMe:(id)a3;
- (void)setOtherNamesForPeer:(id)a3;
- (void)setPeer:(id)a3;
@end

@implementation KTStaticKeyPeer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stripIMPrefix:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"im://"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"im://", "length")];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (KTStaticKeyPeer)initWithPeer:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTStaticKeyPeer;
  v5 = [(KTStaticKeyPeer *)&v10 init];
  if (v5)
  {
    v6 = [(id)objc_opt_class() stripIMPrefix:v4];
    [(KTStaticKeyPeer *)v5 setPeer:v6];

    v7 = [MEMORY[0x263EFFA08] set];
    [(KTStaticKeyPeer *)v5 setOtherNamesForPeer:v7];

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(KTStaticKeyPeer *)self peer];
  [v9 encodeObject:v4 forKey:@"peer"];

  v5 = [(KTStaticKeyPeer *)self otherNamesForPeer];
  v6 = [v5 allObjects];
  [v9 encodeObject:v6 forKey:@"otherNames"];

  v7 = [(KTStaticKeyPeer *)self lastUsedAddressOfMe];

  if (v7)
  {
    v8 = [(KTStaticKeyPeer *)self lastUsedAddressOfMe];
    [v9 encodeObject:v8 forKey:@"lastUsed"];
  }
}

- (KTStaticKeyPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KTStaticKeyPeer;
  v5 = [(KTStaticKeyPeer *)&v13 init];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"peer"],
        v6 = objc_claimAutoreleasedReturnValue(),
        [(KTStaticKeyPeer *)v5 setPeer:v6],
        v6,
        [(KTStaticKeyPeer *)v5 peer],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"otherNames"];
    if (v8)
    {
      id v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
      [(KTStaticKeyPeer *)v5 setOtherNamesForPeer:v9];
    }
    objc_super v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUsed"];
    [(KTStaticKeyPeer *)v5 setLastUsedAddressOfMe:v10];

    v11 = v5;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setOtherNamesForPeer:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend((id)objc_opt_class(), "stripIMPrefix:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        [(NSSet *)v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  otherNames = self->_otherNames;
  self->_otherNames = v5;
}

- (NSSet)otherNamesForPeer
{
  return self->_otherNames;
}

- (NSString)peer
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPeer:(id)a3
{
}

- (NSString)lastUsedAddressOfMe
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastUsedAddressOfMe:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedAddressOfMe, 0);
  objc_storeStrong((id *)&self->_peer, 0);

  objc_storeStrong((id *)&self->_otherNames, 0);
}

@end