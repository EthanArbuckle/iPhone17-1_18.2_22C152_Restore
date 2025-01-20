@interface MapsUIImageGEOFeatureSpec
- (BOOL)inverted;
- (BOOL)isEqual:(id)a3;
- (BOOL)markerFallback;
- (BOOL)transparent;
- (BOOL)useSearchImageFallback;
- (GEOFeatureStyleAttributes)style;
- (MapsUIImageGEOFeatureSpec)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4;
- (unint64_t)hash;
- (unint64_t)size;
- (void)setInverted:(BOOL)a3;
- (void)setMarkerFallback:(BOOL)a3;
- (void)setSize:(unint64_t)a3;
- (void)setStyle:(id)a3;
- (void)setTransparent:(BOOL)a3;
@end

@implementation MapsUIImageGEOFeatureSpec

- (MapsUIImageGEOFeatureSpec)init
{
  v3.receiver = self;
  v3.super_class = (Class)MapsUIImageGEOFeatureSpec;
  result = [(MapsUIImageGEOFeatureSpec *)&v3 init];
  if (result)
  {
    *(&result->super._isRTL + 1) = 1;
    result->_style = (GEOFeatureStyleAttributes *)3;
    *(&result->super._isRTL + 2) = 0;
  }
  return result;
}

- (BOOL)useSearchImageFallback
{
  return 1;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(MapsUIImageGEOFeatureSpec *)self style];
  if (GEOConfigGetBOOL() && [v7 poiType] == 225)
  {
    uint64_t v20 = 0x7F00000006;
    id v8 = [v7 copy];

    [v8 replaceAttributes:&v20 count:1];
    v7 = v8;
  }
  unsigned int v9 = [(MapsUIImageGEOFeatureSpec *)self transparent];
  if (*(&self->super._isRTL + 3)) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  unint64_t v11 = [(MapsUIImageGEOFeatureSpec *)self size];
  LOBYTE(v18) = [(MapsUIImageSpec *)self nightMode];
  v12 = +[MKIconManager imageForStyle:v7 size:v11 forScale:1 format:v10 transparent:0 transitMode:v4 isCarplay:a3 nightMode:v18];
  if (!v12)
  {
    if ([(MapsUIImageGEOFeatureSpec *)self markerFallback])
    {
      v13 = +[GEOFeatureStyleAttributes markerStyleAttributes];
      unint64_t v14 = [(MapsUIImageGEOFeatureSpec *)self size];
      BOOL v15 = [(MapsUIImageGEOFeatureSpec *)self transparent];
      LOBYTE(v19) = [(MapsUIImageSpec *)self nightMode];
      v12 = +[MKIconManager imageForStyle:v13 size:v14 forScale:1 format:v15 transparent:0 transitMode:v4 isCarplay:a3 nightMode:v19];
    }
    else
    {
      v12 = 0;
    }
  }
  if (*(&self->super._isRTL + 3))
  {
    uint64_t v16 = [v12 _maps_invertedImage];

    v12 = (void *)v16;
  }

  return v12;
}

- (GEOFeatureStyleAttributes)style
{
  objc_super v3 = *(void **)&self->_markerFallback;
  if (!v3)
  {
    uint64_t v4 = +[GEOFeatureStyleAttributes markerStyleAttributes];
    v5 = *(void **)&self->_markerFallback;
    *(void *)&self->_markerFallback = v4;

    objc_super v3 = *(void **)&self->_markerFallback;
  }

  return (GEOFeatureStyleAttributes *)v3;
}

- (void)setStyle:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4 || (v5 = [(MapsUIImageGEOFeatureSpec *)self markerFallback], id v4 = 0, !v5))
  {
    id v6 = [v4 copy];
  }
  else
  {
    id v6 = +[GEOFeatureStyleAttributes markerStyleAttributes];
  }
  v7 = *(void **)&self->_markerFallback;
  *(void *)&self->_markerFallback = v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  [v4 setMarkerFallback:[self markerFallback]];
  unsigned int v5 = [(MapsUIImageGEOFeatureSpec *)self style];
  [v4 setStyle:v5];

  [v4 setSize:[self size]];
  [v4 setTransparent:[self transparent]];
  [v4 setInverted:[self inverted]];
  [v4 setNightMode:[self nightMode]];
  return v4;
}

- (unint64_t)hash
{
  objc_super v3 = [(MapsUIImageGEOFeatureSpec *)self style];
  [v3 featureStyleAttributes];
  uint64_t v4 = featureStyleAttributesHash();
  unsigned int v5 = [(MapsUIImageGEOFeatureSpec *)self markerFallback];
  uint64_t v6 = 713;
  if (!v5) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v6 ^ v4;
  id v8 = +[NSNumber numberWithUnsignedInteger:[(MapsUIImageGEOFeatureSpec *)self size]];
  unint64_t v9 = (unint64_t)[v8 hash];
  unsigned int v10 = [(MapsUIImageGEOFeatureSpec *)self transparent];
  uint64_t v11 = 1124;
  if (!v10) {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v7 ^ v11;
  unsigned int v13 = [(MapsUIImageGEOFeatureSpec *)self inverted];
  uint64_t v14 = 2248;
  if (!v13) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v12 ^ v14;
  unsigned int v16 = [(MapsUIImageSpec *)self nightMode];
  uint64_t v17 = 4496;
  if (!v16) {
    uint64_t v17 = 0;
  }
  unint64_t v18 = v15 ^ v17 ^ v9;

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = [(MapsUIImageGEOFeatureSpec *)self markerFallback];
    if (v6 != [v5 markerFallback]) {
      goto LABEL_7;
    }
    uint64_t v7 = [(MapsUIImageGEOFeatureSpec *)self style];
    id v8 = [v5 style];
    unsigned int v9 = [v7 isEqual:v8];

    if (!v9) {
      goto LABEL_7;
    }
    id v10 = [(MapsUIImageGEOFeatureSpec *)self size];
    if (v10 == [v5 size]
      && (unsigned int v11 = [(MapsUIImageGEOFeatureSpec *)self transparent],
          v11 == [v5 transparent])
      && (unsigned int v12 = [(MapsUIImageGEOFeatureSpec *)self inverted],
          v12 == [v5 inverted]))
    {
      unsigned int v15 = [(MapsUIImageSpec *)self nightMode];
      unsigned int v13 = v15 ^ [v5 nightMode] ^ 1;
    }
    else
    {
LABEL_7:
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  CFStringRef v4 = @"YES";
  if ([(MapsUIImageGEOFeatureSpec *)self markerFallback]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  unint64_t v6 = [(MapsUIImageGEOFeatureSpec *)self size];
  if (![(MapsUIImageGEOFeatureSpec *)self transparent]) {
    CFStringRef v4 = @"NO";
  }
  uint64_t v7 = [(MapsUIImageGEOFeatureSpec *)self style];
  id v8 = +[NSString stringWithFormat:@"<%@: %p markerFallback=%@ size=%lu transparent=%@ style=%@>", v3, self, v5, v6, v4, v7];

  return v8;
}

- (BOOL)markerFallback
{
  return *(&self->super._isRTL + 1);
}

- (void)setMarkerFallback:(BOOL)a3
{
  *(&self->super._isRTL + 1) = a3;
}

- (unint64_t)size
{
  return (unint64_t)self->_style;
}

- (void)setSize:(unint64_t)a3
{
  self->_style = (GEOFeatureStyleAttributes *)a3;
}

- (BOOL)transparent
{
  return *(&self->super._isRTL + 2);
}

- (void)setTransparent:(BOOL)a3
{
  *(&self->super._isRTL + 2) = a3;
}

- (BOOL)inverted
{
  return *(&self->super._isRTL + 3);
}

- (void)setInverted:(BOOL)a3
{
  *(&self->super._isRTL + 3) = a3;
}

- (void).cxx_destruct
{
}

@end