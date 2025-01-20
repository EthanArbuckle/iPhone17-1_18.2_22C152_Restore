@interface REPriorityRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (REPriorityRelevanceProvider)initWithDictionary:(id)a3;
- (REPriorityRelevanceProvider)initWithPriority:(float)a3;
- (float)priority;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
@end

@implementation REPriorityRelevanceProvider

- (REPriorityRelevanceProvider)initWithPriority:(float)a3
{
  if (a3 < 0.0 || a3 > 1.0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The priority must be in the range 0.0 to 1.0"];
  }
  v7.receiver = self;
  v7.super_class = (Class)REPriorityRelevanceProvider;
  result = [(RERelevanceProvider *)&v7 init];
  if (result) {
    result->_priority = a3;
  }
  return result;
}

+ (id)relevanceSimulatorID
{
  return @"priority";
}

- (REPriorityRelevanceProvider)initWithDictionary:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"priority"];
  v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    self = -[REPriorityRelevanceProvider initWithPriority:](self, "initWithPriority:");
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dictionaryEncoding
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"priority";
  *(float *)&double v2 = self->_priority;
  v3 = [NSNumber numberWithFloat:v2];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REPriorityRelevanceProvider;
  id result = [(RERelevanceProvider *)&v5 copyWithZone:a3];
  *((_DWORD *)result + 8) = LODWORD(self->_priority);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REPriorityRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REPriorityRelevanceProvider;
    BOOL v5 = [(RERelevanceProvider *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_priority == v4->_priority;
  }

  return v5;
}

- (unint64_t)_hash
{
  *(float *)&double v2 = self->_priority;
  v3 = [NSNumber numberWithFloat:v2];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)REPriorityRelevanceProvider;
  v3 = [(REPriorityRelevanceProvider *)&v6 description];
  unint64_t v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" priority=%f", self->_priority);

  return v4;
}

- (float)priority
{
  return self->_priority;
}

@end