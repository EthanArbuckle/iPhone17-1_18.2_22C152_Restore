@interface NRClientInfo
+ (BOOL)supportsSecureCoding;
- (NRClientInfo)initWithCoder:(id)a3;
- (NSString)processName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation NRClientInfo

- (NRClientInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NRClientInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processName"];
    processName = v5->_processName;
    v5->_processName = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_processName);
  return v4;
}

- (unint64_t)hash
{
  return [(NSString *)self->_processName hash] + 31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_processName];
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end