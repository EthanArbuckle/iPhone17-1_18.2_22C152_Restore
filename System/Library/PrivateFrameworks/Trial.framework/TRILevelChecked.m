@interface TRILevelChecked
+ (id)wrapLevel:(id)a3;
- (BOOL)BOOLeanValue;
- (TRILevelChecked)initWithLevel:(id)a3;
- (double)doubleValue;
- (float)floatValue;
- (id)binaryValue;
- (id)description;
- (id)directoryValue;
- (id)fileValue;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)stringValue;
- (int)intValue;
- (int64_t)longValue;
@end

@implementation TRILevelChecked

- (void).cxx_destruct
{
}

+ (id)wrapLevel:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"TRILevelChecked.m", 34, @"Invalid parameter not satisfying: %@", @"level" object file lineNumber description];
  }
  v6 = [[TRILevelChecked alloc] initWithLevel:v5];

  return v6;
}

- (TRILevelChecked)initWithLevel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRILevelChecked;
  v6 = [(TRILevelChecked *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrapped, a3);
  }

  return v7;
}

- (BOOL)BOOLeanValue
{
  int v4 = [(TRILevel *)self->_wrapped levelOneOfCase];
  if (v4 == 10 || v4 == 0)
  {
    wrapped = self->_wrapped;
    return [(TRILevel *)wrapped BOOLeanValue];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRILevelChecked.m", 50, @"requested BOOLeanValue, but TRILevel contained type (%u) is not Boolean", -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase") object file lineNumber description];

    return 0;
  }
}

- (id)fileValue
{
  int v4 = [(TRILevel *)self->_wrapped levelOneOfCase];
  if (v4 == 100 || v4 == 0)
  {
    v7 = [(TRILevel *)self->_wrapped fileValue];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRILevelChecked.m", 141, @"requested fileValue, but TRILevel contained type (%u) is not File", -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase") object file lineNumber description];

    v7 = 0;
  }
  return v7;
}

- (id)directoryValue
{
  int v4 = [(TRILevel *)self->_wrapped levelOneOfCase];
  if (v4 == 101 || v4 == 0)
  {
    v7 = [(TRILevel *)self->_wrapped directoryValue];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRILevelChecked.m", 154, @"requested directoryValue, but TRILevel contained type (%u) is not Directory", -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase") object file lineNumber description];

    v7 = 0;
  }
  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_wrapped;
}

- (id)stringValue
{
  int v4 = [(TRILevel *)self->_wrapped levelOneOfCase];
  if (v4 == 11 || v4 == 0)
  {
    v7 = [(TRILevel *)self->_wrapped stringValue];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRILevelChecked.m", 63, @"requested stringValue, but TRILevel contained type (%u) is not String", -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase") object file lineNumber description];

    v7 = 0;
  }
  return v7;
}

- (int)intValue
{
  int v4 = [(TRILevel *)self->_wrapped levelOneOfCase];
  if (v4 == 12 || v4 == 0)
  {
    wrapped = self->_wrapped;
    return [(TRILevel *)wrapped intValue];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRILevelChecked.m", 76, @"requested intValue, but TRILevel contained type (%u) is not Int", -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase") object file lineNumber description];

    return 0;
  }
}

- (int64_t)longValue
{
  int v4 = [(TRILevel *)self->_wrapped levelOneOfCase];
  if (v4 == 13 || v4 == 0)
  {
    wrapped = self->_wrapped;
    return [(TRILevel *)wrapped longValue];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRILevelChecked.m", 89, @"requested longValue, but TRILevel contained type (%u) is not Long", -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase") object file lineNumber description];

    return 0;
  }
}

- (float)floatValue
{
  int v4 = [(TRILevel *)self->_wrapped levelOneOfCase];
  if (v4 == 14 || v4 == 0)
  {
    wrapped = self->_wrapped;
    [(TRILevel *)wrapped floatValue];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRILevelChecked.m", 102, @"requested floatValue, but TRILevel contained type (%u) is not Float", -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase") object file lineNumber description];

    return 0.0;
  }
  return result;
}

- (double)doubleValue
{
  int v4 = [(TRILevel *)self->_wrapped levelOneOfCase];
  if (v4 == 15 || v4 == 0)
  {
    wrapped = self->_wrapped;
    [(TRILevel *)wrapped doubleValue];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRILevelChecked.m", 115, @"requested doubleValue, but TRILevel contained type (%u) is not Double", -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase") object file lineNumber description];

    return 0.0;
  }
  return result;
}

- (id)binaryValue
{
  if (([(TRILevel *)self->_wrapped levelOneOfCase] | 0x10) == 0x10)
  {
    int v4 = [(TRILevel *)self->_wrapped binaryValue];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"TRILevelChecked.m", 128, @"requested binaryValue, but TRILevel contained type (%u) is not Binary", -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase") object file lineNumber description];

    int v4 = 0;
  }
  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  int v4 = [(TRILevel *)self->_wrapped description];
  id v5 = (void *)[v3 initWithFormat:@"[TRILevelChecked] %@", v4];

  return v5;
}

@end