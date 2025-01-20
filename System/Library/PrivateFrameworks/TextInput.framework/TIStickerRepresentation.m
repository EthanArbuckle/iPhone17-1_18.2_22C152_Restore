@interface TIStickerRepresentation
+ (BOOL)supportsSecureCoding;
- (CGSize)size;
- (NSData)data;
- (NSString)role;
- (TIStickerRepresentation)initWithCoder:(id)a3;
- (TIStickerRepresentation)initWithData:(id)a3 uti:(id)a4 role:(id)a5 size:(CGSize)a6 effect:(int64_t)a7;
- (UTType)uti;
- (int64_t)effect;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setEffect:(int64_t)a3;
- (void)setRole:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setUti:(id)a3;
@end

@implementation TIStickerRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_uti, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setEffect:(int64_t)a3
{
  self->_effect = a3;
}

- (int64_t)effect
{
  return self->_effect;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRole:(id)a3
{
}

- (NSString)role
{
  return self->_role;
}

- (void)setUti:(id)a3
{
}

- (UTType)uti
{
  return self->_uti;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v6 = a3;
  [v6 encodeObject:data forKey:@"data"];
  [v6 encodeObject:self->_uti forKey:@"uti"];
  [v6 encodeObject:self->_role forKey:@"role"];
  v5 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_size objCType:"{CGSize=dd}"];
  [v6 encodeObject:v5 forKey:@"size"];

  [v6 encodeInteger:self->_effect forKey:@"effect"];
}

- (TIStickerRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TIStickerRepresentation;
  v5 = [(TIStickerRepresentation *)&v17 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    uint64_t v7 = [v6 copy];
    data = v5->_data;
    v5->_data = (NSData *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uti"];
    uint64_t v10 = [v9 copy];
    uti = v5->_uti;
    v5->_uti = (UTType *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
    uint64_t v13 = [v12 copy];
    role = v5->_role;
    v5->_role = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    [v15 getValue:&v5->_size size:16];

    v5->_effect = [v4 decodeIntegerForKey:@"effect"];
  }

  return v5;
}

- (TIStickerRepresentation)initWithData:(id)a3 uti:(id)a4 role:(id)a5 size:(CGSize)a6 effect:(int64_t)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TIStickerRepresentation;
  objc_super v17 = [(TIStickerRepresentation *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_data, a3);
    objc_storeStrong((id *)&v18->_uti, a4);
    objc_storeStrong((id *)&v18->_role, a5);
    v18->_size.CGFloat width = width;
    v18->_size.CGFloat height = height;
    v18->_effect = a7;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end