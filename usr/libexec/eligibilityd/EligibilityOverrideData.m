@interface EligibilityOverrideData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EligibilityOverrideData)initWithAnswer:(unint64_t)a3 context:(id)a4;
- (EligibilityOverrideData)initWithCoder:(id)a3;
- (NSDictionary)context;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)answer;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnswer:(unint64_t)a3;
- (void)setContext:(id)a3;
@end

@implementation EligibilityOverrideData

- (void).cxx_destruct
{
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setAnswer:(unint64_t)a3
{
  self->_answer = a3;
}

- (unint64_t)answer
{
  return self->_answer;
}

- (id)description
{
  v3 = [(EligibilityOverrideData *)self context];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 description];
  }
  else
  {
    v5 = @"<NULL>";
  }
  uint64_t v6 = objc_opt_class();
  v7 = sub_10000CF70([(EligibilityOverrideData *)self answer]);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: answer: %@; context: %@>",
    v6,
    v7,
  v8 = v5);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EligibilityOverrideData *)a3;
  v13.receiver = self;
  v13.super_class = (Class)EligibilityOverrideData;
  if ([(EligibilityOverrideData *)&v13 isEqual:v4])
  {
    if (v4 == self)
    {
      BOOL v10 = 1;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(EligibilityOverrideData *)self answer];
      if (v6 == (id)[(EligibilityOverrideData *)v5 answer])
      {
        v7 = [(EligibilityOverrideData *)self context];
        v8 = [(EligibilityOverrideData *)v5 context];
        char v9 = sub_100019BF8(v7, v8);

        if (v9)
        {
          BOOL v10 = 1;
LABEL_15:

          goto LABEL_16;
        }
        v11 = sub_10000D0EC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[EligibilityOverrideData isEqual:]";
          __int16 v16 = 2080;
          v17 = "context";
          goto LABEL_13;
        }
      }
      else
      {
        v11 = sub_10000D0EC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[EligibilityOverrideData isEqual:]";
          __int16 v16 = 2080;
          v17 = "answer";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
        }
      }

      BOOL v10 = 0;
      goto LABEL_15;
    }
  }
  BOOL v10 = 0;
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(EligibilityOverrideData *)self answer];
  v4 = [(EligibilityOverrideData *)self context];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  [v5 setAnswer:-[EligibilityOverrideData answer](self, "answer")];
  id v6 = [(EligibilityOverrideData *)self context];
  id v7 = [v6 copyWithZone:a3];
  [v5 setContext:v7];

  return v5;
}

- (EligibilityOverrideData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EligibilityOverrideData;
  id v5 = [(EligibilityOverrideData *)&v13 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"answer"];
    v5->_answer = (unint64_t)[v6 unsignedIntegerValue];

    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    char v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"context"];
    context = v5->_context;
    v5->_context = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNumber numberWithUnsignedLongLong:[(EligibilityOverrideData *)self answer]];
  [v4 encodeObject:v5 forKey:@"answer"];

  id v6 = [(EligibilityOverrideData *)self context];
  [v4 encodeObject:v6 forKey:@"context"];
}

- (EligibilityOverrideData)initWithAnswer:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EligibilityOverrideData;
  uint64_t v7 = [(EligibilityOverrideData *)&v10 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(EligibilityOverrideData *)v7 setAnswer:a3];
    [(EligibilityOverrideData *)v8 setContext:v6];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end