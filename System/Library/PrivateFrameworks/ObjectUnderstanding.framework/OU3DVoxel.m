@interface OU3DVoxel
+ (BOOL)supportsSecureCoding;
- (NSUUID)object_id;
- (OU3DVoxel)init;
- (OU3DVoxel)initWithCoder:(id)a3;
- (OU3DVoxel)initWithDictionaryRepresentation:(id)a3;
- (__n128)center;
- (__n128)size;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unsigned)semantic_label;
- (void)encodeWithCoder:(id)a3;
- (void)setCenter:(OU3DVoxel *)self;
- (void)setObject_id:(id)a3;
- (void)setSemantic_label:(unsigned __int8)a3;
- (void)setSize:(OU3DVoxel *)self;
@end

@implementation OU3DVoxel

- (OU3DVoxel)init
{
  v4.receiver = self;
  v4.super_class = (Class)OU3DVoxel;
  v2 = [(OU3DVoxel *)&v4 init];
  [(OU3DVoxel *)v2 setCenter:0.0];
  [(OU3DVoxel *)v2 setSize:0.0];
  [(OU3DVoxel *)v2 setSemantic_label:0];
  [(OU3DVoxel *)v2 setObject_id:0];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [(__objc2_class *)OU3DVoxel init];
  *(_OWORD *)&v4->info = *(_OWORD *)self->center;
  *(_OWORD *)&v4[1].superclass = *(_OWORD *)self->size;
  LOBYTE(v4->superclass) = self->semantic_label;
  objc_storeStrong(&v4->cache, self->object_id);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF8F8] dataWithBytes:self->center length:16];
  [v4 encodeObject:v5 forKey:@"location"];
  v6 = [MEMORY[0x263EFF8F8] dataWithBytes:self->size length:16];
  [v4 encodeObject:v6 forKey:@"size"];
  unsigned __int8 semantic_label = self->semantic_label;
  v7 = [MEMORY[0x263EFF8F8] dataWithBytes:&semantic_label length:1];
  [v4 encodeObject:v7 forKey:@"semantic_label"];
  [v4 encodeObject:self->object_id forKey:@"object_id"];
}

- (OU3DVoxel)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OU3DVoxel;
  v5 = [(OU3DVoxel *)&v12 init];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  *(_OWORD *)v5->center = *(_OWORD *)[v6 bytes];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
  *(_OWORD *)v5->size = *(_OWORD *)[v7 bytes];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"semantic_label"];
  v5->unsigned __int8 semantic_label = *(unsigned char *)[v8 bytes];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"object_id"];
  object_id = v5->object_id;
  v5->object_id = (NSUUID *)v9;

  return v5;
}

- (id)dictionaryRepresentation
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = float3ToNSArray(*(__n128 *)self->center);
  [v3 setObject:v4 forKeyedSubscript:@"location"];

  v5 = float3ToNSArray(*(__n128 *)self->size);
  [v3 setObject:v5 forKeyedSubscript:@"size"];

  id v6 = [NSNumber numberWithUnsignedChar:self->semantic_label];
  v12[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v3 setObject:v7 forKeyedSubscript:@"semantic_label"];

  object_id = self->object_id;
  if (object_id)
  {
    uint64_t v9 = [(NSUUID *)self->object_id UUIDString];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [v3 setObject:v9 forKeyedSubscript:@"object_id"];
  if (object_id) {

  }
  v10 = (void *)[v3 copy];
  return v10;
}

- (OU3DVoxel)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OU3DVoxel;
  v5 = [(OU3DVoxel *)&v17 init];
  id v6 = [v4 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7) {
    float3FromNSArray(v7, v5->center);
  }

  id v8 = [v4 objectForKeyedSubscript:@"size"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (v9) {
    float3FromNSArray(v9, v5->size);
  }

  id v10 = [v4 objectForKeyedSubscript:@"semantic_label"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v11)
  {
    objc_super v12 = [v11 objectAtIndexedSubscript:0];
    v5->unsigned __int8 semantic_label = [v12 intValue];
  }
  v13 = [v4 objectForKeyedSubscript:@"object_id"];
  if (v13)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
    object_id = v5->object_id;
    v5->object_id = (NSUUID *)v14;
  }
  else
  {
    object_id = v5->object_id;
    v5->object_id = 0;
  }

  return v5;
}

- (__n128)center
{
  return a1[2];
}

- (void)setCenter:(OU3DVoxel *)self
{
  *(_OWORD *)self->center = v2;
}

- (__n128)size
{
  return a1[3];
}

- (void)setSize:(OU3DVoxel *)self
{
  *(_OWORD *)self->size = v2;
}

- (unsigned)semantic_label
{
  return self->semantic_label;
}

- (void)setSemantic_label:(unsigned __int8)a3
{
  self->unsigned __int8 semantic_label = a3;
}

- (NSUUID)object_id
{
  return self->object_id;
}

- (void)setObject_id:(id)a3
{
}

- (void).cxx_destruct
{
}

@end