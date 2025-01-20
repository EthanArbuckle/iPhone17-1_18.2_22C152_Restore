@interface REInteractionDescriptor
- (BOOL)enableExploreExploit;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (REFeature)biasFeature;
- (REFeature)identificationFeature;
- (REFeature)selectionFeature;
- (REInteractionDescriptor)init;
- (float)exploreBias;
- (float)initialProbability;
- (float)trainingSimulationExploreBias;
- (float)varianceEpsilon;
- (float)weight;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setBiasFeature:(id)a3;
- (void)setEnableExploreExploit:(BOOL)a3;
- (void)setExploreBias:(float)a3;
- (void)setIdentificationFeature:(id)a3;
- (void)setInitialProbability:(float)a3;
- (void)setName:(id)a3;
- (void)setSelectionFeature:(id)a3;
- (void)setTrainingSimulationExploreBias:(float)a3;
- (void)setVarianceEpsilon:(float)a3;
- (void)setWeight:(float)a3;
@end

@implementation REInteractionDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setName:self->_name];
  *(float *)&double v5 = self->_weight;
  [v4 setWeight:v5];
  *(float *)&double v6 = self->_exploreBias;
  [v4 setExploreBias:v6];
  *(float *)&double v7 = self->_trainingSimulationExploreBias;
  [v4 setTrainingSimulationExploreBias:v7];
  *(float *)&double v8 = self->_initialProbability;
  [v4 setInitialProbability:v8];
  [v4 setEnableExploreExploit:self->_enableExploreExploit];
  [v4 setIdentificationFeature:self->_identificationFeature];
  [v4 setSelectionFeature:self->_selectionFeature];
  [v4 setBiasFeature:self->_biasFeature];
  *(float *)&double v9 = self->_varianceEpsilon;
  [v4 setVarianceEpsilon:v9];
  return v4;
}

- (void)setWeight:(float)a3
{
  self->_weight = a3;
}

- (void)setVarianceEpsilon:(float)a3
{
  self->_varianceEpsilon = a3;
}

- (void)setTrainingSimulationExploreBias:(float)a3
{
  self->_trainingSimulationExploreBias = a3;
}

- (void)setSelectionFeature:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setInitialProbability:(float)a3
{
  self->_initialProbability = a3;
}

- (void)setIdentificationFeature:(id)a3
{
}

- (void)setExploreBias:(float)a3
{
  self->_exploreBias = a3;
}

- (void)setEnableExploreExploit:(BOOL)a3
{
  self->_enableExploreExploit = a3;
}

- (void)setBiasFeature:(id)a3
{
}

- (REInteractionDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)REInteractionDescriptor;
  v2 = [(REInteractionDescriptor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 12) = xmmword_21E7E9F40;
    v2[8] = 1;
    v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = 0;

    *((_DWORD *)v3 + 7) = 981668463;
  }
  return (REInteractionDescriptor *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasFeature, 0);
  objc_storeStrong((id *)&self->_selectionFeature, 0);
  objc_storeStrong((id *)&self->_identificationFeature, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (REFeature)biasFeature
{
  return self->_biasFeature;
}

- (float)exploreBias
{
  return self->_exploreBias;
}

- (float)varianceEpsilon
{
  return self->_varianceEpsilon;
}

- (float)trainingSimulationExploreBias
{
  return self->_trainingSimulationExploreBias;
}

- (float)initialProbability
{
  return self->_initialProbability;
}

- (REFeature)identificationFeature
{
  return self->_identificationFeature;
}

- (BOOL)enableExploreExploit
{
  return self->_enableExploreExploit;
}

- (NSString)name
{
  return self->_name;
}

- (float)weight
{
  return self->_weight;
}

- (REFeature)selectionFeature
{
  return self->_selectionFeature;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REInteractionDescriptor *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      objc_super v6 = v5;
      if (vabds_f32(self->_weight, v5->_weight) >= 0.00000011921
        || vabds_f32(self->_exploreBias, v5->_exploreBias) >= 0.00000011921
        || vabds_f32(self->_trainingSimulationExploreBias, v5->_trainingSimulationExploreBias) >= 0.00000011921
        || vabds_f32(self->_initialProbability, v5->_initialProbability) >= 0.00000011921
        || self->_enableExploreExploit != v5->_enableExploreExploit)
      {
        goto LABEL_24;
      }
      name = self->_name;
      double v8 = v5->_name;
      if (name == v8)
      {
      }
      else
      {
        double v9 = v8;
        v10 = name;
        int v11 = [(NSString *)v10 isEqual:v9];

        if (!v11) {
          goto LABEL_24;
        }
      }
      identificationFeature = self->_identificationFeature;
      v14 = v6->_identificationFeature;
      if (identificationFeature == v14)
      {
      }
      else
      {
        v15 = v14;
        v16 = identificationFeature;
        BOOL v17 = [(REFeature *)v16 isEqual:v15];

        if (!v17) {
          goto LABEL_24;
        }
      }
      selectionFeature = self->_selectionFeature;
      v19 = v6->_selectionFeature;
      if (selectionFeature == v19)
      {
      }
      else
      {
        v20 = v19;
        v21 = selectionFeature;
        BOOL v22 = [(REFeature *)v21 isEqual:v20];

        if (!v22) {
          goto LABEL_24;
        }
      }
      biasFeature = self->_biasFeature;
      v24 = v6->_biasFeature;
      if (biasFeature == v24)
      {
      }
      else
      {
        v25 = v24;
        v26 = biasFeature;
        BOOL v27 = [(REFeature *)v26 isEqual:v25];

        if (!v27)
        {
LABEL_24:
          BOOL v12 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      BOOL v12 = vabds_f32(self->_varianceEpsilon, v6->_varianceEpsilon) < 0.00000011921;
      goto LABEL_25;
    }
    BOOL v12 = 0;
  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  *(float *)&double v2 = self->_weight;
  v4 = [NSNumber numberWithFloat:v2];
  uint64_t v5 = [v4 hash];
  *(float *)&double v6 = self->_exploreBias;
  double v7 = [NSNumber numberWithFloat:v6];
  uint64_t v8 = [v7 hash] ^ v5;
  *(float *)&double v9 = self->_trainingSimulationExploreBias;
  v10 = [NSNumber numberWithFloat:v9];
  uint64_t v11 = [v10 hash];
  *(float *)&double v12 = self->_initialProbability;
  v13 = [NSNumber numberWithFloat:v12];
  uint64_t v14 = v8 ^ v11 ^ [v13 hash];
  v15 = [NSNumber numberWithBool:self->_enableExploreExploit];
  uint64_t v16 = [v15 hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_name hash];
  unint64_t v18 = v14 ^ v17 ^ [(REFeature *)self->_identificationFeature hash];
  unint64_t v19 = [(REFeature *)self->_selectionFeature hash];
  unint64_t v20 = v19 ^ [(REFeature *)self->_biasFeature hash];
  *(float *)&double v21 = self->_varianceEpsilon;
  BOOL v22 = [NSNumber numberWithFloat:v21];
  unint64_t v23 = v18 ^ v20 ^ [v22 hash];

  return v23;
}

@end