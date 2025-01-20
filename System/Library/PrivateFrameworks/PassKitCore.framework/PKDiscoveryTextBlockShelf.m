@interface PKDiscoveryTextBlockShelf
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)bodyKey;
- (NSString)ledeKey;
- (NSString)localizedBody;
- (NSString)localizedLede;
- (NSString)localizedSectionHeaderLine;
- (NSString)sectionHeaderLineKey;
- (PKDiscoveryTextBlockShelf)initWithCoder:(id)a3;
- (PKDiscoveryTextBlockShelf)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)localizeWithBundle:(id)a3;
- (void)localizeWithBundle:(id)a3 table:(id)a4;
- (void)setLocalizedBody:(id)a3;
- (void)setLocalizedLede:(id)a3;
- (void)setLocalizedSectionHeaderLine:(id)a3;
@end

@implementation PKDiscoveryTextBlockShelf

- (PKDiscoveryTextBlockShelf)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDiscoveryTextBlockShelf;
  v5 = [(PKDiscoveryTextBlockShelf *)&v16 init];
  v6 = v5;
  if (v5)
  {
    [(PKDiscoveryShelf *)v5 setType:1];
    uint64_t v7 = [v4 PKStringForKey:@"bodyKey"];
    bodyKey = v6->_bodyKey;
    v6->_bodyKey = (NSString *)v7;

    uint64_t v9 = [v4 PKStringForKey:@"ledeKey"];
    ledeKey = v6->_ledeKey;
    v6->_ledeKey = (NSString *)v9;

    uint64_t v11 = [v4 PKStringForKey:@"sectionHeadlineKey"];
    sectionHeaderLineKey = v6->_sectionHeaderLineKey;
    v6->_sectionHeaderLineKey = (NSString *)v11;

    v13 = [v4 PKStringForKey:@"style"];
    if ([@"standard" isEqualToString:v13]) {
      int64_t v14 = 0;
    }
    else {
      int64_t v14 = [@"legal" isEqualToString:v13];
    }
    v6->_style = v14;
  }
  return v6;
}

- (void)localizeWithBundle:(id)a3
{
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  bodyKey = self->_bodyKey;
  if (bodyKey)
  {
    v8 = [v16 localizedStringForKey:bodyKey value:&stru_1EE0F5368 table:v6];
    localizedBody = self->_localizedBody;
    self->_localizedBody = v8;
  }
  ledeKey = self->_ledeKey;
  if (ledeKey)
  {
    uint64_t v11 = [v16 localizedStringForKey:ledeKey value:&stru_1EE0F5368 table:v6];
    localizedLede = self->_localizedLede;
    self->_localizedLede = v11;
  }
  sectionHeaderLineKey = self->_sectionHeaderLineKey;
  if (sectionHeaderLineKey)
  {
    int64_t v14 = [v16 localizedStringForKey:sectionHeaderLineKey value:&stru_1EE0F5368 table:v6];
    localizedSectionHeaderLine = self->_localizedSectionHeaderLine;
    self->_localizedSectionHeaderLine = v14;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKDiscoveryTextBlockShelf;
  if (![(PKDiscoveryShelf *)&v21 isEqual:v4]) {
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_style != v4[4]) {
    goto LABEL_37;
  }
  bodyKey = self->_bodyKey;
  id v6 = (NSString *)v4[5];
  if (bodyKey) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (bodyKey != v6) {
      goto LABEL_37;
    }
  }
  else if ((-[NSString isEqual:](bodyKey, "isEqual:") & 1) == 0)
  {
    goto LABEL_37;
  }
  ledeKey = self->_ledeKey;
  uint64_t v9 = (NSString *)v4[6];
  if (ledeKey) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (ledeKey != v9) {
      goto LABEL_37;
    }
  }
  else if ((-[NSString isEqual:](ledeKey, "isEqual:") & 1) == 0)
  {
    goto LABEL_37;
  }
  sectionHeaderLineKey = self->_sectionHeaderLineKey;
  v12 = (NSString *)v4[7];
  if (sectionHeaderLineKey && v12)
  {
    if ((-[NSString isEqual:](sectionHeaderLineKey, "isEqual:") & 1) == 0) {
      goto LABEL_37;
    }
  }
  else if (sectionHeaderLineKey != v12)
  {
    goto LABEL_37;
  }
  localizedBody = self->_localizedBody;
  int64_t v14 = (NSString *)v4[8];
  if (localizedBody && v14)
  {
    if ((-[NSString isEqual:](localizedBody, "isEqual:") & 1) == 0) {
      goto LABEL_37;
    }
  }
  else if (localizedBody != v14)
  {
    goto LABEL_37;
  }
  localizedLede = self->_localizedLede;
  id v16 = (NSString *)v4[9];
  if (!localizedLede || !v16)
  {
    if (localizedLede == v16) {
      goto LABEL_33;
    }
LABEL_37:
    char v19 = 0;
    goto LABEL_38;
  }
  if ((-[NSString isEqual:](localizedLede, "isEqual:") & 1) == 0) {
    goto LABEL_37;
  }
LABEL_33:
  localizedSectionHeaderLine = self->_localizedSectionHeaderLine;
  v18 = (NSString *)v4[10];
  if (localizedSectionHeaderLine && v18) {
    char v19 = -[NSString isEqual:](localizedSectionHeaderLine, "isEqual:");
  }
  else {
    char v19 = localizedSectionHeaderLine == v18;
  }
LABEL_38:

  return v19;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)PKDiscoveryTextBlockShelf;
  id v3 = [(PKDiscoveryShelf *)&v8 hash];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v4 safelyAddObject:self->_bodyKey];
  [v4 safelyAddObject:self->_ledeKey];
  [v4 safelyAddObject:self->_sectionHeaderLineKey];
  [v4 safelyAddObject:self->_localizedBody];
  [v4 safelyAddObject:self->_localizedLede];
  [v4 safelyAddObject:self->_sectionHeaderLineKey];
  uint64_t v5 = PKCombinedHash((uint64_t)v3, v4);
  unint64_t v6 = self->_style - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  int64_t style = self->_style;
  unint64_t v6 = @"legal";
  if (style != 1) {
    unint64_t v6 = 0;
  }
  if (style) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = @"standard";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"style", v7];
  [v4 appendFormat:@"%@: '%@'; ", @"bodyKey", self->_bodyKey];
  [v4 appendFormat:@"%@: '%@'; ", @"ledeKey", self->_ledeKey];
  [v4 appendFormat:@"%@: '%@'; ", @"sectionHeadlineKey", self->_sectionHeaderLineKey];
  [v4 appendFormat:@"%@: '%@'; ", @"localizedBody", self->_localizedBody];
  [v4 appendFormat:@"%@: '%@'; ", @"localizedLede", self->_localizedLede];
  objc_msgSend(v4, "appendFormat:", @"%@: '%@'; ",
    @"localizedSectionHeadline",
    self->_localizedSectionHeaderLine);
  [v4 appendFormat:@">"];
  objc_super v8 = (void *)[v4 copy];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryTextBlockShelf;
  id v4 = a3;
  [(PKDiscoveryShelf *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, @"style", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_bodyKey forKey:@"bodyKey"];
  [v4 encodeObject:self->_ledeKey forKey:@"ledeKey"];
  [v4 encodeObject:self->_sectionHeaderLineKey forKey:@"sectionHeadlineKey"];
  [v4 encodeObject:self->_localizedBody forKey:@"localizedBody"];
  [v4 encodeObject:self->_localizedLede forKey:@"localizedLede"];
  [v4 encodeObject:self->_localizedSectionHeaderLine forKey:@"localizedSectionHeadline"];
}

- (PKDiscoveryTextBlockShelf)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKDiscoveryTextBlockShelf;
  objc_super v5 = [(PKDiscoveryShelf *)&v19 initWithCoder:v4];
  if (v5)
  {
    v5->_int64_t style = [v4 decodeIntegerForKey:@"style"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodyKey"];
    bodyKey = v5->_bodyKey;
    v5->_bodyKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ledeKey"];
    ledeKey = v5->_ledeKey;
    v5->_ledeKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionHeadlineKey"];
    sectionHeaderLineKey = v5->_sectionHeaderLineKey;
    v5->_sectionHeaderLineKey = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedBody"];
    localizedBody = v5->_localizedBody;
    v5->_localizedBody = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedLede"];
    localizedLede = v5->_localizedLede;
    v5->_localizedLede = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSectionHeadline"];
    localizedSectionHeaderLine = v5->_localizedSectionHeaderLine;
    v5->_localizedSectionHeaderLine = (NSString *)v16;
  }
  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)bodyKey
{
  return self->_bodyKey;
}

- (NSString)ledeKey
{
  return self->_ledeKey;
}

- (NSString)sectionHeaderLineKey
{
  return self->_sectionHeaderLineKey;
}

- (NSString)localizedBody
{
  return self->_localizedBody;
}

- (void)setLocalizedBody:(id)a3
{
}

- (NSString)localizedLede
{
  return self->_localizedLede;
}

- (void)setLocalizedLede:(id)a3
{
}

- (NSString)localizedSectionHeaderLine
{
  return self->_localizedSectionHeaderLine;
}

- (void)setLocalizedSectionHeaderLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSectionHeaderLine, 0);
  objc_storeStrong((id *)&self->_localizedLede, 0);
  objc_storeStrong((id *)&self->_localizedBody, 0);
  objc_storeStrong((id *)&self->_sectionHeaderLineKey, 0);
  objc_storeStrong((id *)&self->_ledeKey, 0);
  objc_storeStrong((id *)&self->_bodyKey, 0);
}

@end