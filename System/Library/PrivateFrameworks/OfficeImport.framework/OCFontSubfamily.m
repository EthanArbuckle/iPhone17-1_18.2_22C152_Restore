@interface OCFontSubfamily
+ (id)fontSubfamilyWithName:(id)a3 metadata:(id)a4;
- (NSString)name;
- (OCFontMetadata)metadata;
- (OCFontSubfamily)initWithName:(id)a3 metadata:(id)a4;
@end

@implementation OCFontSubfamily

- (OCFontSubfamily)initWithName:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OCFontSubfamily;
  v8 = [(OCFontSubfamily *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_metadata, a4);
  }

  return v8;
}

+ (id)fontSubfamilyWithName:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[OCFontSubfamily alloc] initWithName:v5 metadata:v6];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (OCFontMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end