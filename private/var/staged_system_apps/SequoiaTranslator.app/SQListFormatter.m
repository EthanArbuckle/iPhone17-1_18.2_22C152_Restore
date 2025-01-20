@interface SQListFormatter
- (SQListFormatter)initWithLocale:(id)a3;
- (SQListFormatter)initWithLocale:(id)a3 style:(id)a4;
@end

@implementation SQListFormatter

- (SQListFormatter)initWithLocale:(id)a3
{
  return [(SQListFormatter *)self initWithLocale:a3 style:0];
}

- (SQListFormatter)initWithLocale:(id)a3 style:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SQListFormatter;
  v4 = -[SQListFormatter initWithLocale:](&v8, "initWithLocale:", a3, a4);
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

@end