@interface _SFPBRFMapCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)showsUserLocation;
- (NSArray)annotations;
- (NSArray)markers;
- (NSArray)polylines;
- (NSData)jsonData;
- (_SFPBRFMapCardSection)initWithDictionary:(id)a3;
- (_SFPBRFMapCardSection)initWithFacade:(id)a3;
- (_SFPBRFMapCardSection)initWithJSON:(id)a3;
- (double)cameraDistance;
- (id)annotationsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)markersAtIndex:(unint64_t)a3;
- (id)polylineAtIndex:(unint64_t)a3;
- (int)sizeFormat;
- (unint64_t)annotationsCount;
- (unint64_t)hash;
- (unint64_t)markersCount;
- (unint64_t)polylineCount;
- (void)addAnnotations:(id)a3;
- (void)addMarkers:(id)a3;
- (void)addPolyline:(id)a3;
- (void)clearAnnotations;
- (void)clearMarkers;
- (void)clearPolyline;
- (void)setAnnotations:(id)a3;
- (void)setCameraDistance:(double)a3;
- (void)setMarkers:(id)a3;
- (void)setPolyline:(id)a3;
- (void)setPolylines:(id)a3;
- (void)setShowsUserLocation:(BOOL)a3;
- (void)setSizeFormat:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFMapCardSection

- (_SFPBRFMapCardSection)initWithFacade:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFMapCardSection *)self init];
  if (v5)
  {
    if ([v4 hasSizeFormat]) {
      -[_SFPBRFMapCardSection setSizeFormat:](v5, "setSizeFormat:", [v4 sizeFormat]);
    }
    v6 = [v4 markers];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v8 = [v4 markers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBRFMapMarker alloc] initWithFacade:*(void *)(*((void *)&v41 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v10);
    }

    [(_SFPBRFMapCardSection *)v5 setMarkers:v7];
    v14 = [v4 annotations];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v16 = [v4 annotations];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_SFPBRFMapAnnotation alloc] initWithFacade:*(void *)(*((void *)&v37 + 1) + 8 * j)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v18);
    }

    [(_SFPBRFMapCardSection *)v5 setAnnotations:v15];
    v22 = [v4 polyline];
    v32 = v5;
    if (v22) {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v23 = 0;
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v24 = [v4 polyline];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[_SFPBLatLng alloc] initWithFacade:*(void *)(*((void *)&v33 + 1) + 8 * k)];
          if (v29) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v26);
    }

    v5 = v32;
    [(_SFPBRFMapCardSection *)v32 setPolylines:v23];
    if ([v4 hasCameraDistance])
    {
      [v4 cameraDistance];
      -[_SFPBRFMapCardSection setCameraDistance:](v32, "setCameraDistance:");
    }
    if ([v4 hasShowsUserLocation]) {
      -[_SFPBRFMapCardSection setShowsUserLocation:](v32, "setShowsUserLocation:", [v4 showsUserLocation]);
    }
    v30 = v32;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polylines, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_markers, 0);
}

- (BOOL)showsUserLocation
{
  return self->_showsUserLocation;
}

- (double)cameraDistance
{
  return self->_cameraDistance;
}

- (void)setPolylines:(id)a3
{
}

- (NSArray)polylines
{
  return self->_polylines;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (NSArray)markers
{
  return self->_markers;
}

- (int)sizeFormat
{
  return self->_sizeFormat;
}

- (_SFPBRFMapCardSection)initWithDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_SFPBRFMapCardSection;
  v5 = [(_SFPBRFMapCardSection *)&v50 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sizeFormat"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFMapCardSection setSizeFormat:](v5, "setSizeFormat:", [v6 intValue]);
    }
    id v7 = [v4 objectForKeyedSubscript:@"markers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v6;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v47 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = [[_SFPBRFMapMarker alloc] initWithDictionary:v14];
              [(_SFPBRFMapCardSection *)v5 addMarkers:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v53 count:16];
        }
        while (v11);
      }

      v6 = v8;
    }
    v16 = [v4 objectForKeyedSubscript:@"annotations"];
    objc_opt_class();
    long long v37 = v16;
    if (objc_opt_isKindOfClass())
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v43 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v23 = [[_SFPBRFMapAnnotation alloc] initWithDictionary:v22];
              [(_SFPBRFMapCardSection *)v5 addAnnotations:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v52 count:16];
        }
        while (v19);
      }

      v16 = v37;
    }
    v24 = [v4 objectForKeyedSubscript:@"polyline"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v36 = v6;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v51 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v39;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v39 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v31 = [[_SFPBLatLng alloc] initWithDictionary:v30];
              [(_SFPBRFMapCardSection *)v5 addPolyline:v31];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v51 count:16];
        }
        while (v27);
      }

      v6 = v36;
      v16 = v37;
    }
    v32 = [v4 objectForKeyedSubscript:@"cameraDistance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v32 doubleValue];
      -[_SFPBRFMapCardSection setCameraDistance:](v5, "setCameraDistance:");
    }
    long long v33 = [v4 objectForKeyedSubscript:@"showsUserLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFMapCardSection setShowsUserLocation:](v5, "setShowsUserLocation:", [v33 BOOLValue]);
    }
    long long v34 = v5;
  }
  return v5;
}

- (_SFPBRFMapCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFMapCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFMapCardSection *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_annotations count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v5 = self->_annotations;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v43 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v42 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"annotations"];
  }
  if (self->_cameraDistance != 0.0)
  {
    uint64_t v12 = NSNumber;
    [(_SFPBRFMapCardSection *)self cameraDistance];
    v13 = objc_msgSend(v12, "numberWithDouble:");
    [v3 setObject:v13 forKeyedSubscript:@"cameraDistance"];
  }
  if ([(NSArray *)self->_markers count])
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v15 = self->_markers;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [*(id *)(*((void *)&v38 + 1) + 8 * j) dictionaryRepresentation];
          if (v20)
          {
            [v14 addObject:v20];
          }
          else
          {
            v21 = [MEMORY[0x1E4F1CA98] null];
            [v14 addObject:v21];
          }
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"markers"];
  }
  if ([(NSArray *)self->_polylines count])
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = self->_polylines;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = [*(id *)(*((void *)&v34 + 1) + 8 * k) dictionaryRepresentation];
          if (v28)
          {
            [v22 addObject:v28];
          }
          else
          {
            v29 = [MEMORY[0x1E4F1CA98] null];
            [v22 addObject:v29];
          }
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"polyline"];
  }
  if (self->_showsUserLocation)
  {
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFMapCardSection showsUserLocation](self, "showsUserLocation"));
    [v3 setObject:v30 forKeyedSubscript:@"showsUserLocation"];
  }
  if (self->_sizeFormat)
  {
    uint64_t v31 = [(_SFPBRFMapCardSection *)self sizeFormat];
    if (v31)
    {
      if (v31 == 1)
      {
        v32 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v31);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v32 = @"0";
    }
    [v3 setObject:v32 forKeyedSubscript:@"sizeFormat"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t sizeFormat = self->_sizeFormat;
  uint64_t v4 = [(NSArray *)self->_markers hash];
  uint64_t v5 = [(NSArray *)self->_annotations hash];
  uint64_t v6 = [(NSArray *)self->_polylines hash];
  double cameraDistance = self->_cameraDistance;
  if (cameraDistance == 0.0)
  {
    unint64_t v11 = 0;
  }
  else
  {
    double v8 = -cameraDistance;
    if (cameraDistance >= 0.0) {
      double v8 = self->_cameraDistance;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v11 += (unint64_t)v10;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v10);
    }
  }
  if (self->_showsUserLocation) {
    uint64_t v12 = 2654435761;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v5 ^ v6 ^ v11 ^ v12 ^ (2654435761 * sizeFormat);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  int sizeFormat = self->_sizeFormat;
  if (sizeFormat != [v4 sizeFormat]) {
    goto LABEL_18;
  }
  uint64_t v6 = [(_SFPBRFMapCardSection *)self markers];
  uint64_t v7 = [v4 markers];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(_SFPBRFMapCardSection *)self markers];
  if (v8)
  {
    long double v9 = (void *)v8;
    double v10 = [(_SFPBRFMapCardSection *)self markers];
    unint64_t v11 = [v4 markers];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBRFMapCardSection *)self annotations];
  uint64_t v7 = [v4 annotations];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(_SFPBRFMapCardSection *)self annotations];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    id v15 = [(_SFPBRFMapCardSection *)self annotations];
    uint64_t v16 = [v4 annotations];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_SFPBRFMapCardSection *)self polylines];
  uint64_t v7 = [v4 polylines];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v18 = [(_SFPBRFMapCardSection *)self polylines];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(_SFPBRFMapCardSection *)self polylines];
    v21 = [v4 polylines];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  double cameraDistance = self->_cameraDistance;
  [v4 cameraDistance];
  if (cameraDistance == v26)
  {
    int showsUserLocation = self->_showsUserLocation;
    BOOL v23 = showsUserLocation == [v4 showsUserLocation];
    goto LABEL_19;
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_SFPBRFMapCardSection *)self sizeFormat]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v5 = [(_SFPBRFMapCardSection *)self markers];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  double v10 = [(_SFPBRFMapCardSection *)self annotations];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  id v15 = [(_SFPBRFMapCardSection *)self polylines];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  [(_SFPBRFMapCardSection *)self cameraDistance];
  if (v20 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_SFPBRFMapCardSection *)self showsUserLocation]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setShowsUserLocation:(BOOL)a3
{
  self->_int showsUserLocation = a3;
}

- (void)setCameraDistance:(double)a3
{
  self->_double cameraDistance = a3;
}

- (id)polylineAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_polylines objectAtIndexedSubscript:a3];
}

- (unint64_t)polylineCount
{
  return [(NSArray *)self->_polylines count];
}

- (void)addPolyline:(id)a3
{
  id v4 = a3;
  polylines = self->_polylines;
  id v8 = v4;
  if (!polylines)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_polylines;
    self->_polylines = v6;

    id v4 = v8;
    polylines = self->_polylines;
  }
  [(NSArray *)polylines addObject:v4];
}

- (void)clearPolyline
{
}

- (void)setPolyline:(id)a3
{
  self->_polylines = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)annotationsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_annotations objectAtIndexedSubscript:a3];
}

- (unint64_t)annotationsCount
{
  return [(NSArray *)self->_annotations count];
}

- (void)addAnnotations:(id)a3
{
  id v4 = a3;
  annotations = self->_annotations;
  id v8 = v4;
  if (!annotations)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_annotations;
    self->_annotations = v6;

    id v4 = v8;
    annotations = self->_annotations;
  }
  [(NSArray *)annotations addObject:v4];
}

- (void)clearAnnotations
{
}

- (void)setAnnotations:(id)a3
{
  self->_annotations = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)markersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_markers objectAtIndexedSubscript:a3];
}

- (unint64_t)markersCount
{
  return [(NSArray *)self->_markers count];
}

- (void)addMarkers:(id)a3
{
  id v4 = a3;
  markers = self->_markers;
  id v8 = v4;
  if (!markers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_markers;
    self->_markers = v6;

    id v4 = v8;
    markers = self->_markers;
  }
  [(NSArray *)markers addObject:v4];
}

- (void)clearMarkers
{
}

- (void)setMarkers:(id)a3
{
  self->_markers = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSizeFormat:(int)a3
{
  self->_int sizeFormat = a3;
}

@end