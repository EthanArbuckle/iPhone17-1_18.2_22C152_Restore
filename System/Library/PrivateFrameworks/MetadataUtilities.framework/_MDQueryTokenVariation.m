@interface _MDQueryTokenVariation
- (NSString)variation;
- (_MDQueryTokenVariation)initWithVariation:(id)a3 type:(int64_t)a4 confidence:(float)a5;
- (float)confidence;
- (int64_t)type;
- (void)dealloc;
- (void)setConfidence:(float)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _MDQueryTokenVariation

- (_MDQueryTokenVariation)initWithVariation:(id)a3 type:(int64_t)a4 confidence:(float)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_MDQueryTokenVariation;
  v8 = [(_MDQueryTokenVariation *)&v10 init];
  if (v8)
  {
    v8->_variation = (NSString *)[a3 copy];
    v8->_type = a4;
    v8->_confidence = a5;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_MDQueryTokenVariation;
  [(_MDQueryTokenVariation *)&v3 dealloc];
}

- (NSString)variation
{
  return self->_variation;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end