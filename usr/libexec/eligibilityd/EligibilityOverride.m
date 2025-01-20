@interface EligibilityOverride
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EligibilityOverride)init;
- (EligibilityOverride)initWithCoder:(id)a3;
- (NSMutableDictionary)overrideMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)overrideResultDictionaryForDomain:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)forceDomain:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5;
- (void)resetAllAnswers;
- (void)resetAnswerForDomain:(unint64_t)a3;
- (void)setOverrideMap:(id)a3;
@end

@implementation EligibilityOverride

- (void).cxx_destruct
{
}

- (void)setOverrideMap:(id)a3
{
}

- (NSMutableDictionary)overrideMap
{
  return self->_overrideMap;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(EligibilityOverride *)self overrideMap];
  v5 = +[NSString stringWithFormat:@"<%@: overrides: %@>", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EligibilityOverride *)a3;
  v11.receiver = self;
  v11.super_class = (Class)EligibilityOverride;
  if (![(EligibilityOverride *)&v11 isEqual:v4]) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v8 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = [(EligibilityOverride *)self overrideMap];
    v7 = [(EligibilityOverride *)v5 overrideMap];
    char v8 = sub_100019BF8(v6, v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_10000D0EC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[EligibilityOverride isEqual:]";
        __int16 v14 = 2080;
        v15 = "overrideMap";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }
  }
  else
  {
LABEL_9:
    char v8 = 0;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  v2 = [(EligibilityOverride *)self overrideMap];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  v6 = [(EligibilityOverride *)self overrideMap];
  id v7 = [v6 copyWithZone:a3];
  [v5 setOverrideMap:v7];

  return v5;
}

- (EligibilityOverride)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EligibilityOverride;
  id v5 = [(EligibilityOverride *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    char v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"overrideMap"];

    if (!v9)
    {
      v10 = sub_10000D0EC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[EligibilityOverride initWithCoder:]";
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to deserialize overrideMap, setting to default value", buf, 0xCu);
      }

      uint64_t v9 = objc_opt_new();
    }
    overrideMap = v5->_overrideMap;
    v5->_overrideMap = (NSMutableDictionary *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(EligibilityOverride *)self overrideMap];
  [v4 encodeObject:v5 forKey:@"overrideMap"];
}

- (id)overrideResultDictionaryForDomain:(unint64_t)a3
{
  if (a3 > 0x7D) {
    id v4 = "<Unknown Domain>";
  }
  else {
    id v4 = off_100038608[a3];
  }
  id v5 = +[NSString stringWithUTF8String:v4];
  uint64_t v6 = [(EligibilityOverride *)self overrideMap];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    char v8 = [v7 context];

    if (v8)
    {
      v15[0] = @"os_eligibility_answer_t";
      uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v7 answer]);
      v16[0] = v9;
      v16[1] = &off_10003C528;
      v15[1] = @"os_eligibility_answer_source_t";
      v15[2] = @"context";
      v10 = [v7 context];
      v16[2] = v10;
      objc_super v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    }
    else
    {
      v13[0] = @"os_eligibility_answer_t";
      uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v7 answer]);
      v13[1] = @"os_eligibility_answer_source_t";
      v14[0] = v9;
      v14[1] = &off_10003C528;
      objc_super v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    }
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (void)resetAllAnswers
{
  self->_overrideMap = (NSMutableDictionary *)objc_opt_new();

  _objc_release_x1();
}

- (void)resetAnswerForDomain:(unint64_t)a3
{
  if (a3 > 0x7D) {
    id v4 = "<Unknown Domain>";
  }
  else {
    id v4 = off_100038608[a3];
  }
  id v6 = +[NSString stringWithUTF8String:v4];
  id v5 = [(EligibilityOverride *)self overrideMap];
  [v5 removeObjectForKey:v6];
}

- (void)forceDomain:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5
{
  id v8 = a5;
  if (a3 > 0x7D) {
    uint64_t v9 = "<Unknown Domain>";
  }
  else {
    uint64_t v9 = off_100038608[a3];
  }
  id v12 = +[NSString stringWithUTF8String:v9];
  v10 = [[EligibilityOverrideData alloc] initWithAnswer:a4 context:v8];

  objc_super v11 = [(EligibilityOverride *)self overrideMap];
  [v11 setObject:v10 forKeyedSubscript:v12];
}

- (EligibilityOverride)init
{
  v6.receiver = self;
  v6.super_class = (Class)EligibilityOverride;
  v2 = [(EligibilityOverride *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    overrideMap = v2->_overrideMap;
    v2->_overrideMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end