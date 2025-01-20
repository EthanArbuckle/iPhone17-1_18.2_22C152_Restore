@interface ipp_collection_t
+ (BOOL)supportsSecureCoding;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (ipp_collection_t)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ipp_collection_t

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ipp_collection_t)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_attrs"];
  v8.receiver = self;
  v8.super_class = (Class)ipp_collection_t;
  v6 = [(ipp_t *)&v8 _initWithAttrs:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  attrs = self->super._attrs;

  return [v4 _initWithAttrs:attrs];
}

- (id)debugDescription
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100040C08;
  v18 = sub_100040C18;
  id v19 = 0;
  v3 = objc_opt_new();
  attrs = self->super._attrs;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100041094;
  v11[3] = &unk_1000A2F78;
  v13 = &v14;
  id v5 = v3;
  id v12 = v5;
  [(NSMutableArray *)attrs enumerateObjectsUsingBlock:v11];
  v10.receiver = self;
  v10.super_class = (Class)ipp_collection_t;
  v6 = [(ipp_t *)&v10 description];
  v7 = [(ipp_t *)self _descriptionLeader];
  objc_super v8 = +[NSString stringWithFormat:@"%@ %@ { \"%@\": %@ }", v6, v7, v15[5], v5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

@end