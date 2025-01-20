@interface PTCinematographyFocusBlend
- (BOOL)isEqual:(id)a3;
- (PTCinematographyDetection)primaryFocusDetection;
- (PTCinematographyDetection)secondaryFocusDetection;
- (PTCinematographyFocusBlend)initWithPrimaryDetection:(id)a3 secondaryDetection:(id)a4 primaryCoefficient:(float)a5;
- (float)primaryFocusCoefficient;
- (float)secondaryFocusCoefficient;
- (id)_asCinematographyDictionary;
- (id)_asCoefficientsDictionary;
- (id)_initWithDetections:(id)a3 cinematographyDictionary:(id)a4;
- (id)_initWithDetections:(id)a3 coefficients:(id)a4;
- (id)_initWithDetections:(id)a3 coefficientsDictionary:(id)a4;
- (id)description;
- (id)initFocusedBetweenDetection:(id)a3 detection:(id)a4 coefficient:(float)a5;
- (id)initFocusedOnDetection:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setFocusBetweenDetection:(id)a3 detection:(id)a4 coefficient:(float)a5;
- (void)_setFocusOnDetection:(id)a3;
- (void)_setFocusOnPrimaryDetection:(id)a3 secondaryDetection:(id)a4 primaryCoefficient:(float)a5;
@end

@implementation PTCinematographyFocusBlend

- (id)initFocusedOnDetection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PTCinematographyFocusBlend;
  v5 = [(PTCinematographyFocusBlend *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PTCinematographyFocusBlend *)v5 _setFocusOnDetection:v4];
  }

  return v6;
}

- (id)initFocusedBetweenDetection:(id)a3 detection:(id)a4 coefficient:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PTCinematographyFocusBlend;
  v10 = [(PTCinematographyFocusBlend *)&v14 init];
  v12 = v10;
  if (v10)
  {
    *(float *)&double v11 = a5;
    [(PTCinematographyFocusBlend *)v10 _setFocusBetweenDetection:v8 detection:v9 coefficient:v11];
  }

  return v12;
}

- (PTCinematographyFocusBlend)initWithPrimaryDetection:(id)a3 secondaryDetection:(id)a4 primaryCoefficient:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PTCinematographyFocusBlend;
  v10 = [(PTCinematographyFocusBlend *)&v14 init];
  v12 = v10;
  if (v10)
  {
    *(float *)&double v11 = a5;
    [(PTCinematographyFocusBlend *)v10 _setFocusOnPrimaryDetection:v8 secondaryDetection:v9 primaryCoefficient:v11];
  }

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PTCinematographyFocusBlend);
  if (v4)
  {
    uint64_t v5 = [(PTCinematographyFocusBlend *)self primaryFocusDetection];
    primaryFocusDetection = v4->_primaryFocusDetection;
    v4->_primaryFocusDetection = (PTCinematographyDetection *)v5;

    uint64_t v7 = [(PTCinematographyFocusBlend *)self secondaryFocusDetection];
    secondaryFocusDetection = v4->_secondaryFocusDetection;
    v4->_secondaryFocusDetection = (PTCinematographyDetection *)v7;

    [(PTCinematographyFocusBlend *)self primaryFocusCoefficient];
    v4->_primaryFocusCoefficient = v9;
    [(PTCinematographyFocusBlend *)self secondaryFocusCoefficient];
    v4->_secondaryFocusCoefficient = v10;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v7 = (PTCinematographyFocusBlend *)a3;
  if (v7 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      [(PTCinematographyFocusBlend *)self primaryFocusCoefficient];
      float v10 = v9;
      [(PTCinematographyFocusBlend *)v8 primaryFocusCoefficient];
      if (v10 != v11)
      {
        char v14 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v12 = [(PTCinematographyFocusBlend *)self primaryFocusDetection];
      if (v12
        || ([(PTCinematographyFocusBlend *)v8 primaryFocusDetection],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v4 = [(PTCinematographyFocusBlend *)self primaryFocusDetection];
        uint64_t v5 = [(PTCinematographyFocusBlend *)v8 primaryFocusDetection];
        if (([v4 isEqual:v5] & 1) == 0)
        {

          char v14 = 0;
          goto LABEL_21;
        }
        LODWORD(v13) = 1;
      }
      else
      {
        LODWORD(v13) = 0;
      }
      [(PTCinematographyFocusBlend *)self secondaryFocusCoefficient];
      float v16 = v15;
      [(PTCinematographyFocusBlend *)v8 secondaryFocusCoefficient];
      if (v16 == v17)
      {
        v18 = [(PTCinematographyFocusBlend *)self secondaryFocusDetection];
        if (v18
          || ([(PTCinematographyFocusBlend *)v8 secondaryFocusDetection],
              (uint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          char v25 = (char)v13;
          v13 = v3;
          v19 = [(PTCinematographyFocusBlend *)self secondaryFocusDetection];
          v20 = [(PTCinematographyFocusBlend *)v8 secondaryFocusDetection];
          char v14 = [v19 isEqual:v20];

          if (v18)
          {

            v3 = v13;
            if ((v25 & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_20;
          }
          v3 = v13;
          LOBYTE(v13) = v25;
          v22 = v24;
        }
        else
        {
          v22 = 0;
          char v14 = 1;
        }

        if ((v13 & 1) == 0) {
          goto LABEL_21;
        }
LABEL_20:

        goto LABEL_21;
      }
      char v14 = 0;
      if (v13) {
        goto LABEL_20;
      }
LABEL_21:
      if (!v12) {

      }
      goto LABEL_24;
    }
    char v14 = 0;
  }
LABEL_25:

  return v14;
}

- (unint64_t)hash
{
  [(PTCinematographyFocusBlend *)self primaryFocusCoefficient];
  float v4 = v3;
  uint64_t v5 = [(PTCinematographyFocusBlend *)self primaryFocusDetection];
  float v6 = (float)(unint64_t)[v5 hash];
  [(PTCinematographyFocusBlend *)self secondaryFocusCoefficient];
  float v8 = v7;
  float v9 = [(PTCinematographyFocusBlend *)self secondaryFocusDetection];
  unint64_t v10 = (unint64_t)(float)((float)((float)(v8 * (float)(unint64_t)[v9 hash])
                                        + (float)(v4 * v6))
                                * 1000.0);

  return v10;
}

- (id)description
{
  float v3 = NSString;
  float v4 = [(PTCinematographyFocusBlend *)self primaryFocusDetection];
  uint64_t v5 = [v4 focusIdentifier];
  float v6 = NSNumber;
  [(PTCinematographyFocusBlend *)self primaryFocusCoefficient];
  float v7 = objc_msgSend(v6, "numberWithFloat:");
  float v8 = [(PTCinematographyFocusBlend *)self secondaryFocusDetection];
  float v9 = [v8 focusIdentifier];
  unint64_t v10 = NSNumber;
  [(PTCinematographyFocusBlend *)self secondaryFocusCoefficient];
  float v11 = objc_msgSend(v10, "numberWithFloat:");
  v12 = [v3 stringWithFormat:@"FocusBlend(%@: %@; %@: %@)", v5, v7, v9, v11];

  return v12;
}

- (id)_initWithDetections:(id)a3 coefficients:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PTCinematographyFocusBlend;
  float v8 = [(PTCinematographyFocusBlend *)&v19 init];
  if (v8 && [v6 count])
  {
    uint64_t v9 = 0;
    p_primaryFocusCoefficient = &v8->_primaryFocusCoefficient;
    p_secondaryFocusCoefficient = &v8->_secondaryFocusCoefficient;
    while (1)
    {
      v12 = [v6 objectAtIndexedSubscript:v9];
      v13 = [v7 objectAtIndexedSubscript:v9];
      [v13 floatValue];
      float v15 = v14;

      if (v15 > *p_primaryFocusCoefficient) {
        break;
      }
      float v16 = &v8->_secondaryFocusCoefficient;
      p_secondaryFocusDetection = (id *)&v8->_secondaryFocusDetection;
      if (v15 > *p_secondaryFocusCoefficient) {
        goto LABEL_7;
      }
LABEL_8:

      if (++v9 >= (unint64_t)[v6 count]) {
        goto LABEL_9;
      }
    }
    float *p_secondaryFocusCoefficient = *p_primaryFocusCoefficient;
    objc_storeStrong((id *)&v8->_secondaryFocusDetection, v8->_primaryFocusDetection);
    float v16 = &v8->_primaryFocusCoefficient;
    p_secondaryFocusDetection = (id *)&v8->_primaryFocusDetection;
LABEL_7:
    *float v16 = v15;
    objc_storeStrong(p_secondaryFocusDetection, v12);
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (void)_setFocusOnDetection:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFocusDetection, a3);
  id v5 = a3;
  self->_primaryFocusCoefficient = 1.0;
  secondaryFocusDetection = self->_secondaryFocusDetection;
  self->_secondaryFocusDetection = 0;

  self->_secondaryFocusCoefficient = 0.0;
}

- (void)_setFocusBetweenDetection:(id)a3 detection:(id)a4 coefficient:(float)a5
{
  float v9 = 1.0 - a5;
  if ((float)(1.0 - a5) > a5) {
    id v10 = a4;
  }
  else {
    id v10 = a3;
  }
  p_primaryFocusDetection = &self->_primaryFocusDetection;
  if ((float)(1.0 - a5) > a5) {
    float v12 = a5;
  }
  else {
    float v12 = 1.0 - a5;
  }
  objc_storeStrong((id *)p_primaryFocusDetection, v10);
  id v13 = a4;
  id v14 = a3;
  float v15 = v14;
  if (v9 > a5) {
    float v16 = 1.0 - a5;
  }
  else {
    float v16 = a5;
  }
  self->_primaryFocusCoefficient = v16;
  if (v9 > a5) {
    float v17 = v14;
  }
  else {
    float v17 = v13;
  }
  objc_storeStrong((id *)&self->_secondaryFocusDetection, v17);

  self->_secondaryFocusCoefficient = v12;
}

- (void)_setFocusOnPrimaryDetection:(id)a3 secondaryDetection:(id)a4 primaryCoefficient:(float)a5
{
  id v10 = a3;
  id v9 = a4;
  objc_storeStrong((id *)&self->_primaryFocusDetection, a3);
  self->_primaryFocusCoefficient = a5;
  if (a5 < 1.0)
  {
    objc_storeStrong((id *)&self->_secondaryFocusDetection, a4);
    self->_secondaryFocusCoefficient = 1.0 - a5;
  }
}

- (id)_initWithDetections:(id)a3 cinematographyDictionary:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v36 = a4;
  v38 = [v36 objectForKeyedSubscript:@"primary"];
  if (!v38)
  {
    id v9 = 0;
    goto LABEL_17;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v44 != v10) {
        objc_enumerationMutation(v6);
      }
      float v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      id v13 = [v12 trackNumber];
      if ([v13 isEqual:v38])
      {
      }
      else
      {
        id v14 = [v12 focusIdentifier];
        int v15 = [v14 isEqual:v38];

        if (!v15) {
          continue;
        }
      }
      id v16 = v12;

      id v9 = v16;
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
  }
  while (v8);
LABEL_16:

LABEL_17:
  float v17 = [v36 objectForKeyedSubscript:@"secondary"];
  if (v17)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v34 = v5;
    obuint64_t j = v5;
    uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (!v18)
    {
      v20 = 0;
      goto LABEL_32;
    }
    uint64_t v19 = v18;
    v20 = 0;
    uint64_t v21 = *(void *)v40;
    while (1)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        v24 = [v23 trackNumber];
        if ([v24 isEqual:v17])
        {
        }
        else
        {
          char v25 = [v23 focusIdentifier];
          int v26 = [v25 isEqual:v17];

          if (!v26) {
            continue;
          }
        }
        id v27 = v23;

        v20 = v27;
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (!v19)
      {
LABEL_32:

        id v5 = v34;
        goto LABEL_33;
      }
    }
  }
  v20 = 0;
LABEL_33:
  v28 = [v36 objectForKeyedSubscript:@"coefficient"];
  [v28 floatValue];
  int v30 = v29;

  LODWORD(v31) = v30;
  v32 = [(PTCinematographyFocusBlend *)self initWithPrimaryDetection:v9 secondaryDetection:v20 primaryCoefficient:v31];

  return v32;
}

- (id)_asCinematographyDictionary
{
  float v3 = objc_opt_new();
  float v4 = [(PTCinematographyDetection *)self->_primaryFocusDetection trackNumber];
  if (v4)
  {
    [v3 setObject:v4 forKeyedSubscript:@"primary"];
  }
  else
  {
    id v5 = [(PTCinematographyDetection *)self->_primaryFocusDetection focusIdentifier];
    [v3 setObject:v5 forKeyedSubscript:@"primary"];
  }
  id v6 = [(PTCinematographyDetection *)self->_secondaryFocusDetection trackNumber];
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"secondary"];
  }
  else
  {
    uint64_t v7 = [(PTCinematographyDetection *)self->_secondaryFocusDetection focusIdentifier];
    [v3 setObject:v7 forKeyedSubscript:@"secondary"];
  }
  *(float *)&double v8 = self->_primaryFocusCoefficient;
  id v9 = [NSNumber numberWithFloat:v8];
  [v3 setObject:v9 forKeyedSubscript:@"coefficient"];

  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (id)_initWithDetections:(id)a3 coefficientsDictionary:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "focusIdentifier", (void)v20);
        uint64_t v15 = [v7 objectForKeyedSubscript:v14];
        id v16 = (void *)v15;
        if (v15) {
          float v17 = (void *)v15;
        }
        else {
          float v17 = &unk_1F26C0EC8;
        }
        [v8 addObject:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  id v18 = [(PTCinematographyFocusBlend *)self _initWithDetections:v9 coefficients:v8];
  return v18;
}

- (id)_asCoefficientsDictionary
{
  float v3 = objc_opt_new();
  float v4 = [(PTCinematographyDetection *)self->_primaryFocusDetection focusIdentifier];

  if (v4)
  {
    *(float *)&double v5 = self->_primaryFocusCoefficient;
    id v6 = [NSNumber numberWithFloat:v5];
    id v7 = [(PTCinematographyDetection *)self->_primaryFocusDetection focusIdentifier];
    [v3 setObject:v6 forKeyedSubscript:v7];
  }
  double v8 = [(PTCinematographyDetection *)self->_secondaryFocusDetection focusIdentifier];

  if (v8)
  {
    *(float *)&double v9 = self->_secondaryFocusCoefficient;
    uint64_t v10 = [NSNumber numberWithFloat:v9];
    uint64_t v11 = [(PTCinematographyDetection *)self->_secondaryFocusDetection focusIdentifier];
    [v3 setObject:v10 forKeyedSubscript:v11];
  }
  uint64_t v12 = (void *)[v3 copy];

  return v12;
}

- (PTCinematographyDetection)primaryFocusDetection
{
  return self->_primaryFocusDetection;
}

- (PTCinematographyDetection)secondaryFocusDetection
{
  return self->_secondaryFocusDetection;
}

- (float)primaryFocusCoefficient
{
  return self->_primaryFocusCoefficient;
}

- (float)secondaryFocusCoefficient
{
  return self->_secondaryFocusCoefficient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFocusDetection, 0);

  objc_storeStrong((id *)&self->_primaryFocusDetection, 0);
}

@end