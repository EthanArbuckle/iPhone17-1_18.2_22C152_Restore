@interface TZDAssetDetectedMsg
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)assetVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TZDAssetDetectedMsg

+ (id)options
{
  if (qword_100026058[0] != -1) {
    dispatch_once(qword_100026058, &stru_100020BB0);
  }
  v2 = (void *)qword_100026050;

  return v2;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TZDAssetDetectedMsg;
  v3 = [(TZDAssetDetectedMsg *)&v7 description];
  v4 = [(TZDAssetDetectedMsg *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  assetVersion = self->_assetVersion;
  if (assetVersion) {
    [v3 setObject:assetVersion forKey:@"assetVersion"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000300C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_assetVersion) {
    sub_100019D04();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_assetVersion copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    assetVersion = self->_assetVersion;
    if ((unint64_t)assetVersion | v4[1]) {
      unsigned __int8 v6 = -[NSString isEqual:](assetVersion, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_assetVersion hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[TZDAssetDetectedMsg setAssetVersion:](self, "setAssetVersion:");
  }
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end