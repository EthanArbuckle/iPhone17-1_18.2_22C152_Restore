@interface REForcedRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHistoric;
- (REForcedRelevanceProvider)initWithDictionary:(id)a3;
- (REForcedRelevanceProvider)initWithForcedRelevance:(float)a3;
- (REForcedRelevanceProvider)initWithForcedRelevance:(float)a3 isHistoric:(BOOL)a4;
- (float)relevance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
@end

@implementation REForcedRelevanceProvider

- (REForcedRelevanceProvider)initWithForcedRelevance:(float)a3
{
  return -[REForcedRelevanceProvider initWithForcedRelevance:isHistoric:](self, "initWithForcedRelevance:isHistoric:", 0);
}

- (REForcedRelevanceProvider)initWithForcedRelevance:(float)a3 isHistoric:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)REForcedRelevanceProvider;
  result = [(RERelevanceProvider *)&v7 init];
  if (result)
  {
    result->_relevance = a3;
    result->_isHistoric = a4;
  }
  return result;
}

+ (id)relevanceSimulatorID
{
  return @"force";
}

- (REForcedRelevanceProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"relevance"];
  v6 = [v4 objectForKeyedSubscript:@"historic"];

  [v5 floatValue];
  int v8 = v7;
  uint64_t v9 = [v6 BOOLValue];
  LODWORD(v10) = v8;
  v11 = [(REForcedRelevanceProvider *)self initWithForcedRelevance:v9 isHistoric:v10];

  return v11;
}

- (id)dictionaryEncoding
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"relevance";
  *(float *)&double v2 = self->_relevance;
  id v4 = [NSNumber numberWithFloat:v2];
  v8[1] = @"historic";
  v9[0] = v4;
  v5 = [NSNumber numberWithBool:self->_isHistoric];
  v9[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REForcedRelevanceProvider;
  id result = [(RERelevanceProvider *)&v5 copyWithZone:a3];
  *((_DWORD *)result + 9) = LODWORD(self->_relevance);
  *((unsigned char *)result + 32) = self->_isHistoric;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REForcedRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REForcedRelevanceProvider;
    BOOL v5 = [(RERelevanceProvider *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_relevance == v4->_relevance
      && self->_isHistoric == v4->_isHistoric;
  }

  return v5;
}

- (unint64_t)_hash
{
  *(float *)&double v2 = self->_relevance;
  id v4 = [NSNumber numberWithFloat:v2];
  uint64_t v5 = [v4 hash];
  v6 = [NSNumber numberWithBool:self->_isHistoric];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)REForcedRelevanceProvider;
  v3 = [(REForcedRelevanceProvider *)&v8 description];
  id v4 = v3;
  if (self->_isHistoric) {
    uint64_t v5 = @" historic";
  }
  else {
    uint64_t v5 = &stru_26CFA57D0;
  }
  v6 = [v3 stringByAppendingFormat:@" relevance=%f%@", self->_relevance, v5];

  return v6;
}

- (float)relevance
{
  return self->_relevance;
}

- (BOOL)isHistoric
{
  return self->_isHistoric;
}

@end