@interface REContent
+ (BOOL)supportsSecureCoding;
- (BOOL)bodyImageShouldStretch;
- (BOOL)isEqual:(id)a3;
- (BOOL)tintColorAffectsHeader;
- (BOOL)useMonospaceFont;
- (CGRect)imageFocusRect;
- (CLKImageProvider)bodyImageProvider;
- (CLKImageProvider)headerImageProvider;
- (CLKTextProvider)description1TextProvider;
- (CLKTextProvider)description2TextProvider;
- (CLKTextProvider)description3TextProvider;
- (CLKTextProvider)headerTextProvider;
- (NSAttributedString)description1Text;
- (NSAttributedString)description2Text;
- (NSAttributedString)description3Text;
- (NSAttributedString)headerText;
- (NSDictionary)loggingContentValues;
- (NSNumber)description1Opacity;
- (NSString)bodyImageCompositingFilter;
- (NSString)overrideBodyString;
- (REAccessoryDescription)descriptionAccessory;
- (REAccessoryImage)imageAccessory;
- (REAccessoryMatchup)matchupAccessory;
- (REContent)init;
- (REContent)initWithCoder:(id)a3;
- (REImageContentProvider)bodyImageContentProvider;
- (REImageContentProvider)headerImageContentProvider;
- (RETextContentProvider)description1TextContentProvider;
- (RETextContentProvider)description2TextContentProvider;
- (RETextContentProvider)description3TextContentProvider;
- (RETextContentProvider)headerTextContentProvider;
- (UIColor)tintColor;
- (UIImage)bodyImage;
- (UIImage)headerImage;
- (UIImage)overrideBodyImage;
- (UIImage)overrideHeaderImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)description1FontStyle;
- (unint64_t)description2FontStyle;
- (unint64_t)hash;
- (unint64_t)headerFontStyle;
- (unint64_t)punchThrough;
- (unint64_t)style;
- (unsigned)headerImageEdge;
- (void)encodeWithCoder:(id)a3;
- (void)setBodyImageCompositingFilter:(id)a3;
- (void)setBodyImageContentProvider:(id)a3;
- (void)setBodyImageProvider:(id)a3;
- (void)setBodyImageShouldStretch:(BOOL)a3;
- (void)setDescription1FontStyle:(unint64_t)a3;
- (void)setDescription1Opacity:(id)a3;
- (void)setDescription1Text:(id)a3;
- (void)setDescription1TextContentProvider:(id)a3;
- (void)setDescription1TextProvider:(id)a3;
- (void)setDescription2FontStyle:(unint64_t)a3;
- (void)setDescription2Text:(id)a3;
- (void)setDescription2TextContentProvider:(id)a3;
- (void)setDescription2TextProvider:(id)a3;
- (void)setDescription3Text:(id)a3;
- (void)setDescription3TextContentProvider:(id)a3;
- (void)setDescription3TextProvider:(id)a3;
- (void)setDescriptionAccessory:(id)a3;
- (void)setHeaderFontStyle:(unint64_t)a3;
- (void)setHeaderImageContentProvider:(id)a3;
- (void)setHeaderImageEdge:(unsigned int)a3;
- (void)setHeaderImageProvider:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setHeaderTextContentProvider:(id)a3;
- (void)setHeaderTextProvider:(id)a3;
- (void)setImageAccessory:(id)a3;
- (void)setImageFocusRect:(CGRect)a3;
- (void)setMatchupAccessory:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setOverrideBodyImage:(id)a3;
- (void)setOverrideBodyString:(id)a3;
- (void)setOverrideHeaderImage:(id)a3;
- (void)setPunchThrough:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setTintColorAffectsHeader:(BOOL)a3;
- (void)setUseMonospaceFont:(BOOL)a3;
@end

@implementation REContent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REContent)init
{
  v8.receiver = self;
  v8.super_class = (Class)REContent;
  v2 = [(REContent *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    contents = v2->_contents;
    v2->_contents = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFFA18] defaultTimeZone];
    timeZone = v2->_timeZone;
    v2->_timeZone = (NSTimeZone *)v5;

    [(REContent *)v2 setObject:@"REElementInteractionDefault" forKey:@"REContentInteractionKey"];
  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v15 = a3;
  id v12 = a4;
  if (v12)
  {
    contents = self->_contents;
    if (v15) {
      [(NSMutableDictionary *)contents setObject:v15 forKey:v12];
    }
    else {
      [(NSMutableDictionary *)contents removeObjectForKey:v12];
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Key cannot be nil", v6, v7, v8, v9, v10, v11, v14);
  }
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_contents objectForKey:a3];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableDictionary *)self->_contents hash];
  return [(NSTimeZone *)self->_timeZone hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REContent *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      timeZone = self->_timeZone;
      uint64_t v7 = v5->_timeZone;
      if (timeZone == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        uint64_t v9 = timeZone;
        int v10 = [(NSTimeZone *)v9 isEqual:v8];

        if (!v10)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      contents = self->_contents;
      v13 = v5->_contents;
      uint64_t v14 = contents;
      id v15 = v14;
      if (v14 == v13) {
        char v11 = 1;
      }
      else {
        char v11 = [(NSMutableDictionary *)v14 isEqual:v13];
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:self->_contents copyItems:1];
  uint64_t v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  objc_storeStrong((id *)(v4 + 16), self->_timeZone);
  return (id)v4;
}

- (REContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REContent;
  uint64_t v5 = [(REContent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"content"];
    contents = v5->_contents;
    v5->_contents = (NSMutableDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"timezone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contents = self->_contents;
  id v5 = a3;
  [v5 encodeObject:contents forKey:@"content"];
  [v5 encodeObject:self->_timeZone forKey:@"timezone"];
}

- (NSDictionary)loggingContentValues
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_contents, "count"));
  contents = self->_contents;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__REContent_loggingContentValues__block_invoke;
  v8[3] = &unk_2644BC4E8;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)contents enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = (void *)[v5 copy];

  return (NSDictionary *)v6;
}

void __33__REContent_loggingContentValues__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = REDescriptionForExportedObject(v5);
  uint64_t v7 = (void *)[v6 mutableCopy];

  if (objc_opt_respondsToSelector())
  {
    [v7 appendString:@" "];
    uint64_t v8 = [v5 contentEncodedString];
    [v7 appendString:v8];
  }
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v9];
}

- (void)setOverrideHeaderImage:(id)a3
{
}

- (UIImage)overrideHeaderImage
{
  return (UIImage *)[(REContent *)self objectForKey:@"REContentHeaderImageKey"];
}

- (void)setOverrideBodyImage:(id)a3
{
}

- (UIImage)overrideBodyImage
{
  return (UIImage *)[(REContent *)self objectForKey:@"REContentBodyImageKey"];
}

- (void)setBodyImageCompositingFilter:(id)a3
{
}

- (NSString)bodyImageCompositingFilter
{
  return (NSString *)[(REContent *)self objectForKey:@"REContentBodyImageCompositingFilterKey"];
}

- (void)setHeaderTextContentProvider:(id)a3
{
}

- (RETextContentProvider)headerTextContentProvider
{
  v2 = [(REContent *)self objectForKey:@"REContentHeaderTextKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  return (RETextContentProvider *)v3;
}

- (void)setHeaderImageContentProvider:(id)a3
{
}

- (REImageContentProvider)headerImageContentProvider
{
  v2 = [(REContent *)self objectForKey:@"REContentHeaderImageKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  return (REImageContentProvider *)v3;
}

- (void)setBodyImageContentProvider:(id)a3
{
}

- (REImageContentProvider)bodyImageContentProvider
{
  v2 = [(REContent *)self objectForKey:@"REContentBodyImageKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  return (REImageContentProvider *)v3;
}

- (void)setDescription1TextContentProvider:(id)a3
{
}

- (RETextContentProvider)description1TextContentProvider
{
  v2 = [(REContent *)self objectForKey:@"REContentDescription1TextKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  return (RETextContentProvider *)v3;
}

- (void)setDescription2TextContentProvider:(id)a3
{
}

- (RETextContentProvider)description2TextContentProvider
{
  v2 = [(REContent *)self objectForKey:@"REContentDescription2TextKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  return (RETextContentProvider *)v3;
}

- (void)setDescription3TextContentProvider:(id)a3
{
}

- (RETextContentProvider)description3TextContentProvider
{
  v2 = [(REContent *)self objectForKey:@"REContentDescription3TextKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  return (RETextContentProvider *)v3;
}

- (void)setPunchThrough:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(REContent *)self setObject:v4 forKey:@"REContentPunchThroughKey"];
}

- (unint64_t)punchThrough
{
  v2 = [(REContent *)self objectForKey:@"REContentPunchThroughKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  if (v3) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)tintColor
{
  return (UIColor *)[(REContent *)self objectForKey:@"REContentTintColorKey"];
}

- (void)setStyle:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(REContent *)self setObject:v4 forKey:@"REContentStyleKey"];
}

- (unint64_t)style
{
  v2 = [(REContent *)self objectForKey:@"REContentStyleKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  if (v3) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setUseMonospaceFont:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(REContent *)self setObject:v4 forKey:@"REContentUseMonospacedFontKey"];
}

- (BOOL)useMonospaceFont
{
  v2 = [(REContent *)self objectForKey:@"REContentUseMonospacedFontKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setHeaderFontStyle:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(REContent *)self setObject:v4 forKey:@"REContentHeaderFontStyleKey"];
}

- (unint64_t)headerFontStyle
{
  v2 = [(REContent *)self objectForKey:@"REContentHeaderFontStyleKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  if (v3) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

- (void)setDescription1FontStyle:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(REContent *)self setObject:v4 forKey:@"REContentDescription1FontStyleKey"];
}

- (unint64_t)description1FontStyle
{
  v2 = [(REContent *)self objectForKey:@"REContentDescription1FontStyleKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  if (v3) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setDescription2FontStyle:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(REContent *)self setObject:v4 forKey:@"REContentDescription2FontStyleKey"];
}

- (unint64_t)description2FontStyle
{
  v2 = [(REContent *)self objectForKey:@"REContentDescription2FontStyleKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  if (v3) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)setTintColorAffectsHeader:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(REContent *)self setObject:v4 forKey:@"REContentTintColorAffectsHeaderKey"];
}

- (BOOL)tintColorAffectsHeader
{
  v2 = [(REContent *)self objectForKey:@"REContentTintColorAffectsHeaderKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setBodyImageShouldStretch:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(REContent *)self setObject:v4 forKey:@"REContentBodyImageShouldStretchKey"];
}

- (BOOL)bodyImageShouldStretch
{
  v2 = [(REContent *)self objectForKey:@"REContentBodyImageShouldStretchKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setHeaderImageEdge:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(REContent *)self setObject:v4 forKey:@"REContentHeaderImageEdgeKey"];
}

- (unsigned)headerImageEdge
{
  v2 = [(REContent *)self objectForKey:@"REContentHeaderImageEdgeKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  if (v3) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (void)setDescriptionAccessory:(id)a3
{
  id v4 = (id)[a3 copy];
  [(REContent *)self setObject:v4 forKey:@"REContentDescriptionAccessoryKey"];
}

- (REAccessoryDescription)descriptionAccessory
{
  v2 = [(REContent *)self objectForKey:@"REContentDescriptionAccessoryKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  return (REAccessoryDescription *)v3;
}

- (void)setImageAccessory:(id)a3
{
  id v4 = (id)[a3 copy];
  [(REContent *)self setObject:v4 forKey:@"REContentImageAccessoryKey"];
}

- (REAccessoryImage)imageAccessory
{
  v2 = [(REContent *)self objectForKey:@"REContentImageAccessoryKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  return (REAccessoryImage *)v3;
}

- (void)setMatchupAccessory:(id)a3
{
}

- (REAccessoryMatchup)matchupAccessory
{
  v2 = [(REContent *)self objectForKey:@"REContentMatchupAccessoryKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  return (REAccessoryMatchup *)v3;
}

- (void)setImageFocusRect:(CGRect)a3
{
  objc_msgSend(MEMORY[0x263F08D40], "re_valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(REContent *)self setObject:v4 forKey:@"REContentImageFocusRectKey"];
}

- (CGRect)imageFocusRect
{
  v2 = [(REContent *)self objectForKey:@"REContentImageFocusRectKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  if (v3)
  {
    objc_msgSend(v3, "re_CGRectValue");
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v9 = 0.0;
    *(double *)&uint64_t v5 = INFINITY;
    *(double *)&uint64_t v7 = INFINITY;
    double v11 = 0.0;
  }

  double v12 = *(double *)&v5;
  double v13 = *(double *)&v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setOverrideBodyString:(id)a3
{
}

- (NSString)overrideBodyString
{
  v2 = [(REContent *)self objectForKey:@"REContentOverrideBodyStringKey"];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);

  return (NSString *)v3;
}

- (void)setDescription1Text:(id)a3
{
  if (a3)
  {
    +[RETextContentProvider contentProviderFromAttributedString:](RESimpleTextContentProvider, "contentProviderFromAttributedString:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(REContent *)self setDescription1TextContentProvider:v4];
  }
  else
  {
    -[REContent setDescription1TextContentProvider:](self, "setDescription1TextContentProvider:");
  }
}

- (NSAttributedString)description1Text
{
  v2 = [(REContent *)self description1TextContentProvider];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);
  id v4 = [v3 attributedStringRepresentation];

  return (NSAttributedString *)v4;
}

- (void)setDescription2Text:(id)a3
{
  if (a3)
  {
    +[RETextContentProvider contentProviderFromAttributedString:](RESimpleTextContentProvider, "contentProviderFromAttributedString:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(REContent *)self setDescription2TextContentProvider:v4];
  }
  else
  {
    -[REContent setDescription2TextContentProvider:](self, "setDescription2TextContentProvider:");
  }
}

- (NSAttributedString)description2Text
{
  v2 = [(REContent *)self description2TextContentProvider];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);
  id v4 = [v3 attributedStringRepresentation];

  return (NSAttributedString *)v4;
}

- (void)setDescription3Text:(id)a3
{
  if (a3)
  {
    +[RETextContentProvider contentProviderFromAttributedString:](RESimpleTextContentProvider, "contentProviderFromAttributedString:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(REContent *)self setDescription3TextContentProvider:v4];
  }
  else
  {
    -[REContent setDescription3TextContentProvider:](self, "setDescription3TextContentProvider:");
  }
}

- (NSAttributedString)description3Text
{
  v2 = [(REContent *)self description3TextContentProvider];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);
  id v4 = [v3 attributedStringRepresentation];

  return (NSAttributedString *)v4;
}

- (void)setHeaderText:(id)a3
{
  if (a3)
  {
    +[RETextContentProvider contentProviderFromAttributedString:](RESimpleTextContentProvider, "contentProviderFromAttributedString:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(REContent *)self setHeaderTextContentProvider:v4];
  }
  else
  {
    -[REContent setHeaderTextContentProvider:](self, "setHeaderTextContentProvider:");
  }
}

- (NSAttributedString)headerText
{
  v2 = [(REContent *)self headerTextContentProvider];
  objc_opt_class();
  uint64_t v3 = REValidateObjectOfClass(v2);
  id v4 = [v3 attributedStringRepresentation];

  return (NSAttributedString *)v4;
}

- (UIImage)headerImage
{
  return 0;
}

- (UIImage)bodyImage
{
  return 0;
}

- (CLKTextProvider)description1TextProvider
{
  uint64_t v3 = [(REContent *)self objectForKey:@"REContentCLKDescription1TextKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(REContent *)self description1TextContentProvider];
    id v5 = [v6 clockKitTextProviderRepresentation];
  }
  return (CLKTextProvider *)v5;
}

- (void)setDescription1TextProvider:(id)a3
{
}

- (CLKTextProvider)description2TextProvider
{
  uint64_t v3 = [(REContent *)self objectForKey:@"REContentCLKDescription2TextKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(REContent *)self description2TextContentProvider];
    id v5 = [v6 clockKitTextProviderRepresentation];
  }
  return (CLKTextProvider *)v5;
}

- (void)setDescription2TextProvider:(id)a3
{
}

- (CLKTextProvider)description3TextProvider
{
  uint64_t v3 = [(REContent *)self objectForKey:@"REContentCLKDescription3TextKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(REContent *)self description3TextContentProvider];
    id v5 = [v6 clockKitTextProviderRepresentation];
  }
  return (CLKTextProvider *)v5;
}

- (void)setDescription3TextProvider:(id)a3
{
}

- (CLKTextProvider)headerTextProvider
{
  uint64_t v3 = [(REContent *)self objectForKey:@"REContentCLKHeaderTextKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(REContent *)self headerTextContentProvider];
    id v5 = [v6 clockKitTextProviderRepresentation];
  }
  return (CLKTextProvider *)v5;
}

- (void)setHeaderTextProvider:(id)a3
{
}

- (CLKImageProvider)bodyImageProvider
{
  uint64_t v3 = [(REContent *)self objectForKey:@"REContentCLKBodyImageKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(REContent *)self bodyImageContentProvider];
    id v5 = [v6 clockKitImageProviderRepresentation];
  }
  return (CLKImageProvider *)v5;
}

- (void)setBodyImageProvider:(id)a3
{
}

- (CLKImageProvider)headerImageProvider
{
  uint64_t v3 = [(REContent *)self objectForKey:@"REContentCLKHeaderImageKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(REContent *)self headerImageContentProvider];
    id v5 = [v6 clockKitImageProviderRepresentation];
  }
  return (CLKImageProvider *)v5;
}

- (void)setHeaderImageProvider:(id)a3
{
}

- (NSNumber)description1Opacity
{
  return (NSNumber *)[(REContent *)self objectForKey:@"REContentDescription1OpacityKey"];
}

- (void)setDescription1Opacity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end