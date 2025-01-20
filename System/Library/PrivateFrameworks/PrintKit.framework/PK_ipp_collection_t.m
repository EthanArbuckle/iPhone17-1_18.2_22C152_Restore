@interface PK_ipp_collection_t
+ (BOOL)supportsSecureCoding;
- (PK_ipp_collection_t)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PK_ipp_collection_t

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PK_ipp_collection_t)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_attrs"];
  v8.receiver = self;
  v8.super_class = (Class)PK_ipp_collection_t;
  v6 = [(PK_ipp_t *)&v8 _initWithAttrs:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  attrs = self->super._attrs;

  return (id)[v4 _initWithAttrs:attrs];
}

- (id)debugDescription
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v3 = objc_opt_new();
  attrs = self->super._attrs;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__PK_ipp_collection_t_debugDescription__block_invoke;
  v12[3] = &unk_2649EC298;
  v14 = &v15;
  id v5 = v3;
  id v13 = v5;
  [(NSMutableArray *)attrs enumerateObjectsUsingBlock:v12];
  v6 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PK_ipp_collection_t;
  v7 = [(PK_ipp_t *)&v11 description];
  objc_super v8 = [(PK_ipp_t *)self _descriptionLeader];
  v9 = [v6 stringWithFormat:@"%@ %@ { \"%@\": %@ }", v7, v8, v16[5], v5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

@end