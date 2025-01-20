@interface OS_axr_logical_image_list
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (OS_axr_logical_image_list)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OS_axr_logical_image_list

- (NSString)debugDescription
{
  v3 = (void *)[NSString stringWithFormat:@"%@\n", -[OS_axr_logical_image_list description](self, "description")];
  v4 = self + 2;
  if (!self) {
    v4 = 0;
  }
  for (i = v4[1].super.super.isa; i; i = *(AXRImageGroup **)i)
    v3 = [v3 stringByAppendingString:AXRImageGroup::GetDebugDescription(i, "\t")];
  return (NSString *)v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<axr_logical_image_list: %p>", self];
}

- (void)dealloc
{
  if (self)
  {
    AXRLogicalImageList::~AXRLogicalImageList((AXRLogicalImageList *)&self[2]);
    v3.receiver = self;
    v3.super_class = (Class)OS_axr_logical_image_list;
    [(OS_axr_logical_image_list *)&v3 dealloc];
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)OS_axr_logical_image_list;
    BOOL v5 = -[OS_axr_logical_image_list isEqual:](&v8, sel_isEqual_);
    if (v5)
    {
      if (self) {
        v6 = (AXRLogicalImageList *)&self[2];
      }
      else {
        v6 = 0;
      }
      LOBYTE(v5) = AXRLogicalImageList::IsEqual(v6, (const AXRLogicalImageList *)((char *)a3 + 16));
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self) {
    v4 = (unint64_t *)&self[2];
  }
  else {
    v4 = 0;
  }
  BOOL v5 = (AXRImageGroup *)v4[1];
  if (v5)
  {
    size_t v6 = 16;
    do
    {
      v6 += AXRImageGroup::GetSerializedSize(v5);
      BOOL v5 = *(AXRImageGroup **)v5;
    }
    while (v5);
    if (!v6) {
      return;
    }
  }
  else
  {
    size_t v6 = 16;
  }
  v7 = (char *)malloc_type_malloc(v6, 0xF3924126uLL);
  if (v7)
  {
    objc_super v8 = v7;
    v13 = v7;
    unint64_t v9 = v6;
    if (v6 >= 4)
    {
      *(_DWORD *)v7 = 1920496243;
      v13 = v7 + 4;
      unint64_t v9 = v6 - 4;
      if (v6 - 4 >= 4)
      {
        *((_DWORD *)v7 + 1) = 0x1000000;
        v13 = v7 + 8;
        unint64_t v9 = v6 - 8;
        if (v6 - 8 >= 8)
        {
          *((void *)v7 + 1) = bswap64(*v4);
          v13 = v7 + 16;
          unint64_t v14 = v6 - 16;
          v7 = (char *)v4[1];
          do
          {
            if (!v7) {
              break;
            }
            v10 = *(char **)v7;
            BOOL v11 = AXRImageGroup::Serialize((AXRImageGroup *)v7, &v13, &v14);
            v7 = v10;
          }
          while (v11);
          unint64_t v9 = v14;
        }
      }
    }
    if (v9 >= v6) {
      unint64_t v9 = v6;
    }
    unint64_t v14 = v9;
    v12 = (void *)MEMORY[0x22A6ADA80](v7);
    [a3 encodeDataObject:[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v8 length:v6 - v14 freeWhenDone:1]];
  }
}

- (OS_axr_logical_image_list)initWithCoder:(id)a3
{
  if (!self) {
    return 0;
  }
  v4 = [(OS_object *)self init];
  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x22A6ADA80]();
    size_t v6 = (void *)[a3 decodeDataObject];
    if (v6)
    {
      v7 = v6;
      unint64_t v14 = (void *)[v6 bytes];
      uint64_t v12 = 0;
      v13 = (void *)[v7 length];
      AXRLogicalImageList::AXRLogicalImageList((AXRLogicalImageList *)&v4[2], (const void **)&v14, (const void **)&v13, (axr_error_t *)&v12, 2, v8, v9, v10);
      if (!v12)
      {
LABEL_7:
        return v4;
      }
      AXRLogicalImageList::~AXRLogicalImageList((AXRLogicalImageList *)&v4[2]);
    }
    [(OS_axr_logical_image_list *)v4 dealloc];
    v4 = 0;
    goto LABEL_7;
  }
  return v4;
}

@end