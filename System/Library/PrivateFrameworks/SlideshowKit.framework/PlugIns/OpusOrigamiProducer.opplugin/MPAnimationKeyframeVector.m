@interface MPAnimationKeyframeVector
+ (id)keyframeVectorWithVector:(id)a3 atTime:(double)a4;
+ (id)keyframeVectorWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (MPVector)vector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initKeyframeVectorWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)keyframe;
- (void)dealloc;
- (void)setVector:(id)a3;
@end

@implementation MPAnimationKeyframeVector

+ (id)keyframeVectorWithVector:(id)a3 atTime:(double)a4
{
  id v4 = [objc_alloc((Class)a1) initKeyframeVectorWithVector:a3 atTime:0 offsetType:a4];
  return v4;
}

+ (id)keyframeVectorWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  id v5 = [objc_alloc((Class)a1) initKeyframeVectorWithVector:a3 atTime:a5 offsetType:a4];
  return v5;
}

- (id)initKeyframeVectorWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MPAnimationKeyframeVector;
  v8 = [(MPAnimationKeyframe *)&v10 init];
  if (v8)
  {
    v8->_vector = (MPVector *)a3;
    v8->super._time = a4;
    v8->super._offsetType = a5;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPAnimationKeyframeVector;
  id v4 = [(MPAnimationKeyframe *)&v7 copyWithZone:a3];
  id v5 = [(MPVector *)self->_vector copy];
  [v4 setVector:v5];

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MPAnimationKeyframeVector;
  [(MPAnimationKeyframe *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = +[NSString stringWithFormat:@"============================== KeyframeVector ==================================\n"];
  [(MPAnimationKeyframe *)self time];
  id v5 = [[[(NSString *)v3 stringByAppendingFormat:@"\t                          Time: %f\n" stringByAppendingFormat:"stringByAppendingFormat:" stringByAppendingFormat:(double)[(MPAnimationKeyframe *)self offsetType]], "stringByAppendingFormat:", @"\t                        Vector: %@\n", [(MPVector *)[(MPAnimationKeyframeVector *)self vector] string]];
  if (self->super._keyframe) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  return [(NSString *)v5 stringByAppendingFormat:@"\t               Has MCKayeframe: %@\n", v6];
}

- (void)setVector:(id)a3
{
  vector = self->_vector;
  if (vector) {

  }
  self->_vector = (MPVector *)a3;
  if (self->super._keyframe)
  {
    long long v11 = 0uLL;
    int v12 = 0;
    if (a3) {
      [a3 vector];
    }
    [(MPAnimationPath *)self->super._parentPath animatedParent];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(MPAnimationPath *)self->super._parentPath animatedParent];
      long long v9 = v11;
      int v10 = v12;
      id v7 = objc_msgSend(v6, "convertMPAttributeToMCAttribute:withKey:", MCVectorToString((uint64_t)&v9), -[MPAnimationPath animatedKey](self->super._parentPath, "animatedKey"));
      MCStringToVector(v7, (uint64_t)&v9);
      long long v11 = v9;
      int v12 = v10;
    }
    keyframe = self->super._keyframe;
    long long v9 = v11;
    int v10 = v12;
    [(MCAnimationKeyframe *)keyframe setVector:&v9];
  }
}

- (MPVector)vector
{
  return self->_vector;
}

- (id)keyframe
{
  return self->super._keyframe;
}

@end