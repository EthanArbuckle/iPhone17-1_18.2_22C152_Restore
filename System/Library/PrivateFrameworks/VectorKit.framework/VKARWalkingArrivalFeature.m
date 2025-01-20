@interface VKARWalkingArrivalFeature
- (BOOL)isEqual:(id)a3;
- (GEOFeatureStyleAttributes)styleAttributes;
- (NSArray)storeFronts;
- (VKARWalkingArrivalFeature)initWithARInfo:(id)a3 undulationProvider:(id)a4 iconStyleAttributes:(id)a5;
- (VKARWalkingArrivalFeature)initWithGeocentricPosition:(Geocentric<double>)a3 iconStyleAttributes:(id)a4;
- (VKARWalkingArrivalFeature)initWithPosition:(id)a3 iconStyleAttributes:(id)a4;
- (VKARWalkingArrivalFeature)initWithStoreFront:(id)a3 iconStyleAttributes:(id)a4;
- (VKARWalkingArrivalFeature)initWithStoreFronts:(id)a3 iconStyleAttributes:(id)a4;
- (id)_stringForAttributes;
- (id)description;
@end

@implementation VKARWalkingArrivalFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFronts, 0);
  objc_storeStrong((id *)&self->_arInfo, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (NSArray)storeFronts
{
  return self->_storeFronts;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  arInfo = self->_arInfo;
  v7 = [(VKARWalkingArrivalFeature *)self _stringForAttributes];
  v8 = [v3 stringWithFormat:@"<%@: %p arInfo:%@ styleAttributes:%@ storeFronts:%@>", v5, self, arInfo, v7, self->_storeFronts];

  return v8;
}

- (id)_stringForAttributes
{
  if (self->_styleAttributes)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", 3 * -[GEOFeatureStyleAttributes countAttrs](self->_styleAttributes, "countAttrs"));
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [v3 appendFormat:@"<%@: %p", v5, self];

    [v3 appendString:@" attrs:["];
    uint64_t v6 = 0;
    for (unint64_t i = 1; i - 1 < [(GEOFeatureStyleAttributes *)self->_styleAttributes countAttrs]; ++i)
    {
      uint64_t v8 = [(GEOFeatureStyleAttributes *)self->_styleAttributes v];
      objc_msgSend(v3, "appendFormat:", @"(%d,%d)", *(unsigned int *)(v8 + v6), *(unsigned int *)(v8 + v6 + 4));
      if (i < [(GEOFeatureStyleAttributes *)self->_styleAttributes countAttrs]) {
        [v3 appendString:@","];
      }
      v6 += 8;
    }
    [v3 appendString:@"]>"];
    v9 = [NSString stringWithString:v3];
  }
  else
  {
    v9 = &stru_1EF593218;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VKARWalkingArrivalFeature;
  if ([(VKARWalkingFeature *)&v17 isEqual:v4] && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    uint64_t v8 = (GEOARInfo **)v4;
    v9 = v8;
    if (self->_arInfo != v8[4]) {
      goto LABEL_6;
    }
    storeFronts = self->_storeFronts;
    v11 = [v8 storeFronts];
    id v12 = storeFronts;
    unint64_t v13 = v11;
    if (!((unint64_t)v12 | v13)
      || (v14 = (void *)v13,
          char v15 = [v12 isEqual:v13],
          v14,
          v12,
          v14,
          (v15 & 1) != 0))
    {
      v16 = [v9 styleAttributes];
      BOOL v6 = GeoCodecsFeatureStyleAttributesCompare() == 0;
    }
    else
    {
LABEL_6:
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (VKARWalkingArrivalFeature)initWithStoreFronts:(id)a3 iconStyleAttributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VKARWalkingArrivalFeature;
  v9 = [(VKARWalkingFeature *)&v13 initWithType:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeFronts, a3);
    objc_storeStrong((id *)&v10->_styleAttributes, a4);
    v11 = v10;
  }

  return v10;
}

- (VKARWalkingArrivalFeature)initWithStoreFront:(id)a3 iconStyleAttributes:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v9 = [(VKARWalkingArrivalFeature *)self initWithStoreFronts:v8 iconStyleAttributes:v7];

  return v9;
}

- (VKARWalkingArrivalFeature)initWithGeocentricPosition:(Geocentric<double>)a3 iconStyleAttributes:(id)a4
{
  double v4 = a3._e[2];
  double v5 = a3._e[1];
  double v6 = a3._e[0];
  id v8 = a4;
  double v14 = v6;
  double v15 = v5;
  double v16 = v4;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0x3FF0000000000000;
  long long v21 = 0u;
  long long v22 = 0u;
  v9 = (void *)MEMORY[0x1E4F1C978];
  v10 = [[VKARWalkingArrivalStoreFront alloc] initWithOrientedRect:&v14];
  v11 = objc_msgSend(v9, "arrayWithObjects:", v10, 0, *(void *)&v14, *(void *)&v15, *(void *)&v16, v17, v18, v19, v20, v21, v22);

  id v12 = [(VKARWalkingArrivalFeature *)self initWithStoreFronts:v11 iconStyleAttributes:v8];
  return v12;
}

- (VKARWalkingArrivalFeature)initWithPosition:(id)a3 iconStyleAttributes:(id)a4
{
  double var2 = a3.var2;
  double v7 = a3.var1 * 0.0174532925;
  __double2 v8 = __sincos_stret(a3.var0 * 0.0174532925);
  double v9 = 6378137.0 / sqrt(v8.__sinval * v8.__sinval * -0.00669437999 + 1.0);
  __double2 v10 = __sincos_stret(v7);
  return -[VKARWalkingArrivalFeature initWithGeocentricPosition:iconStyleAttributes:](self, "initWithGeocentricPosition:iconStyleAttributes:", a4, (v9 + var2) * v8.__cosval * v10.__cosval, (v9 + var2) * v8.__cosval * v10.__sinval, (var2 + v9 * 0.99330562) * v8.__sinval);
}

- (VKARWalkingArrivalFeature)initWithARInfo:(id)a3 undulationProvider:(id)a4 iconStyleAttributes:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v22 = a5;
  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v11 = [v8 storefrontFaceGeometrys];
  id v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  objc_super v13 = [v8 storefrontFaceGeometrys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = [[VKARWalkingArrivalStoreFront alloc] initWithGEOOrientedBox:*(void *)(*((void *)&v23 + 1) + 8 * v16) undulationProvider:v9];
        if (v17) {
          [v12 addObject:v17];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(VKARWalkingArrivalFeature *)self initWithStoreFronts:v12 iconStyleAttributes:v22];
  uint64_t v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_arInfo, a3);
  }

  return v19;
}

@end