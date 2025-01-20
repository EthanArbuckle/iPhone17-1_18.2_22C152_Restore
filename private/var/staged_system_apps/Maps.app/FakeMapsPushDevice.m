@interface FakeMapsPushDevice
- (BOOL)isFake;
- (FakeMapsPushDevice)initWithName:(id)a3 model:(id)a4;
- (id)colorName;
- (id)enclosureColorName;
- (id)model;
- (id)name;
@end

@implementation FakeMapsPushDevice

- (FakeMapsPushDevice)initWithName:(id)a3 model:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FakeMapsPushDevice;
  v8 = [(FakeMapsPushDevice *)&v15 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    v11 = (NSString *)[v7 copy];
    model = v8->_model;
    v8->_model = v11;

    v13 = v8;
  }

  return v8;
}

- (id)name
{
  return self->_name;
}

- (id)model
{
  return self->_model;
}

- (id)colorName
{
  return @"fe767a";
}

- (id)enclosureColorName
{
  return @"#fe767a";
}

- (BOOL)isFake
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end