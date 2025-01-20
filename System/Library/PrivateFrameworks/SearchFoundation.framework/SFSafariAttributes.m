@interface SFSafariAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)hasHideReason;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFSafariAttributes)initWithCoder:(id)a3;
- (SFSafariAttributes)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)hideReason;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHideReason:(int)a3;
@end

@implementation SFSafariAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)hideReason
{
  return self->_hideReason;
}

- (unint64_t)hash
{
  return [(SFSafariAttributes *)self hideReason];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFSafariAttributes *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(SFSafariAttributes *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int v6 = [(SFSafariAttributes *)self hideReason];
    int v7 = [(SFSafariAttributes *)v5 hideReason];

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
  objc_msgSend(v4, "setHideReason:", -[SFSafariAttributes hideReason](self, "hideReason"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSafariAttributes alloc] initWithFacade:self];
  v3 = [(_SFPBSafariAttributes *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSafariAttributes alloc] initWithFacade:self];
  v3 = [(_SFPBSafariAttributes *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v6 = [[_SFPBSafariAttributes alloc] initWithFacade:self];
  v5 = [(_SFPBSafariAttributes *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFSafariAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v6 = [[_SFPBSafariAttributes alloc] initWithData:v5];
  int v7 = [(SFSafariAttributes *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasHideReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHideReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hideReason = a3;
}

- (SFSafariAttributes)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFSafariAttributes;
  v5 = [(SFSafariAttributes *)&v8 init];
  if (v5)
  {
    if ([v4 hideReason]) {
      -[SFSafariAttributes setHideReason:](v5, "setHideReason:", [v4 hideReason]);
    }
    int v6 = v5;
  }

  return v5;
}

@end