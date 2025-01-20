@interface ICASPaletteEngagementData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPaletteEngagementData)initWithPaletteEngagementType:(id)a3;
- (ICASPaletteEngagementType)paletteEngagementType;
- (id)toDict;
@end

@implementation ICASPaletteEngagementData

- (ICASPaletteEngagementData)initWithPaletteEngagementType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASPaletteEngagementData;
  v6 = [(ICASPaletteEngagementData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_paletteEngagementType, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"PaletteEngagementData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"paletteEngagementType";
  v3 = [(ICASPaletteEngagementData *)self paletteEngagementType];
  if (v3)
  {
    uint64_t v4 = [(ICASPaletteEngagementData *)self paletteEngagementType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (void *)v4;
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (ICASPaletteEngagementType)paletteEngagementType
{
  return self->_paletteEngagementType;
}

- (void).cxx_destruct
{
}

@end