@interface MROrigin
+ (BOOL)supportsSecureCoding;
+ (MROrigin)anyOrigin;
+ (MROrigin)localOrigin;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHosted;
- (BOOL)isLocal;
- (BOOL)isLocallyHosted;
- (MROrigin)initWithCoder:(id)a3;
- (MROrigin)initWithData:(id)a3;
- (MROrigin)initWithIdentifier:(int)a3 type:(int64_t)a4 displayName:(id)a5;
- (MROrigin)initWithProtobuf:(id)a3;
- (MROrigin)skeleton;
- (MRPlayerPath)playerPath;
- (NSData)data;
- (NSString)displayName;
- (_MROriginProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)identifier;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(int)a3;
- (void)setLocal:(BOOL)a3;
- (void)setLocallyHosted:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MROrigin

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(id)objc_opt_class() localOrigin];

  if (v4 == self)
  {
    return self;
  }
  else
  {
    v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
    objc_msgSend(v5, "setIdentifier:", -[MROrigin identifier](self, "identifier"));
    objc_msgSend(v5, "setType:", -[MROrigin type](self, "type"));
    v6 = [(MROrigin *)self displayName];
    v7 = (void *)[v6 copyWithZone:a3];
    [v5 setDisplayName:v7];

    objc_msgSend(v5, "setLocallyHosted:", -[MROrigin isLocallyHosted](self, "isLocallyHosted"));
    return v5;
  }
}

+ (MROrigin)localOrigin
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__MROrigin_localOrigin__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localOrigin_onceToken != -1) {
    dispatch_once(&localOrigin_onceToken, block);
  }
  v2 = (void *)localOrigin_origin;

  return (MROrigin *)v2;
}

- (BOOL)isLocal
{
  return self->_type == 0;
}

- (void)setLocallyHosted:(BOOL)a3
{
  self->_locallyHosted = a3;
}

- (void)setDisplayName:(id)a3
{
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

- (_MROriginProtobuf)protobuf
{
  v3 = objc_alloc_init(_MROriginProtobuf);
  if ([(MROrigin *)self type] == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [(_MROriginProtobuf *)v3 setType:v4];
  [(_MROriginProtobuf *)v3 setHasType:[(MROrigin *)self type] != 0];
  v5 = [(MROrigin *)self displayName];
  [(_MROriginProtobuf *)v3 setDisplayName:v5];

  [(_MROriginProtobuf *)v3 setIdentifier:[(MROrigin *)self identifier]];
  [(_MROriginProtobuf *)v3 setHasIdentifier:[(MROrigin *)self identifier] != 0];
  [(_MROriginProtobuf *)v3 setIsLocallyHosted:[(MROrigin *)self isLocallyHosted]];
  [(_MROriginProtobuf *)v3 setHasIsLocallyHosted:[(MROrigin *)self isLocallyHosted]];

  return v3;
}

- (int)identifier
{
  return self->_identifier;
}

- (BOOL)isLocallyHosted
{
  return self->_locallyHosted;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (MROrigin)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 identifier];
    int v7 = [v5 type];
    if (v7 == 2 || v6 != 1280262988)
    {
      BOOL v9 = v7 == 2;
      v10 = [v5 displayName];
      self = [(MROrigin *)self initWithIdentifier:v6 type:v9 displayName:v10];

      -[MROrigin setLocallyHosted:](self, "setLocallyHosted:", [v5 isLocallyHosted]);
      v8 = self;
    }
    else
    {
      v8 = [(id)objc_opt_class() localOrigin];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_identifier;
}

+ (MROrigin)anyOrigin
{
  id v2 = objc_alloc_init((Class)a1);

  return (MROrigin *)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MROrigin *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int v6 = [(MROrigin *)v5 identifier];
      if (v6 == [(MROrigin *)self identifier])
      {
        uint64_t v7 = [(MROrigin *)v5 type];
        BOOL v8 = v7 == [(MROrigin *)self type];
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
  }

  return v8;
}

- (MROrigin)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MROriginProtobuf alloc] initWithData:v4];

    self = [(MROrigin *)self initWithProtobuf:v5];
    int v6 = self;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

void __23__MROrigin_localOrigin__block_invoke_2()
{
  id v0 = (id)MSVCopyLocalizedModelName();
  [(id)localOrigin_origin setDisplayName:v0];
}

void __23__MROrigin_localOrigin__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithIdentifier:1280262988 type:0 displayName:@"Loading…"];
  id v2 = (void *)localOrigin_origin;
  localOrigin_origin = v1;

  [(id)localOrigin_origin setLocallyHosted:1];
  v3 = dispatch_get_global_queue(21, 0);
  dispatch_async(v3, &__block_literal_global_25);
}

- (MROrigin)initWithIdentifier:(int)a3 type:(int64_t)a4 displayName:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MROrigin;
  BOOL v9 = [(MROrigin *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_identifier = a3;
    v9->_type = a4;
    uint64_t v11 = [v8 copy];
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v11;
  }
  return v10;
}

- (BOOL)isHosted
{
  if ([(MROrigin *)self isLocal]) {
    return 0;
  }

  return [(MROrigin *)self isLocallyHosted];
}

- (NSData)data
{
  id v2 = [(MROrigin *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MROrigin *)self data];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (MROrigin)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  int v6 = [(MROrigin *)self initWithData:v5];
  return v6;
}

- (MROrigin)skeleton
{
  id v3 = objc_alloc((Class)objc_opt_class());
  uint64_t v4 = [(MROrigin *)self identifier];
  int64_t v5 = [(MROrigin *)self type];
  int v6 = [(MROrigin *)self displayName];
  uint64_t v7 = (void *)[v3 initWithIdentifier:v4 type:v5 displayName:v6];

  return (MROrigin *)v7;
}

- (MRPlayerPath)playerPath
{
  id v2 = [[MRPlayerPath alloc] initWithOrigin:self client:0 player:0];

  return v2;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(MROrigin *)self displayName];
  uint64_t v5 = [(MROrigin *)self identifier];
  BOOL v6 = [(MROrigin *)self isLocallyHosted];
  uint64_t v7 = &stru_1EE60E7D8;
  if (v6) {
    uint64_t v7 = @":LH";
  }
  id v8 = (void *)[v3 initWithFormat:@"<origin:%@:%d%@>", v4, v5, v7];

  return v8;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
}

@end