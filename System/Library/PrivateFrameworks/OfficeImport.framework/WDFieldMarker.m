@interface WDFieldMarker
- (BOOL)hasSeparator;
- (BOOL)locked;
- (BOOL)nested;
- (BOOL)privateResult;
- (BOOL)resultDirty;
- (BOOL)resultEdited;
- (BOOL)zombieEmbed;
- (WDFieldMarker)initWithParagraph:(id)a3;
- (id)data;
- (id)description;
- (int)fieldMarkerType;
- (int)fieldPosition;
- (int)runType;
- (unsigned)fieldType;
- (void)setData:(id)a3;
- (void)setFieldMarkerType:(int)a3;
- (void)setFieldPosition:(int)a3;
- (void)setFieldType:(unsigned __int8)a3;
- (void)setHasSeparator:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)setNested:(BOOL)a3;
- (void)setPrivateResult:(BOOL)a3;
- (void)setResultDirty:(BOOL)a3;
- (void)setResultEdited:(BOOL)a3;
- (void)setZombieEmbed:(BOOL)a3;
@end

@implementation WDFieldMarker

- (WDFieldMarker)initWithParagraph:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDFieldMarker;
  v5 = [(WDRunWithCharacterProperties *)&v10 initWithParagraph:v4];
  if (v5)
  {
    v6 = [WDCharacterProperties alloc];
    v7 = [v4 document];
    v8 = [(WDCharacterProperties *)v6 initWithDocument:v7];

    [(WDCharacterProperties *)v8 setResolveMode:0];
    [(WDCharacterProperties *)v8 setSpecialCharacter:1];
    [(WDCharacterProperties *)v8 setResolveMode:2];
    [(WDRunWithCharacterProperties *)v5 setProperties:v8];
  }
  return v5;
}

- (void)setFieldPosition:(int)a3
{
  self->mFieldPosition = a3;
}

- (void)setFieldMarkerType:(int)a3
{
  self->mMarkerType = a3;
}

- (void)setFieldType:(unsigned __int8)a3
{
  self->mFieldType = a3;
}

- (int)runType
{
  return 7;
}

- (int)fieldMarkerType
{
  return self->mMarkerType;
}

- (unsigned)fieldType
{
  return self->mFieldType;
}

- (int)fieldPosition
{
  return self->mFieldPosition;
}

- (BOOL)zombieEmbed
{
  return *((unsigned char *)self + 48) & 1;
}

- (void)setZombieEmbed:(BOOL)a3
{
  *((unsigned char *)self + 48) = *((unsigned char *)self + 48) & 0xFE | a3;
}

- (BOOL)resultDirty
{
  return (*((unsigned __int8 *)self + 48) >> 1) & 1;
}

- (void)setResultDirty:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 48) = *((unsigned char *)self + 48) & 0xFD | v3;
}

- (BOOL)resultEdited
{
  return (*((unsigned __int8 *)self + 48) >> 2) & 1;
}

- (void)setResultEdited:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 48) = *((unsigned char *)self + 48) & 0xFB | v3;
}

- (BOOL)locked
{
  return (*((unsigned __int8 *)self + 48) >> 3) & 1;
}

- (void)setLocked:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 48) = *((unsigned char *)self + 48) & 0xF7 | v3;
}

- (BOOL)privateResult
{
  return (*((unsigned __int8 *)self + 48) >> 4) & 1;
}

- (void)setPrivateResult:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 48) = *((unsigned char *)self + 48) & 0xEF | v3;
}

- (BOOL)nested
{
  return (*((unsigned __int8 *)self + 48) >> 5) & 1;
}

- (void)setNested:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 48) = *((unsigned char *)self + 48) & 0xDF | v3;
}

- (BOOL)hasSeparator
{
  return (*((unsigned __int8 *)self + 48) >> 6) & 1;
}

- (void)setHasSeparator:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 48) = *((unsigned char *)self + 48) & 0xBF | v3;
}

- (id)data
{
  return self->mData;
}

- (void)setData:(id)a3
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDFieldMarker;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end