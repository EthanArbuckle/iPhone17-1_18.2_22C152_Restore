@interface STS18013RequestElement
- (NSString)name;
- (STS18013RequestElement)initWithName:(id)a3 retention:(unsigned __int16)a4;
- (unsigned)retention;
- (void)setName:(id)a3;
- (void)setRetention:(unsigned __int16)a3;
@end

@implementation STS18013RequestElement

- (STS18013RequestElement)initWithName:(id)a3 retention:(unsigned __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STS18013RequestElement;
  v8 = [(STS18013RequestElement *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_retention = a4;
  }

  return v9;
}

- (unsigned)retention
{
  return self->_retention;
}

- (void)setRetention:(unsigned __int16)a3
{
  self->_retention = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end