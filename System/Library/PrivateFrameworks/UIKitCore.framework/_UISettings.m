@interface _UISettings
+ (BOOL)_supportsArchivingCustomClass:(Class)a3;
+ (BOOL)_supportsArchivingStructType:(id)a3;
+ (id)_archiveDictionaryForObject:(id)a3 ofCustomClass:(Class)a4;
+ (id)_archiveDictionaryForValue:(id)a3 ofStructType:(id)a4;
+ (id)_colorFromDictionary:(id)a3;
+ (id)_dictionaryForColor:(id)a3;
+ (id)_dictionaryForFont:(id)a3;
+ (id)_fontFromDictionary:(id)a3;
+ (id)_objectOfCustomClass:(Class)a3 fromArchiveDictionary:(id)a4;
+ (id)_valueOfStructType:(id)a3 fromArchiveDictionary:(id)a4;
+ (id)settingsFromArchiveFile:(id)a3 error:(id *)a4;
- (BOOL)archiveToFile:(id)a3 error:(id *)a4;
- (BOOL)restoreFromArchiveFile:(id)a3 error:(id *)a4;
- (_UISettings)initWithDefaultValues;
@end

@implementation _UISettings

- (_UISettings)initWithDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)_UISettings;
  v2 = [(PTSettings *)&v5 initWithDefaultValues];
  v3 = v2;
  if (v2) {
    [(PTSettings *)v2 _setObservationEnabled:1];
  }
  return v3;
}

+ (id)settingsFromArchiveFile:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v6 = _ArchivePath(a3);
  if (!v6)
  {
    NSLog(&cfstr_ErrorReadingSe.isa);
    v9 = 0;
    goto LABEL_21;
  }
  v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6 options:0 error:a4];
  if (!v7)
  {
    if (a4)
    {
      v10 = [*a4 localizedDescription];
    }
    else
    {
      v10 = &stru_1ED0E84C0;
    }
    uint64_t v16 = objc_opt_class();
    NSLog(&cfstr_ErrorReadingSe_0.isa, v16, v6, v10);

    v9 = 0;
    goto LABEL_20;
  }
  v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:a4];
  if (!v8)
  {
    if (a4)
    {
      v11 = [*a4 localizedDescription];
    }
    else
    {
      v11 = &stru_1ED0E84C0;
    }
    uint64_t v17 = objc_opt_class();
    NSLog(&cfstr_ErrorUnseriali.isa, v17, v6, v11);

LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F281F8];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = @"Non-dictionary plist";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      *a4 = [v12 errorWithDomain:v13 code:0 userInfo:v14];
    }
    uint64_t v15 = objc_opt_class();
    NSLog(&cfstr_ErrorUnarchivi.isa, v15, v6);
    goto LABEL_18;
  }
  v9 = [a1 settingsFromArchiveDictionary:v8];
LABEL_19:

LABEL_20:
LABEL_21:

  return v9;
}

- (BOOL)archiveToFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F28F98];
  v8 = [(PTSettings *)self archiveDictionary];
  v9 = [v7 dataWithPropertyList:v8 format:200 options:0 error:a4];

  if (!v9)
  {
    if (a4)
    {
      v10 = [*a4 localizedDescription];
    }
    else
    {
      v10 = &stru_1ED0E84C0;
    }
    uint64_t v14 = objc_opt_class();
    NSLog(&cfstr_ErrorSerializi.isa, v14, v10);
    goto LABEL_12;
  }
  _ArchivePath(v6);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (BOOL v11 = 1, ([v9 writeToFile:v10 options:1 error:a4] & 1) == 0))
  {
    if (a4)
    {
      v12 = [*a4 localizedDescription];
    }
    else
    {
      v12 = &stru_1ED0E84C0;
    }
    uint64_t v13 = objc_opt_class();
    NSLog(&cfstr_ErrorWritingSe.isa, v13, v10, v12);

LABEL_12:
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)restoreFromArchiveFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() settingsFromArchiveFile:v6 error:a4];

  if (v7) {
    [(_UISettings *)self setValuesFromModel:v7];
  }

  return v7 != 0;
}

+ (BOOL)_supportsArchivingCustomClass:(Class)a3
{
  return (Class)objc_opt_class() == a3 || objc_opt_class() == (void)a3;
}

+ (BOOL)_supportsArchivingStructType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"CGPoint"] & 1) != 0
    || ([v3 isEqualToString:@"CGSize"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"CGRect"];
  }

  return v4;
}

+ (id)_archiveDictionaryForObject:(id)a3 ofCustomClass:(Class)a4
{
  id v6 = a3;
  if ((Class)objc_opt_class() == a4)
  {
    uint64_t v8 = [a1 _dictionaryForColor:v6];
  }
  else
  {
    if ((Class)objc_opt_class() != a4)
    {
      v7 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = [a1 _dictionaryForFont:v6];
  }
  v7 = (void *)v8;
LABEL_7:

  return v7;
}

+ (id)_archiveDictionaryForValue:(id)a3 ofStructType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"CGPoint"])
  {
    [v5 CGPointValue];
    CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v11);
LABEL_7:
    CFDictionaryRef v8 = DictionaryRepresentation;
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"CGSize"])
  {
    [v5 CGSizeValue];
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v12);
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"CGRect"])
  {
    [v5 CGRectValue];
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v13);
    goto LABEL_7;
  }
  CFDictionaryRef v8 = 0;
LABEL_8:

  return v8;
}

+ (id)_objectOfCustomClass:(Class)a3 fromArchiveDictionary:(id)a4
{
  id v6 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v8 = [a1 _colorFromDictionary:v6];
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      v7 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = [a1 _fontFromDictionary:v6];
  }
  v7 = (void *)v8;
LABEL_7:

  return v7;
}

+ (id)_valueOfStructType:(id)a3 fromArchiveDictionary:(id)a4
{
  id v5 = a3;
  CFDictionaryRef v6 = (const __CFDictionary *)a4;
  if ([v5 isEqualToString:@"CGPoint"])
  {
    v11.origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
    if (CGPointMakeWithDictionaryRepresentation(v6, &v11.origin))
    {
      uint64_t v7 = [MEMORY[0x1E4F29238] valueWithCGPoint:*(_OWORD *)&v11.origin];
LABEL_10:
      v9 = (void *)v7;
      goto LABEL_12;
    }
  }
  else if ([v5 isEqualToString:@"CGSize"])
  {
    v11.origin = (CGPoint)*MEMORY[0x1E4F1DB30];
    if (CGSizeMakeWithDictionaryRepresentation(v6, (CGSize *)&v11))
    {
      uint64_t v7 = [MEMORY[0x1E4F29238] valueWithCGSize:*(_OWORD *)&v11.origin];
      goto LABEL_10;
    }
  }
  else if ([v5 isEqualToString:@"CGRect"])
  {
    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v11.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v11.size = v8;
    if (CGRectMakeWithDictionaryRepresentation(v6, &v11))
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", *(_OWORD *)&v11.origin, *(_OWORD *)&v11.size);
      goto LABEL_10;
    }
  }
  v9 = 0;
LABEL_12:

  return v9;
}

+ (id)_colorFromDictionary:(id)a3
{
  id v3 = a3;
  char v4 = _NumberForKey(v3, @"red");
  id v5 = _NumberForKey(v3, @"green");
  CFDictionaryRef v6 = _NumberForKey(v3, @"blue");
  uint64_t v7 = _NumberForKey(v3, @"alpha");

  CGSize v8 = 0;
  if (v4 && v5 && v6 && v7)
  {
    [v4 floatValue];
    double v10 = v9;
    [v5 floatValue];
    double v12 = v11;
    [v6 floatValue];
    double v14 = v13;
    [v7 floatValue];
    CGSize v8 = +[UIColor colorWithRed:v10 green:v12 blue:v14 alpha:v15];
  }

  return v8;
}

+ (id)_dictionaryForColor:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  double v11 = 0.0;
  double v12 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  id v3 = 0;
  if ([a3 getRed:&v12 green:&v11 blue:&v10 alpha:&v9])
  {
    v13[0] = @"red";
    char v4 = [NSNumber numberWithDouble:v12];
    v14[0] = v4;
    v13[1] = @"green";
    id v5 = [NSNumber numberWithDouble:v11];
    v14[1] = v5;
    v13[2] = @"blue";
    CFDictionaryRef v6 = [NSNumber numberWithDouble:v10];
    v14[2] = v6;
    v13[3] = @"alpha";
    uint64_t v7 = [NSNumber numberWithDouble:v9];
    v14[3] = v7;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  }
  return v3;
}

+ (id)_fontFromDictionary:(id)a3
{
  id v3 = a3;
  char v4 = [v3 objectForKey:@"fontName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = _NumberForKey(v3, @"fontSize");

  CGSize v8 = 0;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    [v7 floatValue];
    CGSize v8 = [off_1E52D39B8 fontWithName:v6 size:v10];
  }

  return v8;
}

+ (id)_dictionaryForFont:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v11[0] = @"fontName";
    id v3 = a3;
    char v4 = [v3 fontName];
    v11[1] = @"fontSize";
    v12[0] = v4;
    id v5 = NSNumber;
    [v3 pointSize];
    double v7 = v6;

    CGSize v8 = [v5 numberWithDouble:v7];
    v12[1] = v8;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  }
  else
  {
    BOOL v9 = 0;
  }
  return v9;
}

@end