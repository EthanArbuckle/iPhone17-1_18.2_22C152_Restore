@interface SFContactCopyItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSURL)contactFileLocation;
- (SFContactCopyItem)initWithCoder:(id)a3;
- (SFContactCopyItem)initWithProtobuf:(id)a3;
- (SFPerson)person;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContactFileLocation:(id)a3;
- (void)setPerson:(id)a3;
@end

@implementation SFContactCopyItem

- (SFContactCopyItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFContactCopyItem;
  v5 = [(SFContactCopyItem *)&v15 init];
  if (v5)
  {
    v6 = [v4 person];

    if (v6)
    {
      v7 = [SFPerson alloc];
      v8 = [v4 person];
      v9 = [(SFPerson *)v7 initWithProtobuf:v8];
      [(SFContactCopyItem *)v5 setPerson:v9];
    }
    v10 = [v4 contactFileLocation];

    if (v10)
    {
      v11 = [v4 contactFileLocation];
      v12 = _SFPBURLHandwrittenTranslator(v11);
      [(SFContactCopyItem *)v5 setContactFileLocation:v12];
    }
    v13 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFileLocation, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)setContactFileLocation:(id)a3
{
}

- (NSURL)contactFileLocation
{
  return self->_contactFileLocation;
}

- (void)setPerson:(id)a3
{
}

- (SFPerson)person
{
  return self->_person;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)SFContactCopyItem;
  unint64_t v3 = [(SFCopyItem *)&v9 hash];
  id v4 = [(SFContactCopyItem *)self person];
  uint64_t v5 = [v4 hash];
  v6 = [(SFContactCopyItem *)self contactFileLocation];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFContactCopyItem *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFContactCopyItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      v22.receiver = self;
      v22.super_class = (Class)SFContactCopyItem;
      if ([(SFCopyItem *)&v22 isEqual:v5])
      {
        v6 = v5;
        unint64_t v7 = [(SFContactCopyItem *)self person];
        v8 = [(SFContactCopyItem *)v6 person];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        objc_super v9 = [(SFContactCopyItem *)self person];
        if (v9)
        {
          unint64_t v3 = [(SFContactCopyItem *)self person];
          v10 = [(SFContactCopyItem *)v6 person];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        v12 = [(SFContactCopyItem *)self contactFileLocation];
        v13 = [(SFContactCopyItem *)v6 contactFileLocation];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
        }
        else
        {
          uint64_t v15 = [(SFContactCopyItem *)self contactFileLocation];
          if (v15)
          {
            v16 = (void *)v15;
            v19 = [(SFContactCopyItem *)self contactFileLocation];
            [(SFContactCopyItem *)v6 contactFileLocation];
            v17 = v20 = v3;
            char v11 = [v19 isEqual:v17];

            unint64_t v3 = v20;
          }
          else
          {

            char v11 = 1;
          }
        }
        v10 = v21;
        if (!v9) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    char v11 = 0;
  }
LABEL_21:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFContactCopyItem;
  id v4 = [(SFCopyItem *)&v10 copyWithZone:a3];
  uint64_t v5 = [(SFContactCopyItem *)self person];
  v6 = (void *)[v5 copy];
  [v4 setPerson:v6];

  unint64_t v7 = [(SFContactCopyItem *)self contactFileLocation];
  v8 = (void *)[v7 copy];
  [v4 setContactFileLocation:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBContactCopyItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBContactCopyItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBContactCopyItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBContactCopyItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBContactCopyItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBContactCopyItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFContactCopyItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBContactCopyItem alloc] initWithData:v5];
  unint64_t v7 = [(SFContactCopyItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end