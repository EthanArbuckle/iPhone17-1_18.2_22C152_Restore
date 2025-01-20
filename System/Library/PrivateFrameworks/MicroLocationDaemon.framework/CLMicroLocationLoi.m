@interface CLMicroLocationLoi
- (CLMicroLocationLoi)initWithIdentifier:(id)a3 andType:(int64_t)a4;
- (NSUUID)loiIdentifier;
- (int64_t)type;
- (void)setLoiIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CLMicroLocationLoi

- (void).cxx_destruct
{
}

- (NSUUID)loiIdentifier
{
  return self->_loiIdentifier;
}

- (CLMicroLocationLoi)initWithIdentifier:(id)a3 andType:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLMicroLocationLoi;
  v7 = [(CLMicroLocationLoi *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    loiIdentifier = v7->_loiIdentifier;
    v7->_loiIdentifier = (NSUUID *)v8;

    v7->_type = a4;
  }

  return v7;
}

- (void)setLoiIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end