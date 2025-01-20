@interface PKMediaName
+ (id)pkMediaNameWithString:(id)a3;
- (BOOL)isRoll;
- (NSString)baseName;
- (NSString)mediaClass;
- (NSString)mediaName;
- (NSString)unitStr;
- (NSString)widthStr;
- (PKMediaName)initWithString:(id)a3;
- (double)conversionFactor;
- (double)height;
- (double)heightInUnits;
- (double)width;
- (double)widthInUnits;
- (int64_t)units;
- (void)dealloc;
- (void)parseMediaName:(id)a3;
- (void)setBaseName:(id)a3;
- (void)setConversionFactor:(double)a3;
- (void)setHeightInUnits:(double)a3;
- (void)setMediaClass:(id)a3;
- (void)setMediaName:(id)a3;
- (void)setUnits:(int64_t)a3;
- (void)setWidthInUnits:(double)a3;
- (void)setWidthStr:(id)a3;
@end

@implementation PKMediaName

+ (id)pkMediaNameWithString:(id)a3
{
  id v3 = a3;
  v4 = [[PKMediaName alloc] initWithString:v3];

  return v4;
}

- (PKMediaName)initWithString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKMediaName;
  v5 = [(PKMediaName *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(PKMediaName *)v5 setMediaName:v4];
    [(PKMediaName *)v6 parseMediaName:v4];
  }

  return v6;
}

- (void)dealloc
{
  [(PKMediaName *)self setMediaName:0];
  [(PKMediaName *)self setMediaClass:0];
  [(PKMediaName *)self setBaseName:0];
  [(PKMediaName *)self setWidthStr:0];
  v3.receiver = self;
  v3.super_class = (Class)PKMediaName;
  [(PKMediaName *)&v3 dealloc];
}

- (void)parseMediaName:(id)a3
{
  id v17 = a3;
  id v4 = strdup((const char *)[v17 UTF8String]);
  v5 = strchr(v4, 95);
  if (!v5) {
    goto LABEL_23;
  }
  char *v5 = 0;
  v6 = v5 + 1;
  v7 = strchr(v5 + 1, 95);
  if (!v7) {
    goto LABEL_23;
  }
  char *v7 = 0;
  objc_super v8 = v7 + 1;
  v9 = strchr(v7 + 1, 120);
  if (!v9) {
    goto LABEL_23;
  }
  v10 = v9 + 1;
  char *v9 = 0;
  for (i = v9 + 2; ; ++i)
  {
    uint64_t v12 = *(i - 1);
    if (((char)*(i - 1) < 0 || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v12 + 60) & 0x400) == 0) && v12 != 46) {
      break;
    }
  }
  if (v12 == 105)
  {
    if (*i == 110)
    {
      [(PKMediaName *)self setConversionFactor:2540.0];
      uint64_t v13 = 1;
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v13 = 0;
    goto LABEL_17;
  }
  if (v12 != 109 || *i != 109) {
    goto LABEL_16;
  }
  [(PKMediaName *)self setConversionFactor:100.0];
  uint64_t v13 = 2;
LABEL_17:
  *(i - 1) = 0;
  if (v13 && v8 && v4 && v6 && v10)
  {
    v14 = [NSString stringWithUTF8String:v4];
    [(PKMediaName *)self setMediaClass:v14];

    v15 = [NSString stringWithUTF8String:v6];
    [(PKMediaName *)self setBaseName:v15];

    v16 = [NSString stringWithUTF8String:v8];
    [(PKMediaName *)self setWidthStr:v16];

    [(PKMediaName *)self setWidthInUnits:atof(v8)];
    [(PKMediaName *)self setHeightInUnits:atof(v10)];
    [(PKMediaName *)self setUnits:v13];
    goto LABEL_24;
  }
LABEL_23:
  NSLog(&cfstr_SFailedOn.isa, "-[PKMediaName parseMediaName:]", v17);
LABEL_24:
  free(v4);
}

- (NSString)unitStr
{
  int64_t v2 = [(PKMediaName *)self units];
  objc_super v3 = &stru_26E251B90;
  if (v2 == 2) {
    objc_super v3 = @"mm";
  }
  if (v2 == 1) {
    return (NSString *)@"in";
  }
  else {
    return &v3->isa;
  }
}

- (BOOL)isRoll
{
  int64_t v2 = [(PKMediaName *)self mediaClass];
  char v3 = [v2 isEqualToString:@"roll"];

  return v3;
}

- (double)width
{
  [(PKMediaName *)self widthInUnits];
  double v4 = v3;
  [(PKMediaName *)self conversionFactor];
  return v4 * v5;
}

- (double)height
{
  [(PKMediaName *)self heightInUnits];
  double v4 = v3;
  [(PKMediaName *)self conversionFactor];
  return v4 * v5;
}

- (NSString)mediaName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMediaName:(id)a3
{
}

- (NSString)mediaClass
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaClass:(id)a3
{
}

- (NSString)baseName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBaseName:(id)a3
{
}

- (double)widthInUnits
{
  return self->_widthInUnits;
}

- (void)setWidthInUnits:(double)a3
{
  self->_widthInUnits = a3;
}

- (double)heightInUnits
{
  return self->_heightInUnits;
}

- (void)setHeightInUnits:(double)a3
{
  self->_heightInUnits = a3;
}

- (NSString)widthStr
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWidthStr:(id)a3
{
}

- (int64_t)units
{
  return self->_units;
}

- (void)setUnits:(int64_t)a3
{
  self->_units = a3;
}

- (double)conversionFactor
{
  return self->_conversionFactor;
}

- (void)setConversionFactor:(double)a3
{
  self->_conversionFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthStr, 0);
  objc_storeStrong((id *)&self->_baseName, 0);
  objc_storeStrong((id *)&self->_mediaClass, 0);

  objc_storeStrong((id *)&self->_mediaName, 0);
}

@end