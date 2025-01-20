@interface REMotionRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (REMotionRelevanceProvider)initWithDictionary:(id)a3;
- (REMotionRelevanceProvider)initWithMotionTypes:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
- (unint64_t)motionTypes;
@end

@implementation REMotionRelevanceProvider

+ (id)relevanceSimulatorID
{
  return @"motion";
}

- (REMotionRelevanceProvider)initWithDictionary:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"motion_type"];
  v5 = -[REMotionRelevanceProvider initWithMotionTypes:](self, "initWithMotionTypes:", [v4 unsignedIntegerValue]);

  return v5;
}

- (id)dictionaryEncoding
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedInteger:self->_motionTypes];
  [v3 setObject:v4 forKeyedSubscript:@"motion_type"];

  v5 = (void *)[v3 copy];
  return v5;
}

- (REMotionRelevanceProvider)initWithMotionTypes:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMotionRelevanceProvider;
  result = [(RERelevanceProvider *)&v5 init];
  if (result) {
    result->_motionTypes = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t motionTypes = self->_motionTypes;
  return (id)[v4 initWithMotionTypes:motionTypes];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REMotionRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REMotionRelevanceProvider;
    BOOL v5 = [(RERelevanceProvider *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_motionTypes == v4->_motionTypes;
  }

  return v5;
}

- (unint64_t)_hash
{
  return self->_motionTypes;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)REMotionRelevanceProvider;
  v3 = [(REMotionRelevanceProvider *)&v6 description];
  v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" motionTypes=%lu", self->_motionTypes);

  return v4;
}

- (unint64_t)motionTypes
{
  return self->_motionTypes;
}

@end