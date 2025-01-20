@interface PPTokenCount
- (NSString)token;
- (PPTokenCount)initWithToken:(id)a3 count:(unsigned int)a4;
- (unsigned)count;
- (void)setCount:(unsigned int)a3;
- (void)setToken:(id)a3;
@end

@implementation PPTokenCount

- (void).cxx_destruct
{
}

- (void)setCount:(unsigned int)a3
{
  self->_count = a3;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setToken:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (PPTokenCount)initWithToken:(id)a3 count:(unsigned int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPTokenCount;
  v8 = [(PPTokenCount *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_token, a3);
    v9->_count = a4;
  }

  return v9;
}

@end