@interface _TUISnapValue
- (BOOL)isEqual:(id)a3;
- (NSCopying)identifier;
- (_TUISnapValue)initWithOther:(id)a3;
- (_TUISnapValue)initWithValue:(double)a3;
- (_TUISnapValue)valueWithIdentifier:(id)a3;
- (_TUISnapValue)valueWithMax:(double)a3;
- (_TUISnapValue)valueWithStep:(double)a3;
- (double)max;
- (double)step;
- (double)value;
- (double)valueForStep:(unint64_t)a3;
- (id)description;
- (unint64_t)stepForValue:(double)a3;
@end

@implementation _TUISnapValue

- (_TUISnapValue)initWithValue:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_TUISnapValue;
  v4 = [(_TUISnapValue *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    identifier = v4->_identifier;
    v4->_identifier = 0;

    *(int64x2_t *)&v5->_step = vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return v5;
}

- (_TUISnapValue)initWithOther:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUISnapValue;
  v5 = [(_TUISnapValue *)&v12 init];
  if (v5)
  {
    [v4 value];
    v5->_value = v6;
    uint64_t v7 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSCopying *)v7;

    [v4 step];
    v5->_step = v9;
    [v4 max];
    v5->_max = v10;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_TUISnapValue *)a3;
  v5 = v4;
  unsigned __int8 v6 = self == v4;
  if (v4 && self != v4)
  {
    if (self->_value == v4->_value
      && TUICGFloatIsEqualFloatOrBothNaN(self->_step, v4->_step)
      && TUICGFloatIsEqualFloatOrBothNaN(self->_max, v5->_max))
    {
      identifier = self->_identifier;
      if (identifier == v5->_identifier) {
        unsigned __int8 v6 = 1;
      }
      else {
        unsigned __int8 v6 = -[NSCopying isEqual:](identifier, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

- (_TUISnapValue)valueWithIdentifier:(id)a3
{
  id v4 = (NSCopying *)a3;
  v5 = [[_TUISnapValue alloc] initWithOther:self];
  identifier = v5->_identifier;
  v5->_identifier = v4;

  return v5;
}

- (_TUISnapValue)valueWithStep:(double)a3
{
  id v4 = [[_TUISnapValue alloc] initWithOther:self];
  v4->_step = a3;

  return v4;
}

- (_TUISnapValue)valueWithMax:(double)a3
{
  id v4 = [[_TUISnapValue alloc] initWithOther:self];
  v4->_max = a3;

  return v4;
}

- (unint64_t)stepForValue:(double)a3
{
  return vcvtmd_u64_f64((fmin(self->_max, a3) - self->_value) / self->_step);
}

- (double)valueForStep:(unint64_t)a3
{
  return self->_value + self->_step * (double)a3;
}

- (id)description
{
  return +[NSString stringWithFormat:@"{ value=%f identifier=%@ step=%f max=%f}", *(void *)&self->_value, self->_identifier, *(void *)&self->_step, *(void *)&self->_max];
}

- (double)value
{
  return self->_value;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (double)step
{
  return self->_step;
}

- (double)max
{
  return self->_max;
}

- (void).cxx_destruct
{
}

@end