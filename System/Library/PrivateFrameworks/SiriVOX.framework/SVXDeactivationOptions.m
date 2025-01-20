@interface SVXDeactivationOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SVXDeactivationOptions)initWithAudioSessionDeactivationDelay:(double)a3;
- (SVXDeactivationOptions)initWithCoder:(id)a3;
- (double)audioSessionDeactivationDelay;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXDeactivationOptions

- (double)audioSessionDeactivationDelay
{
  return self->_audioSessionDeactivationDelay;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  double audioSessionDeactivationDelay = self->_audioSessionDeactivationDelay;
  id v5 = a3;
  id v6 = [v3 numberWithDouble:audioSessionDeactivationDelay];
  [v5 encodeObject:v6 forKey:@"SVXDeactivationOptions::audioSessionDeactivationDelay"];
}

- (SVXDeactivationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeactivationOptions::audioSessionDeactivationDelay"];

  [v5 doubleValue];
  double v7 = v6;

  return [(SVXDeactivationOptions *)self initWithAudioSessionDeactivationDelay:v7];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXDeactivationOptions *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double audioSessionDeactivationDelay = self->_audioSessionDeactivationDelay;
      [(SVXDeactivationOptions *)v4 audioSessionDeactivationDelay];
      BOOL v7 = audioSessionDeactivationDelay == v6;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithDouble:self->_audioSessionDeactivationDelay];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SVXDeactivationOptions;
  id v5 = [(SVXDeactivationOptions *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {double audioSessionDeactivationDelay = %f}", v5, *(void *)&self->_audioSessionDeactivationDelay];

  return v6;
}

- (id)description
{
  return [(SVXDeactivationOptions *)self _descriptionWithIndent:0];
}

- (SVXDeactivationOptions)initWithAudioSessionDeactivationDelay:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SVXDeactivationOptions;
  result = [(SVXDeactivationOptions *)&v5 init];
  if (result) {
    result->_double audioSessionDeactivationDelay = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXDeactivationOptionsMutation *))a3;
  if (v4)
  {
    objc_super v5 = [[_SVXDeactivationOptionsMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    double v6 = [(_SVXDeactivationOptionsMutation *)v5 generate];
  }
  else
  {
    double v6 = (void *)[(SVXDeactivationOptions *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  unint64_t v3 = (void (**)(id, _SVXDeactivationOptionsMutation *))a3;
  id v4 = objc_alloc_init(_SVXDeactivationOptionsMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  objc_super v5 = [(_SVXDeactivationOptionsMutation *)v4 generate];

  return v5;
}

@end