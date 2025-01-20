@interface SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor
+ (Class)featureType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)features;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureAtIndex:(unint64_t)a3;
- (unint64_t)featuresCount;
- (unint64_t)hash;
- (unint64_t)numericalizedFeaturesCount;
- (unint64_t)shapesCount;
- (unsigned)numericalizedFeatureAtIndex:(unint64_t)a3;
- (unsigned)numericalizedFeatures;
- (unsigned)shapeAtIndex:(unint64_t)a3;
- (unsigned)shapes;
- (void)addFeature:(id)a3;
- (void)addNumericalizedFeature:(unsigned int)a3;
- (void)addShape:(unsigned int)a3;
- (void)clearFeatures;
- (void)clearNumericalizedFeatures;
- (void)clearShapes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setNumericalizedFeatures:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setShapes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor

- (void).cxx_destruct
{
}

- (void)setFeatures:(id)a3
{
}

- (NSMutableArray)features
{
  return self->_features;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  uint64_t v5 = [v4 shapesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor addShape:](self, "addShape:", [v4 shapeAtIndex:i]);
  }
  uint64_t v8 = [v4 numericalizedFeaturesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor addNumericalizedFeature:](self, "addNumericalizedFeature:", [v4 numericalizedFeatureAtIndex:j]);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v4[7];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor addFeature:](self, "addFeature:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt32Hash();
  uint64_t v4 = PBRepeatedUInt32Hash() ^ v3;
  return v4 ^ [(NSMutableArray *)self->_features hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    features = self->_features;
    if ((unint64_t)features | v4[7]) {
      char v6 = -[NSMutableArray isEqual:](features, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v6 = self->_features;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addFeature:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v14 = a3;
  if ([(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)self shapesCount])
  {
    [v14 clearShapes];
    unint64_t v4 = [(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)self shapesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v14, "addShape:", -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor shapeAtIndex:](self, "shapeAtIndex:", i));
    }
  }
  if ([(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)self numericalizedFeaturesCount])
  {
    [v14 clearNumericalizedFeatures];
    unint64_t v7 = [(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)self numericalizedFeaturesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v14, "addNumericalizedFeature:", -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor numericalizedFeatureAtIndex:](self, "numericalizedFeatureAtIndex:", j));
    }
  }
  if ([(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)self featuresCount])
  {
    [v14 clearFeatures];
    unint64_t v10 = [(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)self featuresCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
      {
        long long v13 = [(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)self featureAtIndex:k];
        [v14 addFeature:v13];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_shapes.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_shapes.count);
  }
  if (self->_numericalizedFeatures.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_numericalizedFeatures.count);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v7 = self->_features;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensorReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = PBRepeatedUInt32NSArray();
  [v3 setObject:v4 forKey:@"shape"];

  unint64_t v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"numericalized_feature"];

  features = self->_features;
  if (features) {
    [v3 setObject:features forKey:@"feature"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor;
  id v4 = [(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)featureAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_features objectAtIndex:a3];
}

- (unint64_t)featuresCount
{
  return [(NSMutableArray *)self->_features count];
}

- (void)addFeature:(id)a3
{
  id v4 = a3;
  features = self->_features;
  id v8 = v4;
  if (!features)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v7 = self->_features;
    self->_features = v6;

    id v4 = v8;
    features = self->_features;
  }
  [(NSMutableArray *)features addObject:v4];
}

- (void)clearFeatures
{
}

- (void)setNumericalizedFeatures:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unsigned)numericalizedFeatureAtIndex:(unint64_t)a3
{
  p_numericalizedFeatures = &self->_numericalizedFeatures;
  unint64_t count = self->_numericalizedFeatures.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    uint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_numericalizedFeatures->list[a3];
}

- (void)addNumericalizedFeature:(unsigned int)a3
{
}

- (void)clearNumericalizedFeatures
{
}

- (unsigned)numericalizedFeatures
{
  return self->_numericalizedFeatures.list;
}

- (unint64_t)numericalizedFeaturesCount
{
  return self->_numericalizedFeatures.count;
}

- (void)setShapes:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unsigned)shapeAtIndex:(unint64_t)a3
{
  p_shapes = &self->_shapes;
  unint64_t count = self->_shapes.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    uint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_shapes->list[a3];
}

- (void)addShape:(unsigned int)a3
{
}

- (void)clearShapes
{
}

- (unsigned)shapes
{
  return self->_shapes.list;
}

- (unint64_t)shapesCount
{
  return self->_shapes.count;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor;
  [(SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor *)&v3 dealloc];
}

+ (Class)featureType
{
  return (Class)objc_opt_class();
}

@end