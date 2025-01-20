@interface _UIStickerRepresentation
+ (BOOL)supportsSecureCoding;
- (CGSize)size;
- (NSData)data;
- (NSString)role;
- (NSString)type;
- (_UIStickerRepresentation)initWithCoder:(id)a3;
- (id)createPNGDataFromHEICData;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setRole:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setType:(id)a3;
@end

@implementation _UIStickerRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIStickerRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIStickerRepresentation;
  v5 = [(_UIStickerRepresentation *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v8;

    [v4 decodeCGSizeForKey:@"size"];
    v5->_size.width = v10;
    v5->_size.height = v11;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
    role = v5->_role;
    v5->_role = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_UIStickerRepresentation *)self data];
  [v4 encodeObject:v5 forKey:@"data"];

  uint64_t v6 = [(_UIStickerRepresentation *)self type];
  [v4 encodeObject:v6 forKey:@"type"];

  [(_UIStickerRepresentation *)self size];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"size");
  id v7 = [(_UIStickerRepresentation *)self role];
  [v4 encodeObject:v7 forKey:@"role"];
}

- (id)createPNGDataFromHEICData
{
  v3 = [(_UIStickerRepresentation *)self type];
  id v4 = [(id)*MEMORY[0x1E4F443E0] identifier];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1E050]);
    id v7 = [(_UIStickerRepresentation *)self data];
    uint64_t v8 = (void *)[v6 initWithData:v7];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1E018]);
    CGFloat v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    CGFloat v11 = [v9 PNGRepresentationOfImage:v8 format:*MEMORY[0x1E4F1E2F0] colorSpace:v10 options:MEMORY[0x1E4F1CC08]];
    CGColorSpaceRelease(v10);
  }
  else
  {
    CGFloat v11 = 0;
  }
  return v11;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end