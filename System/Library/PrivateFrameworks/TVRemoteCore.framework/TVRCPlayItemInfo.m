@interface TVRCPlayItemInfo
+ (BOOL)supportsSecureCoding;
+ (id)playItemWithDictionary:(id)a3;
+ (id)playItemWithMediaIdentifier:(id)a3 kind:(unint64_t)a4;
+ (id)playItemWithURL:(id)a3;
- (BOOL)hasMediaIdentifierAndKind;
- (BOOL)hasURL;
- (BOOL)isValid;
- (NSNumber)kind;
- (NSString)mediaIdentifier;
- (NSURL)url;
- (TVRCPlayItemInfo)initWithCoder:(id)a3;
- (TVRCPlayItemInfo)initWithMediaIdentifier:(id)a3 kind:(id)a4 url:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TVRCPlayItemInfo

+ (id)playItemWithMediaIdentifier:(id)a3 kind:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [NSNumber numberWithUnsignedInteger:a4];
  v9 = (void *)[v7 initWithMediaIdentifier:v6 kind:v8 url:0];

  return v9;
}

+ (id)playItemWithURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithMediaIdentifier:0 kind:0 url:v4];

  return v5;
}

+ (id)playItemWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"IdentifierKey"];
  id v6 = [v4 objectForKeyedSubscript:@"KindKey"];
  id v7 = [v4 objectForKeyedSubscript:@"TVRCURLKey"];

  v8 = [NSURL URLWithString:v7];
  v9 = (void *)[objc_alloc((Class)a1) initWithMediaIdentifier:v5 kind:v6 url:v8];

  return v9;
}

- (id)dictionaryRepresentation
{
  v14[2] = *MEMORY[0x263EF8340];
  if ([(TVRCPlayItemInfo *)self hasMediaIdentifierAndKind])
  {
    v13[0] = @"IdentifierKey";
    v3 = [(TVRCPlayItemInfo *)self mediaIdentifier];
    v14[0] = v3;
    v13[1] = @"KindKey";
    id v4 = [(TVRCPlayItemInfo *)self kind];
    v14[1] = v4;
    v5 = NSDictionary;
    id v6 = (void **)v14;
    id v7 = (__CFString **)v13;
    uint64_t v8 = 2;
LABEL_5:
    v9 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:v8];

    goto LABEL_7;
  }
  if ([(TVRCPlayItemInfo *)self hasURL])
  {
    v11 = @"TVRCURLKey";
    v3 = [(TVRCPlayItemInfo *)self url];
    id v4 = [v3 absoluteString];
    v12 = v4;
    v5 = NSDictionary;
    id v6 = &v12;
    id v7 = &v11;
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  v9 = (void *)MEMORY[0x263EFFA78];
LABEL_7:

  return v9;
}

- (BOOL)isValid
{
  if ([(TVRCPlayItemInfo *)self hasMediaIdentifierAndKind]) {
    return 1;
  }

  return [(TVRCPlayItemInfo *)self hasURL];
}

- (BOOL)hasMediaIdentifierAndKind
{
  v3 = [(TVRCPlayItemInfo *)self mediaIdentifier];
  if (v3)
  {
    id v4 = [(TVRCPlayItemInfo *)self kind];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasURL
{
  v2 = [(TVRCPlayItemInfo *)self url];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [(TVRCPlayItemInfo *)self mediaIdentifier];
  id v7 = [(TVRCPlayItemInfo *)self kind];
  uint64_t v8 = [(TVRCPlayItemInfo *)self url];
  v9 = [v3 stringWithFormat:@"<%@ %p: mediaIdentifier: %@ kind: %@ url: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(TVRCPlayItemInfo *)self mediaIdentifier];
  id v6 = [(TVRCPlayItemInfo *)self kind];
  id v7 = [(TVRCPlayItemInfo *)self url];
  uint64_t v8 = (void *)[v4 initWithMediaIdentifier:v5 kind:v6 url:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCPlayItemInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TVRCPlayItemInfo;
  BOOL v5 = [(TVRCPlayItemInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaIdentifier"];
    mediaIdentifier = v5->_mediaIdentifier;
    v5->_mediaIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    kind = v5->_kind;
    v5->_kind = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  mediaIdentifier = self->_mediaIdentifier;
  id v5 = a3;
  [v5 encodeObject:mediaIdentifier forKey:@"mediaIdentifier"];
  [v5 encodeObject:self->_kind forKey:@"kind"];
  [v5 encodeObject:self->_url forKey:@"url"];
}

- (TVRCPlayItemInfo)initWithMediaIdentifier:(id)a3 kind:(id)a4 url:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TVRCPlayItemInfo;
  v12 = [(TVRCPlayItemInfo *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaIdentifier, a3);
    objc_storeStrong((id *)&v13->_kind, a4);
    objc_storeStrong((id *)&v13->_url, a5);
  }

  return v13;
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (NSNumber)kind
{
  return self->_kind;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
}

@end