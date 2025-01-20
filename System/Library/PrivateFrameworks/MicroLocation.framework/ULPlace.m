@interface ULPlace
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSNumber)score;
- (NSUUID)identifier;
- (ULPlace)init;
- (ULPlace)initWithCoder:(id)a3;
- (ULPlace)initWithIdentifier:(id)a3 score:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setScore:(id)a3;
@end

@implementation ULPlace

- (ULPlace)initWithIdentifier:(id)a3 score:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ULPlace;
  v8 = [(ULPlace *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ULPlace *)v8 setIdentifier:v6];
    [(ULPlace *)v9 setScore:v7];
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(ULPlace *)self identifier];
  id v7 = (void *)[v6 copyWithZone:a3];
  v8 = [(ULPlace *)self score];
  v9 = (void *)[v8 copyWithZone:a3];
  v10 = (void *)[v5 initWithIdentifier:v7 score:v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_score forKey:@"score"];
}

- (ULPlace)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ULPlace;
  id v5 = [(ULPlace *)&v14 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v7 = self;

    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
    uint64_t v10 = self;

    score = v5->_score;
    v5->_score = (NSNumber *)v10;

    v12 = v5;
  }

  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", identifier: %@", self->_identifier];
  [v6 appendFormat:@", score: %@", self->_score];
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(ULPlace *)self identifier];
    uint64_t v7 = [v5 identifier];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      v9 = [(ULPlace *)self identifier];
      uint64_t v10 = [v5 identifier];

      if (v9 != v10)
      {
        char v8 = 0;
LABEL_10:

        goto LABEL_11;
      }
    }
    objc_super v11 = [(ULPlace *)self score];
    v12 = [v5 score];
    if ([v11 isEqual:v12])
    {

      char v8 = 1;
    }
    else
    {
      v13 = [(ULPlace *)self score];
      objc_super v14 = [v5 score];
      BOOL v15 = v13 != v14;

      char v8 = !v15;
    }
    goto LABEL_10;
  }
  char v8 = 0;
LABEL_11:

  return v8 & 1;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  return [(NSNumber *)self->_score hash] ^ v3;
}

- (ULPlace)init
{
}

+ (id)new
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end