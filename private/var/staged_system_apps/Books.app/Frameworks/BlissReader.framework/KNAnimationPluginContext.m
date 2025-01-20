@interface KNAnimationPluginContext
- (BOOL)isBuild;
- (BOOL)isFrameRenderer;
- (BOOL)isMagicMove;
- (BOOL)isMetalRenderer;
- (BOOL)isMotionBlurred;
- (BOOL)isTransition;
- (BOOL)isWarmingUp;
- (CGRect)animationFrame;
- (CGRect)drawableFrame;
- (KNAnimatedBuild)animatedBuild;
- (KNAnimationRandomGenerator)randomGenerator;
- (NSArray)magicMoveMatches;
- (NSArray)textures;
- (NSDictionary)transitionAttributes;
- (NSString)description;
- (TSDMetalContext)metalContext;
- (double)duration;
- (double)percent;
- (int64_t)rendererType;
- (unint64_t)direction;
- (void)dealloc;
- (void)setAnimatedBuild:(id)a3;
- (void)setAnimationFrame:(CGRect)a3;
- (void)setDirection:(unint64_t)a3;
- (void)setDrawableFrame:(CGRect)a3;
- (void)setDuration:(double)a3;
- (void)setIsMotionBlurred:(BOOL)a3;
- (void)setIsWarmingUp:(BOOL)a3;
- (void)setMagicMoveMatches:(id)a3;
- (void)setMetalContext:(id)a3;
- (void)setPercent:(double)a3;
- (void)setRendererType:(int64_t)a3;
- (void)setTextures:(id)a3;
- (void)setTransitionAttributes:(id)a3;
@end

@implementation KNAnimationPluginContext

- (void)dealloc
{
  self->_metalContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)KNAnimationPluginContext;
  [(KNAnimationPluginContext *)&v3 dealloc];
}

- (BOOL)isBuild
{
  int64_t v2 = [(KNAnimationPluginContext *)self rendererType];
  if ((unint64_t)(v2 - 1) < 2) {
    return 1;
  }
  if (v2)
  {
    if (v2 == 10) {
      return 1;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationPluginContext isBuild]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationPluginContext.m") lineNumber:52 description:@"Unknown type!"];
  }
  return 0;
}

- (BOOL)isTransition
{
  return ![(KNAnimationPluginContext *)self isBuild];
}

- (BOOL)isMagicMove
{
  int64_t v2 = [(KNAnimationPluginContext *)self rendererType];
  if ((unint64_t)(v2 - 7) < 2) {
    return 1;
  }
  if (!v2) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationPluginContext isMagicMove]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationPluginContext.m") lineNumber:84 description:@"Unknown type!"];
  }
  return 0;
}

- (BOOL)isFrameRenderer
{
  unint64_t v2 = [(KNAnimationPluginContext *)self rendererType];
  BOOL result = 0;
  if (v2 <= 0xA)
  {
    if (((1 << v2) & 0x754) != 0)
    {
      return 1;
    }
    else if (!v2)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationPluginContext isFrameRenderer]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationPluginContext.m") lineNumber:111 description:@"Unknown type!"];
      return 0;
    }
  }
  return result;
}

- (BOOL)isMetalRenderer
{
  int64_t v2 = [(KNAnimationPluginContext *)self rendererType];
  if ((unint64_t)(v2 - 9) < 2) {
    return 1;
  }
  if (!v2) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationPluginContext isMetalRenderer]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationPluginContext.m") lineNumber:135 description:@"Unknown type!"];
  }
  return 0;
}

- (NSString)description
{
  id v3 = +[NSMutableArray array];
  if ([(KNAnimationPluginContext *)self isBuild]) {
    CFStringRef v4 = @"isBuild";
  }
  else {
    CFStringRef v4 = @"isTransition";
  }
  [v3 addObject:v4];
  if ([(KNAnimationPluginContext *)self isMagicMove]) {
    [v3 addObject:@"isMagicMove"];
  }
  if ([(KNAnimationPluginContext *)self isMagicMove])
  {
    v5 = [(KNAnimationPluginContext *)self magicMoveMatches];
    CFStringRef v6 = @"magicMoveMatches:%ld";
  }
  else
  {
    v5 = [(KNAnimationPluginContext *)self textures];
    CFStringRef v6 = @"textures:%ld";
  }
  [v3 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, -[NSArray count](v5, "count"))];
  if ([(KNAnimationPluginContext *)self isFrameRenderer])
  {
    [(KNAnimationPluginContext *)self percent];
    [v3 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"percent:%0.3f", v7)];
  }
  v9.receiver = self;
  v9.super_class = (Class)KNAnimationPluginContext;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: {%@}", -[KNAnimationPluginContext description](&v9, "description"), [v3 componentsJoinedByString:@","]);
}

- (KNAnimationRandomGenerator)randomGenerator
{
  if (qword_573198 != -1) {
    dispatch_once(&qword_573198, &stru_4575F8);
  }
  BOOL result = self->_randomGenerator;
  if (!result)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2C4B0;
    block[3] = &unk_456DE0;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)qword_573190, block);
    BOOL result = self->_randomGenerator;
    if (!result)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimationPluginContext randomGenerator]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimationPluginContext.m") lineNumber:222 description:@"invalid nil value for '%s'", "_randomGenerator"];
      return self->_randomGenerator;
    }
  }
  return result;
}

- (KNAnimatedBuild)animatedBuild
{
  return self->_animatedBuild;
}

- (void)setAnimatedBuild:(id)a3
{
  self->_animatedBuild = (KNAnimatedBuild *)a3;
}

- (NSArray)magicMoveMatches
{
  return self->_magicMoveMatches;
}

- (void)setMagicMoveMatches:(id)a3
{
  self->_magicMoveMatches = (NSArray *)a3;
}

- (double)percent
{
  return self->_percent;
}

- (void)setPercent:(double)a3
{
  self->_percent = a3;
}

- (NSArray)textures
{
  return self->_textures;
}

- (void)setTextures:(id)a3
{
  self->_textures = (NSArray *)a3;
}

- (NSDictionary)transitionAttributes
{
  return self->_transitionAttributes;
}

- (void)setTransitionAttributes:(id)a3
{
  self->_transitionAttributes = (NSDictionary *)a3;
}

- (BOOL)isMotionBlurred
{
  return self->_isMotionBlurred;
}

- (void)setIsMotionBlurred:(BOOL)a3
{
  self->_isMotionBlurred = a3;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isWarmingUp
{
  return self->_isWarmingUp;
}

- (void)setIsWarmingUp:(BOOL)a3
{
  self->_isWarmingUp = a3;
}

- (TSDMetalContext)metalContext
{
  return self->_metalContext;
}

- (void)setMetalContext:(id)a3
{
}

- (CGRect)drawableFrame
{
  double x = self->_drawableFrame.origin.x;
  double y = self->_drawableFrame.origin.y;
  double width = self->_drawableFrame.size.width;
  double height = self->_drawableFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDrawableFrame:(CGRect)a3
{
  self->_drawableFrame = a3;
}

- (CGRect)animationFrame
{
  double x = self->_animationFrame.origin.x;
  double y = self->_animationFrame.origin.y;
  double width = self->_animationFrame.size.width;
  double height = self->_animationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnimationFrame:(CGRect)a3
{
  self->_animationFrame = a3;
}

- (int64_t)rendererType
{
  return self->_rendererType;
}

- (void)setRendererType:(int64_t)a3
{
  self->_rendererType = a3;
}

@end