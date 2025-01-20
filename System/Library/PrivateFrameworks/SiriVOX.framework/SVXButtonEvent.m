@interface SVXButtonEvent
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SVXButtonEvent)initWithCoder:(id)a3;
- (SVXButtonEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXButtonEvent

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t type = self->_type;
  id v6 = a3;
  v7 = [v4 numberWithInteger:type];
  [v6 encodeObject:v7 forKey:@"SVXButtonEvent::type"];

  id v8 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  [v6 encodeObject:v8 forKey:@"SVXButtonEvent::timestamp"];
}

- (SVXButtonEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXButtonEvent::type"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXButtonEvent::timestamp"];

  uint64_t v8 = [v7 unsignedLongLongValue];

  return [(SVXButtonEvent *)self initWithType:v6 timestamp:v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXButtonEvent *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t type = self->_type;
      if (type == [(SVXButtonEvent *)v5 type])
      {
        unint64_t timestamp = self->_timestamp;
        BOOL v8 = timestamp == [(SVXButtonEvent *)v5 timestamp];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)SVXButtonEvent;
  v5 = [(SVXButtonEvent *)&v11 description];
  unint64_t type = self->_type;
  if (type > 2) {
    v7 = @"(unknown)";
  }
  else {
    v7 = off_264553908[type];
  }
  BOOL v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t type = %@, timestamp = %llu}", v5, v8, self->_timestamp];

  return v9;
}

- (id)description
{
  return [(SVXButtonEvent *)self _descriptionWithIndent:0];
}

- (SVXButtonEvent)initWithType:(int64_t)a3 timestamp:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SVXButtonEvent;
  result = [(SVXButtonEvent *)&v7 init];
  if (result)
  {
    result->_unint64_t type = a3;
    result->_unint64_t timestamp = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXButtonEventMutation *))a3;
  if (v4)
  {
    v5 = [[_SVXButtonEventMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    unint64_t v6 = [(_SVXButtonEventMutation *)v5 generate];
  }
  else
  {
    unint64_t v6 = (void *)[(SVXButtonEvent *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXButtonEventMutation *))a3;
  id v4 = objc_alloc_init(_SVXButtonEventMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = [(_SVXButtonEventMutation *)v4 generate];

  return v5;
}

@end