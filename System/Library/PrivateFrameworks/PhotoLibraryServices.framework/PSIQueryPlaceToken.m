@interface PSIQueryPlaceToken
+ (BOOL)supportsSecureCoding;
- (PSIQueryPlaceToken)initWithCoder:(id)a3;
- (PSIQueryPlaceToken)initWithText:(id)a3 locationNameByCategory:(id)a4;
- (id)parentToken;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSIQueryPlaceToken

- (void).cxx_destruct
{
}

- (id)parentToken
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__84045;
  v15 = __Block_byref_object_dispose__84046;
  v10.receiver = self;
  v10.super_class = (Class)PSIQueryPlaceToken;
  id v16 = [(PSIQueryToken *)&v10 parentToken];
  locationNameByCategory = (NSDictionary *)v12[5];
  if (!locationNameByCategory)
  {
    locationNameByCategory = self->_locationNameByCategory;
    if (locationNameByCategory)
    {
      unint64_t v4 = [(PSIQueryToken *)self userCategory];
      unint64_t v5 = [(PSIQueryToken *)self matchType];
      v6 = self->_locationNameByCategory;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __33__PSIQueryPlaceToken_parentToken__block_invoke;
      v9[3] = &unk_1E58703A8;
      v9[5] = v4;
      v9[6] = v5;
      v9[4] = &v11;
      PLSearchIndexEnumeratePlacesFromBigToSmall(v6, v9);
      [(PSIQueryToken *)self setParentToken:v12[5]];
      locationNameByCategory = (NSDictionary *)v12[5];
    }
  }
  v7 = locationNameByCategory;
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __33__PSIQueryPlaceToken_parentToken__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [[PSIQueryToken alloc] initWithText:v3 userCategory:a1[5] matchType:a1[6]];

  [(PSIQueryToken *)v4 setParentToken:*(void *)(*(void *)(a1[4] + 8) + 40)];
  uint64_t v5 = *(void *)(a1[4] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSIQueryPlaceToken;
  id v4 = a3;
  [(PSIQueryToken *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_locationNameByCategory, @"locationNameByCategory", v5.receiver, v5.super_class);
}

- (PSIQueryPlaceToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSIQueryPlaceToken;
  objc_super v5 = [(PSIQueryToken *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"locationNameByCategory"];
    locationNameByCategory = v5->_locationNameByCategory;
    v5->_locationNameByCategory = (NSDictionary *)v10;
  }
  return v5;
}

- (PSIQueryPlaceToken)initWithText:(id)a3 locationNameByCategory:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PSIQueryPlaceToken;
  uint64_t v7 = [(PSIQueryToken *)&v11 initWithText:a3 userCategory:9 matchType:2];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    locationNameByCategory = v7->_locationNameByCategory;
    v7->_locationNameByCategory = (NSDictionary *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end