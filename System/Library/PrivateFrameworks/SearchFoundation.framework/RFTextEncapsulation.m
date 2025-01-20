@interface RFTextEncapsulation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasStyle;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFTextEncapsulation)initWithCoder:(id)a3;
- (RFTextEncapsulation)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStyle:(int)a3;
@end

@implementation RFTextEncapsulation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)style
{
  return self->_style;
}

- (unint64_t)hash
{
  return [(RFTextEncapsulation *)self style];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RFTextEncapsulation *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(RFTextEncapsulation *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int v6 = [(RFTextEncapsulation *)self style];
    int v7 = [(RFTextEncapsulation *)v5 style];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStyle:", -[RFTextEncapsulation style](self, "style"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFTextEncapsulation alloc] initWithFacade:self];
  v3 = [(_SFPBRFTextEncapsulation *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFTextEncapsulation alloc] initWithFacade:self];
  v3 = [(_SFPBRFTextEncapsulation *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v6 = [[_SFPBRFTextEncapsulation alloc] initWithFacade:self];
  v5 = [(_SFPBRFTextEncapsulation *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFTextEncapsulation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v6 = [[_SFPBRFTextEncapsulation alloc] initWithData:v5];
  int v7 = [(RFTextEncapsulation *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasStyle
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_style = a3;
}

- (RFTextEncapsulation)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RFTextEncapsulation;
  v5 = [(RFTextEncapsulation *)&v8 init];
  if (v5)
  {
    if ([v4 style]) {
      -[RFTextEncapsulation setStyle:](v5, "setStyle:", [v4 style]);
    }
    int v6 = v5;
  }

  return v5;
}

@end