@interface PALocationAccess
+ (id)eventStreamIdentifier;
- (PALocationAccess)initWithProto:(id)a3;
- (PALocationAccess)initWithProtoData:(id)a3;
- (id)category;
- (id)proto;
@end

@implementation PALocationAccess

+ (id)eventStreamIdentifier
{
  return @"com.apple.privacy.accounting.stream.location";
}

- (id)category
{
  return @"location";
}

- (PALocationAccess)initWithProto:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 access];
    v8.receiver = self;
    v8.super_class = (Class)PALocationAccess;
    self = [(PAAccess *)&v8 initWithProto:v5];

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PALocationAccess)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[PAPBLocationAccess alloc] initWithData:v4];

    v6 = [(PALocationAccess *)self initWithProto:v5];
    self = v6;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)PALocationAccess;
  id v4 = [(PAAccess *)&v7 proto];
  if (v4)
  {
    [v3 setAccess:v4];
    id v5 = v3;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end