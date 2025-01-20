@interface RAPTransitLine
+ (id)transitLinesOnRoutes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (GEOTransitArtworkDataSource)artwork;
- (NSString)displayName;
- (NSString)name;
- (NSString)primaryDescriptionText;
- (NSString)secondaryDescriptionText;
- (NSString)systemName;
- (id)_initWithName:(id)a3 systemName:(id)a4 artworkData:(id)a5 lineFeatureID:(unint64_t)a6;
- (id)_initWithName:(id)a3 systemName:(id)a4 artworkData:(id)a5 lineFeatureID:(unint64_t)a6 primaryDescriptionText:(id)a7 secondaryDescriptionText:(id)a8;
- (id)_initWithTransitLine:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)lineFeatureID;
@end

@implementation RAPTransitLine

- (id)_initWithTransitLine:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  v6 = [v4 system];
  v7 = [v6 name];
  v8 = [v4 artwork];
  id v9 = [v4 muid];

  id v10 = [(RAPTransitLine *)self _initWithName:v5 systemName:v7 artworkData:v8 lineFeatureID:v9];
  return v10;
}

- (id)_initWithName:(id)a3 systemName:(id)a4 artworkData:(id)a5 lineFeatureID:(unint64_t)a6
{
  if (a3) {
    id v6 = a3;
  }
  else {
    id v6 = a4;
  }
  return [(RAPTransitLine *)self _initWithName:a3 systemName:a4 artworkData:a5 lineFeatureID:a6 primaryDescriptionText:v6 secondaryDescriptionText:0];
}

- (id)_initWithName:(id)a3 systemName:(id)a4 artworkData:(id)a5 lineFeatureID:(unint64_t)a6 primaryDescriptionText:(id)a7 secondaryDescriptionText:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v29.receiver = self;
  v29.super_class = (Class)RAPTransitLine;
  v19 = [(RAPTransitLine *)&v29 init];
  if (v19)
  {
    v20 = (NSString *)[v14 copy];
    name = v19->_name;
    v19->_name = v20;

    v22 = (NSString *)[v15 copy];
    systemName = v19->_systemName;
    v19->_systemName = v22;

    objc_storeStrong((id *)&v19->_artwork, a5);
    v19->_lineFeatureID = a6;
    v24 = (NSString *)[v17 copy];
    primaryDescriptionText = v19->_primaryDescriptionText;
    v19->_primaryDescriptionText = v24;

    v26 = (NSString *)[v18 copy];
    secondaryDescriptionText = v19->_secondaryDescriptionText;
    v19->_secondaryDescriptionText = v26;
  }
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RAPTransitLine *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(RAPTransitLine *)self lineFeatureID];
      id v6 = [(RAPTransitLine *)v4 lineFeatureID];
      v7 = [(RAPTransitLine *)self name];
      v8 = [(RAPTransitLine *)v4 name];
      if ([v7 isEqualToString:v8])
      {
        BOOL v9 = 1;
      }
      else
      {
        v11 = [(RAPTransitLine *)self name];
        if (v11)
        {
          BOOL v9 = 0;
        }
        else
        {
          v12 = [(RAPTransitLine *)v4 name];
          BOOL v9 = v12 == 0;
        }
      }

      BOOL v10 = (id)v5 == v6 && v9;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RAPTransitLine *)self lineFeatureID];
  id v4 = [(RAPTransitLine *)self name];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  objc_storeStrong((id *)v5 + 2, self->_artwork);
  id v8 = [(NSString *)self->_primaryDescriptionText copyWithZone:a3];
  BOOL v9 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v8;

  id v10 = [(NSString *)self->_secondaryDescriptionText copyWithZone:a3];
  v11 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v10;

  *((void *)v5 + 5) = self->_lineFeatureID;
  id v12 = [(NSString *)self->_systemName copyWithZone:a3];
  v13 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v12;

  return v5;
}

+ (id)transitLinesOnRoutes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = [v9 transitLinesOnRoute];
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [[RAPTransitLine alloc] _initWithTransitLine:*(void *)(*((void *)&v19 + 1) + 8 * (void)j)];
              [v4 addObject:v15];
            }
            id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  id v16 = [v4 allObjects];

  return v16;
}

- (NSString)displayName
{
  id v3 = [(RAPTransitLine *)self name];
  id v4 = [v3 length];

  if (v4) {
    [(RAPTransitLine *)self name];
  }
  else {
  id v5 = [(RAPTransitLine *)self systemName];
  }

  return (NSString *)v5;
}

- (NSString)name
{
  return self->_name;
}

- (GEOTransitArtworkDataSource)artwork
{
  return self->_artwork;
}

- (NSString)primaryDescriptionText
{
  return self->_primaryDescriptionText;
}

- (NSString)secondaryDescriptionText
{
  return self->_secondaryDescriptionText;
}

- (unint64_t)lineFeatureID
{
  return self->_lineFeatureID;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_secondaryDescriptionText, 0);
  objc_storeStrong((id *)&self->_primaryDescriptionText, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end