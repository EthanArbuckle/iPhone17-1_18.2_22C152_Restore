@interface FigTimeRangeAndObject
+ (BOOL)supportsSecureCoding;
+ (id)rangeAndObjectWithRange:(id *)a3 andObject:(id)a4;
- (BOOL)isEqual:(id)a3;
- (FigTimeRangeAndObject)initWithCMTimeRange:(id *)a3 andObject:(id)a4;
- (FigTimeRangeAndObject)initWithCoder:(id)a3;
- (FigTimeRangeAndObject)initWithFigTimeRange:(id *)a3 andObject:(id)a4;
- (id)copyWithRange:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)durationObject;
- (id)object;
- (id)representedToolObject;
- (id)startTimeObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FigTimeRangeAndObject

- (id)copyWithRange:(id *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigTimeRange:andObject:", &v4, -[FigTimeRangeAndObject object](self, "object", a3->var0.var0, *(void *)&a3->var0.var1, a3->var0.var3, a3->var1.var0, *(void *)&a3->var1.var1, a3->var1.var3));
}

+ (id)rangeAndObjectWithRange:(id *)a3 andObject:(id)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  return (id)[v6 initWithCMTimeRange:v9 andObject:a4];
}

- (FigTimeRangeAndObject)initWithFigTimeRange:(id *)a3 andObject:(id)a4
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  v6[0] = *(_OWORD *)&a3->var0.var0;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&a3->var1.var1;
  return [(FigTimeRangeAndObject *)self initWithCMTimeRange:v6 andObject:a4];
}

- (FigTimeRangeAndObject)initWithCMTimeRange:(id *)a3 andObject:(id)a4
{
  long long v5 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v5;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  v8.receiver = self;
  v8.super_class = (Class)FigTimeRangeAndObject;
  id v6 = [(FigTimeRangeObj *)&v8 initWithCMTimeRange:v9];
  if (v6) {
    v6->_object = a4;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigTimeRangeAndObject)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigTimeRangeAndObject;
  long long v4 = -[FigTimeRangeObj initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_object = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), @"object");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FigTimeRangeAndObject;
  -[FigTimeRangeObj encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_object forKey:@"object"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigTimeRangeAndObject;
  [(FigTimeRangeAndObject *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFigTimeRange:andObject:", &v4, -[FigTimeRangeAndObject object](self, "object", self->super._range.start.value, *(void *)&self->super._range.start.timescale, self->super._range.start.epoch, self->super._range.duration.value, *(void *)&self->super._range.duration.timescale, self->super._range.duration.epoch));
}

- (id)representedToolObject
{
  return (id)[self->_object representedToolObject];
}

- (id)object
{
  return self->_object;
}

- (id)startTimeObject
{
  if (self)
  {
    [(FigTimeRangeObj *)self range];
  }
  else
  {
    long long v4 = 0u;
    long long v5 = 0u;
    long long v3 = 0u;
  }
  long long v6 = v3;
  uint64_t v7 = v4;
  return +[FigTimeObj timeWithTime:](FigTimeObj, "timeWithTime:", &v6, v3, v4, v5);
}

- (id)durationObject
{
  if (self)
  {
    [(FigTimeRangeObj *)self range];
  }
  else
  {
    memset(v4, 0, sizeof(v4));
    long long v3 = 0u;
  }
  long long v5 = *(_OWORD *)((char *)v4 + 8);
  uint64_t v6 = *((void *)&v4[1] + 1);
  return +[FigTimeObj timeWithTime:](FigTimeObj, "timeWithTime:", &v5, v3, *(void *)&v4[0]);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    uint64_t v17 = v3;
    uint64_t v18 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v7 = *(_OWORD *)&self->super._range.start.epoch;
      *(_OWORD *)&v16.start.value = *(_OWORD *)&self->super._range.start.value;
      *(_OWORD *)&v16.start.epoch = v7;
      *(_OWORD *)&v16.duration.timescale = *(_OWORD *)&self->super._range.duration.timescale;
      long long v8 = *(_OWORD *)((char *)a3 + 24);
      *(_OWORD *)&v15.start.value = *(_OWORD *)((char *)a3 + 8);
      *(_OWORD *)&v15.start.epoch = v8;
      *(_OWORD *)&v15.duration.timescale = *(_OWORD *)((char *)a3 + 40);
      int v9 = CMTimeRangeEqual(&v16, &v15);
      if (v9) {
        LOBYTE(v9) = [self->_object isEqual:*((void *)a3 + 7)];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && !strcmp((const char *)[a3 objCType], "{?={?=qiIq}{?=qiIq}}"))
      {
        [a3 getValue:&v14];
        long long v10 = *(_OWORD *)&self->super._range.start.epoch;
        *(_OWORD *)&range1.start.value = *(_OWORD *)&self->super._range.start.value;
        *(_OWORD *)&range1.start.epoch = v10;
        *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&self->super._range.duration.timescale;
        CMTimeRange v12 = v14;
        LOBYTE(v9) = CMTimeRangeEqual(&range1, &v12) != 0;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
}

- (id)description
{
  long long v2 = *(_OWORD *)&self->super._range.start.epoch;
  *(_OWORD *)&v4.start.value = *(_OWORD *)&self->super._range.start.value;
  *(_OWORD *)&v4.start.epoch = v2;
  *(_OWORD *)&v4.duration.timescale = *(_OWORD *)&self->super._range.duration.timescale;
  return (id)[NSString stringWithFormat:@"%@\n%@", PC_CMTimeRangeToString(&v4), self->_object];
}

@end