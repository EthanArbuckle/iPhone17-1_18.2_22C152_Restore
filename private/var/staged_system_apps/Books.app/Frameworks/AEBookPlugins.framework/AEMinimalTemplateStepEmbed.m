@interface AEMinimalTemplateStepEmbed
- (NSString)keyPath;
- (NSString)name;
- (void)setKeyPath:(id)a3;
- (void)setName:(id)a3;
@end

@implementation AEMinimalTemplateStepEmbed

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end