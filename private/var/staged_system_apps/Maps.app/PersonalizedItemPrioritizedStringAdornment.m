@interface PersonalizedItemPrioritizedStringAdornment
+ (PersonalizedItemPrioritizedStringAdornment)adornmentWithString:(id)a3 locale:(id)a4 priority:(unint64_t)a5;
+ (PersonalizedItemPrioritizedStringAdornment)adornmentWithString:(id)a3 priority:(unint64_t)a4;
+ (id)defaultAdornment;
- (NSString)locale;
- (NSString)value;
- (PersonalizedItemPrioritizedStringAdornment)initWithString:(id)a3 locale:(id)a4 priority:(unint64_t)a5;
- (id)combineAdornment:(id)a3;
- (unint64_t)priority;
@end

@implementation PersonalizedItemPrioritizedStringAdornment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

- (NSString)value
{
  return self->_value;
}

+ (id)defaultAdornment
{
  if (qword_101610A40 != -1) {
    dispatch_once(&qword_101610A40, &stru_10131AA08);
  }
  v2 = (void *)qword_101610A38;

  return v2;
}

- (id)combineAdornment:(id)a3
{
  v4 = (PersonalizedItemPrioritizedStringAdornment *)a3;
  unint64_t v5 = [(PersonalizedItemPrioritizedStringAdornment *)v4 priority];
  unint64_t v6 = [(PersonalizedItemPrioritizedStringAdornment *)self priority];
  v7 = v4;
  if (v5 <= v6)
  {
    id v8 = [(PersonalizedItemPrioritizedStringAdornment *)v4 priority];
    if (v8 == (id)[(PersonalizedItemPrioritizedStringAdornment *)self priority])
    {
      v9 = [(PersonalizedItemPrioritizedStringAdornment *)self value];
      id v10 = [v9 length];

      if (v10) {
        v7 = self;
      }
      else {
        v7 = v4;
      }
    }
    else
    {
      v7 = self;
    }
  }
  v11 = v7;

  return v11;
}

- (unint64_t)priority
{
  return self->_priority;
}

+ (PersonalizedItemPrioritizedStringAdornment)adornmentWithString:(id)a3 priority:(unint64_t)a4
{
  return (PersonalizedItemPrioritizedStringAdornment *)_[a1 adornmentWithString:a3 locale:0 priority:a4];
}

+ (PersonalizedItemPrioritizedStringAdornment)adornmentWithString:(id)a3 locale:(id)a4 priority:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithString:v9 locale:v8 priority:a5];

  return (PersonalizedItemPrioritizedStringAdornment *)v10;
}

- (PersonalizedItemPrioritizedStringAdornment)initWithString:(id)a3 locale:(id)a4 priority:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PersonalizedItemPrioritizedStringAdornment;
  v11 = [(PersonalizedItemPrioritizedStringAdornment *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_value, a3);
    objc_storeStrong((id *)&v12->_locale, a4);
    v12->_priority = a5;
  }

  return v12;
}

- (NSString)locale
{
  return self->_locale;
}

@end