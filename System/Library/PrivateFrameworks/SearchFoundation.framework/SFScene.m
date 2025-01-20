@interface SFScene
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSceneIdentifier;
- (BOOL)hasSceneType;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFScene)initWithCoder:(id)a3;
- (SFScene)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)sceneType;
- (unint64_t)hash;
- (unint64_t)sceneIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setSceneIdentifier:(unint64_t)a3;
- (void)setSceneType:(int)a3;
@end

@implementation SFScene

- (SFScene)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFScene;
  v5 = [(SFScene *)&v8 init];
  if (v5)
  {
    if ([v4 sceneIdentifier]) {
      -[SFScene setSceneIdentifier:](v5, "setSceneIdentifier:", [v4 sceneIdentifier]);
    }
    if ([v4 sceneType]) {
      -[SFScene setSceneType:](v5, "setSceneType:", [v4 sceneType]);
    }
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)sceneType
{
  return self->_sceneType;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SFScene *)self sceneIdentifier];
  return v3 ^ [(SFScene *)self sceneType];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFScene *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(SFScene *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    unint64_t v6 = [(SFScene *)self sceneIdentifier];
    if (v6 == [(SFScene *)v5 sceneIdentifier])
    {
      int v7 = [(SFScene *)self sceneType];
      BOOL v8 = v7 == [(SFScene *)v5 sceneType];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSceneIdentifier:", -[SFScene sceneIdentifier](self, "sceneIdentifier"));
  objc_msgSend(v4, "setSceneType:", -[SFScene sceneType](self, "sceneType"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBScene alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBScene *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBScene alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBScene *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBScene alloc] initWithFacade:self];
  v5 = [(_SFPBScene *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFScene)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBScene alloc] initWithData:v5];
  int v7 = [(SFScene *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasSceneType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSceneType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sceneType = a3;
}

- (BOOL)hasSceneIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSceneIdentifier:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sceneIdentifier = a3;
}

@end