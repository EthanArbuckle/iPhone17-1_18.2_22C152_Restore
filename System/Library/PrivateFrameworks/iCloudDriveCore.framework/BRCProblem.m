@interface BRCProblem
+ (BOOL)supportsSecureCoding;
- (BRCProblem)initWithCoder:(id)a3;
- (BRCProblem)initWithProblem:(id)a3;
- (BRCProblem)initWithType:(int)a3 recordName:(id)a4;
- (NSSet)effectedRecordNames;
- (id)copyWithZone:(_NSZone *)a3;
- (int)type;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithProblem:(id)a3;
@end

@implementation BRCProblem

- (BRCProblem)initWithType:(int)a3 recordName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCProblem;
  v7 = [(BRCProblem *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    if (v6) {
      [MEMORY[0x263EFFA08] setWithObject:v6];
    }
    else {
    uint64_t v9 = [MEMORY[0x263EFFA08] set];
    }
    effectedRecordNames = v8->_effectedRecordNames;
    v8->_effectedRecordNames = (NSSet *)v9;
  }
  return v8;
}

- (BRCProblem)initWithProblem:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCProblem;
  v5 = [(BRCProblem *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_type = *((_DWORD *)v4 + 2);
    uint64_t v7 = [*((id *)v4 + 2) copy];
    effectedRecordNames = v6->_effectedRecordNames;
    v6->_effectedRecordNames = (NSSet *)v7;
  }
  return v6;
}

- (BRCProblem)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCProblem;
  v5 = [(BRCProblem *)&v12 init];
  if (v5)
  {
    v5->_type = [v4 decodeInt32ForKey:@"type"];
    id v6 = (void *)MEMORY[0x263EFFA08];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"recordNames"];
    effectedRecordNames = v5->_effectedRecordNames;
    v5->_effectedRecordNames = (NSSet *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt32:type forKey:@"type"];
  [v5 encodeObject:self->_effectedRecordNames forKey:@"recordNames"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithProblem:self];
}

- (void)mergeWithProblem:(id)a3
{
  id v4 = a3;
  if (self->_type != v4[2])
  {
    objc_super v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCProblem mergeWithProblem:]((uint64_t)v10, v11);
    }
  }
  NSUInteger v5 = [(NSSet *)self->_effectedRecordNames count];
  id v6 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v7 = [v6 zoneHealthReportedRecordNamesCount];

  if (v5 < v7)
  {
    v8 = [(NSSet *)self->_effectedRecordNames setByAddingObjectsFromSet:*((void *)v4 + 2)];
    effectedRecordNames = self->_effectedRecordNames;
    self->_effectedRecordNames = v8;
  }
}

- (int)type
{
  return self->_type;
}

- (NSSet)effectedRecordNames
{
  return self->_effectedRecordNames;
}

- (void).cxx_destruct
{
}

- (void)mergeWithProblem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _type == problem->_type%@", (uint8_t *)&v2, 0xCu);
}

@end