@interface QLStringWrapper
- (NSAttributedString)string;
- (NSDictionary)attributes;
- (void)setAttributes:(id)a3;
- (void)setString:(id)a3;
@end

@implementation QLStringWrapper

- (NSAttributedString)string
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setString:(id)a3
{
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end