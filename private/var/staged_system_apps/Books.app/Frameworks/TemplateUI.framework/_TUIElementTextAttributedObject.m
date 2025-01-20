@interface _TUIElementTextAttributedObject
- (NSAttributedString)string;
- (NSString)role;
- (void)setRole:(id)a3;
- (void)setString:(id)a3;
@end

@implementation _TUIElementTextAttributedObject

- (NSAttributedString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end