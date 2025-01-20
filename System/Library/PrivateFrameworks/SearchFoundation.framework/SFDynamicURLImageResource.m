@interface SFDynamicURLImageResource
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPixelHeight;
- (BOOL)hasPixelWidth;
- (BOOL)hasSupportsResizing;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsResizing;
- (NSArray)imageOptions;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)formatURL;
- (SFDynamicURLImageResource)initWithCoder:(id)a3;
- (SFDynamicURLImageResource)initWithProtobuf:(id)a3;
- (double)pixelHeight;
- (double)pixelWidth;
- (id)_sf_replacementStringForPropertyEntryKey:(id)a3 value:(id)a4;
- (id)_sf_urlForSettings:(id)a3 shouldResize:(BOOL)a4 width:(double)a5 height:(double)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sf_urlForSettings:(id)a3;
- (id)sf_urlForSettings:(id)a3 size:(CGSize)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFormatURL:(id)a3;
- (void)setImageOptions:(id)a3;
- (void)setPixelHeight:(double)a3;
- (void)setPixelWidth:(double)a3;
- (void)setSupportsResizing:(BOOL)a3;
@end

@implementation SFDynamicURLImageResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageOptions, 0);
  objc_storeStrong((id *)&self->_formatURL, 0);
}

- (void)setImageOptions:(id)a3
{
}

- (NSArray)imageOptions
{
  return self->_imageOptions;
}

- (BOOL)supportsResizing
{
  return self->_supportsResizing;
}

- (void)setFormatURL:(id)a3
{
}

- (NSString)formatURL
{
  return self->_formatURL;
}

- (double)pixelHeight
{
  return self->_pixelHeight;
}

- (double)pixelWidth
{
  return self->_pixelWidth;
}

- (unint64_t)hash
{
  [(SFDynamicURLImageResource *)self pixelWidth];
  double v4 = -v3;
  if (v3 >= 0.0) {
    double v4 = v3;
  }
  long double v5 = round(v4);
  unint64_t v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  [(SFDynamicURLImageResource *)self pixelHeight];
  double v8 = -v7;
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  long double v9 = round(v8);
  unint64_t v10 = (unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL);
  v11 = [(SFDynamicURLImageResource *)self formatURL];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(SFDynamicURLImageResource *)self supportsResizing];
  v14 = [(SFDynamicURLImageResource *)self imageOptions];
  unint64_t v15 = v12 ^ v13 ^ v6 ^ v10 ^ [v14 hash];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  long double v5 = (SFDynamicURLImageResource *)a3;
  if (self == v5)
  {
    char v17 = 1;
  }
  else
  {
    if ([(SFDynamicURLImageResource *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      [(SFDynamicURLImageResource *)self pixelWidth];
      double v8 = v7;
      [(SFDynamicURLImageResource *)v6 pixelWidth];
      if (vabdd_f64(v8, v9) >= 2.22044605e-16
        || ([(SFDynamicURLImageResource *)self pixelHeight],
            double v11 = v10,
            [(SFDynamicURLImageResource *)v6 pixelHeight],
            vabdd_f64(v11, v12) >= 2.22044605e-16))
      {
        char v17 = 0;
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v13 = [(SFDynamicURLImageResource *)self formatURL];
      v14 = [(SFDynamicURLImageResource *)v6 formatURL];
      if ((v13 == 0) == (v14 != 0))
      {
        char v17 = 0;
LABEL_23:

        goto LABEL_24;
      }
      unint64_t v15 = [(SFDynamicURLImageResource *)self formatURL];
      if (v15)
      {
        v16 = [(SFDynamicURLImageResource *)self formatURL];
        double v3 = [(SFDynamicURLImageResource *)v6 formatURL];
        if (![v16 isEqual:v3])
        {
          char v17 = 0;
          goto LABEL_21;
        }
        v27 = v16;
      }
      BOOL v18 = [(SFDynamicURLImageResource *)self supportsResizing];
      if (v18 == [(SFDynamicURLImageResource *)v6 supportsResizing])
      {
        v19 = [(SFDynamicURLImageResource *)self imageOptions];
        v20 = [(SFDynamicURLImageResource *)v6 imageOptions];
        v21 = v20;
        if ((v19 == 0) != (v20 != 0))
        {
          uint64_t v22 = [(SFDynamicURLImageResource *)self imageOptions];
          if (v22)
          {
            v23 = (void *)v22;
            v26 = [(SFDynamicURLImageResource *)self imageOptions];
            v25 = [(SFDynamicURLImageResource *)v6 imageOptions];
            char v17 = [v26 isEqual:v25];
          }
          else
          {

            char v17 = 1;
          }
LABEL_20:
          v16 = v27;
          if (!v15)
          {
LABEL_22:

            goto LABEL_23;
          }
LABEL_21:

          goto LABEL_22;
        }
      }
      char v17 = 0;
      goto LABEL_20;
    }
    char v17 = 0;
  }
LABEL_25:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(SFDynamicURLImageResource *)self pixelWidth];
  objc_msgSend(v4, "setPixelWidth:");
  [(SFDynamicURLImageResource *)self pixelHeight];
  objc_msgSend(v4, "setPixelHeight:");
  long double v5 = [(SFDynamicURLImageResource *)self formatURL];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setFormatURL:v6];

  objc_msgSend(v4, "setSupportsResizing:", -[SFDynamicURLImageResource supportsResizing](self, "supportsResizing"));
  double v7 = [(SFDynamicURLImageResource *)self imageOptions];
  double v8 = (void *)[v7 copy];
  [v4 setImageOptions:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBDynamicURLImageResource alloc] initWithFacade:self];
  double v3 = [(_SFPBDynamicURLImageResource *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBDynamicURLImageResource alloc] initWithFacade:self];
  double v3 = [(_SFPBDynamicURLImageResource *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBDynamicURLImageResource alloc] initWithFacade:self];
  long double v5 = [(_SFPBDynamicURLImageResource *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFDynamicURLImageResource)initWithCoder:(id)a3
{
  id v4 = a3;
  long double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBDynamicURLImageResource alloc] initWithData:v5];
  double v7 = [(SFDynamicURLImageResource *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasSupportsResizing
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSupportsResizing:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportsResizing = a3;
}

- (BOOL)hasPixelHeight
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPixelHeight:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_pixelHeight = a3;
}

- (BOOL)hasPixelWidth
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPixelWidth:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pixelWidth = a3;
}

- (id)_sf_replacementStringForPropertyEntryKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  double v8 = [(SFDynamicURLImageResource *)self imageOptions];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__SFDynamicURLImageResource_SiriSupport___sf_replacementStringForPropertyEntryKey_value___block_invoke;
  v13[3] = &unk_1E5A2E650;
  id v9 = v6;
  id v14 = v9;
  v16 = &v17;
  id v10 = v7;
  id v15 = v10;
  [v8 enumerateObjectsUsingBlock:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __89__SFDynamicURLImageResource_SiriSupport___sf_replacementStringForPropertyEntryKey_value___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 name];
  int v7 = [v6 isEqualToString:a1[4]];

  if (v7)
  {
    uint64_t v8 = a1[5];
    if (v8)
    {
      id v6 = [v10 options];
      [v6 objectForKeyedSubscript:a1[5]];
    }
    else
    {
      [v10 defaultValue];
    id v9 = };
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v9);
    if (v8)
    {

      id v9 = v6;
    }

    *a4 = 1;
  }
}

- (id)_sf_urlForSettings:(id)a3 shouldResize:(BOOL)a4 width:(double)a5 height:(double)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  if (v8 && [(SFDynamicURLImageResource *)self supportsResizing])
  {
    double v11 = round(a5);
    double v12 = round(a6);
  }
  else
  {
    [(SFDynamicURLImageResource *)self pixelWidth];
    double v11 = v13;
    [(SFDynamicURLImageResource *)self pixelHeight];
    double v12 = v14;
  }
  id v15 = [(SFDynamicURLImageResource *)self formatURL];
  v16 = (void *)[v15 mutableCopy];

  if ([v16 length])
  {
    uint64_t v17 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\{[^}]+\\}" options:0 error:0];
    BOOL v18 = [(SFDynamicURLImageResource *)self formatURL];
    uint64_t v19 = [v18 length];

    v20 = [(SFDynamicURLImageResource *)self formatURL];
    v21 = objc_msgSend(v17, "matchesInString:options:range:", v20, 0, 0, v19);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __87__SFDynamicURLImageResource_SiriSupport___sf_urlForSettings_shouldResize_width_height___block_invoke;
    v28 = &unk_1E5A2E628;
    id v29 = v20;
    uint64_t v33 = (uint64_t)v11;
    uint64_t v34 = (uint64_t)v12;
    id v30 = v16;
    v31 = self;
    id v32 = v10;
    id v22 = v20;
    [v21 enumerateObjectsWithOptions:2 usingBlock:&v25];
  }
  if (objc_msgSend(v16, "length", v25, v26, v27, v28))
  {
    v23 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __87__SFDynamicURLImageResource_SiriSupport___sf_urlForSettings_shouldResize_width_height___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 range] + 1;
  [v3 range];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, v5 - 2);
  if ([v6 isEqualToString:@"w"])
  {
    int v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v3 range];
    uint64_t v10 = v9;
    double v11 = NSString;
    double v12 = NSNumber;
    uint64_t v13 = *(void *)(a1 + 64);
LABEL_5:
    id v15 = [v12 numberWithInteger:v13];
    v16 = [v11 stringWithFormat:@"%@", v15];
    objc_msgSend(v7, "replaceCharactersInRange:withString:", v8, v10, v16);

    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"h"])
  {
    int v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v3 range];
    uint64_t v10 = v14;
    double v11 = NSString;
    double v12 = NSNumber;
    uint64_t v13 = *(void *)(a1 + 72);
    goto LABEL_5;
  }
  if (([v6 isEqualToString:@"color-profile"] & 1) != 0
    || [v6 isEqualToString:@"f"])
  {
    uint64_t v17 = *(void **)(a1 + 48);
    BOOL v18 = [*(id *)(a1 + 56) objectForKeyedSubscript:v6];
    uint64_t v19 = objc_msgSend(v17, "_sf_replacementStringForPropertyEntryKey:value:", v6, v18);

    if (v19)
    {
      v20 = *(void **)(a1 + 40);
      uint64_t v21 = [v3 range];
      objc_msgSend(v20, "replaceCharactersInRange:withString:", v21, v22, v19);
    }
    else
    {
      if (PARLogHandleForCategory_onceToken != -1) {
        dispatch_once(&PARLogHandleForCategory_onceToken, &__block_literal_global);
      }
      v23 = (void *)PARLogHandleForCategory_logHandles_1;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1, OS_LOG_TYPE_ERROR))
      {
        v24 = *(void **)(a1 + 56);
        uint64_t v25 = v23;
        uint64_t v26 = [v24 objectForKeyedSubscript:v6];
        uint64_t v27 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        id v29 = v6;
        __int16 v30 = 2112;
        v31 = v26;
        __int16 v32 = 2112;
        uint64_t v33 = v27;
        _os_log_error_impl(&dword_1A0C02000, v25, OS_LOG_TYPE_ERROR, "Could not find formatReplacement for key: %@, value: %@, in image resource: %@", buf, 0x20u);
      }
    }
  }
LABEL_15:
}

- (id)sf_urlForSettings:(id)a3 size:(CGSize)a4
{
  return [(SFDynamicURLImageResource *)self _sf_urlForSettings:a3 shouldResize:1 width:a4.width height:a4.height];
}

- (id)sf_urlForSettings:(id)a3
{
  return [(SFDynamicURLImageResource *)self _sf_urlForSettings:a3 shouldResize:0 width:0.0 height:0.0];
}

- (SFDynamicURLImageResource)initWithProtobuf:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFDynamicURLImageResource;
  uint64_t v5 = [(SFDynamicURLImageResource *)&v26 init];
  if (v5)
  {
    id v6 = [v4 pixelWidth];

    if (v6)
    {
      int v7 = [v4 pixelWidth];
      [v7 doubleValue];
      -[SFDynamicURLImageResource setPixelWidth:](v5, "setPixelWidth:");
    }
    uint64_t v8 = [v4 pixelHeight];

    if (v8)
    {
      uint64_t v9 = [v4 pixelHeight];
      [v9 doubleValue];
      -[SFDynamicURLImageResource setPixelHeight:](v5, "setPixelHeight:");
    }
    uint64_t v10 = [v4 formatURL];

    if (v10)
    {
      double v11 = [v4 formatURL];
      [(SFDynamicURLImageResource *)v5 setFormatURL:v11];
    }
    if ([v4 supportsResizing]) {
      -[SFDynamicURLImageResource setSupportsResizing:](v5, "setSupportsResizing:", [v4 supportsResizing]);
    }
    double v12 = [v4 imageOptions];
    if (v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v13 = 0;
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = objc_msgSend(v4, "imageOptions", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [[SFImageOption alloc] initWithProtobuf:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          if (v19) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v16);
    }

    [(SFDynamicURLImageResource *)v5 setImageOptions:v13];
    v20 = v5;
  }
  return v5;
}

@end