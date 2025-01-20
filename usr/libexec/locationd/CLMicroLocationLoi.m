@interface CLMicroLocationLoi
- (CLMicroLocationLoi)initWithIdentifier:(id)a3 andType:(int64_t)a4;
- (NSUUID)loiIdentifier;
- (int64_t)type;
- (void)dealloc;
- (void)setLoiIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CLMicroLocationLoi

- (CLMicroLocationLoi)initWithIdentifier:(id)a3 andType:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLMicroLocationLoi;
  v6 = [(CLMicroLocationLoi *)&v8 init];
  if (v6)
  {
    v6->_loiIdentifier = (NSUUID *)[a3 copy];
    v6->_type = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationLoi;
  [(CLMicroLocationLoi *)&v3 dealloc];
}

- (NSUUID)loiIdentifier
{
  return self->_loiIdentifier;
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