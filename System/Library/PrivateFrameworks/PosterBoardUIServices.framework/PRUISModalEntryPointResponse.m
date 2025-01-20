@interface PRUISModalEntryPointResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)cancel;
+ (id)done;
- (PRUISModalEntryPointResponse)initWithBSXPCCoder:(id)a3;
- (PRUISModalEntryPointResponse)initWithEntryPointResult:(int64_t)a3;
- (PRUISModalEntryPointResponse)initWithResult:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)entryPointResult;
- (int64_t)result;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRUISModalEntryPointResponse

+ (id)cancel
{
  v2 = (void *)[objc_alloc((Class)a1) initWithEntryPointResult:0];

  return v2;
}

+ (id)done
{
  v2 = (void *)[objc_alloc((Class)a1) initWithEntryPointResult:1];

  return v2;
}

- (PRUISModalEntryPointResponse)initWithEntryPointResult:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PRUISModalEntryPointResponse;
  v4 = [(PRUISModalEntryPointResponse *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_result = a3 == 1;
    v4->_entryPointResult = a3;
    v6 = v4;
  }

  return v5;
}

- (PRUISModalEntryPointResponse)initWithResult:(int64_t)a3
{
  return [(PRUISModalEntryPointResponse *)self initWithEntryPointResult:a3 == 1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t entryPointResult = self->_entryPointResult;

  return (id)[v4 initWithEntryPointResult:entryPointResult];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointResponse)initWithBSXPCCoder:(id)a3
{
  uint64_t v4 = [a3 decodeInt64ForKey:@"result"];

  return [(PRUISModalEntryPointResponse *)self initWithResult:v4];
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (int64_t)result
{
  return self->_result;
}

- (int64_t)entryPointResult
{
  return self->_entryPointResult;
}

@end