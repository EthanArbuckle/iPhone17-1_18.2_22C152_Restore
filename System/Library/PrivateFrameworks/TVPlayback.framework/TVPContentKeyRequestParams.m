@interface TVPContentKeyRequestParams
- (NSArray)keyFormatVersions;
- (NSString)keyIdentifier;
- (void)setKeyFormatVersions:(id)a3;
- (void)setKeyIdentifier:(id)a3;
@end

@implementation TVPContentKeyRequestParams

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (NSArray)keyFormatVersions
{
  return self->_keyFormatVersions;
}

- (void)setKeyFormatVersions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFormatVersions, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end