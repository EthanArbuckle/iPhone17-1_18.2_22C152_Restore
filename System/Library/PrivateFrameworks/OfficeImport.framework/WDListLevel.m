@interface WDListLevel
- (BOOL)imageBullet;
- (BOOL)imageBulletOverridden;
- (BOOL)justificationOverridden;
- (BOOL)legacy;
- (BOOL)legal;
- (BOOL)legalOverridden;
- (BOOL)numberFormatOverridden;
- (BOOL)restartLevelOverridden;
- (BOOL)restartNumbering;
- (BOOL)restartNumberingOverridden;
- (BOOL)startNumberOverridden;
- (BOOL)suffixOverridden;
- (BOOL)textOverridden;
- (WDListLevel)initWithDocument:(id)a3;
- (id)characterProperties;
- (id)description;
- (id)image;
- (id)paragraphProperties;
- (id)text;
- (int)justification;
- (int)numberFormat;
- (int)suffix;
- (int64_t)legacyIndent;
- (int64_t)legacySpace;
- (int64_t)restartLevel;
- (int64_t)startNumber;
- (void)setImage:(id)a3;
- (void)setJustification:(int)a3;
- (void)setLegacy:(BOOL)a3;
- (void)setLegacyIndent:(int64_t)a3;
- (void)setLegacySpace:(int64_t)a3;
- (void)setLegal:(BOOL)a3;
- (void)setNumberFormat:(int)a3;
- (void)setRestartLevel:(int64_t)a3;
- (void)setRestartNumbering:(BOOL)a3;
- (void)setStartNumber:(int64_t)a3;
- (void)setSuffix:(int)a3;
- (void)setText:(id)a3;
@end

@implementation WDListLevel

- (WDListLevel)initWithDocument:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WDListLevel;
  v5 = [(WDListLevel *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v6->mStartNumber = 0;
    v6->mNumberFormat = 0;
    v6->mRestartNumbering = 1;
    v6->mRestartLevel = -1;
    v6->mLegal = 0;
    v6->mSuffix = 0;
    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    mText = v6->mText;
    v6->mText = v7;

    v6->mLegacy = 0;
    v6->mLegacySpace = 0;
    v6->mLegacyIndent = 0;
    v6->mJustification = 0;
    v9 = [[WDParagraphProperties alloc] initWithDocument:v4];
    mParagraphProperties = v6->mParagraphProperties;
    v6->mParagraphProperties = v9;

    v11 = [[WDCharacterProperties alloc] initWithDocument:v4];
    mCharacterProperties = v6->mCharacterProperties;
    v6->mCharacterProperties = v11;
  }
  return v6;
}

- (id)paragraphProperties
{
  return self->mParagraphProperties;
}

- (id)characterProperties
{
  return self->mCharacterProperties;
}

- (void)setStartNumber:(int64_t)a3
{
  self->mStartNumber = a3;
}

- (void)setNumberFormat:(int)a3
{
  self->mNumberFormat = a3;
}

- (void)setRestartNumbering:(BOOL)a3
{
  self->mRestartNumbering = a3;
}

- (void)setLegal:(BOOL)a3
{
  self->mLegal = a3;
}

- (void)setSuffix:(int)a3
{
  self->mSuffix = a3;
}

- (void)setText:(id)a3
{
}

- (void)setLegacy:(BOOL)a3
{
  self->mLegacy = a3;
}

- (void)setLegacySpace:(int64_t)a3
{
  self->mLegacySpace = a3;
}

- (void)setLegacyIndent:(int64_t)a3
{
  self->mLegacyIndent = a3;
}

- (void)setJustification:(int)a3
{
  self->mJustification = a3;
}

- (int64_t)startNumber
{
  return self->mStartNumber;
}

- (int)numberFormat
{
  return self->mNumberFormat;
}

- (id)text
{
  return self->mText;
}

- (void)setImage:(id)a3
{
}

- (BOOL)startNumberOverridden
{
  return 1;
}

- (BOOL)numberFormatOverridden
{
  return 1;
}

- (BOOL)imageBullet
{
  return [(WDCharacterProperties *)self->mCharacterProperties isListCharacterPictureBullet];
}

- (BOOL)imageBulletOverridden
{
  return [(WDCharacterProperties *)self->mCharacterProperties isListCharacterPictureBulletOverridden];
}

- (id)image
{
  return self->mImage;
}

- (BOOL)restartNumbering
{
  return self->mRestartNumbering;
}

- (BOOL)restartNumberingOverridden
{
  return 1;
}

- (int64_t)restartLevel
{
  return self->mRestartLevel;
}

- (void)setRestartLevel:(int64_t)a3
{
  self->mRestartLevel = a3;
}

- (BOOL)restartLevelOverridden
{
  return self->mRestartLevel >= 0;
}

- (BOOL)legal
{
  return self->mLegal;
}

- (BOOL)legalOverridden
{
  return 1;
}

- (int)suffix
{
  return self->mSuffix;
}

- (BOOL)suffixOverridden
{
  return 1;
}

- (BOOL)textOverridden
{
  return 1;
}

- (BOOL)legacy
{
  return self->mLegacy;
}

- (int64_t)legacySpace
{
  return self->mLegacySpace;
}

- (int64_t)legacyIndent
{
  return self->mLegacyIndent;
}

- (int)justification
{
  return self->mJustification;
}

- (BOOL)justificationOverridden
{
  return 1;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDListLevel;
  v2 = [(WDListLevel *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mText, 0);
  objc_storeStrong((id *)&self->mImage, 0);
  objc_storeStrong((id *)&self->mCharacterProperties, 0);
  objc_storeStrong((id *)&self->mParagraphProperties, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end