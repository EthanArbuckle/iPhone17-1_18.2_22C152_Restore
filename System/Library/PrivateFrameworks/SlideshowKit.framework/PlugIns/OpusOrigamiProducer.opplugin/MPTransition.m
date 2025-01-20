@interface MPTransition
+ (MPTransition)transitionWithTransitionID:(id)a3;
- (BOOL)isRandom;
- (MPTransition)init;
- (MPTransition)initWithTransitionID:(id)a3;
- (NSString)presetID;
- (NSString)transitionID;
- (double)duration;
- (double)findMaxDuration;
- (id)_transitionAttributes;
- (id)convertMPAttributeToMCAttribute:(id)a3 withKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedAttributes;
- (id)fullDebugLog;
- (id)parent;
- (id)parentContainer;
- (id)parentDocument;
- (id)transitionAttributeForKey:(id)a3;
- (id)transitionAttributes;
- (id)transitionPresetID;
- (int64_t)randomSeed;
- (void)applyFormattedAttributes;
- (void)copyAttribures:(id)a3;
- (void)copyVars:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)setDuration:(double)a3;
- (void)setIsRandom:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setPresetID:(id)a3;
- (void)setRandomSeed:(int64_t)a3;
- (void)setTransitionAttribute:(id)a3 forKey:(id)a4;
- (void)setTransitionAttributes:(id)a3;
- (void)setTransitionID:(id)a3;
@end

@implementation MPTransition

+ (MPTransition)transitionWithTransitionID:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithTransitionID:a3];
  return (MPTransition *)v3;
}

- (MPTransition)initWithTransitionID:(id)a3
{
  v4 = [(MPTransition *)self init];
  if (v4)
  {
    v4->_transitionID = (NSString *)[a3 copy];
    v4->_isRandom = [a3 isEqualToString:@"Random"];
    v4->_presetID = (NSString *)[@"Default" copy];
    if (objc_msgSend(+[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"), "transitionNeedsRandomSeedInformation:", v4->_transitionID))
    {
      v4->_randomSeed = arc4random();
    }
    objc_msgSend(+[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"), "defaultDurationForTransitionID:", a3);
    v4->_duration = v5;
  }
  return v4;
}

- (MPTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPTransition;
  result = [(MPTransition *)&v3 init];
  if (result)
  {
    result->_attributes = 0;
    result->_duration = 0.0;
    result->_isRandom = 0;
    result->_randomSeed = -1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copyVars:self];
  [v4 copyAttribures:self->_attributes];
  return v4;
}

- (id)description
{
  objc_super v3 = [[+[NSString stringWithFormat:@"================================== Transition ==================================\n"] stringByAppendingFormat:@"\t                 Transition ID: %@\n" stringByAppendingFormat:"stringByAppendingFormat:", @"\t                     Preset ID: %@\n", [(MPTransition *)self presetID]];
  [(MPTransition *)self duration];
  return [[(NSString *)v3 stringByAppendingFormat:@"\t           Transition Duration: %f\n" stringByAppendingFormat:"stringByAppendingFormat:", @"\t                    Attributes: %@\n", [(MPTransition *)self transitionAttributes]];
}

- (void)dealloc
{
  self->_attributes = 0;
  self->_transitionID = 0;

  self->_presetID = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPTransition;
  [(MPTransition *)&v3 dealloc];
}

- (void)setTransitionID:(id)a3
{
  transitionID = self->_transitionID;
  if (transitionID)
  {

    self->_transitionID = 0;
  }
  self->_transitionID = (NSString *)[a3 copy];
  if (self->_randomSeed == -1
    && objc_msgSend(+[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"), "transitionNeedsRandomSeedInformation:", self->_transitionID))
  {
    self->_randomSeed = arc4random();
  }
  -[MPTransition setIsRandom:](self, "setIsRandom:", [a3 isEqualToString:@"Random"]);
  [(MPTransition *)self setPresetID:@"Default"];
  if (self->_parent)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [self->_parent plug]
      && [self->_parent isTransitionConnected])
    {
      objc_msgSend(objc_msgSend(self->_parent, "plug"), "setTransitionID:", a3);
    }
    else if (self->_parent)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([self->_parent container]) {
          objc_msgSend(objc_msgSend(self->_parent, "container"), "setInitialTransitionID:", a3);
        }
      }
    }
  }
  [(MPTransition *)self applyFormattedAttributes];
}

- (void)setPresetID:(id)a3
{
  presetID = self->_presetID;
  if (presetID)
  {

    self->_presetID = 0;
  }
  self->_presetID = (NSString *)[a3 copy];
  attributes = self->_attributes;
  if (attributes) {
    [(NSMutableDictionary *)attributes removeAllObjects];
  }
  [(MPTransition *)self applyFormattedAttributes];
}

- (void)setDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    id v5 = objc_msgSend(objc_msgSend(-[MPTransition parentContainer](self, "parentContainer"), "parentLayer"), "parentDocument");
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
    if (objc_msgSend(objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming), "BOOLValue") & 1) == 0&& (isKindOfClass)
    {
      [(MPTransition *)self findMaxDuration];
      if (v7 != -1.0 && v7 < v3) {
        double v3 = v7;
      }
    }
    [(MPTransition *)self duration];
    double v10 = v9;
    self->_duration = v3;
    id parent = self->_parent;
    if (((parent != 0) & isKindOfClass) == 1)
    {
      [(MPTransition *)self duration];
      objc_msgSend(parent, "adjustPhasesWithDuration:");
    }
    id v12 = self->_parent;
    if (isKindOfClass)
    {
      if ([v12 parentLayer])
      {
        id v13 = [self->_parent parentLayer];
        objc_msgSend(objc_msgSend(self->_parent, "parentLayer"), "duration");
        [v13 setDuration:v14 - (v3 - v10)];
      }
      id v15 = self->_parent;
      if (v15 && [v15 plug] && objc_msgSend(self->_parent, "isTransitionConnected"))
      {
        id v16 = [self->_parent plug];
        [v16 setTransitionDuration:v3];
      }
    }
    else if (v12 && [v12 container])
    {
      id v17 = [self->_parent container];
      [v17 setInitialTransitionDuration:v3];
    }
  }
}

- (id)transitionAttributes
{
  id result = self->_attributes;
  if (!result)
  {
    id v4 = +[MPTransitionManager sharedManager];
    id v5 = [(MPTransition *)self transitionID];
    v6 = [(MPTransition *)self presetID];
    return [v4 attributesForTransitionID:v5 andPresetID:v6];
  }
  return result;
}

- (void)setTransitionAttributes:(id)a3
{
  attributes = self->_attributes;
  if (attributes)
  {

    self->_attributes = 0;
  }
  self->_attributes = (NSMutableDictionary *)[a3 mutableCopy];
  [(MPTransition *)self applyFormattedAttributes];
}

- (id)transitionAttributeForKey:(id)a3
{
  attributes = self->_attributes;
  if (!attributes) {
    attributes = (NSMutableDictionary *)objc_msgSend(+[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"), "attributesForTransitionID:andPresetID:", -[MPTransition transitionID](self, "transitionID"), -[MPTransition presetID](self, "presetID"));
  }
  id result = [(NSMutableDictionary *)attributes objectForKey:a3];
  if (!result)
  {
    id result = objc_msgSend(+[MPUtilities defaultAttributesForMPTransition:](MPUtilities, "defaultAttributesForMPTransition:", self), "objectForKey:", a3);
    if (result)
    {
      return [(MPTransition *)self convertMPAttributeToMCAttribute:result withKey:a3];
    }
  }
  return result;
}

- (void)setTransitionAttribute:(id)a3 forKey:(id)a4
{
  attributes = self->_attributes;
  if (!attributes)
  {
    attributes = (NSMutableDictionary *)objc_msgSend(objc_msgSend(+[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"), "attributesForTransitionID:andPresetID:", -[MPTransition transitionID](self, "transitionID"), -[MPTransition presetID](self, "presetID")), "mutableCopy");
    self->_attributes = attributes;
  }
  [(NSMutableDictionary *)attributes setObject:a3 forKey:a4];
  [(MPTransition *)self applyFormattedAttributes];
}

- (id)parent
{
  return self->_parent;
}

- (id)parentContainer
{
  return self->_parent;
}

- (int64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(int64_t)a3
{
  self->_randomSeed = a3;
  [(MPTransition *)self applyFormattedAttributes];
}

- (NSString)transitionID
{
  return self->_transitionID;
}

- (NSString)presetID
{
  return self->_presetID;
}

- (double)duration
{
  return self->_duration;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  return +[NSString stringWithFormat:@"\n%@\n", [(MPTransition *)self description]];
}

- (id)convertMPAttributeToMCAttribute:(id)a3 withKey:(id)a4
{
  return a3;
}

- (double)findMaxDuration
{
  id parent = self->_parent;
  if (!parent) {
    return -1.0;
  }
  id v4 = objc_msgSend(objc_msgSend(parent, "parentLayer"), "effectContainers");
  if ([self->_parent index]) {
    id v5 = objc_msgSend(v4, "objectAtIndex:", (char *)objc_msgSend(self->_parent, "index") - 1);
  }
  else {
    id v5 = 0;
  }
  double v7 = (char *)[self->_parent index] + 1;
  v8 = (char *)[v4 count];
  id v9 = self->_parent;
  if (v7 == v8)
  {
    [v9 duration];
    double v6 = v10;
  }
  else
  {
    id v11 = objc_msgSend(v4, "objectAtIndex:", (char *)objc_msgSend(v9, "index") + 1);
    [self->_parent duration];
    double v6 = v12;
    if (v11)
    {
      [v11 duration];
      if (v6 >= v13) {
        double v6 = v13;
      }
      if ([v11 transition])
      {
        [v11 duration];
        double v15 = v14;
        objc_msgSend(objc_msgSend(v11, "transition"), "duration");
        double v17 = v15 - v16;
        if (v6 >= v17) {
          double v6 = v17;
        }
      }
    }
  }
  if (v5)
  {
    if ([v5 transition])
    {
      [self->_parent duration];
      double v19 = v18;
      objc_msgSend(objc_msgSend(v5, "transition"), "duration");
      double v21 = v19 - v20;
      if (v6 >= v21) {
        return v21;
      }
    }
  }
  return v6;
}

- (id)transitionPresetID
{
  return +[NSString stringWithFormat:@"%@/%@", [(MPTransition *)self transitionID], [(MPTransition *)self presetID]];
}

- (void)copyVars:(id)a3
{
  self->_duration = *((double *)a3 + 5);
  transitionID = self->_transitionID;
  if (transitionID)
  {

    self->_transitionID = 0;
  }
  self->_transitionID = (NSString *)[*((id *)a3 + 3) copy];
  presetID = self->_presetID;
  if (presetID)
  {

    self->_transitionID = 0;
  }
  self->_presetID = (NSString *)[*((id *)a3 + 4) copy];
  self->_isRandom = *((unsigned char *)a3 + 48);
}

- (void)copyAttribures:(id)a3
{
  attributes = self->_attributes;
  if (attributes) {

  }
  self->_attributes = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:a3 copyItems:1];
}

- (id)parentDocument
{
  id v2 = objc_msgSend(-[MPTransition parentContainer](self, "parentContainer"), "parentLayer");
  return [v2 parentDocument];
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parent) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A transition may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_id parent = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [self->_parent plug])
    {
      if ([self->_parent isTransitionConnected])
      {
        objc_msgSend(objc_msgSend(self->_parent, "plug"), "setTransitionID:", -[MPTransition transitionID](self, "transitionID"));
        [(MPTransition *)self duration];
        objc_msgSend(objc_msgSend(self->_parent, "plug"), "setTransitionDuration:", v4);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![self->_parent container]) {
        return;
      }
      objc_msgSend(objc_msgSend(self->_parent, "container"), "setInitialTransitionID:", -[MPTransition transitionID](self, "transitionID"));
      [(MPTransition *)self duration];
      objc_msgSend(objc_msgSend(self->_parent, "container"), "setInitialTransitionDuration:", v5);
    }
    [(MPTransition *)self applyFormattedAttributes];
  }
}

- (BOOL)isRandom
{
  return self->_isRandom;
}

- (void)setIsRandom:(BOOL)a3
{
  self->_isRandom = a3;
  [(MPTransition *)self applyFormattedAttributes];
}

- (id)formattedAttributes
{
  unsigned __int8 v3 = [(MPTransition *)self isRandom];
  if (self->_attributes) {
    goto LABEL_2;
  }
  if ([(MPTransition *)self isRandom]) {
    return 0;
  }
  if (self->_attributes) {
LABEL_2:
  }
    id v4 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:self->_attributes];
  else {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
  }
  double v5 = v4;
  if ((v3 & 1) == 0) {
    objc_msgSend(v4, "setObject:forKey:", -[MPTransition presetID](self, "presetID"), @"PresetID");
  }
  if ((self->_randomSeed & 0x8000000000000000) == 0) {
    objc_msgSend(v5, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"), @"RandomSeed");
  }
  return v5;
}

- (void)applyFormattedAttributes
{
  id v3 = objc_msgSend(-[MPTransition _transitionAttributes](self, "_transitionAttributes"), "mutableCopy");
  if (!v3) {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v4 = v3;
  objc_msgSend(v3, "setObject:forKey:", -[MPTransition presetID](self, "presetID"), @"PresetID");
  if ((self->_randomSeed & 0x8000000000000000) == 0) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"), @"RandomSeed");
  }
  if (self->_isRandom) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"isRandom");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [self->_parent plug])
  {
    objc_msgSend(objc_msgSend(self->_parent, "plug"), "setTransitionAttributes:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [self->_parent container]) {
      objc_msgSend(objc_msgSend(self->_parent, "container"), "setInitialTransitionAttributes:", v4);
    }
  }
}

- (id)_transitionAttributes
{
  return self->_attributes;
}

@end