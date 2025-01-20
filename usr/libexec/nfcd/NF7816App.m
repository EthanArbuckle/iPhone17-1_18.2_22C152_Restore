@interface NF7816App
+ (NF7816App)appWithAid:(id)a3 type:(int64_t)a4;
- (NF7816App)initWithAid:(id)a3 type:(int64_t)a4;
- (NSData)aid;
- (id)description;
- (int64_t)type;
- (void)setAid:(id)a3;
@end

@implementation NF7816App

- (NF7816App)initWithAid:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NF7816App;
  v8 = [(NF7816App *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_aid, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (NF7816App)appWithAid:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  v6 = [[NF7816App alloc] initWithAid:v5 type:a4];

  return v6;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 4) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *((void *)&off_100305CA8 + type);
  }
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@", self->_aid, v3];

  return v4;
}

- (NSData)aid
{
  return self->_aid;
}

- (void)setAid:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end