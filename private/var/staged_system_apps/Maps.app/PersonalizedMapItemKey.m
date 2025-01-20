@interface PersonalizedMapItemKey
- (BOOL)hasDisambiguationRadiusMeters;
- (BOOL)isEqual:(id)a3;
- (GEOMapItem)geoMapItem;
- (PersonalizedMapItemKey)init;
- (PersonalizedMapItemKey)initWithGeoMapItem:(id)a3;
- (PersonalizedMapItemKey)initWithGeoMapItem:(id)a3 disambiguationRadiusMeters:(float)a4;
- (PersonalizedMapItemKey)initWithMapItem:(id)a3;
- (PersonalizedMapItemKey)initWithMapItem:(id)a3 disambiguationRadiusMeters:(float)a4;
- (float)disambiguationRadiusMeters;
- (unint64_t)hash;
@end

@implementation PersonalizedMapItemKey

- (PersonalizedMapItemKey)initWithMapItem:(id)a3
{
  v4 = [a3 _geoMapItem];
  v5 = [(PersonalizedMapItemKey *)self initWithGeoMapItem:v4];

  return v5;
}

- (PersonalizedMapItemKey)initWithGeoMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PersonalizedMapItemKey;
  v6 = [(PersonalizedMapItemKey *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geoMapItem, a3);
    v7->_hash = GEOMapItemHashForPurpose();
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PersonalizedMapItemKey *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        v7 = [(PersonalizedMapItemKey *)self geoMapItem];
        uint64_t v8 = [(PersonalizedMapItemKey *)v6 geoMapItem];
        objc_super v9 = (void *)v8;
        LOBYTE(v10) = 0;
        if (!v7 || !v8) {
          goto LABEL_22;
        }
        if ([(PersonalizedMapItemKey *)self hasDisambiguationRadiusMeters]
          && [(PersonalizedMapItemKey *)v6 hasDisambiguationRadiusMeters])
        {
          [(PersonalizedMapItemKey *)self disambiguationRadiusMeters];
          [(PersonalizedMapItemKey *)v6 disambiguationRadiusMeters];
LABEL_21:
          LOBYTE(v10) = GEOMapItemIsEqualToMapItemForPurposeWithinDistance();
LABEL_22:

LABEL_23:
          goto LABEL_24;
        }
        if ([(PersonalizedMapItemKey *)self hasDisambiguationRadiusMeters])
        {
          v14 = self;
        }
        else
        {
          if (![(PersonalizedMapItemKey *)v6 hasDisambiguationRadiusMeters]) {
            goto LABEL_21;
          }
          v14 = v6;
        }
        [(PersonalizedMapItemKey *)v14 disambiguationRadiusMeters];
        goto LABEL_21;
      }
      if ([(PersonalizedMapItemKey *)v5 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedItemKeyWithGEOMapItem])
      {
        v6 = [(PersonalizedMapItemKey *)v5 geoMapItem];
        if (v6
          && ([(PersonalizedMapItemKey *)self geoMapItem],
              v11 = objc_claimAutoreleasedReturnValue(),
              v11,
              v11))
        {
          v12 = [(PersonalizedMapItemKey *)self geoMapItem];
          int IsEqualToMapItemForPurposeWithinDistance = GEOMapItemIsEqualToMapItemForPurposeWithinDistance();

          int v10 = IsEqualToMapItemForPurposeWithinDistance << 31 >> 31;
        }
        else
        {
          LOBYTE(v10) = 0;
        }
        goto LABEL_23;
      }
    }
    LOBYTE(v10) = 0;
  }
LABEL_24:

  return v10 & 1;
}

- (BOOL)hasDisambiguationRadiusMeters
{
  return self->_hasDisambiguationRadiusMeters;
}

- (GEOMapItem)geoMapItem
{
  return self->_geoMapItem;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (PersonalizedMapItemKey)init
{
  return 0;
}

- (PersonalizedMapItemKey)initWithGeoMapItem:(id)a3 disambiguationRadiusMeters:(float)a4
{
  result = [(PersonalizedMapItemKey *)self initWithGeoMapItem:a3];
  if (result)
  {
    result->_hasDisambiguationRadiusMeters = 1;
    result->_disambiguationRadiusMeters = a4;
  }
  return result;
}

- (PersonalizedMapItemKey)initWithMapItem:(id)a3 disambiguationRadiusMeters:(float)a4
{
  v6 = [a3 _geoMapItem];
  *(float *)&double v7 = a4;
  uint64_t v8 = [(PersonalizedMapItemKey *)self initWithGeoMapItem:v6 disambiguationRadiusMeters:v7];

  return v8;
}

- (float)disambiguationRadiusMeters
{
  return self->_disambiguationRadiusMeters;
}

- (void).cxx_destruct
{
}

@end