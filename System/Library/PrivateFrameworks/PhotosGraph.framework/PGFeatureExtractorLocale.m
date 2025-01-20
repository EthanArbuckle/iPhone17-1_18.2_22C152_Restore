@interface PGFeatureExtractorLocale
- (NSLocale)currentLocale;
- (PGFeatureExtractorLocale)init;
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
- (void)setCurrentLocale:(id)a3;
@end

@implementation PGFeatureExtractorLocale

- (void).cxx_destruct
{
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4F71EF8], "zerosOfCount:", -[PGFeatureExtractorLocale featureLength](self, "featureLength", a3, a4));
  v6 = [(PGFeatureExtractorLocale *)self featureNames];
  v7 = [(PGFeatureExtractorLocale *)self currentLocale];
  v8 = [v7 localeIdentifier];
  uint64_t v9 = [v6 indexOfObject:v8];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v9;
  }
  LODWORD(v10) = 1.0;
  [v5 setFloat:v11 atIndex:v10];
  return v5;
}

- (int64_t)featureLength
{
  return 21;
}

- (id)featureNames
{
  v4[21] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Other";
  v4[1] = @"en_US";
  v4[2] = @"zh_CN";
  v4[3] = @"ja_JP";
  v4[4] = @"pt_BR";
  v4[5] = @"en_GB";
  v4[6] = @"es_MX";
  v4[7] = @"de_DE";
  v4[8] = @"en_CA";
  v4[9] = @"it_IT";
  v4[10] = @"ru_RU";
  v4[11] = @"tr_TR";
  v4[12] = @"fr_FR";
  v4[13] = @"en_AU";
  v4[14] = @"ko_KR";
  v4[15] = @"es_ES";
  v4[16] = @"es_US";
  v4[17] = @"en_IN";
  v4[18] = @"vi_VN";
  v4[19] = @"nl_NL";
  v4[20] = @"th_TH";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:21];
  return v2;
}

- (id)name
{
  v2 = @"Locale";
  return @"Locale";
}

- (void)setCurrentLocale:(id)a3
{
}

- (NSLocale)currentLocale
{
  return self->_currentLocale;
}

- (PGFeatureExtractorLocale)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGFeatureExtractorLocale;
  v2 = [(PGFeatureExtractorLocale *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    currentLocale = v2->_currentLocale;
    v2->_currentLocale = (NSLocale *)v3;
  }
  return v2;
}

@end