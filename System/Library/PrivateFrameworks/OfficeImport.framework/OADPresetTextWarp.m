@interface OADPresetTextWarp
+ (id)stringWithPresetTextWarpType:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (unsigned)presetTextWarpType;
- (void)setPresetTextWarpType:(unsigned __int8)a3;
@end

@implementation OADPresetTextWarp

- (void)setPresetTextWarpType:(unsigned __int8)a3
{
  self->mPresetTextWarpType = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int mPresetTextWarpType = self->mPresetTextWarpType,
        mPresetTextWarpType == [v4 presetTextWarpType]))
  {
    v8.receiver = self;
    v8.super_class = (Class)OADPresetTextWarp;
    BOOL v6 = [(OADTextWarp *)&v8 isEqual:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unsigned)presetTextWarpType
{
  return self->mPresetTextWarpType;
}

- (unint64_t)hash
{
  uint64_t mPresetTextWarpType = self->mPresetTextWarpType;
  v4.receiver = self;
  v4.super_class = (Class)OADPresetTextWarp;
  return [(OADTextWarp *)&v4 hash] ^ mPresetTextWarpType;
}

+ (id)stringWithPresetTextWarpType:(unsigned __int8)a3
{
  if (a3 > 0x27u) {
    return @"textPlain";
  }
  else {
    return (id)*((void *)&off_264D629A0 + (char)a3);
  }
}

@end