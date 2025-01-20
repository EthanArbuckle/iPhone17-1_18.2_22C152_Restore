@interface SiriTTSTrainingAsset
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)metadata;
- (NSString)factor;
- (NSString)language;
- (NSString)name;
- (NSString)path;
- (SiriTTSTrainingAsset)initWithCoder:(id)a3;
- (SiriTTSTrainingAsset)initWithFactor:(id)a3 path:(id)a4 metadata:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compatibilityVersion;
- (int64_t)contentVersion;
- (int64_t)diskSize;
- (int64_t)hash;
- (int64_t)qualityVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriTTSTrainingAsset

- (NSString)language
{
  return (NSString *)sub_29C0(self, (uint64_t)a2, (void (*)(void))SiriTTSTrainingAsset.language.getter);
}

- (NSString)name
{
  return (NSString *)sub_29C0(self, (uint64_t)a2, (void (*)(void))SiriTTSTrainingAsset.name.getter);
}

- (int64_t)diskSize
{
  v2 = self;
  int64_t v3 = SiriTTSTrainingAsset.diskSize.getter();

  return v3;
}

- (int64_t)qualityVersion
{
  v2 = self;
  int64_t v3 = SiriTTSTrainingAsset.qualityVersion.getter();

  return v3;
}

- (int64_t)compatibilityVersion
{
  v2 = self;
  int64_t v3 = SiriTTSTrainingAsset.compatibilityVersion.getter();

  return v3;
}

- (int64_t)contentVersion
{
  v2 = self;
  int64_t v3 = SiriTTSTrainingAsset.contentVersion.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_202A24();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = SiriTTSTrainingAsset.isEqual(_:)((uint64_t)v8);

  sub_525C((uint64_t)v8, &qword_2780B0);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = SiriTTSTrainingAsset.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return static SiriTTSTrainingAsset.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SiriTTSTrainingAsset.encode(with:)((NSCoder)v4);
}

- (SiriTTSTrainingAsset)initWithCoder:(id)a3
{
  return (SiriTTSTrainingAsset *)SiriTTSTrainingAsset.init(coder:)(a3);
}

- (SiriTTSTrainingAsset)initWithFactor:(id)a3 path:(id)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SiriTTSTrainingAsset;
  v12 = [(SiriTTSTrainingAsset *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_factor, a3);
    objc_storeStrong((id *)&v13->_path, a4);
    objc_storeStrong((id *)&v13->_metadata, a5);
    v14 = v13;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SiriTTSTrainingAsset allocWithZone:a3];
  v5 = [(SiriTTSTrainingAsset *)self factor];
  char v6 = [(SiriTTSTrainingAsset *)self path];
  v7 = [(SiriTTSTrainingAsset *)self metadata];
  v8 = [(SiriTTSTrainingAsset *)v4 initWithFactor:v5 path:v6 metadata:v7];

  return v8;
}

- (NSString)factor
{
  return self->_factor;
}

- (NSString)path
{
  return self->_path;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_factor, 0);
}

@end