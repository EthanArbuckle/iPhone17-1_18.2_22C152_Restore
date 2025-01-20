@interface BRCServerZoneHealthState
+ (BOOL)supportsSecureCoding;
- (BRCServerZoneHealthState)initWithCKInfo:(id)a3 state:(int)a4;
- (BRCServerZoneHealthState)initWithCoder:(id)a3;
- (BRCServerZoneHealthState)initWithServerZoneHealthState:(id)a3;
- (BRFieldCKInfo)ckInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BRCServerZoneHealthState

- (BRCServerZoneHealthState)initWithCKInfo:(id)a3 state:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCServerZoneHealthState;
  v8 = [(BRCServerZoneHealthState *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_ckInfo, a3);
    v9->_state = a4;
  }

  return v9;
}

- (BRCServerZoneHealthState)initWithServerZoneHealthState:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCServerZoneHealthState;
  v5 = [(BRCServerZoneHealthState *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_ckInfo, *((id *)v4 + 2));
    v6->_state = *((_DWORD *)v4 + 2);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithServerZoneHealthState:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCServerZoneHealthState)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCServerZoneHealthState;
  v5 = [(BRCServerZoneHealthState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ckinfo"];
    ckInfo = v5->_ckInfo;
    v5->_ckInfo = (BRFieldCKInfo *)v6;

    v5->_state = [v4 decodeInt32ForKey:@"state"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ckInfo = self->_ckInfo;
  id v5 = a3;
  [v5 encodeObject:ckInfo forKey:@"ckinfo"];
  [v5 encodeInt32:self->_state forKey:@"state"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(BRFieldCKInfo *)self->_ckInfo etag];
  id v5 = (void *)v4;
  uint64_t state = self->_state;
  if (state > 2) {
    id v7 = @"unknown";
  }
  else {
    id v7 = off_2650851B0[state];
  }
  objc_super v8 = [v3 stringWithFormat:@"zone-health{etag:%@,state:%@}", v4, v7];

  return v8;
}

- (BRFieldCKInfo)ckInfo
{
  return self->_ckInfo;
}

- (int)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end