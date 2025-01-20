@interface ICQTipIconSymbol
+ (BOOL)supportsSecureCoding;
- (ICQTipIconSymbol)initWithCoder:(id)a3;
- (NSString)id;
- (NSString)path;
- (NSString)systemColorName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setId:(id)a3;
- (void)setPath:(id)a3;
- (void)setSystemColorName:(id)a3;
@end

@implementation ICQTipIconSymbol

- (id)description
{
  return (id)[NSString stringWithFormat:@"id: %@, path: %@ color: %@", self->_id, self->_path, self->_systemColorName];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQTipIconSymbol);
  [(ICQTipIconSymbol *)v4 setId:self->_id];
  [(ICQTipIconSymbol *)v4 setPath:self->_path];
  [(ICQTipIconSymbol *)v4 setSystemColorName:self->_systemColorName];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id = self->_id;
  id v5 = a3;
  [v5 encodeObject:id forKey:@"id"];
  [v5 encodeObject:self->_path forKey:@"path"];
  [v5 encodeObject:self->_systemColorName forKey:@"systemColorName"];
}

- (ICQTipIconSymbol)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQTipIconSymbol;
  id v5 = [(ICQTipIconSymbol *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    id = v5->_id;
    v5->_id = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemColorName"];
    systemColorName = v5->_systemColorName;
    v5->_systemColorName = (NSString *)v10;
  }
  return v5;
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)systemColorName
{
  return self->_systemColorName;
}

- (void)setSystemColorName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemColorName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end