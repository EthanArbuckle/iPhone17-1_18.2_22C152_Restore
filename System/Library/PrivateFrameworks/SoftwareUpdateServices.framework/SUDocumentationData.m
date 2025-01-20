@interface SUDocumentationData
+ (BOOL)supportsSecureCoding;
- (NSData)license;
- (NSData)readme;
- (NSData)readmeSummary;
- (NSString)buildVersion;
- (NSString)humanReadableUpdateName;
- (SUDocumentationData)initWithCoder:(id)a3;
- (SUDocumentationData)initWithSUCoreDocumentationData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setLicense:(id)a3;
- (void)setReadme:(id)a3;
- (void)setReadmeSummary:(id)a3;
@end

@implementation SUDocumentationData

- (SUDocumentationData)initWithSUCoreDocumentationData:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUDocumentationData;
  v5 = [(SUDocumentationData *)&v19 init];
  if (v5)
  {
    v6 = [v4 readme];
    uint64_t v7 = [v6 copy];
    readme = v5->_readme;
    v5->_readme = (NSData *)v7;

    v9 = [v4 readmeSummary];
    uint64_t v10 = [v9 copy];
    readmeSummary = v5->_readmeSummary;
    v5->_readmeSummary = (NSData *)v10;

    v12 = [v4 license];
    uint64_t v13 = [v12 copy];
    license = v5->_license;
    v5->_license = (NSData *)v13;

    v15 = [v4 humanReadableUpdateName];
    uint64_t v16 = [v15 copy];
    humanReadableUpdateName = v5->_humanReadableUpdateName;
    v5->_humanReadableUpdateName = (NSString *)v16;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUDocumentationData *)self humanReadableUpdateName];
  v5 = [(SUDocumentationData *)self readme];
  v6 = [(SUDocumentationData *)self readmeSummary];
  uint64_t v7 = [(SUDocumentationData *)self license];
  v8 = [v3 stringWithFormat:@"\n            SUDocumentationData\n            humanReadableUpdateName: %@\n            readme: %@\n            readmeSummary: %@\n            license: %@", v4, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUDocumentationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUDocumentationData;
  v5 = [(SUDocumentationData *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"humanReadableUpdateName"];
    [(SUDocumentationData *)v5 setHumanReadableUpdateName:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readMe"];
    [(SUDocumentationData *)v5 setReadme:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readMeSummary"];
    [(SUDocumentationData *)v5 setReadmeSummary:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"license"];
    [(SUDocumentationData *)v5 setLicense:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  humanReadableUpdateName = self->_humanReadableUpdateName;
  id v5 = a3;
  [v5 encodeObject:humanReadableUpdateName forKey:@"humanReadableUpdateName"];
  [v5 encodeObject:self->_readme forKey:@"readMe"];
  [v5 encodeObject:self->_readmeSummary forKey:@"readMeSummary"];
  [v5 encodeObject:self->_license forKey:@"license"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setHumanReadableUpdateName:self->_humanReadableUpdateName];
  [v4 setReadme:self->_readme];
  [v4 setReadmeSummary:self->_readmeSummary];
  [v4 setLicense:self->_license];
  return v4;
}

- (NSString)humanReadableUpdateName
{
  return self->_humanReadableUpdateName;
}

- (void)setHumanReadableUpdateName:(id)a3
{
}

- (NSData)readme
{
  return self->_readme;
}

- (void)setReadme:(id)a3
{
}

- (NSData)readmeSummary
{
  return self->_readmeSummary;
}

- (void)setReadmeSummary:(id)a3
{
}

- (NSData)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_readmeSummary, 0);
  objc_storeStrong((id *)&self->_readme, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end