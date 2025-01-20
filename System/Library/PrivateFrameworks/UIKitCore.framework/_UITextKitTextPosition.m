@interface _UITextKitTextPosition
+ (id)positionWithOffset:(int64_t)a3;
+ (id)positionWithOffset:(int64_t)a3 affinity:(int64_t)a4;
+ (id)positionWithTextContentManager:(id)a3 location:(id)a4 affinity:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSTextLocation)location;
- (_UITextKitTextPosition)init;
- (id)description;
- (int64_t)affinity;
- (int64_t)compare:(id)a3;
- (int64_t)offset;
@end

@implementation _UITextKitTextPosition

- (void).cxx_destruct
{
}

- (NSTextLocation)location
{
  return self->_location;
}

- (int64_t)affinity
{
  return self->_affinity;
}

- (int64_t)offset
{
  return self->_offset;
}

+ (id)positionWithTextContentManager:(id)a3 location:(id)a4 affinity:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 documentRange];
  v11 = [v10 location];
  uint64_t v12 = [v9 offsetFromLocation:v11 toLocation:v8];

  v13 = [a1 positionWithOffset:v12 affinity:a5];
  v14 = (void *)v13[3];
  v13[3] = v8;

  return v13;
}

+ (id)positionWithOffset:(int64_t)a3 affinity:(int64_t)a4
{
  v6 = objc_opt_new();
  v6[1] = a3;
  v6[2] = a4;
  return v6;
}

- (_UITextKitTextPosition)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UITextKitTextPosition;
  result = [(_UITextKitTextPosition *)&v3 init];
  if (result)
  {
    result->_offset = 0;
    result->_affinity = 0;
  }
  return result;
}

+ (id)positionWithOffset:(int64_t)a3
{
  return (id)[a1 positionWithOffset:a3 affinity:0];
}

- (int64_t)compare:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UITextKitTextViewEditingSupport.m", 118, @"Invalid parameter not satisfying: %@", @"pos" object file lineNumber description];
  }
  uint64_t v6 = [(_UITextKitTextPosition *)self offset];
  if (v6 <= [v5 offset])
  {
    uint64_t v8 = [(_UITextKitTextPosition *)self offset];
    if (v8 >= [v5 offset]) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return a3 && self->_offset == *((void *)a3 + 1);
}

- (id)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)_UITextKitTextPosition;
  uint64_t v4 = [(_UITextKitTextPosition *)&v9 description];
  id v5 = (void *)v4;
  if (self->_affinity) {
    uint64_t v6 = @"B";
  }
  else {
    uint64_t v6 = @"F";
  }
  int64_t v7 = [v3 stringWithFormat:@"%@ (%li%@)", v4, self->_offset, v6];

  return v7;
}

@end