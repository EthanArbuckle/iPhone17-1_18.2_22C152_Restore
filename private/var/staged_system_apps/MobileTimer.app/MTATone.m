@interface MTATone
- (BOOL)isDefaultTone;
- (MTATone)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (NSString)toneName;
- (void)setDefaultTone:(BOOL)a3;
- (void)setToneName:(id)a3;
@end

@implementation MTATone

- (MTATone)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTATone;
  v6 = [(MTATone *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_defaultTone = 0;
  }

  return v7;
}

- (NSString)name
{
  if ([(MTATone *)self isDefaultTone])
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 localizedStringForKey:@"DEFAULT_TONE_FORMAT" value:&stru_1000A2560 table:0];
    id v5 = [(MTATone *)self toneName];
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);
  }
  else
  {
    v6 = [(MTATone *)self toneName];
  }

  return (NSString *)v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)toneName
{
  return self->_toneName;
}

- (void)setToneName:(id)a3
{
}

- (BOOL)isDefaultTone
{
  return self->_defaultTone;
}

- (void)setDefaultTone:(BOOL)a3
{
  self->_defaultTone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toneName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end