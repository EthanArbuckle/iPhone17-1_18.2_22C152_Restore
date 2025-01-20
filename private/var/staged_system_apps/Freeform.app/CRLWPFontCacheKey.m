@interface CRLWPFontCacheKey
+ (id)cacheKeyWithFontName:(id)a3 fontSize:(double)a4 bold:(BOOL)a5 italic:(BOOL)a6 fontFeatures:(id)a7;
+ (id)cacheKeyWithFontName:(id)a3 size:(double)a4;
- (BOOL)bold;
- (BOOL)hasExtraFields;
- (BOOL)isEqual:(id)a3;
- (BOOL)italic;
- (CRLWPFontCacheKey)initWithFontName:(id)a3 fontSize:(double)a4 hasExtraFields:(BOOL)a5 bold:(BOOL)a6 italic:(BOOL)a7 fontFeatures:(id)a8;
- (NSArray)fontFeatures;
- (NSString)fontName;
- (double)fontSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)hashValue;
- (void)setHashValue:(unint64_t)a3;
@end

@implementation CRLWPFontCacheKey

+ (id)cacheKeyWithFontName:(id)a3 size:(double)a4
{
  id v6 = a3;
  id v7 = a1;
  objc_sync_enter(v7);
  if (!qword_1016A8D70
    || ([(id)qword_1016A8D70 fontSize], v8 != a4)
    || ([(id)qword_1016A8D70 fontName],
        v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 isEqualToString:v6],
        v9,
        (v10 & 1) == 0))
  {
    id v11 = [objc_alloc((Class)objc_opt_class()) initWithFontName:v6 fontSize:0 hasExtraFields:0 bold:0 italic:0 fontFeatures:a4];
    v12 = (void *)qword_1016A8D70;
    qword_1016A8D70 = (uint64_t)v11;
  }
  id v13 = (id)qword_1016A8D70;
  objc_sync_exit(v7);

  return v13;
}

+ (id)cacheKeyWithFontName:(id)a3 fontSize:(double)a4 bold:(BOOL)a5 italic:(BOOL)a6 fontFeatures:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = a3;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithFontName:v12 fontSize:1 hasExtraFields:v8 bold:v7 italic:v11 fontFeatures:a4];

  return v13;
}

- (CRLWPFontCacheKey)initWithFontName:(id)a3 fontSize:(double)a4 hasExtraFields:(BOOL)a5 bold:(BOOL)a6 italic:(BOOL)a7 fontFeatures:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CRLWPFontCacheKey;
  v16 = [(CRLWPFontCacheKey *)&v24 init];
  if (v16)
  {
    v17 = (NSString *)[v14 copy];
    fontName = v16->_fontName;
    v16->_fontName = v17;

    v16->_fontSize = a4;
    if (v11)
    {
      v16->_hasExtraFields = 1;
      v16->_bold = a6;
      v16->_italic = a7;
      objc_storeStrong((id *)&v16->_fontFeatures, a8);
      NSUInteger v19 = [(NSString *)v16->_fontName hash];
      uint64_t v20 = 2;
      if (!v16->_bold) {
        uint64_t v20 = 4;
      }
      unint64_t v21 = v19 ^ v20;
      uint64_t v22 = 8;
      if (!v16->_italic) {
        uint64_t v22 = 16;
      }
      v16->_hashValue = v21 ^ v22 ^ (unint64_t)v16->_fontSize;
    }
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = sub_1002469D0(v5, v4);

  if (!v6) {
    goto LABEL_13;
  }
  id v7 = [v6 hash];
  if (v7 != (id)[(CRLWPFontCacheKey *)self hash]) {
    goto LABEL_13;
  }
  [v6 fontSize];
  if (v8 != self->_fontSize) {
    goto LABEL_13;
  }
  v9 = [v6 fontName];
  unsigned int v10 = [v9 isEqualToString:self->_fontName];

  if (!v10) {
    goto LABEL_13;
  }
  if (![v6 hasExtraFields]
    || !self->_hasExtraFields
    || self->_bold != [v6 bold]
    || self->_italic != [v6 italic])
  {
    if (([v6 hasExtraFields] & 1) == 0)
    {
      unsigned __int8 v13 = !self->_hasExtraFields;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!self->_fontFeatures)
  {
    id v15 = [v6 fontFeatures];

    if (!v15)
    {
      unsigned __int8 v13 = 1;
      goto LABEL_14;
    }
    if (!self->_fontFeatures) {
      goto LABEL_13;
    }
  }
  BOOL v11 = [v6 fontFeatures];

  if (!v11)
  {
LABEL_13:
    unsigned __int8 v13 = 0;
    goto LABEL_14;
  }
  id v12 = [v6 fontFeatures];
  unsigned __int8 v13 = [v12 isEqual:self->_fontFeatures];

LABEL_14:
  return v13;
}

- (unint64_t)hash
{
  return self->_hashValue;
}

- (id)description
{
  BOOL hasExtraFields = self->_hasExtraFields;
  uint64_t v4 = objc_opt_class();
  fontName = self->_fontName;
  if (hasExtraFields)
  {
    if (self->_bold) {
      CFStringRef v6 = @"+BOLD";
    }
    else {
      CFStringRef v6 = @"-BOLD";
    }
    CFStringRef v7 = @"+ITALIC";
    if (!self->_italic) {
      CFStringRef v7 = @"-ITALIC";
    }
    if (self->_fontFeatures) {
      CFStringRef v8 = @"+FONTFEATURES";
    }
    else {
      CFStringRef v8 = @"-FONTFEATURES";
    }
    +[NSString stringWithFormat:@"(%@*) %p %@ %g %@ %@ %@", v4, self, fontName, *(void *)&self->_fontSize, v6, v7, v8];
  }
  else
  {
    +[NSString stringWithFormat:@"(%@*) %p %@ %g", v4, self, fontName, *(void *)&self->_fontSize, v11, v12, v13];
  v9 = };

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CRLWPFontCacheKey alloc];
  uint64_t v5 = [(CRLWPFontCacheKey *)self fontName];
  [(CRLWPFontCacheKey *)self fontSize];
  double v7 = v6;
  BOOL v8 = [(CRLWPFontCacheKey *)self hasExtraFields];
  BOOL v9 = [(CRLWPFontCacheKey *)self bold];
  BOOL v10 = [(CRLWPFontCacheKey *)self italic];
  uint64_t v11 = [(CRLWPFontCacheKey *)self fontFeatures];
  uint64_t v12 = [(CRLWPFontCacheKey *)v4 initWithFontName:v5 fontSize:v8 hasExtraFields:v9 bold:v10 italic:v11 fontFeatures:v7];

  return v12;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (BOOL)hasExtraFields
{
  return self->_hasExtraFields;
}

- (BOOL)bold
{
  return self->_bold;
}

- (BOOL)italic
{
  return self->_italic;
}

- (NSArray)fontFeatures
{
  return self->_fontFeatures;
}

- (unint64_t)hashValue
{
  return self->_hashValue;
}

- (void)setHashValue:(unint64_t)a3
{
  self->_hashValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFeatures, 0);

  objc_storeStrong((id *)&self->_fontName, 0);
}

@end