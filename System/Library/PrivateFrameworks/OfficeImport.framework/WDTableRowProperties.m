@interface WDTableRowProperties
- (BOOL)header;
- (BOOL)isHeaderOverridden;
- (BOOL)isHeightOverridden;
- (BOOL)isHeightTypeOverridden;
- (BOOL)isWidthAfterOverridden;
- (BOOL)isWidthAfterTypeOverridden;
- (BOOL)isWidthBeforeOverridden;
- (BOOL)isWidthBeforeTypeOverridden;
- (WDTableRowProperties)init;
- (WDTableRowProperties)initWithDocument:(id)a3;
- (id)characterProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)tableProperties;
- (int)heightType;
- (int)resolveMode;
- (int)widthAfterType;
- (int)widthBeforeType;
- (int64_t)height;
- (signed)widthAfter;
- (signed)widthBefore;
- (void)addProperties:(id)a3;
- (void)addPropertiesValues:(id *)a3 to:(id *)a4;
- (void)setHeader:(BOOL)a3;
- (void)setHeight:(int64_t)a3;
- (void)setHeightType:(int)a3;
- (void)setResolveMode:(int)a3;
- (void)setWidthAfter:(signed __int16)a3;
- (void)setWidthAfterType:(int)a3;
- (void)setWidthBefore:(signed __int16)a3;
- (void)setWidthBeforeType:(int)a3;
@end

@implementation WDTableRowProperties

- (WDTableRowProperties)initWithDocument:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDTableRowProperties;
  v5 = [(WDTableRowProperties *)&v11 init];
  if (v5)
  {
    v6 = [[WDTableProperties alloc] initWithDocument:v4];
    mTableProperties = v5->mTableProperties;
    v5->mTableProperties = v6;

    v8 = [[WDCharacterProperties alloc] initWithDocument:v4];
    mCharacterProperties = v5->mCharacterProperties;
    v5->mCharacterProperties = v8;

    *((unsigned char *)v5 + 24) = *((unsigned char *)v5 + 24) & 0xF8 | 1;
  }

  return v5;
}

- (id)tableProperties
{
  return self->mTableProperties;
}

- (void)setResolveMode:(int)a3
{
  *((unsigned char *)self + 24) = (2 * (a3 == 1)) | (4 * (a3 == 2)) | (a3 == 0) | *((unsigned char *)self + 24) & 0xF8;
}

- (id)characterProperties
{
  return self->mCharacterProperties;
}

- (BOOL)isHeightOverridden
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    int v2 = *((unsigned char *)&self->mTrackedProperties + 28) & 0x10;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 4) == 0)
    {
      if (*((unsigned char *)self + 24)) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 4) & 1;
      }
      goto LABEL_10;
    }
    if ((*((unsigned char *)&self->mTrackedProperties + 28) & 0x10) == 0)
    {
      if ((*((unsigned char *)self + 24) & 1) != 0 || (*((unsigned char *)&self->mOriginalProperties + 28) & 0x10) != 0) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 4) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    int v2 = *((unsigned char *)&self->mTrackedProperties + 28) & 0x10;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (void)setHeightType:(int)a3
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    uint64_t v3 = 92;
    uint64_t v4 = 88;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 1) == 0) {
      return;
    }
    uint64_t v3 = 60;
    uint64_t v4 = 56;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *((unsigned char *)&self->super.isa + v3) |= 0x20u;
}

- (void)setHeight:(int64_t)a3
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    uint64_t v3 = 92;
    uint64_t v4 = 80;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 1) == 0) {
      return;
    }
    uint64_t v3 = 60;
    uint64_t v4 = 48;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *((unsigned char *)&self->super.isa + v3) |= 0x10u;
}

- (int64_t)height
{
  if ((*((unsigned char *)self + 24) & 6) != 0 && (*((unsigned char *)&self->mTrackedProperties + 28) & 0x10) != 0)
  {
    uint64_t v3 = 80;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 5) == 0 || (*((unsigned char *)&self->mOriginalProperties + 28) & 0x10) == 0) {
      return 0;
    }
    uint64_t v3 = 48;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (void)setWidthBefore:(signed __int16)a3
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    uint64_t v3 = 92;
    uint64_t v4 = 64;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 1) == 0) {
      return;
    }
    uint64_t v3 = 60;
    uint64_t v4 = 32;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *((unsigned char *)&self->super.isa + v3) |= 1u;
}

- (void)setWidthBeforeType:(int)a3
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    uint64_t v3 = 92;
    uint64_t v4 = 68;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 1) == 0) {
      return;
    }
    uint64_t v3 = 60;
    uint64_t v4 = 36;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *((unsigned char *)&self->super.isa + v3) |= 2u;
}

- (void)setHeader:(BOOL)a3
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    uint64_t v3 = 92;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 1) == 0) {
      return;
    }
    uint64_t v3 = 60;
  }
  if (a3) {
    char v4 = -64;
  }
  else {
    char v4 = 0x80;
  }
  *((unsigned char *)&self->super.isa + v3) = v4 & 0xC0 | *((unsigned char *)&self->super.isa + v3) & 0x3F;
}

- (void)setWidthAfter:(signed __int16)a3
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    uint64_t v3 = 92;
    uint64_t v4 = 72;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 1) == 0) {
      return;
    }
    uint64_t v3 = 60;
    uint64_t v4 = 40;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *((unsigned char *)&self->super.isa + v3) |= 4u;
}

- (void)setWidthAfterType:(int)a3
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    uint64_t v3 = 92;
    uint64_t v4 = 76;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 1) == 0) {
      return;
    }
    uint64_t v3 = 60;
    uint64_t v4 = 44;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *((unsigned char *)&self->super.isa + v3) |= 8u;
}

- (WDTableRowProperties)init
{
  return 0;
}

- (int)resolveMode
{
  unsigned int v2 = *((unsigned __int8 *)self + 24);
  if ((v2 & 2) != 0) {
    int v3 = 1;
  }
  else {
    int v3 = (v2 >> 1) & 2;
  }
  if (v2) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)addProperties:(id)a3
{
  uint64_t v4 = (char *)a3;
  [(WDTableRowProperties *)self addPropertiesValues:v4 + 32 to:&self->mOriginalProperties];
  [(WDTableRowProperties *)self addPropertiesValues:v4 + 64 to:&self->mTrackedProperties];
}

- (signed)widthBefore
{
  if (*((unsigned char *)self + 24) & 6) != 0 && (*((unsigned char *)&self->mTrackedProperties + 28))
  {
    uint64_t v3 = 64;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if (*((unsigned char *)self + 24) & 5) != 0 && (*((unsigned char *)&self->mOriginalProperties + 28))
  {
    uint64_t v3 = 32;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isWidthBeforeOverridden
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    uint64_t v2 = 92;
    return *((unsigned char *)&self->super.isa + v2) & 1;
  }
  if ((*((unsigned char *)self + 24) & 4) == 0)
  {
    if (*((unsigned char *)self + 24))
    {
LABEL_10:
      uint64_t v2 = 60;
      return *((unsigned char *)&self->super.isa + v2) & 1;
    }
    return 0;
  }
  if ((*((unsigned char *)&self->mTrackedProperties + 28) & 1) == 0)
  {
    if (*((unsigned char *)self + 24) & 1) != 0 || (*((unsigned char *)&self->mOriginalProperties + 28)) {
      goto LABEL_10;
    }
    return 0;
  }
  return 1;
}

- (int)widthBeforeType
{
  if ((*((unsigned char *)self + 24) & 6) != 0 && (*((unsigned char *)&self->mTrackedProperties + 28) & 2) != 0)
  {
    uint64_t v3 = 68;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 5) == 0 || (*((unsigned char *)&self->mOriginalProperties + 28) & 2) == 0) {
      return 1;
    }
    uint64_t v3 = 36;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isWidthBeforeTypeOverridden
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    int v2 = *((unsigned char *)&self->mTrackedProperties + 28) & 2;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 4) == 0)
    {
      if (*((unsigned char *)self + 24)) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 1) & 1;
      }
      goto LABEL_10;
    }
    if ((*((unsigned char *)&self->mTrackedProperties + 28) & 2) == 0)
    {
      if ((*((unsigned char *)self + 24) & 1) != 0 || (*((unsigned char *)&self->mOriginalProperties + 28) & 2) != 0) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 1) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    int v2 = *((unsigned char *)&self->mTrackedProperties + 28) & 2;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (signed)widthAfter
{
  if ((*((unsigned char *)self + 24) & 6) != 0 && (*((unsigned char *)&self->mTrackedProperties + 28) & 4) != 0)
  {
    uint64_t v3 = 72;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((unsigned char *)self + 24) & 5) != 0 && (*((unsigned char *)&self->mOriginalProperties + 28) & 4) != 0)
  {
    uint64_t v3 = 40;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isWidthAfterOverridden
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    int v2 = *((unsigned char *)&self->mTrackedProperties + 28) & 4;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 4) == 0)
    {
      if (*((unsigned char *)self + 24)) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 2) & 1;
      }
      goto LABEL_10;
    }
    if ((*((unsigned char *)&self->mTrackedProperties + 28) & 4) == 0)
    {
      if ((*((unsigned char *)self + 24) & 1) != 0 || (*((unsigned char *)&self->mOriginalProperties + 28) & 4) != 0) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 2) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    int v2 = *((unsigned char *)&self->mTrackedProperties + 28) & 4;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)widthAfterType
{
  if ((*((unsigned char *)self + 24) & 6) != 0 && (*((unsigned char *)&self->mTrackedProperties + 28) & 8) != 0)
  {
    uint64_t v3 = 76;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 5) == 0 || (*((unsigned char *)&self->mOriginalProperties + 28) & 8) == 0) {
      return 1;
    }
    uint64_t v3 = 44;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isWidthAfterTypeOverridden
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    int v2 = *((unsigned char *)&self->mTrackedProperties + 28) & 8;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 4) == 0)
    {
      if (*((unsigned char *)self + 24)) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 3) & 1;
      }
      goto LABEL_10;
    }
    if ((*((unsigned char *)&self->mTrackedProperties + 28) & 8) == 0)
    {
      if ((*((unsigned char *)self + 24) & 1) != 0 || (*((unsigned char *)&self->mOriginalProperties + 28) & 8) != 0) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 3) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    int v2 = *((unsigned char *)&self->mTrackedProperties + 28) & 8;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)heightType
{
  if ((*((unsigned char *)self + 24) & 6) != 0 && (*((unsigned char *)&self->mTrackedProperties + 28) & 0x20) != 0)
  {
    uint64_t v3 = 88;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 5) == 0 || (*((unsigned char *)&self->mOriginalProperties + 28) & 0x20) == 0) {
      return 1;
    }
    uint64_t v3 = 56;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isHeightTypeOverridden
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    int v2 = *((unsigned char *)&self->mTrackedProperties + 28) & 0x20;
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 4) == 0)
    {
      if (*((unsigned char *)self + 24)) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 5) & 1;
      }
      goto LABEL_10;
    }
    if ((*((unsigned char *)&self->mTrackedProperties + 28) & 0x20) == 0)
    {
      if ((*((unsigned char *)self + 24) & 1) != 0 || (*((unsigned char *)&self->mOriginalProperties + 28) & 0x20) != 0) {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 28) >> 5) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    int v2 = *((unsigned char *)&self->mTrackedProperties + 28) & 0x20;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)header
{
  if ((*((unsigned char *)self + 24) & 6) != 0 && *((char *)&self->mTrackedProperties + 28) < 0) {
    LODWORD(self) = (*((unsigned __int8 *)&self->mTrackedProperties + 28) >> 6) & 1;
  }
  else {
    LOBYTE(self) = (*((unsigned char *)self + 24) & 5) != 0
  }
                && *((char *)&self->mOriginalProperties + 28) < 0
                && (*((unsigned char *)&self->mOriginalProperties + 28) & 0x40) != 0;
  return (char)self;
}

- (BOOL)isHeaderOverridden
{
  if ((*((unsigned char *)self + 24) & 2) != 0)
  {
    LOBYTE(v2) = *((unsigned char *)&self->mTrackedProperties + 28);
  }
  else
  {
    if ((*((unsigned char *)self + 24) & 4) == 0)
    {
      if (*((unsigned char *)self + 24))
      {
LABEL_11:
        int v3 = *((char *)&self->mOriginalProperties + 28);
        return v3 < 0;
      }
      return 0;
    }
    int v2 = *((char *)&self->mTrackedProperties + 28);
    if ((v2 & 0x80000000) == 0)
    {
      if ((*((unsigned char *)self + 24) & 1) != 0 || *((char *)&self->mOriginalProperties + 28) < 0) {
        goto LABEL_11;
      }
      return 0;
    }
  }
  int v3 = (char)v2;
  return v3 < 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[WDTableRowProperties allocWithZone:a3] init];
  if (v4)
  {
    uint64_t v5 = [(WDTableProperties *)self->mTableProperties copy];
    mTableProperties = v4->mTableProperties;
    v4->mTableProperties = (WDTableProperties *)v5;

    char v7 = *((unsigned char *)v4 + 24) & 0xFE | *((unsigned char *)self + 24) & 1;
    *((unsigned char *)v4 + 24) = v7;
    char v8 = v7 & 0xFD | (2 * ((*((unsigned char *)self + 24) & 2) != 0));
    *((unsigned char *)v4 + 24) = v8;
    *((unsigned char *)v4 + 24) = v8 & 0xFB | *((unsigned char *)self + 24) & 4;
    long long v9 = *(_OWORD *)&self->mOriginalProperties.height;
    *(_OWORD *)&v4->mOriginalProperties.widthBefore = *(_OWORD *)&self->mOriginalProperties.widthBefore;
    *(_OWORD *)&v4->mOriginalProperties.height = v9;
    long long v10 = *(_OWORD *)&self->mTrackedProperties.height;
    *(_OWORD *)&v4->mTrackedProperties.widthBefore = *(_OWORD *)&self->mTrackedProperties.widthBefore;
    *(_OWORD *)&v4->mTrackedProperties.height = v10;
    objc_super v11 = v4;
  }

  return v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDTableRowProperties;
  int v2 = [(WDTableRowProperties *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCharacterProperties, 0);
  objc_storeStrong((id *)&self->mTableProperties, 0);
}

- (void)addPropertiesValues:(id *)a3 to:(id *)a4
{
  char v4 = *((unsigned char *)a4 + 28);
  if (v4 & 1) == 0 && (*((unsigned char *)a3 + 28))
  {
    v4 |= 1u;
    *((unsigned char *)a4 + 28) = v4;
    a4->var0 = a3->var0;
  }
  if ((v4 & 2) == 0 && (*((unsigned char *)a3 + 28) & 2) != 0)
  {
    v4 |= 2u;
    *((unsigned char *)a4 + 28) = v4;
    a4->var1 = a3->var1;
  }
  if ((v4 & 4) == 0 && (*((unsigned char *)a3 + 28) & 4) != 0)
  {
    v4 |= 4u;
    *((unsigned char *)a4 + 28) = v4;
    a4->var2 = a3->var2;
  }
  if ((v4 & 8) == 0 && (*((unsigned char *)a3 + 28) & 8) != 0)
  {
    v4 |= 8u;
    *((unsigned char *)a4 + 28) = v4;
    a4->var3 = a3->var3;
  }
  if ((v4 & 0x10) == 0 && (*((unsigned char *)a3 + 28) & 0x10) != 0)
  {
    v4 |= 0x10u;
    *((unsigned char *)a4 + 28) = v4;
    a4->var4 = a3->var4;
  }
  if ((v4 & 0x20) == 0 && (*((unsigned char *)a3 + 28) & 0x20) != 0)
  {
    v4 |= 0x20u;
    *((unsigned char *)a4 + 28) = v4;
    a4->var5 = a3->var5;
  }
  if ((v4 & 0x80) == 0 && *((char *)a3 + 28) < 0)
  {
    char v5 = v4 | 0x80;
    *((unsigned char *)a4 + 28) = v5;
    *((unsigned char *)a4 + 28) = *((unsigned char *)a3 + 28) & 0x40 | v5 & 0xBF;
  }
}

@end