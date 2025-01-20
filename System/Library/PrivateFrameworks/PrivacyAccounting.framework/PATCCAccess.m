@interface PATCCAccess
+ (BOOL)supportsSecureCoding;
+ (id)accessWithAccessor:(id)a3 forService:(id)a4;
+ (id)accessWithAuditToken:(id *)a3 forService:(id)a4;
+ (id)accessWithAuthorization:(id)a3;
+ (id)accessWithInsecureProcessIdentifier:(int)a3 forService:(id)a4;
+ (id)eventStreamIdentifier;
- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4;
- (NSString)tccService;
- (PATCCAccess)initWithAccessor:(id)a3 forService:(id)a4;
- (PATCCAccess)initWithAccessor:(id)a3 forService:(id)a4 assetIdentifiers:(id)a5;
- (PATCCAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 forService:(id)a6;
- (PATCCAccess)initWithAuditToken:(id *)a3 forService:(id)a4;
- (PATCCAccess)initWithAuthorization:(id)a3;
- (PATCCAccess)initWithCoder:(id)a3;
- (PATCCAccess)initWithInsecureProcessIdentifier:(int)a3 forService:(id)a4;
- (PATCCAccess)initWithProto:(id)a3;
- (PATCCAccess)initWithProtoData:(id)a3;
- (id)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionForCategory;
- (id)proto;
- (unint64_t)hashWithOptions:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PATCCAccess

- (void).cxx_destruct
{
}

- (PATCCAccess)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PATCCAccess;
  v5 = [(PAAccess *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tccService"];
    tccService = v5->_tccService;
    v5->_tccService = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)hashWithOptions:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PATCCAccess;
  unint64_t v4 = [(PAAccess *)&v6 hashWithOptions:a3];
  return [(NSString *)self->_tccService hash] - v4 + 32 * v4;
}

+ (id)accessWithAuditToken:(id *)a3 forService:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  long long v8 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v8;
  objc_super v9 = (void *)[v7 initWithAuditToken:v11 forService:v6];

  return v9;
}

- (PATCCAccess)initWithAuditToken:(id *)a3 forService:(id)a4
{
  long long v5 = *(_OWORD *)&a3->var0[4];
  long long v10 = *(_OWORD *)a3->var0;
  long long v11 = v5;
  id v6 = a4;
  id v7 = +[PAApplication applicationWithAuditToken:&v10];
  long long v8 = -[PATCCAccess initWithAccessor:forService:](self, "initWithAccessor:forService:", v7, v6, v10, v11);

  return v8;
}

- (PATCCAccess)initWithAccessor:(id)a3 forService:(id)a4 assetIdentifiers:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PATCCAccess;
  objc_super v9 = [(PAAccess *)&v14 initWithAccessor:a3 assetIdentifiers:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    tccService = v9->_tccService;
    v9->_tccService = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (PATCCAccess)initWithAccessor:(id)a3 forService:(id)a4
{
  return [(PATCCAccess *)self initWithAccessor:a3 forService:a4 assetIdentifiers:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PATCCAccess;
  long long v5 = -[PAAccess copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_tccService copyWithZone:a3];
    id v7 = (void *)v5[9];
    v5[9] = v6;
  }
  return v5;
}

- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PATCCAccess;
  if ([(PAAccess *)&v11 isEqualToAccess:v6 withOptions:a4])
  {
    tccService = self->_tccService;
    id v8 = [v6 tccService];
    BOOL v9 = [(NSString *)tccService isEqualToString:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)tccService
{
  return self->_tccService;
}

void __23__PATCCAccess_category__block_invoke()
{
  v6[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FA9A10];
  v5[0] = *MEMORY[0x1E4FA9A38];
  v5[1] = v0;
  v6[0] = @"camera";
  v6[1] = @"contacts";
  uint64_t v1 = *MEMORY[0x1E4FA9AA8];
  v5[2] = *MEMORY[0x1E4FA9AA0];
  v5[3] = v1;
  v6[2] = @"mediaLibrary";
  v6[3] = @"microphone";
  uint64_t v2 = *MEMORY[0x1E4FA9B20];
  v5[4] = *MEMORY[0x1E4FA9AE0];
  v5[5] = v2;
  v6[4] = @"photos";
  v6[5] = @"userTracking";
  v5[6] = *MEMORY[0x1E4FA9A30];
  v6[6] = @"calendar";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  unint64_t v4 = (void *)category_tccServiceToCategory;
  category_tccServiceToCategory = v3;
}

- (id)descriptionForCategory
{
  tccService = [(PATCCAccess *)self category];
  unint64_t v4 = tccService;
  if (!tccService) {
    tccService = self->_tccService;
  }
  id v5 = tccService;

  return v5;
}

- (id)category
{
  if (category_onceToken != -1) {
    dispatch_once(&category_onceToken, &__block_literal_global_2);
  }
  uint64_t v3 = [(id)category_tccServiceToCategory objectForKeyedSubscript:self->_tccService];
  unint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = @"unknown";
  }
  id v5 = v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PATCCAccess;
  id v4 = a3;
  [(PAAccess *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tccService, @"tccService", v5.receiver, v5.super_class);
}

+ (id)accessWithAccessor:(id)a3 forService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithAccessor:v7 forService:v6];

  return v8;
}

+ (id)accessWithAuthorization:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithAuthorization:v4];

  return v5;
}

+ (id)accessWithInsecureProcessIdentifier:(int)a3 forService:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithInsecureProcessIdentifier:v4 forService:v6];

  return v7;
}

+ (id)eventStreamIdentifier
{
  return @"com.apple.privacy.accounting.stream.tcc";
}

- (PATCCAccess)initWithAuthorization:(id)a3
{
  id v4 = a3;
  objc_super v5 = tcc_authorization_record_get_service();
  if (v5)
  {
    uint64_t CF_name = tcc_service_get_CF_name();
    id v7 = tcc_authorization_record_get_subject_identity();
    if (v7)
    {
      id v8 = [[PAApplication alloc] initWithTCCIdentity:v7];
      if (v8)
      {
        self = [(PATCCAccess *)self initWithAccessor:v8 forService:CF_name];
        BOOL v9 = self;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (PATCCAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 forService:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PATCCAccess;
  objc_super v11 = [(PAAccess *)&v15 initWithAccessor:a3 identifier:a4 kind:a5];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    tccService = v11->_tccService;
    v11->_tccService = (NSString *)v12;
  }
  return v11;
}

- (PATCCAccess)initWithInsecureProcessIdentifier:(int)a3 forService:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [[PAApplication alloc] initWithInsecureProcessIdentifier:v4];
  id v8 = [(PATCCAccess *)self initWithAccessor:v7 forService:v6];

  return v8;
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PATCCAccess;
  uint64_t v4 = [(PAAccess *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@ tccService:%@", v4, self->_tccService];

  return v5;
}

- (PATCCAccess)initWithProto:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 access];
    v11.receiver = self;
    v11.super_class = (Class)PATCCAccess;
    self = [(PAAccess *)&v11 initWithProto:v6];

    if (self)
    {
      objc_super v7 = [v5 tccService];

      if (v7)
      {
        id v8 = [v5 tccService];
        tccService = self->_tccService;
        self->_tccService = v8;

        objc_super v7 = self;
      }
    }
    else
    {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (PATCCAccess)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[PAPBTCCAccess alloc] initWithData:v4];

    id v6 = [(PATCCAccess *)self initWithProto:v5];
    self = v6;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)PATCCAccess;
  id v4 = [(PAAccess *)&v7 proto];
  if (v4)
  {
    [v3 setAccess:v4];
    [v3 setTccService:self->_tccService];
    id v5 = v3;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end