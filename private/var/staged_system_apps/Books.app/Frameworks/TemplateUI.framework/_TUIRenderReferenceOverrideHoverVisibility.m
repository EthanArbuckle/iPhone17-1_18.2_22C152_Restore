@interface _TUIRenderReferenceOverrideHoverVisibility
- (BOOL)forceVisibleOnHover;
- (BOOL)updateLayoutAttributes:(id)a3 forIdentifier:(id)a4;
- (TUIRenderReferenceQuery)query;
- (void)setForceVisibleOnHover:(BOOL)a3;
- (void)setQuery:(id)a3;
@end

@implementation _TUIRenderReferenceOverrideHoverVisibility

- (BOOL)updateLayoutAttributes:(id)a3 forIdentifier:(id)a4
{
  return 1;
}

- (TUIRenderReferenceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (BOOL)forceVisibleOnHover
{
  return self->_forceVisibleOnHover;
}

- (void)setForceVisibleOnHover:(BOOL)a3
{
  self->_forceVisibleOnHover = a3;
}

- (void).cxx_destruct
{
}

@end