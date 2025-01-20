@interface SBHighlightSwitcherModifierEvent
- (BOOL)isHoverEvent;
- (BOOL)isPencilHoverEvent;
- (SBAppLayout)appLayout;
- (SBHighlightSwitcherModifierEvent)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 phase:(unint64_t)a5 hover:(BOOL)a6 pencilHover:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)layoutRole;
- (int64_t)type;
- (unint64_t)phase;
@end

@implementation SBHighlightSwitcherModifierEvent

- (SBHighlightSwitcherModifierEvent)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 phase:(unint64_t)a5 hover:(BOOL)a6 pencilHover:(BOOL)a7
{
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBHighlightSwitcherModifierEvent;
  v14 = [(SBHighlightSwitcherModifierEvent *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_layoutRole = a3;
    objc_storeStrong((id *)&v14->_appLayout, a4);
    v15->_phase = a5;
    v15->_hoverEvent = a6;
    v15->_pencilHoverEvent = a7;
  }

  return v15;
}

- (int64_t)type
{
  return 11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHighlightSwitcherModifierEvent;
  v4 = [(SBChainableModifierEvent *)&v8 copyWithZone:a3];
  v4[4] = self->_layoutRole;
  uint64_t v5 = [(SBAppLayout *)self->_appLayout copy];
  v6 = (void *)v4[5];
  v4[5] = v5;

  v4[6] = self->_phase;
  *((unsigned char *)v4 + 24) = self->_hoverEvent;
  *((unsigned char *)v4 + 25) = self->_pencilHoverEvent;
  return v4;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (BOOL)isHoverEvent
{
  return self->_hoverEvent;
}

- (BOOL)isPencilHoverEvent
{
  return self->_pencilHoverEvent;
}

- (void).cxx_destruct
{
}

@end