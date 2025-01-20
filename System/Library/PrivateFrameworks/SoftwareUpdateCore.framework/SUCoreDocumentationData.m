@interface SUCoreDocumentationData
+ (BOOL)supportsSecureCoding;
- (NSData)license;
- (NSData)readme;
- (NSData)readmeSummary;
- (NSString)humanReadableUpdateName;
- (NSString)humanReadableUpdateTitle;
- (NSString)humanReadableUpdateVersion;
- (SUCoreDocumentationData)init;
- (SUCoreDocumentationData)initWithCoder:(id)a3;
- (SUCoreDocumentationData)initWithDocumentationDataDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setHumanReadableUpdateTitle:(id)a3;
- (void)setHumanReadableUpdateVersion:(id)a3;
- (void)setLicense:(id)a3;
- (void)setReadme:(id)a3;
- (void)setReadmeSummary:(id)a3;
@end

@implementation SUCoreDocumentationData

- (SUCoreDocumentationData)init
{
  return [(SUCoreDocumentationData *)self initWithDocumentationDataDictionary:0];
}

- (SUCoreDocumentationData)initWithDocumentationDataDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUCoreDocumentationData;
  v5 = [(SUCoreDocumentationData *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ReadMe"];
    readme = v5->_readme;
    v5->_readme = (NSData *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"ReadMeSummary"];
    readmeSummary = v5->_readmeSummary;
    v5->_readmeSummary = (NSData *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"License"];
    license = v5->_license;
    v5->_license = (NSData *)v10;

    v12 = [v4 objectForKeyedSubscript:@"HumanReadableUpdateName"];
    if (v12)
    {
      uint64_t v13 = [[NSString alloc] initWithData:v12 encoding:4];
      humanReadableUpdateName = v5->_humanReadableUpdateName;
      v5->_humanReadableUpdateName = (NSString *)v13;
    }
    v15 = [v4 objectForKeyedSubscript:@"HumanReadableUpdateTitle"];
    if (v15)
    {
      uint64_t v16 = [[NSString alloc] initWithData:v15 encoding:4];
      humanReadableUpdateTitle = v5->_humanReadableUpdateTitle;
      v5->_humanReadableUpdateTitle = (NSString *)v16;
    }
    v18 = [v4 objectForKeyedSubscript:@"HumanReadableUpdateVersion"];
    if (v18)
    {
      uint64_t v19 = [[NSString alloc] initWithData:v18 encoding:4];
      humanReadableUpdateVersion = v5->_humanReadableUpdateVersion;
      v5->_humanReadableUpdateVersion = (NSString *)v19;
    }
  }

  return v5;
}

- (id)summary
{
  v18 = NSString;
  uint64_t v19 = [(SUCoreDocumentationData *)self humanReadableUpdateName];
  if (v19) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  v17 = v3;
  id v4 = [(SUCoreDocumentationData *)self humanReadableUpdateTitle];
  if (v4) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  uint64_t v16 = v5;
  uint64_t v6 = [(SUCoreDocumentationData *)self humanReadableUpdateVersion];
  if (v6) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  uint64_t v8 = [(SUCoreDocumentationData *)self readme];
  if (v8) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  uint64_t v10 = [(SUCoreDocumentationData *)self readmeSummary];
  if (v10) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = [(SUCoreDocumentationData *)self license];
  if (v12) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  v14 = [v18 stringWithFormat:@"SUCoreDocumentationData(humanReadableUpdateName:%@|humanReadableUpdateTitle:%@|humanReadableUpdateVersion:%@|readMe:%@|readMeSummary:%@|license:%@)", v17, v16, v7, v9, v11, v13];

  return v14;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithString:@"SUCoreDocumentationData:\n"];
  id v4 = [(SUCoreDocumentationData *)self humanReadableUpdateName];
  [v3 appendFormat:@"humanReadableUpdateName:\n%@\n", v4];

  v5 = [(SUCoreDocumentationData *)self humanReadableUpdateTitle];
  [v3 appendFormat:@"humanReadableUpdateTitle:\n%@\n", v5];

  uint64_t v6 = [(SUCoreDocumentationData *)self humanReadableUpdateVersion];
  [v3 appendFormat:@"humanReadableUpdateVersion:\n%@\n", v6];

  v7 = [(SUCoreDocumentationData *)self readme];
  [v3 appendFormat:@"readme:\n%@\n", v7];

  uint64_t v8 = [(SUCoreDocumentationData *)self readmeSummary];
  [v3 appendFormat:@"readmeSummary:\n%@\n", v8];

  v9 = [(SUCoreDocumentationData *)self license];
  [v3 appendFormat:@"license:\n%@\n", v9];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreDocumentationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUCoreDocumentationData;
  v5 = [(SUCoreDocumentationData *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateName"];
    humanReadableUpdateName = v5->_humanReadableUpdateName;
    v5->_humanReadableUpdateName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateTitle"];
    humanReadableUpdateTitle = v5->_humanReadableUpdateTitle;
    v5->_humanReadableUpdateTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateVersion"];
    humanReadableUpdateVersion = v5->_humanReadableUpdateVersion;
    v5->_humanReadableUpdateVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReadMe"];
    readme = v5->_readme;
    v5->_readme = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReadMeSummary"];
    readmeSummary = v5->_readmeSummary;
    v5->_readmeSummary = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"License"];
    license = v5->_license;
    v5->_license = (NSData *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SUCoreDocumentationData *)self humanReadableUpdateName];
  [v4 encodeObject:v5 forKey:@"HumanReadableUpdateName"];

  uint64_t v6 = [(SUCoreDocumentationData *)self humanReadableUpdateTitle];
  [v4 encodeObject:v6 forKey:@"HumanReadableUpdateTitle"];

  v7 = [(SUCoreDocumentationData *)self humanReadableUpdateVersion];
  [v4 encodeObject:v7 forKey:@"HumanReadableUpdateVersion"];

  uint64_t v8 = [(SUCoreDocumentationData *)self readme];
  [v4 encodeObject:v8 forKey:@"ReadMe"];

  v9 = [(SUCoreDocumentationData *)self readmeSummary];
  [v4 encodeObject:v9 forKey:@"ReadMeSummary"];

  id v10 = [(SUCoreDocumentationData *)self license];
  [v4 encodeObject:v10 forKey:@"License"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(SUCoreDocumentationData *)self humanReadableUpdateName];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setHumanReadableUpdateName:v7];

  uint64_t v8 = [(SUCoreDocumentationData *)self humanReadableUpdateTitle];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setHumanReadableUpdateTitle:v9];

  id v10 = [(SUCoreDocumentationData *)self humanReadableUpdateVersion];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setHumanReadableUpdateVersion:v11];

  uint64_t v12 = [(SUCoreDocumentationData *)self readme];
  uint64_t v13 = (void *)[v12 copyWithZone:a3];
  [v5 setReadme:v13];

  uint64_t v14 = [(SUCoreDocumentationData *)self readmeSummary];
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setReadmeSummary:v15];

  uint64_t v16 = [(SUCoreDocumentationData *)self license];
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setLicense:v17];

  return v5;
}

- (NSString)humanReadableUpdateName
{
  return self->_humanReadableUpdateName;
}

- (void)setHumanReadableUpdateName:(id)a3
{
}

- (NSString)humanReadableUpdateTitle
{
  return self->_humanReadableUpdateTitle;
}

- (void)setHumanReadableUpdateTitle:(id)a3
{
}

- (NSString)humanReadableUpdateVersion
{
  return self->_humanReadableUpdateVersion;
}

- (void)setHumanReadableUpdateVersion:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_readmeSummary, 0);
  objc_storeStrong((id *)&self->_readme, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateVersion, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateTitle, 0);

  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
}

@end