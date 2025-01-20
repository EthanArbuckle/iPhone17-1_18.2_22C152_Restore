@interface BRCBasehashSaltInfo
- (BRCBasehashSaltInfo)init;
- (BRCBasehashSaltInfo)initWithBasehashSaltInfo:(id)a3;
- (BRCBasehashSaltInfo)initWithRecord:(id)a3;
- (NSData)basehashSaltValidation;
- (NSData)childBasehashSalt;
- (NSData)childBasehashSaltValidation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromResultSet:(id)a3 pos:(int)a4;
- (unsigned)saltingState;
- (void)setBasehashSaltValidation:(id)a3;
- (void)setChildBasehashSalt:(id)a3;
- (void)setChildBasehashSaltValidation:(id)a3;
- (void)setSaltingState:(unsigned int)a3;
@end

@implementation BRCBasehashSaltInfo

- (BRCBasehashSaltInfo)initWithBasehashSaltInfo:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCBasehashSaltInfo;
  v5 = [(BRCBasehashSaltInfo *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_saltingState = *((_DWORD *)v4 + 2);
    uint64_t v7 = [*((id *)v4 + 2) copy];
    childBasehashSalt = v6->_childBasehashSalt;
    v6->_childBasehashSalt = (NSData *)v7;

    uint64_t v9 = [*((id *)v4 + 4) copy];
    basehashSaltValidation = v6->_basehashSaltValidation;
    v6->_basehashSaltValidation = (NSData *)v9;

    uint64_t v11 = [*((id *)v4 + 3) copy];
    childBasehashSaltValidation = v6->_childBasehashSaltValidation;
    v6->_childBasehashSaltValidation = (NSData *)v11;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithBasehashSaltInfo:self];
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCBasehashSaltInfo;
  uint64_t v7 = [(BRCBasehashSaltInfo *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 objectOfClass:objc_opt_class() atIndex:v4];
    childBasehashSalt = v7->_childBasehashSalt;
    v7->_childBasehashSalt = (NSData *)v8;

    v10 = [v6 numberAtIndex:(v4 + 1)];
    v7->_saltingState = [v10 intValue];

    uint64_t v11 = [v6 objectOfClass:objc_opt_class() atIndex:(v4 + 2)];
    basehashSaltValidation = v7->_basehashSaltValidation;
    v7->_basehashSaltValidation = (NSData *)v11;
  }
  return v7;
}

- (BRCBasehashSaltInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)BRCBasehashSaltInfo;
  v2 = [(BRCBasehashSaltInfo *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_saltingState = 1;
    childBasehashSalt = v2->_childBasehashSalt;
    v2->_childBasehashSalt = 0;

    basehashSaltValidation = v3->_basehashSaltValidation;
    v3->_basehashSaltValidation = 0;

    childBasehashSaltValidation = v3->_childBasehashSaltValidation;
    v3->_childBasehashSaltValidation = 0;
  }
  return v3;
}

- (BRCBasehashSaltInfo)initWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [(BRCBasehashSaltInfo *)self init];
  if (v5)
  {
    id v6 = +[BRCUserDefaults defaultsForMangledID:0];
    int v7 = [v6 supportsEnhancedDrivePrivacy];

    if (v7)
    {
      objc_super v8 = [v4 encryptedValues];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"childBasehashSalt"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = [v4 encryptedValues];
        uint64_t v11 = [v10 objectForKeyedSubscript:@"childBasehashSalt"];
        childBasehashSalt = v5->_childBasehashSalt;
        v5->_childBasehashSalt = (NSData *)v11;
      }
      v13 = [v4 objectForKeyedSubscript:@"saltingState"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v14 = [v4 objectForKeyedSubscript:@"saltingState"];
        v5->_saltingState = [v14 intValue];
      }
      v15 = [v4 objectForKeyedSubscript:@"basehashSaltValidationKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = [v4 objectForKeyedSubscript:@"basehashSaltValidationKey"];
        basehashSaltValidation = v5->_basehashSaltValidation;
        v5->_basehashSaltValidation = (NSData *)v16;
      }
      v18 = [v4 objectForKeyedSubscript:@"childBasehashSaltValidationKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = [v4 objectForKeyedSubscript:@"childBasehashSaltValidationKey"];
        childBasehashSaltValidation = v5->_childBasehashSaltValidation;
        v5->_childBasehashSaltValidation = (NSData *)v19;
      }
    }
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = [(BRCBasehashSaltInfo *)self saltingState];
  if (v5 > 3) {
    id v6 = @"no server item";
  }
  else {
    id v6 = off_2650804A0[v5];
  }
  int v7 = [(BRCBasehashSaltInfo *)self basehashSaltValidation];
  objc_super v8 = [v3 stringWithFormat:@"<%@ saltingState:'%@' basehashValidation: '%@' >", v4, v6, v7];

  return v8;
}

- (NSData)childBasehashSalt
{
  return self->_childBasehashSalt;
}

- (void)setChildBasehashSalt:(id)a3
{
}

- (NSData)childBasehashSaltValidation
{
  return self->_childBasehashSaltValidation;
}

- (void)setChildBasehashSaltValidation:(id)a3
{
}

- (unsigned)saltingState
{
  return self->_saltingState;
}

- (void)setSaltingState:(unsigned int)a3
{
  self->_saltingState = a3;
}

- (NSData)basehashSaltValidation
{
  return self->_basehashSaltValidation;
}

- (void)setBasehashSaltValidation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basehashSaltValidation, 0);
  objc_storeStrong((id *)&self->_childBasehashSaltValidation, 0);
  objc_storeStrong((id *)&self->_childBasehashSalt, 0);
}

@end