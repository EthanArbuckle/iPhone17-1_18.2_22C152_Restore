@interface PAReplayKitAccess
+ (BOOL)supportsSecureCoding;
+ (id)accessWithAccessor:(id)a3;
+ (id)accessWithAccessor:(id)a3 fromBroadcaster:(id)a4;
+ (id)eventStreamIdentifier;
- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4;
- (PAApplication)broadcaster;
- (PAReplayKitAccess)initWithAccessor:(id)a3;
- (PAReplayKitAccess)initWithAccessor:(id)a3 broadcaster:(id)a4 identifier:(id)a5 kind:(int64_t)a6;
- (PAReplayKitAccess)initWithAccessor:(id)a3 fromBroadcaster:(id)a4;
- (PAReplayKitAccess)initWithCoder:(id)a3;
- (PAReplayKitAccess)initWithProto:(id)a3;
- (PAReplayKitAccess)initWithProtoData:(id)a3;
- (id)JSONObject;
- (id)category;
- (id)copyWithNewBroadcaster:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)proto;
- (unint64_t)hashWithOptions:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PAReplayKitAccess

+ (id)accessWithAccessor:(id)a3 fromBroadcaster:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithAccessor:v7 fromBroadcaster:v6];

  return v8;
}

+ (id)accessWithAccessor:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAccessor:v4];

  return v5;
}

+ (id)eventStreamIdentifier
{
  return @"com.apple.privacy.accounting.stream.replay-kit";
}

- (PAReplayKitAccess)initWithAccessor:(id)a3 fromBroadcaster:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PAReplayKitAccess;
  v8 = [(PAAccess *)&v11 initWithAccessor:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_broadcaster, a4);
  }

  return v9;
}

- (PAReplayKitAccess)initWithAccessor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAReplayKitAccess;
  return [(PAAccess *)&v4 initWithAccessor:a3];
}

- (PAReplayKitAccess)initWithAccessor:(id)a3 broadcaster:(id)a4 identifier:(id)a5 kind:(int64_t)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PAReplayKitAccess;
  v12 = [(PAAccess *)&v15 initWithAccessor:a3 identifier:a5 kind:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_broadcaster, a4);
  }

  return v13;
}

- (id)category
{
  return @"screenRecording";
}

- (id)JSONObject
{
  v7.receiver = self;
  v7.super_class = (Class)PAReplayKitAccess;
  v3 = [(PAAccess *)&v7 JSONObject];
  objc_super v4 = (void *)[v3 mutableCopy];

  v5 = [(PAApplication *)self->_broadcaster JSONObject];
  [v4 setObject:v5 forKeyedSubscript:@"broadcaster"];

  return v4;
}

- (unint64_t)hashWithOptions:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PAReplayKitAccess;
  unint64_t v4 = [(PAAccess *)&v6 hashWithOptions:a3];
  return [(PAApplication *)self->_broadcaster hash] - v4 + 32 * v4;
}

- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PAReplayKitAccess;
  if ([(PAAccess *)&v13 isEqualToAccess:v6 withOptions:a4])
  {
    broadcaster = self->_broadcaster;
    v8 = [v6 broadcaster];
    if (broadcaster == v8)
    {
      char v11 = 1;
    }
    else
    {
      v9 = self->_broadcaster;
      v10 = [v6 broadcaster];
      char v11 = [(PAApplication *)v9 isEqual:v10];
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithNewBroadcaster:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PAReplayKitAccess *)self copy];
  objc_super v7 = (void *)v6;
  if (v6) {
    objc_storeStrong((id *)(v6 + 72), a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PAReplayKitAccess;
  unint64_t v4 = [(PAAccess *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ broadcaster:<%@>", v4, self->_broadcaster];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAReplayKitAccess)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PAReplayKitAccess;
  id v5 = [(PAAccess *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"broadcaster"];
    broadcaster = v5->_broadcaster;
    v5->_broadcaster = (PAApplication *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PAReplayKitAccess;
  id v4 = a3;
  [(PAAccess *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_broadcaster, @"broadcaster", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PAReplayKitAccess;
  objc_super v5 = -[PAAccess copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    id v6 = [(PAApplication *)self->_broadcaster copyWithZone:a3];
    objc_super v7 = (void *)v5[9];
    v5[9] = v6;
  }
  return v5;
}

- (PAReplayKitAccess)initWithProto:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 access];
    v14.receiver = self;
    v14.super_class = (Class)PAReplayKitAccess;
    self = [(PAAccess *)&v14 initWithProto:v6];

    if (self)
    {
      objc_super v7 = [PAApplication alloc];
      v8 = [v5 broadcaster];
      objc_super v9 = [(PAApplication *)v7 initWithProto:v8];
      broadcaster = self->_broadcaster;
      self->_broadcaster = v9;

      char v11 = self;
    }

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PAReplayKitAccess)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[PAPBReplayKitAccess alloc] initWithData:v4];

    id v6 = [(PAReplayKitAccess *)self initWithProto:v5];
    self = v6;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)PAReplayKitAccess;
  id v4 = [(PAAccess *)&v8 proto];
  if (v4)
  {
    [v3 setAccess:v4];
    id v5 = [(PAApplication *)self->_broadcaster proto];
    [v3 setBroadcaster:v5];

    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (PAApplication)broadcaster
{
  return self->_broadcaster;
}

- (void).cxx_destruct
{
}

@end