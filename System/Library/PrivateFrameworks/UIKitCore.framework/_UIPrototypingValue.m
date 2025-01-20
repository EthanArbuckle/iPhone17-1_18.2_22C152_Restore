@interface _UIPrototypingValue
- (NSString)name;
- (NSValue)currentValue;
- (NSValue)defaultValue;
- (NSValue)maximumValue;
- (NSValue)minimumValue;
- (_UIPrototypingValue)initWithDictionary:(id)a3;
- (double)stepSize;
- (id)dictionaryRepresentation;
- (int64_t)type;
- (void)setCurrentValue:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setName:(id)a3;
- (void)setStepSize:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _UIPrototypingValue

- (NSValue)currentValue
{
  currentValue = self->_currentValue;
  if (currentValue)
  {
    v3 = currentValue;
  }
  else
  {
    v3 = [(_UIPrototypingValue *)self defaultValue];
  }
  return v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v4 = [(_UIPrototypingValue *)self type];
  if (v4 > 2) {
    v5 = 0;
  }
  else {
    v5 = off_1E530CCB8[v4];
  }
  [v3 setObject:v5 forKeyedSubscript:@"UIPrototypingValueType"];
  v6 = [(_UIPrototypingValue *)self name];
  [v3 setObject:v6 forKeyedSubscript:@"UIPrototypingValueName"];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47___UIPrototypingValue_dictionaryRepresentation__block_invoke;
  aBlock[3] = &unk_1E530CC98;
  id v7 = v3;
  id v18 = v7;
  v8 = (void (**)(void *, __CFString *, void *))_Block_copy(aBlock);
  v9 = [(_UIPrototypingValue *)self defaultValue];
  v8[2](v8, @"UIPrototypingValueDefaultValue", v9);

  v10 = [(_UIPrototypingValue *)self minimumValue];
  v8[2](v8, @"UIPrototypingValueMinimumValue", v10);

  v11 = [(_UIPrototypingValue *)self maximumValue];
  v8[2](v8, @"UIPrototypingValueMaximumValue", v11);

  v12 = [(_UIPrototypingValue *)self currentValue];
  v8[2](v8, @"UIPrototypingValueCurrentValue", v12);

  v13 = NSNumber;
  [(_UIPrototypingValue *)self stepSize];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v8[2](v8, @"UIPrototypingValueStepSize", v14);

  id v15 = v7;
  return v15;
}

- (_UIPrototypingValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"UIPrototypingValueType"];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"UIPrototypingValueName"];

    if (v6)
    {
      v18.receiver = self;
      v18.super_class = (Class)_UIPrototypingValue;
      id v7 = [(_UIPrototypingValue *)&v18 init];
      if (v7)
      {
        id v8 = [v4 objectForKeyedSubscript:@"UIPrototypingValueType"];
        if ([v8 isEqualToString:@"UIPrototypingValueTypeInteger"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"UIPrototypingValueTypeFloat"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"UIPrototypingValueTypeBool"])
        {
          uint64_t v9 = 2;
        }
        else
        {
          uint64_t v9 = 0;
        }

        [(_UIPrototypingValue *)v7 setType:v9];
        v10 = [v4 objectForKeyedSubscript:@"UIPrototypingValueName"];
        [(_UIPrototypingValue *)v7 setName:v10];

        v11 = [v4 objectForKeyedSubscript:@"UIPrototypingValueDefaultValue"];
        [(_UIPrototypingValue *)v7 setDefaultValue:v11];

        v12 = [v4 objectForKeyedSubscript:@"UIPrototypingValueMinimumValue"];
        [(_UIPrototypingValue *)v7 setMinimumValue:v12];

        v13 = [v4 objectForKeyedSubscript:@"UIPrototypingValueMaximumValue"];
        [(_UIPrototypingValue *)v7 setMaximumValue:v13];

        v14 = [v4 objectForKeyedSubscript:@"UIPrototypingValueCurrentValue"];
        [(_UIPrototypingValue *)v7 setCurrentValue:v14];

        id v15 = [v4 objectForKeyedSubscript:@"UIPrototypingValueStepSize"];
        [v15 floatValue];
        [(_UIPrototypingValue *)v7 setStepSize:v16];
      }
      self = v7;
      v5 = self;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSValue)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (NSValue)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
}

- (NSValue)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
}

- (void)setCurrentValue:(id)a3
{
}

- (double)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(double)a3
{
  self->_stepSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end