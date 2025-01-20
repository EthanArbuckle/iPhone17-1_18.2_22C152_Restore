@interface ICStoreArtworkInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasOriginalSize;
- (BOOL)isEqual:(id)a3;
- (CGColor)colorFromStringRepresentation:(id)a3;
- (CGColor)copyColorWithKind:(id)a3;
- (CGSize)originalSize;
- (ICStoreArtworkGradientInfo)gradientInfo;
- (ICStoreArtworkInfo)initWithArtworkResponseArray:(id)a3;
- (ICStoreArtworkInfo)initWithArtworkResponseDictionary:(id)a3;
- (ICStoreArtworkInfo)initWithArtworkResponseValue:(id)a3;
- (ICStoreArtworkInfo)initWithArtworkURL:(id)a3;
- (ICStoreArtworkInfo)initWithCoder:(id)a3;
- (ICStoreArtworkSizeInfo)sizeInfo;
- (NSArray)responseArray;
- (NSArray)sortedResponseArray;
- (NSArray)sortedSupportedSizesArray;
- (NSArray)textGradient;
- (NSDictionary)responseDictionary;
- (NSString)stringRepresentation;
- (NSURL)artworkURL;
- (id)artworkURLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5;
- (id)artworkURLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5 preferP3ColorSpace:(BOOL)a6;
- (unint64_t)hash;
- (unint64_t)imageTraits;
- (void)_sortResponseArray;
- (void)_sortSupportedSizesArray;
- (void)encodeWithCoder:(id)a3;
- (void)setSortedResponseArray:(id)a3;
- (void)setSortedSupportedSizesArray:(id)a3;
@end

@implementation ICStoreArtworkInfo

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (id)artworkURLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5 preferP3ColorSpace:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.height;
  double width = a3.width;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2, self, @"ICStoreArtworkInfo.m", 278, @"Invalid parameter not satisfying: %@", @"cropStyle != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v66 = [MEMORY[0x1E4F28B00] currentHandler];
  [v66 handleFailureInMethod:a2, self, @"ICStoreArtworkInfo.m", 279, @"Invalid parameter not satisfying: %@", @"format != nil" object file lineNumber description];

LABEL_3:
  double v15 = ceil(width);
  double v16 = ceil(height);
  v17 = [(ICStoreArtworkInfo *)self sizeInfo];
  uint64_t v18 = [v17 type];
  if (v18 == 2)
  {
    id v67 = v12;
    id v21 = [(ICStoreArtworkInfo *)self sortedResponseArray];
    v68 = [v21 lastObject];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v70;
      double v26 = 1.79769313e308;
      double v27 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v70 != v25) {
            objc_enumerationMutation(v22);
          }
          v29 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          v30 = [v29 objectForKey:@"width"];
          v31 = [v29 objectForKey:@"height"];
          if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
          {
            [v30 doubleValue];
            double v33 = v32;
            [v31 doubleValue];
            BOOL v35 = v33 >= v27 || v33 < width;
            BOOL v36 = !v35 && v34 < v26;
            if (v36 && v34 >= height)
            {
              double v38 = v34;
              v39 = v29;

              double v26 = v38;
              double v27 = v33;
              v68 = v39;
            }
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v69 objects:v73 count:16];
      }
      while (v24);
    }

    id v12 = v67;
    v20 = v68;
  }
  else
  {
    if (v18 != 1)
    {
      if (v18)
      {
        v20 = 0;
        v19 = 0;
      }
      else
      {
        v19 = [(ICStoreArtworkInfo *)self artworkURL];
        v20 = 0;
      }
      goto LABEL_55;
    }
    v20 = self->_responseDictionary;
    if ([v17 hasMaxSupportedSize])
    {
      [v17 maxSupportedSize];
      if (width < v40) {
        double v40 = width;
      }
      double v15 = ceil(v40);
      if (height >= v41) {
        double v42 = v41;
      }
      else {
        double v42 = height;
      }
      double v16 = ceil(v42);
    }
  }
  v43 = [(NSDictionary *)v20 objectForKey:@"url"];
  v44 = (void *)[v43 mutableCopy];

  uint64_t v45 = [v44 rangeOfString:@"{w}" options:5];
  if (v45 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v47 = v46;
    if (v46)
    {
      uint64_t v48 = v45;
      objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)v15);
      BOOL v49 = v6;
      v51 = v50 = v20;
      objc_msgSend(v44, "replaceCharactersInRange:withString:", v48, v47, v51);

      v20 = v50;
      BOOL v6 = v49;
    }
  }
  uint64_t v52 = [v44 rangeOfString:@"{h}" options:5];
  if (v52 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v54 = v53;
    if (v53)
    {
      uint64_t v55 = v52;
      objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)v16);
      v57 = v56 = v20;
      objc_msgSend(v44, "replaceCharactersInRange:withString:", v55, v54, v57);

      v20 = v56;
    }
  }
  uint64_t v58 = [v44 rangeOfString:@"{c}" options:5];
  if (v58 != 0x7FFFFFFFFFFFFFFFLL && v59) {
    objc_msgSend(v44, "replaceCharactersInRange:withString:", v58, v59, v12);
  }
  uint64_t v60 = [v44 rangeOfString:@"{f}" options:5];
  if (v60 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v61)
    {
      uint64_t v62 = v60;
      objc_msgSend(v44, "replaceCharactersInRange:withString:", v60, v61, v14);
      if (v6)
      {
        v63 = [(NSDictionary *)v20 objectForKey:@"hasP3"];
        if ([v63 BOOLValue]) {
          [v44 insertString:@"-P3" atIndex:v62 - 1];
        }
      }
    }
  }
  if ([v44 length])
  {
    v19 = [MEMORY[0x1E4F1CB10] URLWithString:v44];
  }
  else
  {
    v19 = 0;
  }

LABEL_55:

  return v19;
}

- (NSString)stringRepresentation
{
  v3 = [(ICStoreArtworkInfo *)self sizeInfo];
  uint64_t v4 = [v3 type];

  switch(v4)
  {
    case 2:
      BOOL v6 = [(NSArray *)self->_responseArray lastObject];
      v7 = [v6 objectForKey:@"url"];

      goto LABEL_9;
    case 1:
      uint64_t v5 = [(NSDictionary *)self->_responseDictionary objectForKey:@"url"];
      goto LABEL_7;
    case 0:
      uint64_t v5 = [(NSURL *)self->_artworkURL absoluteString];
LABEL_7:
      v7 = (void *)v5;
      goto LABEL_9;
  }
  v7 = 0;
LABEL_9:

  return (NSString *)v7;
}

- (ICStoreArtworkSizeInfo)sizeInfo
{
  return self->_sizeInfo;
}

- (ICStoreArtworkInfo)initWithArtworkResponseDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"url"];
  if (_NSIsNSString())
  {
    v18.receiver = self;
    v18.super_class = (Class)ICStoreArtworkInfo;
    BOOL v6 = [(ICStoreArtworkInfo *)&v18 init];
    if (v6)
    {
      uint64_t v7 = [v4 copy];
      responseDictionary = v6->_responseDictionary;
      v6->_responseDictionary = (NSDictionary *)v7;

      v9 = objc_alloc_init(ICStoreArtworkSizeInfo);
      sizeInfo = v6->_sizeInfo;
      v6->_sizeInfo = v9;

      [(ICStoreArtworkSizeInfo *)v6->_sizeInfo setType:1];
      if ([(ICStoreArtworkInfo *)v6 _hasOriginalSize])
      {
        [(ICStoreArtworkInfo *)v6 originalSize];
        double v13 = v12;
        double v14 = v11;
        if (v12 != *MEMORY[0x1E4F1DB30] || v11 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
        {
          [(ICStoreArtworkSizeInfo *)v6->_sizeInfo setHasMaxSupportedSize:1];
          -[ICStoreArtworkSizeInfo setMaxSupportedSize:](v6->_sizeInfo, "setMaxSupportedSize:", v13, v14);
        }
      }
    }
    self = v6;
    double v16 = self;
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

- (CGSize)originalSize
{
  v2 = self->_responseDictionary;
  v3 = [(NSDictionary *)v2 objectForKey:@"width"];
  id v4 = [(NSDictionary *)v2 objectForKey:@"height"];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    [v3 doubleValue];
    double v6 = v5;
    [v4 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (BOOL)_hasOriginalSize
{
  v2 = self->_responseDictionary;
  v3 = [(NSDictionary *)v2 objectForKey:@"width"];
  id v4 = [(NSDictionary *)v2 objectForKey:@"height"];
  if (objc_opt_respondsToSelector()) {
    char v5 = objc_opt_respondsToSelector();
  }
  else {
    char v5 = 0;
  }

  return v5 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_responseArray, 0);
  objc_storeStrong((id *)&self->_sortedSupportedSizesArray, 0);
  objc_storeStrong((id *)&self->_sortedResponseArray, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);

  objc_storeStrong((id *)&self->_sizeInfo, 0);
}

- (NSArray)responseArray
{
  return self->_responseArray;
}

- (void)setSortedSupportedSizesArray:(id)a3
{
}

- (NSArray)sortedSupportedSizesArray
{
  return self->_sortedSupportedSizesArray;
}

- (void)setSortedResponseArray:(id)a3
{
}

- (NSArray)sortedResponseArray
{
  return self->_sortedResponseArray;
}

- (void)_sortSupportedSizesArray
{
  v2 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(ICStoreArtworkInfo *)self sortedResponseArray];
  if ([v3 count])
  {
    v19 = v2;
    v20 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    objc_super v18 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          double v10 = [v9 objectForKey:@"width"];
          double v11 = [v9 objectForKey:@"height"];
          if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
          {
            double v21 = 0.0;
            double v22 = 0.0;
            [v10 floatValue];
            double v13 = v12;
            [v11 floatValue];
            double v21 = v13;
            double v22 = v14;
            double v15 = [MEMORY[0x1E4F29238] valueWithBytes:&v21 objCType:"{CGSize=dd}"];
            [(NSArray *)v20 addObject:v15];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }

    v3 = v18;
    v2 = v19;
    double v16 = v20;
  }
  else
  {
    double v16 = 0;
  }
  sortedSupportedSizesArray = v2->_sortedSupportedSizesArray;
  v2->_sortedSupportedSizesArray = v16;
}

- (void)_sortResponseArray
{
  uint64_t v3 = [(NSArray *)self->_responseArray sortedArrayUsingComparator:&__block_literal_global_12017];
  id v5 = (id)v3;
  if (v3) {
    id v4 = (void *)v3;
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)&self->_sortedResponseArray, v4);
}

uint64_t __40__ICStoreArtworkInfo__sortResponseArray__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 objectForKey:@"width"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    uint64_t v6 = 0;
  }
  uint64_t v7 = [v4 objectForKey:@"height"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    uint64_t v7 = 0;
  }
  double v8 = [v5 objectForKey:@"width"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    double v8 = 0;
  }
  double v9 = [v5 objectForKey:@"height"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    double v9 = 0;
  }
  [v6 doubleValue];
  double v11 = v10;
  [v7 doubleValue];
  double v13 = (v11 + v12) * 0.5;
  [v8 doubleValue];
  double v15 = v14;
  [v9 doubleValue];
  double v17 = (v15 + v16) * 0.5;
  double v18 = vabdd_f64(v13, v17);
  uint64_t v19 = -1;
  if (v13 >= v17) {
    uint64_t v19 = 1;
  }
  if (v18 <= 0.00000011920929) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = v19;
  }

  return v20;
}

- (ICStoreArtworkGradientInfo)gradientInfo
{
  uint64_t v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"gradient"];
  if (_NSIsNSDictionary())
  {
    id v4 = objc_alloc_init(ICStoreArtworkGradientInfo);
    id v5 = [v3 objectForKey:@"color"];
    if (_NSIsNSString()) {
      [(ICStoreArtworkGradientInfo *)v4 setColor:[(ICStoreArtworkInfo *)self colorFromStringRepresentation:v5]];
    }
    uint64_t v6 = [v3 objectForKey:@"y1"];
    if (objc_opt_respondsToSelector())
    {
      [v6 doubleValue];
      -[ICStoreArtworkGradientInfo setY1:](v4, "setY1:");
    }
    uint64_t v7 = [v3 objectForKey:@"y2"];
    if (objc_opt_respondsToSelector())
    {
      [v7 doubleValue];
      -[ICStoreArtworkGradientInfo setY2:](v4, "setY2:");
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)textGradient
{
  uint64_t v3 = [(NSDictionary *)self->_responseDictionary objectForKey:@"textGradient"];
  if (_NSIsNSArray())
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__ICStoreArtworkInfo_textGradient__block_invoke;
    v6[3] = &unk_1E5AC8648;
    v6[4] = self;
    id v4 = objc_msgSend(v3, "msv_compactMap:", v6);
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

uint64_t __34__ICStoreArtworkInfo_textGradient__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) colorFromStringRepresentation:a2];
}

- (unint64_t)imageTraits
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"imageTraits"];
  if (_NSIsNSArray())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      unint64_t v6 = 0;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v3);
          }
          double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (_NSIsNSString()
            && objc_msgSend(v9, "isEqualToString:", @"hasTitle", (void)v11))
          {
            unint64_t v6 = 1;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (CGColor)colorFromStringRepresentation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NSIsNSString())
  {
    unsigned int v4 = strtoul((const char *)[v3 UTF8String], 0, 16);
    int8x8_t v5 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v4), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL);
    v6.i64[0] = v5.u32[0];
    v6.i64[1] = v5.u32[1];
    float64x2_t v10 = vdivq_f64(vcvtq_f64_s64(v6), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL));
    double v11 = (double)v4 / 255.0;
    uint64_t v12 = 0x3FF0000000000000;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    double v8 = CGColorCreate(DeviceRGB, v10.f64);
    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (CGColor)copyColorWithKind:(id)a3
{
  unsigned int v4 = [(NSDictionary *)self->_responseDictionary objectForKey:a3];
  int8x8_t v5 = [(ICStoreArtworkInfo *)self colorFromStringRepresentation:v4];

  return v5;
}

- (id)artworkURLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5
{
  return -[ICStoreArtworkInfo artworkURLWithSize:cropStyle:format:preferP3ColorSpace:](self, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", a4, a5, 0, a3.width, a3.height);
}

- (NSURL)artworkURL
{
  artworkURL = self->_artworkURL;
  if (artworkURL)
  {
    uint64_t v4 = [(NSURL *)artworkURL copy];
LABEL_5:
    int8x8_t v5 = (void *)v4;
    goto LABEL_6;
  }
  if (self->_responseDictionary)
  {
    [(ICStoreArtworkInfo *)self originalSize];
    uint64_t v4 = -[ICStoreArtworkInfo artworkURLWithSize:cropStyle:format:](self, "artworkURLWithSize:cropStyle:format:", @"sr", @"jpg");
    goto LABEL_5;
  }
  if (self->_responseArray)
  {
    uint64_t v7 = [(ICStoreArtworkInfo *)self sizeInfo];
    [v7 maxSupportedSize];
    int8x8_t v5 = -[ICStoreArtworkInfo artworkURLWithSize:cropStyle:format:](self, "artworkURLWithSize:cropStyle:format:", @"sr", @"jpg");
  }
  else
  {
    int8x8_t v5 = 0;
  }
LABEL_6:

  return (NSURL *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  responseArray = self->_responseArray;
  id v5 = a3;
  [v5 encodeObject:responseArray forKey:@"responseArray"];
  [v5 encodeObject:self->_responseDictionary forKey:@"responseDictionary"];
  [v5 encodeObject:self->_artworkURL forKey:@"artworkURL"];
}

- (ICStoreArtworkInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodePropertyListForKey:@"responseArray"];
  if (v5)
  {
    self = [(ICStoreArtworkInfo *)self initWithArtworkResponseArray:v5];
    int64x2_t v6 = self;
  }
  else
  {
    uint64_t v7 = [v4 decodePropertyListForKey:@"responseDictionary"];
    if (v7)
    {
      self = [(ICStoreArtworkInfo *)self initWithArtworkResponseDictionary:v7];
      int64x2_t v6 = self;
    }
    else
    {
      double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artworkURL"];
      if (v8)
      {
        self = [(ICStoreArtworkInfo *)self initWithArtworkURL:v8];
        int64x2_t v6 = self;
      }
      else
      {
        int64x2_t v6 = 0;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  double v9 = (objc_class *)objc_opt_class();
  float64x2_t v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v87 = __ROR8__(v14 + v13, 32);
  uint64_t v92 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v82 = (v14 + v13) ^ __ROR8__(v13, 47);

  double v18 = self->_sizeInfo;
  uint64_t v19 = [(ICStoreArtworkSizeInfo *)v18 hash];
  uint64_t v20 = (v17 + v82) ^ __ROR8__(v82, 51);
  uint64_t v21 = v87 + (v92 ^ v19);
  uint64_t v22 = __ROR8__(v92 ^ v19, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v82, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  uint64_t v88 = __ROR8__(v25, 32);
  uint64_t v93 = v24;
  uint64_t v78 = v23 ^ v19;
  uint64_t v83 = v25 ^ __ROR8__(v20, 47);

  long long v26 = self->_artworkURL;
  uint64_t data = [(NSURL *)v26 hash];
  uint64_t v27 = (v78 + v83) ^ __ROR8__(v83, 51);
  uint64_t v28 = v88 + (v93 ^ data);
  uint64_t v29 = __ROR8__(v93 ^ data, 48);
  uint64_t v30 = (v28 ^ v29) + __ROR8__(v78 + v83, 32);
  uint64_t v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
  uint64_t v32 = v28 + v27;
  uint64_t v89 = __ROR8__(v32, 32);
  uint64_t v94 = v31;
  uint64_t v79 = v30 ^ data;
  uint64_t v84 = v32 ^ __ROR8__(v27, 47);

  double v33 = self->_responseDictionary;
  uint64_t v34 = [(NSDictionary *)v33 hash];
  uint64_t v35 = (v79 + v84) ^ __ROR8__(v84, 51);
  uint64_t v36 = v89 + (v94 ^ v34);
  uint64_t v37 = __ROR8__(v94 ^ v34, 48);
  uint64_t v38 = (v36 ^ v37) + __ROR8__(v79 + v84, 32);
  uint64_t v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
  uint64_t v40 = v36 + v35;
  uint64_t v90 = __ROR8__(v40, 32);
  uint64_t v95 = v39;
  uint64_t v80 = v38 ^ v34;
  uint64_t v85 = v40 ^ __ROR8__(v35, 47);

  double v41 = self->_responseArray;
  uint64_t v42 = [(NSArray *)v41 hash];
  uint64_t v43 = (v80 + v85) ^ __ROR8__(v85, 51);
  uint64_t v44 = v90 + (v95 ^ v42);
  uint64_t v45 = __ROR8__(v95 ^ v42, 48);
  uint64_t v46 = (v44 ^ v45) + __ROR8__(v80 + v85, 32);
  uint64_t v47 = v46 ^ __ROR8__(v44 ^ v45, 43);
  uint64_t v48 = v44 + v43;
  uint64_t v91 = __ROR8__(v48, 32);
  uint64_t v96 = v47;
  uint64_t v81 = v46 ^ v42;
  uint64_t v86 = v48 ^ __ROR8__(v43, 47);

  uint64_t v49 = (v81 + v86) ^ __ROR8__(v86, 51);
  uint64_t v50 = v91 + (v96 ^ 0x2800000000000000);
  uint64_t v51 = __ROR8__(v96 ^ 0x2800000000000000, 48);
  uint64_t v52 = (v50 ^ v51) + __ROR8__(v81 + v86, 32);
  uint64_t v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
  uint64_t v54 = v50 + v49;
  uint64_t v55 = v54 ^ __ROR8__(v49, 47);
  uint64_t v56 = (v52 ^ 0x2800000000000000) + v55;
  uint64_t v57 = v56 ^ __ROR8__(v55, 51);
  uint64_t v58 = (__ROR8__(v54, 32) ^ 0xFFLL) + v53;
  uint64_t v59 = __ROR8__(v53, 48);
  uint64_t v60 = __ROR8__(v56, 32) + (v58 ^ v59);
  uint64_t v61 = v60 ^ __ROR8__(v58 ^ v59, 43);
  uint64_t v62 = v57 + v58;
  uint64_t v63 = v62 ^ __ROR8__(v57, 47);
  uint64_t v64 = v63 + v60;
  uint64_t v65 = v64 ^ __ROR8__(v63, 51);
  uint64_t v66 = __ROR8__(v62, 32) + v61;
  uint64_t v67 = __ROR8__(v61, 48);
  uint64_t v68 = __ROR8__(v64, 32) + (v66 ^ v67);
  uint64_t v69 = v68 ^ __ROR8__(v66 ^ v67, 43);
  uint64_t v70 = v65 + v66;
  uint64_t v71 = v70 ^ __ROR8__(v65, 47);
  uint64_t v72 = v71 + v68;
  uint64_t v73 = v72 ^ __ROR8__(v71, 51);
  uint64_t v74 = __ROR8__(v70, 32) + v69;
  uint64_t v75 = __ROR8__(v69, 48);
  uint64_t v76 = __ROR8__(v72, 32) + (v74 ^ v75);
  return (v73 + v74) ^ __ROR8__(v73, 47) ^ v76 ^ __ROR8__(v73 + v74, 32) ^ v76 ^ __ROR8__(v74 ^ v75, 43);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICStoreArtworkInfo *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    if ([(ICStoreArtworkInfo *)v4 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v5 = v4;
      id v6 = [(ICStoreArtworkInfo *)self sizeInfo];
      id v7 = [(ICStoreArtworkInfo *)v5 sizeInfo];
      if (v6 == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        char v9 = [v6 isEqual:v7];

        if ((v9 & 1) == 0) {
          goto LABEL_15;
        }
      }
      id v11 = [(ICStoreArtworkInfo *)self artworkURL];
      id v12 = [(ICStoreArtworkInfo *)v5 artworkURL];
      if (v11 == v12)
      {
      }
      else
      {
        uint64_t v13 = v12;
        char v14 = [v11 isEqual:v12];

        if ((v14 & 1) == 0) {
          goto LABEL_15;
        }
      }
      id v15 = [(ICStoreArtworkInfo *)self responseDictionary];
      id v16 = [(ICStoreArtworkInfo *)v5 responseDictionary];
      if (v15 == v16)
      {
      }
      else
      {
        uint64_t v17 = v16;
        char v18 = [v15 isEqual:v16];

        if ((v18 & 1) == 0)
        {
LABEL_15:
          char v10 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      uint64_t v19 = [(ICStoreArtworkInfo *)self responseArray];
      uint64_t v20 = [(ICStoreArtworkInfo *)v5 responseArray];
      if (v19 == v20) {
        char v10 = 1;
      }
      else {
        char v10 = [v19 isEqual:v20];
      }

      goto LABEL_21;
    }
    char v10 = 0;
  }
LABEL_22:

  return v10;
}

- (ICStoreArtworkInfo)initWithArtworkResponseValue:(id)a3
{
  id v4 = a3;
  if (_NSIsNSDictionary())
  {
    uint64_t v5 = [(ICStoreArtworkInfo *)self initWithArtworkResponseDictionary:v4];
LABEL_5:
    self = v5;
    id v6 = self;
    goto LABEL_6;
  }
  if (_NSIsNSArray())
  {
    uint64_t v5 = [(ICStoreArtworkInfo *)self initWithArtworkResponseArray:v4];
    goto LABEL_5;
  }
  if (_NSIsNSString())
  {
    uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    if (v8)
    {
      self = [(ICStoreArtworkInfo *)self initWithArtworkURL:v8];
      id v6 = self;
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_6:

  return v6;
}

- (ICStoreArtworkInfo)initWithArtworkURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICStoreArtworkInfo;
  uint64_t v5 = [(ICStoreArtworkInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    artworkURL = v5->_artworkURL;
    v5->_artworkURL = (NSURL *)v6;

    uint64_t v8 = objc_alloc_init(ICStoreArtworkSizeInfo);
    sizeInfo = v5->_sizeInfo;
    v5->_sizeInfo = v8;

    [(ICStoreArtworkSizeInfo *)v5->_sizeInfo setType:0];
  }

  return v5;
}

- (ICStoreArtworkInfo)initWithArtworkResponseArray:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        char v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          objc_super v11 = [v10 objectForKey:@"url"];
          if (_NSIsNSString())
          {
            if (!v7) {
              id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v7 addObject:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
  if ([v7 count])
  {
    v18.receiver = self;
    v18.super_class = (Class)ICStoreArtworkInfo;
    id v12 = [(ICStoreArtworkInfo *)&v18 init];
    uint64_t v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_responseArray, v7);
      [(ICStoreArtworkInfo *)v13 _sortResponseArray];
      [(ICStoreArtworkInfo *)v13 _sortSupportedSizesArray];
      char v14 = objc_alloc_init(ICStoreArtworkSizeInfo);
      sizeInfo = v13->_sizeInfo;
      v13->_sizeInfo = v14;

      [(ICStoreArtworkSizeInfo *)v13->_sizeInfo setType:2];
      [(ICStoreArtworkSizeInfo *)v13->_sizeInfo setSupportedSizes:v13->_sortedSupportedSizesArray];
    }
    self = v13;
    id v16 = self;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end