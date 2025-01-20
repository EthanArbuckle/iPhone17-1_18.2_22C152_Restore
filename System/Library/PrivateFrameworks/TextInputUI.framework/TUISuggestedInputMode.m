@interface TUISuggestedInputMode
- (BOOL)enabled;
- (NSString)displayName;
- (NSString)identifier;
- (void)setDisplayName:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation TUISuggestedInputMode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

@end