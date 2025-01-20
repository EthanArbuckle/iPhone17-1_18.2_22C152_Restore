@interface MPNavigator
- (BOOL)isTriggered;
- (BOOL)startsPaused;
- (CGPoint)position;
- (CGSize)size;
- (MPNavigator)init;
- (NSString)initialLayer;
- (double)duration;
- (double)numberOfLoops;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)rotationAngle;
- (double)scale;
- (double)timeIn;
- (double)xRotationAngle;
- (double)yRotationAngle;
- (double)zPosition;
- (id)actionForKey:(id)a3;
- (id)actionableObjectForID:(id)a3;
- (id)actions;
- (id)allSlides:(BOOL)a3;
- (id)allSongs;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layerForKey:(id)a3;
- (id)layerKey;
- (id)layerKeyDictionary;
- (id)layers;
- (id)navigatorKey;
- (id)objectID;
- (id)parent;
- (id)parentDocument;
- (id)plug;
- (id)plugID;
- (id)uuid;
- (int64_t)zIndex;
- (void)cleanup;
- (void)configureActions;
- (void)copyActions:(id)a3;
- (void)copyAnimationPaths:(id)a3;
- (void)copyLayers:(id)a3;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)reconnectAll;
- (void)removeActionForKey:(id)a3;
- (void)removeAllLayers;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeLayerForKey:(id)a3;
- (void)setAction:(id)a3 forKey:(id)a4;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setContainer:(id)a3;
- (void)setDuration:(double)a3;
- (void)setInitialLayer:(id)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setLayer:(id)a3 forKey:(id)a4;
- (void)setNumberOfLoops:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setParent:(id)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPlug:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setStartsPaused:(BOOL)a3;
- (void)setTimeIn:(double)a3;
- (void)setXRotationAngle:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZIndex:(int64_t)a3;
- (void)setZPosition:(double)a3;
@end

@implementation MPNavigator

- (MPNavigator)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPNavigator;
  v2 = [(MPNavigator *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(MPNavigatorInternal);
    v2->_animationPaths = 0;
    v2->_layers = 0;
    v2->_actions = 0;
    v2->_internal = v3;
    [(MPNavigatorInternal *)v2->_internal setUuid:+[MPUtilities stringWithNewUUID]];
    [(MPNavigatorInternal *)v2->_internal setLayerKeyDictionary:objc_alloc_init((Class)NSMutableDictionary)];
    [(MPNavigatorInternal *)v2->_internal setStartPlugID:0];
    [(MPNavigatorInternal *)v2->_internal setOpacity:1.0];
    -[MPNavigatorInternal setPosition:](v2->_internal, "setPosition:", CGPointZero.x, CGPointZero.y);
    [(MPNavigatorInternal *)v2->_internal setZPosition:0.0];
    -[MPNavigatorInternal setSize:](v2->_internal, "setSize:", 2.0, 2.0);
    [(MPNavigatorInternal *)v2->_internal setXRotationAngle:0.0];
    [(MPNavigatorInternal *)v2->_internal setYRotationAngle:0.0];
    [(MPNavigatorInternal *)v2->_internal setYRotationAngle:0.0];
    [(MPNavigatorInternal *)v2->_internal setScale:1.0];
    [(MPNavigatorInternal *)v2->_internal setZIndex:0];
    [(MPNavigatorInternal *)v2->_internal setNumberOfLoops:1.0];
    [(MPNavigatorInternal *)v2->_internal setDuration:10000000.0];
    [(MPNavigatorInternal *)v2->_internal setTimeIn:0.0];
    [(MPNavigatorInternal *)v2->_internal setStartsPaused:0];
    [(MPNavigatorInternal *)v2->_internal setIsTriggered:0];
    [(MPNavigatorInternal *)v2->_internal setPhaseInDuration:0.0];
    [(MPNavigatorInternal *)v2->_internal setPhaseOutDuration:0.0];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copyStruct:self->_internal];
  [v4 copyLayers:self->_layers];
  [v4 copyAnimationPaths:self->_animationPaths];
  [v4 copyActions:self->_actions];
  return v4;
}

- (void)dealloc
{
  [(MPNavigator *)self cleanup];

  self->_internal = 0;
  self->_navigator = 0;

  self->_plug = 0;
  self->_animationPaths = 0;

  self->_layers = 0;
  self->_actions = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPNavigator;
  [(MPNavigator *)&v3 dealloc];
}

- (id)navigatorKey
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = [self->_parent layerKeyDictionary];
  id v4 = [(MPNavigator *)self uuid];
  return [v3 objectForKey:v4];
}

- (id)parent
{
  return self->_parent;
}

- (id)layerKey
{
  if (!objc_msgSend(-[MPNavigator parent](self, "parent"), "layersCanPositionZIndex")) {
    return 0;
  }
  id v3 = objc_msgSend(-[MPNavigator parent](self, "parent"), "layerKeyDictionary");
  id v4 = [(MPNavigator *)self uuid];
  return [v3 objectForKey:v4];
}

- (id)layerForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_layers objectForKey:a3];
}

- (void)setLayer:(id)a3 forKey:(id)a4
{
  if ([(NSMutableDictionary *)self->_layers objectForKey:a4]) {
    [(MPNavigator *)self removeLayerForKey:a4];
  }
  if (!self->_layers) {
    self->_layers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  [a3 setParent:self];
  [(NSMutableDictionary *)self->_layers setObject:a3 forKey:a4];
  -[NSMutableDictionary setObject:forKey:](-[MPNavigatorInternal layerKeyDictionary](self->_internal, "layerKeyDictionary"), "setObject:forKey:", a4, [a3 uuid]);
  if (self->_navigator)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v8 = objc_msgSend(-[MPNavigator parentDocument](self, "parentDocument"), "montage");
    if (isKindOfClass)
    {
      id v9 = [v8 createNavigatorContainer];
      id v10 = [(MCContainerNavigator *)self->_navigator setPlugForContainer:v9 forID:a4];
      [a3 setContainer:v9];
      [a3 setPlug:v10];
    }
    else
    {
      id v11 = [v8 createParallelizerContainer];
      id v12 = [(MCContainerNavigator *)self->_navigator setPlugForContainer:v11 forID:a4];
      [a3 setContainer:v11];
      [a3 setPlug:v12];
      [a3 resetDuration];
    }
    objc_msgSend(-[MPNavigator parentDocument](self, "parentDocument"), "configureActions");
    if (![(MPNavigatorInternal *)self->_internal startPlugID])
    {
      [(MPNavigator *)self setInitialLayer:a4];
    }
  }
}

- (void)removeLayerForKey:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:");
  v6 = v5;
  if (self->_navigator)
  {
    id v7 = [v5 plug];
    if (v7) {
      [(MCContainerNavigator *)self->_navigator removePlug:v7];
    }
  }
  [v6 setPlug:0];
  [v6 setContainer:0];
  [v6 setParent:0];
  -[NSMutableDictionary removeObjectForKey:](-[MPNavigatorInternal layerKeyDictionary](self->_internal, "layerKeyDictionary"), "removeObjectForKey:", [v6 uuid]);
  [(NSMutableDictionary *)self->_layers removeObjectForKey:a3];
  if ([(NSString *)[(MPNavigatorInternal *)self->_internal startPlugID] isEqualToString:a3])
  {
    if ([(NSMutableDictionary *)self->_layers count]) {
      id v8 = objc_msgSend(-[NSMutableDictionary allKeys](self->_layers, "allKeys"), "objectAtIndex:", 0);
    }
    else {
      id v8 = 0;
    }
    [(MPNavigator *)self setInitialLayer:v8];
  }
}

- (void)removeAllLayers
{
  id v3 = [(NSMutableDictionary *)self->_layers copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MPNavigator *)self removeLayerForKey:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSString)initialLayer
{
  return [(MPNavigatorInternal *)self->_internal startPlugID];
}

- (void)setInitialLayer:(id)a3
{
  -[MPNavigatorInternal setStartPlugID:](self->_internal, "setStartPlugID:");
  navigator = self->_navigator;
  if (navigator)
  {
    if (a3)
    {
      id v6 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:", a3), "plug"), "idInSupercontainer");
      navigator = self->_navigator;
    }
    else
    {
      id v6 = 0;
    }
    [(MCContainerNavigator *)navigator setStartPlugID:v6];
  }
}

- (id)layers
{
  return self->_layers;
}

- (id)animationPaths
{
  return self->_animationPaths;
}

- (id)animationPathForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_animationPaths objectForKey:a3];
}

- (void)setAnimationPath:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v7 = [(MPNavigator *)self animationPathForKey:a4];
    if (v7)
    {
      long long v8 = v7;
      [v7 setParent:0];
      [v8 setAnimationPath:0];
    }
    if (!self->_animationPaths) {
      self->_animationPaths = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    [a3 setParent:self];
    [(NSMutableDictionary *)self->_animationPaths setObject:a3 forKey:a4];
    plug = self->_plug;
    if (plug)
    {
      [(MCPlug *)plug removeAnimationPathForKey:a4];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      long long v11 = off_1A4DC0;
      if ((isKindOfClass & 1) == 0) {
        long long v11 = off_1A4DC8;
      }
      id v12 = [(__objc2_class *)*v11 animationPathWithKey:a4];
      [(MCPlug *)self->_plug addAnimationPath:v12];
      [a3 setAnimationPath:v12];
    }
  }
  else
  {
    [(MPNavigator *)self removeAnimationPathForKey:a4];
  }
}

- (void)removeAnimationPathForKey:(id)a3
{
  id v5 = -[MPNavigator animationPathForKey:](self, "animationPathForKey:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MCPlug *)self->_plug removeAnimationPathForKey:a3];
      [v5 setAnimationPath:0];
    }
  }
  [v5 setParent:0];
  animationPaths = self->_animationPaths;
  [(NSMutableDictionary *)animationPaths removeObjectForKey:a3];
}

- (double)opacity
{
  [(MPNavigatorInternal *)self->_internal opacity];
  return result;
}

- (void)setOpacity:(double)a3
{
  -[MPNavigatorInternal setOpacity:](self->_internal, "setOpacity:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlug *)plug setOpacity:a3];
    }
  }
}

- (CGPoint)position
{
  [(MPNavigatorInternal *)self->_internal position];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[MPNavigatorInternal setPosition:](self->_internal, "setPosition:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      -[MCPlug setPosition:](plug, "setPosition:", x, y);
    }
  }
}

- (double)zPosition
{
  [(MPNavigatorInternal *)self->_internal zPosition];
  return result;
}

- (void)setZPosition:(double)a3
{
  -[MPNavigatorInternal setZPosition:](self->_internal, "setZPosition:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlug *)plug setZPosition:a3];
    }
  }
}

- (double)rotationAngle
{
  [(MPNavigatorInternal *)self->_internal rotationAngle];
  return result;
}

- (void)setRotationAngle:(double)a3
{
  -[MPNavigatorInternal setRotationAngle:](self->_internal, "setRotationAngle:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlug *)plug setRotationAngle:a3];
    }
  }
}

- (CGSize)size
{
  [(MPNavigatorInternal *)self->_internal size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[MPNavigatorInternal setSize:](self->_internal, "setSize:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      -[MCPlug setSize:](plug, "setSize:", width, height);
    }
  }
}

- (double)xRotationAngle
{
  [(MPNavigatorInternal *)self->_internal xRotationAngle];
  return result;
}

- (void)setXRotationAngle:(double)a3
{
  -[MPNavigatorInternal setXRotationAngle:](self->_internal, "setXRotationAngle:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlug *)plug setXRotationAngle:a3];
    }
  }
}

- (double)yRotationAngle
{
  [(MPNavigatorInternal *)self->_internal yRotationAngle];
  return result;
}

- (void)setYRotationAngle:(double)a3
{
  -[MPNavigatorInternal setYRotationAngle:](self->_internal, "setYRotationAngle:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlug *)plug setYRotationAngle:a3];
    }
  }
}

- (double)scale
{
  [(MPNavigatorInternal *)self->_internal scale];
  return result;
}

- (void)setScale:(double)a3
{
  -[MPNavigatorInternal setScale:](self->_internal, "setScale:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlug *)plug setScale:a3];
    }
  }
}

- (int64_t)zIndex
{
  plug = self->_plug;
  if (plug) {
    return (int)[(MCPlug *)plug zIndex];
  }
  internal = self->_internal;
  return [(MPNavigatorInternal *)internal zIndex];
}

- (void)setZIndex:(int64_t)a3
{
  __int16 v3 = a3;
  -[MPNavigatorInternal setZIndex:](self->_internal, "setZIndex:");
  if (objc_msgSend(-[MPNavigator parent](self, "parent"), "layersCanPositionZIndex"))
  {
    plug = self->_plug;
    if (plug)
    {
      [(MCPlug *)plug setZIndex:v3];
    }
  }
}

- (double)timeIn
{
  [(MPNavigatorInternal *)self->_internal timeIn];
  return result;
}

- (void)setTimeIn:(double)a3
{
  -[MPNavigatorInternal setTimeIn:](self->_internal, "setTimeIn:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlug *)plug setTimeIn:a3];
    }
  }
}

- (double)duration
{
  [(MPNavigatorInternal *)self->_internal duration];
  return result;
}

- (void)setDuration:(double)a3
{
  -[MPNavigatorInternal setDuration:](self->_internal, "setDuration:");
  if (self->_plug)
  {
    [(MPNavigatorInternal *)self->_internal phaseInDuration];
    double v6 = a3 - v5;
    [(MPNavigatorInternal *)self->_internal phaseOutDuration];
    double v8 = v6 - v7;
    if (v8 < 0.0) {
      double v8 = 0.0;
    }
    plug = self->_plug;
    [(MCPlug *)plug setLoopDuration:v8];
  }
}

- (double)phaseInDuration
{
  [(MPNavigatorInternal *)self->_internal phaseInDuration];
  return result;
}

- (void)setPhaseInDuration:(double)a3
{
  -[MPNavigatorInternal setPhaseInDuration:](self->_internal, "setPhaseInDuration:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlug *)plug setPhaseInDuration:a3];
    [(MPNavigatorInternal *)self->_internal duration];
    double v7 = v6;
    [(MPNavigatorInternal *)self->_internal phaseInDuration];
    double v9 = v7 - v8;
    [(MPNavigatorInternal *)self->_internal phaseOutDuration];
    double v11 = v9 - v10;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    id v12 = self->_plug;
    [(MCPlug *)v12 setLoopDuration:v11];
  }
}

- (double)phaseOutDuration
{
  [(MPNavigatorInternal *)self->_internal phaseOutDuration];
  return result;
}

- (void)setPhaseOutDuration:(double)a3
{
  -[MPNavigatorInternal setPhaseOutDuration:](self->_internal, "setPhaseOutDuration:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlug *)plug setPhaseOutDuration:a3];
    [(MPNavigatorInternal *)self->_internal duration];
    double v7 = v6;
    [(MPNavigatorInternal *)self->_internal phaseInDuration];
    double v9 = v7 - v8;
    [(MPNavigatorInternal *)self->_internal phaseOutDuration];
    double v11 = v9 - v10;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    id v12 = self->_plug;
    [(MCPlug *)v12 setLoopDuration:v11];
  }
}

- (double)numberOfLoops
{
  [(MPNavigatorInternal *)self->_internal numberOfLoops];
  return result;
}

- (void)setNumberOfLoops:(double)a3
{
  -[MPNavigatorInternal setNumberOfLoops:](self->_internal, "setNumberOfLoops:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlug *)plug setNumberOfLoops:a3];
    [(MPNavigatorInternal *)self->_internal duration];
    double v7 = v6;
    [(MPNavigatorInternal *)self->_internal phaseInDuration];
    double v9 = v7 - v8;
    [(MPNavigatorInternal *)self->_internal phaseOutDuration];
    double v11 = v9 - v10;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    id v12 = self->_plug;
    [(MCPlug *)v12 setLoopDuration:v11];
  }
}

- (BOOL)isTriggered
{
  return [(MPNavigatorInternal *)self->_internal isTriggered];
}

- (void)setIsTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPNavigatorInternal setIsTriggered:](self->_internal, "setIsTriggered:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlug *)plug setIsTriggered:v3];
    }
  }
}

- (BOOL)startsPaused
{
  return [(MPNavigatorInternal *)self->_internal startsPaused];
}

- (void)setStartsPaused:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPNavigatorInternal setStartsPaused:](self->_internal, "setStartsPaused:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlug *)plug setStartsPaused:v3];
  }
}

- (id)actions
{
  return self->_actions;
}

- (id)actionForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_actions objectForKey:a3];
}

- (void)setAction:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v7 = [(MPNavigator *)self actionForKey:a4];
    if (v7) {
      [v7 setParent:0];
    }
    if (!self->_actions) {
      self->_actions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    [a3 setParent:self];
    [(NSMutableDictionary *)self->_actions setObject:a3 forKey:a4];
    plug = self->_plug;
    if (plug)
    {
      id v9 = +[MPUtilities createMCAction:a3 forPlug:plug withKey:a4];
      [a3 setAction:v9];
    }
  }
  else
  {
    [(MPNavigator *)self removeActionForKey:a4];
  }
}

- (void)removeActionForKey:(id)a3
{
  id v5 = -[MPNavigator actionForKey:](self, "actionForKey:");
  plug = self->_plug;
  if (plug) {
    [(MCPlug *)plug removeActionForKey:a3];
  }
  [v5 setParent:0];
  actions = self->_actions;
  [(NSMutableDictionary *)actions removeObjectForKey:a3];
}

- (id)plug
{
  return self->_plug;
}

- (id)allSlides:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  layers = self->_layers;
  id v7 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(layers);
        }
        objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i)), "allSlides:", v3));
      }
      id v8 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  return v5;
}

- (id)allSongs
{
  id v3 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  layers = self->_layers;
  id v5 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(layers);
        }
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i)), "allSongs"));
      }
      id v6 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)parentDocument
{
  id v2 = [(MPNavigator *)self parent];
  objc_opt_class();
  while ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    id v2 = [v2 parent];
    objc_opt_class();
  }
  return v2;
}

- (id)plugID
{
  return [(MCPlug *)self->_plug idInSupercontainer];
}

- (id)objectID
{
  return [(MCObject *)self->_plug objectID];
}

- (id)uuid
{
  return [(MPNavigatorInternal *)self->_internal uuid];
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parent) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A layer may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_parent = a3;
  if (![(MPNavigatorInternal *)self->_internal uuid])
  {
    id v4 = +[MPUtilities stringWithNewUUID];
    internal = self->_internal;
    [(MPNavigatorInternal *)internal setUuid:v4];
  }
}

- (void)configureActions
{
  if ([(MPNavigator *)self parentDocument]
    && (objc_msgSend(-[MPNavigator parentDocument](self, "parentDocument"), "isInBatchModify") & 1) == 0)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    layers = self->_layers;
    id v4 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(layers);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * i)), "configureActions");
        }
        id v5 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v5);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    actions = self->_actions;
    id v9 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(actions);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_actions, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * (void)j)), "configureTarget");
        }
        id v10 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (void)setContainer:(id)a3
{
  navigator = self->_navigator;
  if (navigator)
  {
    [(MCContainer *)navigator specialRelease];
    self->_navigator = 0;
  }
  self->_navigator = (MCContainerNavigator *)[a3 specialRetain];
}

- (void)setPlug:(id)a3
{
  plug = self->_plug;
  if (plug)
  {

    self->_plug = 0;
  }
  uint64_t v6 = (MCPlug *)a3;
  self->_plug = v6;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MPNavigator *)self size];
      -[MCPlug setSize:](self->_plug, "setSize:");
      [(MPNavigator *)self position];
      -[MCPlug setPosition:](self->_plug, "setPosition:");
      [(MCPlug *)self->_plug setAudioPriority:2];
      [(MPNavigator *)self zPosition];
      -[MCPlug setZPosition:](self->_plug, "setZPosition:");
      [(MPNavigator *)self rotationAngle];
      -[MCPlug setRotationAngle:](self->_plug, "setRotationAngle:");
      [(MPNavigator *)self xRotationAngle];
      -[MCPlug setXRotationAngle:](self->_plug, "setXRotationAngle:");
      [(MPNavigator *)self yRotationAngle];
      -[MCPlug setYRotationAngle:](self->_plug, "setYRotationAngle:");
      [(MPNavigator *)self scale];
      -[MCPlug setScale:](self->_plug, "setScale:");
      [(MPNavigator *)self opacity];
      -[MCPlug setOpacity:](self->_plug, "setOpacity:");
      [(MPNavigator *)self timeIn];
      -[MCPlug setTimeIn:](self->_plug, "setTimeIn:");
      [(MCPlug *)self->_plug setIsTriggered:[(MPNavigator *)self isTriggered]];
      if (objc_msgSend(-[MPNavigator parent](self, "parent"), "layersCanPositionZIndex")) {
        [(MCPlug *)self->_plug setZIndex:(__int16)[(MPNavigatorInternal *)self->_internal zIndex]];
      }
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      animationPaths = self->_animationPaths;
      id v8 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v75 objects:v84 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v76;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v76 != v10) {
              objc_enumerationMutation(animationPaths);
            }
            uint64_t v12 = *(void *)(*((void *)&v75 + 1) + 8 * i);
            id v13 = [(NSMutableDictionary *)self->_animationPaths objectForKey:v12];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              long long v14 = off_1A4DC0;
            }
            else {
              long long v14 = off_1A4DC8;
            }
            id v15 = [(__objc2_class *)*v14 animationPathWithKey:v12];
            [(MCPlug *)self->_plug addAnimationPath:v15];
            [v13 setAnimationPath:v15];
          }
          id v9 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v75 objects:v84 count:16];
        }
        while (v9);
      }
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      actions = self->_actions;
      id v17 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v71 objects:v83 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v72;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v72 != v19) {
              objc_enumerationMutation(actions);
            }
            uint64_t v21 = *(void *)(*((void *)&v71 + 1) + 8 * (void)j);
            id v22 = [(NSMutableDictionary *)self->_actions objectForKey:v21];
            objc_msgSend(v22, "setAction:", +[MPUtilities createMCAction:forPlug:withKey:](MPUtilities, "createMCAction:forPlug:withKey:", v22, self->_plug, v21));
          }
          id v18 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v71 objects:v83 count:16];
        }
        while (v18);
      }
    }
    [(MPNavigatorInternal *)self->_internal duration];
    double v24 = v23;
    [(MPNavigatorInternal *)self->_internal phaseInDuration];
    double v26 = v24 - v25;
    [(MPNavigatorInternal *)self->_internal phaseOutDuration];
    double v28 = v26 - v27;
    if (v28 < 0.0) {
      double v28 = 0.0;
    }
    [(MCPlug *)self->_plug setLoopDuration:v28];
    [(MPNavigatorInternal *)self->_internal numberOfLoops];
    -[MCPlug setNumberOfLoops:](self->_plug, "setNumberOfLoops:");
    [(MPNavigator *)self phaseInDuration];
    -[MCPlug setPhaseInDuration:](self->_plug, "setPhaseInDuration:");
    [(MPNavigator *)self phaseOutDuration];
    -[MCPlug setPhaseOutDuration:](self->_plug, "setPhaseOutDuration:");
    [(MCPlug *)self->_plug setStartsPaused:[(MPNavigator *)self startsPaused]];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    layers = self->_layers;
    id v30 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v67 objects:v82 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v68;
      do
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v68 != v32) {
            objc_enumerationMutation(layers);
          }
          uint64_t v34 = *(void *)(*((void *)&v67 + 1) + 8 * (void)k);
          id v35 = [(NSMutableDictionary *)self->_layers objectForKey:v34];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v36 = objc_msgSend(objc_msgSend(-[MPNavigator parentDocument](self, "parentDocument"), "montage"), "createParallelizerContainer");
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            id v36 = objc_msgSend(objc_msgSend(-[MPNavigator parentDocument](self, "parentDocument"), "montage"), "createNavigatorContainer");
          }
          id v37 = v36;
          id v38 = [(MCContainerNavigator *)self->_navigator setPlugForContainer:v36 forID:v34];
          [v35 setContainer:v37];
          [v35 setPlug:v38];
        }
        id v31 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v67 objects:v82 count:16];
      }
      while (v31);
    }
    if ([(MPNavigatorInternal *)self->_internal startPlugID]) {
      -[MCContainerNavigator setStartPlugID:](self->_navigator, "setStartPlugID:", objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:", -[MPNavigatorInternal startPlugID](self->_internal, "startPlugID")), "plug"), "idInSupercontainer"));
    }
    [(MPNavigator *)self configureActions];
  }
  else
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v39 = [(NSMutableDictionary *)self->_layers allValues];
    id v40 = [v39 countByEnumeratingWithState:&v63 objects:v81 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v64;
      do
      {
        for (m = 0; m != v41; m = (char *)m + 1)
        {
          if (*(void *)v64 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v63 + 1) + 8 * (void)m);
          [v44 setPlug:0];
          [v44 setContainer:0];
        }
        id v41 = [v39 countByEnumeratingWithState:&v63 objects:v81 count:16];
      }
      while (v41);
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v45 = self->_animationPaths;
    id v46 = [(NSMutableDictionary *)v45 countByEnumeratingWithState:&v59 objects:v80 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v60;
      do
      {
        for (n = 0; n != v47; n = (char *)n + 1)
        {
          if (*(void *)v60 != v48) {
            objc_enumerationMutation(v45);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", *(void *)(*((void *)&v59 + 1) + 8 * (void)n)), "setAnimationPath:", 0);
        }
        id v47 = [(NSMutableDictionary *)v45 countByEnumeratingWithState:&v59 objects:v80 count:16];
      }
      while (v47);
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v50 = self->_actions;
    id v51 = [(NSMutableDictionary *)v50 countByEnumeratingWithState:&v55 objects:v79 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v56;
      do
      {
        for (ii = 0; ii != v52; ii = (char *)ii + 1)
        {
          if (*(void *)v56 != v53) {
            objc_enumerationMutation(v50);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_actions, "objectForKey:", *(void *)(*((void *)&v55 + 1) + 8 * (void)ii)), "setAction:", 0);
        }
        id v52 = [(NSMutableDictionary *)v50 countByEnumeratingWithState:&v55 objects:v79 count:16];
      }
      while (v52);
    }
  }
}

- (void)cleanup
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = [(NSMutableDictionary *)self->_layers allValues];
  id v4 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * (void)v7) cleanup];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v5);
  }
  [(MPNavigator *)self removeAllLayers];
  id v8 = [(NSMutableDictionary *)self->_animationPaths allKeys];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [(MPNavigator *)self removeAnimationPathForKey:*(void *)(*((void *)&v22 + 1) + 8 * (void)v12)];
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v10);
  }
  id v13 = [(NSMutableDictionary *)self->_actions allKeys];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [(MPNavigator *)self removeActionForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)v17)];
        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v15);
  }
  self->_parent = 0;
}

- (void)copyStruct:(id)a3
{
  -[MPNavigatorInternal setStartPlugID:](self->_internal, "setStartPlugID:", [a3 startPlugID]);
  [a3 position];
  -[MPNavigatorInternal setPosition:](self->_internal, "setPosition:");
  [a3 size];
  -[MPNavigatorInternal setSize:](self->_internal, "setSize:");
  [a3 zPosition];
  -[MPNavigatorInternal setZPosition:](self->_internal, "setZPosition:");
  [a3 rotationAngle];
  -[MPNavigatorInternal setRotationAngle:](self->_internal, "setRotationAngle:");
  [a3 xRotationAngle];
  -[MPNavigatorInternal setXRotationAngle:](self->_internal, "setXRotationAngle:");
  [a3 yRotationAngle];
  -[MPNavigatorInternal setYRotationAngle:](self->_internal, "setYRotationAngle:");
  [a3 scale];
  -[MPNavigatorInternal setScale:](self->_internal, "setScale:");
  [a3 opacity];
  -[MPNavigatorInternal setOpacity:](self->_internal, "setOpacity:");
  -[MPNavigatorInternal setZIndex:](self->_internal, "setZIndex:", [a3 zIndex]);
  [a3 numberOfLoops];
  -[MPNavigatorInternal setNumberOfLoops:](self->_internal, "setNumberOfLoops:");
  [a3 duration];
  -[MPNavigatorInternal setDuration:](self->_internal, "setDuration:");
  [a3 timeIn];
  -[MPNavigatorInternal setTimeIn:](self->_internal, "setTimeIn:");
  -[MPNavigatorInternal setIsTriggered:](self->_internal, "setIsTriggered:", [a3 isTriggered]);
  -[MPNavigatorInternal setStartsPaused:](self->_internal, "setStartsPaused:", [a3 startsPaused]);
  [a3 phaseInDuration];
  -[MPNavigatorInternal setPhaseInDuration:](self->_internal, "setPhaseInDuration:");
  [a3 phaseOutDuration];
  -[MPNavigatorInternal setPhaseOutDuration:](self->_internal, "setPhaseOutDuration:");
  internal = self->_internal;
  [(MPNavigatorInternal *)internal setUuid:0];
}

- (void)copyLayers:(id)a3
{
  id v5 = +[NSMutableDictionary dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v11 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v10), "copy");
        [v5 setObject:v11 forKey:v10];
      }
      id v7 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v5);
        }
        -[MPNavigator setLayer:forKey:](self, "setLayer:forKey:", [v5 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * (void)j)], *(void *)(*((void *)&v16 + 1) + 8 * (void)j));
      }
      id v13 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyAnimationPaths:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        [(MPNavigator *)self setAnimationPath:v10 forKey:v9];
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)copyActions:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        [(MPNavigator *)self setAction:v10 forKey:v9];
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)reconnectAll
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  layers = self->_layers;
  id v4 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(layers);
        }
        objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * i)), "reconnectAll");
      }
      id v5 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)actionableObjectForID:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  layers = self->_layers;
  id v6 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(layers);
    }
    id v10 = [(NSMutableDictionary *)self->_layers objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
    if (objc_msgSend(objc_msgSend(v10, "uuid"), "isEqualToString:", a3)) {
      return v10;
    }
    id v11 = [v10 actionableObjectForID:a3];
    if (v11) {
      return v11;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [(NSMutableDictionary *)layers countByEnumeratingWithState:&v13 objects:v17 count:16];
      id v10 = 0;
      if (v7) {
        goto LABEL_3;
      }
      return v10;
    }
  }
}

- (id)layerKeyDictionary
{
  return [(MPNavigatorInternal *)self->_internal layerKeyDictionary];
}

@end