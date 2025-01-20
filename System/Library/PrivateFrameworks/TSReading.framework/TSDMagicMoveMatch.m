@interface TSDMagicMoveMatch
+ (id)matchWithOutgoingObject:(id)a3 incomingObject:(id)a4 matchType:(int64_t)a5 attributeMatchPercent:(double)a6 textureDescription:(id)a7;
- (BOOL)conflictsWithMatch:(id)a3;
- (BOOL)isShapeMatchOnlyWithoutText;
- (BOOL)isTextMatch;
- (NSString)name;
- (TSDMagicMoveMatchObject)incomingObject;
- (TSDMagicMoveMatchObject)outgoingObject;
- (TSDTextureDescription)textureDescription;
- (double)attributeMatchPercent;
- (double)distance;
- (double)zOrderDistance;
- (id)description;
- (int64_t)matchCost;
- (int64_t)matchType;
- (void)dealloc;
- (void)p_updateMagicMoveCost;
- (void)setAttributeMatchPercent:(double)a3;
- (void)setDistance:(double)a3;
- (void)setIsShapeMatchOnlyWithoutText:(BOOL)a3;
- (void)setMatchType:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setTextureDescription:(id)a3;
- (void)setZOrderDistance:(double)a3;
@end

@implementation TSDMagicMoveMatch

- (void)setMatchType:(int64_t)a3
{
  self->_matchType = a3;
  [(TSDMagicMoveMatch *)self p_updateMagicMoveCost];
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
  [(TSDMagicMoveMatch *)self p_updateMagicMoveCost];
}

- (void)setZOrderDistance:(double)a3
{
  self->_zOrderDistance = a3;
  [(TSDMagicMoveMatch *)self p_updateMagicMoveCost];
}

- (void)setAttributeMatchPercent:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMagicMoveMatch setAttributeMatchPercent:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 773, @"attributes match percent must be between 0 and 1!");
  }
  TSUClamp();
  self->_attributeMatchPercent = v7;

  [(TSDMagicMoveMatch *)self p_updateMagicMoveCost];
}

- (BOOL)isTextMatch
{
  if ([(TSDMagicMoveMatch *)self outgoingObject])
  {
    if ([(TSDMagicMoveMatch *)self incomingObject])
    {
      BOOL v3 = [(TSDMagicMoveMatchObject *)[(TSDMagicMoveMatch *)self outgoingObject] stringValue] != 0;
      if (((v3 ^ ([(TSDMagicMoveMatchObject *)[(TSDMagicMoveMatch *)self incomingObject] stringValue] == 0)) & 1) == 0)
      {
        v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSDMagicMoveMatch isTextMatch]"];
        [v4 handleFailureInFunction:v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 781, @"One of these objects is text, and the other is not!" file lineNumber description];
      }
    }
  }
  return [(TSDMagicMoveMatchObject *)[(TSDMagicMoveMatch *)self outgoingObject] stringValue]|| [(TSDMagicMoveMatchObject *)[(TSDMagicMoveMatch *)self incomingObject] stringValue] != 0;
}

+ (id)matchWithOutgoingObject:(id)a3 incomingObject:(id)a4 matchType:(int64_t)a5 attributeMatchPercent:(double)a6 textureDescription:(id)a7
{
  v12 = objc_alloc_init(TSDMagicMoveMatch);
  v12->_outgoingObject = (TSDMagicMoveMatchObject *)a3;
  v12->_incomingObject = (TSDMagicMoveMatchObject *)a4;
  [(TSDMagicMoveMatch *)v12 setMatchType:a5];
  [(TSDMagicMoveMatch *)v12 setAttributeMatchPercent:a6];
  [(TSDMagicMoveMatch *)v12 setTextureDescription:a7];
  [a3 position];
  [a4 position];
  TSUDistance();
  -[TSDMagicMoveMatch setDistance:](v12, "setDistance:");
  -[TSDMagicMoveMatch setZOrderDistance:](v12, "setZOrderDistance:", vabdd_f64((double)[a3 zOrder], (double)objc_msgSend(a4, "zOrder")));
  if ([(TSDMagicMoveMatch *)v12 matchType] == 1)
  {
    v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"+[TSDMagicMoveMatch matchWithOutgoingObject:incomingObject:matchType:attributeMatchPercent:textureDescription:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 808, @"Why are you creating a magic move match that can't exist? Get it together.");
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveMatch;
  [(TSDMagicMoveMatch *)&v3 dealloc];
}

- (void)p_updateMagicMoveCost
{
  double v3 = 0.0;
  switch([(TSDMagicMoveMatch *)self matchType])
  {
    case 0:
      v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSDMagicMoveMatch p_updateMagicMoveCost]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 851, @"matchType is undefined!");
      break;
    case 1:
      double v3 = 600000.0;
      break;
    case 2:
      double v3 = 500000.0;
      break;
    case 3:
      double v3 = 400000.0;
      break;
    case 4:
      double v3 = 300000.0;
      break;
    case 5:
      double v3 = 200000.0;
      break;
    case 10:
      double v3 = 100000.0;
      break;
    default:
      break;
  }
  [(TSDMagicMoveMatch *)self attributeMatchPercent];
  double v7 = v3 + (2.0 - v6) * 10000.0;
  [(TSDMagicMoveMatch *)self distance];
  double v9 = v8 + v7;
  [(TSDMagicMoveMatch *)self zOrderDistance];
  self->_matchCost = (uint64_t)(v10 + v9);
}

- (id)description
{
  if ([(TSDMagicMoveMatch *)self name])
  {
    double v3 = [(TSDMagicMoveMatch *)self name];
  }
  else
  {
    v4 = 0;
    switch([(TSDMagicMoveMatch *)self matchType])
    {
      case 0:
        uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMagicMoveMatch description]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 896, @"matchType is undefined!");
        v4 = @"undefined!";
        break;
      case 1:
        v4 = @"none";
        break;
      case 2:
        v4 = @"minimum";
        break;
      case 3:
        v4 = @"partial";
        break;
      case 4:
        v4 = @"complete";
        break;
      case 5:
        v4 = @"exact";
        break;
      case 10:
        v4 = @"user-defined";
        break;
      default:
        break;
    }
    double v3 = (NSString *)[NSString stringWithFormat:@"{matchType:%@, cost:%ld,\noutgoing:%@,\nincoming:%@}", v4, -[TSDMagicMoveMatch matchCost](self, "matchCost"), -[TSDMagicMoveMatch outgoingObject](self, "outgoingObject"), -[TSDMagicMoveMatch incomingObject](self, "incomingObject")];
  }
  v8.receiver = self;
  v8.super_class = (Class)TSDMagicMoveMatch;
  return (id)[NSString stringWithFormat:@"%@: %@", -[TSDMagicMoveMatch description](&v8, sel_description), v3];
}

- (BOOL)conflictsWithMatch:(id)a3
{
  if (-[TSDMagicMoveMatchObject conflictsWithMatchObject:](-[TSDMagicMoveMatch outgoingObject](self, "outgoingObject"), "conflictsWithMatchObject:", [a3 outgoingObject]))
  {
    return 1;
  }
  uint64_t v6 = [(TSDMagicMoveMatch *)self incomingObject];
  uint64_t v7 = [a3 incomingObject];

  return [(TSDMagicMoveMatchObject *)v6 conflictsWithMatchObject:v7];
}

- (TSDMagicMoveMatchObject)outgoingObject
{
  return self->_outgoingObject;
}

- (TSDMagicMoveMatchObject)incomingObject
{
  return self->_incomingObject;
}

- (int64_t)matchType
{
  return self->_matchType;
}

- (double)distance
{
  return self->_distance;
}

- (double)zOrderDistance
{
  return self->_zOrderDistance;
}

- (double)attributeMatchPercent
{
  return self->_attributeMatchPercent;
}

- (TSDTextureDescription)textureDescription
{
  return self->_textureDescription;
}

- (void)setTextureDescription:(id)a3
{
}

- (int64_t)matchCost
{
  return self->_matchCost;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isShapeMatchOnlyWithoutText
{
  return self->_isShapeMatchOnlyWithoutText;
}

- (void)setIsShapeMatchOnlyWithoutText:(BOOL)a3
{
  self->_isShapeMatchOnlyWithoutText = a3;
}

@end