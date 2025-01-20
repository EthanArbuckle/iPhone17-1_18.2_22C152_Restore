@interface ALCLStairClimbingModel
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)machineFrequency;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMachineFrequency:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLStairClimbingModel

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLStairClimbingModel;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLStairClimbingModel *)&v3 description], [(ALCLStairClimbingModel *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  *(float *)&double v4 = self->_machineFrequency;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"machineFrequency"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10096A250((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_machineFrequency);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 2) = LODWORD(self->_machineFrequency);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5) {
    LOBYTE(v5) = self->_machineFrequency == *((float *)a3 + 2);
  }
  return v5;
}

- (unint64_t)hash
{
  float machineFrequency = self->_machineFrequency;
  float v3 = -machineFrequency;
  if (machineFrequency >= 0.0) {
    float v3 = self->_machineFrequency;
  }
  float v4 = floorf(v3 + 0.5);
  float v5 = (float)(v3 - v4) * 1.8447e19;
  float v6 = fmodf(v4, 1.8447e19);
  unint64_t v7 = 2654435761u * (unint64_t)v6;
  unint64_t v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0) {
    unint64_t v8 = 2654435761u * (unint64_t)v6;
  }
  unint64_t v9 = v7 - (unint64_t)fabsf(v5);
  if (v5 < 0.0) {
    return v9;
  }
  else {
    return v8;
  }
}

- (void)mergeFrom:(id)a3
{
  self->_float machineFrequency = *((float *)a3 + 2);
}

- (float)machineFrequency
{
  return self->_machineFrequency;
}

- (void)setMachineFrequency:(float)a3
{
  self->_float machineFrequency = a3;
}

@end