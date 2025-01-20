@interface DYGTGPUToolsVersionInfo
+ (BOOL)supportsSecureCoding;
- (DYGTGPUToolsVersionInfo)initWithCoder:(id)a3;
- (NSDictionary)infoPlist;
- (NSDictionary)versionPlist;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)interposeVersionGL;
- (unsigned)interposeVersionMetal;
- (void)encodeWithCoder:(id)a3;
- (void)setInfoPlist:(id)a3;
- (void)setInterposeVersionGL:(unsigned int)a3;
- (void)setInterposeVersionMetal:(unsigned int)a3;
- (void)setVersionPlist:(id)a3;
@end

@implementation DYGTGPUToolsVersionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(NSDictionary *)self->_infoPlist copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSDictionary *)self->_versionPlist copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  *((_DWORD *)v5 + 2) = self->_interposeVersionGL;
  *((_DWORD *)v5 + 3) = self->_interposeVersionMetal;
  return v5;
}

- (DYGTGPUToolsVersionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DYGTGPUToolsVersionInfo;
  v5 = [(DYGTGPUToolsVersionInfo *)&v14 init];
  if (v5)
  {
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    id v6 = +[NSArray arrayWithObjects:v15 count:3];
    v7 = +[NSSet setWithArray:v6];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"infoPlist"];
    infoPlist = v5->_infoPlist;
    v5->_infoPlist = (NSDictionary *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v4 decodeDictionaryWithKeysOfClass:v10 objectsOfClass:objc_opt_class() forKey:@"versionPlist"];
    versionPlist = v5->_versionPlist;
    v5->_versionPlist = (NSDictionary *)v11;

    v5->_interposeVersionGL = [v4 decodeInt32ForKey:@"interposeVersion"];
    v5->_interposeVersionMetal = [v4 decodeInt32ForKey:@"interposeVersionMetal"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  infoPlist = self->_infoPlist;
  id v5 = a3;
  [v5 encodeObject:infoPlist forKey:@"infoPlist"];
  [v5 encodeObject:self->_versionPlist forKey:@"versionPlist"];
  [v5 encodeInt32:self->_interposeVersionGL forKey:@"interposeVersion"];
  [v5 encodeInt32:self->_interposeVersionMetal forKey:@"interposeVersionMetal"];
}

- (NSDictionary)infoPlist
{
  return self->_infoPlist;
}

- (void)setInfoPlist:(id)a3
{
}

- (NSDictionary)versionPlist
{
  return self->_versionPlist;
}

- (void)setVersionPlist:(id)a3
{
}

- (unsigned)interposeVersionGL
{
  return self->_interposeVersionGL;
}

- (void)setInterposeVersionGL:(unsigned int)a3
{
  self->_interposeVersionGL = a3;
}

- (unsigned)interposeVersionMetal
{
  return self->_interposeVersionMetal;
}

- (void)setInterposeVersionMetal:(unsigned int)a3
{
  self->_interposeVersionMetal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionPlist, 0);

  objc_storeStrong((id *)&self->_infoPlist, 0);
}

@end