@interface ML3ArtworkColorAnalysis
+ (BOOL)supportsSecureCoding;
- (BOOL)isBackgroundColorLight;
- (BOOL)isPrimaryTextColorLight;
- (BOOL)isSecondaryTextColorLight;
- (BOOL)isTertiaryTextColorLight;
- (ML3ArtworkColorAnalysis)initWithCoder:(id)a3;
- (ML3ArtworkColorAnalysis)initWithColorAnalysis:(id)a3;
- (ML3ArtworkColorAnalysis)initWithColorAnalysisDictionary:(id)a3;
- (NSString)backgroundColor;
- (NSString)primaryTextColor;
- (NSString)secondaryTextColor;
- (NSString)tertiaryTextColor;
- (id)dictRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ML3ArtworkColorAnalysis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (BOOL)isTertiaryTextColorLight
{
  return self->_tertiaryTextColorLight;
}

- (BOOL)isSecondaryTextColorLight
{
  return self->_secondaryTextColorLight;
}

- (BOOL)isPrimaryTextColorLight
{
  return self->_primaryTextColorLight;
}

- (BOOL)isBackgroundColorLight
{
  return self->_backgroundColorLight;
}

- (NSString)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (NSString)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (NSString)primaryTextColor
{
  return self->_primaryTextColor;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(ML3ArtworkColorAnalysis *)self backgroundColor];
  [v8 encodeObject:v4 forKey:@"backgroundColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[ML3ArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"), @"backgroundColorLight");
  v5 = [(ML3ArtworkColorAnalysis *)self primaryTextColor];
  [v8 encodeObject:v5 forKey:@"primaryTextColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[ML3ArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"), @"primaryTextColorLight");
  v6 = [(ML3ArtworkColorAnalysis *)self secondaryTextColor];
  [v8 encodeObject:v6 forKey:@"secondaryTextColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[ML3ArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"), @"secondaryTextColorLight");
  v7 = [(ML3ArtworkColorAnalysis *)self tertiaryTextColor];
  [v8 encodeObject:v7 forKey:@"tertiaryTextColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[ML3ArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"), @"tertiaryTextColorLight");
}

- (ML3ArtworkColorAnalysis)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ML3ArtworkColorAnalysis *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (NSString *)v6;

    v5->_backgroundColorLight = [v4 decodeBoolForKey:@"backgroundColorLight"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryTextColor"];
    primaryTextColor = v5->_primaryTextColor;
    v5->_primaryTextColor = (NSString *)v8;

    v5->_primaryTextColorLight = [v4 decodeBoolForKey:@"primaryTextColorLight"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryTextColor"];
    secondaryTextColor = v5->_secondaryTextColor;
    v5->_secondaryTextColor = (NSString *)v10;

    v5->_secondaryTextColorLight = [v4 decodeBoolForKey:@"secondaryTextColorLight"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tertiaryTextColor"];
    tertiaryTextColor = v5->_tertiaryTextColor;
    v5->_tertiaryTextColor = (NSString *)v12;

    v5->_tertiaryTextColorLight = [v4 decodeBoolForKey:@"tertiaryTextColorLight"];
  }

  return v5;
}

- (id)dictRepresentation
{
  v14[8] = *MEMORY[0x1E4F143B8];
  v13[0] = @"backgroundColor";
  v3 = [(ML3ArtworkColorAnalysis *)self backgroundColor];
  v14[0] = v3;
  v13[1] = @"primaryTextColor";
  id v4 = [(ML3ArtworkColorAnalysis *)self primaryTextColor];
  v14[1] = v4;
  v13[2] = @"secondaryTextColor";
  v5 = [(ML3ArtworkColorAnalysis *)self secondaryTextColor];
  v14[2] = v5;
  v13[3] = @"tertiaryTextColor";
  uint64_t v6 = [(ML3ArtworkColorAnalysis *)self tertiaryTextColor];
  v14[3] = v6;
  v13[4] = @"backgroundColorLight";
  if ([(ML3ArtworkColorAnalysis *)self isBackgroundColorLight]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v14[4] = v7;
  v13[5] = @"primaryTextColorLight";
  if ([(ML3ArtworkColorAnalysis *)self isPrimaryTextColorLight]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  v14[5] = v8;
  v13[6] = @"secondaryTextColorLight";
  if ([(ML3ArtworkColorAnalysis *)self isSecondaryTextColorLight]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v14[6] = v9;
  v13[7] = @"tertiaryTextColorLight";
  if ([(ML3ArtworkColorAnalysis *)self isTertiaryTextColorLight]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  v14[7] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v11;
}

- (ML3ArtworkColorAnalysis)initWithColorAnalysisDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ML3ArtworkColorAnalysis;
  v5 = [(ML3ArtworkColorAnalysis *)&v20 init];
  if (v5)
  {
    if (!v4)
    {
      v18 = 0;
      goto LABEL_6;
    }
    uint64_t v6 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"primaryTextColor"];
    primaryTextColor = v5->_primaryTextColor;
    v5->_primaryTextColor = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"secondaryTextColor"];
    secondaryTextColor = v5->_secondaryTextColor;
    v5->_secondaryTextColor = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"tertiaryTextColor"];
    tertiaryTextColor = v5->_tertiaryTextColor;
    v5->_tertiaryTextColor = (NSString *)v12;

    v14 = [v4 objectForKeyedSubscript:@"backgroundColorLight"];
    v5->_backgroundColorLight = [v14 isEqual:@"YES"];

    v15 = [v4 objectForKeyedSubscript:@"primaryTextColorLight"];
    v5->_primaryTextColorLight = [v15 isEqual:@"YES"];

    v16 = [v4 objectForKeyedSubscript:@"secondaryTextColorLight"];
    v5->_secondaryTextColorLight = [v16 isEqual:@"YES"];

    v17 = [v4 objectForKeyedSubscript:@"tertiaryTextColorLight"];
    v5->_tertiaryTextColorLight = [v17 isEqual:@"YES"];
  }
  v18 = v5;
LABEL_6:

  return v18;
}

- (ML3ArtworkColorAnalysis)initWithColorAnalysis:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ML3ArtworkColorAnalysis;
  v5 = [(ML3ArtworkColorAnalysis *)&v16 init];
  if (v5)
  {
    if (!v4)
    {
      v14 = 0;
      goto LABEL_6;
    }
    uint64_t v6 = [v4 backgroundColorHex];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (NSString *)v6;

    uint64_t v8 = [v4 primaryTextColorHex];
    primaryTextColor = v5->_primaryTextColor;
    v5->_primaryTextColor = (NSString *)v8;

    uint64_t v10 = [v4 secondaryTextColorHex];
    secondaryTextColor = v5->_secondaryTextColor;
    v5->_secondaryTextColor = (NSString *)v10;

    uint64_t v12 = [v4 tertiaryTextColorHex];
    tertiaryTextColor = v5->_tertiaryTextColor;
    v5->_tertiaryTextColor = (NSString *)v12;

    v5->_backgroundColorLight = [v4 isBackgroundColorLight];
    v5->_primaryTextColorLight = [v4 isPrimaryTextColorLight];
    v5->_secondaryTextColorLight = [v4 isSecondaryTextColorLight];
    v5->_tertiaryTextColorLight = [v4 isTertiaryTextColorLight];
  }
  v14 = v5;
LABEL_6:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end