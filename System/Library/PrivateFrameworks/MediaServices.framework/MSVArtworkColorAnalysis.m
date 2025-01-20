@interface MSVArtworkColorAnalysis
+ (BOOL)supportsSecureCoding;
- (BOOL)isBackgroundColorLight;
- (BOOL)isPrimaryTextColorLight;
- (BOOL)isSecondaryTextColorLight;
- (BOOL)isTertiaryTextColorLight;
- (MSVArtworkColorAnalysis)initWithCoder:(id)a3;
- (NSString)backgroundColorHex;
- (NSString)primaryTextColorHex;
- (NSString)secondaryTextColorHex;
- (NSString)tertiaryTextColorHex;
- (id)_copyWithClass:(Class)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColorHex:(id)a3;
- (void)setPrimaryTextColorHex:(id)a3;
- (void)setSecondaryTextColorHex:(id)a3;
- (void)setTertiaryTextColorHex:(id)a3;
- (void)setTertiaryTextColorLight:(BOOL)a3;
@end

@implementation MSVArtworkColorAnalysis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryTextColorHex, 0);
  objc_storeStrong((id *)&self->_secondaryTextColorHex, 0);
  objc_storeStrong((id *)&self->_primaryTextColorHex, 0);
  objc_storeStrong((id *)&self->_backgroundColorHex, 0);
}

- (void)setTertiaryTextColorLight:(BOOL)a3
{
  self->_tertiaryTextColorLight = a3;
}

- (BOOL)isTertiaryTextColorLight
{
  return self->_tertiaryTextColorLight;
}

- (void)setTertiaryTextColorHex:(id)a3
{
}

- (NSString)tertiaryTextColorHex
{
  return self->_tertiaryTextColorHex;
}

- (BOOL)isSecondaryTextColorLight
{
  return self->_secondaryTextColorLight;
}

- (void)setSecondaryTextColorHex:(id)a3
{
}

- (NSString)secondaryTextColorHex
{
  return self->_secondaryTextColorHex;
}

- (BOOL)isPrimaryTextColorLight
{
  return self->_primaryTextColorLight;
}

- (void)setPrimaryTextColorHex:(id)a3
{
}

- (NSString)primaryTextColorHex
{
  return self->_primaryTextColorHex;
}

- (BOOL)isBackgroundColorLight
{
  return self->_backgroundColorLight;
}

- (void)setBackgroundColorHex:(id)a3
{
}

- (NSString)backgroundColorHex
{
  return self->_backgroundColorHex;
}

- (id)_copyWithClass:(Class)a3
{
  v4 = (id *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_backgroundColorHex);
    *((unsigned char *)v5 + 16) = self->_backgroundColorLight;
    objc_storeStrong(v5 + 3, self->_primaryTextColorHex);
    *((unsigned char *)v5 + 32) = self->_primaryTextColorLight;
    objc_storeStrong(v5 + 5, self->_secondaryTextColorHex);
    *((unsigned char *)v5 + 48) = self->_secondaryTextColorLight;
    objc_storeStrong(v5 + 7, self->_tertiaryTextColorHex);
    *((unsigned char *)v5 + 64) = self->_tertiaryTextColorLight;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(MSVArtworkColorAnalysis *)self _copyWithClass:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(MSVArtworkColorAnalysis *)self backgroundColorHex];
  [v8 encodeObject:v4 forKey:@"backgroundColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MSVArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"), @"backgroundColorLight");
  v5 = [(MSVArtworkColorAnalysis *)self primaryTextColorHex];
  [v8 encodeObject:v5 forKey:@"primaryTextColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MSVArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"), @"primaryTextColorLight");
  v6 = [(MSVArtworkColorAnalysis *)self secondaryTextColorHex];
  [v8 encodeObject:v6 forKey:@"secondaryTextColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MSVArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"), @"secondaryTextColorLight");
  v7 = [(MSVArtworkColorAnalysis *)self tertiaryTextColorHex];
  [v8 encodeObject:v7 forKey:@"tertiaryTextColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MSVArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"), @"tertiaryTextColorLight");
}

- (MSVArtworkColorAnalysis)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MSVArtworkColorAnalysis *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColorHex = v5->_backgroundColorHex;
    v5->_backgroundColorHex = (NSString *)v6;

    v5->_backgroundColorLight = [v4 decodeBoolForKey:@"backgroundColorLight"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryTextColor"];
    primaryTextColorHex = v5->_primaryTextColorHex;
    v5->_primaryTextColorHex = (NSString *)v8;

    v5->_primaryTextColorLight = [v4 decodeBoolForKey:@"primaryTextColorLight"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryTextColor"];
    secondaryTextColorHex = v5->_secondaryTextColorHex;
    v5->_secondaryTextColorHex = (NSString *)v10;

    v5->_secondaryTextColorLight = [v4 decodeBoolForKey:@"secondaryTextColorLight"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tertiaryTextColor"];
    tertiaryTextColorHex = v5->_tertiaryTextColorHex;
    v5->_tertiaryTextColorHex = (NSString *)v12;

    v5->_tertiaryTextColorLight = [v4 decodeBoolForKey:@"tertiaryTextColorLight"];
  }

  return v5;
}

- (id)description
{
  v15 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v3);
  id v4 = [(MSVArtworkColorAnalysis *)self backgroundColorHex];
  if ([(MSVArtworkColorAnalysis *)self isBackgroundColorLight]) {
    v5 = @"Light";
  }
  else {
    v5 = @"Dark";
  }
  uint64_t v6 = [(MSVArtworkColorAnalysis *)self primaryTextColorHex];
  if ([(MSVArtworkColorAnalysis *)self isPrimaryTextColorLight]) {
    v7 = @"Light";
  }
  else {
    v7 = @"Dark";
  }
  uint64_t v8 = [(MSVArtworkColorAnalysis *)self secondaryTextColorHex];
  if ([(MSVArtworkColorAnalysis *)self isSecondaryTextColorLight]) {
    v9 = @"Light";
  }
  else {
    v9 = @"Dark";
  }
  uint64_t v10 = [(MSVArtworkColorAnalysis *)self tertiaryTextColorHex];
  if ([(MSVArtworkColorAnalysis *)self isTertiaryTextColorLight]) {
    v11 = @"Light";
  }
  else {
    v11 = @"Dark";
  }
  uint64_t v12 = [v15 stringWithFormat:@"<%@: %p> (\n  backgroundColor: %@ (%@)\n  primaryTextColor: %@ (%@)\n  secondaryTextColor: %@ (%@)\n  tertiaryTextColor: %@ (%@)\n)", v14, self, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end