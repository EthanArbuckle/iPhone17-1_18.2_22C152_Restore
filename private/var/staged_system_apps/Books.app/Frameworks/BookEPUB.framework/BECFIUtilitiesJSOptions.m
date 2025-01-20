@interface BECFIUtilitiesJSOptions
- (BECFIUtilitiesJSOptions)init;
- (BECFIUtilitiesJSOptions)initWithManifestId:(id)a3 assetId:(id)a4 chapterIndex:(unint64_t)a5 spineIndex:(unint64_t)a6;
- (NSString)assetId;
- (NSString)jsonRepresentation;
- (NSString)manifestId;
- (id)_dictionaryRepresentation;
- (id)description;
- (unint64_t)chapterIndex;
- (unint64_t)spineIndex;
@end

@implementation BECFIUtilitiesJSOptions

- (BECFIUtilitiesJSOptions)init
{
  return [(BECFIUtilitiesJSOptions *)self initWithManifestId:&stru_3D7B70 assetId:&stru_3D7B70 chapterIndex:0 spineIndex:0];
}

- (BECFIUtilitiesJSOptions)initWithManifestId:(id)a3 assetId:(id)a4 chapterIndex:(unint64_t)a5 spineIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BECFIUtilitiesJSOptions;
  v12 = [(BECFIUtilitiesJSOptions *)&v18 init];
  if (v12)
  {
    v13 = (NSString *)[v10 copy];
    manifestId = v12->_manifestId;
    v12->_manifestId = v13;

    v15 = (NSString *)[v11 copy];
    assetId = v12->_assetId;
    v12->_assetId = v15;

    v12->_chapterIndex = a5;
    v12->_spineIndex = a6;
  }

  return v12;
}

- (id)_dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSString *)self->_manifestId length]) {
    [v3 setObject:self->_manifestId forKeyedSubscript:@"manifestId"];
  }
  if ([(NSString *)self->_assetId length]) {
    [v3 setObject:self->_assetId forKeyedSubscript:@"assetId"];
  }
  v4 = +[NSNumber numberWithUnsignedInteger:self->_chapterIndex];
  [v3 setObject:v4 forKeyedSubscript:@"chapterIndex"];

  v5 = +[NSNumber numberWithUnsignedInteger:self->_spineIndex];
  [v3 setObject:v5 forKeyedSubscript:@"spineIndex"];

  return v3;
}

- (NSString)jsonRepresentation
{
  v2 = [(BECFIUtilitiesJSOptions *)self _dictionaryRepresentation];
  uint64_t v6 = 0;
  v3 = +[NSJSONSerialization dataWithJSONObject:v2 options:0 error:&v6];

  if ([v3 length]) {
    id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSNumber numberWithUnsignedInteger:[(BECFIUtilitiesJSOptions *)self spineIndex]];
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:[(BECFIUtilitiesJSOptions *)self chapterIndex]];
  v7 = [(BECFIUtilitiesJSOptions *)self manifestId];
  if ([v7 length])
  {
    v8 = [(BECFIUtilitiesJSOptions *)self manifestId];
    v9 = +[NSString stringWithFormat:@"<%@:%p spine:%@ chapterIndex:%@ manifestID:%@>", v4, self, v5, v6, v8];
  }
  else
  {
    v9 = +[NSString stringWithFormat:@"<%@:%p spine:%@ chapterIndex:%@ manifestID:%@>", v4, self, v5, v6, @"{none}"];
  }

  return v9;
}

- (NSString)manifestId
{
  return self->_manifestId;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (unint64_t)chapterIndex
{
  return self->_chapterIndex;
}

- (unint64_t)spineIndex
{
  return self->_spineIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetId, 0);

  objc_storeStrong((id *)&self->_manifestId, 0);
}

@end