@interface PBItemDetection
+ (BOOL)supportsSecureCoding;
+ (id)_allowedValueClasses;
+ (id)detectionAbsent;
+ (id)detectionPresent;
+ (id)detectionPresentWithValue:(id)a3;
- (BOOL)present;
- (PBItemDetection)initWithCoder:(id)a3;
- (PBItemDetection)initWithPresent:(BOOL)a3 value:(id)a4;
- (id)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBItemDetection

+ (id)_allowedValueClasses
{
  if (qword_1EB3B85C0 != -1) {
    dispatch_once(&qword_1EB3B85C0, &__block_literal_global_5);
  }
  v2 = (void *)_MergedGlobals_4;
  return v2;
}

uint64_t __39__PBItemDetection__allowedValueClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  _MergedGlobals_4 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)detectionAbsent
{
  if (qword_1EB3B85D0 != -1) {
    dispatch_once(&qword_1EB3B85D0, &__block_literal_global_7);
  }
  uint64_t v2 = (void *)qword_1EB3B85C8;
  return v2;
}

uint64_t __34__PBItemDetection_detectionAbsent__block_invoke()
{
  qword_1EB3B85C8 = [[PBItemDetection alloc] initWithPresent:0 value:0];
  return MEMORY[0x1F41817F8]();
}

+ (id)detectionPresent
{
  if (qword_1EB3B85E0 != -1) {
    dispatch_once(&qword_1EB3B85E0, &__block_literal_global_10);
  }
  uint64_t v2 = (void *)qword_1EB3B85D8;
  return v2;
}

uint64_t __35__PBItemDetection_detectionPresent__block_invoke()
{
  qword_1EB3B85D8 = [[PBItemDetection alloc] initWithPresent:1 value:0];
  return MEMORY[0x1F41817F8]();
}

+ (id)detectionPresentWithValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[PBItemDetection alloc] initWithPresent:1 value:v3];

  return v4;
}

- (PBItemDetection)initWithPresent:(BOOL)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PBItemDetection;
  v8 = [(PBItemDetection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_present = a3;
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBItemDetection)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBItemDetection;
  v5 = [(PBItemDetection *)&v10 init];
  if (v5)
  {
    v5->_present = [v4 decodeBoolForKey:@"present"];
    v6 = +[PBItemDetection _allowedValueClasses];
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"value"];
    id value = v5->_value;
    v5->_id value = (id)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL present = self->_present;
  id v5 = a3;
  [v5 encodeBool:present forKey:@"present"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (BOOL)present
{
  return self->_present;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end