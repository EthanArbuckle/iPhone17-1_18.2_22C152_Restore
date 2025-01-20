@interface MBCKFileAssetMetadata
- (BOOL)stashedAssetIsDecrypted;
- (MBCKFileAssetMetadata)initWithStashedAssetPath:(id)a3 stashedAssetIsDecrypted:(BOOL)a4 decodedAssetPath:(id)a5;
- (NSString)decodedAssetPath;
- (NSString)stashedAssetPath;
- (void)setDecodedAssetPath:(id)a3;
- (void)setStashedAssetIsDecrypted:(BOOL)a3;
- (void)setStashedAssetPath:(id)a3;
@end

@implementation MBCKFileAssetMetadata

- (MBCKFileAssetMetadata)initWithStashedAssetPath:(id)a3 stashedAssetIsDecrypted:(BOOL)a4 decodedAssetPath:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MBCKFileAssetMetadata;
  v10 = [(MBCKFileAssetMetadata *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(MBCKFileAssetMetadata *)v10 setStashedAssetPath:v8];
    [(MBCKFileAssetMetadata *)v11 setStashedAssetIsDecrypted:v6];
    [(MBCKFileAssetMetadata *)v11 setDecodedAssetPath:v9];
  }

  return v11;
}

- (NSString)stashedAssetPath
{
  return self->_stashedAssetPath;
}

- (void)setStashedAssetPath:(id)a3
{
}

- (BOOL)stashedAssetIsDecrypted
{
  return self->_stashedAssetIsDecrypted;
}

- (void)setStashedAssetIsDecrypted:(BOOL)a3
{
  self->_stashedAssetIsDecrypted = a3;
}

- (NSString)decodedAssetPath
{
  return self->_decodedAssetPath;
}

- (void)setDecodedAssetPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodedAssetPath, 0);
  objc_storeStrong((id *)&self->_stashedAssetPath, 0);
}

@end