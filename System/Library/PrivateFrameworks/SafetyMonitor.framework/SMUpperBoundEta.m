@interface SMUpperBoundEta
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)crowFliesUpperBoundEta;
- (NSDate)mapsUpperBoundEta;
- (SMUpperBoundEta)initWithCoder:(id)a3;
- (SMUpperBoundEta)initWithMapsUpperBoundEta:(id)a3 crowFliesUpperBoundEta:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMUpperBoundEta

- (SMUpperBoundEta)initWithMapsUpperBoundEta:(id)a3 crowFliesUpperBoundEta:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)SMUpperBoundEta;
    v9 = [(SMUpperBoundEta *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_mapsUpperBoundEta, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SMUpperBoundEta *)self mapsUpperBoundEta];
  v5 = [v4 stringFromDate];
  v6 = [(SMUpperBoundEta *)self crowFliesUpperBoundEta];
  id v7 = [v6 stringFromDate];
  id v8 = [v3 stringWithFormat:@"mapsUpperBoundEta, %@, crowFliesUpperBoundEta, %@", v5, v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(SMUpperBoundEta *)self mapsUpperBoundEta];
  uint64_t v4 = [v3 hash];
  v5 = [(SMUpperBoundEta *)self crowFliesUpperBoundEta];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SMUpperBoundEta *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(SMUpperBoundEta *)self mapsUpperBoundEta];
      id v7 = [(SMUpperBoundEta *)v5 mapsUpperBoundEta];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        id v8 = [(SMUpperBoundEta *)self mapsUpperBoundEta];
        v9 = [(SMUpperBoundEta *)v5 mapsUpperBoundEta];
        char v10 = [v8 isEqual:v9];
      }
      v12 = [(SMUpperBoundEta *)self crowFliesUpperBoundEta];
      objc_super v13 = [(SMUpperBoundEta *)v5 crowFliesUpperBoundEta];
      if (v12 == v13)
      {
        char v16 = 1;
      }
      else
      {
        v14 = [(SMUpperBoundEta *)self crowFliesUpperBoundEta];
        v15 = [(SMUpperBoundEta *)v5 crowFliesUpperBoundEta];
        char v16 = [v14 isEqual:v15];
      }
      char v11 = v10 & v16;
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMUpperBoundEta)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMUpperBoundEtaMapsUpperBoundEtaKey"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMUpperBoundEtaCrowFliesUpperBoundEtaKey"];

  id v7 = [(SMUpperBoundEta *)self initWithMapsUpperBoundEta:v5 crowFliesUpperBoundEta:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  mapsUpperBoundEta = self->_mapsUpperBoundEta;
  id v5 = a3;
  [v5 encodeObject:mapsUpperBoundEta forKey:@"__kSMUpperBoundEtaMapsUpperBoundEtaKey"];
  [v5 encodeObject:self->_crowFliesUpperBoundEta forKey:@"__kSMUpperBoundEtaCrowFliesUpperBoundEtaKey"];
}

- (NSDate)mapsUpperBoundEta
{
  return self->_mapsUpperBoundEta;
}

- (NSDate)crowFliesUpperBoundEta
{
  return self->_crowFliesUpperBoundEta;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crowFliesUpperBoundEta, 0);
  objc_storeStrong((id *)&self->_mapsUpperBoundEta, 0);
}

@end