@interface TSDLinePreset
+ (id)lineWithStroke:(id)a3 headLineEnd:(id)a4 tailLineEnd:(id)a5;
- (BOOL)isEqual:(id)a3;
- (TSDLineEnd)headLineEnd;
- (TSDLineEnd)tailLineEnd;
- (TSDLinePreset)initWithStroke:(id)a3 headLineEnd:(id)a4 tailLineEnd:(id)a5;
- (TSDStroke)stroke;
- (void)dealloc;
@end

@implementation TSDLinePreset

- (TSDLinePreset)initWithStroke:(id)a3 headLineEnd:(id)a4 tailLineEnd:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TSDLinePreset;
  v8 = [(TSDLinePreset *)&v10 init];
  if (v8)
  {
    v8->mStroke = (TSDStroke *)a3;
    v8->mHeadLineEnd = (TSDLineEnd *)a4;
    v8->mTailLineEnd = (TSDLineEnd *)a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDLinePreset;
  [(TSDLinePreset *)&v3 dealloc];
}

+ (id)lineWithStroke:(id)a3 headLineEnd:(id)a4 tailLineEnd:(id)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithStroke:a3 headLineEnd:a4 tailLineEnd:a5];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4) {
    return 0;
  }
  v5 = v4;
  if (!-[TSDStroke isEqual:](-[TSDLinePreset stroke](self, "stroke"), "isEqual:", [v4 stroke])
    || !-[TSDLineEnd isEqual:](-[TSDLinePreset headLineEnd](self, "headLineEnd"), "isEqual:", [v5 headLineEnd]))
  {
    return 0;
  }
  v6 = [(TSDLinePreset *)self tailLineEnd];
  uint64_t v7 = [v5 tailLineEnd];

  return [(TSDLineEnd *)v6 isEqual:v7];
}

- (TSDLineEnd)headLineEnd
{
  return self->mHeadLineEnd;
}

- (TSDLineEnd)tailLineEnd
{
  return self->mTailLineEnd;
}

- (TSDStroke)stroke
{
  return self->mStroke;
}

@end