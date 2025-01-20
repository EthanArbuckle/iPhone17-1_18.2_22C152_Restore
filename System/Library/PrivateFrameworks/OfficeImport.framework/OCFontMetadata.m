@interface OCFontMetadata
+ (id)fontMetadataWithSig:(id)a3 charSet:(int)a4 panose1:(id)a5 pitch:(int)a6 genericFamily:(int)a7 altNames:(id)a8;
- (NSArray)altNames;
- (OCFontMetadata)initWithSig:(id)a3 charSet:(int)a4 panose1:(id)a5 pitch:(int)a6 genericFamily:(int)a7 altNames:(id)a8;
- (OCFontPanose1)panose1;
- (OCFontSig)sig;
- (int)charSet;
- (int)genericFamily;
- (int)pitch;
@end

@implementation OCFontMetadata

- (OCFontMetadata)initWithSig:(id)a3 charSet:(int)a4 panose1:(id)a5 pitch:(int)a6 genericFamily:(int)a7 altNames:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)OCFontMetadata;
  v18 = [(OCFontMetadata *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sig, a3);
    v19->_charSet = a4;
    objc_storeStrong((id *)&v19->_panose1, a5);
    v19->_pitch = a6;
    v19->_genericFamily = a7;
    uint64_t v20 = [v17 copy];
    altNames = v19->_altNames;
    v19->_altNames = (NSArray *)v20;
  }
  return v19;
}

+ (id)fontMetadataWithSig:(id)a3 charSet:(int)a4 panose1:(id)a5 pitch:(int)a6 genericFamily:(int)a7 altNames:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a8;
  id v16 = [[OCFontMetadata alloc] initWithSig:v13 charSet:v12 panose1:v14 pitch:v10 genericFamily:v9 altNames:v15];

  return v16;
}

- (OCFontSig)sig
{
  return self->_sig;
}

- (int)charSet
{
  return self->_charSet;
}

- (OCFontPanose1)panose1
{
  return self->_panose1;
}

- (int)pitch
{
  return self->_pitch;
}

- (int)genericFamily
{
  return self->_genericFamily;
}

- (NSArray)altNames
{
  return self->_altNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altNames, 0);
  objc_storeStrong((id *)&self->_panose1, 0);
  objc_storeStrong((id *)&self->_sig, 0);
}

@end