@interface UIAttachmentBehavior
+ (BOOL)_isPrimitiveBehavior;
+ (UIAttachmentBehavior)fixedAttachmentWithItem:(id)item1 attachedToItem:(id)item2 attachmentAnchor:(CGPoint)point;
+ (UIAttachmentBehavior)limitAttachmentWithItem:(id)item1 offsetFromCenter:(UIOffset)offset1 attachedToItem:(id)item2 offsetFromCenter:(UIOffset)offset2;
+ (UIAttachmentBehavior)pinAttachmentWithItem:(id)item1 attachedToItem:(id)item2 attachmentAnchor:(CGPoint)point;
+ (UIAttachmentBehavior)slidingAttachmentWithItem:(id)item attachmentAnchor:(CGPoint)point axisOfTranslation:(CGVector)axis;
+ (UIAttachmentBehavior)slidingAttachmentWithItem:(id)item1 attachedToItem:(id)item2 attachmentAnchor:(CGPoint)point axisOfTranslation:(CGVector)axis;
- (CGFloat)damping;
- (CGFloat)frequency;
- (CGFloat)frictionTorque;
- (CGFloat)length;
- (CGPoint)anchorPoint;
- (NSArray)items;
- (UIAttachmentBehavior)init;
- (UIAttachmentBehavior)initWithItem:(id)item attachedToAnchor:(CGPoint)point;
- (UIAttachmentBehavior)initWithItem:(id)item offsetFromCenter:(UIOffset)offset attachedToAnchor:(CGPoint)point;
- (UIAttachmentBehavior)initWithItem:(id)item1 attachedToItem:(id)item2;
- (UIAttachmentBehavior)initWithItem:(id)item1 offsetFromCenter:(UIOffset)offset1 attachedToItem:(id)item2 offsetFromCenter:(UIOffset)offset2;
- (UIAttachmentBehaviorType)attachedBehaviorType;
- (UIFloatRange)attachmentRange;
- (id)description;
- (int64_t)type;
- (void)_associate;
- (void)_changedParameter;
- (void)_dissociate;
- (void)_reevaluateJoint;
- (void)_updateJointWithRange:(id)a3;
- (void)setAnchorPoint:(CGPoint)anchorPoint;
- (void)setAttachmentRange:(UIFloatRange)attachmentRange;
- (void)setDamping:(CGFloat)damping;
- (void)setFrequency:(CGFloat)frequency;
- (void)setFrictionTorque:(CGFloat)frictionTorque;
- (void)setLength:(CGFloat)length;
@end

@implementation UIAttachmentBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

+ (UIAttachmentBehavior)slidingAttachmentWithItem:(id)item1 attachedToItem:(id)item2 attachmentAnchor:(CGPoint)point axisOfTranslation:(CGVector)axis
{
  CGFloat dy = axis.dy;
  CGFloat dx = axis.dx;
  CGFloat y = point.y;
  CGFloat x = point.x;
  id v12 = item2;
  id v13 = item1;
  uint64_t v14 = [objc_alloc((Class)a1) initWithItem:v13 attachedToItem:v12];

  *(CGFloat *)(v14 + 48) = x;
  *(CGFloat *)(v14 + 56) = y;
  *(CGFloat *)(v14 + 136) = dx;
  *(CGFloat *)(v14 + 144) = dy;
  *(void *)(v14 + 152) = 2;
  *(UIFloatRange *)(v14 + 192) = UIFloatRangeInfinite;
  return (UIAttachmentBehavior *)(id)v14;
}

+ (UIAttachmentBehavior)slidingAttachmentWithItem:(id)item attachmentAnchor:(CGPoint)point axisOfTranslation:(CGVector)axis
{
  CGFloat dy = axis.dy;
  CGFloat dx = axis.dx;
  double y = point.y;
  double x = point.x;
  id v10 = item;
  uint64_t v11 = objc_msgSend(objc_alloc((Class)a1), "initWithItem:attachedToAnchor:", v10, x, y);

  *(double *)(v11 + 48) = x;
  *(double *)(v11 + 56) = y;
  *(CGFloat *)(v11 + 136) = dx;
  *(CGFloat *)(v11 + 144) = dy;
  *(void *)(v11 + 152) = 2;
  *(UIFloatRange *)(v11 + 192) = UIFloatRangeInfinite;
  return (UIAttachmentBehavior *)(id)v11;
}

- (void)setAttachmentRange:(UIFloatRange)attachmentRange
{
  if (self->_attachmentType - 1 <= 1)
  {
    p_attachmentRange = &self->_attachmentRange;
    if (self->_attachmentRange.minimum != attachmentRange.minimum
      || self->_attachmentRange.maximum != attachmentRange.maximum)
    {
      p_attachmentRange->minimum = attachmentRange.minimum;
      self->_attachmentRange.maximum = attachmentRange.maximum;
      *(unsigned char *)&self->_stateFlags |= 8u;
      -[UIAttachmentBehavior _updateJointWithRange:](self, "_updateJointWithRange:", p_attachmentRange->minimum, self->_attachmentRange.maximum);
      [(UIAttachmentBehavior *)self _changedParameter];
    }
  }
}

- (void)_updateJointWithRange:(id)a3
{
  if (self->_joint && self->_attachmentType - 1 <= 1)
  {
    double var1 = a3.var1;
    double var0 = a3.var0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = self->_joint;
      v7 = v6;
      if (var0 > -3.40282347e38 || var1 < 3.40282347e38)
      {
        double v8 = 0.0;
        if (fabs(var0) > 2.22044605e-16) {
          double v9 = var0;
        }
        else {
          double v9 = 0.0;
        }
        if (fabs(var1) > 2.22044605e-16) {
          double v8 = var1;
        }
        if (v9 <= 0.0 && v8 >= 0.0)
        {
          [(PKPhysicsJoint *)v6 setShouldEnableLimits:1];
          [(PKPhysicsJoint *)v7 setLowerDistanceLimit:var0];
          [(PKPhysicsJoint *)v7 setUpperDistanceLimit:var1];
LABEL_20:

          goto LABEL_21;
        }
        NSLog(&cfstr_AttachmentRang.isa, v8, *(void *)&var0, *(void *)&var1, self);
        self->_attachmentRange = ($888842945EE2C7AB0ACD33E179C69952)UIFloatRangeInfinite;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:
        *(unsigned char *)&self->_stateFlags &= ~8u;
        return;
      }
      id v10 = self->_joint;
      v7 = v10;
      if (var0 > -3.40282347e38 || var1 < 3.40282347e38)
      {
        [(PKPhysicsJoint *)v10 setShouldEnableLimits:1];
        [(PKPhysicsJoint *)v7 setLowerAngleLimit:var0];
        [(PKPhysicsJoint *)v7 setUpperAngleLimit:var1];
        goto LABEL_20;
      }
    }
    [(PKPhysicsJoint *)v7 setShouldEnableLimits:0];
    goto LABEL_20;
  }
}

+ (UIAttachmentBehavior)limitAttachmentWithItem:(id)item1 offsetFromCenter:(UIOffset)offset1 attachedToItem:(id)item2 offsetFromCenter:(UIOffset)offset2
{
  double vertical = offset2.vertical;
  double horizontal = offset2.horizontal;
  double v8 = offset1.vertical;
  double v9 = offset1.horizontal;
  id v12 = item2;
  id v13 = item1;
  uint64_t v14 = objc_msgSend(objc_alloc((Class)a1), "initWithItem:offsetFromCenter:attachedToItem:offsetFromCenter:", v13, v12, v9, v8, horizontal, vertical);
  [v13 center];
  double v16 = v15;
  double v18 = v17;

  [v12 center];
  double v20 = v19;
  double v22 = v21;

  *(double *)(v14 + 128) = sqrt((v20 - v16) * (v20 - v16) + (v22 - v18) * (v22 - v18));
  *(void *)(v14 + 152) = 4;
  return (UIAttachmentBehavior *)(id)v14;
}

+ (UIAttachmentBehavior)fixedAttachmentWithItem:(id)item1 attachedToItem:(id)item2 attachmentAnchor:(CGPoint)point
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  id v9 = item2;
  id v10 = item1;
  uint64_t v11 = (CGFloat *)[objc_alloc((Class)a1) initWithItem:v10 attachedToItem:v9];

  v11[6] = x;
  v11[7] = y;
  *((void *)v11 + 19) = 3;
  return (UIAttachmentBehavior *)v11;
}

+ (UIAttachmentBehavior)pinAttachmentWithItem:(id)item1 attachedToItem:(id)item2 attachmentAnchor:(CGPoint)point
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  id v9 = item2;
  id v10 = item1;
  uint64_t v11 = [objc_alloc((Class)a1) initWithItem:v10 attachedToItem:v9];

  *(CGFloat *)(v11 + 48) = x;
  *(CGFloat *)(v11 + 56) = y;
  *(void *)(v11 + 152) = 1;
  *(UIFloatRange *)(v11 + 192) = UIFloatRangeInfinite;
  return (UIAttachmentBehavior *)(id)v11;
}

- (void)setFrictionTorque:(CGFloat)frictionTorque
{
  if (self->_attachmentType == 1 && self->_frictionTorque != frictionTorque)
  {
    self->_frictionTorque = frictionTorque;
    joint = self->_joint;
    if (joint) {
      -[PKPhysicsJoint setFrictionTorque:](joint, "setFrictionTorque:");
    }
    else {
      *(unsigned char *)&self->_stateFlags |= 0x10u;
    }
    [(UIAttachmentBehavior *)self _changedParameter];
  }
}

- (UIAttachmentBehavior)init
{
  return 0;
}

- (UIAttachmentBehavior)initWithItem:(id)item attachedToAnchor:(CGPoint)point
{
  return -[UIAttachmentBehavior initWithItem:point:attachedToAnchor:](self, "initWithItem:point:attachedToAnchor:", item, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), point.x, point.y);
}

- (UIAttachmentBehavior)initWithItem:(id)item1 attachedToItem:(id)item2
{
  return -[UIAttachmentBehavior initWithItem:point:attachedToItem:point:](self, "initWithItem:point:attachedToItem:point:", item1, item2, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (UIAttachmentBehavior)initWithItem:(id)item offsetFromCenter:(UIOffset)offset attachedToAnchor:(CGPoint)point
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  CGFloat vertical = offset.vertical;
  CGFloat horizontal = offset.horizontal;
  id v10 = item;
  v14.receiver = self;
  v14.super_class = (Class)UIAttachmentBehavior;
  uint64_t v11 = [(UIDynamicBehavior *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    [(UIDynamicBehavior *)v11 _addItem:v10];
    v12->_anchorPoint.CGFloat x = x;
    v12->_anchorPoint.CGFloat y = y;
    v12->_anchorPointA.CGFloat x = horizontal;
    v12->_anchorPointA.CGFloat y = vertical;
    v12->_type = 1;
  }

  return v12;
}

- (UIAttachmentBehavior)initWithItem:(id)item1 offsetFromCenter:(UIOffset)offset1 attachedToItem:(id)item2 offsetFromCenter:(UIOffset)offset2
{
  CGFloat vertical = offset2.vertical;
  CGFloat horizontal = offset2.horizontal;
  CGFloat v9 = offset1.vertical;
  CGFloat v10 = offset1.horizontal;
  id v12 = item1;
  id v13 = item2;
  v17.receiver = self;
  v17.super_class = (Class)UIAttachmentBehavior;
  objc_super v14 = [(UIDynamicBehavior *)&v17 init];
  double v15 = v14;
  if (v14)
  {
    [(UIDynamicBehavior *)v14 _addItem:v12];
    [(UIDynamicBehavior *)v15 _addItem:v13];
    v15->_anchorPointA.CGFloat x = v10;
    v15->_anchorPointA.CGFloat y = v9;
    v15->_anchorPointB.CGFloat x = horizontal;
    v15->_anchorPointB.CGFloat y = vertical;
    v15->_type = 0;
  }

  return v15;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)items
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(UIDynamicBehavior *)self _items];
  v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

- (CGFloat)length
{
  joint = self->_joint;
  if (!joint) {
    return self->_length;
  }
  CGFloat result = 0.0;
  if ((*(unsigned char *)&self->_stateFlags & 0x20) == 0)
  {
    if (self->_attachmentType == 4) {
      [(PKPhysicsJoint *)joint maxLength];
    }
    else {
      [(PKPhysicsJoint *)joint length];
    }
  }
  return result;
}

- (void)setLength:(CGFloat)length
{
  [(UIAttachmentBehavior *)self length];
  if (v5 == length)
  {
    if (!self->_joint) {
      *(unsigned char *)&self->_stateFlags |= 4u;
    }
  }
  else
  {
    if (length == 0.0 || ([(UIAttachmentBehavior *)self length], v6 == 0.0))
    {
      self->_length = length;
      *(unsigned char *)&self->_stateFlags |= 4u;
      [(UIAttachmentBehavior *)self _reevaluateJoint];
    }
    else
    {
      self->_length = length;
      *(unsigned char *)&self->_stateFlags |= 4u;
      joint = self->_joint;
      double v8 = self->_length;
      if (self->_attachmentType == 4) {
        [(PKPhysicsJoint *)joint setMaxLength:v8];
      }
      else {
        [(PKPhysicsJoint *)joint setLength:v8];
      }
    }
    [(UIAttachmentBehavior *)self _changedParameter];
  }
}

- (CGFloat)damping
{
  if (!self->_joint || (*(unsigned char *)&self->_stateFlags & 0x20) != 0) {
    return self->_damping;
  }
  [(PKPhysicsJoint *)self->_joint damping];
  return result;
}

- (void)setDamping:(CGFloat)damping
{
  [(UIAttachmentBehavior *)self damping];
  if (v5 != damping)
  {
    self->_damping = damping;
    char stateFlags = (char)self->_stateFlags;
    *(unsigned char *)&self->_char stateFlags = stateFlags | 1;
    if ((stateFlags & 0x20) == 0)
    {
      [(PKPhysicsJoint *)self->_joint setDamping:self->_damping];
      [(UIAttachmentBehavior *)self _changedParameter];
    }
  }
}

- (CGFloat)frequency
{
  joint = self->_joint;
  if (!joint) {
    return self->_frequency;
  }
  CGFloat result = 0.0;
  if ((*(unsigned char *)&self->_stateFlags & 0x20) == 0) {
    [(PKPhysicsJoint *)joint frequency];
  }
  return result;
}

- (void)setFrequency:(CGFloat)frequency
{
  double v3 = self->_frequency;
  if (v3 != frequency)
  {
    self->_frequencCGFloat y = frequency;
    *(unsigned char *)&self->_stateFlags |= 2u;
    if (frequency == 0.0 || v3 == 0.0) {
      [(UIAttachmentBehavior *)self _reevaluateJoint];
    }
    else {
      [(PKPhysicsJoint *)self->_joint setFrequency:self->_frequency];
    }
    [(UIAttachmentBehavior *)self _changedParameter];
  }
}

- (CGPoint)anchorPoint
{
  if (self->_anchorBody)
  {
    [(PKExtendedPhysicsBody *)self->_anchorBody position];
  }
  else
  {
    double x = self->_anchorPoint.x;
    double y = self->_anchorPoint.y;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  if (anchorPoint.x != self->_anchorPoint.x || anchorPoint.y != self->_anchorPoint.y)
  {
    self->_anchorPoint = anchorPoint;
    -[PKExtendedPhysicsBody setPosition:](self->_anchorBody, "setPosition:");
    [(UIAttachmentBehavior *)self _changedParameter];
  }
}

- (void)_changedParameter
{
  int64_t type = self->_type;
  v4 = [(UIDynamicBehavior *)self _context];
  double v5 = [(UIDynamicBehavior *)self _items];
  double v6 = [v5 objectAtIndex:0];
  v7 = [v4 _bodyForItem:v6];

  if (type)
  {
    [v7 setResting:0];
    [(PKExtendedPhysicsBody *)self->_anchorBody setResting:0];
  }
  else
  {
    double v8 = [(UIDynamicBehavior *)self _context];
    CGFloat v9 = [(UIDynamicBehavior *)self _items];
    CGFloat v10 = [v9 objectAtIndex:1];
    uint64_t v11 = [v8 _bodyForItem:v10];

    [v7 setResting:0];
    [v11 setResting:0];
  }
  id v12 = [(UIDynamicBehavior *)self _context];
  [v12 _tickle];
}

- (void)_reevaluateJoint
{
  double v3 = [(UIDynamicBehavior *)self _context];
  v4 = [v3 _world];

  if (v4)
  {
    int64_t type = self->_type;
    double v6 = [(UIDynamicBehavior *)self _items];
    v7 = [v6 objectAtIndex:0];

    if (type)
    {
      double v8 = [(UIDynamicBehavior *)self _context];
      id v48 = [v8 _bodyForItem:v7];

      CGFloat v9 = self->_anchorBody;
    }
    else
    {
      CGFloat v10 = [(UIDynamicBehavior *)self _items];
      uint64_t v11 = [v10 objectAtIndex:1];

      id v12 = [(UIDynamicBehavior *)self _context];
      id v48 = [v12 _bodyForItem:v7];

      id v13 = [(UIDynamicBehavior *)self _context];
      CGFloat v9 = [v13 _bodyForItem:v11];
    }
    p_joint = &self->_joint;
    if (self->_joint)
    {
      double v15 = [(UIDynamicBehavior *)self _context];
      double v16 = [v15 _world];
      [v16 removeJoint:*p_joint];

      objc_super v17 = *p_joint;
      *p_joint = 0;
    }
    switch(self->_attachmentType)
    {
      case 0uLL:
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F913E0], "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", v48, v9, self->_anchorPointA.x, self->_anchorPointA.y, self->_anchorPointB.x, self->_anchorPointB.y);
        double v19 = *p_joint;
        *p_joint = (PKPhysicsJoint *)v18;

        char stateFlags = (char)self->_stateFlags;
        char v21 = stateFlags & 0xDF;
        *(unsigned char *)&self->_char stateFlags = stateFlags & 0xDF;
        if (stateFlags)
        {
          [(PKPhysicsJoint *)*p_joint setDamping:self->_damping];
          char v21 = (char)self->_stateFlags;
        }
        if ((v21 & 2) != 0)
        {
          [(PKPhysicsJoint *)*p_joint setFrequency:self->_frequency];
          char v21 = (char)self->_stateFlags;
        }
        if ((v21 & 4) != 0) {
          [(PKPhysicsJoint *)*p_joint setLength:self->_length];
        }
        if (!self->_type) {
          [(PKPhysicsJoint *)*p_joint setCollideConnected:1];
        }
        double v22 = [(UIDynamicBehavior *)self _context];
        v23 = [v22 _world];
        [v23 addJoint:*p_joint];

        if ((*(unsigned char *)&self->_stateFlags & 4) != 0) {
          [(PKPhysicsJoint *)*p_joint setLength:self->_length];
        }
        [(PKPhysicsJoint *)*p_joint length];
        if (v24 < 1.0 && self->_frequency == 0.0 && self->_type == 1 && (*(unsigned char *)&self->_stateFlags & 4) == 0)
        {
          v25 = [(UIDynamicBehavior *)self _context];
          v26 = [v25 _world];
          [v26 removeJoint:*p_joint];

          v27 = *p_joint;
          *p_joint = 0;

          [(PKExtendedPhysicsBody *)v9 position];
          uint64_t v28 = objc_msgSend(MEMORY[0x1E4F913F0], "jointWithBodyA:bodyB:anchor:", v48, v9);
          v29 = *p_joint;
          *p_joint = (PKPhysicsJoint *)v28;

          *(unsigned char *)&self->_stateFlags |= 0x20u;
          goto LABEL_34;
        }
        break;
      case 1uLL:
        v30 = objc_msgSend(MEMORY[0x1E4F913F0], "jointWithBodyA:bodyB:anchor:", v48, v9, self->_anchorPoint.x, self->_anchorPoint.y);
        *(unsigned char *)&self->_stateFlags |= 0x20u;
        objc_storeStrong((id *)&self->_joint, v30);
        char v31 = (char)self->_stateFlags;
        if ((v31 & 0x10) != 0)
        {
          [v30 setFrictionTorque:self->_frictionTorque];
          char v31 = (char)self->_stateFlags;
        }
        if ((v31 & 8) != 0) {
          -[UIAttachmentBehavior _updateJointWithRange:](self, "_updateJointWithRange:", self->_attachmentRange.minimum, self->_attachmentRange.maximum);
        }
        v32 = [(UIDynamicBehavior *)self _context];
        v33 = [v32 _world];
        [v33 addJoint:*p_joint];

        goto LABEL_35;
      case 2uLL:
        uint64_t v34 = objc_msgSend(MEMORY[0x1E4F913E8], "jointWithBodyA:bodyB:anchor:axis:", v48, v9, self->_anchorPoint.x, self->_anchorPoint.y, self->_axis.dx, self->_axis.dy);
        v35 = *p_joint;
        *p_joint = (PKPhysicsJoint *)v34;

        char v36 = (char)self->_stateFlags;
        *(unsigned char *)&self->_char stateFlags = v36 & 0xDF;
        if ((v36 & 8) != 0) {
          -[UIAttachmentBehavior _updateJointWithRange:](self, "_updateJointWithRange:", self->_attachmentRange.minimum, self->_attachmentRange.maximum);
        }
        goto LABEL_34;
      case 3uLL:
        uint64_t v37 = objc_msgSend(MEMORY[0x1E4F91400], "jointWithBodyA:bodyB:anchor:", v48, v9, self->_anchorPoint.x, self->_anchorPoint.y);
        v38 = *p_joint;
        *p_joint = (PKPhysicsJoint *)v37;

        *(unsigned char *)&self->_stateFlags &= ~0x20u;
        goto LABEL_34;
      case 4uLL:
        [v48 position];
        double v40 = v39 - self->_anchorPointA.x;
        double v42 = v41 - self->_anchorPointA.y;
        [(PKExtendedPhysicsBody *)v9 position];
        uint64_t v45 = objc_msgSend(MEMORY[0x1E4F913F8], "jointWithBodyA:bodyB:anchorA:anchorB:", v48, v9, v40, v42, v43 - self->_anchorPointB.x, v44 - self->_anchorPointB.y);
        v46 = *p_joint;
        *p_joint = (PKPhysicsJoint *)v45;

        char v47 = (char)self->_stateFlags;
        *(unsigned char *)&self->_char stateFlags = v47 & 0xDF;
        if ((v47 & 4) != 0) {
          [(PKPhysicsJoint *)*p_joint setMaxLength:self->_length];
        }
LABEL_34:
        v30 = [(UIDynamicBehavior *)self _context];
        v32 = [v30 _world];
        [v32 addJoint:*p_joint];
LABEL_35:

        break;
      default:
        break;
    }
  }
}

- (void)_associate
{
  int64_t type = self->_type;
  v4 = [(UIDynamicBehavior *)self _items];
  double v5 = [v4 objectAtIndex:0];

  if (type)
  {
    double v6 = [(UIDynamicBehavior *)self _context];
    id v7 = (id)[v6 _registerBodyForItem:v5];

    +[PKExtendedPhysicsBody bodyWithRectangleOfSize:](PKExtendedPhysicsBody, "bodyWithRectangleOfSize:", 1.0, 1.0);
    double v8 = (PKExtendedPhysicsBody *)objc_claimAutoreleasedReturnValue();
    -[PKExtendedPhysicsBody setPosition:](v8, "setPosition:", self->_anchorPoint.x, self->_anchorPoint.y);
    [(PKExtendedPhysicsBody *)v8 setDynamic:0];
    anchorBoCGFloat dy = self->_anchorBody;
    self->_anchorBoCGFloat dy = v8;
    CGFloat v10 = v8;

    uint64_t v11 = [(UIDynamicBehavior *)self _context];
    id v12 = [v11 _world];
    [v12 addBody:v10];
  }
  else
  {
    id v13 = [(UIDynamicBehavior *)self _items];
    uint64_t v11 = [v13 objectAtIndex:1];

    objc_super v14 = [(UIDynamicBehavior *)self _context];
    id v15 = (id)[v14 _registerBodyForItem:v5];

    id v12 = [(UIDynamicBehavior *)self _context];
    id v16 = (id)[v12 _registerBodyForItem:v11];
  }

  [(UIAttachmentBehavior *)self _reevaluateJoint];
}

- (void)_dissociate
{
  double v3 = [(UIDynamicBehavior *)self _context];
  v4 = [v3 _world];
  [v4 removeJoint:self->_joint];

  if (self->_type == 1)
  {
    double v5 = [(UIDynamicBehavior *)self _context];
    double v6 = [v5 _world];
    [v6 removeBody:self->_anchorBody];

    anchorBoCGFloat dy = self->_anchorBody;
    self->_anchorBoCGFloat dy = 0;
  }
  joint = self->_joint;
  self->_joint = 0;

  int64_t type = self->_type;
  CGFloat v10 = [(UIDynamicBehavior *)self _items];
  id v15 = [v10 objectAtIndex:0];

  if (type)
  {
    uint64_t v11 = [(UIDynamicBehavior *)self _context];
    [v11 _unregisterBodyForItem:v15 action:0];
  }
  else
  {
    id v12 = [(UIDynamicBehavior *)self _items];
    uint64_t v11 = [v12 objectAtIndex:1];

    id v13 = [(UIDynamicBehavior *)self _context];
    [v13 _unregisterBodyForItem:v15 action:0];

    objc_super v14 = [(UIDynamicBehavior *)self _context];
    [v14 _unregisterBodyForItem:v11 action:0];
  }
}

- (id)description
{
  double v3 = (void *)MEMORY[0x1E4F28E78];
  v15.receiver = self;
  v15.super_class = (Class)UIAttachmentBehavior;
  v4 = [(UIDynamicBehavior *)&v15 description];
  double v5 = [v3 stringWithString:v4];

  double v6 = [(UIDynamicBehavior *)self _items];
  id v7 = [v6 objectAtIndex:0];

  [v5 appendFormat:@" %@ <-", v7];
  char stateFlags = (char)self->_stateFlags;
  if ((stateFlags & 1) == 0) {
    goto LABEL_15;
  }
  objc_msgSend(v5, "appendString:", @"(");
  if ((*(unsigned char *)&self->_stateFlags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_stateFlags & 2) == 0)
    {
      if ((*(unsigned char *)&self->_stateFlags & 4) != 0) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  objc_msgSend(v5, "appendFormat:", @"D:%f", *(void *)&self->_damping);
  char v9 = (char)self->_stateFlags;
  if ((v9 & 2) != 0)
  {
    [v5 appendString:@" "];
LABEL_8:
    objc_msgSend(v5, "appendFormat:", @"F:%f", *(void *)&self->_frequency);
    char v9 = (char)self->_stateFlags;
  }
  if ((v9 & 4) != 0)
  {
    [v5 appendString:@" "];
LABEL_13:
    objc_msgSend(v5, "appendFormat:", @"L:%f", *(void *)&self->_length);
    goto LABEL_14;
  }
  [v5 appendString:@" "];
LABEL_11:
  [(UIAttachmentBehavior *)self length];
  objc_msgSend(v5, "appendFormat:", @"l:%f", v10);
LABEL_14:
  [v5 appendString:@""]);
  char stateFlags = (char)self->_stateFlags;
LABEL_15:
  if ((stateFlags & 0x20) != 0) {
    uint64_t v11 = @" R ";
  }
  else {
    uint64_t v11 = @" D ";
  }
  [v5 appendString:v11];
  if (self->_type)
  {
    [(UIAttachmentBehavior *)self anchorPoint];
    id v12 = NSStringFromCGPoint(v17);
  }
  else
  {
    id v13 = [(UIDynamicBehavior *)self _items];
    id v12 = [v13 objectAtIndex:1];
  }
  [v5 appendFormat:@"-> %@", v12];

  return v5;
}

- (UIAttachmentBehaviorType)attachedBehaviorType
{
  return self->_attachedBehaviorType;
}

- (CGFloat)frictionTorque
{
  return self->_frictionTorque;
}

- (UIFloatRange)attachmentRange
{
  double minimum = self->_attachmentRange.minimum;
  double maximum = self->_attachmentRange.maximum;
  result.double maximum = maximum;
  result.double minimum = minimum;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joint, 0);
  objc_storeStrong((id *)&self->_anchorBody, 0);
}

@end