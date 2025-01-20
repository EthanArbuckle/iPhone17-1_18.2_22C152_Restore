@interface TINameReadingPair
+ (id)nameReadingPairWithName:(id)a3 reading:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSString)reading;
- (TINameReadingPair)initWithName:(id)a3 reading:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation TINameReadingPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reading, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)reading
{
  return self->_reading;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  v3 = [(TINameReadingPair *)self name];
  uint64_t v4 = [v3 hash];

  v5 = [(TINameReadingPair *)self reading];
  unint64_t v6 = [v5 hash] + 257 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TINameReadingPair *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(TINameReadingPair *)self name];
      v7 = [(TINameReadingPair *)v5 name];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(TINameReadingPair *)self reading];
        v9 = [(TINameReadingPair *)v5 reading];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSString *)self->_reading copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;
  }
  return v5;
}

- (TINameReadingPair)initWithName:(id)a3 reading:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TINameReadingPair;
  uint64_t v8 = [(TINameReadingPair *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    reading = v8->_reading;
    v8->_reading = (NSString *)v11;
  }
  return v8;
}

+ (id)nameReadingPairWithName:(id)a3 reading:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 reading:v6];

  return v8;
}

@end