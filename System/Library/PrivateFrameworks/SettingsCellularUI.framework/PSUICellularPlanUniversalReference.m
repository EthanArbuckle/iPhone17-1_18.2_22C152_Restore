@interface PSUICellularPlanUniversalReference
+ (id)referenceFromCellularPlanPendingTransfer:(id)a3;
+ (id)referenceFromDanglingPlanItem:(id)a3;
+ (id)referenceFromPlanItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)iccid;
- (PSUICellularPlanUniversalReference)init;
- (PSUICellularPlanUniversalReference)initWithCoder:(id)a3;
- (PSUICellularPlanUniversalReference)initWithIccid:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getLogger;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIccid:(id)a3;
@end

@implementation PSUICellularPlanUniversalReference

+ (id)referenceFromPlanItem:(id)a3
{
  id v3 = a3;
  v4 = [PSUICellularPlanUniversalReference alloc];
  v5 = [v3 iccid];

  v6 = [(PSUICellularPlanUniversalReference *)v4 initWithIccid:v5];
  return v6;
}

+ (id)referenceFromDanglingPlanItem:(id)a3
{
  id v3 = a3;
  v4 = [PSUICellularPlanUniversalReference alloc];
  v5 = [v3 iccid];

  v6 = [(PSUICellularPlanUniversalReference *)v4 initWithIccid:v5];
  return v6;
}

+ (id)referenceFromCellularPlanPendingTransfer:(id)a3
{
  id v3 = NSString;
  v4 = [a3 sourceIccid];
  v5 = [v3 stringWithFormat:@"TRANSFER:%@", v4];

  v6 = [[PSUICellularPlanUniversalReference alloc] initWithIccid:v5];
  return v6;
}

- (PSUICellularPlanUniversalReference)initWithCoder:(id)a3
{
  v4 = [a3 decodeObjectForKey:@"ICCID_KEY"];
  v5 = [(PSUICellularPlanUniversalReference *)self initWithIccid:v4];

  return v5;
}

- (PSUICellularPlanUniversalReference)initWithIccid:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUICellularPlanUniversalReference;
  v6 = [(PSUICellularPlanUniversalReference *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_iccid, a3);
  }

  return v7;
}

- (PSUICellularPlanUniversalReference)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [(PSUICellularPlanUniversalReference *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[PSUICellularPlanUniversalReference init]";
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PSUICellularPlanUniversalReference alloc];
  iccid = self->_iccid;
  return [(PSUICellularPlanUniversalReference *)v4 initWithIccid:iccid];
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    iccid = self->_iccid;
    v6 = [v4 iccid];
    BOOL v7 = [(NSString *)iccid isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_iccid hash] ^ 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ iccid:%@>", objc_opt_class(), self->_iccid];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularPlanUniversalReference"];
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end