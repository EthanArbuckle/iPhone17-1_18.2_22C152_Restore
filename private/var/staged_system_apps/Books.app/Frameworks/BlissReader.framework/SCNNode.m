@interface SCNNode
- (BOOL)hasContinuousRotationAnimation;
- (BOOL)isAnimating;
- (NSArray)childNodesWithCamera;
- (NSArray)childNodesWithGeometry;
- (NSArray)childNodesWithLight;
- (void)addContinuousRotationWithEaseIn;
- (void)addContinuousRotationWithInitialRotation:(SCNVector4)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)p_removeAnimationForKey:(id)a3 shouldPreserveTransform:(BOOL)a4;
- (void)removeContinuousRotationAnimations;
@end

@implementation SCNNode

- (void)p_removeAnimationForKey:(id)a3 shouldPreserveTransform:(BOOL)a4
{
  if (a4)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v6 = [(SCNNode *)self presentationNode];
    if (v6)
    {
      [(SCNNode *)v6 transform];
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
    }
    [(SCNNode *)self removeAnimationForKey:a3];
    +[SCNTransaction begin];
    +[SCNTransaction setDisableActions:1];
    v7[0] = v8;
    v7[1] = v9;
    v7[2] = v10;
    v7[3] = v11;
    [(SCNNode *)self setTransform:v7];
    +[SCNTransaction commit];
  }
  else
  {
    -[SCNNode removeAnimationForKey:](self, "removeAnimationForKey:");
  }
}

- (NSArray)childNodesWithGeometry
{
  return (NSArray *)[(SCNNode *)self childNodesPassingTest:&stru_457D38 recursively:0];
}

- (NSArray)childNodesWithLight
{
  return (NSArray *)[(SCNNode *)self childNodesPassingTest:&stru_457D58 recursively:0];
}

- (NSArray)childNodesWithCamera
{
  return (NSArray *)[(SCNNode *)self childNodesPassingTest:&stru_457D78 recursively:0];
}

- (BOOL)isAnimating
{
  return [self animationKeys].count != 0;
}

- (void)addContinuousRotationWithEaseIn
{
  +[SCNTransaction begin];
  v3 = +[CABasicAnimation animationWithKeyPath:@"rotation"];
  [(CABasicAnimation *)v3 setDelegate:self];
  [(CABasicAnimation *)v3 setDuration:7.5];
  [(CABasicAnimation *)v3 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
  [(CABasicAnimation *)v3 setRemovedOnCompletion:0];
  [(CABasicAnimation *)v3 setFillMode:kCAFillModeBoth];
  LODWORD(v4) = 1070141403;
  LODWORD(v5) = 1.0;
  [(CABasicAnimation *)v3 setToValue:+[NSValue valueWithSCNVector4:](NSValue, "valueWithSCNVector4:", 0.0, v5, 0.0, v4)];
  [(CABasicAnimation *)v3 setValue:@"THEaseInRotation" forKey:@"THAnimationIdentifier"];
  [(SCNNode *)self addAnimation:v3 forKey:@"THEaseInRotation"];

  +[SCNTransaction commit];
}

- (void)addContinuousRotationWithInitialRotation:(SCNVector4)a3
{
  float w = a3.w;
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  +[SCNTransaction begin];
  long long v8 = +[CABasicAnimation animationWithKeyPath:@"rotation"];
  [(CABasicAnimation *)v8 setDuration:15.0];
  [(CABasicAnimation *)v8 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
  LODWORD(v9) = 2139095040;
  [(CABasicAnimation *)v8 setRepeatCount:v9];
  double v10 = w + 0.013962634;
  float v11 = v10;
  *(float *)&double v10 = x;
  *(float *)&double v12 = z;
  *(float *)&double v13 = v11;
  [(CABasicAnimation *)v8 setFromValue:+[NSValue valueWithSCNVector4:](NSValue, "valueWithSCNVector4:", v10, COERCE_DOUBLE(LODWORD(y) | 0x3F8C987100000000), v12, v13)];
  double v14 = v11 + 6.28318531;
  *(float *)&double v15 = v14;
  *(float *)&double v14 = x;
  *(float *)&double v16 = z;
  [(CABasicAnimation *)v8 setToValue:+[NSValue valueWithSCNVector4:](NSValue, "valueWithSCNVector4:", v14, COERCE_DOUBLE(LODWORD(y) | 0x401921FB00000000), v16, v15)];
  [(CABasicAnimation *)v8 setValue:@"THContinuousRotation" forKey:@"THAnimationIdentifier"];
  [(SCNNode *)self addAnimation:v8 forKey:@"THContinuousRotation"];

  +[SCNTransaction commit];
}

- (BOOL)hasContinuousRotationAnimation
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_63580;
  v4[3] = &unk_457CB0;
  v4[4] = &v5;
  [self animationKeys].enumerateObjectsUsingBlock:v4;
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)removeContinuousRotationAnimations
{
  CFStringRef v3 = @"THContinuousRotation";
  if ([(SCNNode *)self animationForKey:@"THContinuousRotation"]
    || (CFStringRef v3 = @"THEaseInRotation", [(SCNNode *)self animationForKey:@"THEaseInRotation"]))
  {
    [(SCNNode *)self p_removeAnimationForKey:v3 shouldPreserveTransform:1];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [a3 valueForKey:@"THAnimationIdentifier"];
  if (v4 && [v7 isEqualToString:@"THEaseInRotation"])
  {
    [[(SCNNode *)self presentationNode] rotation];
    int v9 = v8;
    int v11 = v10;
    int v13 = v12;
    int v15 = v14;
    [(SCNNode *)self removeAnimationForKey:@"THEaseInRotation"];
    LODWORD(v16) = v9;
    LODWORD(v17) = v11;
    LODWORD(v18) = v13;
    LODWORD(v19) = v15;
    -[SCNNode addContinuousRotationWithInitialRotation:](self, "addContinuousRotationWithInitialRotation:", v16, v17, v18, v19);
    [a3 setDelegate:0];
  }
}

@end