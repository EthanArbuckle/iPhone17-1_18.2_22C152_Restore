@interface CHDAutomaticObject
+ (id)automaticEffects;
+ (id)automaticFill;
+ (id)automaticStroke;
- (CHDAutomaticObject)initWithName:(id)a3;
- (id)description;
@end

@implementation CHDAutomaticObject

+ (id)automaticEffects
{
  if (+[CHDAutomaticObject automaticEffects]::once != -1) {
    dispatch_once(&+[CHDAutomaticObject automaticEffects]::once, &__block_literal_global_8_3);
  }
  v2 = (void *)+[CHDAutomaticObject automaticEffects]::automaticEffects;
  return v2;
}

- (CHDAutomaticObject)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHDAutomaticObject;
  v6 = [(CHDAutomaticObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mName, a3);
  }

  return v7;
}

+ (id)automaticStroke
{
  if (+[CHDAutomaticObject automaticStroke]::once != -1) {
    dispatch_once(&+[CHDAutomaticObject automaticStroke]::once, &__block_literal_global_3_0);
  }
  v2 = (void *)+[CHDAutomaticObject automaticStroke]::automaticStroke;
  return v2;
}

+ (id)automaticFill
{
  if (+[CHDAutomaticObject automaticFill]::once != -1) {
    dispatch_once(&+[CHDAutomaticObject automaticFill]::once, &__block_literal_global_69);
  }
  v2 = (void *)+[CHDAutomaticObject automaticFill]::automaticFill;
  return v2;
}

void __35__CHDAutomaticObject_automaticFill__block_invoke()
{
  v0 = [[CHDAutomaticObject alloc] initWithName:@"autoFill"];
  v1 = (void *)+[CHDAutomaticObject automaticFill]::automaticFill;
  +[CHDAutomaticObject automaticFill]::automaticFill = (uint64_t)v0;
}

void __37__CHDAutomaticObject_automaticStroke__block_invoke()
{
  v0 = [[CHDAutomaticObject alloc] initWithName:@"autoStroke"];
  v1 = (void *)+[CHDAutomaticObject automaticStroke]::automaticStroke;
  +[CHDAutomaticObject automaticStroke]::automaticStroke = (uint64_t)v0;
}

void __38__CHDAutomaticObject_automaticEffects__block_invoke()
{
  v0 = [[CHDAutomaticObject alloc] initWithName:@"autoEffects"];
  v1 = (void *)+[CHDAutomaticObject automaticEffects]::automaticEffects;
  +[CHDAutomaticObject automaticEffects]::automaticEffects = (uint64_t)v0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDAutomaticObject;
  v2 = [(CHDAutomaticObject *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end