@interface NTKPhotoAnalysis
+ (BOOL)_dictionaryHasValidValues:(id)a3;
+ (BOOL)_dictionaryPassesBasicCheck:(id)a3;
+ (BOOL)isValidDictionary:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)analysisWithImage:(id)a3 alignment:(unint64_t)a4 deviceSizeClass:(unint64_t)a5;
+ (id)defaultAnalysis;
+ (id)invalidAnalysis;
- ($BBBA91DF173D22D92F8479248DC92AE7)structure;
- (BOOL)isColoredText;
- (BOOL)isComplexBackground;
- (NTKPhotoAnalysis)initWithCoder:(id)a3;
- (NTKPhotoAnalysis)initWithStructure:(id *)a3;
- (float)bgBrightness;
- (float)bgHue;
- (float)bgSaturation;
- (float)shadowBrightness;
- (float)shadowHue;
- (float)shadowSaturation;
- (float)textBrightness;
- (float)textHue;
- (float)textSaturation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsDictionary;
- (id)initFromDictionary:(id)a3;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKPhotoAnalysis

- (BOOL)isComplexBackground
{
  return self->_data.isComplexBackground;
}

- (BOOL)isColoredText
{
  return self->_data.isColoredText;
}

- (float)textHue
{
  return self->_data.textHue;
}

- (float)textSaturation
{
  return self->_data.textSaturation;
}

- (float)textBrightness
{
  return self->_data.textBrightness;
}

- (float)bgHue
{
  return self->_data.bgHue;
}

- (float)bgSaturation
{
  return self->_data.bgSaturation;
}

- (float)bgBrightness
{
  return self->_data.bgBrightness;
}

- (float)shadowHue
{
  return self->_data.shadowHue;
}

- (float)shadowSaturation
{
  return self->_data.shadowSaturation;
}

- (float)shadowBrightness
{
  return self->_data.shadowBrightness;
}

- ($BBBA91DF173D22D92F8479248DC92AE7)structure
{
  long long v3 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var5 = v3;
  *(void *)&retstr->var9 = *(void *)&self[1].var0;
  return self;
}

+ (BOOL)isValidDictionary:(id)a3
{
  id v4 = a3;
  if ([a1 _dictionaryPassesBasicCheck:v4]) {
    unsigned __int8 v5 = [a1 _dictionaryHasValidValues:v4];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)_dictionaryPassesBasicCheck:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 objectForKey:@"version"];
    unsigned int v5 = [v4 integerValue];

    BOOL v6 = (v5 & 0xFFFFFFFE) == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)_dictionaryHasValidValues:(id)a3
{
  id v3 = a3;
  v22[0] = @"complexBackground";
  v22[1] = @"coloredText";
  v22[2] = @"textHue";
  v22[3] = @"textSaturation";
  v22[4] = @"textBrightness";
  v22[5] = @"bgHue";
  v22[6] = @"bgSaturation";
  v22[7] = @"bgBrightness";
  v22[8] = @"shadowHue";
  v22[9] = @"shadowSaturation";
  v22[10] = @"shadowBrightness";
  id v4 = +[NSArray arrayWithObjects:v22 count:11];
  unsigned int v5 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v6) = 1.0;
  v7 = +[NSNumber numberWithFloat:v6];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (!v13
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || [v13 compare:v5] == (id)-1)
        {

LABEL_14:
          BOOL v15 = 0;
          goto LABEL_16;
        }
        id v14 = [v13 compare:v7];

        if (v14 == (id)1) {
          goto LABEL_14;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      BOOL v15 = 1;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_16:

  return v15;
}

- (NTKPhotoAnalysis)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NTKPhotoAnalysis;
  unsigned int v5 = [(NTKPhotoAnalysis *)&v17 init];
  if (v5 && [v4 decodeInt32ForKey:@"version"] == 1)
  {
    v5->_version = 1;
    v5->_data.isComplexBackground = [v4 decodeBoolForKey:@"complexBackground"];
    v5->_data.isColoredText = [v4 decodeBoolForKey:@"coloredText"];
    [v4 decodeFloatForKey:@"textHue"];
    v5->_data.textHue = v6;
    [v4 decodeFloatForKey:@"textSaturation"];
    v5->_data.textSaturation = v7;
    [v4 decodeFloatForKey:@"textBrightness"];
    v5->_data.textBrightness = v8;
    [v4 decodeFloatForKey:@"bgHue"];
    v5->_data.bgHue = v9;
    [v4 decodeFloatForKey:@"bgSaturation"];
    v5->_data.bgSaturation = v10;
    [v4 decodeFloatForKey:@"bgBrightness"];
    v5->_data.bgBrightness = v11;
    [v4 decodeFloatForKey:@"shadowHue"];
    v5->_data.shadowHue = v12;
    [v4 decodeFloatForKey:@"shadowSaturation"];
    v5->_data.shadowSaturation = v13;
    [v4 decodeFloatForKey:@"shadowBrightness"];
    v5->_data.shadowBrightness = v14;
    BOOL v15 = v5;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NTKPhotoAnalysis;
  unsigned int v5 = [(NTKPhotoAnalysis *)&v28 init];
  if (v5 && [(id)objc_opt_class() _dictionaryPassesBasicCheck:v4])
  {
    v5->_version = 1;
    float v6 = [v4 objectForKey:@"complexBackground"];
    v5->_data.isComplexBackground = [v6 BOOLValue];

    float v7 = [v4 objectForKey:@"coloredText"];
    v5->_data.isColoredText = [v7 BOOLValue];

    float v8 = [v4 objectForKey:@"textHue"];
    [v8 floatValue];
    v5->_data.textHue = v9;

    float v10 = [v4 objectForKey:@"textSaturation"];
    [v10 floatValue];
    v5->_data.textSaturation = v11;

    float v12 = [v4 objectForKey:@"textBrightness"];
    [v12 floatValue];
    v5->_data.textBrightness = v13;

    float v14 = [v4 objectForKey:@"bgHue"];
    [v14 floatValue];
    v5->_data.bgHue = v15;

    v16 = [v4 objectForKey:@"bgSaturation"];
    [v16 floatValue];
    v5->_data.bgSaturation = v17;

    long long v18 = [v4 objectForKey:@"bgBrightness"];
    [v18 floatValue];
    v5->_data.bgBrightness = v19;

    long long v20 = [v4 objectForKey:@"shadowHue"];
    [v20 floatValue];
    v5->_data.shadowHue = v21;

    v22 = [v4 objectForKey:@"shadowSaturation"];
    [v22 floatValue];
    v5->_data.shadowSaturation = v23;

    v24 = [v4 objectForKey:@"shadowBrightness"];
    [v24 floatValue];
    v5->_data.shadowBrightness = v25;

    v26 = v5;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (NTKPhotoAnalysis)initWithStructure:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKPhotoAnalysis;
  id v4 = [(NTKPhotoAnalysis *)&v10 init];
  unsigned int v5 = (NTKPhotoAnalysis *)v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0;
    long long v7 = *(_OWORD *)&a3->var5;
    *((void *)v4 + 5) = *(void *)&a3->var9;
    *(_OWORD *)(v4 + 24) = v7;
    *(_OWORD *)(v4 + 8) = v6;
    *((_DWORD *)v4 + 12) = 1;
    float v8 = v4;
  }

  return v5;
}

+ (id)defaultAnalysis
{
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  id v2 = [objc_alloc((Class)a1) initWithStructure:v4];
  return v2;
}

+ (id)invalidAnalysis
{
  v4[0] = xmmword_10002BA04;
  v4[1] = *(_OWORD *)algn_10002BA14;
  uint64_t v5 = 0;
  id v2 = [objc_alloc((Class)a1) initWithStructure:v4];
  return v2;
}

+ (id)analysisWithImage:(id)a3 alignment:(unint64_t)a4 deviceSizeClass:(unint64_t)a5
{
  id v7 = a3;
  float v8 = (CGImage *)[v7 CGImage];
  size_t Width = CGImageGetWidth(v8);
  size_t Height = CGImageGetHeight(v8);
  unint64_t v11 = CLKDeviceCategoryForSizeClass() - 1;
  if (v11 >= 5)
  {
    float v25 = [a1 invalidAnalysis];
  }
  else
  {
    double v12 = (double)Width;
    double v13 = (double)Height;
    double v14 = dbl_10002BA30[v11];
    double v15 = dbl_10002BA80[v11];
    double v16 = dbl_10002BAA8[v11];
    double v17 = dbl_10002BAD0[v11];
    double v18 = (double)Width / (double)Height;
    if (v18 > v17 / v14) {
      double v12 = v17 / v14 * (double)Height;
    }
    else {
      double v13 = (double)Width / (v17 / v14);
    }
    double v27 = v12;
    double v29 = v13;
    if (v18 > v17 / v14) {
      double v19 = 0.0;
    }
    else {
      double v19 = ((double)Height - (double)Width / (v17 / v14)) * 0.5;
    }
    if (v18 > v17 / v14) {
      double v20 = ((double)Width - v17 / v14 * (double)Height) * 0.5;
    }
    else {
      double v20 = 0.0;
    }
    v34.origin.CGFloat x = 0.0;
    v34.origin.y = 0.0;
    v34.size.width = dbl_10002BAD0[v11];
    v34.size.height = dbl_10002BA30[v11];
    CGRect v35 = CGRectInset(v34, dbl_10002BA58[v11], dbl_10002BA58[v11]);
    CGFloat x = v35.origin.x;
    CGFloat v22 = v35.size.width;
    if (a4 == 1) {
      double v16 = CGRectGetMaxY(v35) - v15;
    }
    *(CGFloat *)v31 = x;
    *(double *)&v31[1] = v16;
    *(CGFloat *)&v31[2] = v22;
    *(double *)&v31[3] = v15;
    float v23 = +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v31, "{CGRect={CGPoint=dd}{CGSize=dd}}", *(void *)&v27, *(void *)&v29);
    v32 = v23;
    v24 = +[NSArray arrayWithObjects:&v32 count:1];
    float v25 = NTKAnalyzePhoto(v7, v24, 0, v20, v19, v28, v30, v17, v14);
  }
  return v25;
}

- (id)encodeAsDictionary
{
  id v3 = objc_opt_new();
  [v3 setObject:&off_100035C20 forKeyedSubscript:@"version"];
  id v4 = +[NSNumber numberWithBool:self->_data.isComplexBackground];
  [v3 setObject:v4 forKeyedSubscript:@"complexBackground"];

  uint64_t v5 = +[NSNumber numberWithBool:self->_data.isColoredText];
  [v3 setObject:v5 forKeyedSubscript:@"coloredText"];

  *(float *)&double v6 = self->_data.textHue;
  id v7 = +[NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKeyedSubscript:@"textHue"];

  *(float *)&double v8 = self->_data.textSaturation;
  float v9 = +[NSNumber numberWithFloat:v8];
  [v3 setObject:v9 forKeyedSubscript:@"textSaturation"];

  *(float *)&double v10 = self->_data.textBrightness;
  unint64_t v11 = +[NSNumber numberWithFloat:v10];
  [v3 setObject:v11 forKeyedSubscript:@"textBrightness"];

  *(float *)&double v12 = self->_data.bgHue;
  double v13 = +[NSNumber numberWithFloat:v12];
  [v3 setObject:v13 forKeyedSubscript:@"bgHue"];

  *(float *)&double v14 = self->_data.bgSaturation;
  double v15 = +[NSNumber numberWithFloat:v14];
  [v3 setObject:v15 forKeyedSubscript:@"bgSaturation"];

  *(float *)&double v16 = self->_data.bgBrightness;
  double v17 = +[NSNumber numberWithFloat:v16];
  [v3 setObject:v17 forKeyedSubscript:@"bgBrightness"];

  *(float *)&double v18 = self->_data.shadowHue;
  double v19 = +[NSNumber numberWithFloat:v18];
  [v3 setObject:v19 forKeyedSubscript:@"shadowHue"];

  *(float *)&double v20 = self->_data.shadowSaturation;
  float v21 = +[NSNumber numberWithFloat:v20];
  [v3 setObject:v21 forKeyedSubscript:@"shadowSaturation"];

  *(float *)&double v22 = self->_data.shadowBrightness;
  float v23 = +[NSNumber numberWithFloat:v22];
  [v3 setObject:v23 forKeyedSubscript:@"shadowBrightness"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  [v13 encodeInt32:1 forKey:@"version"];
  [v13 encodeBool:self->_data.isComplexBackground forKey:@"complexBackground"];
  [v13 encodeBool:self->_data.isColoredText forKey:@"coloredText"];
  *(float *)&double v4 = self->_data.textHue;
  [v13 encodeFloat:@"textHue" forKey:v4];
  *(float *)&double v5 = self->_data.textSaturation;
  [v13 encodeFloat:@"textSaturation" forKey:v5];
  *(float *)&double v6 = self->_data.textBrightness;
  [v13 encodeFloat:@"textBrightness" forKey:v6];
  *(float *)&double v7 = self->_data.bgHue;
  [v13 encodeFloat:@"bgHue" forKey:v7];
  *(float *)&double v8 = self->_data.bgSaturation;
  [v13 encodeFloat:@"bgSaturation" forKey:v8];
  *(float *)&double v9 = self->_data.bgBrightness;
  [v13 encodeFloat:@"bgBrightness" forKey:v9];
  *(float *)&double v10 = self->_data.shadowHue;
  [v13 encodeFloat:@"shadowHue" forKey:v10];
  *(float *)&double v11 = self->_data.shadowSaturation;
  [v13 encodeFloat:@"shadowSaturation" forKey:v11];
  *(float *)&double v12 = self->_data.shadowBrightness;
  [v13 encodeFloat:@"shadowBrightness" forKey:v12];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  long long v5 = *(_OWORD *)&self->_data.bgHue;
  v7[0] = *(_OWORD *)&self->_data.isComplexBackground;
  v7[1] = v5;
  uint64_t v8 = *(void *)&self->_data.shadowSaturation;
  return [v4 initWithStructure:v7];
}

- (unsigned)version
{
  return self->_version;
}

@end