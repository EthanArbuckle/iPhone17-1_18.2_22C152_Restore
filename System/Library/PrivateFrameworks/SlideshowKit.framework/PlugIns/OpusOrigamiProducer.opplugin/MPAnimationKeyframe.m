@interface MPAnimationKeyframe
- (MPAnimationKeyframe)init;
- (double)postControl;
- (double)preControl;
- (double)time;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fullDebugLog;
- (id)parentDocument;
- (id)parentPath;
- (int64_t)relativeTimeCompare:(id)a3;
- (unint64_t)offsetType;
- (void)copyVars:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)setKeyframe:(id)a3;
- (void)setOffsetType:(unint64_t)a3;
- (void)setParentPath:(id)a3;
- (void)setPostControl:(double)a3;
- (void)setPreControl:(double)a3;
- (void)setTime:(double)a3;
@end

@implementation MPAnimationKeyframe

- (MPAnimationKeyframe)init
{
  v4.receiver = self;
  v4.super_class = (Class)MPAnimationKeyframe;
  v2 = [(MPAnimationKeyframe *)&v4 init];
  if (v2)
  {
    v2->_attributes = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_time = 0.0;
    v2->_offsetType = 0;
    *(int64x2_t *)&v2->_preControl = vdupq_n_s64(0x416312D000000000uLL);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copyVars:self];
  return v4;
}

- (void)dealloc
{
  keyframe = self->_keyframe;
  if (keyframe)
  {

    self->_keyframe = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)MPAnimationKeyframe;
  [(MPAnimationKeyframe *)&v4 dealloc];
}

- (id)parentPath
{
  return self->_parentPath;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
  keyframe = self->_keyframe;
  if (keyframe) {
    -[MCAnimationKeyframe setTimeOffset:](keyframe, "setTimeOffset:");
  }
}

- (void)setOffsetType:(unint64_t)a3
{
  self->_offsetType = a3;
  keyframe = self->_keyframe;
  if (keyframe) {
    -[MCAnimationKeyframe setTimeOffsetKind:](keyframe, "setTimeOffsetKind:");
  }
}

- (double)preControl
{
  double result = self->_preControl;
  if (result == 10000000.0) {
    return 0.0;
  }
  return result;
}

- (void)setPreControl:(double)a3
{
  self->_preControl = a3;
  keyframe = self->_keyframe;
  if (keyframe)
  {
    *(float *)&a3 = a3;
    [(MCAnimationKeyframe *)keyframe setPreControl:a3];
  }
}

- (double)postControl
{
  double result = self->_postControl;
  if (result == 10000000.0) {
    return 0.0;
  }
  return result;
}

- (void)setPostControl:(double)a3
{
  self->_postControl = a3;
  keyframe = self->_keyframe;
  if (keyframe)
  {
    *(float *)&a3 = a3;
    [(MCAnimationKeyframe *)keyframe setPostControl:a3];
  }
}

- (double)time
{
  return self->_time;
}

- (unint64_t)offsetType
{
  return self->_offsetType;
}

- (int64_t)relativeTimeCompare:(id)a3
{
  parentPath = self->_parentPath;
  [(MPAnimationPath *)parentPath relativeTimeForKeyframe:self];
  double v6 = v5;
  [(MPAnimationPath *)parentPath relativeTimeForKeyframe:a3];
  if (v6 < v7) {
    return -1;
  }
  else {
    return v6 > v7;
  }
}

- (void)dump
{
}

- (id)fullDebugLog
{
  return +[NSString stringWithFormat:@"\n%@\n", [(MPAnimationKeyframe *)self description]];
}

- (void)setParentPath:(id)a3
{
  if (a3 && self->_parentPath) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A keyframe  may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_parentPath = (MPAnimationPath *)a3;
}

- (id)parentDocument
{
  return [(MPAnimationPath *)self->_parentPath parentDocument];
}

- (void)setKeyframe:(id)a3
{
  keyframe = self->_keyframe;
  if (keyframe)
  {

    self->_keyframe = 0;
  }
  double v6 = (MCAnimationKeyframe *)a3;
  self->_keyframe = v6;
  if (v6)
  {
    if (self->_preControl != 10000000.0)
    {
      [(MPAnimationKeyframe *)self preControl];
      *(float *)&double v7 = v7;
      [(MCAnimationKeyframe *)self->_keyframe setPreControl:v7];
    }
    if (self->_postControl != 10000000.0)
    {
      [(MPAnimationKeyframe *)self postControl];
      *(float *)&double v8 = v8;
      v9 = self->_keyframe;
      [(MCAnimationKeyframe *)v9 setPostControl:v8];
    }
  }
}

- (void)copyVars:(id)a3
{
  self->_time = *((double *)a3 + 4);
  self->_offsetType = *((void *)a3 + 5);
  self->_preControl = *((double *)a3 + 6);
  self->_postControl = *((double *)a3 + 7);
}

@end