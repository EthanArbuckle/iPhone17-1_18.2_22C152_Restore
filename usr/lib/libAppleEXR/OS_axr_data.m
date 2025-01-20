@interface OS_axr_data
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation OS_axr_data

- (void)dealloc
{
  (*(void (**)(void))self[2].super.super.isa)();
  v3.receiver = self;
  v3.super_class = (Class)OS_axr_data;
  [(OS_axr_data *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"axr_data_t <%p>", self];
}

- (NSString)debugDescription
{
  v9 = (AXRData *)&self[2];
  Class isa = self[12].super.super.isa;
  if (isa)
  {
    unint64_t v11 = 0;
    size_t v12 = (void)isa << 8;
    do
    {
      uint64_t ChannelCount = AXRData::GetChannelCount(v9, v11, v2, v3, v4, v5, v6, v7);
      uint64_t LayerCount = AXRData::GetLayerCount(v9, v11, v14, v15, v16, v17, v18, v19);
      v12 += (ChannelCount << 9)
           + (LayerCount << 8)
           + (AXRData::GetImagePropertyCount(v9, v11++, v21, v22, v23, v24, v25, v26) << 7);
    }
    while (isa != (Class)v11);
  }
  else
  {
    size_t v12 = 0;
  }
  v27 = (char *)malloc_type_malloc(v12, 0x4C379A97uLL);
  if (!v27) {
    return 0;
  }
  v28 = v27;
  AXRData::DebugDescription(v9, v27);
  v31.receiver = self;
  v31.super_class = (Class)OS_axr_data;
  v29 = (NSString *)[NSString stringWithFormat:@"%@:\n%s\n", -[OS_axr_data debugDescription](&v31, sel_debugDescription), v28];
  free(v28);
  return v29;
}

- (BOOL)isEqual:(id)a3
{
  return self && a3 && AXRData::IsEqual((uint64_t)&self[2], (uint64_t)a3 + 16);
}

- (unint64_t)hash
{
  AXRData::GetHash((AXRData *)&self[2]);
  return result;
}

@end