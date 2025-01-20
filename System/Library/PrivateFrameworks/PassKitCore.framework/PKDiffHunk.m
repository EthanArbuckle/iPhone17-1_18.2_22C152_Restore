@interface PKDiffHunk
+ (BOOL)supportsSecureCoding;
+ (id)hunkWithKey:(id)a3 oldValue:(id)a4 newValue:(id)a5 message:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDiffHunk:(id)a3;
- (NSString)key;
- (NSString)message;
- (PKDiffHunk)initWithCoder:(id)a3;
- (id)valueNew;
- (id)valueOld;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
- (void)setMessage:(id)a3;
- (void)setValueNew:(id)a3;
- (void)setValueOld:(id)a3;
@end

@implementation PKDiffHunk

+ (id)hunkWithKey:(id)a3 oldValue:(id)a4 newValue:(id)a5 message:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(PKDiffHunk);
  [(PKDiffHunk *)v13 setKey:v12];

  [(PKDiffHunk *)v13 setValueOld:v11];
  [(PKDiffHunk *)v13 setValueNew:v10];

  [(PKDiffHunk *)v13 setMessage:v9];
  return v13;
}

- (unint64_t)hash
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  key = self->_key;
  long long v6 = *(_OWORD *)&self->_oldValue;
  message = self->_message;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&key count:4];
  unint64_t v3 = PKCombinedHash(17, v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKDiffHunk *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKDiffHunk *)self isEqualToDiffHunk:v5];

  return v6;
}

- (BOOL)isEqualToDiffHunk:(id)a3
{
  v4 = a3;
  if ([(NSString *)self->_key isEqual:v4[1]]
    && [self->_oldValue isEqual:v4[2]]
    && [self->_newValue isEqual:v4[3]])
  {
    char v5 = [(NSString *)self->_message isEqual:v4[4]];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSComparisonResult v5 = [(NSString *)self->_key compare:v4[1]];
      if (v5 == NSOrderedSame)
      {
        NSComparisonResult v5 = [self->_oldValue compare:v4[2]];
        if (v5 == NSOrderedSame)
        {
          NSComparisonResult v5 = [self->_newValue compare:v4[3]];
          if (v5 == NSOrderedSame) {
            NSComparisonResult v5 = [(NSString *)self->_message compare:v4[4]];
          }
        }
      }
    }
    else
    {
      unint64_t v6 = objc_opt_class();
      if (v6 < objc_opt_class()) {
        NSComparisonResult v5 = NSOrderedAscending;
      }
      else {
        NSComparisonResult v5 = NSOrderedDescending;
      }
    }
  }
  else
  {
    NSComparisonResult v5 = NSOrderedDescending;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiffHunk)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDiffHunk;
  NSComparisonResult v5 = [(PKDiffHunk *)&v16 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    [(PKDiffHunk *)v5 setKey:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"oldValue"];
    [(PKDiffHunk *)v5 setValueOld:v12];

    v13 = [v4 decodeObjectOfClasses:v11 forKey:@"newValue"];
    [(PKDiffHunk *)v5 setValueNew:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    [(PKDiffHunk *)v5 setMessage:v14];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  NSComparisonResult v5 = [(PKDiffHunk *)self key];
  [v4 encodeObject:v5 forKey:@"key"];

  unint64_t v6 = [(PKDiffHunk *)self valueOld];
  [v4 encodeObject:v6 forKey:@"oldValue"];

  v7 = [(PKDiffHunk *)self valueNew];
  [v4 encodeObject:v7 forKey:@"newValue"];

  id v8 = [(PKDiffHunk *)self message];
  [v4 encodeObject:v8 forKey:@"message"];
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (id)valueOld
{
  return self->_oldValue;
}

- (void)setValueOld:(id)a3
{
}

- (id)valueNew
{
  return self->_newValue;
}

- (void)setValueNew:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_newValue, 0);
  objc_storeStrong(&self->_oldValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end