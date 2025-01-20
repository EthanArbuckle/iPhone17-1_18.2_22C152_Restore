@interface _NUFlexRangeProperties
+ (id)flexRangePropertiesWithGainMapMetadata:(CGImageMetadata *)a3;
- (BOOL)useBaseColor;
- (NSArray)channelInfo;
- (NSNumber)compatibilityGainMapHeadroom;
- (NSString)description;
- (NUColorSpace)alternateColorSpace;
- (float)alternateHeadroom;
- (float)baseHeadroom;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)version;
- (void)setAlternateColorSpace:(id)a3;
- (void)setAlternateHeadroom:(float)a3;
- (void)setBaseHeadroom:(float)a3;
- (void)setChannelInfo:(id)a3;
- (void)setCompatibilityGainMapHeadroom:(id)a3;
- (void)setUseBaseColor:(BOOL)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation _NUFlexRangeProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateColorSpace, 0);
  objc_storeStrong((id *)&self->_compatibilityGainMapHeadroom, 0);

  objc_storeStrong((id *)&self->_channelInfo, 0);
}

- (void)setAlternateColorSpace:(id)a3
{
}

- (NUColorSpace)alternateColorSpace
{
  return self->_alternateColorSpace;
}

- (void)setCompatibilityGainMapHeadroom:(id)a3
{
}

- (NSNumber)compatibilityGainMapHeadroom
{
  return self->_compatibilityGainMapHeadroom;
}

- (void)setUseBaseColor:(BOOL)a3
{
  self->_useBaseColor = a3;
}

- (BOOL)useBaseColor
{
  return self->_useBaseColor;
}

- (void)setChannelInfo:(id)a3
{
}

- (NSArray)channelInfo
{
  return self->_channelInfo;
}

- (void)setAlternateHeadroom:(float)a3
{
  self->_alternateHeadroom = a3;
}

- (float)alternateHeadroom
{
  return self->_alternateHeadroom;
}

- (void)setBaseHeadroom:(float)a3
{
  self->_baseHeadroom = a3;
}

- (float)baseHeadroom
{
  return self->_baseHeadroom;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(_NUFlexRangeProperties *)self version];
  [(_NUFlexRangeProperties *)self baseHeadroom];
  double v7 = v6;
  [(_NUFlexRangeProperties *)self baseHeadroom];
  double v9 = exp2f(v8);
  [(_NUFlexRangeProperties *)self alternateHeadroom];
  double v11 = v10;
  [(_NUFlexRangeProperties *)self alternateHeadroom];
  double v13 = exp2f(v12);
  if ([(_NUFlexRangeProperties *)self useBaseColor]) {
    v14 = @"base";
  }
  else {
    v14 = @"alternate";
  }
  v15 = [(_NUFlexRangeProperties *)self alternateColorSpace];
  v16 = [(_NUFlexRangeProperties *)self channelInfo];
  v17 = [(_NUFlexRangeProperties *)self compatibilityGainMapHeadroom];
  v18 = [v3 stringWithFormat:@"<%@:%p version:%ld base:%0.2f(%0.2f) alt:%0.2f(%0.2f)color:%@ space:%@ channels:%@ compatibility:%@>", v4, self, v5, *(void *)&v7, *(void *)&v9, *(void *)&v11, *(void *)&v13, v14, v15, v16, v17];

  return (NSString *)v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[_NUFlexRangeProperties allocWithZone:a3];
  v4->_version = self->_version;
  v4->_baseHeadroom = self->_baseHeadroom;
  v4->_alternateHeadroom = self->_alternateHeadroom;
  uint64_t v5 = [(NSArray *)self->_channelInfo copy];
  channelInfo = v4->_channelInfo;
  v4->_channelInfo = (NSArray *)v5;

  v4->_useBaseColor = self->_useBaseColor;
  objc_storeStrong((id *)&v4->_compatibilityGainMapHeadroom, self->_compatibilityGainMapHeadroom);
  objc_storeStrong((id *)&v4->_alternateColorSpace, self->_alternateColorSpace);
  return v4;
}

+ (id)flexRangePropertiesWithGainMapMetadata:(CGImageMetadata *)a3
{
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke;
  v31[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v31[4] = a3;
  v3 = (void *)MEMORY[0x1AD0FAD00](v31, a2);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_2;
  v29[3] = &unk_1E5D940C0;
  id v4 = v3;
  id v30 = v4;
  uint64_t v5 = (void *)MEMORY[0x1AD0FAD00](v29);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_378;
  v27[3] = &unk_1E5D940E8;
  id v6 = v4;
  id v28 = v6;
  double v7 = (uint64_t (**)(void, void, void))MEMORY[0x1AD0FAD00](v27);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_380;
  v25[3] = &unk_1E5D94110;
  id v8 = v6;
  id v26 = v8;
  double v9 = (void (**)(void, void))MEMORY[0x1AD0FAD00](v25);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_383;
  v23[3] = &unk_1E5D94138;
  id v10 = v5;
  id v24 = v10;
  double v11 = (void (**)(void, void, void))MEMORY[0x1AD0FAD00](v23);
  float v12 = (*((void (**)(id, __CFString *))v8 + 2))(v8, @"Version");
  uint64_t v13 = [v12 integerValue];

  if (v13)
  {
    v14 = objc_alloc_init(_NUFlexRangeProperties);
    [(_NUFlexRangeProperties *)v14 setVersion:v13];
    (*((void (**)(id, __CFString *))v10 + 2))(v10, @"BaseHeadroom");
    -[_NUFlexRangeProperties setBaseHeadroom:](v14, "setBaseHeadroom:");
    id v22 = v10;
    (*((void (**)(id, __CFString *))v10 + 2))(v10, @"AlternateHeadroom");
    -[_NUFlexRangeProperties setAlternateHeadroom:](v14, "setAlternateHeadroom:");
    v21 = v9;
    v15 = ((void (**)(void, __CFString *))v9)[2](v9, @"ChannelMetadata");
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    if ([v15 count])
    {
      unint64_t v17 = 0;
      do
      {
        v18 = objc_alloc_init(_NUFlexRangeChannelProperties);
        ((void (**)(void, __CFString *, unint64_t))v11)[2](v11, @"GainMapMin", v17);
        -[_NUFlexRangeChannelProperties setMin:](v18, "setMin:");
        ((void (**)(void, __CFString *, unint64_t))v11)[2](v11, @"GainMapMax", v17);
        -[_NUFlexRangeChannelProperties setMax:](v18, "setMax:");
        ((void (**)(void, __CFString *, unint64_t))v11)[2](v11, @"Gamma", v17);
        -[_NUFlexRangeChannelProperties setGamma:](v18, "setGamma:");
        ((void (**)(void, __CFString *, unint64_t))v11)[2](v11, @"BaseOffset", v17);
        -[_NUFlexRangeChannelProperties setBaseOffset:](v18, "setBaseOffset:");
        ((void (**)(void, __CFString *, unint64_t))v11)[2](v11, @"AlternateOffset", v17);
        -[_NUFlexRangeChannelProperties setAlternateOffset:](v18, "setAlternateOffset:");
        [v16 addObject:v18];

        ++v17;
      }
      while (v17 < [v15 count]);
    }
    v19 = (void *)[v16 copy];
    [(_NUFlexRangeProperties *)v14 setChannelInfo:v19];

    [(_NUFlexRangeProperties *)v14 setUseBaseColor:((uint64_t (**)(void, __CFString *, uint64_t))v7)[2](v7, @"BaseColorIsWorkingColor", 1)];
    double v9 = v21;
    id v10 = v22;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end