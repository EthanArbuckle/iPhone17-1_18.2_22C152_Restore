@interface ISOKey
+ (BOOL)supportsSecureCoding;
- (ISOKey)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISOKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t keyType_low = LODWORD(self->_keyType);
  id v5 = a3;
  [v5 encodeInt:keyType_low forKey:@"keyType"];
  [v5 encodeObject:self->_keyStorage forKey:@"privateKey"];
}

- (ISOKey)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v5[1] = [v4 decodeIntegerForKey:@"keyType"];
  uint64_t v6 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v7 = +[NSSet setWithObjects:v6];
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"privateKey"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = @"Key unarchive error, invalidate data type";
    uint64_t v17 = 1032;
LABEL_8:
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOKey initWithCoder:]", v17, self, v16, v9, v10, v19);
    v15 = 0;
    goto LABEL_9;
  }
  id v11 = [objc_alloc((Class)NSMutableData) initWithData:v8];
  v12 = (void *)v5[2];
  v5[2] = v11;

  v13 = (void *)v5[2];
  if (!v13)
  {
    v16 = @"Key unarchive error, missing storage";
    uint64_t v17 = 1039;
    goto LABEL_8;
  }
  if (!v5[1])
  {
    v14 = (uint64_t *)[v13 mutableBytes];
    v5[3] = v14;
    uint64_t *v14 = ccec_cp_256();
  }
  v15 = v5;
LABEL_9:

  return v15;
}

- (void).cxx_destruct
{
}

@end