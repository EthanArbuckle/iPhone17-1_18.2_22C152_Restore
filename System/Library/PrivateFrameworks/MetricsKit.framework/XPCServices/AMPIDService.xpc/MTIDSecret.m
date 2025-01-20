@interface MTIDSecret
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSynchronized;
- (MTIDSecret)init;
- (MTIDSecret)initWithCoder:(id)a3;
- (MTIDSecret)initWithValue:(id)a3 effectiveDate:(id)a4 expirationDate:(id)a5 isSynchronize:(BOOL)a6;
- (NSDate)effectiveDate;
- (NSDate)expirationDate;
- (NSString)syncStatusCode;
- (NSString)value;
- (id)debugInfo;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEffectiveDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIsSynchronized:(BOOL)a3;
- (void)setSyncStatusCode:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MTIDSecret

- (MTIDSecret)init
{
  return 0;
}

- (MTIDSecret)initWithValue:(id)a3 effectiveDate:(id)a4 expirationDate:(id)a5 isSynchronize:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MTIDSecret;
  v14 = [(MTIDSecret *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_value, a3);
    objc_storeStrong((id *)&v15->_effectiveDate, a4);
    objc_storeStrong((id *)&v15->_expirationDate, a5);
    v15->_isSynchronized = a6;
  }

  return v15;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(MTIDSecret *)self value];
  v6 = [(MTIDSecret *)self effectiveDate];
  v7 = [(MTIDSecret *)self expirationDate];
  v8 = +[NSString stringWithFormat:@"<%@: %p, value: %@, effective: %@, expiration: %@ >", v4, self, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(MTIDSecret *)self value];
    v7 = [v5 value];
    if ([v6 isEqual:v7])
    {
      v8 = [(MTIDSecret *)self effectiveDate];
      [v8 timeIntervalSince1970];
      double v10 = v9;
      id v11 = [v5 effectiveDate];
      [v11 timeIntervalSince1970];
      if (v10 == v12)
      {
        id v13 = [(MTIDSecret *)self expirationDate];
        [v13 timeIntervalSince1970];
        double v15 = v14;
        v16 = [v5 expirationDate];
        [v16 timeIntervalSince1970];
        BOOL v18 = v15 == v17;
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)debugInfo
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(MTIDSecret *)self value];
  [v3 setObject:v4 forKeyedSubscript:@"value"];

  id v5 = [(MTIDSecret *)self effectiveDate];
  v6 = [v5 description];
  [v3 setObject:v6 forKeyedSubscript:@"effectiveDate"];

  v7 = [(MTIDSecret *)self expirationDate];
  v8 = [v7 description];
  [v3 setObject:v8 forKeyedSubscript:@"expirationDate"];

  double v9 = +[NSNumber numberWithBool:[(MTIDSecret *)self isSynchronized]];
  [v3 setObject:v9 forKeyedSubscript:@"isSynchronized"];

  double v10 = [(MTIDSecret *)self syncStatusCode];
  [v3 setObject:v10 forKeyedSubscript:@"syncStatusCode"];

  id v11 = [v3 copy];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MTIDSecret *)self value];
  [v4 encodeObject:v5 forKey:@"value"];

  v6 = [(MTIDSecret *)self effectiveDate];
  [v4 encodeObject:v6 forKey:@"effectiveDate"];

  v7 = [(MTIDSecret *)self expirationDate];
  [v4 encodeObject:v7 forKey:@"expirationDate"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MTIDSecret isSynchronized](self, "isSynchronized"), @"isSynchronized");
  id v8 = [(MTIDSecret *)self syncStatusCode];
  [v4 encodeObject:v8 forKey:@"syncStatusCode"];
}

- (MTIDSecret)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTIDSecret;
  id v5 = [(MTIDSecret *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    [(MTIDSecret *)v5 setValue:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectiveDate"];
    [(MTIDSecret *)v5 setEffectiveDate:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    [(MTIDSecret *)v5 setExpirationDate:v8];

    -[MTIDSecret setIsSynchronized:](v5, "setIsSynchronized:", [v4 decodeBoolForKey:@"isSynchronized"]);
    double v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syncStatusCode"];
    [(MTIDSecret *)v5 setSyncStatusCode:v9];
  }
  return v5;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (void)setEffectiveDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)isSynchronized
{
  return self->_isSynchronized;
}

- (void)setIsSynchronized:(BOOL)a3
{
  self->_isSynchronized = a3;
}

- (NSString)syncStatusCode
{
  return self->_syncStatusCode;
}

- (void)setSyncStatusCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStatusCode, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_effectiveDate, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end