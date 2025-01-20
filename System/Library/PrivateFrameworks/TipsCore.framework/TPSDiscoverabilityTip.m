@interface TPSDiscoverabilityTip
+ (BOOL)supportsSecureCoding;
- (BOOL)isLocalContent;
- (NSAttributedString)attributedString;
- (NSDictionary)preconditions;
- (TPSDiscoverabilityTip)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributedString:(id)a3;
- (void)setLocalContent:(BOOL)a3;
- (void)setPreconditions:(id)a3;
@end

@implementation TPSDiscoverabilityTip

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSDiscoverabilityTip)initWithCoder:(id)a3
{
  v13[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSDiscoverabilityTip;
  v5 = [(TPSTip *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"preconditions"];
    preconditions = v5->_preconditions;
    v5->_preconditions = (NSDictionary *)v9;

    v5->_localContent = [v4 decodeBoolForKey:@"localContent"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSDiscoverabilityTip;
  id v4 = a3;
  [(TPSTip *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_preconditions, @"preconditions", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_localContent forKey:@"localContent"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSDiscoverabilityTip;
  id v4 = [(TPSTip *)&v6 copyWithZone:a3];
  [v4 setPreconditions:self->_preconditions];
  [v4 setLocalContent:self->_localContent];
  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v8.receiver = self;
  v8.super_class = (Class)TPSDiscoverabilityTip;
  id v4 = [(TPSTip *)&v8 debugDescription];
  objc_super v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@" %@ = %d\n", @"localContent", self->_localContent];
  preconditions = self->_preconditions;
  if (preconditions) {
    [v5 appendFormat:@" %@ = %@\n", @"preconditions", preconditions];
  }
  return v5;
}

- (BOOL)isLocalContent
{
  return self->_localContent;
}

- (void)setLocalContent:(BOOL)a3
{
  self->_localContent = a3;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (NSDictionary)preconditions
{
  return self->_preconditions;
}

- (void)setPreconditions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preconditions, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end