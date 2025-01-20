@interface _MBCKFileRestoreState
- (BOOL)stashedAssetDecrypted;
- (NSString)decodedAssetPath;
- (NSString)stashedAssetPath;
- (NSString)stashedResourcePath;
- (void)setDecodedAssetPath:(id)a3;
- (void)setStashedAssetDecrypted:(BOOL)a3;
- (void)setStashedAssetPath:(id)a3;
- (void)setStashedResourcePath:(id)a3;
@end

@implementation _MBCKFileRestoreState

- (NSString)decodedAssetPath
{
  return self->_decodedAssetPath;
}

- (void)setDecodedAssetPath:(id)a3
{
}

- (NSString)stashedAssetPath
{
  return self->_stashedAssetPath;
}

- (void)setStashedAssetPath:(id)a3
{
}

- (NSString)stashedResourcePath
{
  return self->_stashedResourcePath;
}

- (void)setStashedResourcePath:(id)a3
{
}

- (BOOL)stashedAssetDecrypted
{
  return self->_stashedAssetDecrypted;
}

- (void)setStashedAssetDecrypted:(BOOL)a3
{
  self->_stashedAssetDecrypted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedResourcePath, 0);
  objc_storeStrong((id *)&self->_stashedAssetPath, 0);
  objc_storeStrong((id *)&self->_decodedAssetPath, 0);
}

@end