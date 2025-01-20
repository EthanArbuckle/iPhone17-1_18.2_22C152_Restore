@interface ICASPalettePositionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPalettePosition)paletteEndPosition;
- (ICASPalettePosition)paletteStartPosition;
- (ICASPalettePositionData)initWithPaletteStartPosition:(id)a3 paletteEndPosition:(id)a4;
- (id)toDict;
@end

@implementation ICASPalettePositionData

- (ICASPalettePositionData)initWithPaletteStartPosition:(id)a3 paletteEndPosition:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASPalettePositionData;
  v9 = [(ICASPalettePositionData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paletteStartPosition, a3);
    objc_storeStrong((id *)&v10->_paletteEndPosition, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"PalettePositionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"paletteStartPosition";
  v3 = [(ICASPalettePositionData *)self paletteStartPosition];
  if (v3)
  {
    uint64_t v4 = [(ICASPalettePositionData *)self paletteStartPosition];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"paletteEndPosition";
  v12[0] = v4;
  v6 = [(ICASPalettePositionData *)self paletteEndPosition];
  if (v6)
  {
    uint64_t v7 = [(ICASPalettePositionData *)self paletteEndPosition];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (ICASPalettePosition)paletteStartPosition
{
  return self->_paletteStartPosition;
}

- (ICASPalettePosition)paletteEndPosition
{
  return self->_paletteEndPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paletteEndPosition, 0);
  objc_storeStrong((id *)&self->_paletteStartPosition, 0);
}

@end